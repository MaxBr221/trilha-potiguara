package br.com.tupidigital.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;
import java.text.Normalizer;
import java.util.Locale;

@Entity
@Table(name = "trilhas")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@EqualsAndHashCode(of = "id")
public class Trilha {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(nullable = false)
    private String nome;

    @Column(nullable = false, unique = true)
    private String slug;

    @Column(columnDefinition = "TEXT")
    private String descricao;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    @Builder.Default
    private StatusTrilha status = StatusTrilha.DRAFT;

    @Column(name = "icon")
    @Builder.Default
    private String icon = "🌿";

    @Column(name = "cor_base")
    @Builder.Default
    private String corBase = "emerald";

    @OneToMany(mappedBy = "trilha", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    private List<Modulo> modulos;

    @CreationTimestamp
    @Column(name = "criado_em", nullable = false, updatable = false)
    private LocalDateTime criadoEm;

    @UpdateTimestamp
    @Column(name = "atualizado_em", nullable = false)
    private LocalDateTime atualizadoEm;

    @PrePersist
    @PreUpdate
    public void generateSlug() {
        if (this.slug == null || this.slug.trim().isEmpty()) {
            if (this.nome != null) {
                String normalized = Normalizer.normalize(this.nome, Normalizer.Form.NFD);
                this.slug = normalized.replaceAll("\\p{M}", "") // remove accents
                                      .toLowerCase(Locale.ROOT)
                                      .replaceAll("[^a-z0-9\\s-]", "") // remove special chars
                                      .trim()
                                      .replaceAll("\\s+", "-"); // replace spaces with hyphens
            }
        }
    }
}
