package br.com.tupidigital.dto;

import br.com.tupidigital.entity.Modulo;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

public record ModuloResponseDTO(
        UUID id,
        String title,
        String description,
        Boolean estaBloqueada,
        List<LicaoResponseDTO> lessons
) {
    public static ModuloResponseDTO fromEntity(Modulo modulo) {
        List<LicaoResponseDTO> lessonsDTO = modulo.getLicoes() != null ? 
                modulo.getLicoes().stream()
                      .map(LicaoResponseDTO::fromEntity)
                      .collect(Collectors.toList()) : 
                List.of();
                
        return new ModuloResponseDTO(
                modulo.getId(),
                modulo.getTitulo(),
                modulo.getDescricao(),
                false, // mock estaBloqueada
                lessonsDTO
        );
    }
}
