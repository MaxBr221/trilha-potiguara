-- ==========================================
-- V43: Garantir que a lição de Plantas tenha exercícios
-- ==========================================

-- Caso a lição de Plantas não exista (segurança), criar
INSERT INTO licoes (id, titulo, descricao, ordem_index, modulo_id, criado_em, atualizado_em)
SELECT '44444444-4444-4444-4444-444444444445', 'Lição 2: Plantas', 'Conheça árvore, mandioca e mais.', 2, '33333333-3333-3333-3333-333333333335', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM licoes WHERE id = '44444444-4444-4444-4444-444444444445');

-- Mover exercícios de Árvore e Mandioca da lição de Animais para Plantas (pelo enunciado)
UPDATE exercicios 
SET licao_id = '44444444-4444-4444-4444-444444444445', ordem_index = 1
WHERE licao_id = '44444444-4444-4444-4444-444444444444' AND enunciado LIKE '%Árvore%';

UPDATE exercicios 
SET licao_id = '44444444-4444-4444-4444-444444444445', ordem_index = 2
WHERE licao_id = '44444444-4444-4444-4444-444444444444' AND enunciado LIKE '%Mandioca%';

-- Se por algum motivo os exercícios não existirem, inserir novos
INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em)
SELECT 'a1a1a1a1-b2b2-c3c3-d4d4-e5e5e5e5e501', '44444444-4444-4444-4444-444444444445', 'Como se diz "Árvore" em Tupi?', 'MULTIPLA_ESCOLHA', 'Ybyrá', 10, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE licao_id = '44444444-4444-4444-4444-444444444445' AND enunciado LIKE '%Árvore%');

INSERT INTO exercicio_opcoes (exercicio_id, opcao)
SELECT 'a1a1a1a1-b2b2-c3c3-d4d4-e5e5e5e5e501', 'Ybyrá'
WHERE EXISTS (SELECT 1 FROM exercicios WHERE id = 'a1a1a1a1-b2b2-c3c3-d4d4-e5e5e5e5e501');
INSERT INTO exercicio_opcoes (exercicio_id, opcao)
SELECT 'a1a1a1a1-b2b2-c3c3-d4d4-e5e5e5e5e501', 'Caá'
WHERE EXISTS (SELECT 1 FROM exercicios WHERE id = 'a1a1a1a1-b2b2-c3c3-d4d4-e5e5e5e5e501');
INSERT INTO exercicio_opcoes (exercicio_id, opcao)
SELECT 'a1a1a1a1-b2b2-c3c3-d4d4-e5e5e5e5e501', 'Kuarahy'
WHERE EXISTS (SELECT 1 FROM exercicios WHERE id = 'a1a1a1a1-b2b2-c3c3-d4d4-e5e5e5e5e501');
INSERT INTO exercicio_opcoes (exercicio_id, opcao)
SELECT 'a1a1a1a1-b2b2-c3c3-d4d4-e5e5e5e5e501', 'Y'
WHERE EXISTS (SELECT 1 FROM exercicios WHERE id = 'a1a1a1a1-b2b2-c3c3-d4d4-e5e5e5e5e501');

INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em)
SELECT 'a1a1a1a1-b2b2-c3c3-d4d4-e5e5e5e5e502', '44444444-4444-4444-4444-444444444445', 'Como se diz "Mandioca" em Tupi?', 'MULTIPLA_ESCOLHA', 'Mani''oka', 10, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE licao_id = '44444444-4444-4444-4444-444444444445' AND enunciado LIKE '%Mandioca%');

INSERT INTO exercicio_opcoes (exercicio_id, opcao)
SELECT 'a1a1a1a1-b2b2-c3c3-d4d4-e5e5e5e5e502', 'Mani''oka'
WHERE EXISTS (SELECT 1 FROM exercicios WHERE id = 'a1a1a1a1-b2b2-c3c3-d4d4-e5e5e5e5e502');
INSERT INTO exercicio_opcoes (exercicio_id, opcao)
SELECT 'a1a1a1a1-b2b2-c3c3-d4d4-e5e5e5e5e502', 'Taty'
WHERE EXISTS (SELECT 1 FROM exercicios WHERE id = 'a1a1a1a1-b2b2-c3c3-d4d4-e5e5e5e5e502');
INSERT INTO exercicio_opcoes (exercicio_id, opcao)
SELECT 'a1a1a1a1-b2b2-c3c3-d4d4-e5e5e5e5e502', 'Pakoba'
WHERE EXISTS (SELECT 1 FROM exercicios WHERE id = 'a1a1a1a1-b2b2-c3c3-d4d4-e5e5e5e5e502');
INSERT INTO exercicio_opcoes (exercicio_id, opcao)
SELECT 'a1a1a1a1-b2b2-c3c3-d4d4-e5e5e5e5e502', 'Abati'
WHERE EXISTS (SELECT 1 FROM exercicios WHERE id = 'a1a1a1a1-b2b2-c3c3-d4d4-e5e5e5e5e502');

-- Reordenar exercícios restantes na lição de Animais
-- Recalcular ordem_index para todos os exercícios da lição de Animais
DO $$
DECLARE
    rec RECORD;
    idx INT := 1;
BEGIN
    FOR rec IN (
        SELECT id FROM exercicios 
        WHERE licao_id = '44444444-4444-4444-4444-444444444444' 
        ORDER BY ordem_index ASC
    ) LOOP
        UPDATE exercicios SET ordem_index = idx WHERE id = rec.id;
        idx := idx + 1;
    END LOOP;
END $$;
