# Dicionário de dados


## `alunos`

| Campo | Tipo | Chave | Obrigatório | Padrão / geração | Descrição |
|---|---|---|---|---|---|
| `id_aluno` | `INT` | PK | Sim | `AUTO_INCREMENT` | Identificador único do aluno. |
| `nome` | `VARCHAR(100)` | — | Sim | — | Nome do aluno. |
| `matricula` | `VARCHAR(20)` | UNIQUE | Sim | — | Matrícula exclusiva do aluno. |
| `email` | `VARCHAR(150)` | — | Não | `NULL` | E-mail de contato do aluno. |
| `data_cad` | `TIMESTAMP` | — | Sim | `CURRENT_TIMESTAMP` | Data e hora de criação do registro. |

## `livros`

| Campo | Tipo | Chave | Obrigatório | Padrão / geração | Descrição |
|---|---|---|---|---|---|
| `id_livro` | `INT` | PK | Sim | `AUTO_INCREMENT` | Identificador único do livro. |
| `titulo` | `VARCHAR(150)` | — | Sim | — | Título do livro. |
| `autor` | `VARCHAR(100)` | — | Sim | — | Nome do autor do livro. |
| `ano_publicacao` | `YEAR` | — | Sim | — | Ano de publicação. |
| `data_cad` | `TIMESTAMP` | — | Sim | `CURRENT_TIMESTAMP` | Data e hora de criação do registro. |

## `emprestimos`

| Campo | Tipo | Chave | Obrigatório | Padrão / geração | Descrição |
|---|---|---|---|---|---|
| `id_emprestimo` | `INT` | PK | Sim | `AUTO_INCREMENT` | Identificador único do empréstimo. |
| `id_aluno` | `INT` | FK | Sim | — | Aluno responsável; referencia `alunos.id_aluno`. |
| `data_emprestimo` | `DATE` | — | Sim | — | Data em que o empréstimo foi realizado. |
| `data_devolucao` | `DATE` | — | Não | `NULL` | Data de devolução; fica nula enquanto não for informada. |
| `data_cad` | `TIMESTAMP` | — | Sim | `CURRENT_TIMESTAMP` | Data e hora de criação do registro. |

## `itens_emprestimo`

| Campo | Tipo | Chave | Obrigatório | Padrão / geração | Descrição |
|---|---|---|---|---|---|
| `id_emprestimo` | `INT` | PK composta, FK | Sim | — | Identifica o empréstimo; compõe a chave primária e referencia `emprestimos.id_emprestimo`. |
| `id_livro` | `INT` | PK composta, FK | Sim | — | Identifica o livro; compõe a chave primária e referencia `livros.id_livro`. |

