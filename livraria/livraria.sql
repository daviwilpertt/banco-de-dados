/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
DROP TABLE IF EXISTS autor;
CREATE TABLE `autor` (
  `id_autor` int NOT NULL AUTO_INCREMENT,
  `nome_autor` varchar(45) DEFAULT NULL,
  `rg_autor` bigint DEFAULT NULL,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS cliente;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome_cliente` varchar(45) DEFAULT NULL,
  `CPF_cliente` bigint DEFAULT NULL,
  `rua_cliente` varchar(45) DEFAULT NULL,
  `bairro_cliente` varchar(45) DEFAULT NULL,
  `cidade_cliente` varchar(45) DEFAULT NULL,
  `estado_cliente` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS editora;
CREATE TABLE `editora` (
  `id_editora` int NOT NULL AUTO_INCREMENT,
  `nome_fantasia_editora` varchar(45) DEFAULT NULL,
  `razao_social_editora` varchar(45) DEFAULT NULL,
  `telefone_editora` varchar(45) DEFAULT NULL,
  `rua_editora` varchar(45) DEFAULT NULL,
  `bairro_editora` varchar(45) DEFAULT NULL,
  `cidade_editora` varchar(45) DEFAULT NULL,
  `estado_editora` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_editora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS financiador;
CREATE TABLE `financiador` (
  `id_financiador` int NOT NULL AUTO_INCREMENT,
  `nome_financiador` varchar(45) DEFAULT NULL,
  `CNPJ_financiador` bigint DEFAULT NULL,
  PRIMARY KEY (`id_financiador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS livro;
CREATE TABLE `livro` (
  `id_livro` int NOT NULL AUTO_INCREMENT,
  `ISBN_livro` int DEFAULT NULL,
  `titulo_livro` varchar(45) DEFAULT NULL,
  `valor_livro` decimal(3,2) DEFAULT NULL,
  `categoria_livro` varchar(45) DEFAULT NULL,
  `autor_id` int DEFAULT NULL,
  `editora_id` int DEFAULT NULL,
  `financiador_id` int DEFAULT NULL,
  PRIMARY KEY (`id_livro`),
  KEY `autor_id` (`autor_id`),
  KEY `editora_id` (`editora_id`),
  KEY `financiador_id` (`financiador_id`),
  CONSTRAINT `livro_ibfk_1` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id_autor`),
  CONSTRAINT `livro_ibfk_2` FOREIGN KEY (`editora_id`) REFERENCES `editora` (`id_editora`),
  CONSTRAINT `livro_ibfk_3` FOREIGN KEY (`financiador_id`) REFERENCES `financiador` (`id_financiador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO autor(id_autor,nome_autor,rg_autor) VALUES('1','\'Laura Montenegro\'','32546895325'),('2','\'Gabriel Herrena\'','73462790525'),('3','\'Laura Santos\'','42578502146'),('4','\'Ricardo Mendes\'','61479053680'),('5','\'Sofia Fernandes\'','85124680975');

INSERT INTO cliente(id_cliente,nome_cliente,CPF_cliente,rua_cliente,bairro_cliente,cidade_cliente,estado_cliente) VALUES('1','\'pedro\'','43215678906','\'Rua Seu Jorge\'','\'Primavera\'','\'Belo Porto\'','\'São Paulo\''),('2','\'joão\'','54321578905','\'Avenida Perigo\'','\'São Vicente\'','\'General\'','\'Espirito Sancto\''),('3','\'helen\'','75321689053','\'Centro\'','\'Lagosta\'','\'Lagoa Nova\'','\'Rondônia\''),('4','\'guilerme\'','16421456789','\'Servidão Samambaia\'','\'Eucalipto\'','\'Pinheiros\'','\'Pará\''),('5','\'nego ney\'','12345678901','\'Rua dos Sonhos\'','\'Insonia\'','\'Ilusão\'','\'Mental\'');


