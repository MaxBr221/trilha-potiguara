package br.com.tupidigital.dto;

import java.time.LocalDateTime;
import java.util.UUID;

public record NotificacaoDTO(
        UUID id,
        RemetenteDTO remetente,
        String tipo,
        String mensagem,
        boolean lida,
        LocalDateTime criadoEm
) {}
