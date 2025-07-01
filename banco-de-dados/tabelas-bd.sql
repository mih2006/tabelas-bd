USE escola;

CREATE TABLE Usuarios (
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    tipo ENUM('aluno', 'professor', 'admin') NOT NULL,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Alunos (
    aluno_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT UNIQUE,
    data_nascimento DATE,
    cpf VARCHAR(14) UNIQUE,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(usuario_id)
    );
   
   
    CREATE TABLE Professores (
    professor_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT UNIQUE,
    formacao VARCHAR(100),
    area_atuacao VARCHAR(100),
    curriculo TEXT,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(usuario_id)
);


CREATE TABLE Cursos (
    curso_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    carga_horaria INT NOT NULL,
    categoria VARCHAR(50),
    professor_id INT,
	data_criacao DATE DEFAULT NULL,
    ativo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (professor_id) REFERENCES Professores(professor_id)
);


CREATE TABLE Matriculas (
    matricula_id INT PRIMARY KEY AUTO_INCREMENT,
	aluno_id INT,
    curso_id INT,
    data_matricula DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('ativo', 'concluido', 'cancelado') DEFAULT 'ativo',
    nota_final DECIMAL(5,2),
    FOREIGN KEY (aluno_id) REFERENCES Alunos(aluno_id),
    FOREIGN KEY (curso_id) REFERENCES Cursos(curso_id),
    UNIQUE KEY (aluno_id, curso_id)
);


CREATE TABLE Modulos (
    modulo_id INT PRIMARY KEY AUTO_INCREMENT,
    curso_id INT,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT,
    ordem INT NOT NULL,
    FOREIGN KEY (curso_id) REFERENCES Cursos(curso_id)
);


CREATE TABLE Aulas (
    aula_id INT PRIMARY KEY AUTO_INCREMENT,
    modulo_id INT,
    titulo VARCHAR(100) NOT NULL,
    tipo ENUM('video', 'texto', 'quiz', 'atividade'),
    duracao INT COMMENT 'Duração em minutos',
    conteudo TEXT,
    url_video VARCHAR(255),
    ordem INT NOT NULL,
    FOREIGN KEY (modulo_id) REFERENCES Modulos(modulo_id)
    );


CREATE TABLE Avaliacoes (
    avaliacao_id INT PRIMARY KEY AUTO_INCREMENT,
    curso_id INT,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT,
    peso DECIMAL(5,2) NOT NULL,
    data_limite DATETIME,
    FOREIGN KEY (curso_id) REFERENCES Cursos(curso_id)
);


CREATE TABLE Progresso_Aulas (
    progresso_id INT PRIMARY KEY AUTO_INCREMENT,
    matricula_id INT,
    aula_id INT,
    data_conclusao DATETIME,
    porcentagem_conclusao INT DEFAULT 0,
    FOREIGN KEY (matricula_id) REFERENCES Matriculas(matricula_id),
    FOREIGN KEY (aula_id) REFERENCES Aulas(aula_id),
    UNIQUE KEY (matricula_id, aula_id)
);