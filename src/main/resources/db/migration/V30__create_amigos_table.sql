CREATE TABLE amigos (
    usuario_id UUID NOT NULL,
    amigo_id UUID NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (usuario_id, amigo_id),
    CONSTRAINT fk_amigos_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios (id) ON DELETE CASCADE,
    CONSTRAINT fk_amigos_amigo FOREIGN KEY (amigo_id) REFERENCES usuarios (id) ON DELETE CASCADE
);
