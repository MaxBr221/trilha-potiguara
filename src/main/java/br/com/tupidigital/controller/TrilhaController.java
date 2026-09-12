package br.com.tupidigital.controller;

import br.com.tupidigital.dto.LicaoResponseDTO;
import br.com.tupidigital.dto.ModuloResponseDTO;
import br.com.tupidigital.dto.TrilhaResponseDTO;
import br.com.tupidigital.service.TrilhaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1")
public class TrilhaController {

    @Autowired
    private TrilhaService trilhaService;

    @GetMapping("/trails")
    public ResponseEntity<List<TrilhaResponseDTO>> listarTrilhas() {
        return ResponseEntity.ok(trilhaService.listarTrilhas());
    }

    @GetMapping("/trails/{id}/modules")
    public ResponseEntity<List<ModuloResponseDTO>> listarModulos(@PathVariable UUID id) {
        return ResponseEntity.ok(trilhaService.listarModulosPorTrilha(id));
    }

    @GetMapping("/modules/{id}/lessons")
    public ResponseEntity<List<LicaoResponseDTO>> listarLicoes(@PathVariable UUID id) {
        return ResponseEntity.ok(trilhaService.listarLicoesPorModulo(id));
    }

    @GetMapping("/lessons/{id}")
    public ResponseEntity<LicaoResponseDTO> obterLicao(@PathVariable UUID id) {
        return ResponseEntity.ok(trilhaService.obterLicao(id));
    }
}
