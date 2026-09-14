package br.com.tupidigital.dto;

public record ValidacaoRespostaResponseDTO(
        boolean correta,
        Integer xpGanho,
        String respostaCorreta
) {
}
