package br.com.tupidigital.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ConteudoLinguisticoResponseDTO {
    private UUID id;
    private String palavraTupi;
    private String traducaoPtBr;
    private String fonetica;
    private String tipo;
    private LocalDateTime criadoEm;
}
