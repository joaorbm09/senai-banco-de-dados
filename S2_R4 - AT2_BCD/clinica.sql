CREATE DATABASE "clínica_veterinaria";


CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(150) DEFAULT NULL,
    data_cad TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE animais (
    id_animal SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    especie VARCHAR(20) NOT NULL,
    raca VARCHAR(30) DEFAULT NULL,
    data_nasc SMALLINT DEFAULT NULL CHECK (data_nasc = 0 OR data_nasc BETWEEN 1901 AND 2155),
    data_cad TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);

CREATE TABLE consultas (
    id_consulta SERIAL PRIMARY KEY,
    id_animal INT NOT NULL,
    data_consulta DATE NOT NULL,
    descricao VARCHAR(250) NOT NULL,
    data_cad TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_animal) REFERENCES animais (id_animal)
);




INSERT INTO clientes (nome, telefone, email) VALUES ('Mariana Lopes', '19990000001', 'mariana@example.com');
INSERT INTO clientes (nome, telefone, email) VALUES ('Pedro Silva', '19990000002', 'pedro@example.com');
INSERT INTO clientes (nome, telefone, email) VALUES ('Juliana Costa', '19990000003', NULL);
INSERT INTO clientes (nome, telefone, email) VALUES ('Felipe Oliveira', '19990000004', 'felipe@example.com');
INSERT INTO clientes (nome, telefone, email) VALUES ('Renata Alves', '19990000005', NULL);


INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (1, 'Luna', 'Canina', 'Labrador', 2020);
INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (1, 'Mia', 'Felina', 'Siamês', 2022);
INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (2, 'Thor', 'Canina', 'Vira-lata', 2019);
INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (2, 'Pipoca', 'Felina', NULL, 2023);
INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (3, 'Mel', 'Canina', 'Poodle', 2021);
INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (4, 'Nina', 'Felina', 'Persa', 2018);
INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (5, 'Bento', 'Canina', NULL, NULL);
INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (5, 'Lola', 'Coelho', 'Mini Lop', 2024);


INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (1, '2026-08-04', 'Consulta de rotina.');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (2, '2026-08-10', 'Avaliação antes da vacinação.');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (3, '2026-08-17', 'Avaliação dermatológica.');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (4, '2026-09-02', 'Primeira consulta e avaliação geral.');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (5, '2026-09-09', 'Avaliação odontológica.');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (6, '2026-09-16', 'Consulta de rotina.');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (7, '2026-10-05', 'Avaliação nutricional.');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (8, '2026-10-13', 'Avaliação geral do coelho.');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (1, '2026-10-20', 'Retorno para acompanhamento.');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (3, '2026-10-27', 'Retorno da avaliação dermatológica.');




SELECT animais.nome AS animal, clientes.nome AS dono
FROM animais
JOIN clientes ON animais.id_cliente = clientes.id_cliente;


SELECT * FROM consultas ORDER BY data_consulta;
