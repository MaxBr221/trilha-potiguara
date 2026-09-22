-- ==========================================
-- V41: Correção ortográfica da palavra Jacaré em Tupi
-- ==========================================

-- Atualiza a resposta correta no exercício sobre o Jacaré
UPDATE exercicios 
SET resposta_correta = 'îakaré' 
WHERE resposta_correta = 'Jakare';

-- Atualiza a opção de resposta ('Jakare' para 'îakaré') em todas as alternativas
UPDATE exercicio_opcoes 
SET opcao = 'îakaré' 
WHERE opcao = 'Jakare';
