-- V33: Remoção de palavras específicas e correção de separadores nas traduções

-- 1. Deletar palavras específicas solicitadas (lidando com diferentes tipos de aspas/apóstrofos)
DELETE FROM conteudos_linguisticos 
WHERE lower(replace(palavra_tupi, '’', '''')) IN (
    'porerupuku', 
    'porerura', 
    'porombo''esaba', 
    'poroposanongaba', 
    'porosoaba', 
    'porombo''esara', 
    'ekopuku'
);

-- 2. Limpar o campo de tradução (traducao_ptbr) trocando o separador '#' por vírgula ','
-- Substitui ' # ' por ', ' para manter o espaçamento legível
UPDATE conteudos_linguisticos 
SET traducao_ptbr = replace(traducao_ptbr, ' # ', ', ')
WHERE traducao_ptbr LIKE '% # %';

-- Caso haja algum '#' grudado sem espaços
UPDATE conteudos_linguisticos 
SET traducao_ptbr = replace(traducao_ptbr, '#', ', ')
WHERE traducao_ptbr LIKE '%#%';
