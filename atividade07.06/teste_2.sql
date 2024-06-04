CREATE DATABASE teste_2;

USE teste_2;

CREATE TABLE cliente (
    id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(45),
    cidade VARCHAR(45)
);

CREATE TABLE livraria (
    id_livraria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_livraria VARCHAR(45),
    cnpf BIGINT(14)
);

create user 'adm'@'localhost';
create user 'manutencao'@'localhost';
create user 'padrao'@'localhost';

GRANT select, insert, alter, drop, delete ON *.* to 'adm'@'localhost';

GRANT select, alter ON *.* to 'manutencao'@'localhost';

GRANT select ON *.* to 'padrao'@'localhost';

show grants for 'adm'@'localhost';
show grants for 'padrao'@'localhost';