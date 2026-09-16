-- Limpeza prévia para garantir que o seed não dê erro de duplicidade se rodado várias vezes
DELETE FROM usuario_conquistas;
DELETE FROM conquistas;
DELETE FROM exercicio_opcoes;
DELETE FROM exercicios;
DELETE FROM licao_conteudo;
DELETE FROM conteudos_linguisticos;
DELETE FROM progresso_usuario_licao;
DELETE FROM licoes;
DELETE FROM modulos;
DELETE FROM trilhas;
DELETE FROM usuarios;

-- ==========================================
-- 1. Criação do Usuário (Com XP e Sequência para testar Dashboard/Conquistas)
-- ==========================================
INSERT INTO usuarios (id, nome, email, senha, perfil, xp, sequencia_atual, criado_em, atualizado_em)
VALUES ('11111111-1111-1111-1111-111111111111', 'João Testador', 'teste@tupi.com', '$2a$10$wY.d0jXvG/0Z2Yw3x0Z2Yw3x0Z2Yw3x0Z2Yw3x0Z2Yw3x', 'ALUNO', 1500, 7, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO usuarios (id, nome, email, senha, perfil, xp, sequencia_atual, criado_em, atualizado_em)
VALUES ('11111111-1111-1111-1111-111111111112', 'Maxuel Lima', 'maxsuel.lima@dcx.ufpb.br', '$2a$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGg1T4yC', 'ALUNO', 2500, 12, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ==========================================
-- 2. Criação das Trilhas de Aprendizado
-- ==========================================
-- Trilha 1: Básica (PUBLISHED)
INSERT INTO trilhas (id, nome, descricao, status, criado_em, atualizado_em)
VALUES ('22222222-2222-2222-2222-222222222222', 'Trilha Potiguara Básica', 'Aprenda os conceitos básicos da língua e cultura Potiguara. Ideal para iniciantes.', 'PUBLISHED', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Trilha 2: Intermediária (PUBLISHED)
INSERT INTO trilhas (id, nome, descricao, status, criado_em, atualizado_em)
VALUES ('22222222-2222-2222-2222-222222222223', 'Vocabulário do Dia a Dia', 'Aprofunde seu conhecimento com palavras usadas no cotidiano.', 'PUBLISHED', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Trilha 3: Avançada/Cultura (DRAFT - Para testar como aparece no frontend)
INSERT INTO trilhas (id, nome, descricao, status, criado_em, atualizado_em)
VALUES ('22222222-2222-2222-2222-222222222224', 'Mitos e Lendas Tupi', 'Explore a rica cultura por trás da língua.', 'DRAFT', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


-- ==========================================
-- 3. Módulos e Lições (Trilha 1)
-- ==========================================
-- Módulo 1 (Trilha 1)
INSERT INTO modulos (id, titulo, descricao, ordem_index, trilha_id, criado_em, atualizado_em)
VALUES ('33333333-3333-3333-3333-333333333333', 'Módulo 1: Saudações', 'Aprenda como cumprimentar as pessoas.', 1, '22222222-2222-2222-2222-222222222222', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Módulo 2 (Trilha 1)
INSERT INTO modulos (id, titulo, descricao, ordem_index, trilha_id, criado_em, atualizado_em)
VALUES ('33333333-3333-3333-3333-333333333334', 'Módulo 2: Números', 'Aprenda a contar em Tupi-Guarani.', 2, '22222222-2222-2222-2222-222222222222', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Lição 1 (Módulo 1)
INSERT INTO licoes (id, titulo, descricao, ordem_index, modulo_id, criado_em, atualizado_em)
VALUES ('44444444-4444-4444-4444-444444444441', 'Lição 1: Bom dia e Boa tarde', 'Nesta lição, você aprenderá as saudações iniciais.', 1, '33333333-3333-3333-3333-333333333333', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Lição 2 (Módulo 1)
INSERT INTO licoes (id, titulo, descricao, ordem_index, modulo_id, criado_em, atualizado_em)
VALUES ('44444444-4444-4444-4444-444444444442', 'Lição 2: Despedidas', 'Como dizer tchau e até logo.', 2, '33333333-3333-3333-3333-333333333333', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Lição 1 (Módulo 2)
INSERT INTO licoes (id, titulo, descricao, ordem_index, modulo_id, criado_em, atualizado_em)
VALUES ('44444444-4444-4444-4444-444444444443', 'Lição 1: De 1 a 5', 'Contando os primeiros números.', 1, '33333333-3333-3333-3333-333333333334', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


-- ==========================================
-- 4. Módulos e Lições (Trilha 2)
-- ==========================================
INSERT INTO modulos (id, titulo, descricao, ordem_index, trilha_id, criado_em, atualizado_em)
VALUES ('33333333-3333-3333-3333-333333333335', 'Módulo 1: Natureza', 'Nomes de animais e plantas.', 1, '22222222-2222-2222-2222-222222222223', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO licoes (id, titulo, descricao, ordem_index, modulo_id, criado_em, atualizado_em)
VALUES ('44444444-4444-4444-4444-444444444444', 'Lição 1: Animais', 'Conheça onça, jacaré e outros.', 1, '33333333-3333-3333-3333-333333333335', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


-- ==========================================
-- 5. Conteúdos Linguísticos (Palavras/Frases)
-- ==========================================
INSERT INTO conteudos_linguisticos (id, palavra_tupi, traducao_ptbr, fonetica, tipo, criado_em, atualizado_em)
VALUES ('55555555-5555-5555-5555-555555555551', 'Ko''ẽ porã', 'Bom dia', 'ko-ẽ po-rã', 'FRASE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO conteudos_linguisticos (id, palavra_tupi, traducao_ptbr, fonetica, tipo, criado_em, atualizado_em)
VALUES ('55555555-5555-5555-5555-555555555552', 'Ka''aru porã', 'Boa tarde', 'ka-a-ru po-rã', 'FRASE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO conteudos_linguisticos (id, palavra_tupi, traducao_ptbr, fonetica, tipo, criado_em, atualizado_em)
VALUES ('55555555-5555-5555-5555-555555555553', 'Jaguarete', 'Onça', 'ja-gua-re-te', 'PALAVRA', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Vinculando Conteúdos às Lições
INSERT INTO licao_conteudo (licao_id, conteudo_id) VALUES ('44444444-4444-4444-4444-444444444441', '55555555-5555-5555-5555-555555555551');
INSERT INTO licao_conteudo (licao_id, conteudo_id) VALUES ('44444444-4444-4444-4444-444444444441', '55555555-5555-5555-5555-555555555552');
INSERT INTO licao_conteudo (licao_id, conteudo_id) VALUES ('44444444-4444-4444-4444-444444444444', '55555555-5555-5555-5555-555555555553');


-- ==========================================
-- 6. Exercícios
-- ==========================================
INSERT INTO exercicios (id, licao_id, enunciado, tipo, resposta_correta, pontuacao_xp, ordem_index, criado_em, atualizado_em)
VALUES ('66666666-6666-6666-6666-666666666661', '44444444-4444-4444-4444-444444444441', 'Como se diz "Bom dia" em Potiguara?', 'MULTIPLA_ESCOLHA', 'Ko''ẽ porã', 10, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('66666666-6666-6666-6666-666666666661', 'Ko''ẽ porã');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('66666666-6666-6666-6666-666666666661', 'Ka''aru porã');
INSERT INTO exercicio_opcoes (exercicio_id, opcao) VALUES ('66666666-6666-6666-6666-666666666661', 'Pyhare porã');


-- ==========================================
-- 7. Progresso do Usuário (Para testar o Dashboard de Progresso)
-- ==========================================
-- O usuário já concluiu as duas primeiras lições da Trilha 1
INSERT INTO progresso_usuario_licao (id, usuario_id, licao_id, data_conclusao)
VALUES ('77777777-7777-7777-7777-777777777771', '11111111-1111-1111-1111-111111111111', '44444444-4444-4444-4444-444444444441', CURRENT_TIMESTAMP - INTERVAL '2 days');

INSERT INTO progresso_usuario_licao (id, usuario_id, licao_id, data_conclusao)
VALUES ('77777777-7777-7777-7777-777777777772', '11111111-1111-1111-1111-111111111111', '44444444-4444-4444-4444-444444444442', CURRENT_TIMESTAMP - INTERVAL '1 days');

-- Progresso do Maxuel
INSERT INTO progresso_usuario_licao (id, usuario_id, licao_id, data_conclusao)
VALUES ('77777777-7777-7777-7777-777777777773', '11111111-1111-1111-1111-111111111112', '44444444-4444-4444-4444-444444444441', CURRENT_TIMESTAMP - INTERVAL '3 days');

INSERT INTO progresso_usuario_licao (id, usuario_id, licao_id, data_conclusao)
VALUES ('77777777-7777-7777-7777-777777777774', '11111111-1111-1111-1111-111111111112', '44444444-4444-4444-4444-444444444442', CURRENT_TIMESTAMP - INTERVAL '2 days');

INSERT INTO progresso_usuario_licao (id, usuario_id, licao_id, data_conclusao)
VALUES ('77777777-7777-7777-7777-777777777775', '11111111-1111-1111-1111-111111111112', '44444444-4444-4444-4444-444444444443', CURRENT_TIMESTAMP - INTERVAL '1 days');


-- ==========================================
-- 8. Conquistas
-- ==========================================
INSERT INTO conquistas (id, titulo, descricao, icone_url, meta_xp, meta_licoes, criado_em)
VALUES ('88888888-8888-8888-8888-888888888881', 'Primeiro Passo', 'Conclua a sua primeira lição.', 'https://cdn-icons-png.flaticon.com/512/3112/3112946.png', 0, 1, CURRENT_TIMESTAMP);

INSERT INTO conquistas (id, titulo, descricao, icone_url, meta_xp, meta_licoes, criado_em)
VALUES ('88888888-8888-8888-8888-888888888882', 'Guerreiro Tupi', 'Acumule 1000 XP.', 'https://cdn-icons-png.flaticon.com/512/3112/3112946.png', 1000, 0, CURRENT_TIMESTAMP);

INSERT INTO conquistas (id, titulo, descricao, icone_url, meta_xp, meta_licoes, criado_em)
VALUES ('88888888-8888-8888-8888-888888888883', 'Semana Perfeita', 'Mantenha uma ofensiva de 7 dias.', 'https://cdn-icons-png.flaticon.com/512/3112/3112946.png', 0, 0, CURRENT_TIMESTAMP);

INSERT INTO conquistas (id, titulo, descricao, icone_url, meta_xp, meta_licoes, criado_em)
VALUES ('88888888-8888-8888-8888-888888888884', 'Poliglota', 'Conclua 50 lições.', 'https://cdn-icons-png.flaticon.com/512/3112/3112946.png', 0, 50, CURRENT_TIMESTAMP);

-- Vinculando Conquistas ao Maxuel
INSERT INTO usuario_conquistas (id, usuario_id, conquista_id, data_obtencao)
VALUES ('99999999-9999-9999-9999-999999999991', '11111111-1111-1111-1111-111111111112', '88888888-8888-8888-8888-888888888881', CURRENT_TIMESTAMP);

INSERT INTO usuario_conquistas (id, usuario_id, conquista_id, data_obtencao)
VALUES ('99999999-9999-9999-9999-999999999992', '11111111-1111-1111-1111-111111111112', '88888888-8888-8888-8888-888888888882', CURRENT_TIMESTAMP);

INSERT INTO usuario_conquistas (id, usuario_id, conquista_id, data_obtencao)
VALUES ('99999999-9999-9999-9999-999999999993', '11111111-1111-1111-1111-111111111112', '88888888-8888-8888-8888-888888888883', CURRENT_TIMESTAMP);
