CREATE DATABASE  IF NOT EXISTS `cetp_monitoring_audit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cetp_monitoring_audit`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cetp_monitoring_audit
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
-- Table structure for table `audit_cetp_compliance_statistics`
--

DROP TABLE IF EXISTS `audit_cetp_compliance_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_cetp_compliance_statistics` (
  `audit_stat_id` int NOT NULL AUTO_INCREMENT,
  `audit_master_id` int NOT NULL,
  `compliance_status` varchar(100) DEFAULT NULL,
  `bod_actual` decimal(10,2) DEFAULT NULL,
  `bod_design` varchar(50) DEFAULT NULL,
  `cod_actual` decimal(10,2) DEFAULT NULL,
  `cod_design` varchar(50) DEFAULT NULL,
  `tss_actual` decimal(10,2) DEFAULT NULL,
  `tss_design` varchar(50) DEFAULT NULL,
  `ph_actual` varchar(50) DEFAULT NULL,
  `ph_design` varchar(50) DEFAULT NULL,
  `remarks` text,
  `report_date` date DEFAULT NULL,
  `audit_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`audit_stat_id`),
  KEY `audit_master_id` (`audit_master_id`),
  CONSTRAINT `audit_cetp_compliance_statistics_ibfk_1` FOREIGN KEY (`audit_master_id`) REFERENCES `audit_cetp_master` (`audit_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_cetp_compliance_statistics`
--

LOCK TABLES `audit_cetp_compliance_statistics` WRITE;
/*!40000 ALTER TABLE `audit_cetp_compliance_statistics` DISABLE KEYS */;
INSERT INTO `audit_cetp_compliance_statistics` VALUES (1,1,'Compliant',17.00,'30',240.00,'250',24.00,'100','8.6','6-9','CETP is operational and complaint. 150 tanneries have been connected to piping network out of total 340 tanneries.',NULL,'2026-06-10 08:51:16'),(2,2,'Compliant',25.00,'30',120.00,'250',76.00,'100','7.84','6-9','3 MLD CETP sanctioned under Atal Mission. Under Tendering . Tenchinal bids evaluation under progress.',NULL,'2026-06-10 08:51:16'),(3,3,'Compliant',26.00,'30',174.00,'250',72.00,'100','7.85','6-9','Upgradation is Ongoing though Namami Gange Programme',NULL,'2026-06-10 08:51:16'),(4,4,'Non Compliant',40.00,'30',145.00,'250',66.00,'100','8.32','6-9','Upgradation sanctioned under Namami Gange.LOA issued to L1 bidder. Agreement to be signed',NULL,'2026-06-10 08:51:16'),(5,5,'Compliant',27.00,'30',232.00,'250',62.00,'100','8.2','6-9','Upgradation completed under Namami Gange Programme.Plant is under operation and maintenance.',NULL,'2026-06-10 08:51:16'),(6,6,'Compliant',28.00,'30',192.00,'250',98.00,'100','7.52','6-9','As per directions from NMCG the CETP is allowed to operate at 50 % capacity. DPR amount 21.50 Cr for upgradation of 6 MLD and 4MLD project is under reviewal at NMCG',NULL,'2026-06-10 08:51:16'),(7,7,'Compliant',25.00,'30',162.00,'250',96.00,'100','7.32','6-9','Upgradation Completed by HPDA.',NULL,'2026-06-10 08:51:16'),(8,8,'Defunct',0.00,'',0.00,'',0.00,'','0','','DPR for 800 KLD CETP  amounting to Rs 197.5 Lakhs have been submitted to NMCG vide SMCG letter dated 08/01/2025. NMCG has returned the DPR vide its letter dated 21/05/2025 asking for revisiting the c',NULL,'2026-06-10 08:51:16'),(9,9,'Defunct',0.00,'',0.00,'',0.00,'','0','','Plant is in a Obselete state. Joint site inspection report of UPSIDA and UPJN(urban) indicates very small amount of effluent generation 0.10 MLD from the industries',NULL,'2026-06-10 08:51:16'),(10,10,'Defunct',0.00,'',0.00,'',0.00,'','0','','DPR received from UPSIDA for upgradaton 561.96. Under Review at NMCG. NMCG has instructed SPV to submit SPV registration documents and provide undertaking of 25 % CAPEX sharing which has yet to be com',NULL,'2026-06-10 08:51:16');
/*!40000 ALTER TABLE `audit_cetp_compliance_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_cetp_master`
--

DROP TABLE IF EXISTS `audit_cetp_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_cetp_master` (
  `audit_master_id` int NOT NULL AUTO_INCREMENT,
  `audit_cetp_id` int NOT NULL,
  `audit_agency_id` int NOT NULL,
  `audit_department_id` int NOT NULL,
  `total_industries` int DEFAULT NULL,
  `capacity_mld` decimal(10,2) DEFAULT NULL,
  `audit_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`audit_master_id`),
  KEY `audit_cetp_id` (`audit_cetp_id`),
  KEY `audit_agency_id` (`audit_agency_id`),
  KEY `audit_department_id` (`audit_department_id`),
  CONSTRAINT `audit_cetp_master_ibfk_1` FOREIGN KEY (`audit_cetp_id`) REFERENCES `audit_cetps` (`audit_cetp_id`),
  CONSTRAINT `audit_cetp_master_ibfk_2` FOREIGN KEY (`audit_agency_id`) REFERENCES `audit_executing_agencies` (`audit_agency_id`),
  CONSTRAINT `audit_cetp_master_ibfk_3` FOREIGN KEY (`audit_department_id`) REFERENCES `audit_departments` (`audit_department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_cetp_master`
--

LOCK TABLES `audit_cetp_master` WRITE;
/*!40000 ALTER TABLE `audit_cetp_master` DISABLE KEYS */;
INSERT INTO `audit_cetp_master` VALUES (1,1,3,3,350,20.00,'2026-06-10 08:51:16'),(2,8,5,4,11,1.50,'2026-06-10 08:51:16'),(3,2,1,4,42,4.50,'2026-06-10 08:51:16'),(4,10,8,4,15,2.15,'2026-06-10 08:51:16'),(5,6,4,4,17,6.25,'2026-06-10 08:51:16'),(6,9,7,4,470,6.00,'2026-06-10 08:51:16'),(7,4,6,2,15,2.10,'2026-06-10 08:51:16'),(8,3,2,1,30,1.00,'2026-06-10 08:51:16'),(9,7,9,4,63,2.40,'2026-06-10 08:51:16'),(10,5,9,4,25,2.00,'2026-06-10 08:51:16');
/*!40000 ALTER TABLE `audit_cetp_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_cetps`
--

DROP TABLE IF EXISTS `audit_cetps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_cetps` (
  `audit_cetp_id` int NOT NULL AUTO_INCREMENT,
  `cetp_name` varchar(255) NOT NULL,
  `audit_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`audit_cetp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_cetps`
--

LOCK TABLES `audit_cetps` WRITE;
/*!40000 ALTER TABLE `audit_cetps` DISABLE KEYS */;
INSERT INTO `audit_cetps` VALUES (1,'20 MLD CETP Jajmau Kanpur','2026-06-10 08:51:16'),(2,'Banther CETP','2026-06-10 08:51:16'),(3,'Bhadohi CETP','2026-06-10 08:51:16'),(4,'HPDA, Pilkuwa','2026-06-10 08:51:16'),(5,'Jainpur Kanpur Dehat','2026-06-10 08:51:16'),(6,'Mathura CETP','2026-06-10 08:51:16'),(7,'Moradabad','2026-06-10 08:51:16'),(8,'Rooma Apparel Park','2026-06-10 08:51:16'),(9,'Tronica City','2026-06-10 08:51:16'),(10,'Unnao CETP','2026-06-10 08:51:16');
/*!40000 ALTER TABLE `audit_cetps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_departments`
--

DROP TABLE IF EXISTS `audit_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_departments` (
  `audit_department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) NOT NULL,
  `audit_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`audit_department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_departments`
--

LOCK TABLES `audit_departments` WRITE;
/*!40000 ALTER TABLE `audit_departments` DISABLE KEYS */;
INSERT INTO `audit_departments` VALUES (1,'BIDA','2026-06-10 08:51:16'),(2,'HPDA','2026-06-10 08:51:16'),(3,'JTETA','2026-06-10 08:51:16'),(4,'UPSIDA','2026-06-10 08:51:16');
/*!40000 ALTER TABLE `audit_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_executing_agencies`
--

DROP TABLE IF EXISTS `audit_executing_agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_executing_agencies` (
  `audit_agency_id` int NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(255) NOT NULL,
  `audit_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`audit_agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_executing_agencies`
--

LOCK TABLES `audit_executing_agencies` WRITE;
/*!40000 ALTER TABLE `audit_executing_agencies` DISABLE KEYS */;
INSERT INTO `audit_executing_agencies` VALUES (1,'Banther Industrial Pollution Control company','2026-06-10 08:51:16'),(2,'Bhadohi Industrial Development Authority','2026-06-10 08:51:16'),(3,'JTETA','2026-06-10 08:51:16'),(4,'Mathura Audhyogic Chetra and Pradushan Nivaran Company','2026-06-10 08:51:16'),(5,'Rooma Pollution control company','2026-06-10 08:51:16'),(6,'SPV Hapur Pilkhuwa Development Authority','2026-06-10 08:51:16'),(7,'Tronica City Companies Association','2026-06-10 08:51:16'),(8,'Unnao Tannery Pollution Control Company','2026-06-10 08:51:16'),(9,'Uttar Pradesh State Industrial Development Authority','2026-06-10 08:51:16');
/*!40000 ALTER TABLE `audit_executing_agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cetp_monitoring_audit'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:56:33
CREATE DATABASE  IF NOT EXISTS `cetp_monitoring` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cetp_monitoring`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cetp_monitoring
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
-- Table structure for table `cetp_compliance_statistics`
--

DROP TABLE IF EXISTS `cetp_compliance_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cetp_compliance_statistics` (
  `compliance_stat_id` int NOT NULL AUTO_INCREMENT,
  `cetp_master_id` int NOT NULL,
  `compliance_status` varchar(100) DEFAULT NULL,
  `bod_actual` decimal(10,2) DEFAULT NULL,
  `bod_design` varchar(50) DEFAULT NULL,
  `cod_actual` decimal(10,2) DEFAULT NULL,
  `cod_design` varchar(50) DEFAULT NULL,
  `tss_actual` decimal(10,2) DEFAULT NULL,
  `tss_design` varchar(50) DEFAULT NULL,
  `ph_actual` varchar(50) DEFAULT NULL,
  `ph_design` varchar(50) DEFAULT NULL,
  `remarks` text,
  `report_date` date DEFAULT NULL,
  `scrape_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`compliance_stat_id`),
  KEY `fk_compliance_master` (`cetp_master_id`),
  CONSTRAINT `fk_compliance_master` FOREIGN KEY (`cetp_master_id`) REFERENCES `cetp_master` (`cetp_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cetp_compliance_statistics`
--

LOCK TABLES `cetp_compliance_statistics` WRITE;
/*!40000 ALTER TABLE `cetp_compliance_statistics` DISABLE KEYS */;
INSERT INTO `cetp_compliance_statistics` VALUES (1,1,'Compliant',17.00,'30',240.00,'250',24.00,'100','8.6','6-9','CETP is operational and complaint. 150 tanneries have been connected to piping network out of total 340 tanneries.',NULL,'2026-06-10 08:51:17'),(2,2,'Compliant',25.00,'30',120.00,'250',76.00,'100','7.84','6-9','3 MLD CETP sanctioned under Atal Mission. Under Tendering . Tenchinal bids evaluation under progress.',NULL,'2026-06-10 08:51:17'),(3,3,'Compliant',26.00,'30',174.00,'250',72.00,'100','7.85','6-9','Upgradation is Ongoing though Namami Gange Programme',NULL,'2026-06-10 08:51:17'),(4,4,'Non Compliant',40.00,'30',145.00,'250',66.00,'100','8.32','6-9','Upgradation sanctioned under Namami Gange.LOA issued to L1 bidder. Agreement to be signed',NULL,'2026-06-10 08:51:17'),(5,5,'Compliant',27.00,'30',232.00,'250',62.00,'100','8.2','6-9','Upgradation completed under Namami Gange Programme.Plant is under operation and maintenance.',NULL,'2026-06-10 08:51:17'),(6,6,'Compliant',28.00,'30',192.00,'250',98.00,'100','7.52','6-9','As per directions from NMCG the CETP is allowed to operate at 50 % capacity. DPR amount 21.50 Cr for upgradation of 6 MLD and 4MLD project is under reviewal at NMCG',NULL,'2026-06-10 08:51:17'),(7,7,'Compliant',25.00,'30',162.00,'250',96.00,'100','7.32','6-9','Upgradation Completed by HPDA.',NULL,'2026-06-10 08:51:17'),(8,8,'Defunct',0.00,'',0.00,'',0.00,'','0','','DPR for 800 KLD CETP  amounting to Rs 197.5 Lakhs have been submitted to NMCG vide SMCG letter dated 08/01/2025. NMCG has returned the DPR vide its letter dated 21/05/2025 asking for revisiting the c',NULL,'2026-06-10 08:51:17'),(9,9,'Defunct',0.00,'',0.00,'',0.00,'','0','','Plant is in a Obselete state. Joint site inspection report of UPSIDA and UPJN(urban) indicates very small amount of effluent generation 0.10 MLD from the industries',NULL,'2026-06-10 08:51:17'),(10,10,'Defunct',0.00,'',0.00,'',0.00,'','0','','DPR received from UPSIDA for upgradaton 561.96. Under Review at NMCG. NMCG has instructed SPV to submit SPV registration documents and provide undertaking of 25 % CAPEX sharing which has yet to be com',NULL,'2026-06-10 08:51:17');
/*!40000 ALTER TABLE `cetp_compliance_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cetp_master`
--

DROP TABLE IF EXISTS `cetp_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cetp_master` (
  `cetp_master_id` int NOT NULL AUTO_INCREMENT,
  `cetp_id` int NOT NULL,
  `agency_id` int NOT NULL,
  `department_id` int NOT NULL,
  `total_industries` int DEFAULT NULL,
  `capacity_mld` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`cetp_master_id`),
  KEY `fk_master_cetp` (`cetp_id`),
  KEY `fk_master_agency` (`agency_id`),
  KEY `fk_master_department` (`department_id`),
  CONSTRAINT `fk_master_agency` FOREIGN KEY (`agency_id`) REFERENCES `executing_agencies` (`agency_id`),
  CONSTRAINT `fk_master_cetp` FOREIGN KEY (`cetp_id`) REFERENCES `cetps` (`cetp_id`),
  CONSTRAINT `fk_master_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cetp_master`
--

LOCK TABLES `cetp_master` WRITE;
/*!40000 ALTER TABLE `cetp_master` DISABLE KEYS */;
INSERT INTO `cetp_master` VALUES (1,1,1,1,350,20.00),(2,2,2,2,11,1.50),(3,3,3,2,42,4.50),(4,4,4,2,15,2.15),(5,5,5,2,17,6.25),(6,6,6,2,470,6.00),(7,7,7,3,15,2.10),(8,8,8,4,30,1.00),(9,9,9,2,63,2.40),(10,10,9,2,25,2.00);
/*!40000 ALTER TABLE `cetp_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cetps`
--

DROP TABLE IF EXISTS `cetps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cetps` (
  `cetp_id` int NOT NULL AUTO_INCREMENT,
  `cetp_name` varchar(255) NOT NULL,
  PRIMARY KEY (`cetp_id`),
  UNIQUE KEY `cetp_name` (`cetp_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cetps`
--

LOCK TABLES `cetps` WRITE;
/*!40000 ALTER TABLE `cetps` DISABLE KEYS */;
INSERT INTO `cetps` VALUES (1,'20 MLD CETP Jajmau Kanpur'),(3,'Banther CETP'),(8,'Bhadohi CETP'),(7,'HPDA, Pilkuwa'),(10,'Jainpur Kanpur Dehat'),(5,'Mathura CETP'),(9,'Moradabad'),(2,'Rooma Apparel Park'),(6,'Tronica City'),(4,'Unnao CETP');
/*!40000 ALTER TABLE `cetps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) NOT NULL,
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `department_name` (`department_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (4,'BIDA'),(3,'HPDA'),(1,'JTETA'),(2,'UPSIDA');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `executing_agencies`
--

DROP TABLE IF EXISTS `executing_agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `executing_agencies` (
  `agency_id` int NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(255) NOT NULL,
  PRIMARY KEY (`agency_id`),
  UNIQUE KEY `agency_name` (`agency_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `executing_agencies`
--

LOCK TABLES `executing_agencies` WRITE;
/*!40000 ALTER TABLE `executing_agencies` DISABLE KEYS */;
INSERT INTO `executing_agencies` VALUES (3,'Banther Industrial Pollution Control company'),(8,'Bhadohi Industrial Development Authority'),(1,'JTETA'),(5,'Mathura Audhyogic Chetra and Pradushan Nivaran Company'),(2,'Rooma Pollution control company'),(7,'SPV Hapur Pilkhuwa Development Authority'),(6,'Tronica City Companies Association'),(4,'Unnao Tannery Pollution Control Company'),(9,'Uttar Pradesh State Industrial Development Authority');
/*!40000 ALTER TABLE `executing_agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cetp_monitoring'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:56:33
