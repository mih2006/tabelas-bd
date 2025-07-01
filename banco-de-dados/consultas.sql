

SELECT c.nome AS curso, p.usuario_id, u.nome AS professor
FROM Cursos c
INNER JOIN Professores p ON c.professor_id = p.professor_id
INNER JOIN Usuarios u ON p.usuario_id = u.usuario_id
WHERE c.ativo = TRUE;


SELECT m.matricula_id, u.nome AS aluno, c.nome AS curso,
       COUNT(pa.aula_id) AS aulas_concluidas,
       (COUNT(pa.aula_id) / COUNT(a.aula_id)) * 100 AS progresso_percentual
FROM Matriculas m
LEFT JOIN Progresso_Aulas pa ON m.matricula_id = pa.matricula_id AND pa.porcentagem_conclusao = 100
LEFT JOIN Alunos al ON m.aluno_id = al.aluno_id
LEFT JOIN Usuarios u ON al.usuario_id = u.usuario_id
LEFT JOIN Cursos c ON m.curso_id = c.curso_id
LEFT JOIN Modulos mo ON c.curso_id = mo.curso_id
LEFT JOIN Aulas a ON mo.modulo_id = a.modulo_id
GROUP BY m.matricula_id, u.nome, c.nome;


SELECT u.usuario_id, u.nome, u.email
FROM Usuarios u
LEFT JOIN Alunos a ON u.usuario_id = a.usuario_id
WHERE a.aluno_id IS NULL AND u.tipo = 'aluno';