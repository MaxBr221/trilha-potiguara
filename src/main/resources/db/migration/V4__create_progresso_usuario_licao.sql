CREATE TABLE progresso_usuario_licao (
    id UUID PRIMARY KEY,
    usuario_id UUID NOT NULL,
    licao_id UUID NOT NULL,
    data_conclusao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_progresso_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios (id),
    CONSTRAINT fk_progresso_licao FOREIGN KEY (licao_id) REFERENCES licoes (id),
    CONSTRAINT uk_usuario_licao UNIQUE (usuario_id, licao_id)
);
