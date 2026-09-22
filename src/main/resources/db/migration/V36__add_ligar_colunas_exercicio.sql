-- 1. Deslocar os exercícios existentes da Lição 1 (Bom dia e Boa tarde) para baixo, abrindo espaço no index 1
UPDATE exercicios
SET ordem_index = ordem_index + 1
WHERE licao_id = '44444444-4444-4444-4444-444444444441';

-- 2. Inserir o novo exercício de LIGAR_COLUNAS no início (index 1)
INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em)
VALUES ('66666666-6666-6666-6666-666666666660', '44444444-4444-4444-4444-444444444441', 'Ligue as saudações às suas traduções para começar!', 'LIGAR_COLUNAS', 'Ko''ẽ porã:Bom dia,Ka''aru porã:Boa tarde,Pyhare porã:Boa noite', 10, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 3. Inserir as opções (o frontend vai receber essas opções, separar pelo ':' e embaralhar os lados)
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('66666666-6666-6666-6666-666666666660', 'Ko''ẽ porã:Bom dia');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('66666666-6666-6666-6666-666666666660', 'Ka''aru porã:Boa tarde');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('66666666-6666-6666-6666-666666666660', 'Pyhare porã:Boa noite');
