package br.com.tupidigital.controller;

import br.com.tupidigital.dto.LoginRequestDTO;
import br.com.tupidigital.dto.RegisterRequestDTO;
import br.com.tupidigital.dto.TokenResponseDTO;
import br.com.tupidigital.entity.Perfil;
import br.com.tupidigital.entity.Usuario;
import br.com.tupidigital.repository.UsuarioRepository;
import br.com.tupidigital.security.TokenService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/auth")
public class AuthenticationController {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private UsuarioRepository repository;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @PostMapping("/login")
    public ResponseEntity<TokenResponseDTO> login(@RequestBody @Valid LoginRequestDTO data) {
        var usernamePassword = new UsernamePasswordAuthenticationToken(data.email(), data.senha());
        var auth = this.authenticationManager.authenticate(usernamePassword);

        var token = tokenService.generateToken((Usuario) auth.getPrincipal());

        return ResponseEntity.ok(new TokenResponseDTO(token));
    }

    @PostMapping("/register")
    public ResponseEntity<Void> register(@RequestBody @Valid RegisterRequestDTO data) {
        if (this.repository.existsByEmail(data.email())) {
            return ResponseEntity.badRequest().build();
        }

        String encryptedPassword = passwordEncoder.encode(data.senha());
        Perfil perfil = data.perfil() != null ? data.perfil() : Perfil.USER;

        Usuario newUsuario = Usuario.builder()
                .nome(data.nome())
                .email(data.email())
                .senha(encryptedPassword)
                .perfil(perfil)
                .xp(0)
                .sequenciaAtual(0)
                .build();

        this.repository.save(newUsuario);

        return ResponseEntity.ok().build();
    }
}
