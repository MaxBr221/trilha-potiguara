ALTER TABLE conquistas RENAME COLUMN icone_url TO icone;
ALTER TABLE conquistas ADD COLUMN cor_base VARCHAR(50);

CREATE TABLE progresso_usuario_exercicio (
    id UUID PRIMARY KEY,
    usuario_id UUID NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    exercicio_id UUID NOT NULL REFERENCES exercicios(id) ON DELETE CASCADE,
    acertou BOOLEAN NOT NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
