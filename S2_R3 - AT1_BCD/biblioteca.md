# Biblioteca Escolar:

---

### 1) A escola possui um sistema de biblioteca em que:
 - Alunos podem pegar livros emprestados.
 - Um livro pode ser emprestado várias vezes, mas um empréstimo registra apenas um livro e um aluno por vez.
### 2) Criar dicionário de dados das entidades existentes na modelagem.

---

```mermaid
    erDiagram
    emprestimo{
        int id PK "unique autoincrement"
        int id_aluno FK "NOT NULL"
        int id_livro FK "NOT NULL"
        date data_emprestimo "NOT NULL"
        date data_devolucao "NULL"
        boolean status "NOT NULL"
    }
    aluno{
        int id PK "unique autoincrement"
        string nome "NULL"
        date data_nascimento "NOT NULL"
        string matricula "NOT NULL"
    }
    livro{
        int id PK "unique autoincrement"
        string titulo "NOT NULL"
        string ISBN "NOT NULL"
        string nome_autor "NOT NULL"
    }

aluno ||--|{ emprestimo : "realiza"
livro ||--|{ emprestimo : "pertence a"


```