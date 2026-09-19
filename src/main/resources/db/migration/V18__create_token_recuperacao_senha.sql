CREATE TABLE token_recuperacao_senha (
    id UUID PRIMARY KEY,
    token VARCHAR(255) UNIQUE NOT NULL,
    usuario_id UUID NOT NULL REFERENCES usuarios(id),
    data_expiracao TIMESTAMP NOT NULL
);
