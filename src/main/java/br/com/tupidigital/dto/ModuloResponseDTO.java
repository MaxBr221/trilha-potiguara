package br.com.tupidigital.dto;

import br.com.tupidigital.entity.Modulo;
import java.util.UUID;

public record ModuloResponseDTO(
        UUID id,
        String titulo,
        String descricao,
        Integer ordemIndex,
        UUID trilhaId
) {
    public static ModuloResponseDTO fromEntity(Modulo modulo) {
        return new ModuloResponseDTO(
                modulo.getId(),
                modulo.getTitulo(),
                modulo.getDescricao(),
                modulo.getOrdemIndex(),
                modulo.getTrilha().getId()
        );
    }
}
