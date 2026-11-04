CREATE DATABASE biblioteca;


CREATE TABLE alunos (
    id_aluno SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(150) DEFAULT NULL,
    data_cad TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE livros (
    id_livro SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    ano_publicacao SMALLINT NOT NULL CHECK (ano_publicacao = 0 OR ano_publicacao BETWEEN 1901 AND 2155),
    data_cad TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE emprestimos (
    id_emprestimo SERIAL PRIMARY KEY,
    id_aluno INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE DEFAULT NULL,
    data_cad TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_aluno) REFERENCES alunos (id_aluno)
);

CREATE TABLE itens_emprestimo (
    id_emprestimo INT NOT NULL,
    id_livro INT NOT NULL,
    PRIMARY KEY (id_emprestimo, id_livro),
    FOREIGN KEY (id_emprestimo) REFERENCES emprestimos (id_emprestimo),
    FOREIGN KEY (id_livro) REFERENCES livros (id_livro)
);


INSERT INTO alunos (nome, matricula, email) VALUES ('Ana Souza', '2026001', 'ana.souza@example.com');
INSERT INTO alunos (nome, matricula, email) VALUES ('Bruno Lima', '2026002', 'bruno.lima@example.com');
INSERT INTO alunos (nome, matricula, email) VALUES ('Carla Santos', '2026003', NULL);


INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Introdução à Programação', 'Marina Costa', 2020);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Banco de Dados na Prática', 'Rafael Lima', 2021);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Matemática do Cotidiano', 'Helena Duarte', 2019);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Caminhos da Ciência', 'Paulo Nunes', 2022);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Histórias da Nossa Cidade', 'Beatriz Rocha', 2018);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Aprendendo Robótica', 'Lucas Mendes', 2023);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('O Universo em Perguntas', 'Sofia Almeida', 2020);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Arte e Imaginação', 'Daniel Freitas', 2017);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Ecologia para Todos', 'Camila Ribeiro', 2024);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Redes de Computadores', 'Eduardo Martins', 2021);


INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (1, '2026-08-03', '2026-08-07');
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (2, '2026-08-08', '2026-08-12');
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (3, '2026-08-13', '2026-08-17');
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (1, '2026-08-18', '2026-08-22');
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (2, '2026-08-23', '2026-08-27');
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (3, '2026-09-03', '2026-09-07');
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (1, '2026-09-08', '2026-09-12');
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (2, '2026-09-13', '2026-09-17');
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (3, '2026-09-18', '2026-09-22');
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (1, '2026-09-23', '2026-09-27');
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (2, '2026-10-03', '2026-10-07');
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (3, '2026-10-08', '2026-10-12');
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (1, '2026-10-13', '2026-10-17');
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (2, '2026-10-18', NULL);
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (3, '2026-10-23', NULL);


INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (1, 1);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (2, 2);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (3, 3);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (4, 4);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (5, 5);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (6, 7);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (7, 8);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (8, 9);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (9, 10);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (10, 1);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (11, 3);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (12, 4);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (13, 5);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (14, 6);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (15, 7);


SELECT titulo, autor FROM livros;


SELECT * FROM emprestimos ORDER BY data_emprestimo;
