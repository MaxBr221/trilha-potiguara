-- ==========================================
-- V42: Correções de consistência em módulos e exercícios
-- ==========================================

-- ==========================================
-- 1. MÓDULO NATUREZA: Criar Lição 2 Plantas e mover exercícios
-- ==========================================

-- Criar a nova lição "Lição 2: Plantas"
INSERT INTO licoes (id, titulo, descricao, ordem_index, modulo_id, criado_em, atualizado_em)
VALUES ('44444444-4444-4444-4444-444444444445', 'Lição 2: Plantas', 'Conheça árvore, mandioca e mais.', 2, '33333333-3333-3333-3333-333333333335', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Mover exercícios de Árvore e Mandioca para a nova lição de Plantas
UPDATE exercicios SET licao_id = '44444444-4444-4444-4444-444444444445', ordem_index = 1 WHERE id = '77777777-7777-7777-7777-777777777773';
UPDATE exercicios SET licao_id = '44444444-4444-4444-4444-444444444445', ordem_index = 2 WHERE id = '77777777-7777-7777-7777-777777777774';

-- Reordenar os exercícios restantes na lição de Animais (Macaco, Cobra, Anta: 5,6,7 -> 3,4,5)
UPDATE exercicios SET ordem_index = 3 WHERE id = '77777777-7777-7777-7777-777777777775';
UPDATE exercicios SET ordem_index = 4 WHERE id = '77777777-7777-7777-7777-777777777776';
UPDATE exercicios SET ordem_index = 5 WHERE id = '77777777-7777-7777-7777-777777777777';


-- ==========================================
-- 2. MÓDULO NÚMEROS: Adicionar exercício do número 5
-- ==========================================

INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em)
VALUES ('9a1b2c3d-4e5f-6a7b-8c9d-0e1f2a3b4c5d', '44444444-4444-4444-4444-444444444443', 'Como se diz "Cinco" em Tupi?', 'MULTIPLA_ESCOLHA', 'Ambo', 10, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('9a1b2c3d-4e5f-6a7b-8c9d-0e1f2a3b4c5d', 'Ambo');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('9a1b2c3d-4e5f-6a7b-8c9d-0e1f2a3b4c5d', 'Oîepé');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('9a1b2c3d-4e5f-6a7b-8c9d-0e1f2a3b4c5d', 'Mosapyr');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('9a1b2c3d-4e5f-6a7b-8c9d-0e1f2a3b4c5d', 'Irundy');


-- ==========================================
-- 3. MÓDULO CORES: Adicionar Amarelo e Verde
-- ==========================================

-- Ex 4: Amarelo
INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em)
VALUES ('b2c3d4e5-f6a7-b8c9-d0e1-f2a3b4c5d6e7', 'b3e8ab21-8eb1-4d14-8f2d-8e470125e130', 'Como se diz "Amarelo" em Tupi?', 'MULTIPLA_ESCOLHA', 'Yuba', 10, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('b2c3d4e5-f6a7-b8c9-d0e1-f2a3b4c5d6e7', 'Yuba');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('b2c3d4e5-f6a7-b8c9-d0e1-f2a3b4c5d6e7', 'Pytã');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('b2c3d4e5-f6a7-b8c9-d0e1-f2a3b4c5d6e7', 'Tinga');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('b2c3d4e5-f6a7-b8c9-d0e1-f2a3b4c5d6e7', 'Un');

-- Ex 5: Verde
INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em)
VALUES ('c3d4e5f6-a7b8-c9d0-e1f2-a3b4c5d6e7f8', 'b3e8ab21-8eb1-4d14-8f2d-8e470125e130', 'Como se diz "Verde" em Tupi?', 'MULTIPLA_ESCOLHA', 'Oby', 10, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('c3d4e5f6-a7b8-c9d0-e1f2-a3b4c5d6e7f8', 'Oby');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('c3d4e5f6-a7b8-c9d0-e1f2-a3b4c5d6e7f8', 'Yuba');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('c3d4e5f6-a7b8-c9d0-e1f2-a3b4c5d6e7f8', 'Pytã');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('c3d4e5f6-a7b8-c9d0-e1f2-a3b4c5d6e7f8', 'Un');
