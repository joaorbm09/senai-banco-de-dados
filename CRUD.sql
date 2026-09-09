CREATE TABLE alunos(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(60),
    turma VARCHAR(12),
    nascimento DATE,
    ativo BOOLEAN

);

INSERT INTO alunos(
    id,
    nome,
    turma,
    nascimento,
    ativo)

    VALUES(
        '3',
        'Rafael Gomes',
        'I1D46B',
        '12/07/2009',
        '1'
);


ALTER TABLE alunos ADD COLUMN email VARCHAR(255);

UPDATE alunos SET email = 'joaocarlos@gmail.com';

UPDATE alunos
SET email = 'kauaneduardo@gmail.com'
WHERE id = 2;


UPDATE alunos
SET nascimento = '2010-04-29'
WHERE id = 2;

UPDATE alunos
SET turma = 'I1D46B', email = 'rafaelcaue@gmail.com', nascimento = '2010-01-05'
WHERE id = 3;


DELETE FROM  alunos
WHERE id = 5;


DELETE FROM alunos;

SELECT * FROM alunos;