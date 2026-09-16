package br.com.tupidigital.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ConteudoLinguisticoRequestDTO {

    @NotBlank(message = "A palavra Tupi é obrigatória")
    private String palavraTupi;

    @NotBlank(message = "A tradução é obrigatória")
    private String traducaoPtBr;

    private String fonetica;

    @NotBlank(message = "O tipo é obrigatório")
    private String tipo;
}
