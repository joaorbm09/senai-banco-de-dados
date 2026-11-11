## Pesquisa - funções e operadores do `mysql` para o `Postgresql`

| Finalidade | MySQL | PostgreSQL |
|---|---|---|
| Data atual | `CURDATE()` | `CURRENT_DATE` |
| Hora atual sem fuso no resultado | `CURTIME()` | `LOCALTIME` |
| Data e hora atuais | `NOW()` | `NOW()` |
| Extrair o ano | `YEAR(data_admissao)` | `EXTRACT(YEAR FROM data_admissao)` |
| Extrair o mês | `MONTH(data_admissao)` | `EXTRACT(MONTH FROM data_admissao)` |
| Extrair o dia | `DAY(data_admissao)` | `EXTRACT(DAY FROM data_admissao)` |
| Acrescentar um ano | `DATE_ADD(data_admissao, INTERVAL 1 YEAR)` | `(data_admissao + INTERVAL '1 year')::date` |
| Dias desde a admissão | `DATEDIFF(CURDATE(), data_admissao)` | `CURRENT_DATE - data_admissao` |