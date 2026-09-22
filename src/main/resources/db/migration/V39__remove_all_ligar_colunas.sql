DO $$
DECLARE
    rec_licao RECORD;
BEGIN
    FOR rec_licao IN (
        SELECT id FROM licoes
    ) LOOP
        -- Delete options for the LIGAR_COLUNAS exercise in this lesson
        DELETE FROM exercicio_opcoes 
        WHERE exercicio_id IN (
            SELECT id FROM exercicios 
            WHERE licao_id = rec_licao.id AND tipo = 'LIGAR_COLUNAS'
        );
        
        -- Delete the LIGAR_COLUNAS exercise itself
        DELETE FROM exercicios 
        WHERE licao_id = rec_licao.id AND tipo = 'LIGAR_COLUNAS';
        
        -- Adjust the ordem_index for the remaining exercises so there's no gap at index 1
        UPDATE exercicios 
        SET ordem_index = ordem_index - 1 
        WHERE licao_id = rec_licao.id AND ordem_index > 1;
    END LOOP;
END $$;
