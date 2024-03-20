/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
DROP TABLE IF EXISTS autor;
CREATE TABLE `autor` (
  `id_autor` int NOT NULL AUTO_INCREMENT,
  `nome_autor` varchar(45) NOT NULL,
  `rg_autor` bigint DEFAULT NULL,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS cliente;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome_cliente` varchar(45) NOT NULL,
  `CPF_cliente` bigint DEFAULT NULL,
  `rua_cliente` varchar(45) DEFAULT NULL,
  `bairro_cliente` varchar(45) DEFAULT NULL,
  `cidade_cliente` varchar(45) DEFAULT NULL,
  `estado_cliente` varchar(45) DEFAULT NULL,
  `pais_cliente` varchar(45) DEFAULT (_utf8mb4'Brasil'),
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `CPF_cliente` (`CPF_cliente`),
  UNIQUE KEY `CPF_cliente_2` (`CPF_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS editora;
CREATE TABLE `editora` (
  `id_editora` int NOT NULL AUTO_INCREMENT,
  `nome_fantasia_editora` enum('Editora A','Editora B','Editora C') NOT NULL,
  `razao_social_editora` varchar(45) NOT NULL,
  `telefone_editora` bigint DEFAULT NULL,
  `rua_editora` varchar(45) DEFAULT NULL,
  `bairro_editora` varchar(45) DEFAULT NULL,
  `cidade_editora` varchar(45) DEFAULT NULL,
  `estado_editora` varchar(45) DEFAULT NULL,
  `pais_editora` varchar(45) DEFAULT (_utf8mb4'Brasil'),
  PRIMARY KEY (`id_editora`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS financiador;
CREATE TABLE `financiador` (
  `id_financiador` int NOT NULL AUTO_INCREMENT,
  `nome_financiador` varchar(45) DEFAULT (_utf8mb4'Financiador Público'),
  `CNPJ_financiador` bigint DEFAULT NULL,
  PRIMARY KEY (`id_financiador`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS livro;
CREATE TABLE `livro` (
  `id_livro` int NOT NULL AUTO_INCREMENT,
  `ISBN_livro` bigint DEFAULT NULL,
  `titulo_livro` varchar(45) DEFAULT NULL,
  `valor_livro` decimal(10,2) DEFAULT NULL,
  `categoria_livro` enum('horror','romance','ficção','ação') DEFAULT NULL,
  `autor_id` int DEFAULT NULL,
  `editora_id` int DEFAULT NULL,
  `financiador_id` int DEFAULT NULL,
  PRIMARY KEY (`id_livro`),
  KEY `autor_id` (`autor_id`),
  KEY `editora_id` (`editora_id`),
  KEY `financiador_id` (`financiador_id`),
  CONSTRAINT `livro_ibfk_1` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id_autor`),
  CONSTRAINT `livro_ibfk_2` FOREIGN KEY (`editora_id`) REFERENCES `editora` (`id_editora`),
  CONSTRAINT `livro_ibfk_3` FOREIGN KEY (`financiador_id`) REFERENCES `financiador` (`id_financiador`),
  CONSTRAINT `livro_chk_1` CHECK ((`valor_livro` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS pedido;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `qnt_pedido` int DEFAULT NULL,
  `livro_id` int DEFAULT NULL,
  `cliente_id` int DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `livro_id` (`livro_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`livro_id`) REFERENCES `livro` (`id_livro`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `pedido_chk_1` CHECK ((`qnt_pedido` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO autor(id_autor,nome_autor,rg_autor) VALUES('6','\'manoel gomes\'','12345678910'),('7','\'luan perereira\'','12345678908'),('8','\'renato aragão\'','1234567895');

INSERT INTO cliente(id_cliente,nome_cliente,CPF_cliente,rua_cliente,bairro_cliente,cidade_cliente,estado_cliente,pais_cliente) VALUES('8','\'elias maluco\'','12345675323','NULL','NULL','NULL','NULL','\'Brasil\''),('9','\'robocop\'','12345675322','NULL','NULL','NULL','NULL','\'Brasil\''),('10','\'dinho do mamonas\'','1234567892','NULL','NULL','NULL','NULL','\'Brasil\'');

INSERT INTO editora(id_editora,nome_fantasia_editora,razao_social_editora,telefone_editora,rua_editora,bairro_editora,cidade_editora,estado_editora,pais_editora) VALUES('13','\'Editora B\'','\'cereja no bolo\'','1234567904','\'rua sem saida\'','\'bairro sem entrada\'','\'cidade acabada\'','\'estado próprio\'','\'Brasil\''),('14','\'Editora C\'','\'sem querer\'','12348900987','\'rua maresia\'','\'bairro alto mar\'','\'cidade bonita\'','\'estado islamico\'','\'Brasil\''),('15','\'Editora A\'','\'anhanguera\'','123456787654','\'rua pistão\'','\'bairro loucurada\'','\'cidade do mofo\'','\'estado liquído\'','\'Brasil\'');

INSERT INTO financiador(id_financiador,nome_financiador,CNPJ_financiador) VALUES('11','\'Financiador Público\'','1234567890123'),('12','\'pedrinho matador\'','123456789055'),('13','\'joao derruba avião\'','123456788765');

INSERT INTO livro(id_livro,ISBN_livro,titulo_livro,valor_livro,categoria_livro,autor_id,editora_id,financiador_id) VALUES('12','9788537807842','\'A Arte da Guerra\'','30.00','\'ação\'','NULL','NULL','NULL'),('13','9788576834848','\'O Pequeno Príncipe\'','40.00','\'ficção\'','NULL','NULL','NULL'),('14','9788535914849','\'Cem Anos de Solidão\'','50.00','\'romance\'','NULL','NULL','NULL'),('15','9788537807842','\'A Arte da Guerra\'','30.00','\'ação\'','NULL','NULL','NULL'),('16','9788576834848','\'O Pequeno Príncipe\'','40.00','\'ficção\'','NULL','NULL','NULL'),('17','9788535914849','\'Cem Anos de Solidão\'','50.00','\'romance\'','NULL','NULL','NULL');
INSERT INTO pedido(id_pedido,qnt_pedido,livro_id,cliente_id) VALUES('12','3','12','8'),('13','6','14','9'),('14','9','16','10');