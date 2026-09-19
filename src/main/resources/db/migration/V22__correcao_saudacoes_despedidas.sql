-- ==========================================
-- V11: Correção de Saudações (Lição 1) e Adição de Despedidas (Lição 2) - Trilha Potiguara
-- ==========================================

-- ------------------------------------------
-- 1. Lição 1: Saudações (ID: 44444444-4444-4444-4444-444444444441)
-- ------------------------------------------

-- 1.1 Correção do Exercício de "Bom dia" (Existente)
UPDATE exercicios 
SET enunciado = 'Como se diz "Bom dia" em Potiguara?',
    resposta_correta = 'Tîa nde koema',
    atualizado_em = CURRENT_TIMESTAMP
WHERE id = '66666666-6666-6666-6666-666666666661';

-- Limpar as opções erradas do exercício de Bom dia
DELETE FROM exercicio_opcoes WHERE exercicio_id = '66666666-6666-6666-6666-666666666661';

-- Inserir as 4 opções corretas para "Bom dia"
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES 
('66666666-6666-6666-6666-666666666661', 'Tîa nde koema'),
('66666666-6666-6666-6666-666666666661', 'Tîa nde Karuka'),
('66666666-6666-6666-6666-666666666661', 'Ne’ĩ, asó ikó'),
('66666666-6666-6666-6666-666666666661', 'Tîa nde Pytuna');

-- 1.2 Inserção de Exercício de "Boa tarde"
INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em) 
VALUES ('66666666-6666-6666-6666-666666666662', '44444444-4444-4444-4444-444444444441', 'Como se diz "Boa tarde" em Potiguara?', 'MULTIPLA_ESCOLHA', 'Tîa nde Karuka', 10, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO UPDATE SET resposta_correta = 'Tîa nde Karuka', enunciado = 'Como se diz "Boa tarde" em Potiguara?';

DELETE FROM exercicio_opcoes WHERE exercicio_id = '66666666-6666-6666-6666-666666666662';
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES 
('66666666-6666-6666-6666-666666666662', 'Tîa nde koema'),
('66666666-6666-6666-6666-666666666662', 'Tîa nde Karuka'),
('66666666-6666-6666-6666-666666666662', 'Tîa nde Pytuna'),
('66666666-6666-6666-6666-666666666662', 'Ne’ĩ, a-îur ikó!');

-- 1.3 Inserção de Exercício de "Boa noite"
INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em) 
VALUES ('66666666-6666-6666-6666-666666666663', '44444444-4444-4444-4444-444444444441', 'Como se diz "Boa noite" em Potiguara?', 'MULTIPLA_ESCOLHA', 'Tîa nde Pytuna', 10, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO UPDATE SET resposta_correta = 'Tîa nde Pytuna', enunciado = 'Como se diz "Boa noite" em Potiguara?';

DELETE FROM exercicio_opcoes WHERE exercicio_id = '66666666-6666-6666-6666-666666666663';
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES 
('66666666-6666-6666-6666-666666666663', 'Ne’ĩ, asó ikó'),
('66666666-6666-6666-6666-666666666663', 'Tîa nde Karuka'),
('66666666-6666-6666-6666-666666666663', 'Tîa nde koema'),
('66666666-6666-6666-6666-666666666663', 'Tîa nde Pytuna');


-- ------------------------------------------
-- 2. Lição 2: Despedidas (ID: 44444444-4444-4444-4444-444444444442)
-- ------------------------------------------

-- 2.1 Inserção de Exercício de "Tchau"
INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em) 
VALUES ('66666666-6666-6666-6666-666666666664', '44444444-4444-4444-4444-444444444442', 'Como se diz "Tchau" (Estou indo) em Potiguara?', 'MULTIPLA_ESCOLHA', 'Ne’ĩ, asó ikó', 10, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

DELETE FROM exercicio_opcoes WHERE exercicio_id = '66666666-6666-6666-6666-666666666664';
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES 
('66666666-6666-6666-6666-666666666664', 'Ne’ĩ, asó ikó'),
('66666666-6666-6666-6666-666666666664', 'Ne’ĩ, a-îur ikó!'),
('66666666-6666-6666-6666-666666666664', 'Tîa nde koema'),
('66666666-6666-6666-6666-666666666664', 'Tîa nde Karuka');


-- 2.2 Inserção de Exercício de "Até logo"
INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em) 
VALUES ('66666666-6666-6666-6666-666666666665', '44444444-4444-4444-4444-444444444442', 'Como se diz "Até logo" (Estou voltando) em Potiguara?', 'MULTIPLA_ESCOLHA', 'Ne’ĩ, a-îur ikó!', 10, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

DELETE FROM exercicio_opcoes WHERE exercicio_id = '66666666-6666-6666-6666-666666666665';
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES 
('66666666-6666-6666-6666-666666666665', 'Ne’ĩ, asó ikó'),
('66666666-6666-6666-6666-666666666665', 'Tîa nde Pytuna'),
('66666666-6666-6666-6666-666666666665', 'Tîa nde koema'),
('66666666-6666-6666-6666-666666666665', 'Ne’ĩ, a-îur ikó!');

