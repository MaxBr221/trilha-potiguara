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

    @org.springframework.web.bind.annotation.GetMapping("/hash")
    public String getHash(@org.springframework.web.bind.annotation.RequestParam String pwd) {
        return new org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder().encode(pwd);
    }


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

        Usuario authUser = (Usuario) auth.getPrincipal();
        var token = tokenService.generateToken(authUser);

        TokenResponseDTO.UsuarioSessaoDTO sessaoDTO = new TokenResponseDTO.UsuarioSessaoDTO(
                authUser.getId(),
                authUser.getNome(),
                authUser.getEmail(),
                authUser.getXp(),
                authUser.getSequenciaAtual(),
                authUser.getPerfil().name()
        );

        return ResponseEntity.ok(new TokenResponseDTO(token, sessaoDTO));
    }

    @PostMapping("/register")
    public ResponseEntity<Void> register(@RequestBody @Valid RegisterRequestDTO data) {
        if (this.repository.existsByEmail(data.email())) {
            return ResponseEntity.badRequest().build();
        }

        String encryptedPassword = passwordEncoder.encode(data.senha());
        Perfil perfil = data.perfil() != null ? data.perfil() : Perfil.USER;

        Usuario newUsuario = new Usuario();
        newUsuario.setNome(data.nome());
        newUsuario.setEmail(data.email());
        newUsuario.setSenha(encryptedPassword);
        newUsuario.setPerfil(perfil);
        newUsuario.setXp(0);
        newUsuario.setSequenciaAtual(0);

        this.repository.save(newUsuario);

        return ResponseEntity.ok().build();
    }
}
