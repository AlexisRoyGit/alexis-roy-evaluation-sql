-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: introduction
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `cinemas`
--

DROP TABLE IF EXISTS `cinemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemas` (
  `id_cinemas` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `location` varchar(200) NOT NULL,
  PRIMARY KEY (`id_cinemas`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemas`
--

LOCK TABLES `cinemas` WRITE;
/*!40000 ALTER TABLE `cinemas` DISABLE KEYS */;
INSERT INTO `cinemas` VALUES (1,'Cinema Pathé Gaumont','Paris'),(2,'Cinema Europacorp','Nices'),(3,'Cinéma UGC','Toulouse');
/*!40000 ALTER TABLE `cinemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id_clients` char(36) NOT NULL,
  `priceTicket` decimal(10,2) NOT NULL,
  `cinema` int(11) NOT NULL,
  PRIMARY KEY (`id_clients`),
  KEY `cinema` (`cinema`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`cinema`) REFERENCES `cinemas` (`id_cinemas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES ('f1cc6dc4-cfdd-11ed-9621-d8c4977be9d4',9.20,1),('f1cc8a0e-cfdd-11ed-9621-d8c4977be9d4',7.60,2),('f1cc8b81-cfdd-11ed-9621-d8c4977be9d4',5.90,3);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films` (
  `id_films` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `duration` varchar(50) NOT NULL,
  PRIMARY KEY (`id_films`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` VALUES (1,'Avatar 2','3 heures et 12 minutes'),(2,'Scream 6','2 heures et 04 minutes'),(3,'Le chat potté 2','1 heure et 41 minutes');
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salles`
--

DROP TABLE IF EXISTS `salles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salles` (
  `id_salles` char(36) NOT NULL,
  `numberRoom` int(2) NOT NULL,
  `placesAvailable` int(3) NOT NULL,
  `hourDebut` datetime NOT NULL,
  `cinema` int(11) NOT NULL,
  `film` int(11) NOT NULL,
  PRIMARY KEY (`id_salles`),
  KEY `cinema` (`cinema`),
  KEY `film` (`film`),
  CONSTRAINT `salles_ibfk_1` FOREIGN KEY (`cinema`) REFERENCES `cinemas` (`id_cinemas`),
  CONSTRAINT `salles_ibfk_2` FOREIGN KEY (`film`) REFERENCES `films` (`id_films`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salles`
--

LOCK TABLES `salles` WRITE;
/*!40000 ALTER TABLE `salles` DISABLE KEYS */;
INSERT INTO `salles` VALUES ('3da68dae-cfde-11ed-9621-d8c4977be9d4',2,15,'2023-03-19 10:30:00',1,1),('3da6ad00-cfde-11ed-9621-d8c4977be9d4',4,11,'2023-03-19 10:30:00',1,1),('3da6aefd-cfde-11ed-9621-d8c4977be9d4',7,22,'2023-03-19 10:30:00',1,1),('3da6afe8-cfde-11ed-9621-d8c4977be9d4',10,11,'2023-03-19 18:20:00',1,2),('3da6b0c2-cfde-11ed-9621-d8c4977be9d4',7,78,'2023-03-19 12:00:00',2,2),('3da6b197-cfde-11ed-9621-d8c4977be9d4',5,34,'2023-03-19 14:20:00',2,3),('3da6b261-cfde-11ed-9621-d8c4977be9d4',2,154,'2023-03-19 15:10:00',2,1),('3da6b370-cfde-11ed-9621-d8c4977be9d4',1,140,'2023-03-19 11:40:00',3,1),('3da6b455-cfde-11ed-9621-d8c4977be9d4',8,14,'2023-03-19 20:30:00',3,3),('3da6b522-cfde-11ed-9621-d8c4977be9d4',4,77,'2023-03-19 19:10:00',3,2);
/*!40000 ALTER TABLE `salles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-31 18:16:49
