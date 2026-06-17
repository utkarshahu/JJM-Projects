CREATE DATABASE  IF NOT EXISTS `stp_monitoring_audit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `stp_monitoring_audit`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: stp_monitoring_audit
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
-- Table structure for table `stp_capacity_summary`
--

DROP TABLE IF EXISTS `stp_capacity_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stp_capacity_summary` (
  `capacity_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `total_stp` int DEFAULT '0',
  `capacity_mld` decimal(12,2) DEFAULT '0.00',
  `utilization_capacity_mld` decimal(12,2) DEFAULT '0.00',
  `utilization_percent` decimal(8,2) DEFAULT '0.00',
  `report_date` date NOT NULL,
  `audit_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`capacity_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `stp_capacity_summary_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `stp_categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=538 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stp_capacity_summary`
--

LOCK TABLES `stp_capacity_summary` WRITE;
/*!40000 ALTER TABLE `stp_capacity_summary` DISABLE KEYS */;
INSERT INTO `stp_capacity_summary` VALUES (535,538,133,4121.48,3318.02,80.51,'2026-06-09','2026-06-10 05:36:52'),(536,539,5,125.50,74.00,58.96,'2026-06-09','2026-06-10 05:36:52'),(537,540,10,346.26,169.76,49.03,'2026-06-09','2026-06-10 05:36:52');
/*!40000 ALTER TABLE `stp_capacity_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stp_categories`
--

DROP TABLE IF EXISTS `stp_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stp_categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=541 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stp_categories`
--

LOCK TABLES `stp_categories` WRITE;
/*!40000 ALTER TABLE `stp_categories` DISABLE KEYS */;
INSERT INTO `stp_categories` VALUES (538,'Compliant'),(539,'Non-Compliant'),(540,'Non-Operational');
/*!40000 ALTER TABLE `stp_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stp_maintainers`
--

DROP TABLE IF EXISTS `stp_maintainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stp_maintainers` (
  `maintainer_id` int NOT NULL AUTO_INCREMENT,
  `maintainer_name` varchar(255) NOT NULL,
  PRIMARY KEY (`maintainer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1791 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stp_maintainers`
--

LOCK TABLES `stp_maintainers` WRITE;
/*!40000 ALTER TABLE `stp_maintainers` DISABLE KEYS */;
INSERT INTO `stp_maintainers` VALUES (1781,'UPJN(U)'),(1782,'UPJN(R)'),(1783,'Development Authority'),(1784,'NOIDA/ G.NOIDA'),(1785,'Urban Development Department'),(1786,'Awas Vikas'),(1787,'Banaras Locomotive Works'),(1788,'NAPS'),(1789,'UPSIDC'),(1790,'YEIDA');
/*!40000 ALTER TABLE `stp_maintainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stp_status_summary`
--

DROP TABLE IF EXISTS `stp_status_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stp_status_summary` (
  `summary_id` int NOT NULL AUTO_INCREMENT,
  `maintainer_id` int NOT NULL,
  `total_stp` int DEFAULT '0',
  `compliant` int DEFAULT '0',
  `non_compliant` int DEFAULT '0',
  `non_operational` int DEFAULT '0',
  `report_date` date NOT NULL,
  `audit_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`summary_id`),
  KEY `maintainer_id` (`maintainer_id`),
  CONSTRAINT `stp_status_summary_ibfk_1` FOREIGN KEY (`maintainer_id`) REFERENCES `stp_maintainers` (`maintainer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1791 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stp_status_summary`
--

LOCK TABLES `stp_status_summary` WRITE;
/*!40000 ALTER TABLE `stp_status_summary` DISABLE KEYS */;
INSERT INTO `stp_status_summary` VALUES (1781,1781,53,48,1,4,'2026-06-09','2026-06-10 05:36:52'),(1782,1782,48,46,2,0,'2026-06-09','2026-06-10 05:36:52'),(1783,1783,21,18,0,3,'2026-06-09','2026-06-10 05:36:52'),(1784,1784,12,12,0,0,'2026-06-09','2026-06-10 05:36:52'),(1785,1785,8,4,2,2,'2026-06-09','2026-06-10 05:36:52'),(1786,1786,2,2,0,0,'2026-06-09','2026-06-10 05:36:52'),(1787,1787,1,1,0,0,'2026-06-09','2026-06-10 05:36:52'),(1788,1788,1,1,0,0,'2026-06-09','2026-06-10 05:36:52'),(1789,1789,1,1,0,0,'2026-06-09','2026-06-10 05:36:52'),(1790,1790,1,0,0,1,'2026-06-09','2026-06-10 05:36:52');
/*!40000 ALTER TABLE `stp_status_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'stp_monitoring_audit'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:52:55
CREATE DATABASE  IF NOT EXISTS `stp_monitoring` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `stp_monitoring`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: stp_monitoring
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
-- Table structure for table `stp_capacity_summary`
--

DROP TABLE IF EXISTS `stp_capacity_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stp_capacity_summary` (
  `capacity_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `total_stp` int DEFAULT '0',
  `capacity_mld` decimal(12,2) DEFAULT '0.00',
  `utilization_capacity_mld` decimal(12,2) DEFAULT '0.00',
  `utilization_percent` decimal(8,2) DEFAULT '0.00',
  `report_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`capacity_id`),
  KEY `fk_capacity_category` (`category_id`),
  CONSTRAINT `fk_capacity_category` FOREIGN KEY (`category_id`) REFERENCES `stp_categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=541 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stp_capacity_summary`
--

LOCK TABLES `stp_capacity_summary` WRITE;
/*!40000 ALTER TABLE `stp_capacity_summary` DISABLE KEYS */;
INSERT INTO `stp_capacity_summary` VALUES (538,541,133,4121.48,3318.02,80.51,'2026-06-09','2026-06-10 05:36:52'),(539,542,5,125.50,74.00,58.96,'2026-06-09','2026-06-10 05:36:52'),(540,543,10,346.26,169.76,49.03,'2026-06-09','2026-06-10 05:36:52');
/*!40000 ALTER TABLE `stp_capacity_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stp_categories`
--

DROP TABLE IF EXISTS `stp_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stp_categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=544 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stp_categories`
--

LOCK TABLES `stp_categories` WRITE;
/*!40000 ALTER TABLE `stp_categories` DISABLE KEYS */;
INSERT INTO `stp_categories` VALUES (541,'Compliant'),(542,'Non-Compliant'),(543,'Non-Operational');
/*!40000 ALTER TABLE `stp_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stp_maintainers`
--

DROP TABLE IF EXISTS `stp_maintainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stp_maintainers` (
  `maintainer_id` int NOT NULL AUTO_INCREMENT,
  `maintainer_name` varchar(255) NOT NULL,
  PRIMARY KEY (`maintainer_id`),
  UNIQUE KEY `maintainer_name` (`maintainer_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1801 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stp_maintainers`
--

LOCK TABLES `stp_maintainers` WRITE;
/*!40000 ALTER TABLE `stp_maintainers` DISABLE KEYS */;
INSERT INTO `stp_maintainers` VALUES (1796,'Awas Vikas'),(1797,'Banaras Locomotive Works'),(1793,'Development Authority'),(1798,'NAPS'),(1794,'NOIDA/ G.NOIDA'),(1792,'UPJN(R)'),(1791,'UPJN(U)'),(1799,'UPSIDC'),(1795,'Urban Development Department'),(1800,'YEIDA');
/*!40000 ALTER TABLE `stp_maintainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stp_status_summary`
--

DROP TABLE IF EXISTS `stp_status_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stp_status_summary` (
  `summary_id` int NOT NULL AUTO_INCREMENT,
  `maintainer_id` int NOT NULL,
  `total_stp` int DEFAULT '0',
  `compliant` int DEFAULT '0',
  `non_compliant` int DEFAULT '0',
  `non_operational` int DEFAULT '0',
  `report_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`summary_id`),
  KEY `fk_status_maintainer` (`maintainer_id`),
  CONSTRAINT `fk_status_maintainer` FOREIGN KEY (`maintainer_id`) REFERENCES `stp_maintainers` (`maintainer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1801 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stp_status_summary`
--

LOCK TABLES `stp_status_summary` WRITE;
/*!40000 ALTER TABLE `stp_status_summary` DISABLE KEYS */;
INSERT INTO `stp_status_summary` VALUES (1791,1791,53,48,1,4,'2026-06-09','2026-06-10 05:36:52'),(1792,1792,48,46,2,0,'2026-06-09','2026-06-10 05:36:52'),(1793,1793,21,18,0,3,'2026-06-09','2026-06-10 05:36:52'),(1794,1794,12,12,0,0,'2026-06-09','2026-06-10 05:36:52'),(1795,1795,8,4,2,2,'2026-06-09','2026-06-10 05:36:52'),(1796,1796,2,2,0,0,'2026-06-09','2026-06-10 05:36:52'),(1797,1797,1,1,0,0,'2026-06-09','2026-06-10 05:36:52'),(1798,1798,1,1,0,0,'2026-06-09','2026-06-10 05:36:52'),(1799,1799,1,1,0,0,'2026-06-09','2026-06-10 05:36:52'),(1800,1800,1,0,0,1,'2026-06-09','2026-06-10 05:36:52');
/*!40000 ALTER TABLE `stp_status_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'stp_monitoring'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:52:55
