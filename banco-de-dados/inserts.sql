SELECT * FROM Usuarios WHERE email = 'mirela@email.com';

INSERT INTO Usuarios (nome, email, senha, tipo) VALUES 
 ('Mirela Batista', 'mirela@email.com', 'senha123', 'aluno'),
 ('Artur Prado', 'artur@email.com', 'senha456', 'aluno'),
 ('Luiza Lana', 'luiza@email.com', 'senha789', 'professor'),
 ('Lian Mendes', 'lian@email.com', 'senhaabc', 'professor'),
 ('Julia Hostins', 'admin@ead.com', 'admin123', 'admin');
 


DELETE FROM Usuarios WHERE email = 'mirela@email.com';

INSERT INTO Usuarios (nome, email, senha, tipo) VALUES 
 ('Mirela Batista', 'mirela@email.com', 'senha123', 'aluno'),
 ('Artur Prado', 'artur@email.com', 'senha456', 'aluno'),
 ('Luiza Lana', 'luiza@email.com', 'senha789', 'professor'),
 ('Lian Mendes', 'lian@email.com', 'senhaabc', 'professor'),
 ('Julia Hostins', 'admin@ead.com', 'admin123', 'admin');


INSERT INTO Alunos (usuario_id, data_nascimento, cpf) VALUES 
(1, '2006-11-03', '111.222.333-44'),
(2, '2006-09-03', '555.666.777-88');


INSERT INTO Professores (usuario_id, formacao, area_atuacao) VALUES 
(3, 'Doutorado em Ciência da Computação', 'Programação'),
(4, 'Mestrado em Educação', 'Metodologias de Ensino');


INSERT INTO Cursos (nome, descricao, carga_horaria, categoria, professor_id) VALUES 
('Introdução ao Python', 'Curso básico de programação em Python', 40, 'Programação', 1),
('Design Instrucional para EAD', 'Princípios de design para cursos online', 30, 'Educação', 2);


INSERT INTO Modulos (curso_id, titulo, ordem) VALUES 
(1, 'Fundamentos de Python', 1),
(1, 'Estruturas de Controle', 2),
(2, 'Conceitos de EAD', 1),
(2, 'Design de Conteúdo', 2);


INSERT INTO Aulas (modulo_id, titulo, tipo, duracao, url_video, ordem) VALUES 
(1, 'Introdução ao Python', 'video', 15, 'https://video.com/python1', 1),
(1, 'Variáveis e Tipos', 'video', 20, 'https://video.com/python2', 2),
(3, 'História do EAD', 'video', 25, 'https://video.com/ead1', 1),
(4, 'Princípios do Design', 'texto', NULL, NULL, 1);


INSERT INTO Matriculas (aluno_id, curso_id, status) VALUES 
(1, 1, 'ativo'),
(2, 1, 'ativo'),
(1, 2, 'ativo');


INSERT INTO Avaliacoes (curso_id, titulo, peso, data_limite) VALUES 
(1, 'Prova Final Python', 50.0, '2023-12-15 23:59:59'),
(2, 'Trabalho Design', 70.0, '2023-12-20 23:59:59');


INSERT INTO Progresso_Aulas (matricula_id, aula_id, data_conclusao, porcentagem_conclusao) VALUES 
(1, 1, '2023-11-10 15:30:00', 100),
(1, 2, '2023-11-12 10:15:00', 100),
(3, 3, NULL, 50);