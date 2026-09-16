CREATE TABLE IF NOT EXISTS conteudos_linguisticos (
    id UUID PRIMARY KEY,
    palavra_tupi VARCHAR(255) NOT NULL,
    traducao_ptbr VARCHAR(255) NOT NULL,
    fonetica VARCHAR(255),
    tipo VARCHAR(20) NOT NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS licao_conteudo (
    licao_id UUID NOT NULL,
    conteudo_id UUID NOT NULL,
    CONSTRAINT fk_licao_conteudo_licao FOREIGN KEY (licao_id) REFERENCES licoes (id) ON DELETE CASCADE,
    CONSTRAINT fk_licao_conteudo_conteudo FOREIGN KEY (conteudo_id) REFERENCES conteudos_linguisticos (id) ON DELETE CASCADE,
    PRIMARY KEY (licao_id, conteudo_id)
);
