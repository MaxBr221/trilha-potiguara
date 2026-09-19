-- Adiciona a coluna meta_ofensiva na tabela conquistas
ALTER TABLE conquistas ADD COLUMN meta_ofensiva INTEGER DEFAULT 0;

-- Atualiza a conquista existente 'Semana Perfeita' para ter a meta correta de 7 dias
UPDATE conquistas SET meta_ofensiva = 7 WHERE titulo = 'Semana Perfeita';

-- Adiciona novas conquistas épicas!
INSERT INTO conquistas (id, titulo, descricao, icone, meta_xp, meta_licoes, meta_ofensiva, criado_em)
VALUES (gen_random_uuid(), 'Mês de Fogo', 'Mantenha uma ofensiva de 30 dias.', 'https://cdn-icons-png.flaticon.com/512/3112/3112946.png', 0, 0, 30, CURRENT_TIMESTAMP);

INSERT INTO conquistas (id, titulo, descricao, icone, meta_xp, meta_licoes, meta_ofensiva, criado_em)
VALUES (gen_random_uuid(), 'Guardião Tupi', 'Alcance a marca incrível de 5000 XP.', 'https://cdn-icons-png.flaticon.com/512/3112/3112946.png', 5000, 0, 0, CURRENT_TIMESTAMP);

INSERT INTO conquistas (id, titulo, descricao, icone, meta_xp, meta_licoes, meta_ofensiva, criado_em)
VALUES (gen_random_uuid(), 'Mestre da Fala', 'Conclua 100 lições.', 'https://cdn-icons-png.flaticon.com/512/3112/3112946.png', 0, 100, 0, CURRENT_TIMESTAMP);
