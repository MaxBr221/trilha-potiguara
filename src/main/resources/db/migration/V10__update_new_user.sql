-- Dá 2500 XP, 12 dias de ofensiva e conclui as lições para o usuário maxsuelcombr941@gmail.com
UPDATE usuarios 
SET xp = 2500, sequencia_atual = 12 
WHERE email = 'maxsuelcombr941@gmail.com';

-- Insere o progresso nas lições
INSERT INTO progresso_usuario_licao (id, usuario_id, licao_id, data_conclusao)
SELECT gen_random_uuid(), id, '44444444-4444-4444-4444-444444444441', CURRENT_TIMESTAMP - INTERVAL '3 days'
FROM usuarios WHERE email = 'maxsuelcombr941@gmail.com'
ON CONFLICT DO NOTHING;

INSERT INTO progresso_usuario_licao (id, usuario_id, licao_id, data_conclusao)
SELECT gen_random_uuid(), id, '44444444-4444-4444-4444-444444444442', CURRENT_TIMESTAMP - INTERVAL '2 days'
FROM usuarios WHERE email = 'maxsuelcombr941@gmail.com'
ON CONFLICT DO NOTHING;

INSERT INTO progresso_usuario_licao (id, usuario_id, licao_id, data_conclusao)
SELECT gen_random_uuid(), id, '44444444-4444-4444-4444-444444444443', CURRENT_TIMESTAMP - INTERVAL '1 days'
FROM usuarios WHERE email = 'maxsuelcombr941@gmail.com'
ON CONFLICT DO NOTHING;

-- Associa as conquistas
INSERT INTO usuario_conquistas (id, usuario_id, conquista_id, data_obtencao)
SELECT gen_random_uuid(), id, '88888888-8888-8888-8888-888888888881', CURRENT_TIMESTAMP
FROM usuarios WHERE email = 'maxsuelcombr941@gmail.com'
ON CONFLICT DO NOTHING;

INSERT INTO usuario_conquistas (id, usuario_id, conquista_id, data_obtencao)
SELECT gen_random_uuid(), id, '88888888-8888-8888-8888-888888888882', CURRENT_TIMESTAMP
FROM usuarios WHERE email = 'maxsuelcombr941@gmail.com'
ON CONFLICT DO NOTHING;

INSERT INTO usuario_conquistas (id, usuario_id, conquista_id, data_obtencao)
SELECT gen_random_uuid(), id, '88888888-8888-8888-8888-888888888883', CURRENT_TIMESTAMP
FROM usuarios WHERE email = 'maxsuelcombr941@gmail.com'
ON CONFLICT DO NOTHING;

-- Insere histórico de exercícios (9 acertos, 1 erro = 90%)
INSERT INTO progresso_usuario_exercicio (id, usuario_id, exercicio_id, acertou, criado_em)
SELECT gen_random_uuid(), id, '66666666-6666-6666-6666-666666666661', true, CURRENT_TIMESTAMP - INTERVAL '10 hours'
FROM usuarios WHERE email = 'maxsuelcombr941@gmail.com';

INSERT INTO progresso_usuario_exercicio (id, usuario_id, exercicio_id, acertou, criado_em)
SELECT gen_random_uuid(), id, '66666666-6666-6666-6666-666666666661', true, CURRENT_TIMESTAMP - INTERVAL '9 hours'
FROM usuarios WHERE email = 'maxsuelcombr941@gmail.com';

INSERT INTO progresso_usuario_exercicio (id, usuario_id, exercicio_id, acertou, criado_em)
SELECT gen_random_uuid(), id, '66666666-6666-6666-6666-666666666661', true, CURRENT_TIMESTAMP - INTERVAL '8 hours'
FROM usuarios WHERE email = 'maxsuelcombr941@gmail.com';

INSERT INTO progresso_usuario_exercicio (id, usuario_id, exercicio_id, acertou, criado_em)
SELECT gen_random_uuid(), id, '66666666-6666-6666-6666-666666666661', true, CURRENT_TIMESTAMP - INTERVAL '7 hours'
FROM usuarios WHERE email = 'maxsuelcombr941@gmail.com';

INSERT INTO progresso_usuario_exercicio (id, usuario_id, exercicio_id, acertou, criado_em)
SELECT gen_random_uuid(), id, '66666666-6666-6666-6666-666666666661', true, CURRENT_TIMESTAMP - INTERVAL '6 hours'
FROM usuarios WHERE email = 'maxsuelcombr941@gmail.com';

INSERT INTO progresso_usuario_exercicio (id, usuario_id, exercicio_id, acertou, criado_em)
SELECT gen_random_uuid(), id, '66666666-6666-6666-6666-666666666661', true, CURRENT_TIMESTAMP - INTERVAL '5 hours'
FROM usuarios WHERE email = 'maxsuelcombr941@gmail.com';

INSERT INTO progresso_usuario_exercicio (id, usuario_id, exercicio_id, acertou, criado_em)
SELECT gen_random_uuid(), id, '66666666-6666-6666-6666-666666666661', true, CURRENT_TIMESTAMP - INTERVAL '4 hours'
FROM usuarios WHERE email = 'maxsuelcombr941@gmail.com';

INSERT INTO progresso_usuario_exercicio (id, usuario_id, exercicio_id, acertou, criado_em)
SELECT gen_random_uuid(), id, '66666666-6666-6666-6666-666666666661', true, CURRENT_TIMESTAMP - INTERVAL '3 hours'
FROM usuarios WHERE email = 'maxsuelcombr941@gmail.com';

INSERT INTO progresso_usuario_exercicio (id, usuario_id, exercicio_id, acertou, criado_em)
SELECT gen_random_uuid(), id, '66666666-6666-6666-6666-666666666661', false, CURRENT_TIMESTAMP - INTERVAL '2 hours'
FROM usuarios WHERE email = 'maxsuelcombr941@gmail.com';

INSERT INTO progresso_usuario_exercicio (id, usuario_id, exercicio_id, acertou, criado_em)
SELECT gen_random_uuid(), id, '66666666-6666-6666-6666-666666666661', true, CURRENT_TIMESTAMP - INTERVAL '1 hours'
FROM usuarios WHERE email = 'maxsuelcombr941@gmail.com';
