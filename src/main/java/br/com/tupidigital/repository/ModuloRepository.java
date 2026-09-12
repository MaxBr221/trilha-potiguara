package br.com.tupidigital.repository;

import br.com.tupidigital.entity.Modulo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface ModuloRepository extends JpaRepository<Modulo, UUID> {
    List<Modulo> findByTrilhaIdOrderByOrdemIndexAsc(UUID trilhaId);
}
