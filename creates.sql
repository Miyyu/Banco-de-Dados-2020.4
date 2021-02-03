CREATE TABLE membro(
    num_membro INT CHECK(idade > 0) PRIMARY KEY,
    nome VARCHAR(25) NOT NULL,
    idade INT CHECK(idade > 0) NOT NULL
);

CREATE TABLE livro(
    isbn BIGINT PRIMARY KEY,
    titulo VARCHAR(45) NOT NULL,
    autores VARCHAR(25) NOT NULL,
    editora VARCHAR(15) NOT NULL
);

CREATE TABLE emprestado(
    num_membro INT NOT NULL,
    isbn BIGINT NOT NULL,
    data DATE NOT NULL,
    FOREIGN KEY (num_membro) REFERENCES membro(num_membro),
    FOREIGN KEY (isbn) REFERENCES livro(isbn)
);