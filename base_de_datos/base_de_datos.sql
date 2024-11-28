-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: prueba
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Juan Pérez','juan.perez@example.com','2024-10-01 14:15:00'),(2,'Ana García','ana.garcia@example.com','2024-10-03 18:30:00'),(3,'Carlos López','carlos.lopez@example.com','2024-10-05 20:45:00'),(4,'María Fernández','maria.fernandez@example.com','2024-10-07 12:20:00'),(5,'Luis Gómez','luis.gomez@example.com','2024-10-08 15:10:00'),(6,'Carmen Ramírez','carmen.ramirez@example.com','2024-10-10 11:55:00'),(7,'José Sánchez','jose.sanchez@example.com','2024-10-12 14:40:00'),(8,'Laura Torres','laura.torres@example.com','2024-10-13 18:25:00'),(9,'Ricardo Morales','ricardo.morales@example.com','2024-10-15 20:50:00'),(10,'Patricia Ruiz','patricia.ruiz@example.com','2024-10-17 16:35:00'),(11,'Andrés Romero','andres.romero@example.com','2024-10-19 22:15:00'),(12,'Gloria Vargas','gloria.vargas@example.com','2024-10-20 10:40:00'),(13,'Santiago Peña','santiago.pena@example.com','2024-10-22 13:05:00'),(14,'Adriana Herrera','adriana.herrera@example.com','2024-10-24 17:00:00'),(15,'Pablo Cruz','pablo.cruz@example.com','2024-10-25 19:30:00'),(16,'Natalia León','natalia.leon@example.com','2024-10-27 11:15:00'),(17,'Diego Castro','diego.castro@example.com','2024-10-29 14:50:00'),(18,'Lorena Méndez','lorena.mendez@example.com','2024-10-31 21:40:00'),(19,'Sebastián Ortiz','sebastian.ortiz@example.com','2024-11-01 12:25:00'),(20,'Edgar Ovelar','isabel.flores@example.com','2024-11-03 15:35:00'),(21,'Mateo Rojas','mateo.rojas@example.com','2024-11-05 13:15:00'),(22,'Gabriela Soto','gabriela.soto@example.com','2024-11-07 18:00:00'),(23,'Hugo Medina','hugo.medina@example.com','2024-11-09 20:20:00'),(24,'Sandra Fuentes','sandra.fuentes@example.com','2024-11-10 17:45:00'),(25,'Mario Vega','mario.vega@example.com','2024-11-12 12:30:00'),(26,'Beatriz Chávez','beatriz.chavez@example.com','2024-11-13 21:55:00'),(27,'Javier Delgado','javier.delgado@example.com','2024-11-15 10:40:00'),(28,'Rocío Navarro','rocio.navarro@example.com','2024-11-16 15:20:00'),(29,'Emilio Montes','emilio.montes@example.com','2024-11-18 13:55:00'),(30,'Claudia Lara','claudia.lara@example.com','2024-11-20 16:05:00'),(31,'Fernando Salazar','fernando.salazar@example.com','2024-11-21 18:40:00'),(32,'Mónica Aguilar','monica.aguilar@example.com','2024-11-23 14:15:00'),(33,'Ángel Pérez','angel.perez@example.com','2024-11-24 19:50:00'),(34,'Lucía Castillo','lucia.castillo@example.com','2024-11-26 11:35:00'),(35,'Pedro Herrera','pedro.herrera@example.com','2024-11-28 22:10:00'),(36,'Elena Márquez','elena.marquez@example.com','2024-11-29 10:25:00'),(37,'Roberto Esquivel','roberto.esquivel@example.com','2024-11-30 17:40:00'),(38,'Verónica Paredes','veronica.paredes@example.com','2024-12-01 12:15:00'),(39,'Francisco Bravo','francisco.bravo@example.com','2024-12-02 15:50:00'),(40,'Cecilia Reyes','cecilia.reyes@example.com','2024-12-03 20:25:00'),(41,'Gustavo Jiménez','gustavo.jimenez@example.com','2024-12-04 13:30:00'),(42,'Daniela Soto','daniela.soto@example.com','2024-12-05 16:15:00'),(43,'Felipe Martínez','felipe.martinez@example.com','2024-12-06 11:50:00'),(44,'Raquel Núñez','raquel.nunez@example.com','2024-12-07 21:35:00'),(45,'Esteban Cabrera','esteban.cabrera@example.com','2024-12-08 10:20:00'),(46,'Marina Villalobos','marina.villalobos@example.com','2024-12-09 15:40:00'),(47,'Tomás Valle','tomas.valle@example.com','2024-12-10 17:25:00'),(48,'Victoria Gutiérrez','victoria.gutierrez@example.com','2024-12-11 22:50:00'),(49,'Enrique Campos','enrique.campos@example.com','2024-12-12 13:35:00'),(50,'Alicia Serrano','alicia.serrano@example.com','2024-12-13 18:20:00');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-28 17:10:11
