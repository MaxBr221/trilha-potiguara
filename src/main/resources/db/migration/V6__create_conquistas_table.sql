CREATE TABLE conquistas (
    id UUID PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT,
    icone_url VARCHAR(255),
    meta_xp INTEGER,
    meta_licoes INTEGER,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE usuario_conquistas (
    id UUID PRIMARY KEY,
    usuario_id UUID NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    conquista_id UUID NOT NULL REFERENCES conquistas(id) ON DELETE CASCADE,
    data_obtencao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(usuario_id, conquista_id)
);
