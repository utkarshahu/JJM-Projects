CREATE DATABASE  IF NOT EXISTS `district_wise_drains_audit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `district_wise_drains_audit`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: district_wise_drains_audit
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `district_totals`
--

DROP TABLE IF EXISTS `district_totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district_totals` (
  `total_id` int NOT NULL AUTO_INCREMENT,
  `district_id` int DEFAULT NULL,
  `total_drains` int DEFAULT NULL,
  `total_discharge` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`total_id`),
  KEY `district_id` (`district_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district_totals`
--

LOCK TABLES `district_totals` WRITE;
/*!40000 ALTER TABLE `district_totals` DISABLE KEYS */;
/*!40000 ALTER TABLE `district_totals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `district_id` int NOT NULL AUTO_INCREMENT,
  `district_name` varchar(100) NOT NULL,
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'Agra'),(2,'Aligarh'),(3,'Ambedkar Nagar'),(4,'Amethi'),(5,'Amroha'),(6,'Auraiya'),(7,'Ayodhya'),(8,'Azamgarh'),(9,'Baghpat'),(10,'Ballia'),(11,'Banda'),(12,'Barabanki'),(13,'Bareilly'),(14,'Bijnor'),(15,'Bulandshahr'),(16,'Chandauli'),(17,'Chitrakoot'),(18,'Deoria'),(19,'Etah'),(20,'Etawah'),(21,'Farrukhabad'),(22,'Firozabad'),(23,'Gautam Buddha Nagar'),(24,'Ghaziabad'),(25,'Ghazipur'),(26,'Gorakhpur'),(27,'Hamirpur'),(28,'Hapur'),(29,'Hardoi'),(30,'Hathras'),(31,'Jalaun'),(32,'Jaunpur'),(33,'Jhansi'),(34,'Kannauj'),(35,'Kanpur Nagar'),(36,'Kasganj'),(37,'Kaushambi'),(38,'Lakhimpur Kheri'),(39,'Lalitpur'),(40,'Lucknow'),(41,'Mathura'),(42,'Mau'),(43,'Meerut'),(44,'Mirzapur'),(45,'Moradabad'),(46,'Muzaffarnagar'),(47,'Pilibhit'),(48,'Pratapgarh'),(49,'PrayagRaj'),(50,'Rae Bareli'),(51,'Rampur'),(52,'Saharanpur'),(53,'Sant Kabeer Nagar'),(54,'Sant Ravidas Nagar'),(55,'Shamli'),(56,'Sitapur'),(57,'Sonbhadra'),(58,'Sultanpur'),(59,'Unnao'),(60,'Varanasi');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drain_master`
--

DROP TABLE IF EXISTS `drain_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drain_master` (
  `drain_id` int NOT NULL AUTO_INCREMENT,
  `river_id` int NOT NULL,
  `total_drains` int DEFAULT NULL,
  `total_discharge` decimal(12,2) DEFAULT NULL,
  `scrape_time` datetime DEFAULT NULL,
  PRIMARY KEY (`drain_id`),
  KEY `river_id` (`river_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drain_master`
--

LOCK TABLES `drain_master` WRITE;
/*!40000 ALTER TABLE `drain_master` DISABLE KEYS */;
INSERT INTO `drain_master` VALUES (1,1,90,286.85,'2026-06-01 13:30:33'),(2,2,8,145.40,'2026-06-01 13:30:33'),(3,3,6,19.41,'2026-06-01 13:30:33'),(4,4,8,11.68,'2026-06-01 13:30:33'),(5,5,1,5.00,'2026-06-01 13:30:33'),(6,6,1,4.50,'2026-06-01 13:30:33'),(7,7,2,16.46,'2026-06-01 13:30:33'),(8,8,21,30.87,'2026-06-01 13:30:33'),(9,9,22,22.46,'2026-06-01 13:30:33'),(10,10,0,0.00,'2026-06-01 13:30:33'),(11,11,4,8.60,'2026-06-01 13:30:33'),(12,12,1,12.10,'2026-06-01 13:30:33'),(13,13,1,10.44,'2026-06-01 13:30:33'),(14,14,1,18.00,'2026-06-01 13:30:33'),(15,15,13,41.23,'2026-06-01 13:30:33'),(16,16,1,18.82,'2026-06-01 13:30:33'),(17,17,1,0.87,'2026-06-01 13:30:33'),(18,18,3,26.05,'2026-06-01 13:30:33'),(19,19,3,5.06,'2026-06-01 13:30:33'),(20,20,17,59.99,'2026-06-01 13:30:33'),(21,21,2,29.33,'2026-06-01 13:30:33'),(22,22,1,5.00,'2026-06-01 13:30:33'),(23,23,16,0.00,'2026-06-01 13:30:33'),(24,24,13,3.83,'2026-06-01 13:30:33'),(25,25,1,4.00,'2026-06-01 13:30:33'),(26,26,2,30.99,'2026-06-01 13:30:33'),(27,27,8,47.72,'2026-06-01 13:30:33'),(28,28,2,54.26,'2026-06-01 13:30:33'),(29,29,2,28.00,'2026-06-01 13:30:33'),(30,30,2,52.00,'2026-06-01 13:30:33'),(31,31,0,0.00,'2026-06-01 13:30:33'),(32,32,8,306.49,'2026-06-01 13:30:33'),(33,33,34,35.88,'2026-06-01 13:30:33'),(34,34,7,3.57,'2026-06-01 13:30:33'),(35,35,9,49.96,'2026-06-01 13:30:33'),(36,36,6,27.00,'2026-06-01 13:30:33'),(37,37,24,47.82,'2026-06-01 13:30:33'),(38,38,2,2.80,'2026-06-01 13:30:33'),(39,39,1,1.40,'2026-06-01 13:30:33'),(40,40,1,6.00,'2026-06-01 13:30:33'),(41,41,2,7.50,'2026-06-01 13:30:33'),(42,42,1,1.08,'2026-06-01 13:30:33'),(43,43,10,16.32,'2026-06-01 13:30:33'),(44,44,1,11.00,'2026-06-01 13:30:33'),(45,45,14,23.44,'2026-06-01 13:30:33'),(46,46,10,42.00,'2026-06-01 13:30:33'),(47,47,4,20.00,'2026-06-01 13:30:33'),(48,48,27,188.45,'2026-06-01 13:30:33'),(49,49,9,98.42,'2026-06-01 13:30:33'),(50,50,3,13.53,'2026-06-01 13:30:33'),(51,51,2,0.50,'2026-06-01 13:30:33'),(52,52,3,8.00,'2026-06-01 13:30:33'),(53,53,5,6.68,'2026-06-01 13:30:33'),(54,54,1,20.00,'2026-06-01 13:30:33'),(55,55,1,54.78,'2026-06-01 13:30:33'),(56,56,33,550.98,'2026-06-01 13:30:33'),(57,57,15,8.27,'2026-06-01 13:30:33'),(58,58,38,81.58,'2026-06-01 13:30:33'),(59,59,5,2.21,'2026-06-01 13:30:33'),(60,60,0,0.00,'2026-06-01 13:30:33'),(61,61,2,2.46,'2026-06-01 13:30:33'),(62,62,3,307.22,'2026-06-01 13:30:33'),(63,63,49,33.92,'2026-06-01 13:30:33'),(64,64,24,97.97,'2026-06-01 13:30:33'),(65,65,3,7.40,'2026-06-01 13:30:33'),(66,66,10,73.84,'2026-06-01 13:30:33'),(67,67,4,100.00,'2026-06-01 13:30:33'),(68,68,4,7.10,'2026-06-01 13:30:33'),(69,69,5,1.59,'2026-06-01 13:30:33'),(70,70,48,167.70,'2026-06-01 13:30:33'),(71,71,33,125.90,'2026-06-01 13:30:33'),(72,72,9,2.12,'2026-06-01 13:30:33'),(73,73,7,32.80,'2026-06-01 13:30:33'),(74,74,3,33.39,'2026-06-01 13:30:33'),(75,75,105,114.68,'2026-06-01 13:30:33'),(76,76,4,15.65,'2026-06-01 13:30:33'),(77,77,0,0.00,'2026-06-01 13:30:33'),(78,78,2,4.15,'2026-06-01 13:30:33'),(79,79,2,11.50,'2026-06-01 13:30:33'),(80,80,12,35.72,'2026-06-01 13:30:33'),(81,81,1,12.00,'2026-06-01 13:30:33'),(82,82,21,12.72,'2026-06-01 13:30:33'),(83,83,2,3.40,'2026-06-01 13:30:33'),(84,84,6,14.57,'2026-06-01 13:30:33'),(85,85,8,23.32,'2026-06-01 13:30:33'),(86,86,28,73.73,'2026-06-01 13:30:33'),(87,87,43,226.80,'2026-06-01 13:30:33'),(88,88,1,78.00,'2026-06-01 13:30:33');
/*!40000 ALTER TABLE `drain_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `not_to_be_tapped_drains`
--

DROP TABLE IF EXISTS `not_to_be_tapped_drains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `not_to_be_tapped_drains` (
  `drain_id` int NOT NULL,
  `not_to_be_tapped_drains` int DEFAULT NULL,
  `not_to_be_tapped_discharge` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`drain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `not_to_be_tapped_drains`
--

LOCK TABLES `not_to_be_tapped_drains` WRITE;
/*!40000 ALTER TABLE `not_to_be_tapped_drains` DISABLE KEYS */;
INSERT INTO `not_to_be_tapped_drains` VALUES (1,0,0.00),(2,6,8.51),(3,0,0.00),(4,0,0.00),(5,1,5.00),(6,1,4.50),(7,0,0.00),(8,0,0.00),(9,0,0.00),(10,0,0.00),(11,0,0.00),(12,0,0.00),(13,0,0.00),(14,0,0.00),(15,2,0.02),(16,0,0.00),(17,0,0.00),(18,1,15.00),(19,0,0.00),(20,14,29.08),(21,0,0.00),(22,0,0.00),(23,0,0.00),(24,0,0.00),(25,0,0.00),(26,0,0.00),(27,1,8.00),(28,0,0.00),(29,0,0.00),(30,0,0.00),(31,0,0.00),(32,0,0.00),(33,23,26.17),(34,0,0.00),(35,0,0.00),(36,0,0.00),(37,0,0.00),(38,0,0.00),(39,0,0.00),(40,0,0.00),(41,0,0.00),(42,1,1.08),(43,0,0.00),(44,0,0.00),(45,0,0.00),(46,0,0.00),(47,0,0.00),(48,1,0.00),(49,0,0.00),(50,1,0.77),(51,0,0.00),(52,0,0.00),(53,0,0.00),(54,0,0.00),(55,0,0.00),(56,1,0.00),(57,0,0.00),(58,0,0.00),(59,0,0.00),(60,0,0.00),(61,2,2.46),(62,0,0.00),(63,27,6.53),(64,0,0.00),(65,0,0.00),(66,3,22.75),(67,1,10.00),(68,0,0.00),(69,0,0.00),(70,2,1.22),(71,3,0.17),(72,0,0.00),(73,0,0.00),(74,0,0.00),(75,6,17.04),(76,0,0.00),(77,0,0.00),(78,1,0.75),(79,0,0.00),(80,2,2.85),(81,0,0.00),(82,0,0.00),(83,0,0.00),(84,1,0.63),(85,0,0.00),(86,0,0.00),(87,0,0.00),(88,0,0.00);
/*!40000 ALTER TABLE `not_to_be_tapped_drains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partial_tapped_drains`
--

DROP TABLE IF EXISTS `partial_tapped_drains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partial_tapped_drains` (
  `drain_id` int NOT NULL,
  `partial_tapped_drains` int DEFAULT NULL,
  `partial_tapped_discharge` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`drain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partial_tapped_drains`
--

LOCK TABLES `partial_tapped_drains` WRITE;
/*!40000 ALTER TABLE `partial_tapped_drains` DISABLE KEYS */;
INSERT INTO `partial_tapped_drains` VALUES (1,8,207.28),(2,0,0.00),(3,0,0.00),(4,0,0.00),(5,0,0.00),(6,0,0.00),(7,0,0.00),(8,0,0.00),(9,0,0.00),(10,0,0.00),(11,0,0.00),(12,0,0.00),(13,0,0.00),(14,0,0.00),(15,0,0.00),(16,0,0.00),(17,0,0.00),(18,0,0.00),(19,0,0.00),(20,0,0.00),(21,0,0.00),(22,0,0.00),(23,0,0.00),(24,0,0.00),(25,0,0.00),(26,0,0.00),(27,0,0.00),(28,0,0.00),(29,0,0.00),(30,0,0.00),(31,0,0.00),(32,0,0.00),(33,0,0.00),(34,0,0.00),(35,0,0.00),(36,0,0.00),(37,0,0.00),(38,0,0.00),(39,0,0.00),(40,0,0.00),(41,0,0.00),(42,0,0.00),(43,0,0.00),(44,0,0.00),(45,1,0.45),(46,0,0.00),(47,0,0.00),(48,0,0.00),(49,2,57.95),(50,0,0.00),(51,0,0.00),(52,0,0.00),(53,0,0.00),(54,0,0.00),(55,0,0.00),(56,15,449.70),(57,0,0.00),(58,1,26.49),(59,0,0.00),(60,0,0.00),(61,0,0.00),(62,1,152.00),(63,0,0.00),(64,7,30.63),(65,0,0.00),(66,0,0.00),(67,1,40.00),(68,0,0.00),(69,0,0.00),(70,1,20.08),(71,0,0.00),(72,0,0.00),(73,0,0.00),(74,0,0.00),(75,0,0.00),(76,0,0.00),(77,0,0.00),(78,0,0.00),(79,0,0.00),(80,0,0.00),(81,0,0.00),(82,0,0.00),(83,0,0.00),(84,0,0.00),(85,0,0.00),(86,1,5.00),(87,1,10.94),(88,1,78.00);
/*!40000 ALTER TABLE `partial_tapped_drains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rivers`
--

DROP TABLE IF EXISTS `rivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rivers` (
  `river_id` int NOT NULL AUTO_INCREMENT,
  `district_id` int NOT NULL,
  `river_name` varchar(100) NOT NULL,
  PRIMARY KEY (`river_id`),
  KEY `district_id` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rivers`
--

LOCK TABLES `rivers` WRITE;
/*!40000 ALTER TABLE `rivers` DISABLE KEYS */;
INSERT INTO `rivers` VALUES (1,1,'Yamuna'),(2,2,'Aligarh  Drain ( Irrigation )'),(3,3,'Tamsa'),(4,3,'Ghaghara'),(5,4,'Gomti'),(6,5,'Ganga'),(7,6,'Yamuna'),(8,7,'Saryu'),(9,8,'Tamsa'),(10,9,'Harnandi (Hindon)'),(11,9,'Yamuna'),(12,10,'Ganga'),(13,11,'Ken'),(14,12,'Gomti'),(15,13,'NAKTIA RIVER'),(16,13,'Ram ganga'),(17,13,'DEVRANIYA'),(18,14,'Ganga'),(19,15,'Ganga'),(20,15,'Kali'),(21,16,'Ganga'),(22,17,'Yamuna'),(23,17,'Mandakini'),(24,18,'Ghaghra'),(25,19,'Ishan'),(26,20,'Yamuna'),(27,21,'Ganga'),(28,22,'Yamuna'),(29,23,'Harnandi (Hindon)'),(30,24,'Yamuna'),(31,24,'Kali'),(32,24,'Harnandi (Hindon)'),(33,25,'Ganga'),(34,26,'Ghaghra'),(35,26,'Rapti'),(36,26,'Rohini'),(37,26,'Ramgarhtal'),(38,27,'Betwa'),(39,27,'Yamuna'),(40,28,'Kali'),(41,28,'Ganga'),(42,29,'Sai'),(43,30,'Karvan'),(44,31,'Yamuna'),(45,32,'Gomti'),(46,33,'Pahunch'),(47,34,'Ganga'),(48,35,'Ganga'),(49,35,'Pandu'),(50,36,'kaali Nadi'),(51,37,'Ganga'),(52,38,'ULL RIVER'),(53,38,'Sarayan'),(54,39,'Betwa'),(55,40,'Sai'),(56,40,'Gomti'),(57,41,'Kosi Arterial Channel'),(58,41,'Yamuna'),(59,42,'Ghaghara'),(60,42,'Tamsa'),(61,43,'Harnandi (Hindon)'),(62,43,'Kali'),(63,44,'Ganga'),(64,45,'Ram ganga'),(65,46,'Harnandi (Hindon)'),(66,46,'Kali West'),(67,47,'Gomti'),(68,48,'Sai'),(69,48,'Ganga'),(70,49,'Ganga'),(71,49,'Yamuna'),(72,50,'Ganga'),(73,50,'Sai'),(74,51,'Ram ganga'),(75,52,'Harnandi (Hindon)'),(76,52,'Kali West'),(77,53,'Aami'),(78,54,'Morwa'),(79,54,'Varuna'),(80,55,'Krishni'),(81,55,'Yamuna'),(82,56,'Sarayan'),(83,57,'Sone'),(84,58,'Gomti'),(85,59,'Ganga'),(86,60,'Ganga'),(87,60,'Varuna'),(88,60,'Assi');
/*!40000 ALTER TABLE `rivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tapped_drains`
--

DROP TABLE IF EXISTS `tapped_drains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tapped_drains` (
  `drain_id` int NOT NULL,
  `tapped_drains` int DEFAULT NULL,
  `tapped_discharge` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`drain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tapped_drains`
--

LOCK TABLES `tapped_drains` WRITE;
/*!40000 ALTER TABLE `tapped_drains` DISABLE KEYS */;
INSERT INTO `tapped_drains` VALUES (1,21,61.25),(2,0,0.00),(3,0,0.00),(4,0,0.00),(5,0,0.00),(6,0,0.00),(7,0,0.00),(8,13,26.29),(9,0,0.00),(10,0,0.00),(11,4,8.60),(12,0,0.00),(13,0,0.00),(14,0,0.00),(15,11,41.21),(16,1,18.82),(17,1,0.87),(18,2,11.05),(19,3,5.06),(20,0,0.00),(21,0,0.00),(22,0,0.00),(23,0,0.00),(24,0,0.00),(25,1,4.00),(26,2,30.99),(27,7,39.72),(28,2,54.26),(29,0,0.00),(30,0,0.00),(31,0,0.00),(32,1,186.00),(33,0,0.00),(34,0,0.00),(35,0,0.00),(36,0,0.00),(37,24,47.82),(38,0,0.00),(39,0,0.00),(40,0,0.00),(41,2,7.50),(42,0,0.00),(43,0,0.00),(44,0,0.00),(45,13,22.99),(46,9,39.00),(47,3,14.00),(48,17,176.55),(49,4,31.31),(50,2,12.76),(51,0,0.00),(52,0,0.00),(53,0,0.00),(54,0,0.00),(55,0,0.00),(56,10,49.72),(57,0,0.00),(58,30,40.26),(59,0,0.00),(60,0,0.00),(61,0,0.00),(62,0,0.00),(63,18,19.26),(64,7,9.25),(65,3,7.40),(66,7,51.09),(67,1,20.00),(68,4,7.10),(69,0,0.00),(70,26,96.60),(71,28,123.50),(72,0,0.00),(73,0,0.00),(74,3,33.39),(75,38,30.25),(76,0,0.00),(77,0,0.00),(78,0,0.00),(79,0,0.00),(80,0,0.00),(81,1,12.00),(82,0,0.00),(83,0,0.00),(84,5,13.94),(85,5,15.92),(86,26,66.23),(87,18,106.33),(88,0,0.00);
/*!40000 ALTER TABLE `tapped_drains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `untapped_drains`
--

DROP TABLE IF EXISTS `untapped_drains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `untapped_drains` (
  `drain_id` int NOT NULL,
  `untapped_drains` int DEFAULT NULL,
  `untapped_discharge` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`drain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `untapped_drains`
--

LOCK TABLES `untapped_drains` WRITE;
/*!40000 ALTER TABLE `untapped_drains` DISABLE KEYS */;
INSERT INTO `untapped_drains` VALUES (1,61,18.32),(2,2,136.89),(3,6,19.41),(4,8,11.68),(5,0,0.00),(6,0,0.00),(7,2,16.46),(8,8,4.58),(9,22,22.46),(10,0,0.00),(11,0,0.00),(12,1,12.10),(13,1,10.44),(14,1,18.00),(15,0,0.00),(16,0,0.00),(17,0,0.00),(18,0,0.00),(19,0,0.00),(20,3,30.91),(21,2,29.33),(22,1,5.00),(23,16,0.00),(24,13,3.83),(25,0,0.00),(26,0,0.00),(27,0,0.00),(28,0,0.00),(29,2,28.00),(30,2,52.00),(31,0,0.00),(32,7,120.49),(33,11,9.71),(34,7,3.57),(35,9,49.96),(36,6,27.00),(37,0,0.00),(38,2,2.80),(39,1,1.40),(40,1,6.00),(41,0,0.00),(42,0,0.00),(43,10,16.32),(44,1,11.00),(45,0,0.00),(46,1,3.00),(47,1,6.00),(48,9,11.90),(49,3,9.16),(50,0,0.00),(51,2,0.50),(52,3,8.00),(53,5,6.68),(54,1,20.00),(55,1,54.78),(56,7,51.56),(57,15,8.27),(58,7,14.83),(59,5,2.21),(60,0,0.00),(61,0,0.00),(62,2,155.22),(63,4,8.13),(64,10,58.09),(65,0,0.00),(66,0,0.00),(67,1,30.00),(68,0,0.00),(69,5,1.59),(70,19,49.80),(71,2,2.23),(72,9,2.12),(73,7,32.80),(74,0,0.00),(75,61,67.39),(76,4,15.65),(77,0,0.00),(78,1,3.40),(79,2,11.50),(80,10,32.87),(81,0,0.00),(82,21,12.72),(83,2,3.40),(84,0,0.00),(85,3,7.40),(86,1,2.50),(87,24,109.53),(88,0,0.00);
/*!40000 ALTER TABLE `untapped_drains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'district_wise_drains_audit'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 17:33:47
CREATE DATABASE  IF NOT EXISTS `district_wise_drains` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `district_wise_drains`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: district_wise_drains
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `district_totals`
--

DROP TABLE IF EXISTS `district_totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district_totals` (
  `total_id` int NOT NULL AUTO_INCREMENT,
  `district_id` int DEFAULT NULL,
  `total_drains` int DEFAULT NULL,
  `total_discharge` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`total_id`),
  KEY `district_id` (`district_id`),
  CONSTRAINT `district_totals_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district_totals`
--

LOCK TABLES `district_totals` WRITE;
/*!40000 ALTER TABLE `district_totals` DISABLE KEYS */;
/*!40000 ALTER TABLE `district_totals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `district_id` int NOT NULL AUTO_INCREMENT,
  `district_name` varchar(100) NOT NULL,
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'Agra'),(2,'Aligarh'),(3,'Ambedkar Nagar'),(4,'Amethi'),(5,'Amroha'),(6,'Auraiya'),(7,'Ayodhya'),(8,'Azamgarh'),(9,'Baghpat'),(10,'Ballia'),(11,'Banda'),(12,'Barabanki'),(13,'Bareilly'),(14,'Bijnor'),(15,'Bulandshahr'),(16,'Chandauli'),(17,'Chitrakoot'),(18,'Deoria'),(19,'Etah'),(20,'Etawah'),(21,'Farrukhabad'),(22,'Firozabad'),(23,'Gautam Buddha Nagar'),(24,'Ghaziabad'),(25,'Ghazipur'),(26,'Gorakhpur'),(27,'Hamirpur'),(28,'Hapur'),(29,'Hardoi'),(30,'Hathras'),(31,'Jalaun'),(32,'Jaunpur'),(33,'Jhansi'),(34,'Kannauj'),(35,'Kanpur Nagar'),(36,'Kasganj'),(37,'Kaushambi'),(38,'Lakhimpur Kheri'),(39,'Lalitpur'),(40,'Lucknow'),(41,'Mathura'),(42,'Mau'),(43,'Meerut'),(44,'Mirzapur'),(45,'Moradabad'),(46,'Muzaffarnagar'),(47,'Pilibhit'),(48,'Pratapgarh'),(49,'PrayagRaj'),(50,'Rae Bareli'),(51,'Rampur'),(52,'Saharanpur'),(53,'Sant Kabeer Nagar'),(54,'Sant Ravidas Nagar'),(55,'Shamli'),(56,'Sitapur'),(57,'Sonbhadra'),(58,'Sultanpur'),(59,'Unnao'),(60,'Varanasi');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drain_master`
--

DROP TABLE IF EXISTS `drain_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drain_master` (
  `drain_id` int NOT NULL AUTO_INCREMENT,
  `river_id` int NOT NULL,
  `total_drains` int DEFAULT NULL,
  `total_discharge` decimal(12,2) DEFAULT NULL,
  `scrape_time` datetime DEFAULT NULL,
  PRIMARY KEY (`drain_id`),
  KEY `river_id` (`river_id`),
  CONSTRAINT `drain_master_ibfk_1` FOREIGN KEY (`river_id`) REFERENCES `rivers` (`river_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drain_master`
--

LOCK TABLES `drain_master` WRITE;
/*!40000 ALTER TABLE `drain_master` DISABLE KEYS */;
INSERT INTO `drain_master` VALUES (1,1,90,286.85,'2026-06-01 13:30:44'),(2,2,8,145.40,'2026-06-01 13:30:44'),(3,3,6,19.41,'2026-06-01 13:30:44'),(4,4,8,11.68,'2026-06-01 13:30:44'),(5,5,1,5.00,'2026-06-01 13:30:44'),(6,6,1,4.50,'2026-06-01 13:30:44'),(7,7,2,16.46,'2026-06-01 13:30:44'),(8,8,21,30.87,'2026-06-01 13:30:44'),(9,9,22,22.46,'2026-06-01 13:30:44'),(10,10,0,0.00,'2026-06-01 13:30:44'),(11,11,4,8.60,'2026-06-01 13:30:44'),(12,12,1,12.10,'2026-06-01 13:30:44'),(13,13,1,10.44,'2026-06-01 13:30:44'),(14,14,1,18.00,'2026-06-01 13:30:44'),(15,15,13,41.23,'2026-06-01 13:30:44'),(16,16,1,18.82,'2026-06-01 13:30:44'),(17,17,1,0.87,'2026-06-01 13:30:44'),(18,18,3,26.05,'2026-06-01 13:30:44'),(19,19,3,5.06,'2026-06-01 13:30:44'),(20,20,17,59.99,'2026-06-01 13:30:44'),(21,21,2,29.33,'2026-06-01 13:30:44'),(22,22,1,5.00,'2026-06-01 13:30:44'),(23,23,16,0.00,'2026-06-01 13:30:44'),(24,24,13,3.83,'2026-06-01 13:30:44'),(25,25,1,4.00,'2026-06-01 13:30:44'),(26,26,2,30.99,'2026-06-01 13:30:44'),(27,27,8,47.72,'2026-06-01 13:30:44'),(28,28,2,54.26,'2026-06-01 13:30:44'),(29,29,2,28.00,'2026-06-01 13:30:44'),(30,30,2,52.00,'2026-06-01 13:30:44'),(31,31,0,0.00,'2026-06-01 13:30:44'),(32,32,8,306.49,'2026-06-01 13:30:44'),(33,33,34,35.88,'2026-06-01 13:30:44'),(34,34,7,3.57,'2026-06-01 13:30:44'),(35,35,9,49.96,'2026-06-01 13:30:44'),(36,36,6,27.00,'2026-06-01 13:30:44'),(37,37,24,47.82,'2026-06-01 13:30:44'),(38,38,2,2.80,'2026-06-01 13:30:44'),(39,39,1,1.40,'2026-06-01 13:30:44'),(40,40,1,6.00,'2026-06-01 13:30:44'),(41,41,2,7.50,'2026-06-01 13:30:44'),(42,42,1,1.08,'2026-06-01 13:30:44'),(43,43,10,16.32,'2026-06-01 13:30:44'),(44,44,1,11.00,'2026-06-01 13:30:44'),(45,45,14,23.44,'2026-06-01 13:30:44'),(46,46,10,42.00,'2026-06-01 13:30:44'),(47,47,4,20.00,'2026-06-01 13:30:44'),(48,48,27,188.45,'2026-06-01 13:30:44'),(49,49,9,98.42,'2026-06-01 13:30:44'),(50,50,3,13.53,'2026-06-01 13:30:44'),(51,51,2,0.50,'2026-06-01 13:30:44'),(52,52,3,8.00,'2026-06-01 13:30:44'),(53,53,5,6.68,'2026-06-01 13:30:44'),(54,54,1,20.00,'2026-06-01 13:30:44'),(55,55,1,54.78,'2026-06-01 13:30:44'),(56,56,33,550.98,'2026-06-01 13:30:44'),(57,57,15,8.27,'2026-06-01 13:30:44'),(58,58,38,81.58,'2026-06-01 13:30:44'),(59,59,5,2.21,'2026-06-01 13:30:44'),(60,60,0,0.00,'2026-06-01 13:30:44'),(61,61,2,2.46,'2026-06-01 13:30:44'),(62,62,3,307.22,'2026-06-01 13:30:44'),(63,63,49,33.92,'2026-06-01 13:30:44'),(64,64,24,97.97,'2026-06-01 13:30:44'),(65,65,3,7.40,'2026-06-01 13:30:44'),(66,66,10,73.84,'2026-06-01 13:30:44'),(67,67,4,100.00,'2026-06-01 13:30:44'),(68,68,4,7.10,'2026-06-01 13:30:44'),(69,69,5,1.59,'2026-06-01 13:30:44'),(70,70,48,167.70,'2026-06-01 13:30:44'),(71,71,33,125.90,'2026-06-01 13:30:44'),(72,72,9,2.12,'2026-06-01 13:30:44'),(73,73,7,32.80,'2026-06-01 13:30:44'),(74,74,3,33.39,'2026-06-01 13:30:44'),(75,75,105,114.68,'2026-06-01 13:30:44'),(76,76,4,15.65,'2026-06-01 13:30:44'),(77,77,0,0.00,'2026-06-01 13:30:44'),(78,78,2,4.15,'2026-06-01 13:30:44'),(79,79,2,11.50,'2026-06-01 13:30:44'),(80,80,12,35.72,'2026-06-01 13:30:44'),(81,81,1,12.00,'2026-06-01 13:30:44'),(82,82,21,12.72,'2026-06-01 13:30:44'),(83,83,2,3.40,'2026-06-01 13:30:44'),(84,84,6,14.57,'2026-06-01 13:30:44'),(85,85,8,23.32,'2026-06-01 13:30:44'),(86,86,28,73.73,'2026-06-01 13:30:44'),(87,87,43,226.80,'2026-06-01 13:30:44'),(88,88,1,78.00,'2026-06-01 13:30:44');
/*!40000 ALTER TABLE `drain_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `not_to_be_tapped_drains`
--

DROP TABLE IF EXISTS `not_to_be_tapped_drains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `not_to_be_tapped_drains` (
  `drain_id` int NOT NULL,
  `not_to_be_tapped_drains` int DEFAULT NULL,
  `not_to_be_tapped_discharge` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`drain_id`),
  CONSTRAINT `not_to_be_tapped_drains_ibfk_1` FOREIGN KEY (`drain_id`) REFERENCES `drain_master` (`drain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `not_to_be_tapped_drains`
--

LOCK TABLES `not_to_be_tapped_drains` WRITE;
/*!40000 ALTER TABLE `not_to_be_tapped_drains` DISABLE KEYS */;
INSERT INTO `not_to_be_tapped_drains` VALUES (1,0,0.00),(2,6,8.51),(3,0,0.00),(4,0,0.00),(5,1,5.00),(6,1,4.50),(7,0,0.00),(8,0,0.00),(9,0,0.00),(10,0,0.00),(11,0,0.00),(12,0,0.00),(13,0,0.00),(14,0,0.00),(15,2,0.02),(16,0,0.00),(17,0,0.00),(18,1,15.00),(19,0,0.00),(20,14,29.08),(21,0,0.00),(22,0,0.00),(23,0,0.00),(24,0,0.00),(25,0,0.00),(26,0,0.00),(27,1,8.00),(28,0,0.00),(29,0,0.00),(30,0,0.00),(31,0,0.00),(32,0,0.00),(33,23,26.17),(34,0,0.00),(35,0,0.00),(36,0,0.00),(37,0,0.00),(38,0,0.00),(39,0,0.00),(40,0,0.00),(41,0,0.00),(42,1,1.08),(43,0,0.00),(44,0,0.00),(45,0,0.00),(46,0,0.00),(47,0,0.00),(48,1,0.00),(49,0,0.00),(50,1,0.77),(51,0,0.00),(52,0,0.00),(53,0,0.00),(54,0,0.00),(55,0,0.00),(56,1,0.00),(57,0,0.00),(58,0,0.00),(59,0,0.00),(60,0,0.00),(61,2,2.46),(62,0,0.00),(63,27,6.53),(64,0,0.00),(65,0,0.00),(66,3,22.75),(67,1,10.00),(68,0,0.00),(69,0,0.00),(70,2,1.22),(71,3,0.17),(72,0,0.00),(73,0,0.00),(74,0,0.00),(75,6,17.04),(76,0,0.00),(77,0,0.00),(78,1,0.75),(79,0,0.00),(80,2,2.85),(81,0,0.00),(82,0,0.00),(83,0,0.00),(84,1,0.63),(85,0,0.00),(86,0,0.00),(87,0,0.00),(88,0,0.00);
/*!40000 ALTER TABLE `not_to_be_tapped_drains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partial_tapped_drains`
--

DROP TABLE IF EXISTS `partial_tapped_drains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partial_tapped_drains` (
  `drain_id` int NOT NULL,
  `partial_tapped_drains` int DEFAULT NULL,
  `partial_tapped_discharge` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`drain_id`),
  CONSTRAINT `partial_tapped_drains_ibfk_1` FOREIGN KEY (`drain_id`) REFERENCES `drain_master` (`drain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partial_tapped_drains`
--

LOCK TABLES `partial_tapped_drains` WRITE;
/*!40000 ALTER TABLE `partial_tapped_drains` DISABLE KEYS */;
INSERT INTO `partial_tapped_drains` VALUES (1,8,207.28),(2,0,0.00),(3,0,0.00),(4,0,0.00),(5,0,0.00),(6,0,0.00),(7,0,0.00),(8,0,0.00),(9,0,0.00),(10,0,0.00),(11,0,0.00),(12,0,0.00),(13,0,0.00),(14,0,0.00),(15,0,0.00),(16,0,0.00),(17,0,0.00),(18,0,0.00),(19,0,0.00),(20,0,0.00),(21,0,0.00),(22,0,0.00),(23,0,0.00),(24,0,0.00),(25,0,0.00),(26,0,0.00),(27,0,0.00),(28,0,0.00),(29,0,0.00),(30,0,0.00),(31,0,0.00),(32,0,0.00),(33,0,0.00),(34,0,0.00),(35,0,0.00),(36,0,0.00),(37,0,0.00),(38,0,0.00),(39,0,0.00),(40,0,0.00),(41,0,0.00),(42,0,0.00),(43,0,0.00),(44,0,0.00),(45,1,0.45),(46,0,0.00),(47,0,0.00),(48,0,0.00),(49,2,57.95),(50,0,0.00),(51,0,0.00),(52,0,0.00),(53,0,0.00),(54,0,0.00),(55,0,0.00),(56,15,449.70),(57,0,0.00),(58,1,26.49),(59,0,0.00),(60,0,0.00),(61,0,0.00),(62,1,152.00),(63,0,0.00),(64,7,30.63),(65,0,0.00),(66,0,0.00),(67,1,40.00),(68,0,0.00),(69,0,0.00),(70,1,20.08),(71,0,0.00),(72,0,0.00),(73,0,0.00),(74,0,0.00),(75,0,0.00),(76,0,0.00),(77,0,0.00),(78,0,0.00),(79,0,0.00),(80,0,0.00),(81,0,0.00),(82,0,0.00),(83,0,0.00),(84,0,0.00),(85,0,0.00),(86,1,5.00),(87,1,10.94),(88,1,78.00);
/*!40000 ALTER TABLE `partial_tapped_drains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rivers`
--

DROP TABLE IF EXISTS `rivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rivers` (
  `river_id` int NOT NULL AUTO_INCREMENT,
  `district_id` int NOT NULL,
  `river_name` varchar(100) NOT NULL,
  PRIMARY KEY (`river_id`),
  KEY `district_id` (`district_id`),
  CONSTRAINT `rivers_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rivers`
--

LOCK TABLES `rivers` WRITE;
/*!40000 ALTER TABLE `rivers` DISABLE KEYS */;
INSERT INTO `rivers` VALUES (1,1,'Yamuna'),(2,2,'Aligarh  Drain ( Irrigation )'),(3,3,'Tamsa'),(4,3,'Ghaghara'),(5,4,'Gomti'),(6,5,'Ganga'),(7,6,'Yamuna'),(8,7,'Saryu'),(9,8,'Tamsa'),(10,9,'Harnandi (Hindon)'),(11,9,'Yamuna'),(12,10,'Ganga'),(13,11,'Ken'),(14,12,'Gomti'),(15,13,'NAKTIA RIVER'),(16,13,'Ram ganga'),(17,13,'DEVRANIYA'),(18,14,'Ganga'),(19,15,'Ganga'),(20,15,'Kali'),(21,16,'Ganga'),(22,17,'Yamuna'),(23,17,'Mandakini'),(24,18,'Ghaghra'),(25,19,'Ishan'),(26,20,'Yamuna'),(27,21,'Ganga'),(28,22,'Yamuna'),(29,23,'Harnandi (Hindon)'),(30,24,'Yamuna'),(31,24,'Kali'),(32,24,'Harnandi (Hindon)'),(33,25,'Ganga'),(34,26,'Ghaghra'),(35,26,'Rapti'),(36,26,'Rohini'),(37,26,'Ramgarhtal'),(38,27,'Betwa'),(39,27,'Yamuna'),(40,28,'Kali'),(41,28,'Ganga'),(42,29,'Sai'),(43,30,'Karvan'),(44,31,'Yamuna'),(45,32,'Gomti'),(46,33,'Pahunch'),(47,34,'Ganga'),(48,35,'Ganga'),(49,35,'Pandu'),(50,36,'kaali Nadi'),(51,37,'Ganga'),(52,38,'ULL RIVER'),(53,38,'Sarayan'),(54,39,'Betwa'),(55,40,'Sai'),(56,40,'Gomti'),(57,41,'Kosi Arterial Channel'),(58,41,'Yamuna'),(59,42,'Ghaghara'),(60,42,'Tamsa'),(61,43,'Harnandi (Hindon)'),(62,43,'Kali'),(63,44,'Ganga'),(64,45,'Ram ganga'),(65,46,'Harnandi (Hindon)'),(66,46,'Kali West'),(67,47,'Gomti'),(68,48,'Sai'),(69,48,'Ganga'),(70,49,'Ganga'),(71,49,'Yamuna'),(72,50,'Ganga'),(73,50,'Sai'),(74,51,'Ram ganga'),(75,52,'Harnandi (Hindon)'),(76,52,'Kali West'),(77,53,'Aami'),(78,54,'Morwa'),(79,54,'Varuna'),(80,55,'Krishni'),(81,55,'Yamuna'),(82,56,'Sarayan'),(83,57,'Sone'),(84,58,'Gomti'),(85,59,'Ganga'),(86,60,'Ganga'),(87,60,'Varuna'),(88,60,'Assi');
/*!40000 ALTER TABLE `rivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tapped_drains`
--

DROP TABLE IF EXISTS `tapped_drains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tapped_drains` (
  `drain_id` int NOT NULL,
  `tapped_drains` int DEFAULT NULL,
  `tapped_discharge` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`drain_id`),
  CONSTRAINT `tapped_drains_ibfk_1` FOREIGN KEY (`drain_id`) REFERENCES `drain_master` (`drain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tapped_drains`
--

LOCK TABLES `tapped_drains` WRITE;
/*!40000 ALTER TABLE `tapped_drains` DISABLE KEYS */;
INSERT INTO `tapped_drains` VALUES (1,21,61.25),(2,0,0.00),(3,0,0.00),(4,0,0.00),(5,0,0.00),(6,0,0.00),(7,0,0.00),(8,13,26.29),(9,0,0.00),(10,0,0.00),(11,4,8.60),(12,0,0.00),(13,0,0.00),(14,0,0.00),(15,11,41.21),(16,1,18.82),(17,1,0.87),(18,2,11.05),(19,3,5.06),(20,0,0.00),(21,0,0.00),(22,0,0.00),(23,0,0.00),(24,0,0.00),(25,1,4.00),(26,2,30.99),(27,7,39.72),(28,2,54.26),(29,0,0.00),(30,0,0.00),(31,0,0.00),(32,1,186.00),(33,0,0.00),(34,0,0.00),(35,0,0.00),(36,0,0.00),(37,24,47.82),(38,0,0.00),(39,0,0.00),(40,0,0.00),(41,2,7.50),(42,0,0.00),(43,0,0.00),(44,0,0.00),(45,13,22.99),(46,9,39.00),(47,3,14.00),(48,17,176.55),(49,4,31.31),(50,2,12.76),(51,0,0.00),(52,0,0.00),(53,0,0.00),(54,0,0.00),(55,0,0.00),(56,10,49.72),(57,0,0.00),(58,30,40.26),(59,0,0.00),(60,0,0.00),(61,0,0.00),(62,0,0.00),(63,18,19.26),(64,7,9.25),(65,3,7.40),(66,7,51.09),(67,1,20.00),(68,4,7.10),(69,0,0.00),(70,26,96.60),(71,28,123.50),(72,0,0.00),(73,0,0.00),(74,3,33.39),(75,38,30.25),(76,0,0.00),(77,0,0.00),(78,0,0.00),(79,0,0.00),(80,0,0.00),(81,1,12.00),(82,0,0.00),(83,0,0.00),(84,5,13.94),(85,5,15.92),(86,26,66.23),(87,18,106.33),(88,0,0.00);
/*!40000 ALTER TABLE `tapped_drains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `untapped_drains`
--

DROP TABLE IF EXISTS `untapped_drains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `untapped_drains` (
  `drain_id` int NOT NULL,
  `untapped_drains` int DEFAULT NULL,
  `untapped_discharge` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`drain_id`),
  CONSTRAINT `untapped_drains_ibfk_1` FOREIGN KEY (`drain_id`) REFERENCES `drain_master` (`drain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `untapped_drains`
--

LOCK TABLES `untapped_drains` WRITE;
/*!40000 ALTER TABLE `untapped_drains` DISABLE KEYS */;
INSERT INTO `untapped_drains` VALUES (1,61,18.32),(2,2,136.89),(3,6,19.41),(4,8,11.68),(5,0,0.00),(6,0,0.00),(7,2,16.46),(8,8,4.58),(9,22,22.46),(10,0,0.00),(11,0,0.00),(12,1,12.10),(13,1,10.44),(14,1,18.00),(15,0,0.00),(16,0,0.00),(17,0,0.00),(18,0,0.00),(19,0,0.00),(20,3,30.91),(21,2,29.33),(22,1,5.00),(23,16,0.00),(24,13,3.83),(25,0,0.00),(26,0,0.00),(27,0,0.00),(28,0,0.00),(29,2,28.00),(30,2,52.00),(31,0,0.00),(32,7,120.49),(33,11,9.71),(34,7,3.57),(35,9,49.96),(36,6,27.00),(37,0,0.00),(38,2,2.80),(39,1,1.40),(40,1,6.00),(41,0,0.00),(42,0,0.00),(43,10,16.32),(44,1,11.00),(45,0,0.00),(46,1,3.00),(47,1,6.00),(48,9,11.90),(49,3,9.16),(50,0,0.00),(51,2,0.50),(52,3,8.00),(53,5,6.68),(54,1,20.00),(55,1,54.78),(56,7,51.56),(57,15,8.27),(58,7,14.83),(59,5,2.21),(60,0,0.00),(61,0,0.00),(62,2,155.22),(63,4,8.13),(64,10,58.09),(65,0,0.00),(66,0,0.00),(67,1,30.00),(68,0,0.00),(69,5,1.59),(70,19,49.80),(71,2,2.23),(72,9,2.12),(73,7,32.80),(74,0,0.00),(75,61,67.39),(76,4,15.65),(77,0,0.00),(78,1,3.40),(79,2,11.50),(80,10,32.87),(81,0,0.00),(82,21,12.72),(83,2,3.40),(84,0,0.00),(85,3,7.40),(86,1,2.50),(87,24,109.53),(88,0,0.00);
/*!40000 ALTER TABLE `untapped_drains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'district_wise_drains'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 17:33:47
