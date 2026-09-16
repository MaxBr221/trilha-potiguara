package br.com.tupidigital.repository;

import br.com.tupidigital.entity.Conquista;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface ConquistaRepository extends JpaRepository<Conquista, UUID> {
}
