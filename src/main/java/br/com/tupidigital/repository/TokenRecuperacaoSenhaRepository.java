package br.com.tupidigital.repository;

import br.com.tupidigital.entity.TokenRecuperacaoSenha;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;
import java.util.UUID;

public interface TokenRecuperacaoSenhaRepository extends JpaRepository<TokenRecuperacaoSenha, UUID> {
    Optional<TokenRecuperacaoSenha> findByToken(String token);
}
