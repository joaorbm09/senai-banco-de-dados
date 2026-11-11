-- LISTA DE EXERCÍCIOS – OPERADORES E FUNÇÕES NO MYSQL

-- 1. Crie um banco de dados chamado 'empresa_db'.
-- 2. Crie uma tabela chamada 'funcionarios' com as seguintes colunas:
--    - 'id' → INT, chave primária e autoincremento
--    - 'nome' → VARCHAR(100)
--    - 'cargo' → VARCHAR(50)
--    - 'salario' → DECIMAL(10,2)
--    - 'idade' → INT
--    - 'data_admissao' → DATE
CREATE TABLE funcionarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    salario DECIMAL(10,2),
    idade INT,
    data_admissao DATE
);

-- 3. Insira pelo menos 6 registros fictícios na tabela.
-- Ana, Analista, 3500.90, 29, 2020-01-15,
-- Bruno,Gerente, 6200.49, 40, 2015-07-22,
-- Carla, Assistente, 2400.35, 25, 2021-03-10,
-- Diego, Estagiário, 1500.87, 21, 2023-02-01,
-- Elisa, Analista, 3800.51, 32, 2019-11-09,
-- Fábio, Coordenador, 4800.50, 36, 2018-04-18;
INSERT INTO funcionarios (nome, cargo, salario, idade, data_admissao)
VALUES 
('Ana', 'Analista', 3500.90, 29, '2020-01-15'),
('Bruno', 'Gerente', 6200.49, 40, '2015-07-22'),
('Carla', 'Assistente', 2400.35, 25, '2021-03-10'),
('Diego', 'Estagiário', 1500.87, 21, '2023-02-01'),
('Elisa', 'Analista', 3800.51, 32, '2019-11-09'),
('Fábio', 'Coordenador', 4800.50, 36, '2018-04-18');

SELECT * FROM funcionarios;
-- 4. Exiba todos os funcionários e calcule um bônus de 15% sobre o salário.
SELECT *, (salario * 0.15) AS bonus_15_porcento FROM funcionarios;
-- 5. Crie uma consulta que mostre o salário anual (salário mensal × 12).
SELECT *, (salario * 12) AS salario_anual FROM funcionarios;
-- 6. Mostre o salário líquido considerando um desconto de 8% (salário - 8%).
SELECT *, (salario - (salario/100 *8)) AS salario_liquido FROM funcionarios;
-- 7. Mostre o resto da divisão entre a idade e 2, identificando quem tem idade par ou ímpar.
SELECT *, (idade % 2) AS resto_divisao_idade FROM funcionarios;
-- 8. Liste os funcionários com salário maior que 3000.
SELECT * FROM funcionarios WHERE salario>3000;
-- 9. Liste os funcionários com idade menor ou igual a 30 anos.
SELECT * FROM funcionarios WHERE idade<=30;
-- 10. Liste os funcionários com cargo diferente de 'Estagiário'.
SELECT * FROM funcionarios WHERE cargo!='Estagiário';
-- 11. Liste os funcionários admitidos antes de 2020.
SELECT * FROM funcionarios WHERE data_admissao<'2020-01-01';
-- 12. Liste os funcionários com salário acima de 2000 e idade abaixo de 30.
SELECT * FROM funcionarios WHERE salario>2000 AND idade<30;
-- 13. Liste os funcionários que sejam Analista ou Gerente.
SELECT * FROM funcionarios WHERE cargo='Analista' OR cargo='Gerente';
-- 14. Liste os funcionários que não sejam da função "Assistente".
SELECT * FROM funcionarios WHERE cargo!='Assistente';
-- 15. Liste os funcionários com idade entre 25 e 35 anos e salário acima de 3000.
SELECT * FROM funcionarios WHERE idade BETWEEN 25 AND 35 AND salario>3000;
-- 16. Liste os funcionários cuja idade esteja entre 25 e 35 usando 'BETWEEN'.
SELECT * FROM funcionarios WHERE idade BETWEEN 25 AND 35;
-- 17. Liste os funcionários cujo cargo esteja em ('Analista', 'Gerente', 'Coordenador') usando 'IN'.
SELECT * FROM funcionarios WHERE cargo IN ('Analista', 'Gerente', 'Coordenador');
-- 18. Liste os funcionários cujo nome comece com a letra "A" usando 'LIKE'.
SELECT * FROM funcionarios WHERE nome LIKE 'A%';
-- 19. Liste os funcionários cujo nome termine com "o".
SELECT * FROM funcionarios WHERE nome LIKE '%o';
-- 20. Liste os funcionários que não possuem data de admissão preenchida (use 'IS NULL').
SELECT * FROM funcionarios WHERE data_admissao IS NULL;
-- 21. Liste os funcionários que possuem data de admissão preenchida (use 'IS NOT NULL').
SELECT * FROM funcionarios WHERE data_admissao IS NOT NULL;
-- 22. Mostre a data e hora atuais do sistema ('NOW()').
SELECT NOW();
-- 23. Mostre apenas a data atual ('CURDATE()') e a hora atual ('CURTIME()').
SELECT CURRENT_DATE AS data_atual,
LOCALTIME AS hora_atual;
-- 24. Mostre a data de admissão e o ano em que cada funcionário foi admitido ('YEAR()').
SELECT nome, data_admissao, EXTRACT(YEAR FROM data_admissao)AS ano_admissao
FROM funcionarios;
-- 25. Exiba a data da próxima avaliação, considerando 1 ano após a data de admissão ('DATE_ADD()').
SELECT nome, data_admissao, (data_admissao + INTERVAL '1 year')::date AS data_avaliacao FROM funcionarios;
-- 26. Calcule há quantos dias cada funcionário está na empresa ('DATEDIFF()').
SELECT nome, data_admissao,
CURRENT_DATE - data_admissao AS dias_na_empresa
FROM funcionarios;
-- 27. Exiba o valor absoluto de um número negativo ('ABS()').
SELECT ABS(-150) AS valor_absoluto;
-- 28. Mostre o bônus arredondado com 2 casas decimais ('ROUND()').
SELECT nome, salario, ROUND(salario * 0.15, 2) AS bonus_arredondado
FROM funcionarios;
-- 29. Exiba o salário anual arredondado para cima ('CEIL()') e para baixo ('FLOOR()').
SELECT nome, salario, CEIL(salario * 12) AS salario_anual_ceil,
FLOOR(salario * 12) AS salario_anual_floor
FROM funcionarios;
-- 30. Calcule a raiz quadrada da idade dos funcionários ('SQRT()').
SELECT nome, idade, SQRT(idade) AS raiz_quadrada_idade
FROM funcionarios;
-- 31. Mostre o resultado de 2 elevado à idade de cada funcionário ('POWER(2, idade)').
SELECT nome, idade, POWER(2, idade) AS resultado
FROM funcionarios;
-- 32. Exiba o nome dos funcionários em maiúsculas ('UPPER()').
SELECT UPPER(nome) AS nome_maiusculo
FROM funcionarios;
-- 33. Exiba o nome dos funcionários em minúsculas ('LOWER()').
SELECT LOWER(nome) AS nome_minusculo
FROM funcionarios;
-- 34. Crie uma coluna chamada "Descrição" concatenando "Funcionário: " com o nome ('CONCAT()').
SELECT CONCAT('Funcionário: ', nome) AS descricao
FROM funcionarios;
-- 35. Mostre apenas as 3 primeiras letras do nome ('SUBSTRING()').
SELECT SUBSTRING(nome, 1, 3) AS primeiras_letras
FROM funcionarios;
-- 36. Exiba o tamanho do nome em caracteres ('CHAR_LENGTH()').
SELECT CHAR_LENGTH(nome) AS tamanho_nome
FROM funcionarios;
-- 37. Mostre os nomes sem espaços antes ou depois ('TRIM()').
SELECT TRIM(nome) AS nome_sem_espacos
FROM funcionarios;
-- 38. Mostre o número total de funcionários ('COUNT()').
SELECT COUNT(*) AS total_funcionarios
FROM funcionarios;
-- 39. Mostre a soma total dos salários ('SUM()').
SELECT SUM(salario) AS soma_salarios
FROM funcionarios;
-- 40. Mostre a média salarial da empresa ('AVG()').
SELECT AVG(salario) AS media_salarial
FROM funcionarios;
-- 41. Mostre o maior e o menor salário ('MAX()' e 'MIN()').
SELECT MAX(salario) AS maior_salario, MIN(salario) AS menor_salario
FROM funcionarios;
-- 42. Mostre a média de idade dos funcionários.
SELECT AVG(idade) AS media_idade
FROM funcionarios;
-- 43. Agrupe os resultados por cargo e mostre a média salarial por cargo.
SELECT cargo, AVG(salario) AS media_salarial
FROM funcionarios
GROUP BY cargo;
-- Desafio Final:
-- 44. Crie uma consulta que mostre:

-- * Nome do funcionário
-- * Cargo
-- * Salário atual
-- * Bônus de 10%
-- * Salário total (salário + bônus)
-- * Data de admissão
-- * Quantos dias já trabalha na empresa
-- * E uma descrição no formato:
--   '"Funcionário: [NOME] | Cargo: [CARGO]"'

-- Combine as funções 'TRIM()', 'CONCAT()', 'ROUND()', 'DATEDIFF()' e 'NOW()'.

SELECT
    TRIM(nome) AS nome,
    cargo,
    salario,
    ROUND(salario * 0.1, 2) AS bonus,
    ROUND(salario * 1.1, 2) AS salario_total,
    data_admissao,
    NOW()::date - data_admissao AS dias_trabalhados,
    CONCAT(
        'Funcionário: ', TRIM(nome),
        ' | Cargo: ', cargo
    ) AS descricao
FROM funcionarios;