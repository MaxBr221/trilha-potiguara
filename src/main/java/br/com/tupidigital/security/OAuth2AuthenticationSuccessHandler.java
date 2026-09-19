package br.com.tupidigital.security;

import br.com.tupidigital.entity.Perfil;
import br.com.tupidigital.entity.Usuario;
import br.com.tupidigital.repository.UsuarioRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.UUID;

@Component
public class OAuth2AuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    @Autowired
    private TokenService tokenService;

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        
        OAuth2User oAuth2User = (OAuth2User) authentication.getPrincipal();
        
        String email = oAuth2User.getAttribute("email");
        String name = oAuth2User.getAttribute("name");
        
        // Verifica se o email já existe
        Usuario usuario = (Usuario) usuarioRepository.findByEmail(email);
        
        if (usuario == null) {
            // Cria um novo usuário
            usuario = new Usuario();
            usuario.setNome(name);
            usuario.setEmail(email);
            // Gera uma senha aleatória para o usuário do Google (já que é campo obrigatório e ele não vai usar)
            usuario.setSenha(UUID.randomUUID().toString());
            usuario.setPerfil(Perfil.USER);
            usuario.setXp(0);
            usuario.setSequenciaAtual(0);
            usuario = usuarioRepository.save(usuario);
        }
        
        // Gera o JWT
        String token = tokenService.generateToken(usuario);
        
        // Redireciona para o frontend com o token
        String targetUrl = "http://localhost:3000/oauth2-redirect?token=" + token;
        getRedirectStrategy().sendRedirect(request, response, targetUrl);
    }
}
