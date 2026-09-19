-- ==========================================
-- Embaralhamento de todos os exercicios
-- ==========================================

WITH shuffled AS (
    SELECT id, row_number() OVER (PARTITION BY licao_id ORDER BY random()) as new_ordem
    FROM exercicios
)
UPDATE exercicios e
SET ordem_index = s.new_ordem
FROM shuffled s
WHERE e.id = s.id;
