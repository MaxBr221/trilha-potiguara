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

    @GetMapping("/trilhas")
    public ResponseEntity<List<TrilhaResponseDTO>> listarTrilhas() {
        return ResponseEntity.ok(trilhaService.listarTrilhas());
    }

    @GetMapping("/trilhas/slug/{slug}")
    public ResponseEntity<TrilhaResponseDTO> obterTrilhaPorSlug(@PathVariable String slug) {
        return ResponseEntity.ok(trilhaService.obterTrilhaPorSlug(slug));
    }

    @GetMapping("/trilhas/slug/{slug}/modulos")
    public ResponseEntity<List<ModuloResponseDTO>> listarModulosPorSlug(@PathVariable String slug) {
        return ResponseEntity.ok(trilhaService.listarModulosPorTrilhaSlug(slug));
    }

    @GetMapping("/trilhas/{trailId}/modulos")
    public ResponseEntity<List<ModuloResponseDTO>> listarModulos(@PathVariable UUID trailId) {
        return ResponseEntity.ok(trilhaService.listarModulosPorTrilha(trailId));
    }7

    @GetMapping("/modulos/{id}/licoes")
    public ResponseEntity<List<LicaoResponseDTO>> listarLicoes(@PathVariable UUID id) {
        return ResponseEntity.ok(trilhaService.listarLicoesPorModulo(id));
    }

    @GetMapping("/licoes/{id}")
    public ResponseEntity<LicaoResponseDTO> obterLicao(@PathVariable UUID id) {
        return ResponseEntity.ok(trilhaService.obterLicao(id));
    }

    @PostMapping("/licoes/{id}/concluir")
    public ResponseEntity<Void> concluirLicao(@PathVariable UUID id) {
        trilhaService.concluirLicao(id);
        return ResponseEntity.ok().build();
    }
}
