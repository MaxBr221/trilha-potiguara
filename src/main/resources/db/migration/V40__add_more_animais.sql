-- ==========================================
-- V40: Adição de mais Exercícios de Animais (Macaco, Cobra, Anta)
-- ==========================================

-- Lição: '44444444-4444-4444-4444-444444444444' (Lição 1: Animais)

-- Ex 5: Macaco
INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em)
VALUES ('77777777-7777-7777-7777-777777777775', '44444444-4444-4444-4444-444444444444', 'Como se diz "Macaco" em Tupi?', 'MULTIPLA_ESCOLHA', 'Ka''i', 10, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('77777777-7777-7777-7777-777777777775', 'Ka''i');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('77777777-7777-7777-7777-777777777775', 'Tatu');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('77777777-7777-7777-7777-777777777775', 'Ambo');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('77777777-7777-7777-7777-777777777775', 'Gûyrá');

-- Ex 6: Cobra
INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em)
VALUES ('77777777-7777-7777-7777-777777777776', '44444444-4444-4444-4444-444444444444', 'Como se diz "Cobra" em Tupi?', 'MULTIPLA_ESCOLHA', 'Mbo''i', 10, 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('77777777-7777-7777-7777-777777777776', 'Mbo''i');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('77777777-7777-7777-7777-777777777776', 'Kururu');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('77777777-7777-7777-7777-777777777776', 'Pira');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('77777777-7777-7777-7777-777777777776', 'Tapi''ira');

-- Ex 7: Anta
INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em)
VALUES ('77777777-7777-7777-7777-777777777777', '44444444-4444-4444-4444-444444444444', 'Como se diz "Anta" em Tupi?', 'MULTIPLA_ESCOLHA', 'Tapi''ira', 10, 7, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('77777777-7777-7777-7777-777777777777', 'Tapi''ira');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('77777777-7777-7777-7777-777777777777', 'So''o');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('77777777-7777-7777-7777-777777777777', 'Jakare');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('77777777-7777-7777-7777-777777777777', 'Ybytu');
