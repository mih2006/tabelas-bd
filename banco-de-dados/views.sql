CREATE VIEW vw_matriculas_completas AS
SELECT a.nome AS aluno, t.nome AS turma, p.nome AS professor,
       r.nome AS responsavel, m.data_matricula, m.status
FROM matricula m
JOIN aluno a ON m.id_aluno = a.id_aluno
JOIN turma t ON m.id_turma = t.id_turma
LEFT JOIN professor p ON t.id_professor_responsavel = p.id_professor
JOIN responsavel r ON a.id_responsavel = r.id_responsavel;

CREATE VIEW vw_alunos_por_turma AS
SELECT t.nome AS turma, COUNT(m.id_aluno) AS total_alunos
FROM turma t
LEFT JOIN matricula m ON t.id_turma = m.id_turma AND m.status = 'ATIVA'
GROUP BY t.nome;