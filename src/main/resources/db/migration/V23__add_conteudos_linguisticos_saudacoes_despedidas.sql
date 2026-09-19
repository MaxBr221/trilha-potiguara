-- ==========================================
-- V23: Adição/Correção no Dicionário (conteudos_linguisticos) e Lição-Conteúdo
-- ==========================================

-- 1. Atualizar "Bom dia" e "Boa tarde" existentes na Lição 1
UPDATE conteudos_linguisticos 
SET palavra_tupi = 'Tîa nde koema', fonetica = 'Tîa nde koema', atualizado_em = CURRENT_TIMESTAMP
WHERE id = '55555555-5555-5555-5555-555555555551';

UPDATE conteudos_linguisticos 
SET palavra_tupi = 'Tîa nde Karuka', fonetica = 'Tîa nde Karuka', atualizado_em = CURRENT_TIMESTAMP
WHERE id = '55555555-5555-5555-5555-555555555552';

-- 2. Inserir "Boa noite" no Dicionário e associar à Lição 1
INSERT INTO conteudos_linguisticos (id, palavra_tupi, traducao_ptbr, fonetica, tipo, criado_em, atualizado_em) 
VALUES ('55555555-5555-5555-5555-555555555553', 'Tîa nde Pytuna', 'Boa noite', 'Tîa nde Pytuna', 'EXPRESSAO', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

INSERT INTO licao_conteudo (licao_id, conteudo_id) 
VALUES ('44444444-4444-4444-4444-444444444441', '55555555-5555-5555-5555-555555555553')
ON CONFLICT DO NOTHING;

-- 3. Inserir "Tchau" e "Até logo" no Dicionário e associar à Lição 2
INSERT INTO conteudos_linguisticos (id, palavra_tupi, traducao_ptbr, fonetica, tipo, criado_em, atualizado_em) 
VALUES ('55555555-5555-5555-5555-555555555554', 'Ne’ĩ, asó ikó', 'Tchau', 'Ne’ĩ, asó ikó', 'EXPRESSAO', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

INSERT INTO licao_conteudo (licao_id, conteudo_id) 
VALUES ('44444444-4444-4444-4444-444444444442', '55555555-5555-5555-5555-555555555554')
ON CONFLICT DO NOTHING;

INSERT INTO conteudos_linguisticos (id, palavra_tupi, traducao_ptbr, fonetica, tipo, criado_em, atualizado_em) 
VALUES ('55555555-5555-5555-5555-555555555555', 'Ne’ĩ, a-îur ikó!', 'Até logo', 'Ne’ĩ, a-îur ikó!', 'EXPRESSAO', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

INSERT INTO licao_conteudo (licao_id, conteudo_id) 
VALUES ('44444444-4444-4444-4444-444444444442', '55555555-5555-5555-5555-555555555555')
ON CONFLICT DO NOTHING;
