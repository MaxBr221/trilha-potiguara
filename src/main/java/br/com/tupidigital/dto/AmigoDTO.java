package br.com.tupidigital.dto;

import java.util.UUID;

public record AmigoDTO(
        UUID id,
        String nome,
        Integer xp,
        Integer sequenciaAtual,
        String fotoPerfil
) {}
