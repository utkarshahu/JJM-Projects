CREATE DATABASE  IF NOT EXISTS `audit_status_of_cetp_up` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `audit_status_of_cetp_up`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: audit_status_of_cetp_up
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
-- Table structure for table `audit_cetp_projects`
--

DROP TABLE IF EXISTS `audit_cetp_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_cetp_projects` (
  `audit_project_id` int NOT NULL AUTO_INCREMENT,
  `audit_nodal_agency_id` int NOT NULL,
  `project_name` varchar(500) NOT NULL,
  `executive_agency` varchar(500) DEFAULT NULL,
  `contractor_name` varchar(500) DEFAULT NULL,
  `sanction_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `completion_date` date DEFAULT NULL,
  `sanction_cost_cr` decimal(12,2) DEFAULT NULL,
  `agreement_cost_cr` decimal(12,2) DEFAULT NULL,
  `physical_progress` decimal(10,2) DEFAULT NULL,
  `financial_progress` decimal(12,2) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `remarks` text,
  `report_date` date DEFAULT NULL,
  `scrape_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`audit_project_id`),
  KEY `fk_audit_project_agency` (`audit_nodal_agency_id`),
  CONSTRAINT `fk_audit_project_agency` FOREIGN KEY (`audit_nodal_agency_id`) REFERENCES `audit_nodal_agencies` (`audit_nodal_agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_cetp_projects`
--

LOCK TABLES `audit_cetp_projects` WRITE;
/*!40000 ALTER TABLE `audit_cetp_projects` DISABLE KEYS */;
INSERT INTO `audit_cetp_projects` VALUES (1,1,'2','4','5',NULL,NULL,NULL,9.00,10.00,11.00,12.00,NULL,'19','2026-06-11','2026-06-11 09:24:31'),(2,2,'Construction of 7.5 MLD CETP at GIDA,aaa Gorakhpur','M/S GIDA CETP Foundation','--','2022-01-11',NULL,NULL,93.52,0.00,2.40,2.50,'2025-08-29','4 MLD CETP DPR Preparation complete.','2026-06-11','2026-06-11 09:24:31'),(3,2,'Upgrdation of 4.5 MLD CETP at Banther , Unnao','Banther Industrial Pollution Control company','M/S EMS infracon','2020-02-21','2022-02-07','2025-07-31',108.96,111.96,10.00,11.00,'2025-08-29','Work Under Progress','2026-06-11','2026-06-11 09:24:31'),(4,2,'Construction of 20 MLD CETP at Jajmau Kanpur','Jajamau Tanners and effluent treatment','Va Tech Wabag','2019-02-11','2019-04-11','2024-04-01',617.00,520.14,94.00,353.00,NULL,'CETP is operational and complaint. 151 tanneries have been connected to piping network out of total 340 tanneries.All 340 tannery connnection targeted to be completed by August 25','2026-06-11','2026-06-11 09:24:31'),(5,2,'Upgradation of 2.15 MLD CETP to 2.15 MLD CETP at Unnnao','Unnao Tanners and pollution control company','M/s JV UTIPL-Oasis-SIMA','2022-06-26',NULL,NULL,127.00,172.00,0.00,0.00,NULL,'Agreement signing pending at level of SPV. In compliance of NMCG instructions SMCG -UP vide its letter dated 19/06/2025 has written to DM Unnao and MS UPPSB for doing necessary actions for agreement signing including action against defaulting tanneries.','2026-06-11','2026-06-11 09:24:31'),(6,1,'2','4','5',NULL,NULL,NULL,9.00,10.00,11.00,12.00,NULL,'19','2026-06-11','2026-06-11 09:24:31'),(7,2,'Construction of 7.5 MLD CETP at GIDA,aaa Gorakhpur','M/S GIDA CETP Foundation','--','2022-01-11',NULL,NULL,93.52,0.00,NULL,NULL,'2025-08-29','4 MLD CETP DPR Preparation complete.','2026-06-11','2026-06-11 09:24:31'),(8,2,'Upgrdation of 4.5 MLD CETP at Banther , Unnao','Banther Industrial Pollution Control company','M/S EMS infracon','2020-02-21','2022-02-07','2025-07-31',108.96,111.96,NULL,NULL,'2025-08-29','Work Under Progress','2026-06-11','2026-06-11 09:24:31'),(9,2,'Construction of 20 MLD CETP at Jajmau Kanpur','Jajamau Tanners and effluent treatment','Va Tech Wabag','2019-02-11','2019-04-11','2024-04-01',617.00,520.14,NULL,NULL,NULL,'CETP is operational and complaint. 151 tanneries have been connected to piping network out of total 340 tanneries.All 340 tannery connnection targeted to be completed by August 25','2026-06-11','2026-06-11 09:24:31'),(10,2,'Upgradation of 2.15 MLD CETP to 2.15 MLD CETP at Unnnao','Unnao Tanners and pollution control company','M/s JV UTIPL-Oasis-SIMA','2022-06-26',NULL,NULL,127.00,172.00,NULL,NULL,NULL,'Agreement signing pending at level of SPV. In compliance of NMCG instructions SMCG -UP vide its letter dated 19/06/2025 has written to DM Unnao and MS UPPSB for doing necessary actions for agreement signing including action against defaulting tanneries.','2026-06-11','2026-06-11 09:24:31');
/*!40000 ALTER TABLE `audit_cetp_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_nodal_agencies`
--

DROP TABLE IF EXISTS `audit_nodal_agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_nodal_agencies` (
  `audit_nodal_agency_id` int NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(255) NOT NULL,
  PRIMARY KEY (`audit_nodal_agency_id`),
  UNIQUE KEY `agency_name` (`agency_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_nodal_agencies`
--

LOCK TABLES `audit_nodal_agencies` WRITE;
/*!40000 ALTER TABLE `audit_nodal_agencies` DISABLE KEYS */;
INSERT INTO `audit_nodal_agencies` VALUES (1,'3'),(2,'NMCG');
/*!40000 ALTER TABLE `audit_nodal_agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_project_components`
--

DROP TABLE IF EXISTS `audit_project_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_project_components` (
  `audit_component_id` int NOT NULL AUTO_INCREMENT,
  `audit_project_id` int NOT NULL,
  `work_component` varchar(500) DEFAULT NULL,
  `technology` varchar(500) DEFAULT NULL,
  `capacity_length_no` varchar(100) DEFAULT NULL,
  `physical_progress` decimal(10,2) DEFAULT NULL,
  `photos` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`audit_component_id`),
  KEY `fk_audit_component_project` (`audit_project_id`),
  CONSTRAINT `fk_audit_component_project` FOREIGN KEY (`audit_project_id`) REFERENCES `audit_cetp_projects` (`audit_project_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_project_components`
--

LOCK TABLES `audit_project_components` WRITE;
/*!40000 ALTER TABLE `audit_project_components` DISABLE KEYS */;
INSERT INTO `audit_project_components` VALUES (1,1,'13','14','15',16.00,'17'),(2,2,'4','6','5.00',1.80,'4'),(3,2,'OHT','No','515.00',1.90,'0'),(4,2,'Work Component','Technology','214.00',1.20,'6'),(5,3,'1','3','2.00',9.00,'0'),(6,3,'Collection and conveyance system','Pumping','4.00',0.00,'0'),(7,3,'Common chrome recovery unit','MGO Dosing','0.50',0.00,'0'),(8,3,'Composite  Stream','SBR','2.80',0.00,'0'),(9,3,'over head tank','OHT','1200.00',0.00,'0'),(10,3,'Soak Stream','SBR','1.20',0.00,'0'),(11,4,'C & C','Gravity & Pumping','25.00',0.00,'0'),(12,4,'CCRU','Precipitation','900.00',0.00,'0'),(13,4,'CETP','Activated sludge plant','20.00',0.00,'0'),(14,4,'ZLD','UF+RO','900.00',0.00,'0'),(15,6,'13','14','15',16.00,'17'),(16,7,'4','6','5.00',1.80,'4'),(17,7,'OHT','No','515.00',1.90,'0'),(18,7,'Work Component','Technology','214.00',1.20,'6'),(19,8,'1','3','2.00',9.00,'0'),(20,8,'Collection and conveyance system','Pumping','4.00',0.00,'0'),(21,8,'Common chrome recovery unit','MGO Dosing','0.50',0.00,'0'),(22,8,'Composite  Stream','SBR','2.80',0.00,'0'),(23,8,'over head tank','OHT','1200.00',0.00,'0'),(24,8,'Soak Stream','SBR','1.20',0.00,'0'),(25,9,'C & C','Gravity & Pumping','25.00',0.00,'0'),(26,9,'CCRU','Precipitation','900.00',0.00,'0'),(27,9,'CETP','Activated sludge plant','20.00',0.00,'0'),(28,9,'ZLD','UF+RO','900.00',0.00,'0');
/*!40000 ALTER TABLE `audit_project_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'audit_status_of_cetp_up'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:55:34
CREATE DATABASE  IF NOT EXISTS `status_of_cetp_up` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `status_of_cetp_up`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: status_of_cetp_up
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
-- Table structure for table `cetp_projects`
--

DROP TABLE IF EXISTS `cetp_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cetp_projects` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `project_name` varchar(500) NOT NULL,
  `nodal_agency_id` int NOT NULL,
  `executive_agency` varchar(500) DEFAULT NULL,
  `contractor_name` varchar(500) DEFAULT NULL,
  `sanction_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `completion_date` date DEFAULT NULL,
  `sanction_cost_cr` decimal(12,2) DEFAULT NULL,
  `agreement_cost_cr` decimal(12,2) DEFAULT NULL,
  `physical_progress` decimal(10,2) DEFAULT NULL,
  `financial_progress` decimal(12,2) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `remarks` text,
  `scrape_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_id`),
  KEY `fk_project_nodal_agency` (`nodal_agency_id`),
  CONSTRAINT `fk_project_nodal_agency` FOREIGN KEY (`nodal_agency_id`) REFERENCES `nodal_agencies` (`nodal_agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cetp_projects`
--

LOCK TABLES `cetp_projects` WRITE;
/*!40000 ALTER TABLE `cetp_projects` DISABLE KEYS */;
INSERT INTO `cetp_projects` VALUES (1,'2',1,'4','5',NULL,NULL,NULL,9.00,10.00,11.00,12.00,NULL,'19','2026-06-11 09:24:31'),(2,'Construction of 7.5 MLD CETP at GIDA, Gorakhpur',2,'M/S GIDA CETP Foundation','--','2022-01-11',NULL,NULL,93.52,0.00,2.40,2.50,'2025-08-29','4 MLD CETP DPR Preparation complete.','2026-06-11 09:24:31'),(3,'Upgrdation of 4.5 MLD CETP at Banther , Unnao',2,'Banther Industrial Pollution Control company','M/S EMS infracon','2020-02-21','2022-02-07','2025-07-31',108.96,111.96,10.00,11.00,'2025-08-29','Work Under Progress','2026-06-11 09:24:31'),(4,'Construction of 20 MLD CETP at Jajmau Kanpur',2,'Jajamau Tanners and effluent treatment','Va Tech Wabag','2019-02-11','2019-04-11','2024-04-01',617.00,520.14,94.00,353.00,NULL,'CETP is operational and complaint. 151 tanneries have been connected to piping network out of total 340 tanneries.All 340 tannery connnection targeted to be completed by August 25','2026-06-11 09:24:31'),(5,'Upgradation of 2.15 MLD CETP to 2.15 MLD CETP at Unnnao',2,'Unnao Tanners and pollution control company','M/s JV UTIPL-Oasis-SIMA','2022-06-26',NULL,NULL,127.00,172.00,0.00,0.00,NULL,'Agreement signing pending at level of SPV. In compliance of NMCG instructions SMCG -UP vide its letter dated 19/06/2025 has written to DM Unnao and MS UPPSB for doing necessary actions for agreement signing including action against defaulting tanneries.','2026-06-11 09:24:31');
/*!40000 ALTER TABLE `cetp_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodal_agencies`
--

DROP TABLE IF EXISTS `nodal_agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nodal_agencies` (
  `nodal_agency_id` int NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(255) NOT NULL,
  PRIMARY KEY (`nodal_agency_id`),
  UNIQUE KEY `agency_name` (`agency_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodal_agencies`
--

LOCK TABLES `nodal_agencies` WRITE;
/*!40000 ALTER TABLE `nodal_agencies` DISABLE KEYS */;
INSERT INTO `nodal_agencies` VALUES (1,'3'),(2,'NMCG');
/*!40000 ALTER TABLE `nodal_agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_components`
--

DROP TABLE IF EXISTS `project_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_components` (
  `component_id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `work_component` varchar(500) DEFAULT NULL,
  `technology` varchar(500) DEFAULT NULL,
  `capacity_length_no` varchar(100) DEFAULT NULL,
  `physical_progress` decimal(10,2) DEFAULT NULL,
  `photos` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`component_id`),
  KEY `fk_component_project` (`project_id`),
  CONSTRAINT `fk_component_project` FOREIGN KEY (`project_id`) REFERENCES `cetp_projects` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_components`
--

LOCK TABLES `project_components` WRITE;
/*!40000 ALTER TABLE `project_components` DISABLE KEYS */;
INSERT INTO `project_components` VALUES (1,1,'13','14','15',16.00,'17'),(2,2,'4','6','5.00',1.80,'4'),(3,2,'OHT','No','515.00',1.90,'0'),(4,2,'Work Component','Technology','214.00',1.20,'6'),(5,3,'1','3','2.00',9.00,'0'),(6,3,'Collection and conveyance system','Pumping','4.00',0.00,'0'),(7,3,'Common chrome recovery unit','MGO Dosing','0.50',0.00,'0'),(8,3,'Composite  Stream','SBR','2.80',0.00,'0'),(9,3,'over head tank','OHT','1200.00',0.00,'0'),(10,3,'Soak Stream','SBR','1.20',0.00,'0'),(11,4,'C & C','Gravity & Pumping','25.00',0.00,'0'),(12,4,'CCRU','Precipitation','900.00',0.00,'0'),(13,4,'CETP','Activated sludge plant','20.00',0.00,'0'),(14,4,'ZLD','UF+RO','900.00',0.00,'0');
/*!40000 ALTER TABLE `project_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'status_of_cetp_up'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:55:34
