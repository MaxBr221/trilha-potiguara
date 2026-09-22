-- ==========================================
-- V44: Adição de exercícios de Milho e Banana na Lição 2: Plantas
-- ==========================================

-- Ex 3: Milho
INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em)
VALUES ('b3b3b3b3-c4c4-d5d5-e6e6-f7f7f7f7f701', '44444444-4444-4444-4444-444444444445', 'Como se diz "Milho" em Tupi?', 'MULTIPLA_ESCOLHA', 'Abati', 10, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('b3b3b3b3-c4c4-d5d5-e6e6-f7f7f7f7f701', 'Abati');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('b3b3b3b3-c4c4-d5d5-e6e6-f7f7f7f7f701', 'Pakoba');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('b3b3b3b3-c4c4-d5d5-e6e6-f7f7f7f7f701', 'Mani''oka');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('b3b3b3b3-c4c4-d5d5-e6e6-f7f7f7f7f701', 'Ybyrá');

-- Ex 4: Banana
INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em)
VALUES ('b3b3b3b3-c4c4-d5d5-e6e6-f7f7f7f7f702', '44444444-4444-4444-4444-444444444445', 'Como se diz "Banana" em Tupi?', 'MULTIPLA_ESCOLHA', 'Pakoba', 10, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('b3b3b3b3-c4c4-d5d5-e6e6-f7f7f7f7f702', 'Pakoba');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('b3b3b3b3-c4c4-d5d5-e6e6-f7f7f7f7f702', 'Abati');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('b3b3b3b3-c4c4-d5d5-e6e6-f7f7f7f7f702', 'Ka''a');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('b3b3b3b3-c4c4-d5d5-e6e6-f7f7f7f7f702', 'Taty');
