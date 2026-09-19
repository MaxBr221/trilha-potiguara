-- Limpa as alternativas múltiplas nas opções de exercício, mantendo apenas a primeira palavra/frase.
-- Remove tudo após ponto e vírgula (;), vírgula (,) ou barra (/)

UPDATE exercicio_opcoes
SET opcao = TRIM(SPLIT_PART(SPLIT_PART(SPLIT_PART(opcao, ';', 1), ',', 1), '/', 1))
WHERE opcao LIKE '%;%' OR opcao LIKE '%,%' OR opcao LIKE '%/%';

-- Faz o mesmo para a coluna de resposta_correta na tabela de exercícios
UPDATE exercicios
SET resposta_correta = TRIM(SPLIT_PART(SPLIT_PART(SPLIT_PART(resposta_correta, ';', 1), ',', 1), '/', 1))
WHERE resposta_correta LIKE '%;%' OR resposta_correta LIKE '%,%' OR resposta_correta LIKE '%/%';
