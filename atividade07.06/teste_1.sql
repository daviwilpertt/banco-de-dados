CREATE DATABASE teste1;

USE teste1;

CREATE TABLE estudante (
    id_estudante INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_estudante VARCHAR(45),
    matricula INT
);

CREATE TABLE professor (
    id_professor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_professor VARCHAR(45),
    cpf BIGINT(11)
);



