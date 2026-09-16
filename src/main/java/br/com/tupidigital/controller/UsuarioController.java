package br.com.tupidigital.controller;

import br.com.tupidigital.dto.DashboardResponseDTO;
import br.com.tupidigital.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/usuarios")
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    @GetMapping("/me/dashboard")
    public ResponseEntity<DashboardResponseDTO> obterDashboard() {
        return ResponseEntity.ok(usuarioService.obterDashboard());
    }
}
