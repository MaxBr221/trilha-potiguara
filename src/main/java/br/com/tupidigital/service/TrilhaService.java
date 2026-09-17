package br.com.tupidigital.service;

import br.com.tupidigital.dto.LicaoResponseDTO;
import br.com.tupidigital.dto.ModuloResponseDTO;
import br.com.tupidigital.dto.TrilhaResponseDTO;
import br.com.tupidigital.repository.LicaoRepository;
import br.com.tupidigital.repository.ModuloRepository;
import br.com.tupidigital.repository.TrilhaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;
import br.com.tupidigital.repository.UsuarioRepository;
import br.com.tupidigital.repository.ProgressoUsuarioLicaoRepository;
import br.com.tupidigital.entity.Usuario;
import br.com.tupidigital.entity.Modulo;
import br.com.tupidigital.entity.Licao;
import br.com.tupidigital.entity.ProgressoUsuarioLicao;
import java.util.ArrayList;
import java.time.LocalDate;

@Service
public class TrilhaService {

    @Autowired
    private TrilhaRepository trilhaRepository;

    @Autowired
    private ModuloRepository moduloRepository;

    @Autowired
    private LicaoRepository licaoRepository;

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private ProgressoUsuarioLicaoRepository progressoUsuarioLicaoRepository;

    private Usuario getAuthenticatedUsuario() {
        org.springframework.security.core.Authentication auth = org.springframework.security.core.context.SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated() || auth.getPrincipal().equals("anonymousUser")) {
            return null;
        }
        String email = auth.getName();
        org.springframework.security.core.userdetails.UserDetails userDetails = usuarioRepository.findByEmail(email);
        return (Usuario) userDetails;
    }

    public List<TrilhaResponseDTO> listarTrilhas() {
        Usuario usuario = getAuthenticatedUsuario();
        return trilhaRepository.findAll().stream()
                .map(t -> {
                    int quantidadeModulos = t.getModulos() != null ? t.getModulos().size() : 0;
                    long licoesConcluidas = 0;
                    if (usuario != null) {
                        licoesConcluidas = progressoUsuarioLicaoRepository.countByUsuarioIdAndTrilhaId(usuario.getId(), t.getId());
                    }
                    long totalLicoes = t.getModulos() != null ? t.getModulos().stream()
                            .mapToLong(m -> m.getLicoes() != null ? m.getLicoes().size() : 0).sum() : 0;
                    
                    int progresso = totalLicoes == 0 ? 0 : (int) ((licoesConcluidas * 100) / totalLicoes);
                    
                    return TrilhaResponseDTO.fromEntity(t, quantidadeModulos, progresso);
                })
                .collect(Collectors.toList());
    }

    public List<ModuloResponseDTO> listarModulosPorTrilha(UUID trilhaId) {
        Usuario usuario = getAuthenticatedUsuario();
        List<Modulo> modulos = moduloRepository.findByTrilhaIdOrderByOrdemIndexAsc(trilhaId);
        
        List<ModuloResponseDTO> response = new ArrayList<>();
        boolean previousModuleCompleted = true; // First module is always unlocked
        
        for (Modulo modulo : modulos) {
            boolean isLocked = !previousModuleCompleted;
            
            List<LicaoResponseDTO> licoesDTO = (modulo.getLicoes() != null ? modulo.getLicoes() : new ArrayList<Licao>()).stream()
                    .map(licao -> {
                        boolean estaConcluida = false;
                        if (usuario != null) {
                            estaConcluida = progressoUsuarioLicaoRepository.existsByUsuarioIdAndLicaoId(usuario.getId(), licao.getId());
                        }
                        return LicaoResponseDTO.fromEntity(licao, estaConcluida);
                    }).collect(Collectors.toList());
                    
            response.add(ModuloResponseDTO.fromEntity(modulo, isLocked, licoesDTO));
            
            // Calculate if this module is 100% completed for the NEXT module
            long totalLicoes = modulo.getLicoes() != null ? modulo.getLicoes().size() : 0;
            long concluidas = licoesDTO.stream().filter(LicaoResponseDTO::estaConcluida).count();
            // If user is null, they haven't completed anything, so lock subsequent modules
            previousModuleCompleted = (usuario != null && totalLicoes > 0 && totalLicoes == concluidas);
        }
        
        return response;
    }

    public List<LicaoResponseDTO> listarLicoesPorModulo(UUID moduloId) {
        Usuario usuario = getAuthenticatedUsuario();
        return licaoRepository.findByModuloIdOrderByOrdemIndexAsc(moduloId).stream()
                .map(licao -> {
                    boolean estaConcluida = false;
                    if (usuario != null) {
                        estaConcluida = progressoUsuarioLicaoRepository.existsByUsuarioIdAndLicaoId(usuario.getId(), licao.getId());
                    }
                    return LicaoResponseDTO.fromEntity(licao, estaConcluida);
                })
                .collect(Collectors.toList());
    }

    public LicaoResponseDTO obterLicao(UUID licaoId) {
        Usuario usuario = getAuthenticatedUsuario();
        return licaoRepository.findById(licaoId)
                .map(licao -> {
                    boolean estaConcluida = false;
                    if (usuario != null) {
                        estaConcluida = progressoUsuarioLicaoRepository.existsByUsuarioIdAndLicaoId(usuario.getId(), licao.getId());
                    }
                    return LicaoResponseDTO.fromEntity(licao, estaConcluida);
                })
                .orElseThrow(() -> new RuntimeException("Lição não encontrada"));
    }

    public void concluirLicao(UUID licaoId) {
        Usuario usuario = getAuthenticatedUsuario();
        if (usuario == null) {
            throw new RuntimeException("Usuário precisa estar autenticado para concluir lições");
        }

        Licao licao = licaoRepository.findById(licaoId)
                .orElseThrow(() -> new RuntimeException("Lição não encontrada"));

        if (progressoUsuarioLicaoRepository.existsByUsuarioIdAndLicaoId(usuario.getId(), licao.getId())) {
            // Já concluída
            return;
        }

        ProgressoUsuarioLicao progresso = ProgressoUsuarioLicao.builder()
                .usuario(usuario)
                .licao(licao)
                .build();
        
        progressoUsuarioLicaoRepository.save(progresso);

        // Aumentar ofensiva (incrementa se for concluída a lição no dia)
        LocalDate hoje = LocalDate.now();
        LocalDate ultimaAtividade = usuario.getUltimaAtividade();

        if (ultimaAtividade == null || ultimaAtividade.isBefore(hoje.minusDays(1))) {
            usuario.setSequenciaAtual(1);
            usuario.setUltimaAtividade(hoje);
        } else if (ultimaAtividade.isEqual(hoje.minusDays(1))) {
            usuario.setSequenciaAtual(usuario.getSequenciaAtual() + 1);
            usuario.setUltimaAtividade(hoje);
        } else if (ultimaAtividade.isEqual(hoje)) {
            // já contabilizou ofensiva hoje, não faz nada com a sequência
        }
        usuarioRepository.save(usuario);

        // Lógica de Conquistas (MVP)
        checarEAtribuirConquista(usuario, "Primeiros Passos");
        
        if (usuario.getSequenciaAtual() >= 7) {
            checarEAtribuirConquista(usuario, "Fogo Inicial");
        }
        
        // Verifica se concluiu o módulo 1 (Explorador Nato) - simplificado para: tem >= 3 lições
        long licoesConcluidas = progressoUsuarioLicaoRepository.countByUsuarioId(usuario.getId());
        if (licoesConcluidas >= 3) {
            checarEAtribuirConquista(usuario, "Explorador Nato");
        }
    }

    @Autowired
    private br.com.tupidigital.repository.ConquistaRepository conquistaRepository;

    @Autowired
    private br.com.tupidigital.repository.UsuarioConquistaRepository usuarioConquistaRepository;

    private void checarEAtribuirConquista(Usuario usuario, String tituloConquista) {
        br.com.tupidigital.entity.Conquista conquista = conquistaRepository.findAll().stream()
                .filter(c -> c.getTitulo().equalsIgnoreCase(tituloConquista))
                .findFirst().orElse(null);

        if (conquista != null) {
            boolean jaPossui = usuarioConquistaRepository.findByUsuarioId(usuario.getId()).stream()
                    .anyMatch(uc -> uc.getConquista().getId().equals(conquista.getId()));
            
            if (!jaPossui) {
                br.com.tupidigital.entity.UsuarioConquista uc = new br.com.tupidigital.entity.UsuarioConquista();
                uc.setUsuario(usuario);
                uc.setConquista(conquista);
                uc.setDataObtencao(java.time.LocalDateTime.now());
                usuarioConquistaRepository.save(uc);
            }
        }
    }
}
