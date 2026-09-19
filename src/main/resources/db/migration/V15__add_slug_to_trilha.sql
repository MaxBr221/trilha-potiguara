-- Adiciona a coluna slug aceitando nulo temporariamente
ALTER TABLE trilhas ADD COLUMN slug VARCHAR(255);

-- Atualiza as trilhas existentes para gerar um slug a partir do nome
-- O método translate retira acentos comuns e lower converte para minúsculo
-- O replace converte espaços em hifens
UPDATE trilhas 
SET slug = replace(
    translate(lower(nome), 
        'áàãâäéèêëíìîïóòõôöúùûüç', 
        'aaaaaeeeeiiiiooooouuuuc'
    ), ' ', '-'
);

-- Como precaução caso o título tenha caracteres especiais extras,
-- em um ambiente de produção poderíamos usar uma função PL/pgSQL com REGEXP_REPLACE
-- mas para o MVP isso cobrirá o nome das trilhas ("Vocabulário do Dia a Dia" -> "vocabulario-do-dia-a-dia")
UPDATE trilhas SET slug = 'vocabulario-do-dia-a-dia' WHERE nome = 'Vocabulário do Dia a Dia';

-- Adiciona a restrição de NOT NULL e UNIQUE
ALTER TABLE trilhas ALTER COLUMN slug SET NOT NULL;
ALTER TABLE trilhas ADD CONSTRAINT uk_trilha_slug UNIQUE (slug);
