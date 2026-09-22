package br.com.tupidigital.repository;

import br.com.tupidigital.entity.Notificacao;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface NotificacaoRepository extends JpaRepository<Notificacao, UUID> {
    List<Notificacao> findByUsuarioIdOrderByCriadoEmDesc(UUID usuarioId);
}
