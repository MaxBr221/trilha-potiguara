package br.com.tupidigital.service;

import br.com.tupidigital.dto.DashboardResponseDTO;
import br.com.tupidigital.entity.Usuario;
import br.com.tupidigital.repository.ProgressoUsuarioLicaoRepository;
import br.com.tupidigital.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import br.com.tupidigital.repository.ConquistaRepository;
import br.com.tupidigital.repository.UsuarioConquistaRepository;
import br.com.tupidigital.repository.ProgressoUsuarioExercicioRepository;
import br.com.tupidigital.dto.DashboardConquistaDTO;
import br.com.tupidigital.entity.UsuarioConquista;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private ProgressoUsuarioLicaoRepository progressoUsuarioLicaoRepository;
    
    @Autowired
    private ProgressoUsuarioExercicioRepository progressoUsuarioExercicioRepository;

    @Autowired
    private ConquistaRepository conquistaRepository;

    @Autowired
    private UsuarioConquistaRepository usuarioConquistaRepository;

    public DashboardResponseDTO obterDashboard() {
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        UserDetails userDetails = usuarioRepository.findByEmail(email);
        
        if (userDetails == null) {
            throw new RuntimeException("Usuário não encontrado");
        }
        
        Usuario usuario = (Usuario) userDetails;
        
        long licoesConcluidas = progressoUsuarioLicaoRepository.countByUsuarioId(usuario.getId());
        
        long totalExercicios = progressoUsuarioExercicioRepository.countByUsuarioId(usuario.getId());
        long totalAcertos = progressoUsuarioExercicioRepository.countByUsuarioIdAndAcertouTrue(usuario.getId());
        
        int taxaAcerto = 0;
        if (totalExercicios > 0) {
            taxaAcerto = (int) ((totalAcertos * 100) / totalExercicios);
        }
        
        // Fetch conquistas
        Map<java.util.UUID, UsuarioConquista> conquistasDesbloqueadas = usuarioConquistaRepository.findByUsuarioId(usuario.getId())
                .stream()
                .collect(Collectors.toMap(uc -> uc.getConquista().getId(), uc -> uc));
                
        List<DashboardConquistaDTO> conquistasDTO = conquistaRepository.findAll().stream()
                .map(c -> {
                    UsuarioConquista uc = conquistasDesbloqueadas.get(c.getId());
                    boolean desbloqueada = uc != null;
                    int progresso = desbloqueada ? 100 : 0;
                    
                    if (!desbloqueada) {
                        if (c.getMetaXp() != null && c.getMetaXp() > 0) {
                            progresso = Math.min(100, (usuario.getXp() * 100) / c.getMetaXp());
                        } else if (c.getMetaLicoes() != null && c.getMetaLicoes() > 0) {
                            progresso = Math.min(100, (int) ((licoesConcluidas * 100) / c.getMetaLicoes()));
                        }
                    }
                    
                    return new DashboardConquistaDTO(
                        c.getId(),
                        c.getTitulo(),
                        c.getDescricao(),
                        c.getIcone(),
                        c.getCorBase(),
                        desbloqueada,
                        progresso,
                        desbloqueada ? uc.getDataObtencao() : null
                    );
                })
                .collect(Collectors.toList());
        
        int sequenciaReal = usuario.getSequenciaAtual();
        java.time.LocalDate hoje = java.time.LocalDate.now();
        java.time.LocalDate ultimaAtividade = usuario.getUltimaAtividade();

        // Se o usuário não acessou ontem nem hoje, a ofensiva já foi perdida
        if (ultimaAtividade != null && ultimaAtividade.isBefore(hoje.minusDays(1))) {
            sequenciaReal = 0;
        }
        
        return new DashboardResponseDTO(
                usuario.getXp(),
                sequenciaReal,
                (int) licoesConcluidas,
                taxaAcerto,
                conquistasDTO
        );
    }
}
