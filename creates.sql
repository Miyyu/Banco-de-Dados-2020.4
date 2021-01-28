CREATE TABLE membro(
    num_membro INT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    idade INT CHECK(idade > 0) NOT NULL
);