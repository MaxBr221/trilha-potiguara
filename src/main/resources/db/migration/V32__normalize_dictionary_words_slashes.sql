-- V32: Limpeza e normalização de palavras separadas por barra (/) ou ponto e vírgula (;)

DO $$ 
DECLARE
    r RECORD;
    new_id UUID;
    palavra VARCHAR;
    existing_id UUID;
BEGIN
    -- Busca todos os registros que contêm barra '/' ou ponto-e-vírgula ';'
    FOR r IN SELECT id, palavra_tupi, traducao_ptbr, fonetica, tipo 
             FROM conteudos_linguisticos 
             WHERE palavra_tupi LIKE '%/%' OR palavra_tupi LIKE '%;%' LOOP
             
        -- Normaliza o separador para barra para podermos fatiar a string
        FOREACH palavra IN ARRAY string_to_array(replace(r.palavra_tupi, ';', '/'), '/') LOOP
            palavra := trim(palavra);
            
            IF palavra != '' THEN
                -- Como a V31 criou um UNIQUE INDEX no lower(palavra_tupi),
                -- precisamos verificar se a palavra "fatiada" já existe no banco antes de inseri-la
                SELECT id INTO existing_id FROM conteudos_linguisticos WHERE lower(palavra_tupi) = lower(palavra) LIMIT 1;
                
                IF existing_id IS NULL THEN
                    new_id := gen_random_uuid();
                    
                    -- Inserir a palavra nova separada
                    INSERT INTO conteudos_linguisticos (id, palavra_tupi, traducao_ptbr, fonetica, tipo)
                    VALUES (new_id, palavra, r.traducao_ptbr, r.fonetica, r.tipo);
                    
                    -- Copiar as ligações de licao_conteudo para o novo id
                    INSERT INTO licao_conteudo (licao_id, conteudo_id)
                    SELECT licao_id, new_id FROM licao_conteudo WHERE conteudo_id = r.id
                    ON CONFLICT DO NOTHING;
                ELSE
                    -- Se já existe, apenas transferimos as ligações das lições para o ID existente
                    INSERT INTO licao_conteudo (licao_id, conteudo_id)
                    SELECT licao_id, existing_id FROM licao_conteudo WHERE conteudo_id = r.id
                    ON CONFLICT DO NOTHING;
                END IF;
            END IF;
        END LOOP;
        
        -- Deletar o registro original agrupado
        DELETE FROM conteudos_linguisticos WHERE id = r.id;
    END LOOP;
END $$;
