-- ==========================================
-- V28: Adição de Exercícios para Módulo 2 (Números) e Novos Módulos na Trilha 1
-- ==========================================

-- ----------------------------------------------------------------------
-- 1. EXERCÍCIOS PARA MÓDULO 2 - LIÇÃO 1: NÚMEROS DE 1 A 5
-- Lição_id existente: '44444444-4444-4444-4444-444444444443'
-- ----------------------------------------------------------------------

-- Ex 1: Um
INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em)
VALUES ('1e9d7c49-0d17-48f1-9b16-953e5e1c4e78', '44444444-4444-4444-4444-444444444443', 'Como se diz "Um" em Tupi?', 'MULTIPLA_ESCOLHA', 'Oîepé', 10, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('1e9d7c49-0d17-48f1-9b16-953e5e1c4e78', 'Oîepé'), ('1e9d7c49-0d17-48f1-9b16-953e5e1c4e78', 'Mokõi'), ('1e9d7c49-0d17-48f1-9b16-953e5e1c4e78', 'Mosapyr'), ('1e9d7c49-0d17-48f1-9b16-953e5e1c4e78', 'Irundy');

-- Ex 2: Dois
INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em)
VALUES ('a3b7d1e8-78c9-4b3d-b4f2-981e7d2c3a5f', '44444444-4444-4444-4444-444444444443', 'Como se diz "Dois" em Tupi?', 'MULTIPLA_ESCOLHA', 'Mokõi', 10, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('a3b7d1e8-78c9-4b3d-b4f2-981e7d2c3a5f', 'Oîepé'), ('a3b7d1e8-78c9-4b3d-b4f2-981e7d2c3a5f', 'Mokõi'), ('a3b7d1e8-78c9-4b3d-b4f2-981e7d2c3a5f', 'Neĩra'), ('a3b7d1e8-78c9-4b3d-b4f2-981e7d2c3a5f', 'Irundy');

-- Ex 3: Três
INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em)
VALUES ('5f9e2c4b-8d1e-4c7b-a3b1-7f9e8d2c4a6b', '44444444-4444-4444-4444-444444444443', 'Como se diz "Três" em Tupi?', 'MULTIPLA_ESCOLHA', 'Mosapyr', 10, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('5f9e2c4b-8d1e-4c7b-a3b1-7f9e8d2c4a6b', 'Mosapyr'), ('5f9e2c4b-8d1e-4c7b-a3b1-7f9e8d2c4a6b', 'Mokõi'), ('5f9e2c4b-8d1e-4c7b-a3b1-7f9e8d2c4a6b', 'Pytã'), ('5f9e2c4b-8d1e-4c7b-a3b1-7f9e8d2c4a6b', 'Irundy');

-- Ex 4: Quatro
INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em)
VALUES ('8c2d1e9f-4a3b-4c7d-b5f6-1e9d8c4b2a3f', '44444444-4444-4444-4444-444444444443', 'Como se diz "Quatro" em Tupi?', 'MULTIPLA_ESCOLHA', 'Irundy', 10, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('8c2d1e9f-4a3b-4c7d-b5f6-1e9d8c4b2a3f', 'Neĩra'), ('8c2d1e9f-4a3b-4c7d-b5f6-1e9d8c4b2a3f', 'Mokõi'), ('8c2d1e9f-4a3b-4c7d-b5f6-1e9d8c4b2a3f', 'Mosapyr'), ('8c2d1e9f-4a3b-4c7d-b5f6-1e9d8c4b2a3f', 'Irundy');


-- ----------------------------------------------------------------------
-- 2. NOVOS MÓDULOS PARA TRILHA 1 ('22222222-2222-2222-2222-222222222222')
-- ----------------------------------------------------------------------

-- MÓDULO 3: CORES
INSERT INTO modulos (id, titulo, descricao, ordem_index, trilha_id, criado_em, atualizado_em)
VALUES ('9d8a3a0e-4b47-4183-b715-f5ab2d5d8868', 'Módulo 3: Cores', 'Aprenda as cores básicas em Tupi.', 3, '22222222-2222-2222-2222-222222222222', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO licoes (id, titulo, descricao, ordem_index, modulo_id, criado_em, atualizado_em)
VALUES ('b3e8ab21-8eb1-4d14-8f2d-8e470125e130', 'Lição 1: Cores da Natureza', 'Como descrever as cores das coisas.', 1, '9d8a3a0e-4b47-4183-b715-f5ab2d5d8868', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em)
VALUES ('2f1e9d7c-490d-48f1-9b16-953e5e1c4e78', 'b3e8ab21-8eb1-4d14-8f2d-8e470125e130', 'Como se diz "Vermelho" em Tupi?', 'MULTIPLA_ESCOLHA', 'Pytã', 10, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('2f1e9d7c-490d-48f1-9b16-953e5e1c4e78', 'Pytã'), ('2f1e9d7c-490d-48f1-9b16-953e5e1c4e78', 'Tinga'), ('2f1e9d7c-490d-48f1-9b16-953e5e1c4e78', 'Un'), ('2f1e9d7c-490d-48f1-9b16-953e5e1c4e78', 'Yuba');

INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em)
VALUES ('3b7d1e8a-78c9-4b3d-b4f2-981e7d2c3a5f', 'b3e8ab21-8eb1-4d14-8f2d-8e470125e130', 'Como se diz "Branco" em Tupi?', 'MULTIPLA_ESCOLHA', 'Tinga', 10, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('3b7d1e8a-78c9-4b3d-b4f2-981e7d2c3a5f', 'Pytã'), ('3b7d1e8a-78c9-4b3d-b4f2-981e7d2c3a5f', 'Tinga'), ('3b7d1e8a-78c9-4b3d-b4f2-981e7d2c3a5f', 'Un'), ('3b7d1e8a-78c9-4b3d-b4f2-981e7d2c3a5f', 'Yuba');

INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em)
VALUES ('4e2c4b5f-8d1e-4c7b-a3b1-7f9e8d2c4a6b', 'b3e8ab21-8eb1-4d14-8f2d-8e470125e130', 'Como se diz "Preto" em Tupi?', 'MULTIPLA_ESCOLHA', 'Un', 10, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('4e2c4b5f-8d1e-4c7b-a3b1-7f9e8d2c4a6b', 'Pytã'), ('4e2c4b5f-8d1e-4c7b-a3b1-7f9e8d2c4a6b', 'Tinga'), ('4e2c4b5f-8d1e-4c7b-a3b1-7f9e8d2c4a6b', 'Un'), ('4e2c4b5f-8d1e-4c7b-a3b1-7f9e8d2c4a6b', 'Yuba');


-- MÓDULO 4: FAMÍLIA
INSERT INTO modulos (id, titulo, descricao, ordem_index, trilha_id, criado_em, atualizado_em)
VALUES ('f19f17a9-9fc6-403d-8f20-94d4d3d22b62', 'Módulo 4: A Família', 'Aprenda a falar sobre seus entes queridos.', 4, '22222222-2222-2222-2222-222222222222', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO licoes (id, titulo, descricao, ordem_index, modulo_id, criado_em, atualizado_em)
VALUES ('d7b4e9f9-e3b9-4a0b-93cd-5d63f0d5a3ef', 'Lição 1: Pais e Filhos', 'Mãe, Pai, Filho, Filha.', 1, 'f19f17a9-9fc6-403d-8f20-94d4d3d22b62', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em)
VALUES ('5d1e9f8c-4a3b-4c7d-b5f6-1e9d8c4b2a3f', 'd7b4e9f9-e3b9-4a0b-93cd-5d63f0d5a3ef', 'Como se diz "Mãe" em Tupi?', 'MULTIPLA_ESCOLHA', 'Sy', 10, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('5d1e9f8c-4a3b-4c7d-b5f6-1e9d8c4b2a3f', 'Sy'), ('5d1e9f8c-4a3b-4c7d-b5f6-1e9d8c4b2a3f', 'Tuba'), ('5d1e9f8c-4a3b-4c7d-b5f6-1e9d8c4b2a3f', 'Ta''yra'), ('5d1e9f8c-4a3b-4c7d-b5f6-1e9d8c4b2a3f', 'Mena');

INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em)
VALUES ('6e9d7c49-0d17-48f1-9b16-953e5e1c4e78', 'd7b4e9f9-e3b9-4a0b-93cd-5d63f0d5a3ef', 'Como se diz "Pai" em Tupi?', 'MULTIPLA_ESCOLHA', 'Tuba', 10, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('6e9d7c49-0d17-48f1-9b16-953e5e1c4e78', 'Sy'), ('6e9d7c49-0d17-48f1-9b16-953e5e1c4e78', 'Tuba'), ('6e9d7c49-0d17-48f1-9b16-953e5e1c4e78', 'Ta''yra'), ('6e9d7c49-0d17-48f1-9b16-953e5e1c4e78', 'Kyba');
