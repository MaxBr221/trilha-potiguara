package br.com.tupidigital.dto;

import java.util.UUID;

public record TokenResponseDTO(String token, UsuarioSessaoDTO usuario) {
    public record UsuarioSessaoDTO(
            UUID id,
            String nome,
            String email,
            Integer xp,
            Integer sequenciaAtual,
            String perfil
    ) {}
}
