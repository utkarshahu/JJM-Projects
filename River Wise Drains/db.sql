CREATE DATABASE  IF NOT EXISTS `river_wise_drains` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `river_wise_drains`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: river_wise_drains
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
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `district_id` int NOT NULL AUTO_INCREMENT,
  `river_id` int NOT NULL,
  `district_name` varchar(255) NOT NULL,
  PRIMARY KEY (`district_id`),
  KEY `river_id` (`river_id`),
  CONSTRAINT `districts_ibfk_1` FOREIGN KEY (`river_id`) REFERENCES `rivers` (`river_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,1,'Sant Kabeer Nagar'),(2,2,'Aligarh'),(3,3,'Varanasi'),(4,4,'Hamirpur'),(5,4,'Lalitpur'),(6,5,'Bareilly'),(7,6,'Bijnor'),(8,6,'Bulandshahr'),(9,6,'PrayagRaj'),(10,6,'Farrukhabad'),(11,6,'Hapur'),(12,6,'Kannauj'),(13,6,'Kanpur Nagar'),(14,6,'Mirzapur'),(15,6,'Unnao'),(16,6,'Varanasi'),(17,6,'Ghazipur'),(18,6,'Rae Bareli'),(19,6,'Chandauli'),(20,6,'Pratapgarh'),(21,6,'Amroha'),(22,6,'Ballia'),(23,6,'Kaushambi'),(24,7,'Ambedkar Nagar'),(25,7,'Mau'),(26,8,'Gorakhpur'),(27,8,'Deoria'),(28,9,'Barabanki'),(29,9,'Sultanpur'),(30,9,'Amethi'),(31,9,'Pilibhit'),(32,9,'Lucknow'),(33,9,'Jaunpur'),(34,10,'Ghaziabad'),(35,10,'Muzaffarnagar'),(36,10,'Baghpat'),(37,10,'Meerut'),(38,10,'Saharanpur'),(39,10,'Gautam Buddha Nagar'),(40,11,'Etah'),(41,12,'Kasganj'),(42,13,'Hapur'),(43,13,'Meerut'),(44,13,'Bulandshahr'),(45,13,'Ghaziabad'),(46,14,'Saharanpur'),(47,14,'Muzaffarnagar'),(48,15,'Hathras'),(49,16,'Banda'),(50,17,'Mathura'),(51,18,'Shamli'),(52,19,'Chitrakoot'),(53,20,'Sant Ravidas Nagar'),(54,21,'Mahoba'),(55,22,'Bareilly'),(56,23,'Jhansi'),(57,24,'Kanpur Nagar'),(58,25,'Moradabad'),(59,25,'Rampur'),(60,25,'Bareilly'),(61,26,'Gorakhpur'),(62,27,'Gorakhpur'),(63,28,'Gorakhpur'),(64,29,'Rae Bareli'),(65,29,'Lucknow'),(66,29,'Hardoi'),(67,29,'Pratapgarh'),(68,30,'Lakhimpur Kheri'),(69,30,'Sitapur'),(70,31,'Ayodhya'),(71,32,'Sonbhadra'),(72,33,'Mau'),(73,33,'Azamgarh'),(74,33,'Ambedkar Nagar'),(75,34,'Lakhimpur Kheri'),(76,35,'Sant Ravidas Nagar'),(77,35,'Varanasi'),(78,36,'Baghpat'),(79,36,'Mathura'),(80,36,'Agra'),(81,36,'Firozabad'),(82,36,'PrayagRaj'),(83,36,'Etawah'),(84,36,'Jalaun'),(85,36,'Shamli'),(86,36,'Ghaziabad'),(87,36,'Chitrakoot'),(88,36,'Hamirpur'),(89,36,'Auraiya');
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
  `district_id` int NOT NULL,
  `total_drains` int DEFAULT '0',
  `total_discharge` decimal(12,2) DEFAULT '0.00',
  `scrape_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`drain_id`),
  KEY `district_id` (`district_id`),
  CONSTRAINT `drain_master_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drain_master`
--

LOCK TABLES `drain_master` WRITE;
/*!40000 ALTER TABLE `drain_master` DISABLE KEYS */;
INSERT INTO `drain_master` VALUES (1,1,0,0.00,'2026-06-01 12:54:26'),(2,2,8,145.40,'2026-06-01 12:54:26'),(3,3,1,78.00,'2026-06-01 12:54:26'),(4,4,2,2.80,'2026-06-01 12:54:26'),(5,5,1,20.00,'2026-06-01 12:54:26'),(6,6,1,0.87,'2026-06-01 12:54:26'),(7,7,3,26.05,'2026-06-01 12:54:26'),(8,8,3,5.06,'2026-06-01 12:54:26'),(9,9,48,167.70,'2026-06-01 12:54:26'),(10,10,8,47.72,'2026-06-01 12:54:26'),(11,11,2,7.50,'2026-06-01 12:54:26'),(12,12,4,20.00,'2026-06-01 12:54:26'),(13,13,27,188.45,'2026-06-01 12:54:26'),(14,14,49,33.92,'2026-06-01 12:54:26'),(15,15,8,23.32,'2026-06-01 12:54:26'),(16,16,28,73.73,'2026-06-01 12:54:26'),(17,17,34,35.88,'2026-06-01 12:54:26'),(18,18,9,2.12,'2026-06-01 12:54:26'),(19,19,2,29.33,'2026-06-01 12:54:26'),(20,20,5,1.59,'2026-06-01 12:54:26'),(21,21,1,4.50,'2026-06-01 12:54:26'),(22,22,1,12.10,'2026-06-01 12:54:26'),(23,23,2,0.50,'2026-06-01 12:54:26'),(24,24,8,11.68,'2026-06-01 12:54:26'),(25,25,5,2.21,'2026-06-01 12:54:26'),(26,26,7,3.57,'2026-06-01 12:54:26'),(27,27,13,3.83,'2026-06-01 12:54:26'),(28,28,1,18.00,'2026-06-01 12:54:26'),(29,29,6,14.57,'2026-06-01 12:54:26'),(30,30,1,5.00,'2026-06-01 12:54:26'),(31,31,4,100.00,'2026-06-01 12:54:26'),(32,32,33,550.98,'2026-06-01 12:54:26'),(33,33,14,23.44,'2026-06-01 12:54:26'),(34,34,8,306.49,'2026-06-01 12:54:26'),(35,35,3,7.40,'2026-06-01 12:54:26'),(36,36,0,0.00,'2026-06-01 12:54:26'),(37,37,2,2.46,'2026-06-01 12:54:26'),(38,38,105,114.68,'2026-06-01 12:54:26'),(39,39,2,28.00,'2026-06-01 12:54:26'),(40,40,1,4.00,'2026-06-01 12:54:26'),(41,41,3,13.53,'2026-06-01 12:54:26'),(42,42,1,6.00,'2026-06-01 12:54:26'),(43,43,3,307.22,'2026-06-01 12:54:26'),(44,44,17,59.99,'2026-06-01 12:54:26'),(45,45,0,0.00,'2026-06-01 12:54:26'),(46,46,4,15.65,'2026-06-01 12:54:26'),(47,47,10,73.84,'2026-06-01 12:54:26'),(48,48,10,16.32,'2026-06-01 12:54:26'),(49,49,1,10.44,'2026-06-01 12:54:26'),(50,50,15,8.27,'2026-06-01 12:54:26'),(51,51,12,35.72,'2026-06-01 12:54:26'),(52,52,16,0.00,'2026-06-01 12:54:26'),(53,53,2,4.15,'2026-06-01 12:54:26'),(54,54,6,9.04,'2026-06-01 12:54:26'),(55,55,13,41.23,'2026-06-01 12:54:26'),(56,56,10,42.00,'2026-06-01 12:54:26'),(57,57,9,98.42,'2026-06-01 12:54:26'),(58,58,24,97.97,'2026-06-01 12:54:26'),(59,59,3,33.39,'2026-06-01 12:54:26'),(60,60,1,18.82,'2026-06-01 12:54:26'),(61,61,24,47.82,'2026-06-01 12:54:26'),(62,62,9,49.96,'2026-06-01 12:54:26'),(63,63,6,27.00,'2026-06-01 12:54:26'),(64,64,7,32.80,'2026-06-01 12:54:26'),(65,65,1,54.78,'2026-06-01 12:54:26'),(66,66,1,1.08,'2026-06-01 12:54:26'),(67,67,4,7.10,'2026-06-01 12:54:26'),(68,68,5,6.68,'2026-06-01 12:54:26'),(69,69,21,12.72,'2026-06-01 12:54:26'),(70,70,21,30.87,'2026-06-01 12:54:26'),(71,71,2,3.40,'2026-06-01 12:54:26'),(72,72,0,0.00,'2026-06-01 12:54:26'),(73,73,22,22.46,'2026-06-01 12:54:26'),(74,74,6,19.41,'2026-06-01 12:54:26'),(75,75,3,8.00,'2026-06-01 12:54:26'),(76,76,2,11.50,'2026-06-01 12:54:26'),(77,77,43,226.80,'2026-06-01 12:54:26'),(78,78,4,8.60,'2026-06-01 12:54:26'),(79,79,38,81.58,'2026-06-01 12:54:26'),(80,80,90,286.85,'2026-06-01 12:54:26'),(81,81,2,54.26,'2026-06-01 12:54:26'),(82,82,33,125.90,'2026-06-01 12:54:26'),(83,83,2,30.99,'2026-06-01 12:54:26'),(84,84,1,11.00,'2026-06-01 12:54:26'),(85,85,1,12.00,'2026-06-01 12:54:26'),(86,86,2,52.00,'2026-06-01 12:54:26'),(87,87,1,5.00,'2026-06-01 12:54:26'),(88,88,1,1.40,'2026-06-01 12:54:26'),(89,89,2,16.46,'2026-06-01 12:54:26');
/*!40000 ALTER TABLE `drain_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `not_to_be_tapped_drains`
--

DROP TABLE IF EXISTS `not_to_be_tapped_drains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `not_to_be_tapped_drains` (
  `not_to_be_tapped_id` int NOT NULL AUTO_INCREMENT,
  `drain_id` int NOT NULL,
  `not_to_be_tapped_drains` int DEFAULT '0',
  `not_to_be_tapped_discharge` decimal(12,2) DEFAULT '0.00',
  PRIMARY KEY (`not_to_be_tapped_id`),
  KEY `drain_id` (`drain_id`),
  CONSTRAINT `not_to_be_tapped_drains_ibfk_1` FOREIGN KEY (`drain_id`) REFERENCES `drain_master` (`drain_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `not_to_be_tapped_drains`
--

LOCK TABLES `not_to_be_tapped_drains` WRITE;
/*!40000 ALTER TABLE `not_to_be_tapped_drains` DISABLE KEYS */;
INSERT INTO `not_to_be_tapped_drains` VALUES (1,1,0,0.00),(2,2,6,8.51),(3,3,0,0.00),(4,4,0,0.00),(5,5,0,0.00),(6,6,0,0.00),(7,7,1,15.00),(8,8,0,0.00),(9,9,2,1.22),(10,10,1,8.00),(11,11,0,0.00),(12,12,0,0.00),(13,13,1,0.00),(14,14,27,6.53),(15,15,0,0.00),(16,16,0,0.00),(17,17,23,26.17),(18,18,0,0.00),(19,19,0,0.00),(20,20,0,0.00),(21,21,1,4.50),(22,22,0,0.00),(23,23,0,0.00),(24,24,0,0.00),(25,25,0,0.00),(26,26,0,0.00),(27,27,0,0.00),(28,28,0,0.00),(29,29,1,0.63),(30,30,1,5.00),(31,31,1,10.00),(32,32,1,0.00),(33,33,0,0.00),(34,34,0,0.00),(35,35,0,0.00),(36,36,0,0.00),(37,37,2,2.46),(38,38,6,17.04),(39,39,0,0.00),(40,40,0,0.00),(41,41,1,0.77),(42,42,0,0.00),(43,43,0,0.00),(44,44,14,29.08),(45,45,0,0.00),(46,46,0,0.00),(47,47,3,22.75),(48,48,0,0.00),(49,49,0,0.00),(50,50,0,0.00),(51,51,2,2.85),(52,52,0,0.00),(53,53,1,0.75),(54,54,0,0.00),(55,55,2,0.02),(56,56,0,0.00),(57,57,0,0.00),(58,58,0,0.00),(59,59,0,0.00),(60,60,0,0.00),(61,61,0,0.00),(62,62,0,0.00),(63,63,0,0.00),(64,64,0,0.00),(65,65,0,0.00),(66,66,1,1.08),(67,67,0,0.00),(68,68,0,0.00),(69,69,0,0.00),(70,70,0,0.00),(71,71,0,0.00),(72,72,0,0.00),(73,73,0,0.00),(74,74,0,0.00),(75,75,0,0.00),(76,76,0,0.00),(77,77,0,0.00),(78,78,0,0.00),(79,79,0,0.00),(80,80,0,0.00),(81,81,0,0.00),(82,82,3,0.17),(83,83,0,0.00),(84,84,0,0.00),(85,85,0,0.00),(86,86,0,0.00),(87,87,0,0.00),(88,88,0,0.00),(89,89,0,0.00);
/*!40000 ALTER TABLE `not_to_be_tapped_drains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partial_tapped_drains`
--

DROP TABLE IF EXISTS `partial_tapped_drains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partial_tapped_drains` (
  `partial_id` int NOT NULL AUTO_INCREMENT,
  `drain_id` int NOT NULL,
  `partial_tapped_drains` int DEFAULT '0',
  `partial_tapped_discharge` decimal(12,2) DEFAULT '0.00',
  PRIMARY KEY (`partial_id`),
  KEY `drain_id` (`drain_id`),
  CONSTRAINT `partial_tapped_drains_ibfk_1` FOREIGN KEY (`drain_id`) REFERENCES `drain_master` (`drain_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partial_tapped_drains`
--

LOCK TABLES `partial_tapped_drains` WRITE;
/*!40000 ALTER TABLE `partial_tapped_drains` DISABLE KEYS */;
INSERT INTO `partial_tapped_drains` VALUES (1,1,0,0.00),(2,2,0,0.00),(3,3,1,78.00),(4,4,0,0.00),(5,5,0,0.00),(6,6,0,0.00),(7,7,0,0.00),(8,8,0,0.00),(9,9,1,20.08),(10,10,0,0.00),(11,11,0,0.00),(12,12,0,0.00),(13,13,0,0.00),(14,14,0,0.00),(15,15,0,0.00),(16,16,1,5.00),(17,17,0,0.00),(18,18,0,0.00),(19,19,0,0.00),(20,20,0,0.00),(21,21,0,0.00),(22,22,0,0.00),(23,23,0,0.00),(24,24,0,0.00),(25,25,0,0.00),(26,26,0,0.00),(27,27,0,0.00),(28,28,0,0.00),(29,29,0,0.00),(30,30,0,0.00),(31,31,1,40.00),(32,32,15,449.70),(33,33,1,0.45),(34,34,0,0.00),(35,35,0,0.00),(36,36,0,0.00),(37,37,0,0.00),(38,38,0,0.00),(39,39,0,0.00),(40,40,0,0.00),(41,41,0,0.00),(42,42,0,0.00),(43,43,1,152.00),(44,44,0,0.00),(45,45,0,0.00),(46,46,0,0.00),(47,47,0,0.00),(48,48,0,0.00),(49,49,0,0.00),(50,50,0,0.00),(51,51,0,0.00),(52,52,0,0.00),(53,53,0,0.00),(54,54,0,0.00),(55,55,0,0.00),(56,56,0,0.00),(57,57,2,57.95),(58,58,7,30.63),(59,59,0,0.00),(60,60,0,0.00),(61,61,0,0.00),(62,62,0,0.00),(63,63,0,0.00),(64,64,0,0.00),(65,65,0,0.00),(66,66,0,0.00),(67,67,0,0.00),(68,68,0,0.00),(69,69,0,0.00),(70,70,0,0.00),(71,71,0,0.00),(72,72,0,0.00),(73,73,0,0.00),(74,74,0,0.00),(75,75,0,0.00),(76,76,0,0.00),(77,77,1,10.94),(78,78,0,0.00),(79,79,1,26.49),(80,80,8,207.28),(81,81,0,0.00),(82,82,0,0.00),(83,83,0,0.00),(84,84,0,0.00),(85,85,0,0.00),(86,86,0,0.00),(87,87,0,0.00),(88,88,0,0.00),(89,89,0,0.00);
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
  `river_name` varchar(255) NOT NULL,
  PRIMARY KEY (`river_id`),
  UNIQUE KEY `river_name` (`river_name`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rivers`
--

LOCK TABLES `rivers` WRITE;
/*!40000 ALTER TABLE `rivers` DISABLE KEYS */;
INSERT INTO `rivers` VALUES (1,'Aami'),(2,'Aligarh  Drain ( Irrigation )'),(3,'Assi'),(4,'Betwa'),(5,'DEVRANIYA'),(6,'Ganga'),(7,'Ghaghara'),(8,'Ghaghra'),(9,'Gomti'),(10,'Harnandi (Hindon)'),(11,'Ishan'),(12,'kaali Nadi'),(13,'Kali'),(14,'Kali West'),(15,'Karvan'),(16,'Ken'),(17,'Kosi Arterial Channel'),(18,'Krishni'),(19,'Mandakini'),(20,'Morwa'),(22,'NAKTIA RIVER'),(21,'nan'),(23,'Pahunch'),(24,'Pandu'),(25,'Ram ganga'),(26,'Ramgarhtal'),(27,'Rapti'),(28,'Rohini'),(29,'Sai'),(30,'Sarayan'),(31,'Saryu'),(32,'Sone'),(33,'Tamsa'),(34,'ULL RIVER'),(35,'Varuna'),(36,'Yamuna');
/*!40000 ALTER TABLE `rivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tapped_drains`
--

DROP TABLE IF EXISTS `tapped_drains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tapped_drains` (
  `tapped_id` int NOT NULL AUTO_INCREMENT,
  `drain_id` int NOT NULL,
  `tapped_drains` int DEFAULT '0',
  `tapped_discharge` decimal(12,2) DEFAULT '0.00',
  PRIMARY KEY (`tapped_id`),
  KEY `drain_id` (`drain_id`),
  CONSTRAINT `tapped_drains_ibfk_1` FOREIGN KEY (`drain_id`) REFERENCES `drain_master` (`drain_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tapped_drains`
--

LOCK TABLES `tapped_drains` WRITE;
/*!40000 ALTER TABLE `tapped_drains` DISABLE KEYS */;
INSERT INTO `tapped_drains` VALUES (1,1,0,0.00),(2,2,0,0.00),(3,3,0,0.00),(4,4,0,0.00),(5,5,0,0.00),(6,6,1,0.87),(7,7,2,11.05),(8,8,3,5.06),(9,9,26,96.60),(10,10,7,39.72),(11,11,2,7.50),(12,12,3,14.00),(13,13,17,176.55),(14,14,18,19.26),(15,15,5,15.92),(16,16,26,66.23),(17,17,0,0.00),(18,18,0,0.00),(19,19,0,0.00),(20,20,0,0.00),(21,21,0,0.00),(22,22,0,0.00),(23,23,0,0.00),(24,24,0,0.00),(25,25,0,0.00),(26,26,0,0.00),(27,27,0,0.00),(28,28,0,0.00),(29,29,5,13.94),(30,30,0,0.00),(31,31,1,20.00),(32,32,10,49.72),(33,33,13,22.99),(34,34,1,186.00),(35,35,3,7.40),(36,36,0,0.00),(37,37,0,0.00),(38,38,38,30.25),(39,39,0,0.00),(40,40,1,4.00),(41,41,2,12.76),(42,42,0,0.00),(43,43,0,0.00),(44,44,0,0.00),(45,45,0,0.00),(46,46,0,0.00),(47,47,7,51.09),(48,48,0,0.00),(49,49,0,0.00),(50,50,0,0.00),(51,51,0,0.00),(52,52,0,0.00),(53,53,0,0.00),(54,54,0,0.00),(55,55,11,41.21),(56,56,9,39.00),(57,57,4,31.31),(58,58,7,9.25),(59,59,3,33.39),(60,60,1,18.82),(61,61,24,47.82),(62,62,0,0.00),(63,63,0,0.00),(64,64,0,0.00),(65,65,0,0.00),(66,66,0,0.00),(67,67,4,7.10),(68,68,0,0.00),(69,69,0,0.00),(70,70,13,26.29),(71,71,0,0.00),(72,72,0,0.00),(73,73,0,0.00),(74,74,0,0.00),(75,75,0,0.00),(76,76,0,0.00),(77,77,18,106.33),(78,78,4,8.60),(79,79,30,40.26),(80,80,21,61.25),(81,81,2,54.26),(82,82,28,123.50),(83,83,2,30.99),(84,84,0,0.00),(85,85,1,12.00),(86,86,0,0.00),(87,87,0,0.00),(88,88,0,0.00),(89,89,0,0.00);
/*!40000 ALTER TABLE `tapped_drains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `untapped_drains`
--

DROP TABLE IF EXISTS `untapped_drains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `untapped_drains` (
  `untapped_id` int NOT NULL AUTO_INCREMENT,
  `drain_id` int NOT NULL,
  `untapped_drains` int DEFAULT '0',
  `untapped_discharge` decimal(12,2) DEFAULT '0.00',
  PRIMARY KEY (`untapped_id`),
  KEY `drain_id` (`drain_id`),
  CONSTRAINT `untapped_drains_ibfk_1` FOREIGN KEY (`drain_id`) REFERENCES `drain_master` (`drain_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `untapped_drains`
--

LOCK TABLES `untapped_drains` WRITE;
/*!40000 ALTER TABLE `untapped_drains` DISABLE KEYS */;
INSERT INTO `untapped_drains` VALUES (1,1,0,0.00),(2,2,2,136.89),(3,3,0,0.00),(4,4,2,2.80),(5,5,1,20.00),(6,6,0,0.00),(7,7,0,0.00),(8,8,0,0.00),(9,9,19,49.80),(10,10,0,0.00),(11,11,0,0.00),(12,12,1,6.00),(13,13,9,11.90),(14,14,4,8.13),(15,15,3,7.40),(16,16,1,2.50),(17,17,11,9.71),(18,18,9,2.12),(19,19,2,29.33),(20,20,5,1.59),(21,21,0,0.00),(22,22,1,12.10),(23,23,2,0.50),(24,24,8,11.68),(25,25,5,2.21),(26,26,7,3.57),(27,27,13,3.83),(28,28,1,18.00),(29,29,0,0.00),(30,30,0,0.00),(31,31,1,30.00),(32,32,7,51.56),(33,33,0,0.00),(34,34,7,120.49),(35,35,0,0.00),(36,36,0,0.00),(37,37,0,0.00),(38,38,61,67.39),(39,39,2,28.00),(40,40,0,0.00),(41,41,0,0.00),(42,42,1,6.00),(43,43,2,155.22),(44,44,3,30.91),(45,45,0,0.00),(46,46,4,15.65),(47,47,0,0.00),(48,48,10,16.32),(49,49,1,10.44),(50,50,15,8.27),(51,51,10,32.87),(52,52,16,0.00),(53,53,1,3.40),(54,54,6,9.04),(55,55,0,0.00),(56,56,1,3.00),(57,57,3,9.16),(58,58,10,58.09),(59,59,0,0.00),(60,60,0,0.00),(61,61,0,0.00),(62,62,9,49.96),(63,63,6,27.00),(64,64,7,32.80),(65,65,1,54.78),(66,66,0,0.00),(67,67,0,0.00),(68,68,5,6.68),(69,69,21,12.72),(70,70,8,4.58),(71,71,2,3.40),(72,72,0,0.00),(73,73,22,22.46),(74,74,6,19.41),(75,75,3,8.00),(76,76,2,11.50),(77,77,24,109.53),(78,78,0,0.00),(79,79,7,14.83),(80,80,61,18.32),(81,81,0,0.00),(82,82,2,2.23),(83,83,0,0.00),(84,84,1,11.00),(85,85,0,0.00),(86,86,2,52.00),(87,87,1,5.00),(88,88,1,1.40),(89,89,2,16.46);
/*!40000 ALTER TABLE `untapped_drains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'river_wise_drains'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 16:20:08
CREATE DATABASE  IF NOT EXISTS `river_wise_drains_audit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `river_wise_drains_audit`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: river_wise_drains_audit
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
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `district_id` int NOT NULL AUTO_INCREMENT,
  `river_id` int NOT NULL,
  `district_name` varchar(255) NOT NULL,
  PRIMARY KEY (`district_id`),
  KEY `river_id` (`river_id`),
  CONSTRAINT `districts_ibfk_1` FOREIGN KEY (`river_id`) REFERENCES `rivers` (`river_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,1,'Sant Kabeer Nagar'),(2,2,'Aligarh'),(3,3,'Varanasi'),(4,4,'Hamirpur'),(5,4,'Lalitpur'),(6,5,'Bareilly'),(7,6,'Bijnor'),(8,6,'Bulandshahr'),(9,6,'PrayagRaj'),(10,6,'Farrukhabad'),(11,6,'Hapur'),(12,6,'Kannauj'),(13,6,'Kanpur Nagar'),(14,6,'Mirzapur'),(15,6,'Unnao'),(16,6,'Varanasi'),(17,6,'Ghazipur'),(18,6,'Rae Bareli'),(19,6,'Chandauli'),(20,6,'Pratapgarh'),(21,6,'Amroha'),(22,6,'Ballia'),(23,6,'Kaushambi'),(24,7,'Ambedkar Nagar'),(25,7,'Mau'),(26,8,'Gorakhpur'),(27,8,'Deoria'),(28,9,'Barabanki'),(29,9,'Sultanpur'),(30,9,'Amethi'),(31,9,'Pilibhit'),(32,9,'Lucknow'),(33,9,'Jaunpur'),(34,10,'Ghaziabad'),(35,10,'Muzaffarnagar'),(36,10,'Baghpat'),(37,10,'Meerut'),(38,10,'Saharanpur'),(39,10,'Gautam Buddha Nagar'),(40,11,'Etah'),(41,12,'Kasganj'),(42,13,'Hapur'),(43,13,'Meerut'),(44,13,'Bulandshahr'),(45,13,'Ghaziabad'),(46,14,'Saharanpur'),(47,14,'Muzaffarnagar'),(48,15,'Hathras'),(49,16,'Banda'),(50,17,'Mathura'),(51,18,'Shamli'),(52,19,'Chitrakoot'),(53,20,'Sant Ravidas Nagar'),(54,21,'Mahoba'),(55,22,'Bareilly'),(56,23,'Jhansi'),(57,24,'Kanpur Nagar'),(58,25,'Moradabad'),(59,25,'Rampur'),(60,25,'Bareilly'),(61,26,'Gorakhpur'),(62,27,'Gorakhpur'),(63,28,'Gorakhpur'),(64,29,'Rae Bareli'),(65,29,'Lucknow'),(66,29,'Hardoi'),(67,29,'Pratapgarh'),(68,30,'Lakhimpur Kheri'),(69,30,'Sitapur'),(70,31,'Ayodhya'),(71,32,'Sonbhadra'),(72,33,'Mau'),(73,33,'Azamgarh'),(74,33,'Ambedkar Nagar'),(75,34,'Lakhimpur Kheri'),(76,35,'Sant Ravidas Nagar'),(77,35,'Varanasi'),(78,36,'Baghpat'),(79,36,'Mathura'),(80,36,'Agra'),(81,36,'Firozabad'),(82,36,'PrayagRaj'),(83,36,'Etawah'),(84,36,'Jalaun'),(85,36,'Shamli'),(86,36,'Ghaziabad'),(87,36,'Chitrakoot'),(88,36,'Hamirpur'),(89,36,'Auraiya');
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
  `district_id` int NOT NULL,
  `total_drains` int DEFAULT '0',
  `total_discharge` decimal(12,2) DEFAULT '0.00',
  `scrape_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`drain_id`),
  KEY `district_id` (`district_id`),
  CONSTRAINT `drain_master_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drain_master`
--

LOCK TABLES `drain_master` WRITE;
/*!40000 ALTER TABLE `drain_master` DISABLE KEYS */;
INSERT INTO `drain_master` VALUES (1,1,0,0.00,'2026-06-01 12:53:32'),(2,2,8,145.40,'2026-06-01 12:53:32'),(3,3,1,78.00,'2026-06-01 12:53:32'),(4,4,2,2.80,'2026-06-01 12:53:32'),(5,5,1,20.00,'2026-06-01 12:53:32'),(6,6,1,0.87,'2026-06-01 12:53:32'),(7,7,3,26.05,'2026-06-01 12:53:32'),(8,8,3,5.06,'2026-06-01 12:53:32'),(9,9,48,167.70,'2026-06-01 12:53:32'),(10,10,8,47.72,'2026-06-01 12:53:32'),(11,11,2,7.50,'2026-06-01 12:53:32'),(12,12,4,20.00,'2026-06-01 12:53:32'),(13,13,27,188.45,'2026-06-01 12:53:32'),(14,14,49,33.92,'2026-06-01 12:53:32'),(15,15,8,23.32,'2026-06-01 12:53:32'),(16,16,28,73.73,'2026-06-01 12:53:32'),(17,17,34,35.88,'2026-06-01 12:53:32'),(18,18,9,2.12,'2026-06-01 12:53:32'),(19,19,2,29.33,'2026-06-01 12:53:32'),(20,20,5,1.59,'2026-06-01 12:53:32'),(21,21,1,4.50,'2026-06-01 12:53:32'),(22,22,1,12.10,'2026-06-01 12:53:32'),(23,23,2,0.50,'2026-06-01 12:53:32'),(24,24,8,11.68,'2026-06-01 12:53:32'),(25,25,5,2.21,'2026-06-01 12:53:32'),(26,26,7,3.57,'2026-06-01 12:53:32'),(27,27,13,3.83,'2026-06-01 12:53:32'),(28,28,1,18.00,'2026-06-01 12:53:32'),(29,29,6,14.57,'2026-06-01 12:53:32'),(30,30,1,5.00,'2026-06-01 12:53:32'),(31,31,4,100.00,'2026-06-01 12:53:32'),(32,32,33,550.98,'2026-06-01 12:53:32'),(33,33,14,23.44,'2026-06-01 12:53:32'),(34,34,8,306.49,'2026-06-01 12:53:32'),(35,35,3,7.40,'2026-06-01 12:53:32'),(36,36,0,0.00,'2026-06-01 12:53:32'),(37,37,2,2.46,'2026-06-01 12:53:32'),(38,38,105,114.68,'2026-06-01 12:53:32'),(39,39,2,28.00,'2026-06-01 12:53:32'),(40,40,1,4.00,'2026-06-01 12:53:32'),(41,41,3,13.53,'2026-06-01 12:53:32'),(42,42,1,6.00,'2026-06-01 12:53:32'),(43,43,3,307.22,'2026-06-01 12:53:32'),(44,44,17,59.99,'2026-06-01 12:53:32'),(45,45,0,0.00,'2026-06-01 12:53:32'),(46,46,4,15.65,'2026-06-01 12:53:32'),(47,47,10,73.84,'2026-06-01 12:53:32'),(48,48,10,16.32,'2026-06-01 12:53:32'),(49,49,1,10.44,'2026-06-01 12:53:32'),(50,50,15,8.27,'2026-06-01 12:53:32'),(51,51,12,35.72,'2026-06-01 12:53:32'),(52,52,16,0.00,'2026-06-01 12:53:32'),(53,53,2,4.15,'2026-06-01 12:53:32'),(54,54,6,9.04,'2026-06-01 12:53:32'),(55,55,13,41.23,'2026-06-01 12:53:32'),(56,56,10,42.00,'2026-06-01 12:53:32'),(57,57,9,98.42,'2026-06-01 12:53:32'),(58,58,24,97.97,'2026-06-01 12:53:32'),(59,59,3,33.39,'2026-06-01 12:53:32'),(60,60,1,18.82,'2026-06-01 12:53:32'),(61,61,24,47.82,'2026-06-01 12:53:32'),(62,62,9,49.96,'2026-06-01 12:53:32'),(63,63,6,27.00,'2026-06-01 12:53:32'),(64,64,7,32.80,'2026-06-01 12:53:32'),(65,65,1,54.78,'2026-06-01 12:53:32'),(66,66,1,1.08,'2026-06-01 12:53:32'),(67,67,4,7.10,'2026-06-01 12:53:32'),(68,68,5,6.68,'2026-06-01 12:53:32'),(69,69,21,12.72,'2026-06-01 12:53:32'),(70,70,21,30.87,'2026-06-01 12:53:32'),(71,71,2,3.40,'2026-06-01 12:53:32'),(72,72,0,0.00,'2026-06-01 12:53:32'),(73,73,22,22.46,'2026-06-01 12:53:32'),(74,74,6,19.41,'2026-06-01 12:53:32'),(75,75,3,8.00,'2026-06-01 12:53:32'),(76,76,2,11.50,'2026-06-01 12:53:32'),(77,77,43,226.80,'2026-06-01 12:53:32'),(78,78,4,8.60,'2026-06-01 12:53:32'),(79,79,38,81.58,'2026-06-01 12:53:32'),(80,80,90,286.85,'2026-06-01 12:53:32'),(81,81,2,54.26,'2026-06-01 12:53:32'),(82,82,33,125.90,'2026-06-01 12:53:32'),(83,83,2,30.99,'2026-06-01 12:53:32'),(84,84,1,11.00,'2026-06-01 12:53:32'),(85,85,1,12.00,'2026-06-01 12:53:32'),(86,86,2,52.00,'2026-06-01 12:53:32'),(87,87,1,5.00,'2026-06-01 12:53:32'),(88,88,1,1.40,'2026-06-01 12:53:32'),(89,89,2,16.46,'2026-06-01 12:53:32');
/*!40000 ALTER TABLE `drain_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `not_to_be_tapped_drains`
--

DROP TABLE IF EXISTS `not_to_be_tapped_drains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `not_to_be_tapped_drains` (
  `not_to_be_tapped_id` int NOT NULL AUTO_INCREMENT,
  `drain_id` int NOT NULL,
  `not_to_be_tapped_drains` int DEFAULT '0',
  `not_to_be_tapped_discharge` decimal(12,2) DEFAULT '0.00',
  PRIMARY KEY (`not_to_be_tapped_id`),
  KEY `drain_id` (`drain_id`),
  CONSTRAINT `not_to_be_tapped_drains_ibfk_1` FOREIGN KEY (`drain_id`) REFERENCES `drain_master` (`drain_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `not_to_be_tapped_drains`
--

LOCK TABLES `not_to_be_tapped_drains` WRITE;
/*!40000 ALTER TABLE `not_to_be_tapped_drains` DISABLE KEYS */;
INSERT INTO `not_to_be_tapped_drains` VALUES (1,1,0,0.00),(2,2,6,8.51),(3,3,0,0.00),(4,4,0,0.00),(5,5,0,0.00),(6,6,0,0.00),(7,7,1,15.00),(8,8,0,0.00),(9,9,2,1.22),(10,10,1,8.00),(11,11,0,0.00),(12,12,0,0.00),(13,13,1,0.00),(14,14,27,6.53),(15,15,0,0.00),(16,16,0,0.00),(17,17,23,26.17),(18,18,0,0.00),(19,19,0,0.00),(20,20,0,0.00),(21,21,1,4.50),(22,22,0,0.00),(23,23,0,0.00),(24,24,0,0.00),(25,25,0,0.00),(26,26,0,0.00),(27,27,0,0.00),(28,28,0,0.00),(29,29,1,0.63),(30,30,1,5.00),(31,31,1,10.00),(32,32,1,0.00),(33,33,0,0.00),(34,34,0,0.00),(35,35,0,0.00),(36,36,0,0.00),(37,37,2,2.46),(38,38,6,17.04),(39,39,0,0.00),(40,40,0,0.00),(41,41,1,0.77),(42,42,0,0.00),(43,43,0,0.00),(44,44,14,29.08),(45,45,0,0.00),(46,46,0,0.00),(47,47,3,22.75),(48,48,0,0.00),(49,49,0,0.00),(50,50,0,0.00),(51,51,2,2.85),(52,52,0,0.00),(53,53,1,0.75),(54,54,0,0.00),(55,55,2,0.02),(56,56,0,0.00),(57,57,0,0.00),(58,58,0,0.00),(59,59,0,0.00),(60,60,0,0.00),(61,61,0,0.00),(62,62,0,0.00),(63,63,0,0.00),(64,64,0,0.00),(65,65,0,0.00),(66,66,1,1.08),(67,67,0,0.00),(68,68,0,0.00),(69,69,0,0.00),(70,70,0,0.00),(71,71,0,0.00),(72,72,0,0.00),(73,73,0,0.00),(74,74,0,0.00),(75,75,0,0.00),(76,76,0,0.00),(77,77,0,0.00),(78,78,0,0.00),(79,79,0,0.00),(80,80,0,0.00),(81,81,0,0.00),(82,82,3,0.17),(83,83,0,0.00),(84,84,0,0.00),(85,85,0,0.00),(86,86,0,0.00),(87,87,0,0.00),(88,88,0,0.00),(89,89,0,0.00);
/*!40000 ALTER TABLE `not_to_be_tapped_drains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partial_tapped_drains`
--

DROP TABLE IF EXISTS `partial_tapped_drains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partial_tapped_drains` (
  `partial_id` int NOT NULL AUTO_INCREMENT,
  `drain_id` int NOT NULL,
  `partial_tapped_drains` int DEFAULT '0',
  `partial_tapped_discharge` decimal(12,2) DEFAULT '0.00',
  PRIMARY KEY (`partial_id`),
  KEY `drain_id` (`drain_id`),
  CONSTRAINT `partial_tapped_drains_ibfk_1` FOREIGN KEY (`drain_id`) REFERENCES `drain_master` (`drain_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partial_tapped_drains`
--

LOCK TABLES `partial_tapped_drains` WRITE;
/*!40000 ALTER TABLE `partial_tapped_drains` DISABLE KEYS */;
INSERT INTO `partial_tapped_drains` VALUES (1,1,0,0.00),(2,2,0,0.00),(3,3,1,78.00),(4,4,0,0.00),(5,5,0,0.00),(6,6,0,0.00),(7,7,0,0.00),(8,8,0,0.00),(9,9,1,20.08),(10,10,0,0.00),(11,11,0,0.00),(12,12,0,0.00),(13,13,0,0.00),(14,14,0,0.00),(15,15,0,0.00),(16,16,1,5.00),(17,17,0,0.00),(18,18,0,0.00),(19,19,0,0.00),(20,20,0,0.00),(21,21,0,0.00),(22,22,0,0.00),(23,23,0,0.00),(24,24,0,0.00),(25,25,0,0.00),(26,26,0,0.00),(27,27,0,0.00),(28,28,0,0.00),(29,29,0,0.00),(30,30,0,0.00),(31,31,1,40.00),(32,32,15,449.70),(33,33,1,0.45),(34,34,0,0.00),(35,35,0,0.00),(36,36,0,0.00),(37,37,0,0.00),(38,38,0,0.00),(39,39,0,0.00),(40,40,0,0.00),(41,41,0,0.00),(42,42,0,0.00),(43,43,1,152.00),(44,44,0,0.00),(45,45,0,0.00),(46,46,0,0.00),(47,47,0,0.00),(48,48,0,0.00),(49,49,0,0.00),(50,50,0,0.00),(51,51,0,0.00),(52,52,0,0.00),(53,53,0,0.00),(54,54,0,0.00),(55,55,0,0.00),(56,56,0,0.00),(57,57,2,57.95),(58,58,7,30.63),(59,59,0,0.00),(60,60,0,0.00),(61,61,0,0.00),(62,62,0,0.00),(63,63,0,0.00),(64,64,0,0.00),(65,65,0,0.00),(66,66,0,0.00),(67,67,0,0.00),(68,68,0,0.00),(69,69,0,0.00),(70,70,0,0.00),(71,71,0,0.00),(72,72,0,0.00),(73,73,0,0.00),(74,74,0,0.00),(75,75,0,0.00),(76,76,0,0.00),(77,77,1,10.94),(78,78,0,0.00),(79,79,1,26.49),(80,80,8,207.28),(81,81,0,0.00),(82,82,0,0.00),(83,83,0,0.00),(84,84,0,0.00),(85,85,0,0.00),(86,86,0,0.00),(87,87,0,0.00),(88,88,0,0.00),(89,89,0,0.00);
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
  `river_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`river_id`),
  UNIQUE KEY `river_name` (`river_name`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rivers`
--

LOCK TABLES `rivers` WRITE;
/*!40000 ALTER TABLE `rivers` DISABLE KEYS */;
INSERT INTO `rivers` VALUES (1,'Aami 2'),(2,'Aligarh  Drain ( Irrigation )'),(3,'Assi'),(4,'Betwa'),(5,'DEVRANIYA'),(6,'Ganga'),(7,'Ghaghara'),(8,'Ghaghra'),(9,'Gomti'),(10,'Harnandi (Hindon)'),(11,'Ishan'),(12,'kaali Nadi'),(13,'Kali'),(14,'Kali West'),(15,'Karvan'),(16,'Ken'),(17,'Kosi Arterial Channel'),(18,'Krishni'),(19,'Mandakini'),(20,'Morwa'),(22,'NAKTIA RIVER'),(21,'nan'),(23,'Pahunch'),(24,'Pandu'),(25,'Ram ganga'),(26,'Ramgarhtal'),(27,'Rapti'),(28,'Rohini'),(29,'Sai'),(30,'Sarayan'),(31,'Saryu'),(32,'Sone'),(33,'Tamsa'),(34,'ULL RIVER'),(35,'Varuna'),(36,'Yamuna');
/*!40000 ALTER TABLE `rivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tapped_drains`
--

DROP TABLE IF EXISTS `tapped_drains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tapped_drains` (
  `tapped_id` int NOT NULL AUTO_INCREMENT,
  `drain_id` int NOT NULL,
  `tapped_drains` int DEFAULT '0',
  `tapped_discharge` decimal(12,2) DEFAULT '0.00',
  PRIMARY KEY (`tapped_id`),
  KEY `drain_id` (`drain_id`),
  CONSTRAINT `tapped_drains_ibfk_1` FOREIGN KEY (`drain_id`) REFERENCES `drain_master` (`drain_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tapped_drains`
--

LOCK TABLES `tapped_drains` WRITE;
/*!40000 ALTER TABLE `tapped_drains` DISABLE KEYS */;
INSERT INTO `tapped_drains` VALUES (1,1,0,0.00),(2,2,0,0.00),(3,3,0,0.00),(4,4,0,0.00),(5,5,0,0.00),(6,6,1,0.87),(7,7,2,11.05),(8,8,3,5.06),(9,9,26,96.60),(10,10,7,39.72),(11,11,2,7.50),(12,12,3,14.00),(13,13,17,176.55),(14,14,18,19.26),(15,15,5,15.92),(16,16,26,66.23),(17,17,0,0.00),(18,18,0,0.00),(19,19,0,0.00),(20,20,0,0.00),(21,21,0,0.00),(22,22,0,0.00),(23,23,0,0.00),(24,24,0,0.00),(25,25,0,0.00),(26,26,0,0.00),(27,27,0,0.00),(28,28,0,0.00),(29,29,5,13.94),(30,30,0,0.00),(31,31,1,20.00),(32,32,10,49.72),(33,33,13,22.99),(34,34,1,186.00),(35,35,3,7.40),(36,36,0,0.00),(37,37,0,0.00),(38,38,38,30.25),(39,39,0,0.00),(40,40,1,4.00),(41,41,2,12.76),(42,42,0,0.00),(43,43,0,0.00),(44,44,0,0.00),(45,45,0,0.00),(46,46,0,0.00),(47,47,7,51.09),(48,48,0,0.00),(49,49,0,0.00),(50,50,0,0.00),(51,51,0,0.00),(52,52,0,0.00),(53,53,0,0.00),(54,54,0,0.00),(55,55,11,41.21),(56,56,9,39.00),(57,57,4,31.31),(58,58,7,9.25),(59,59,3,33.39),(60,60,1,18.82),(61,61,24,47.82),(62,62,0,0.00),(63,63,0,0.00),(64,64,0,0.00),(65,65,0,0.00),(66,66,0,0.00),(67,67,4,7.10),(68,68,0,0.00),(69,69,0,0.00),(70,70,13,26.29),(71,71,0,0.00),(72,72,0,0.00),(73,73,0,0.00),(74,74,0,0.00),(75,75,0,0.00),(76,76,0,0.00),(77,77,18,106.33),(78,78,4,8.60),(79,79,30,40.26),(80,80,21,61.25),(81,81,2,54.26),(82,82,28,123.50),(83,83,2,30.99),(84,84,0,0.00),(85,85,1,12.00),(86,86,0,0.00),(87,87,0,0.00),(88,88,0,0.00),(89,89,0,0.00);
/*!40000 ALTER TABLE `tapped_drains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `untapped_drains`
--

DROP TABLE IF EXISTS `untapped_drains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `untapped_drains` (
  `untapped_id` int NOT NULL AUTO_INCREMENT,
  `drain_id` int NOT NULL,
  `untapped_drains` int DEFAULT '0',
  `untapped_discharge` decimal(12,2) DEFAULT '0.00',
  PRIMARY KEY (`untapped_id`),
  KEY `drain_id` (`drain_id`),
  CONSTRAINT `untapped_drains_ibfk_1` FOREIGN KEY (`drain_id`) REFERENCES `drain_master` (`drain_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `untapped_drains`
--

LOCK TABLES `untapped_drains` WRITE;
/*!40000 ALTER TABLE `untapped_drains` DISABLE KEYS */;
INSERT INTO `untapped_drains` VALUES (1,1,0,0.00),(2,2,2,136.89),(3,3,0,0.00),(4,4,2,2.80),(5,5,1,20.00),(6,6,0,0.00),(7,7,0,0.00),(8,8,0,0.00),(9,9,19,49.80),(10,10,0,0.00),(11,11,0,0.00),(12,12,1,6.00),(13,13,9,11.90),(14,14,4,8.13),(15,15,3,7.40),(16,16,1,2.50),(17,17,11,9.71),(18,18,9,2.12),(19,19,2,29.33),(20,20,5,1.59),(21,21,0,0.00),(22,22,1,12.10),(23,23,2,0.50),(24,24,8,11.68),(25,25,5,2.21),(26,26,7,3.57),(27,27,13,3.83),(28,28,1,18.00),(29,29,0,0.00),(30,30,0,0.00),(31,31,1,30.00),(32,32,7,51.56),(33,33,0,0.00),(34,34,7,120.49),(35,35,0,0.00),(36,36,0,0.00),(37,37,0,0.00),(38,38,61,67.39),(39,39,2,28.00),(40,40,0,0.00),(41,41,0,0.00),(42,42,1,6.00),(43,43,2,155.22),(44,44,3,30.91),(45,45,0,0.00),(46,46,4,15.65),(47,47,0,0.00),(48,48,10,16.32),(49,49,1,10.44),(50,50,15,8.27),(51,51,10,32.87),(52,52,16,0.00),(53,53,1,3.40),(54,54,6,9.04),(55,55,0,0.00),(56,56,1,3.00),(57,57,3,9.16),(58,58,10,58.09),(59,59,0,0.00),(60,60,0,0.00),(61,61,0,0.00),(62,62,9,49.96),(63,63,6,27.00),(64,64,7,32.80),(65,65,1,54.78),(66,66,0,0.00),(67,67,0,0.00),(68,68,5,6.68),(69,69,21,12.72),(70,70,8,4.58),(71,71,2,3.40),(72,72,0,0.00),(73,73,22,22.46),(74,74,6,19.41),(75,75,3,8.00),(76,76,2,11.50),(77,77,24,109.53),(78,78,0,0.00),(79,79,7,14.83),(80,80,61,18.32),(81,81,0,0.00),(82,82,2,2.23),(83,83,0,0.00),(84,84,1,11.00),(85,85,0,0.00),(86,86,2,52.00),(87,87,1,5.00),(88,88,1,1.40),(89,89,2,16.46);
/*!40000 ALTER TABLE `untapped_drains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'river_wise_drains_audit'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 16:20:08
