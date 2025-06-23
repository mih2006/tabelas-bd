USE meubanco;
DROP TABLE IF EXISTS Alunos;
CREATE TABLE Alunos (
	id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (100) NOT NULL,
    data_nascimento DATE,
    sexo ENUM('Masculino', 'Feminino', 'Outro') DEFAULT 'Outro',
	email VARCHAR (100),
    telefone VARCHAR (15),
    endereco VARCHAR (225),
    status_matricula ENUM ('Ativo', 'Inativo') DEFAULT 'Ativo',
    data_entrada DATE,
    data_saida DATE
    );
    
DROP TABLE IF EXISTS Professores;
CREATE TABLE Professores (
	id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (100) NOT NULL,
    especialidade VARCHAR (100),
    formacao VARCHAR (100),
    email VARCHAR (100),
	telefone VARCHAR (15),
    data_adimicao DATE
);

DROP TABLE IF EXISTS Disciplinas;
CREATE TABLE Disciplinas (
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,  
    nome_disciplina VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS Matriculas;
CREATE TABLE Matriculas ( 
	id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_disciplina INT,
    ano_letivo INT,
    nota_final DECIMAL (5,2),
    nota_recuperacao DECIMAL (5,2),
    status ENUM ('Aprovado', 'Reprovado', 'Recuperacao')DEFAULT 'Aprovado',
    data_matricula DATE,
    FOREIGN KEY (id_alunos) REFERENCES Alunos(id_alunos),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id_disciplina)
);

DROP TABLE IF EXISTS Aulas;
CREATE TABLE Aulas (
	id_aula INT AUTO_INCREMENT PRIMARY KEY,
    id_professor INT,
    id_disciplina INT,
    data_aula DATE,
    tema_aula VARCHAR (255),
    hora_inicio TIME,
    hora_fim TIME,
    sala VARCHAR (10),
    FOREIGN KEY (id_professor) REFERENCES Professores(id_professor),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id_disciplina)
);

DROP TABLE IF EXISTS Turmas;
CREATE TABLE Turmas (
	id_turma INT AUTO_INCREMENT PRIMARY KEY,
    nome_turma VARCHAR (50),
    id_disciplina INT,
    ano_letivo INT,
    periodo ENUM('Manha', 'Tarde', 'Noite') DEFAULT 'Manha',
    FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id_disciplina)
);

DROP TABLE IF EXISTS Frequencias;
CREATE TABLE Frequencias (
	id_frequencia INT AUTO_INCREMENT PRIMARY KEY,
    id_aula INT,
	id_aluno INT,
    presenca BOOLEAN DEFAULT FALSE,
	FOREIGN KEY (id_aula) REFERENCES Aulas(id_aula),
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno)
);
    
DROP TABLE IF EXISTS Historico_notas;
CREATE TABLE Historico_Notas (
	id_historico INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_disciplina INT,
    nota DECIMAL (5,2),
    ano_letivo INT,
    status ENUM ('Aprovado', 'Reprovado', 'Recuperacao'),
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id_disciplina)
);

DROP TABLE IF EXISTS Comentarios_professores;
CREATE TABLE Comentarios_Professores (
	id_comentario INT AUTO_INCREMENT PRIMARY KEY,
	id_professor INT,
    id_aluno INT,
    comentario TEXT,
    data_comentario DATE,
    FOREIGN KEY (id_professor) REFERENCES Professores(id_professor),
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno)
);

DROP TABLE IF EXISTS Pagamentos;
CREATE TABLE Pgamentos (
	id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    valor DECIMAL(10,2),
    data_pagamento DATE,
    metodo_pagamento ENUM('Boleto', 'Cartao', 'Transferencia', 'Dinheiro'),
    status_pagamento ENUM('Pago', 'Pendente', 'Cancelado') DEFAULT 'Pendente',
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno)
);

DROP TABLE IF EXISTS Enderecos;
CREATE TABLE Enderecos (
	id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    endereco VARCHAR (255),
    cidade VARCHAR (100),
    estado VARCHAR (50),
    cep VARCHAR (10),
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno)
);

DROP TABLE IF EXISTS Documentos;
CREATE TABLE Documentos (
	id_documento INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    tipo_documento VARCHAR (100),
    caminho_arquivo VARCHAR (255),
    data_upload DATE,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno)
);

DROP TABLE IF EXISTS Comunicados;
CREATE TABLE Comunicados (
	id_comunicado INT AUTO_INCREMENT PRIMARY KEY,
    id_turma INT,
    assunto VARCHAR (255),
    mensagem TEXT,
    FOREIGN KEY (id_turma) REFERENCES Turmas(id_turma)
);

DROP TABLE IF EXISTS Notificacoes;
CREATE TABLE Notificacoes (
	id_notificacao INT AUTO_INCREMENT PRIMARY KEY,
	id_aluno INT,
    tipo_notificacao ENUM('Alerta', 'Informativo', 'Aviso'),
    mensagem TEXT,
    data_notificacao DATE,
    lida BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno)
);

DROP TABLE IF EXISTS Avaliacoes;
CREATE TABLE Avaliacoes (
	id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
	id_disciplina INT,
    tipo_avaliacao ENUM('Prova', 'Trabalho', 'Projeto', 'Outro'),
    descricao TEXT,
    data_avaliacao DATE,
	FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id_disciplina)
);

DROP TABLE IF EXISTS Nota_Avaliacoes;
CREATE TABLE Notas_Avaliacoes (
	id_nota_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
    id_avaliacao INT,
    id_aluno INT,
    nota DECIMAL (5,2),
	FOREIGN KEY (id_avaliacao) REFERENCES Avaliacoes(id_avaliacao),
	FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno)
);