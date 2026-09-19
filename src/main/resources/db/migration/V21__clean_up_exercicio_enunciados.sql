-- Limpa os enunciados que contêm variações múltiplas entre aspas duplas, 
-- como 'O que significa a palavra "angaturam; katu; marangatu" em português?'
-- e 'Como se diz "fruta, árvore" em Tupi?'

UPDATE exercicios 
SET enunciado = regexp_replace(enunciado, 'a palavra "([^";,/]+)[;,/][^"]*"', 'a palavra "\1"') 
WHERE enunciado LIKE 'O que significa a palavra "%" em português?%' 
  AND (enunciado LIKE '%;%' OR enunciado LIKE '%,%' OR enunciado LIKE '%/%');

UPDATE exercicios 
SET enunciado = regexp_replace(enunciado, 'Como se diz "([^";,/]+)[;,/][^"]*"', 'Como se diz "\1"') 
WHERE enunciado LIKE 'Como se diz "%" em Tupi?%' 
  AND (enunciado LIKE '%;%' OR enunciado LIKE '%,%' OR enunciado LIKE '%/%');
