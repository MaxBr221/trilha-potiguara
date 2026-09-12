package br.com.tupidigital.dto;

import br.com.tupidigital.entity.Trilha;
import java.util.UUID;

public record TrilhaResponseDTO(
        UUID id,
        String nome,
        String descricao,
        String status
) {
    public static TrilhaResponseDTO fromEntity(Trilha trilha) {
        return new TrilhaResponseDTO(
                trilha.getId(),
                trilha.getNome(),
                trilha.getDescricao(),
                trilha.getStatus().name()
        );
    }
}
