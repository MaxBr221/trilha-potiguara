DO $$
DECLARE
    rec_licao RECORD;
    v_palavra_tupi VARCHAR;
    v_traducao_ptbr VARCHAR;
    v_resposta_correta TEXT;
    v_exercicio_id UUID;
    v_count INT;
    p RECORD;
BEGIN
    FOR rec_licao IN SELECT id FROM licoes LOOP
        v_resposta_correta := '';
        v_count := 0;
        
        -- Verifica se a lição já possui um exercício de LIGAR_COLUNAS para não duplicar (ex: o da V36)
        IF NOT EXISTS (SELECT 1 FROM exercicios WHERE licao_id = rec_licao.id AND tipo = 'LIGAR_COLUNAS') THEN
            
            -- Constroi a resposta correta concatenada baseada no conteudo da lição
            FOR p IN (SELECT cl.palavra_tupi, cl.traducao_ptbr
                      FROM licao_conteudo lc
                      JOIN conteudos_linguisticos cl ON lc.conteudo_id = cl.id
                      WHERE lc.licao_id = rec_licao.id
                      LIMIT 5) LOOP
                IF v_count > 0 THEN
                    v_resposta_correta := v_resposta_correta || ',';
                END IF;
                v_resposta_correta := v_resposta_correta || p.palavra_tupi || ':' || p.traducao_ptbr;
                v_count := v_count + 1;
            END LOOP;
            
            -- Se a lição tem vocabulário associado, criamos o exercício
            IF v_count > 0 THEN
                
                -- Desloca todos os exercícios atuais 1 posição para frente
                UPDATE exercicios SET ordem_index = ordem_index + 1 WHERE licao_id = rec_licao.id;
                
                v_exercicio_id := gen_random_uuid();
                
                -- Insere o novo exercício LIGAR_COLUNAS no início (index 1)
                INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em)
                VALUES (v_exercicio_id, rec_licao.id, 'Ligue as palavras às suas traduções para começar!', 'LIGAR_COLUNAS', v_resposta_correta, 10, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
                
                -- Insere as opções (os pares tupi:portugues)
                FOR p IN (SELECT cl.palavra_tupi, cl.traducao_ptbr
                          FROM licao_conteudo lc
                          JOIN conteudos_linguisticos cl ON lc.conteudo_id = cl.id
                          WHERE lc.licao_id = rec_licao.id
                          LIMIT 5) LOOP
                    INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES (v_exercicio_id, p.palavra_tupi || ':' || p.traducao_ptbr);
                END LOOP;
            END IF;
        END IF;
    END LOOP;
END $$;
