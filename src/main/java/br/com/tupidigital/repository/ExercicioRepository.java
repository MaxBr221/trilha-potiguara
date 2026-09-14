package br.com.tupidigital.repository;

import br.com.tupidigital.entity.Exercicio;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface ExercicioRepository extends JpaRepository<Exercicio, UUID> {
    List<Exercicio> findByLicaoIdOrderByOrdemIndexAsc(UUID licaoId);
}
