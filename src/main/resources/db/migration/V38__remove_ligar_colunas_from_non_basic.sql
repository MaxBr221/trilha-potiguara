DO $$
DECLARE
    rec_licao RECORD;
BEGIN
    FOR rec_licao IN (
        SELECT l.id 
        FROM licoes l
        JOIN modulos m ON l.modulo_id = m.id
        WHERE m.trilha_id != '22222222-2222-2222-2222-222222222222'
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
