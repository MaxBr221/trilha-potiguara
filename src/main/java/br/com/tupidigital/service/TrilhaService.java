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

    private br.com.tupidigital.entity.Usuario getAuthenticatedUsuario() {
        var auth = org.springframework.security.core.context.SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated() || auth.getPrincipal().equals("anonymousUser")) {
            return null;
        }
        String email = auth.getName();
        org.springframework.security.core.userdetails.UserDetails userDetails = usuarioRepository.findByEmail(email);
        return (br.com.tupidigital.entity.Usuario) userDetails;
    }

    public List<TrilhaResponseDTO> listarTrilhas() {
        br.com.tupidigital.entity.Usuario usuario = getAuthenticatedUsuario();
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
        br.com.tupidigital.entity.Usuario usuario = getAuthenticatedUsuario();
        List<br.com.tupidigital.entity.Modulo> modulos = moduloRepository.findByTrilhaIdOrderByOrdemIndexAsc(trilhaId);
        
        List<ModuloResponseDTO> response = new java.util.ArrayList<>();
        boolean previousModuleCompleted = true; // First module is always unlocked
        
        for (br.com.tupidigital.entity.Modulo modulo : modulos) {
            boolean isLocked = !previousModuleCompleted;
            
            List<LicaoResponseDTO> licoesDTO = (modulo.getLicoes() != null ? modulo.getLicoes() : new java.util.ArrayList<br.com.tupidigital.entity.Licao>()).stream()
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
        br.com.tupidigital.entity.Usuario usuario = getAuthenticatedUsuario();
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
        br.com.tupidigital.entity.Usuario usuario = getAuthenticatedUsuario();
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
        br.com.tupidigital.entity.Usuario usuario = getAuthenticatedUsuario();
        if (usuario == null) {
            throw new RuntimeException("Usuário precisa estar autenticado para concluir lições");
        }

        br.com.tupidigital.entity.Licao licao = licaoRepository.findById(licaoId)
                .orElseThrow(() -> new RuntimeException("Lição não encontrada"));

        if (progressoUsuarioLicaoRepository.existsByUsuarioIdAndLicaoId(usuario.getId(), licao.getId())) {
            // Já concluída
            return;
        }

        br.com.tupidigital.entity.ProgressoUsuarioLicao progresso = br.com.tupidigital.entity.ProgressoUsuarioLicao.builder()
                .usuario(usuario)
                .licao(licao)
                .build();
        
        progressoUsuarioLicaoRepository.save(progresso);

        // Simple streak logic (MVP): increment streak se for a primeira do dia (vamos simplificar e apenas somar por enquanto)
        usuario.setSequenciaAtual(usuario.getSequenciaAtual() + 1);
        usuarioRepository.save(usuario);
    }
}
