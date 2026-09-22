-- ==========================================
-- V34: Adição de Exercícios de Filho e Filha para Módulo 4
-- ==========================================

-- Ex 3: Filho
INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em)
VALUES ('7f1b8a9c-2d3e-4f5a-b6c7-d8e9f0a1b2c3', 'd7b4e9f9-e3b9-4a0b-93cd-5d63f0d5a3ef', 'Como se diz "Filho" em Tupi?', 'MULTIPLA_ESCOLHA', 'Ta''yra', 10, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('7f1b8a9c-2d3e-4f5a-b6c7-d8e9f0a1b2c3', 'Sy'), ('7f1b8a9c-2d3e-4f5a-b6c7-d8e9f0a1b2c3', 'Tuba'), ('7f1b8a9c-2d3e-4f5a-b6c7-d8e9f0a1b2c3', 'Ta''yra'), ('7f1b8a9c-2d3e-4f5a-b6c7-d8e9f0a1b2c3', 'Taîyra');

-- Ex 4: Filha
INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em)
VALUES ('8a2c9b0d-3e4f-5a6b-c7d8-e9f0a1b2c3d4', 'd7b4e9f9-e3b9-4a0b-93cd-5d63f0d5a3ef', 'Como se diz "Filha" em Tupi?', 'MULTIPLA_ESCOLHA', 'Taîyra', 10, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('8a2c9b0d-3e4f-5a6b-c7d8-e9f0a1b2c3d4', 'Membyra'), ('8a2c9b0d-3e4f-5a6b-c7d8-e9f0a1b2c3d4', 'Tuba'), ('8a2c9b0d-3e4f-5a6b-c7d8-e9f0a1b2c3d4', 'Ta''yra'), ('8a2c9b0d-3e4f-5a6b-c7d8-e9f0a1b2c3d4', 'Taîyra');
