CREATE TABLE membro(
    num_membro INT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    idade INT CHECK(idade > 0) NOT NULL
);

CREATE TABLE livro(
    isbn BIGINT PRIMARY KEY,
    titulo TEXT NOT NULL,
    autores VARCHAR(40) NOT NULL,
    editora VARCHAR(25) NOT NULL
);

CREATE TABLE emprestado(
    num_membro INT NOT NULL,
    isbn BIGINT NOT NULL,
    data DATE NOT NULL,
    FOREIGN KEY (num_membro) REFERENCES membro(num_membro),
    FOREIGN KEY (isbn) REFERENCES livro(isbn)
);