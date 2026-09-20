package br.com.tupidigital.dto;

import java.util.UUID;

public record UsuarioPerfilDTO(
        UUID id,
        String nome,
        String email,
        Integer xp,
        Integer sequenciaAtual,
        String perfil,
        String fotoPerfil
) {}
