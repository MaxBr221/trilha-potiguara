CREATE TABLE exercicios (
    id UUID PRIMARY KEY,
    licao_id UUID NOT NULL,
    enunciado TEXT NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    resposta_correta VARCHAR(255) NOT NULL,
    pontuacao_xp INTEGER NOT NULL,
    ordem_index INTEGER NOT NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_exercicios_licoes FOREIGN KEY (licao_id) REFERENCES licoes (id) ON DELETE CASCADE
);

CREATE TABLE exercicio_opcoes (
    exercicio_id UUID NOT NULL,
    opcao VARCHAR(255) NOT NULL,
    CONSTRAINT fk_exercicio_opcoes_exercicios FOREIGN KEY (exercicio_id) REFERENCES exercicios (id) ON DELETE CASCADE
);
