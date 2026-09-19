package br.com.tupidigital.repository;

import br.com.tupidigital.entity.Trilha;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

import java.util.Optional;

@Repository
public interface TrilhaRepository extends JpaRepository<Trilha, UUID> {
    Optional<Trilha> findBySlug(String slug);
}
