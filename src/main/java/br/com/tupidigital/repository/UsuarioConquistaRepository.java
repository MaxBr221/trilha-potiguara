package br.com.tupidigital.repository;

import br.com.tupidigital.entity.UsuarioConquista;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface UsuarioConquistaRepository extends JpaRepository<UsuarioConquista, UUID> {
    List<UsuarioConquista> findByUsuarioId(UUID usuarioId);
}
