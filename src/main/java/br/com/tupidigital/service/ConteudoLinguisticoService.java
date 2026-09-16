package br.com.tupidigital.service;

import br.com.tupidigital.dto.ConteudoLinguisticoRequestDTO;
import br.com.tupidigital.dto.ConteudoLinguisticoResponseDTO;
import br.com.tupidigital.entity.ConteudoLinguistico;
import br.com.tupidigital.entity.Licao;
import br.com.tupidigital.repository.ConteudoLinguisticoRepository;
import br.com.tupidigital.repository.LicaoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ConteudoLinguisticoService {

    private final ConteudoLinguisticoRepository repository;
    private final LicaoRepository licaoRepository;

    @Transactional
    public ConteudoLinguisticoResponseDTO criar(ConteudoLinguisticoRequestDTO requestDTO) {
        ConteudoLinguistico conteudo = ConteudoLinguistico.builder()
                .palavraTupi(requestDTO.getPalavraTupi())
                .traducaoPtBr(requestDTO.getTraducaoPtBr())
                .fonetica(requestDTO.getFonetica())
                .tipo(requestDTO.getTipo())
                .build();
        
        conteudo = repository.save(conteudo);
        return mapToDTO(conteudo);
    }

    @Transactional(readOnly = true)
    public List<ConteudoLinguisticoResponseDTO> listarTodos() {
        return repository.findAll().stream()
                .map(this::mapToDTO)
                .collect(Collectors.toList());
    }

    @Transactional
    public void vincularALicao(UUID conteudoId, UUID licaoId) {
        ConteudoLinguistico conteudo = repository.findById(conteudoId)
                .orElseThrow(() -> new RuntimeException("Conteúdo não encontrado."));
        
        Licao licao = licaoRepository.findById(licaoId)
                .orElseThrow(() -> new RuntimeException("Lição não encontrada."));
        
        licao.getConteudos().add(conteudo);
        licaoRepository.save(licao);
    }

    private ConteudoLinguisticoResponseDTO mapToDTO(ConteudoLinguistico entity) {
        return ConteudoLinguisticoResponseDTO.builder()
                .id(entity.getId())
                .palavraTupi(entity.getPalavraTupi())
                .traducaoPtBr(entity.getTraducaoPtBr())
                .fonetica(entity.getFonetica())
                .tipo(entity.getTipo())
                .criadoEm(entity.getCriadoEm())
                .build();
    }
}
