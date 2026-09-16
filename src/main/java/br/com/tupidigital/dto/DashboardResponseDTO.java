package br.com.tupidigital.dto;

public record DashboardResponseDTO(
        Integer xp,
        Integer diasOfensiva,
        Integer licoesConcluidas,
        Integer taxaAcerto,
        java.util.List<DashboardConquistaDTO> conquistas
) {}
