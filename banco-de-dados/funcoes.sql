SELECT COUNT(*) AS total_alunos_matriculados FROM matricula WHERE status = 'ATIVA';

SELECT t.nome AS turma, COUNT(m.id_aluno) AS total_alunos
FROM turma t
LEFT JOIN matricula m ON t.id_turma = m.id_turma AND m.status = 'ATIVA'
GROUP BY t.nome;

SELECT p.nome AS professor, COUNT(t.id_turma) AS turmas_responsavel
FROM professor p
LEFT JOIN turma t ON p.id_professor = t.id_professor_responsavel
GROUP BY p.nome;