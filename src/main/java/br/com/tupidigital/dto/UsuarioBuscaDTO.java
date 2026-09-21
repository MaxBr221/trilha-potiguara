package br.com.tupidigital.dto;

import java.util.UUID;

public record UsuarioBuscaDTO(
        UUID id,
        String nome,
        Integer xp,
        String fotoPerfil
) {}
