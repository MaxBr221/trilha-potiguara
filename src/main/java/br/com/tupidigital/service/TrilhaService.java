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

@Service
public class TrilhaService {

    @Autowired
    private TrilhaRepository trilhaRepository;

    @Autowired
    private ModuloRepository moduloRepository;

    @Autowired
    private LicaoRepository licaoRepository;

    public List<TrilhaResponseDTO> listarTrilhas() {
        return trilhaRepository.findAll().stream()
                .map(TrilhaResponseDTO::fromEntity)
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
}
