CREATE TABLE notificacoes (
    id UUID PRIMARY KEY,
    usuario_id UUID NOT NULL,
    remetente_id UUID NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    mensagem TEXT NOT NULL,
    lida BOOLEAN NOT NULL DEFAULT FALSE,
    criado_em TIMESTAMP NOT NULL,
    CONSTRAINT fk_notificacao_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios (id),
    CONSTRAINT fk_notificacao_remetente FOREIGN KEY (remetente_id) REFERENCES usuarios (id)
);
