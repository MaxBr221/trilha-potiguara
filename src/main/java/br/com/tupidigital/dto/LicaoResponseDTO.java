package br.com.tupidigital.dto;

import br.com.tupidigital.entity.Licao;
import java.util.UUID;

public record LicaoResponseDTO(
        UUID id,
        String title,
        Boolean estaConcluida,
        String type
) {
    public static LicaoResponseDTO fromEntity(Licao licao) {
        return new LicaoResponseDTO(
                licao.getId(),
                licao.getTitulo(),
                false, // mock estaConcluida
                "learning" // mock type
        );
    }
}
