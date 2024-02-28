CREATE DATABASE PalestraFaculdade;
GO
USE PalestraFaculdade;

CREATE TABLE curso (
		codigo_curso		INT					NOT NULL,
		nome				VARCHAR(70)			NOT NULL,
		sigla				VARCHAR(10)			NOT NULL,
		PRIMARY KEY			(codigo_curso)
);

CREATE TABLE aluno (
		ra					CHAR(7)				NOT NULL,
		nome				VARCHAR(250)		NOT NULL,
		codigo_curso		INT					NOT NULL,
		PRIMARY KEY			(ra),
		FOREIGN KEY			(codigo_curso)		REFERENCES	curso	(codigo_curso)
);

CREATE TABLE	palestrante	(
	codigo_palestrante		INT					NOT NULL	IDENTITY,
	nome					VARCHAR(250)		NOT NULL,
	empresa					VARCHAR(100)		NOT NULL,
	PRIMARY KEY		(codigo_palestrante)
);	

CREATE TABLE palestra (
	codigo_palestra			INT					NOT NULL  IDENTITY,
	titulo					VARCHAR(MAX)		NOT NULL,
	carga_horaria			INT					NOT NULL,
	data_palestra			DATE				NOT NULL,
	codigo_palestrante		INT					NOT NULL,
	PRIMARY KEY		(codigo_palestra),
	FOREIGN KEY		(codigo_palestrante)	REFERENCES	palestrante	(codigo_palestrante)
);

CREATE TABLE  alunos_inscritos	(
	ra						CHAR(7)				NOT NULL,
	codigo_palestra			INT					NOT NULL,
	FOREIGN KEY		(ra)		REFERENCES		aluno (ra),
	FOREIGN KEY		(codigo_palestra)		REFERENCES		palestra		(codigo_palestra)
);

CREATE TABLE nao_alunos (
	rg						VARCHAR(9)			NOT NULL,
	orgao_exp				CHAR(5)				NOT NULL,
	nome					VARCHAR(250)		NOT NULL,
	PRIMARY KEY		(rg, orgao_Exp)
);

CREATE TABLE nao_alunos_inscritos (
	codigo_palestra			INT					NOT NULL,
	rg						VARCHAR(9)			NOT NULL,
	orgao_exp				CHAR(5)				NOT NULL,
	PRIMARY KEY				(codigo_palestra, rg, orgao_exp),
	FOREIGN KEY				(codigo_palestra)	REFERENCES	palestra (codigo_palestra),
	FOREIGN KEY				(rg, orgao_exp)		REFERENCES	nao_alunos (rg, orgao_exp)
);

-- Inserção de valores na tabela curso
INSERT INTO curso VALUES
(1, 'Engenharia de Software', 'ES'),
(2, 'Ciência da Computação', 'CC'),
(3, 'Administração', 'ADM');

-- Inserção de valores na tabela aluno
INSERT INTO aluno VALUES
('7654321', 'Juliana', 1),
('1234567', 'Fábio', 2),
('9876543', 'Lucas', 3);

-- Inserção de valores na tabela palestrante
INSERT INTO palestrante VALUES
('Carla Silva', 'Tech Solutions Inc.'),
('Lucas Mendes', 'Data Analysis Co.'),
('Ana Pereira', 'Innovative Ideas Ltd.');

-- Inserção de valores na tabela palestra
INSERT INTO palestra VALUES
('Introdução à Inteligência Artificial', 3, '2023-05-10', 1),
('Desafios da Gestão de Projetos', 2, '2023-05-15', 2),
('Inovação e Empreendedorismo', 4, '2023-05-20', 3);

-- Inserção de valores na tabela nao_alunos
INSERT INTO nao_alunos VALUES
('456789123', '4', 'Fernanda'),
('654321987', '3', 'Ricardo'),
('987654321', '2', 'Camila');

-- Inserção de valores na tabela alunos_inscritos
INSERT INTO alunos_inscritos VALUES
('7654321', 1),
('1234567', 2),
('9876543', 3);

-- Inserção de valores na tabela nao_alunos_inscritos
INSERT INTO nao_alunos_inscritos VALUES
(1, '456789123', '4'),
(2, '654321987', '3'),
(3, '987654321', '2');


-- Criação da view lista_presenca
CREATE VIEW lista_presenca AS
SELECT DISTINCT
    a.ra AS Num_Documento,
    a.nome AS Nome_Pessoa,
    p.titulo AS Titulo_Palestra,
    pt.nome AS Nome_Palestrante,
    p.carga_horaria,
    p.data_palestra
FROM palestra p
JOIN palestrante pt ON p.codigo_palestrante = pt.codigo_palestrante
JOIN alunos_inscritos ai ON p.codigo_palestra = ai.codigo_palestra
JOIN aluno a ON ai.ra = a.ra
UNION ALL
SELECT DISTINCT
    CONCAT(na.rg, ' - ', na.orgao_exp) AS Num_Documento,
    na.nome AS Nome_Pessoa,
    p.titulo AS Titulo_Palestra,
    pt.nome AS Nome_Palestrante,
    p.carga_horaria,
    p.data_palestra
FROM palestra p
JOIN palestrante pt ON p.codigo_palestrante = pt.codigo_palestrante
JOIN nao_alunos_inscritos nai ON p.codigo_palestra = nai.codigo_palestra
JOIN nao_alunos na ON nai.rg = na.rg AND nai.orgao_exp = na.orgao_exp;

-- Testando 
SELECT * FROM lista_presenca;

