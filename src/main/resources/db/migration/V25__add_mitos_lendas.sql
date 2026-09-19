UPDATE trilhas SET status = 'PUBLISHED' WHERE id = '22222222-2222-2222-2222-222222222224';

-- ==========================================
-- MÓDULO 1: Curupira
-- ==========================================
INSERT INTO modulos (id, titulo, descricao, ordem_index, trilha_id, criado_em, atualizado_em)
VALUES ('99999999-9999-9999-9999-999999999901', 'Módulo 1: Curupira (Guardião)', 'Conheça o vocabulário do protetor das florestas.', 1, '22222222-2222-2222-2222-222222222224', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO licoes (id, titulo, descricao, ordem_index, modulo_id, criado_em, atualizado_em)
VALUES ('99999999-9999-9999-9999-999999999902', 'Lição 1: A Floresta e o Guardião', 'Aprenda palavras ligadas à natureza e proteção.', 1, '99999999-9999-9999-9999-999999999901', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Conteúdos Linguísticos (Curupira)
INSERT INTO conteudos_linguisticos (id, palavra_tupi, traducao_ptbr, fonetica, tipo, criado_em, atualizado_em) VALUES 
('99999999-9999-9999-9999-999999999903', 'ka''a', 'floresta / mato', 'ka''a', 'PALAVRA', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('99999999-9999-9999-9999-999999999904', 'py', 'pé', 'py', 'PALAVRA', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('99999999-9999-9999-9999-999999999905', 'mo''ã', 'proteger / defender', 'mo''ã', 'PALAVRA', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Relacionar conteúdos com a lição
INSERT INTO licao_conteudo (licao_id, conteudo_id) VALUES 
('99999999-9999-9999-9999-999999999902', '99999999-9999-9999-9999-999999999903'),
('99999999-9999-9999-9999-999999999902', '99999999-9999-9999-9999-999999999904'),
('99999999-9999-9999-9999-999999999902', '99999999-9999-9999-9999-999999999905');

-- Exercícios (Curupira)
INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em) VALUES 
('99999999-9999-9999-9999-999999999911', '99999999-9999-9999-9999-999999999902', 'Como se diz "floresta / mato" em Tupi?', 'MULTIPLA_ESCOLHA', 'ka''a', 10, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('99999999-9999-9999-9999-999999999912', '99999999-9999-9999-9999-999999999902', 'O que significa a palavra "ka''a" em português?', 'MULTIPLA_ESCOLHA', 'floresta / mato', 10, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('99999999-9999-9999-9999-999999999913', '99999999-9999-9999-9999-999999999902', 'Como se diz "pé" em Tupi?', 'MULTIPLA_ESCOLHA', 'py', 10, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('99999999-9999-9999-9999-999999999914', '99999999-9999-9999-9999-999999999902', 'O que significa a palavra "py" em português?', 'MULTIPLA_ESCOLHA', 'pé', 10, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('99999999-9999-9999-9999-999999999915', '99999999-9999-9999-9999-999999999902', 'Como se diz "proteger / defender" em Tupi?', 'MULTIPLA_ESCOLHA', 'mo''ã', 10, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('99999999-9999-9999-9999-999999999916', '99999999-9999-9999-9999-999999999902', 'O que significa a palavra "mo''ã" em português?', 'MULTIPLA_ESCOLHA', 'proteger / defender', 10, 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Opções Exercicio 1
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES 
('99999999-9999-9999-9999-999999999911', 'ka''a'), ('99999999-9999-9999-9999-999999999911', 'py'), ('99999999-9999-9999-9999-999999999911', 'mo''ã'), ('99999999-9999-9999-9999-999999999911', 'taba');

-- Opções Exercicio 2
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES 
('99999999-9999-9999-9999-999999999912', 'floresta / mato'), ('99999999-9999-9999-9999-999999999912', 'pé'), ('99999999-9999-9999-9999-999999999912', 'proteger / defender'), ('99999999-9999-9999-9999-999999999912', 'aldeia');

-- Opções Exercicio 3
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES 
('99999999-9999-9999-9999-999999999913', 'py'), ('99999999-9999-9999-9999-999999999913', 'po'), ('99999999-9999-9999-9999-999999999913', 'akanga'), ('99999999-9999-9999-9999-999999999913', 'sy');

-- Opções Exercicio 4
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES 
('99999999-9999-9999-9999-999999999914', 'pé'), ('99999999-9999-9999-9999-999999999914', 'mão'), ('99999999-9999-9999-9999-999999999914', 'cabeça'), ('99999999-9999-9999-9999-999999999914', 'mãe');

-- Opções Exercicio 5
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES 
('99999999-9999-9999-9999-999999999915', 'mo''ã'), ('99999999-9999-9999-9999-999999999915', 'ker'), ('99999999-9999-9999-9999-999999999915', '''u'), ('99999999-9999-9999-9999-999999999915', 'nhe''eng');

-- Opções Exercicio 6
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES 
('99999999-9999-9999-9999-999999999916', 'proteger / defender'), ('99999999-9999-9999-9999-999999999916', 'dormir'), ('99999999-9999-9999-9999-999999999916', 'comer'), ('99999999-9999-9999-9999-999999999916', 'cantar / falar');


-- ==========================================
-- MÓDULO 2: Iara
-- ==========================================
INSERT INTO modulos (id, titulo, descricao, ordem_index, trilha_id, criado_em, atualizado_em)
VALUES ('99999999-9999-9999-9999-999999999906', 'Módulo 2: Iara (Mãe d''Água)', 'Descubra as palavras da sereia dos rios.', 2, '22222222-2222-2222-2222-222222222224', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO licoes (id, titulo, descricao, ordem_index, modulo_id, criado_em, atualizado_em)
VALUES ('99999999-9999-9999-9999-999999999907', 'Lição 1: O Rio e a Voz', 'Aprenda palavras sobre rios, mulheres e canto.', 1, '99999999-9999-9999-9999-999999999906', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Conteúdos Linguísticos (Iara)
INSERT INTO conteudos_linguisticos (id, palavra_tupi, traducao_ptbr, fonetica, tipo, criado_em, atualizado_em) VALUES 
('99999999-9999-9999-9999-999999999908', '''y', 'rio / água', '''y', 'PALAVRA', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('99999999-9999-9999-9999-999999999909', 'cunhã', 'mulher', 'cunhã', 'PALAVRA', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('99999999-9999-9999-9999-999999999910', 'nhe''eng', 'cantar / falar', 'nhe''eng', 'PALAVRA', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Relacionar conteúdos com a lição
INSERT INTO licao_conteudo (licao_id, conteudo_id) VALUES 
('99999999-9999-9999-9999-999999999907', '99999999-9999-9999-9999-999999999908'),
('99999999-9999-9999-9999-999999999907', '99999999-9999-9999-9999-999999999909'),
('99999999-9999-9999-9999-999999999907', '99999999-9999-9999-9999-999999999910');

-- Exercícios (Iara)
INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em) VALUES 
('99999999-9999-9999-9999-999999999917', '99999999-9999-9999-9999-999999999907', 'Como se diz "rio / água" em Tupi?', 'MULTIPLA_ESCOLHA', '''y', 10, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('99999999-9999-9999-9999-999999999918', '99999999-9999-9999-9999-999999999907', 'O que significa a palavra "''y" em português?', 'MULTIPLA_ESCOLHA', 'rio / água', 10, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('99999999-9999-9999-9999-999999999919', '99999999-9999-9999-9999-999999999907', 'Como se diz "mulher" em Tupi?', 'MULTIPLA_ESCOLHA', 'cunhã', 10, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('99999999-9999-9999-9999-999999999920', '99999999-9999-9999-9999-999999999907', 'O que significa a palavra "cunhã" em português?', 'MULTIPLA_ESCOLHA', 'mulher', 10, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('99999999-9999-9999-9999-999999999921', '99999999-9999-9999-9999-999999999907', 'Como se diz "cantar / falar" em Tupi?', 'MULTIPLA_ESCOLHA', 'nhe''eng', 10, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('99999999-9999-9999-9999-999999999922', '99999999-9999-9999-9999-999999999907', 'O que significa a palavra "nhe''eng" em português?', 'MULTIPLA_ESCOLHA', 'cantar / falar', 10, 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Opções Exercicio 1
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES 
('99999999-9999-9999-9999-999999999917', '''y'), ('99999999-9999-9999-9999-999999999917', 'ka''a'), ('99999999-9999-9999-9999-999999999917', 'tata'), ('99999999-9999-9999-9999-999999999917', 'ybytu');

-- Opções Exercicio 2
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES 
('99999999-9999-9999-9999-999999999918', 'rio / água'), ('99999999-9999-9999-9999-999999999918', 'floresta'), ('99999999-9999-9999-9999-999999999918', 'fogo'), ('99999999-9999-9999-9999-999999999918', 'vento');

-- Opções Exercicio 3
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES 
('99999999-9999-9999-9999-999999999919', 'cunhã'), ('99999999-9999-9999-9999-999999999919', 'aba'), ('99999999-9999-9999-9999-999999999919', 'kurumim'), ('99999999-9999-9999-9999-999999999919', 'sy');

-- Opções Exercicio 4
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES 
('99999999-9999-9999-9999-999999999920', 'mulher'), ('99999999-9999-9999-9999-999999999920', 'homem'), ('99999999-9999-9999-9999-999999999920', 'criança'), ('99999999-9999-9999-9999-999999999920', 'mãe');

-- Opções Exercicio 5
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES 
('99999999-9999-9999-9999-999999999921', 'nhe''eng'), ('99999999-9999-9999-9999-999999999921', '''u'), ('99999999-9999-9999-9999-999999999921', 'ker'), ('99999999-9999-9999-9999-999999999921', 'mo''ã');

-- Opções Exercicio 6
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES 
('99999999-9999-9999-9999-999999999922', 'cantar / falar'), ('99999999-9999-9999-9999-999999999922', 'comer'), ('99999999-9999-9999-9999-999999999922', 'dormir'), ('99999999-9999-9999-9999-999999999922', 'proteger / defender');
