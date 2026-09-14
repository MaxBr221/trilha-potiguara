package br.com.tupidigital.service;

import br.com.tupidigital.dto.ExercicioResponseDTO;
import br.com.tupidigital.dto.ValidacaoRespostaRequestDTO;
import br.com.tupidigital.dto.ValidacaoRespostaResponseDTO;
import br.com.tupidigital.entity.Exercicio;
import br.com.tupidigital.repository.ExercicioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class ExercicioService {

    @Autowired
    private ExercicioRepository exercicioRepository;

    public List<ExercicioResponseDTO> listarExerciciosPorLicao(UUID licaoId) {
        return exercicioRepository.findByLicaoIdOrderByOrdemIndexAsc(licaoId).stream()
                .map(ExercicioResponseDTO::new)
                .toList();
    }

    public ValidacaoRespostaResponseDTO validarResposta(UUID exercicioId, ValidacaoRespostaRequestDTO request) {
        Exercicio exercicio = exercicioRepository.findById(exercicioId)
                .orElseThrow(() -> new RuntimeException("Exercício não encontrado"));

        String respostaUsuario = request.respostaUsuario() != null ? request.respostaUsuario().trim() : "";
        String respostaCorreta = exercicio.getRespostaCorreta().trim();

        // Comparação simples (ignorando case)
        boolean correta = respostaUsuario.equalsIgnoreCase(respostaCorreta);

        Integer xpGanho = correta ? exercicio.getPontuacaoXp() : 0;

        return new ValidacaoRespostaResponseDTO(correta, xpGanho, exercicio.getRespostaCorreta());
    }
}
