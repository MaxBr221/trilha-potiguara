package br.com.tupidigital.dto;

import br.com.tupidigital.entity.Trilha;
import java.util.UUID;

public record TrilhaResponseDTO(
        UUID id,
        String title,
        String description,
        Integer progresso,
        Integer nivel,
        Integer quantidadeModulos,
        String icon,
        String corBase,
        Boolean estaBloqueada
) {
    public static TrilhaResponseDTO fromEntity(Trilha trilha, int quantidadeModulos) {
        return new TrilhaResponseDTO(
                trilha.getId(),
                trilha.getNome(),
                trilha.getDescricao(),
                0, // mock progresso
                1, // mock nivel
                quantidadeModulos,
                "🌿", // mock icon
                "emerald", // mock corBase
                false // mock estaBloqueada
        );
    }
}
