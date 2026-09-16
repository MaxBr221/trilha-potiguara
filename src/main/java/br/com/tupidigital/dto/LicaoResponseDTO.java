package br.com.tupidigital.dto;

import br.com.tupidigital.entity.Licao;
import java.util.UUID;

public record LicaoResponseDTO(
        UUID id,
        String title,
        Boolean estaConcluida,
        String type
) {
    public static LicaoResponseDTO fromEntity(Licao licao, boolean estaConcluida) {
        return new LicaoResponseDTO(
                licao.getId(),
                licao.getTitulo(),
                estaConcluida,
                "learning" // type mantido estático como learning
        );
    }
}
