-- V31: Limpeza e normalização do dicionário (conteúdos linguísticos)

-- 1. Trims iniciais
UPDATE conteudos_linguisticos SET palavra_tupi = trim(palavra_tupi);

-- 2. Separar palavras agrupadas por vírgula e duplicar as relações
DO $$ 
DECLARE
    r RECORD;
    new_id UUID;
    palavra VARCHAR;
BEGIN
    FOR r IN SELECT id, palavra_tupi, traducao_ptbr, fonetica, tipo FROM conteudos_linguisticos WHERE palavra_tupi LIKE '%,%' LOOP
        FOREACH palavra IN ARRAY string_to_array(r.palavra_tupi, ',') LOOP
            palavra := trim(palavra);
            IF palavra != '' THEN
                new_id := gen_random_uuid();
                
                -- Inserir a palavra separada
                INSERT INTO conteudos_linguisticos (id, palavra_tupi, traducao_ptbr, fonetica, tipo)
                VALUES (new_id, palavra, r.traducao_ptbr, r.fonetica, r.tipo);
                
                -- Copiar as ligações de licao_conteudo para o novo id
                INSERT INTO licao_conteudo (licao_id, conteudo_id)
                SELECT licao_id, new_id FROM licao_conteudo WHERE conteudo_id = r.id
                ON CONFLICT DO NOTHING;
            END IF;
        END LOOP;
        
        -- Deletar o registro original agrupado.
        -- Como licao_conteudo possui ON DELETE CASCADE, a referência original será apagada automaticamente.
        DELETE FROM conteudos_linguisticos WHERE id = r.id;
    END LOOP;
END $$;

-- 3. Remover duplicatas exatas ou ignorando case
DO $$ 
DECLARE
    dup RECORD;
    survivor_id UUID;
BEGIN
    FOR dup IN 
        SELECT lower(palavra_tupi) as palavra_clean, array_agg(id ORDER BY criado_em ASC, id ASC) as ids
        FROM conteudos_linguisticos
        GROUP BY lower(palavra_tupi)
        HAVING count(*) > 1
    LOOP
        survivor_id := dup.ids[1]; -- O primeiro ID é o sobrevivente (mais antigo)
        
        -- Para todos os outros IDs que serão deletados
        FOR i IN 2 .. array_length(dup.ids, 1) LOOP
            
            -- Migrar ligações de lições para o sobrevivente, ignorando conflitos
            INSERT INTO licao_conteudo (licao_id, conteudo_id)
            SELECT licao_id, survivor_id 
            FROM licao_conteudo 
            WHERE conteudo_id = dup.ids[i]
            ON CONFLICT DO NOTHING;
            
            -- Deletar a palavra duplicada
            DELETE FROM conteudos_linguisticos WHERE id = dup.ids[i];
            
        END LOOP;
    END LOOP;
END $$;

-- 4. Adicionar restrição UNIQUE para evitar duplicatas no futuro usando índice lower-case
CREATE UNIQUE INDEX idx_conteudos_linguisticos_palavra_tupi_lower 
ON conteudos_linguisticos (LOWER(palavra_tupi));
