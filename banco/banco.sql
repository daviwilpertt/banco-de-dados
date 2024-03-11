/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
DROP TABLE IF EXISTS agencia;
CREATE TABLE `agencia` (
  `id_agencia` int NOT NULL AUTO_INCREMENT,
  `nome_agencia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_agencia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS categoria_cliente;
CREATE TABLE `categoria_cliente` (
  `id_categoria_cliente` int NOT NULL AUTO_INCREMENT,
  `nome_categoria_cliente` varchar(45) DEFAULT NULL,
  `observacao` text,
  PRIMARY KEY (`id_categoria_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS cliente;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome_cliente` varchar(45) DEFAULT NULL,
  `cpf_cnpj` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `des_rua` varchar(45) DEFAULT NULL,
  `des_numero` varchar(45) DEFAULT NULL,
  `des_bairro` varchar(45) DEFAULT NULL,
  `des_cidade` varchar(45) DEFAULT NULL,
  `des_CEP` varchar(45) DEFAULT NULL,
  `categoria_cliente_id` int DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `categoria_cliente_id` (`categoria_cliente_id`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`categoria_cliente_id`) REFERENCES `categoria_cliente` (`id_categoria_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS tipo_conta;
CREATE TABLE `tipo_conta` (
  `id_tipo_conta` int NOT NULL AUTO_INCREMENT,
  `des_tipo_conta` text,
  PRIMARY KEY (`id_tipo_conta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;