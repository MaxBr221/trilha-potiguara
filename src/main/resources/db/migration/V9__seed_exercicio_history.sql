-- Atualiza as conquistas existentes com os ícones do lucide-react e cores do Tailwind
UPDATE conquistas SET icone = 'Star', cor_base = 'blue' WHERE id = '88888888-8888-8888-8888-888888888881'; -- Primeiro Passo
UPDATE conquistas SET icone = 'Trophy', cor_base = 'emerald' WHERE id = '88888888-8888-8888-8888-888888888882'; -- Guerreiro Tupi
UPDATE conquistas SET icone = 'Flame', cor_base = 'amber' WHERE id = '88888888-8888-8888-8888-888888888883'; -- Semana Perfeita
UPDATE conquistas SET icone = 'Crown', cor_base = 'purple' WHERE id = '88888888-8888-8888-8888-888888888884'; -- Poliglota

-- Inserindo histórico de exercícios para o Maxuel para simular a Taxa de Acerto de 90% (10 questões, 9 acertos)
-- Exercicio 1: '66666666-6666-6666-6666-666666666661'
-- Usuario: '11111111-1111-1111-1111-111111111112'

INSERT INTO progresso_usuario_exercicio (id, usuario_id, exercicio_id, acertou, criado_em)
VALUES (gen_random_uuid(), '11111111-1111-1111-1111-111111111112', '66666666-6666-6666-6666-666666666661', true, CURRENT_TIMESTAMP - INTERVAL '10 hours');

INSERT INTO progresso_usuario_exercicio (id, usuario_id, exercicio_id, acertou, criado_em)
VALUES (gen_random_uuid(), '11111111-1111-1111-1111-111111111112', '66666666-6666-6666-6666-666666666661', true, CURRENT_TIMESTAMP - INTERVAL '9 hours');

INSERT INTO progresso_usuario_exercicio (id, usuario_id, exercicio_id, acertou, criado_em)
VALUES (gen_random_uuid(), '11111111-1111-1111-1111-111111111112', '66666666-6666-6666-6666-666666666661', true, CURRENT_TIMESTAMP - INTERVAL '8 hours');

INSERT INTO progresso_usuario_exercicio (id, usuario_id, exercicio_id, acertou, criado_em)
VALUES (gen_random_uuid(), '11111111-1111-1111-1111-111111111112', '66666666-6666-6666-6666-666666666661', true, CURRENT_TIMESTAMP - INTERVAL '7 hours');

INSERT INTO progresso_usuario_exercicio (id, usuario_id, exercicio_id, acertou, criado_em)
VALUES (gen_random_uuid(), '11111111-1111-1111-1111-111111111112', '66666666-6666-6666-6666-666666666661', true, CURRENT_TIMESTAMP - INTERVAL '6 hours');

INSERT INTO progresso_usuario_exercicio (id, usuario_id, exercicio_id, acertou, criado_em)
VALUES (gen_random_uuid(), '11111111-1111-1111-1111-111111111112', '66666666-6666-6666-6666-666666666661', true, CURRENT_TIMESTAMP - INTERVAL '5 hours');

INSERT INTO progresso_usuario_exercicio (id, usuario_id, exercicio_id, acertou, criado_em)
VALUES (gen_random_uuid(), '11111111-1111-1111-1111-111111111112', '66666666-6666-6666-6666-666666666661', true, CURRENT_TIMESTAMP - INTERVAL '4 hours');

INSERT INTO progresso_usuario_exercicio (id, usuario_id, exercicio_id, acertou, criado_em)
VALUES (gen_random_uuid(), '11111111-1111-1111-1111-111111111112', '66666666-6666-6666-6666-666666666661', true, CURRENT_TIMESTAMP - INTERVAL '3 hours');

INSERT INTO progresso_usuario_exercicio (id, usuario_id, exercicio_id, acertou, criado_em)
VALUES (gen_random_uuid(), '11111111-1111-1111-1111-111111111112', '66666666-6666-6666-6666-666666666661', false, CURRENT_TIMESTAMP - INTERVAL '2 hours');

INSERT INTO progresso_usuario_exercicio (id, usuario_id, exercicio_id, acertou, criado_em)
VALUES (gen_random_uuid(), '11111111-1111-1111-1111-111111111112', '66666666-6666-6666-6666-666666666661', true, CURRENT_TIMESTAMP - INTERVAL '1 hours');
