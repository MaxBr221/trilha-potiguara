package br.com.tupidigital.dto;

import java.util.UUID;
import java.util.List;

public record UsuarioPerfilPublicoDTO(
        UUID id,
        String nome,
        Integer xp,
        Integer sequenciaAtual,
        String fotoPerfil,
        int totalAmigos,
        boolean isAmigo
) {}
