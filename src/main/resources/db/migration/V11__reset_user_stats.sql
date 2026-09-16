-- Zera o XP e a ofensiva do usuário
UPDATE usuarios 
SET xp = 0, sequencia_atual = 0 
WHERE email = 'maxsuelcombr941@gmail.com';

-- Apaga o progresso nas lições
DELETE FROM progresso_usuario_licao 
WHERE usuario_id = (SELECT id FROM usuarios WHERE email = 'maxsuelcombr941@gmail.com');

-- Apaga as conquistas associadas
DELETE FROM usuario_conquistas 
WHERE usuario_id = (SELECT id FROM usuarios WHERE email = 'maxsuelcombr941@gmail.com');

-- Apaga o histórico de exercícios
DELETE FROM progresso_usuario_exercicio 
WHERE usuario_id = (SELECT id FROM usuarios WHERE email = 'maxsuelcombr941@gmail.com');
