package br.com.tupidigital.repository;

import br.com.tupidigital.entity.ProgressoUsuarioLicao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface ProgressoUsuarioLicaoRepository extends JpaRepository<ProgressoUsuarioLicao, UUID> {
    Optional<ProgressoUsuarioLicao> findByUsuarioIdAndLicaoId(UUID usuarioId, UUID licaoId);
    boolean existsByUsuarioIdAndLicaoId(UUID usuarioId, UUID licaoId);
}
