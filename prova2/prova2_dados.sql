-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: prova2
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `id_aluno` int NOT NULL AUTO_INCREMENT,
  `nome_aluno` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `cpf` bigint DEFAULT NULL,
  PRIMARY KEY (`id_aluno`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,'pedro arenoso','pedroareia@gmail.com',12345678910),(2,'joao feijao','feijao@hotmail.com',9876543211),(3,'alice helice','helicoptero@outlook.com',9876543212),(4,'aniel pastel','pasteldojapa@hotmail.com.br',87654321245),(5,'davi wilpert','daviwilpertt@gmail.com',11357908642);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina` (
  `id_disciplina` int NOT NULL AUTO_INCREMENT,
  `nome_disciplina` varchar(45) DEFAULT NULL,
  `carga_horaria` int DEFAULT NULL,
  PRIMARY KEY (`id_disciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (1,'portugues',120),(2,'matmatica',120),(3,'biologia',80),(4,'historia',80),(5,'ingles',100);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;

--
-- Table structure for table `inscricao`
--

DROP TABLE IF EXISTS `inscricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscricao` (
  `id_inscricao` int NOT NULL AUTO_INCREMENT,
  `data_inscricao` date DEFAULT NULL,
  `aluno_id` int DEFAULT NULL,
  `turma_id` int DEFAULT NULL,
  PRIMARY KEY (`id_inscricao`),
  KEY `aluno_id` (`aluno_id`),
  KEY `turma_id` (`turma_id`),
  CONSTRAINT `inscricao_ibfk_1` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`id_aluno`),
  CONSTRAINT `inscricao_ibfk_2` FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id_turma`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscricao`
--

/*!40000 ALTER TABLE `inscricao` DISABLE KEYS */;
INSERT INTO `inscricao` VALUES (1,'2024-01-01',4,1),(2,'2024-01-01',3,2),(3,'2024-01-01',2,3),(4,'2024-06-01',2,3),(5,'2024-06-01',4,1),(6,'2024-06-01',3,2),(7,'2024-06-01',NULL,NULL);
/*!40000 ALTER TABLE `inscricao` ENABLE KEYS */;

--
-- Table structure for table `mensalidade`
--

DROP TABLE IF EXISTS `mensalidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensalidade` (
  `id_mensalidade` int NOT NULL AUTO_INCREMENT,
  `data_vencimento` date DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `status_pagamento` enum('fatura paga','em debito') DEFAULT NULL,
  `inscricao_id` int DEFAULT NULL,
  PRIMARY KEY (`id_mensalidade`),
  KEY `inscricao_id` (`inscricao_id`),
  CONSTRAINT `mensalidade_ibfk_1` FOREIGN KEY (`inscricao_id`) REFERENCES `inscricao` (`id_inscricao`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensalidade`
--

/*!40000 ALTER TABLE `mensalidade` DISABLE KEYS */;
INSERT INTO `mensalidade` VALUES (1,'2024-01-05',600.00,'fatura paga',1),(2,'2024-01-05',600.00,'fatura paga',2),(3,'2024-01-05',600.00,'fatura paga',3),(4,'2024-06-05',700.00,'em debito',4),(5,'2024-06-05',700.00,'em debito',5),(6,'2024-06-05',700.00,'em debito',6);
/*!40000 ALTER TABLE `mensalidade` ENABLE KEYS */;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turma` (
  `id_turma` int NOT NULL AUTO_INCREMENT,
  `turno` enum('matutino','vespertino','noturno') DEFAULT NULL,
  `disciplina_id` int DEFAULT NULL,
  PRIMARY KEY (`id_turma`),
  KEY `disciplina_id` (`disciplina_id`),
  CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplina` (`id_disciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` VALUES (1,'matutino',1),(2,'vespertino',4),(3,'matutino',2),(4,'noturno',3),(5,'noturno',5);
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;

--
-- Temporary view structure for view `vw_inscricao_aluno`
--

DROP TABLE IF EXISTS `vw_inscricao_aluno`;
/*!50001 DROP VIEW IF EXISTS `vw_inscricao_aluno`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_inscricao_aluno` AS SELECT 
 1 AS `id_inscricao`,
 1 AS `nome_aluno`,
 1 AS `cpf`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'prova2'
--

--
-- Final view structure for view `vw_inscricao_aluno`
--

/*!50001 DROP VIEW IF EXISTS `vw_inscricao_aluno`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_inscricao_aluno` AS select `inscricao`.`id_inscricao` AS `id_inscricao`,`aluno`.`nome_aluno` AS `nome_aluno`,`aluno`.`cpf` AS `cpf` from (`inscricao` join `aluno` on((`inscricao`.`aluno_id` = `aluno`.`id_aluno`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-09 20:00:44
