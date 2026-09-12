package br.com.tupidigital.dto;

import br.com.tupidigital.entity.Licao;
import java.util.UUID;

public record LicaoResponseDTO(
        UUID id,
        String titulo,
        String descricao,
        Integer ordemIndex,
        UUID moduloId
) {
    public static LicaoResponseDTO fromEntity(Licao licao) {
        return new LicaoResponseDTO(
                licao.getId(),
                licao.getTitulo(),
                licao.getDescricao(),
                licao.getOrdemIndex(),
                licao.getModulo().getId()
        );
    }
}
