package br.com.tupidigital.dto;

import java.time.LocalDateTime;
import java.util.UUID;

public record DashboardConquistaDTO(
        UUID id,
        String titulo,
        String descricao,
        String icone,
        String corBase,
        boolean desbloqueada,
        int progresso,
        LocalDateTime dataDesbloqueio
) {}
