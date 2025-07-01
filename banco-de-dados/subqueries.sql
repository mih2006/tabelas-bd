SELECT nome FROM aluno
WHERE id_aluno NOT IN (SELECT id_aluno FROM matricula WHERE status = 'ATIVA');

SELECT t.nome, COUNT(m.id_aluno) AS total_alunos
FROM turma t
JOIN matricula m ON t.id_turma = m.id_turma
GROUP BY t.nome
HAVING COUNT(m.id_aluno) > (SELECT AVG(alunos_por_turma)
                           FROM (SELECT COUNT(id_aluno) AS alunos_por_turma
                                 FROM matricula
                                 GROUP BY id_turma) AS media);