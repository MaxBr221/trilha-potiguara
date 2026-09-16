package br.com.tupidigital.controller;

import br.com.tupidigital.dto.ConteudoLinguisticoRequestDTO;
import br.com.tupidigital.dto.ConteudoLinguisticoResponseDTO;
import br.com.tupidigital.service.ConteudoLinguisticoService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/conteudos")
@RequiredArgsConstructor
public class ConteudoLinguisticoController {

    private final ConteudoLinguisticoService service;

    @PostMapping
    public ResponseEntity<ConteudoLinguisticoResponseDTO> criar(@RequestBody @Valid ConteudoLinguisticoRequestDTO requestDTO) {
        ConteudoLinguisticoResponseDTO response = service.criar(requestDTO);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    @GetMapping
    public ResponseEntity<List<ConteudoLinguisticoResponseDTO>> listarTodos() {
        return ResponseEntity.ok(service.listarTodos());
    }

    @PostMapping("/{id}/vincular-licao/{licaoId}")
    public ResponseEntity<Void> vincularALicao(@PathVariable UUID id, @PathVariable UUID licaoId) {
        service.vincularALicao(id, licaoId);
        return ResponseEntity.ok().build();
    }
}
