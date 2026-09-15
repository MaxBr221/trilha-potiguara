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

    public List<TrilhaResponseDTO> listarTrilhas() {
        return trilhaRepository.findAll().stream()
                .map(t -> TrilhaResponseDTO.fromEntity(t, t.getModulos() != null ? t.getModulos().size() : 0))
                .collect(Collectors.toList());
    }

    public List<ModuloResponseDTO> listarModulosPorTrilha(UUID trilhaId) {
        return moduloRepository.findByTrilhaIdOrderByOrdemIndexAsc(trilhaId).stream()
                .map(ModuloResponseDTO::fromEntity)
                .collect(Collectors.toList());
    }

    public List<LicaoResponseDTO> listarLicoesPorModulo(UUID moduloId) {
        return licaoRepository.findByModuloIdOrderByOrdemIndexAsc(moduloId).stream()
                .map(LicaoResponseDTO::fromEntity)
                .collect(Collectors.toList());
    }

    public LicaoResponseDTO obterLicao(UUID licaoId) {
        return licaoRepository.findById(licaoId)
                .map(LicaoResponseDTO::fromEntity)
                .orElseThrow(() -> new RuntimeException("Lição não encontrada"));
    }

    public void concluirLicao(UUID licaoId) {
        String email = org.springframework.security.core.context.SecurityContextHolder.getContext().getAuthentication().getName();
        org.springframework.security.core.userdetails.UserDetails userDetails = usuarioRepository.findByEmail(email);
        if (userDetails == null) {
            throw new RuntimeException("Usuário não encontrado");
        }
        br.com.tupidigital.entity.Usuario usuario = (br.com.tupidigital.entity.Usuario) userDetails;

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

        // Simple streak logic (MVP): increment streak if this is the first lesson completed today.
        // A more robust implementation would check the date of the last completed lesson.
        // For now, let's just increment it to simulate progression.
        usuario.setSequenciaAtual(usuario.getSequenciaAtual() + 1);
        usuarioRepository.save(usuario);
    }
}
