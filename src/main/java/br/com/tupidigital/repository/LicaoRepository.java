package br.com.tupidigital.repository;

import br.com.tupidigital.entity.Licao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface LicaoRepository extends JpaRepository<Licao, UUID> {
    List<Licao> findByModuloIdOrderByOrdemIndexAsc(UUID moduloId);
}
