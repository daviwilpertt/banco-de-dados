CREATE DATABASE prova_4;

USE prova_4;

CREATE TABLE cliente (
    id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(45),
    cpf BIGINT(11) UNIQUE
);

CREATE TABLE produto (
    id_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(45),
    codigo VARCHAR(45),
    estoque INT
);

CREATE TABLE compra (
    id_compra INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_horario DATETIME,
    quantidade INT,
    produto_id INT,
    cliente_id INT,
    FOREIGN KEY (produto_id) REFERENCES produto (id_produto),
    FOREIGN KEY (cliente_id) REFERENCES cliente (id_cliente)
);

INSERT INTO
    cliente (nome_cliente, cpf)
VALUES ('davi', 12345678763),
    ('aniel', 98765432234),
    ('leonardo', 09876543245);

DELIMITER $$
CREATE PROCEDURE inserir_produto (nome_produtoA VARCHAR(45), codigoA VARCHAR(45), estoqueA INT)
BEGIN 
DECLARE msg TEXT(100);
IF CHAR_LENGTH(codigoA) >= 5 THEN
    INSERT INTO produto
    (nome_produto, codigo, estoque) 
    VALUES
    (nome_produtoA, codigoA, estoqueA);
    SET msg = 'produto inserido';
ELSE 
    SET msg = 'codigo deve ter 5 digitos';
END IF;
SELECT msg;
END; $$

CALL inserir_produto ('leite', '643663', 1000);

DELIMITER $$
CREATE TRIGGER estoque_atualizado
AFTER INSERT ON compra
FOR EACH ROW
BEGIN
DECLARE estoque_atual INT;

SELECT estoque INTO estoque_atual FROM produto WHERE id_produto = NEW.produto_id;

IF NEW.quantidade > estoque_atual THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'estoque indisponivel';
ELSE
    UPDATE produto SET estoque = estoque - NEW.quantidade
    WHERE id_produto = NEW.produto_id;
END IF;
END $$

DROP Trigger estoque_atualizado;

INSERT INTO
    compra (
        data_horario,
        quantidade,
        produto_id,
        cliente_id
    )
VALUES ('2024-10-25 23:00', 4, 6, 2);


SELECT
    id_produto,
    nome_produto,
    codigo,
    SUM(compra.quantidade) AS total_comprado
FROM produto
    JOIN compra ON compra.produto_id = produto.id_produto
GROUP BY
    produto.id_produto,
    produto.nome_produto,
    produto.codigo
ORDER BY produto.id_produto;



SELECT produto.id_produto, produto.nome_produto, produto.codigo, AVG(compra.quantidade) AS media_total_comprado
FROM produto
    JOIN compra ON compra.produto_id = produto.id_produto
GROUP BY
    produto.id_produto,
    produto.nome_produto,
    produto.codigo
ORDER BY produto.id_produto;