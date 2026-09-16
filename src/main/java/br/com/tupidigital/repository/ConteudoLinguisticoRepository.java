package br.com.tupidigital.repository;

import br.com.tupidigital.entity.ConteudoLinguistico;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface ConteudoLinguisticoRepository extends JpaRepository<ConteudoLinguistico, UUID> {
}
