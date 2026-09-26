package br.com.tupidigital.repository;

import br.com.tupidigital.entity.ConteudoLinguistico;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;

@Repository
public interface ConteudoLinguisticoRepository extends JpaRepository<ConteudoLinguistico, UUID> {

    @Query("SELECT c FROM Licao l JOIN l.conteudos c WHERE l.id = :licaoId")
    List<ConteudoLinguistico> findByLicaoId(@Param("licaoId") UUID licaoId);
}
