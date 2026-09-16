package br.com.tupidigital.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

@Entity
@Table(name = "conteudos_linguisticos")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@EqualsAndHashCode(of = "id")
public class ConteudoLinguistico {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "palavra_tupi", nullable = false)
    private String palavraTupi;

    @Column(name = "traducao_ptbr", nullable = false)
    private String traducaoPtBr;

    @Column(name = "fonetica")
    private String fonetica;

    @Column(name = "tipo", nullable = false, length = 20)
    private String tipo; // e.g., PALAVRA, FRASE

    @Builder.Default
    @ManyToMany(mappedBy = "conteudos", fetch = FetchType.LAZY)
    private Set<Licao> licoes = new HashSet<>();

    @CreationTimestamp
    @Column(name = "criado_em", nullable = false, updatable = false)
    private LocalDateTime criadoEm;

    @UpdateTimestamp
    @Column(name = "atualizado_em", nullable = false)
    private LocalDateTime atualizadoEm;
}
