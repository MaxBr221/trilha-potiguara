package br.com.tupidigital.service;

import br.com.tupidigital.dto.DashboardResponseDTO;
import br.com.tupidigital.entity.Usuario;
import br.com.tupidigital.repository.ProgressoUsuarioLicaoRepository;
import br.com.tupidigital.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private ProgressoUsuarioLicaoRepository progressoUsuarioLicaoRepository;

    public DashboardResponseDTO obterDashboard() {
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        UserDetails userDetails = usuarioRepository.findByEmail(email);
        
        if (userDetails == null) {
            throw new RuntimeException("Usuário não encontrado");
        }
        
        Usuario usuario = (Usuario) userDetails;
        
        long licoesConcluidas = progressoUsuarioLicaoRepository.countByUsuarioId(usuario.getId());
        
        // Mocking taxa de acerto based on completed lessons (e.g., each lesson gives a slight boost up to 100)
        // A real implementation would require storing exercises answers history.
        int taxaAcerto = Math.min(100, 50 + (int) (licoesConcluidas * 5));
        
        return new DashboardResponseDTO(
                usuario.getXp(),
                usuario.getSequenciaAtual(),
                (int) licoesConcluidas,
                taxaAcerto
        );
    }
}
