CREATE DATABASE  IF NOT EXISTS `audit_weekly_progress_of_namami_gange_undertendering_projects` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `audit_weekly_progress_of_namami_gange_undertendering_projects`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: audit_weekly_progress_of_namami_gange_undertendering_projects
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
-- Table structure for table `audit_cities`
--

DROP TABLE IF EXISTS `audit_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_cities` (
  `audit_city_id` int NOT NULL AUTO_INCREMENT,
  `audit_district_id` int DEFAULT NULL,
  `city_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`audit_city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_cities`
--

LOCK TABLES `audit_cities` WRITE;
/*!40000 ALTER TABLE `audit_cities` DISABLE KEYS */;
INSERT INTO `audit_cities` VALUES (1,1,'Aligarh'),(2,2,'nan'),(3,3,'Lucknow'),(4,4,'nan'),(5,5,'Bhadohi'),(6,6,'nan');
/*!40000 ALTER TABLE `audit_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_districts`
--

DROP TABLE IF EXISTS `audit_districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_districts` (
  `audit_district_id` int NOT NULL AUTO_INCREMENT,
  `district_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`audit_district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_districts`
--

LOCK TABLES `audit_districts` WRITE;
/*!40000 ALTER TABLE `audit_districts` DISABLE KEYS */;
INSERT INTO `audit_districts` VALUES (1,'AligarhUUUUUU'),(2,'Chandauli'),(3,'Lucknow'),(4,'Moradabad'),(5,'Sant Ravidas Nagar'),(6,'Varanasi');
/*!40000 ALTER TABLE `audit_districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_undertendering_projects`
--

DROP TABLE IF EXISTS `audit_undertendering_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_undertendering_projects` (
  `audit_project_id` int NOT NULL AUTO_INCREMENT,
  `sr_no` int DEFAULT NULL,
  `audit_district_id` int DEFAULT NULL,
  `audit_city_id` int DEFAULT NULL,
  `project_name` text,
  `scheme_type` varchar(100) DEFAULT NULL,
  `project_mode` varchar(100) DEFAULT NULL,
  `sanction_date` date DEFAULT NULL,
  `sanction_cost` decimal(12,2) DEFAULT NULL,
  `work_cost` decimal(12,2) DEFAULT NULL,
  `centage` decimal(12,2) DEFAULT NULL,
  `om_cost` decimal(12,2) DEFAULT NULL,
  `stp_count` int DEFAULT NULL,
  `stp_capacity` decimal(12,2) DEFAULT NULL,
  `drain_count` int DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `remarks` longtext,
  `snapshot_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`audit_project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_undertendering_projects`
--

LOCK TABLES `audit_undertendering_projects` WRITE;
/*!40000 ALTER TABLE `audit_undertendering_projects` DISABLE KEYS */;
INSERT INTO `audit_undertendering_projects` VALUES (1,1,1,1,'Aligarh Sewerage Scheme (I&D And STP Works)','NGP2-NON EAP','HAM','2024-10-21',496.02,240.02,15.12,240.88,2,113.00,2,'2026-06-16','NOC has been received from NMCG regarding retendering on dt. 21.01.2026 | Draft Tender document has been sent to NMCG for review on dt. 11.02.2026 | Approval on the Draft Tender document has been received from to NMCG on dt. 10.04.2026 | NIT has been published on E-Tender portal on dt. 10.04.2026 | Last date of bid submission is 25.05.2026 | Prebid meeting has been done on 20.04.2026. | prebid query reply has been sent to NMCG on dt 18-05-2026, which is under review. | Last date for bid submission has been extended upto 24-06-2026,as per NMCG instructions. | Approved prebid-reply uploaded on e-tender portal on dated 09-06-2026','2026-06-16 12:16:10'),(2,2,2,2,'I&D and STP works at Pt Deen Dayal Upadhyay Nagar Chandauli','NGP2-NON EAP','HAM','2025-01-22',262.78,95.00,7.60,129.67,1,45.00,2,'2026-05-26','Pre-bid reply sent to NMCG for approval on 14.08.2025 after approval from CE(Ganga) and SMCG | Pre-bid meeting held on 09.07.2025 | Bids will be opened on 19.08.2025 | Draft Pre-bid reply sent to CE(Ganga) on 04.08.2025 | Approved RFP Documents received from NMCG on 18.06.2025. NIT Shall be issued on 21.06.2025 | Date for bid opening extended upto 04.09.2025 | Date of bid opening is 07.10.2025 | AAE&S issued on 22.01.2025 | Revised model RFP Document received from NMCG on 06.05.2025, RFP sent to NMCG on 23.05.2025 for approval | Financial bids opened on 07.01.2026. CBER sent to NMCG on 03.02.2026 for approval | Approval of CBER received from NMCG on 20.02.2026 and communicated by CE(Ganga) on 23.02.2026 | M/s Enviro Infra Engineers Limited has been selected as L1 bidder | LOA issued on 25.02.2026 | Bidder vide its letter  03.03.3036 has requested to waive off the APS imposed for which guidance has been sought from HQ | Letter written to NMCG on 19.05.2026 to take decision about the APS imposed | NIT issued on 21.06.2025. Tender also published on e-Tender portal on 24.06.2025 | Bids opened on 07.10.2025. Technical evaluation in process','2026-06-16 12:16:10'),(3,3,3,3,'Pollution Abatement of Gomti River (Phase-II, Part-II ) Lucknow','NGP','HAM','2023-09-19',351.03,207.99,13.14,129.90,1,100.00,1,'2026-06-15','Concessionaire Agreement has been signed on dt. 26.08.2025. Financial closure is in progress.','2026-06-16 12:16:10'),(4,4,4,4,'Prevention of Pollution of River Ramganga at Moradabad  under zone-3 & 4 construction of Interception & Diversion (I&D) of Drains and Sewerage Treatment Plant','NMCG','HAM','2025-05-02',420.41,238.53,14.14,181.87,2,80.00,5,'2026-04-21','DPR for interception and diversion works of 5 Untapped drains of Moradabad Zone 3 & Zone 4 along with 2 STP (15 MLD & 65 MLD) works is sanctioned by NMCG New Delhi on dated 02-05-2025 | Tender document of Zone 3 & 4 has been sent to NMCG on dated 30.06.2025 | All Documents Related to tendering has been send to NMCG by email on dated 02-08-2025 | A Query was  raised by NMCG regarding BOD value of Karula drain. therefore combined sampling by U.P.J.N Team & UPPCB Team has been done on date 04-10-2025. Results are Awaited. | The Moradabad Municipal Corporation is to provide land for the construction of the STP in Zone 4, but it has not yet been purchased/made available. Continuous requests are being made to the Moradabad Municipal Corporation regarding this matter. | The reply of the queries received in the pre-bid meeting of the e-tender invited for construction of STPs in Zone-3 and Zone-4 under Namami Gange Programme were sent to NMCG by email on 03.02.2026, which have been approved by NMCG vide letter no. Pr 22012/5/2025 NMCG dated 03.03.2026. | which have been publish on e-tender portal vide letter no. 138/nivida/10 dt 06.03.2026.. The proposed last date for uploading and opening the bids of the said invited e-tender is 15.04.2026. | The said e-tender was opened in this office on 15.04.2026 at 16.00 hrs. The technical evaluation of the bids received in the e-tender is in progress.','2026-06-16 12:16:10'),(5,5,5,5,'Interception and Diversion of Drains/Nala Falling in Varuna River and STP for Bhadohi Town','NGP2-NON EAP','DBOT','2025-03-06',127.26,52.86,4.23,54.69,3,25.00,3,'2026-05-26','AAE&S issued on 06.03.2025 | draft Tender Documents sent to NMCG for approval on 10.06.2025. Approval awaited | Comments on draft documents are received from NMCG to which compliance shall be sent by 17.07.2025 | NIT issued on 31.07.2025 | Bids will be opened on 10.09.2025 | Pre Bid meeting scheduled on 18.08.2025 | Pre-bid meeting held on 18.08.2025. Reply to queries shall be sent by 24.08.2025 | Reply to query sent to CE(Ganga) on 24.08.2025 and after discussion sent to NMCG on 01.09.2025 | Bids will be opened on 09.10.2025 | Financial bids opened on 05.01.2026. CBER sent to NMCG on 03.02.2026 for approval | LOA issued on 12.05.2026 | Bids opened on 09.10.2025. technical evaluation in process','2026-06-16 12:16:10'),(6,6,6,6,'I&D and STP works for Durga Drain (Sewerage District-IV), Varanasi','NGP2-NON EAP','HAM','2025-03-06',274.31,107.70,8.61,97.50,1,60.00,1,'2026-05-26','RFP invited on 27.06.2025 and bids shall be opened on 12.08.2025 | Pre bid meeting held on 15.07.2025 | Pre-bid reply sent to NMCG on 18.08.2025 after discussion with CE(Ganga) and SMCG | Bid submission date extended upto 27.08.2025 | Bid submission extended upto 12.09.2025 | Bids will be opened on 07.10.2025 | Bids opened on 07.10.2025. technical evaluation in process | Financial bids opened on 07.01.2026. CBER sent to NMCG on 03.02.2026 for approval | Approval of CBER received from NMCG on 18.02.2026 and communicated by CE(Ganga) on 20.02.2026 | M/s Enviro Infra Engineers Limited has been selected as L1 bidder | AAE&S issued on 06.03.2025 | Revised Draft RFP Document received from NMCG on 06.05.2025, RFP shall be sent to NMCG by 29.05.2025 for approval | Daft RFP documents were sent to NMCG on which comments were received on 18.06.2025. Compliance/clarifications sent on 19.06.2025 | Final approved RFP documents received from NMCG on 23.06.2025. RFP shall be floated by 27.06.2025 | Bidder vide its letter  03.03.3036 has requested to waive off the APS imposed for which guidance has been sought from HQ | Letter written to NMCG on 19.05.2026 to take decision about the APS imposed','2026-06-16 12:16:10');
/*!40000 ALTER TABLE `audit_undertendering_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:00
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:00
CREATE DATABASE  IF NOT EXISTS `jjm_ongoing_projects_audit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jjm_ongoing_projects_audit`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jjm_ongoing_projects_audit
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
-- Table structure for table `audit_agencies`
--

DROP TABLE IF EXISTS `audit_agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_agencies` (
  `audit_agency_id` int NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(255) NOT NULL,
  PRIMARY KEY (`audit_agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_agencies`
--

LOCK TABLES `audit_agencies` WRITE;
/*!40000 ALTER TABLE `audit_agencies` DISABLE KEYS */;
INSERT INTO `audit_agencies` VALUES (1,'M/s 21st Century Enviro Engineers Pvt. Ltd. -M/s Sattva Engineering Const. Ltd. JV'),(2,'M/s Aastha Enviro Engineers Pvt Ltd'),(3,'M/s AWWMPL  Pvt Ltd'),(4,'M/s EIEL Mathura Infra Engineers Private Limited'),(5,'M/s Enviro Infra Engineers Ltd, Bhugan Infracon Pvt. Ltd. & Micro Transmission System, JV'),(6,'M/s HNB Private ltd. - M/s Tirupati Cements Products (JV)'),(7,'M/s JWIL-SSG (Joint Venture)'),(8,'M/s Neercare India pvt KLtd JV M/s EMIT Group India Pvt Ltd JV EMS Ltd'),(9,'M/s R K Engineers Sales Ltd'),(10,'M/s R.K. Engineers Sales Ltd.-M/s Anand Constrwell Pvt. Ldt. (JV)'),(11,'M/s R.K. Engineers- Khilari Infrastructure (JV)'),(12,'M/s Shailesh Kumar J.V.'),(13,'M/s SIMA -G D- N.P. (JV)'),(14,'M/s SKC Technocrat Pvt. Ltd (Formerly M/s Satish Kumar & Co.) & M/s Malvika Technical Services (JV)'),(15,'M/s SKC Technocrat Pvt. Ltd (Formerly M/s Satish Kumar & Co.) & M/s. Geo Miller & Co. Pvt. Ltd. (JV)'),(16,'M/s Technocraft Ventures Limited'),(17,'M/s Triveni Engineering and Industries'),(18,'M/s. Meerut STP Pvt. Ltd.');
/*!40000 ALTER TABLE `audit_agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_cities`
--

DROP TABLE IF EXISTS `audit_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_cities` (
  `audit_city_id` int NOT NULL AUTO_INCREMENT,
  `audit_district_id` int NOT NULL,
  `city_name` varchar(255) NOT NULL,
  PRIMARY KEY (`audit_city_id`),
  KEY `audit_district_id` (`audit_district_id`),
  CONSTRAINT `audit_cities_ibfk_1` FOREIGN KEY (`audit_district_id`) REFERENCES `audit_districts` (`audit_district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_cities`
--

LOCK TABLES `audit_cities` WRITE;
/*!40000 ALTER TABLE `audit_cities` DISABLE KEYS */;
INSERT INTO `audit_cities` VALUES (1,1,'Agra'),(2,7,'Chhata'),(3,7,'Kosi Kalan'),(4,7,'Mathura'),(5,7,'Vrindavan'),(6,13,'Banat'),(7,13,'Bantikhera Banat'),(8,13,'Shamli'),(9,13,'Thanabhawan'),(10,12,'Saharanpur'),(11,3,'Hapur'),(12,4,'Hathras'),(13,8,'Meerut'),(14,10,'Prayagraj'),(15,6,'Lucknow');
/*!40000 ALTER TABLE `audit_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_districts`
--

DROP TABLE IF EXISTS `audit_districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_districts` (
  `audit_district_id` int NOT NULL AUTO_INCREMENT,
  `district_name` varchar(255) NOT NULL,
  PRIMARY KEY (`audit_district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_districts`
--

LOCK TABLES `audit_districts` WRITE;
/*!40000 ALTER TABLE `audit_districts` DISABLE KEYS */;
INSERT INTO `audit_districts` VALUES (1,'Agra'),(2,'Bulandshahr'),(3,'Hapur'),(4,'Hathras'),(5,'Kanpur Nagar'),(6,'Lucknow'),(7,'Mathura'),(8,'Meerut'),(9,'Pratapgarh'),(10,'PrayagRaj'),(11,'Rae Bareli'),(12,'Saharanpur'),(13,'Shamli');
/*!40000 ALTER TABLE `audit_districts` ENABLE KEYS */;
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
  `work_component` text,
  `component_count` int DEFAULT NULL,
  `capacity_length_no` varchar(255) DEFAULT NULL,
  `physical_progress` decimal(10,2) DEFAULT NULL,
  `photos` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`audit_component_id`),
  KEY `audit_project_id` (`audit_project_id`),
  CONSTRAINT `audit_project_components_ibfk_1` FOREIGN KEY (`audit_project_id`) REFERENCES `audit_sewerage_projects` (`audit_project_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_project_components`
--

LOCK TABLES `audit_project_components` WRITE;
/*!40000 ALTER TABLE `audit_project_components` DISABLE KEYS */;
INSERT INTO `audit_project_components` VALUES (1,1,'Effluent Disposal Line (km.)',2,'2.01',92.50,'12'),(2,1,'Intercepting Sewer (km)',3,'1.94',82.00,'4'),(3,1,'Interception And Diversion',1,'22.00',0.00,'0'),(4,1,'MPS (MLD)',3,'373.50',82.67,'45'),(5,1,'Rising main (mtr.)',3,'8970.00',76.67,'26'),(6,1,'STP (MLD)',13,'177.60',26.25,'88'),(7,2,'Interception And Diversion',1,'40.00',0.00,'0'),(8,3,'Ancilliary works(Admin building,staff quarter ,roa',1,'1.00',22.30,'4'),(9,3,'I/C Sewer line (Mtr.)',1,'2170.00',27.00,'0'),(10,3,'Interception And Diversion',1,'11.00',0.00,'0'),(11,3,'MPS (MLD)',1,'6.00',40.00,'14'),(12,3,'Rising Main (Meter)',1,'5500.00',0.00,'0'),(13,3,'STP (MLD)',1,'6.00',15.50,'8'),(14,4,'FSTP(KLD)',1,'8.00',3.90,'4'),(15,5,'Admin Building',1,'1.00',0.00,'0'),(16,5,'Boundary wall, staff quarter',1,'1.00',0.00,'0'),(17,5,'Cesspool Vehicle',1,'3.00',0.00,'0'),(18,5,'FSTP(KLD)',1,'15.00',28.00,'4'),(19,5,'Solar Power (kw)',1,'35.00',0.00,'0'),(20,6,'Boundary wall',1,'286.00',10.00,'0'),(21,6,'Interception And Diversion',1,'1.00',0.00,'0'),(22,6,'MPS (MLD)',1,'15.00',0.00,'0'),(23,6,'Others',1,'1.00',0.00,'0'),(24,6,'STP (MLD)',1,'10.00',3.00,'0'),(25,7,'Ancilliary works(Admin building,staff quarter ,roa',1,'1.00',96.00,'11'),(26,7,'Interception And Diversion',1,'2.00',97.00,'0'),(27,7,'MPS (MLD)',1,'6.00',88.00,'8'),(28,7,'Online Monitoring/LCS/MCS for proposed STPs and Ex',1,'1.00',0.00,'0'),(29,7,'Rising main (mtr.)',1,'3700.00',99.00,'0'),(30,7,'STP (MLD)',1,'13.00',98.00,'33'),(31,7,'Treated water sump and associated works',1,'1.00',99.00,'0'),(32,7,'Upgradation of MPS',1,'1.00',62.00,'0'),(33,8,'Co-treatment Unit for Fecal Sludge (KLD)',1,'5.00',3.00,'0'),(34,8,'Effluent Disposal Line (km.)',1,'0.60',65.00,'0'),(35,8,'Interception And Diversion',1,'2.00',55.00,'0'),(36,8,'MPS (MLD)',1,'6.00',85.90,'8'),(37,8,'Power Connection',1,'1.00',0.00,'0'),(38,8,'Rising main (mtr.)',1,'50.00',0.00,'0'),(39,8,'Sewer Line (km.)',1,'0.60',65.00,'0'),(40,8,'STP (MLD)',1,'5.00',61.20,'24'),(41,9,'Co-treatment Unit for Fecal Sludge (KLD)',1,'5.00',3.00,'0'),(42,9,'Effluent Disposal Line (km.)',1,'0.40',0.00,'0'),(43,9,'Interception And Diversion',1,'4.00',0.00,'0'),(44,9,'MPS (MLD)',1,'6.00',0.00,'0'),(45,9,'Power Connection',1,'1.00',0.00,'0'),(46,9,'Rising main (mtr.)',1,'50.00',0.00,'0'),(47,9,'Sewer Line (km.)',1,'2.00',0.00,'0'),(48,9,'STP (MLD)',1,'5.00',24.00,'13'),(49,10,'MPS (MLD)',1,'28.00',0.00,'0'),(50,10,'Power Connection',1,'1.00',0.00,'0'),(51,10,'Rising main (mtr.)',1,'50.00',0.00,'0'),(52,10,'Sewer Line (km.)',1,'3.83',0.00,'0'),(53,10,'STP (MLD)',1,'20.00',0.00,'4'),(54,11,'Co-treatment Unit for Fecal Sludge (KLD)',1,'20.00',3.00,'0'),(55,11,'Effluent Disposal Line (km.)',1,'0.10',0.00,'0'),(56,11,'Interception And Diversion',1,'1.00',95.00,'9'),(57,11,'MPS (MLD)',1,'48.00',60.90,'8'),(58,11,'Power Connection',1,'1.00',0.00,'0'),(59,11,'Rising main (mtr.)',1,'100.00',0.00,'7'),(60,11,'Sewer Line (km.)',1,'0.10',0.00,'0'),(61,11,'STP (MLD)',1,'40.00',68.92,'21'),(62,12,'Co-treatment Unit for Fecal Sludge (KLD)',1,'10.00',3.00,'0'),(63,12,'Interception And Diversion',1,'3.00',35.00,'4'),(64,12,'MPS (MLD)',1,'13.00',44.70,'4'),(65,12,'Power Connection',1,'1.00',0.00,'0'),(66,12,'Rising main (mtr.)',1,'60.00',0.00,'0'),(67,12,'Sewer Line (km.)',1,'5.60',7.00,'0'),(68,12,'STP (MLD)',1,'10.00',54.90,'18'),(69,13,'Drains',1,'1.00',5.00,'0'),(70,13,'MPS (MLD)',1,'8.00',60.00,'12'),(71,13,'Others',1,'1.00',30.00,'8'),(72,13,'STP (MLD)',1,'6.00',50.00,'12'),(73,14,'Admin Building',1,'1.00',45.00,'4'),(74,14,'Boundary wall (mtr.)',1,'800.00',0.00,'0'),(75,14,'Intercepting Sewer (km)',1,'5.67',33.10,'4'),(76,14,'MPS (MLD)',1,'54.00',77.00,'8'),(77,14,'Nala Tapping Arrangement ( No.)',1,'8.00',0.00,'0'),(78,14,'Rising main (mtr.)',1,'0.13',36.50,'0'),(79,14,'Staff Quarter type 2',1,'1.00',0.00,'0'),(80,14,'STP (MLD)',1,'24.00',72.00,'16'),(81,15,'Ancilliary works(Admin building,staff quarter ,roa',1,'1.00',31.05,'7'),(82,15,'Intercepting Sewer (km)',1,'0.03',0.00,'0'),(83,15,'MPS (MLD)',1,'12.00',37.05,'4'),(84,15,'Nala Tapping Arrangement ( No.)',1,'1.00',0.00,'0'),(85,15,'Rising main (mtr.)',1,'100.00',0.00,'0'),(86,15,'STP (MLD)',1,'12.00',51.95,'16'),(87,16,'Interception And Diversion',1,'2.00',50.70,'0'),(88,16,'MPS',1,'1.00',80.60,'6'),(89,16,'Power Connection',1,'1.00',0.00,'0'),(90,16,'Rising main (mtr.)',1,'100.00',0.00,'0'),(91,16,'Sewer Line (km.)',1,'5.60',10.00,'0'),(92,16,'STP (MLD)',1,'220.00',55.70,'47'),(93,17,'Effluent Disposal Line (km.)',1,'0.10',4.00,'0'),(94,17,'Interception And Diversion',1,'61.00',4.00,'0'),(95,17,'MPS (MLD)',1,'172.30',4.00,'0'),(96,17,'Power Connection',1,'1.00',4.00,'0'),(97,17,'Rising main (mtr.)',1,'50.00',4.00,'0'),(98,17,'Sewer Line (km.)',1,'16.00',4.00,'4'),(99,17,'STP (MLD)',1,'135.00',33.60,'0'),(100,18,'Construction of SPS and Lift Station (Nos)',1,'7.00',0.00,'0'),(101,18,'Interception and Diversion Work of Drains (Nos)',1,'14.00',0.00,'0'),(102,18,'Laying of Diversion Sewer (meter)',1,'2515.00',0.00,'0'),(103,18,'Laying of Rising main (meter)',1,'11253.00',6.56,'0'),(104,18,'Miscellaneous Works',1,'1.00',0.00,'0'),(105,19,'Effluent Disposal Line (km.)',1,'0.30',85.00,'16'),(106,19,'Effluent Pumping Station (MLD)',1,'43.00',100.00,'28'),(107,19,'Interception And Diversion',1,'13.00',70.00,'8'),(108,19,'IPS (MLD)',1,'2.20',68.00,'21'),(109,19,'MPS (MLD)',1,'32.00',72.00,'16'),(110,19,'Rehabilitation of Sewer Line',1,'3.30',0.00,'0'),(111,19,'Rising main (mtr.)',1,'4070.00',94.00,'20'),(112,19,'Sewer Line (km.)',1,'2.16',94.00,'8'),(113,19,'STP (MLD)',1,'43.00',99.00,'105'),(114,20,'Effluent Disposal Line (km.)',1,'0.30',73.00,'8'),(115,20,'Effluent Pumping Station (MLD)',1,'90.00',73.00,'4'),(116,20,'Interception And Diversion',1,'7.00',80.00,'42'),(117,20,'MPS (MLD)',2,'95.00',71.50,'103'),(118,20,'Rehabilitation of Bund and Bund Road',1,'1.00',37.00,'0'),(119,20,'Rising main (mtr.)',1,'3450.00',88.00,'9'),(120,20,'Sewer Line (km.)',1,'4.20',88.00,'23'),(121,20,'STP (MLD)',1,'90.00',81.00,'114'),(122,21,'Co-treatment Unit for Fecal Sludge (KLD)',1,'20.00',0.00,'0'),(123,21,'Interception And Diversion',1,'2.00',84.00,'24'),(124,21,'IPS (MLD)',1,'2.90',67.50,'85'),(125,21,'Rising main (mtr.)',1,'100.00',25.00,'0'),(126,21,'Sewer Line (km.)',1,'0.06',86.00,'0'),(127,21,'STP (MLD)',1,'50.00',68.00,'211'),(128,22,'I/C Sewer line (Mtr.)',1,'1970.00',97.06,'4'),(129,22,'Interception And Diversion',1,'4.00',68.15,'4'),(130,22,'IPS (MLD)',2,'47.00',69.13,'13'),(131,22,'MPS (MLD)',1,'60.00',100.00,'8'),(132,22,'Rising main (mtr.)',1,'9290.00',97.44,'8'),(133,22,'STP (MLD)',1,'60.00',81.84,'14'),(134,23,'Interception And Diversion',1,'1.00',3.00,'0'),(135,23,'MPS',1,'3.50',46.50,'0'),(136,23,'STP (MLD)',2,'42.50',87.85,'59'),(137,23,'Uppgradation of SPS',3,'3.00',100.00,'0'),(138,24,'Interception And Diversion',1,'3.00',14.58,'0'),(139,24,'Rising main (mtr.)',1,'3500.00',57.12,'0'),(140,24,'SPS (MLD)',1,'22.60',3.69,'0'),(141,24,'STP (MLD)',1,'50.00',22.57,'41');
/*!40000 ALTER TABLE `audit_project_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_sewerage_projects`
--

DROP TABLE IF EXISTS `audit_sewerage_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_sewerage_projects` (
  `audit_project_id` int NOT NULL AUTO_INCREMENT,
  `sr_no` int DEFAULT NULL,
  `audit_district_id` int DEFAULT NULL,
  `audit_city_id` int DEFAULT NULL,
  `audit_agency_id` int DEFAULT NULL,
  `project_name` text,
  `scheme_type` varchar(255) DEFAULT NULL,
  `project_mode` varchar(255) DEFAULT NULL,
  `sanction_date` date DEFAULT NULL,
  `sanction_cost` decimal(15,2) DEFAULT NULL,
  `work_cost` decimal(15,2) DEFAULT NULL,
  `centage` decimal(15,2) DEFAULT NULL,
  `om_cost` decimal(15,2) DEFAULT NULL,
  `stp_count` int DEFAULT NULL,
  `stp_capacity` decimal(15,2) DEFAULT NULL,
  `drain_count` int DEFAULT NULL,
  `agreement_cost` decimal(15,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `agreement_completion_date` date DEFAULT NULL,
  `revised_date` varchar(255) DEFAULT NULL,
  `physical_progress` varchar(255) DEFAULT NULL,
  `financial_progress` varchar(255) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `remarks` text,
  `reason_for_delay` text,
  `action_taken` text,
  `tentative_inauguration_date` date DEFAULT NULL,
  `tentative_zero_discharge_date` date DEFAULT NULL,
  `scrape_time` datetime DEFAULT NULL,
  PRIMARY KEY (`audit_project_id`),
  KEY `audit_district_id` (`audit_district_id`),
  KEY `audit_city_id` (`audit_city_id`),
  KEY `audit_agency_id` (`audit_agency_id`),
  CONSTRAINT `audit_sewerage_projects_ibfk_1` FOREIGN KEY (`audit_district_id`) REFERENCES `audit_districts` (`audit_district_id`),
  CONSTRAINT `audit_sewerage_projects_ibfk_2` FOREIGN KEY (`audit_city_id`) REFERENCES `audit_cities` (`audit_city_id`),
  CONSTRAINT `audit_sewerage_projects_ibfk_3` FOREIGN KEY (`audit_agency_id`) REFERENCES `audit_agencies` (`audit_agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_sewerage_projects`
--

LOCK TABLES `audit_sewerage_projects` WRITE;
/*!40000 ALTER TABLE `audit_sewerage_projects` DISABLE KEYS */;
INSERT INTO `audit_sewerage_projects` VALUES (1,1,1,1,3,'Agra Sewerage Scheme( Interception & diversion and STP works)','NGP2-EAP','HAM','2020-05-06',842.25,371.29,25.40,445.56,13,177.60,26,582.84,'2023-04-05','2025-04-04','04-Apr-2025 31-Dec-2025','+0.00 83.01','+0.00 336.24','2026-06-08','Component wise progress of Agra (HAM) 100 MLD STP- 68%, WIP 35 MLD STP- 76.2, WIP 31 MLD STP- 76.48%, WIP MPS 03 Nos.- 73%, WIP Rising Main 9.55 Km- 55%%, WIP Gravity Sewer 2.55 Km- 80%, WIP DSTP 10 Nos.- 5%, WIP Note- 1st Stage permission is granted for 07 Nos. DSTP Forest Land and 2nd stage permission is under process As per pervious meeting discussion, In order to complete the remaining works of 31 MLD and 35 MLD STP and make them operational as per the prescribed timeline, Direction  has been given to firm to complete the works as early as possible by increasing manpower. As per pervious meeting discussion, In order to 07 Nos. DSTP forest clearance , Land Gazette notification meeting has been conducted on 02.05.2025 and soon gazette notification will be published and after that stage 2 permission will be applied','NOC of land for 7 Nos DSTP, Road cutting permission for laying of rising main ,','1st Stage Permission was granted from forest department and 2nd stage permission is under process. A request was made by District Magistrate proposal sent to Revenue  department UP Lucknow for 1 No. DSTP Indira Memorial.  In current laying of rising main and intercepting sewer line permission was granted by district administration and work is under progress. MPS Nagla Buri public hindrance was resolved work is under progress.','2026-11-01','2026-09-01','2026-06-17 14:58:56'),(2,2,1,NULL,NULL,'Balance Darins Tapping and Augmentation of SPSs at Agra City','NGP','DBOT','2025-06-11',126.41,86.37,6.90,34.01,0,0.00,0,66.86,'2026-04-02','2027-10-01','','+0.00 0.00','+0.00 0.00',NULL,'','','','2027-11-01','2027-10-31','2026-06-17 14:58:56'),(3,3,7,2,12,'Chhata Town Sewerage Scheme (I&D and STP works), District Mathura','NGP','DBOT','2022-10-25',56.15,34.52,2.23,19.40,1,6.00,14,48.97,'2024-11-12','2026-08-11','','+0.32 17.58','+0.00 2.69','2026-06-08','STP site is flooded due to overflow from Bahrauli branch drain, (situated near to the site) from 1 month. The current water level at STP site is higher to the HFL, provided by irrigation department. At this situation all works are heavily affected. Not only in present this kind of situation during monsoon will affect the operation and maintenance services in later too.\n            Due to the current scenario of site, we have sent a letter to SDM, Chhata, requesting a new land for \n           construction of STP in this project with all requisite details of the scenario of original project site. Construction of HTS and staff quarter building is in progress at MPS. Project is slightly delayed due to problem of water logging at STP Site as PWD, Mathura was constructing a culvert on Kosi Drain and due to diversion of drain the water of kosi drain got obstructed. The STP site is located near to the branch drain of kosi drain at upstream side which got over flowed and leading to water logging at STP Site.This hindrance cleared in march 2025 after that work was resumed. Date of Start 12.11.2024 has been given to the firm. Survey and soil investigation has completed by firm. BEP of STP has been approved. Boundary wall construction work is going on at site.','Project is slightly delayed due to problem of water logging at STP Site as PWD, Mathura was constructing a culvert on Kosi Drain and due to diversion of drain the water of kosi drain got obstructed. The STP site is located near to the branch drain of kosi drain at upstream side which got over flowed and leading to water logging at STP Site.','Communication has been done to PWD and Irrigation Department for the problem of water logging at site. Additionally firm has been instructed to take preventive measures and initiate the work. Now the Piling and associated work has been commenced at site for SBR basin.','2026-08-12','2026-08-12','2026-06-17 14:58:56'),(4,4,11,NULL,2,'DPR OF 08 KLD Fecal Sludge Treatment Plant At Dalmau Raibareli','NMCG','DBOT','2024-08-28',4.40,3.01,0.18,1.21,0,0.00,0,3.00,'2026-02-06','2026-11-05','','+0.15 3.90','+0.00 0.00','2026-06-09','Technical Bid open on dt. 22.08.2025. LOA issued to Firm M/s Aastha Enviro Engineers Pvt. Ltd. on dt. 30.12.2025. NOC received from NMCG  of FBER on dt. 19.12.2025 TBER sent to NMCG for review and approval. NOC received from NMCG on dt. 03.10.2025. Financial bid open on dt. 10.10.2025. Financial Evaluation work is in progress. FBER sent to NMCG for review and approval on dt. 01.12.2025. Date of start  given to Firm M/s Aastha Enviro Engineers Pvt. Ltd. on dt. 06.02.2026. Bid Document uploaded at e-tender portal on dt. 27.06.2025. Pre-bid Meeting dt. 04.07.2025 at 12:00 PM. Pre-bid reply sent to NMCG for review and approval on dt. 07.07.2025. Soil testing and Survey completed. Design & Drawing work is in progress. Boundary wall work is in progress. NMCG sent final pre-bid replies on dt. 05.08.2025. Final pre-bid replies uploaded on e-tender portal on dt. 07.08.2025 Bid Submission date 22.08.2025.','','','2026-12-05','2026-12-05','2026-06-17 14:58:56'),(5,5,9,NULL,2,'Faecal Sludge Management for Pollution abatement of river Ganga at Manikpur, Pratapgarh','Non EAP','DBOT','2025-01-22',8.56,5.73,0.19,1.90,0,0.00,0,4.62,'2026-02-05','2026-11-04','','+16.00 28.00','+0.00 0.00','2026-06-08','NMCG New Delhi has given approval for issuance of LOA to the L1 Firm  M/s Aastha LOA has been issued to firm on dated 23.12.2025 Date of start has been issued to firm on dated 04.02.2026. Date of start 05.02.2026 and Date of Completion 04.11.2026 Soil test has been done, Survey and site cleaning work is under progress. Construction of Boundary wall is under progress. Excavation and PCC work is under progress for various unit. Vetting of BEP, Design & Drawing is completed. Construction of staff quarter, admin building cum lab are under progress.','','','2026-11-04','2026-11-04','2026-06-17 14:58:56'),(6,6,2,NULL,14,'Gulaothi I&D works','NMCG','DBOT','2024-08-28',50.98,17.13,1.37,13.20,1,10.00,1,51.19,'2025-12-01','2027-05-31','','+0.00 9.00','+0.00 2.09','2026-06-09','AA&ES issued on Dt 28.08.2024 NIT issued by SE, Meerut vide letter no. 257/731/15 Dt 08.11.2024 LOA & Date of start is given on 26.11.2025.  Date of  start is 01.12.2025 & Date of completion of work is 31.05.2027 issued to M/s SKC Technocrat Private Limited- M/s Malvika Technical Services (JV), B-29, RDC, Raj Nagar, Ghaziabad- 201002 Soil Testing Complete. Boundary Wall work is in progress. BEP submitted by the firm on Dated 03.02.2026. Some Observation were found in the examination of BEP, after which BEP was returned to the firm on 08.02.2026. The land purchase proposal has been Sanctioned and GO issued. The funds Released to ULB Gulaothi. Land Registry work is completed. ULB handed over the land to U.P. Jal Nigam for work on Dated 20.12.2025. Mobilization Amount of Rs. 1.04 Crore claimed by firm. Revised BEP submitted by the firm.  BEP send to IIT BHU for vetting After checking it.','','-','2027-05-31','2027-05-31','2026-06-17 14:58:56'),(7,7,7,5,13,'I&D and 13 MLD STP works at Vrindavan City','NGP','DBOT','2022-10-25',77.70,39.90,2.56,35.24,1,13.00,2,65.86,'2024-06-11','2026-03-10','','+0.05 92.93','+0.00 35.24','2026-06-08','Kalideh MPS rising main works has been done. STP site is water logged from 10.08.2025, work is affected due to this STP site had been water logged from 10.08.2025 to 18.09.2025, due to the high flood of Yamuna. After receding of water construction work is in progress along with corrective works due to the damage by flood at site. Work is going in SBR basin,  CCT, Admin building, Pannel room, SHU and in MPS  units. LOA issued to firm on dated 15.03.2024. Effective Date of start for the work is 11.06.2024.Work is in progress.','Initially preliminary work at Site got hindered due to start of monsoon just after the date of start of the project. Firm has started the work after the monsoon  and currently the work is being going on almost on all fronts by the firm. The progress is being regularly expedited by firm to complete the work on scheduled date.','-','2026-03-11','2026-03-11','2026-06-17 14:58:56'),(8,8,13,6,9,'I&D and STP Work in Banat, Shamli','NGP','DBOT','2023-05-25',48.71,24.93,1.58,22.20,1,5.00,3,37.92,'2024-10-14','2026-04-13','','+0.05 73.20','+0.00 14.70','2026-06-08','Contract Agreement is signed on 08.10.2024 and Date of Start 14-10-2024 & Date of Completion 13-01-2026 Survey and Soil investigation work completed BEP, Layout and HFD approved for 05 MLD STP. Gate Schedule approved GAD, Structural design and drawing of CCT with Tonner Room & HT Substation approved GAD, Structural Design and Dwg. for SBR and Boundary wall approved. Approach Road and boundary wall work in progress GAD for Sludge Handling Unit Submitted, which are clear for Vetting & Structural Design. Project is 4 months behind schedule. Delay in design/drawing submission by Contractor. Contractor need to increase expedite the progress of work and submission of design/drawings. GAD, Structural Design and Dwg. for SHU approved GAD, Structural design and drawing of I&D Structure approved GAD and Data Sheet of Diffuser and decanter approved BEP, P&ID of MPS approved GAD, Structural design and drawing of PTU Structure approved GAD, Structural design and drawing of CCT, HT Substation Building and MPS which are clear for Vetting. Structural Design and Dwg. for MPS approved Data Sheet, QAP, Curves etc. of Turbo Blower, Centrifuge approved','Firm delayed submission of Design and drawing','Liquidity Damage (L.D.) imposed on firm for delay.','2026-04-24','2026-04-14','2026-06-17 14:58:56'),(9,9,13,7,9,'I&D and STP Work in Bantikhera and Babri village, Shamli','NGP','DBOT','2023-05-25',55.47,29.41,1.84,24.22,1,5.00,1,41.91,'2024-10-14','2026-04-13','','+0.05 15.55','+0.00 3.62','2026-06-08','GAD of SBR is Clear for Vetting and Structural design Date Sheet, QAP, Curves etc. of Turbo Blower, Centrifuge approved Gate Schedule approved GAD, Structural design & Dwg. of PTU approved Contract Agreement is signed on 08.10.2024 and Date of Start 14-10-2024 & Date of Completion 13-01-2026 Survey and Soil investigation work completed BEP, Layout and HFD approved for 05 MLD STP. Work halted due to unresolved land dispute. Project is 7 months behind schedule.','Due to land dispute','Letters has been written to the District Administration requesting their intervention to resolve the dispute with the nearby farmers.','2026-04-24','2026-04-14','2026-06-17 14:58:56'),(10,10,12,NULL,1,'I&D and STP Work in Deobandh','NGP','DBOT','2024-07-25',134.71,67.42,4.46,62.83,1,20.00,4,95.25,'2026-02-09','2027-07-08','','+0.00 0.00','+0.00 0.00','2026-06-08','Approval on Technical bid from NMCG recieved on 29.07.2025 Letter to lowest bidder regarding power consumption written on dated 14.08.2025 last date for reply is 20.08.2025 Reply received on dated 20.08.2025 NOC on pre- Bid Documents recieved 0n 18.12.2024 Technical Bid opened on 25.01.2025 Technical bid evaluation sheet and document send to NMCG on 28.04.2025 LOA issued to M/s 21st Century Enviro Engineers Pvt. Ltd. -M/s Sattva Engineering Const. Ltd. JV.  on dt. 14.11.2025 Financial bid send to NMCG on dated 04.09.2025 Approval recieved on 16.09.2025 AA&ES recieved on 25.07.2024. Construction activity has been stopped in compliance with the directions issued by the Superintending Engineer, Circle Office, Uttar Pradesh Jal Nigam (Rural), Saharanpur, vide letter no. 168/122 (Namami Gange)/44 dated 20.02.2026, due to an increase in drain discharge from 13.8 MLD to 20.36 MLD, with instructions to the firm not to commence construction activities. Draft pre-bid reply send to NMCG 24.11.2024 Pre-bid meeting held on 07.11.2024 Financial bid opened on 07-08-2025 and financial evaluation under process. Draft bid document and NIT sent to NMCG on 05.08.2024 for approval. Comments on draft Bid Documents recieved on 17.10.2024 NIT published on 24-10-2024','-','-','2027-11-08','2027-11-08','2026-06-17 14:58:56'),(11,11,13,8,10,'I&D and STP Work in Shamli','NGP','DBOT','2023-05-25',206.02,103.19,6.66,96.17,1,40.00,1,120.92,'2024-10-14','2026-04-13','','+0.05 77.95','+0.00 41.81','2026-06-08','Primary Clariflocculator GAD Submitted, which clear for Vetting & Structural Design. CCT GAD Submitted which clear for Vetting & Structural Design. BEP, P&ID, HFD of MPS approved Data Sheet, QAP, Curves etc. of Turbo Blower, Centrifuge approved Gate Schedule & Electrical load list approved GAD, Structural Design and Dwg. of CCT/Toner Room & Fiber Disk Filter approved GAD, Structural Design and Dwg. for MPS approved Contract Agreement is signed on 08.10.2024 and Date of Start 14-10-2024 & Date of Completion 13-01-2026 Approach Road and Boundary wall work in progress BEP, Layout and HFD approved for 40 MLD STP. GAD, Structural Design and Dwg. for SBR and Boundary wall approved. GAD for Admin Building and Sludge Handling and Dewatering Building Submitted, which clear for Vetting & Structural Design. CCT and I&D GAD Submitted, which clear for Vetting & Structural Design. Project is 4 months behind schedule. Delay in design/drawing submission by Contractor. Contractor need to increase expedite the progress of work and submission of design/drawings. GAD, Structural Design and Dwg. for SHU  approved GAD, Structural Design and Dwg. of I&D Structure approved GAD and Data sheet of Decanter and diffuser approved GAD, Structural Design and Dwg. for Admin. Building & Lab approved GAD, Structural Design and Dwg. of Staff Quarter approved','Firm delayed submission of\nDesign and drawing','Liquidity Damage (L.D.) imposed on firm for delay.','2026-04-24','2026-04-14','2026-06-17 14:58:56'),(12,12,13,9,9,'I&D and STP Work in Thanabhawan, Shamli','NGP','DBOT','2023-05-25',97.19,55.63,3.50,38.06,1,10.00,5,63.72,'2024-10-14','2026-04-13','','+0.05 68.15','+0.00 19.11','2026-06-08','GAD, Structural Design and Dwg. for SBR and Boundary wall approved. GAD for Sludge Handling Unit Submitted, which are clear for Vetting & Structural Design. CCT GAD were Submitted, which clear for Vetting & Structural Design. Boundary Wall work in progress Project is 4 months behind schedule. Delay in design/drawing submission by Contractor. Contractor need to increase expedite the progress of work and submission of design/drawings. GAD, Structural Design and Dwg. for SHU approved GAD and Data Sheet of Diffuser and decanter approved BEP, P&ID of MPS approved GAD of MPS submitted which is clear for vetting GAD, Structural Design and Dwg. for PTU and CCT  Submitted which are clear for Vetting Structural Design and Dwg. for MPS submitted which is clear for Vetting GAD of Fiber Disk filter submitted which is clear for vetting Data Sheet, QAP, Curves etc. of Turbo Blower, Centrifuge approved Gate Schedule & Electrical load list approved Structural Design and Dwg. of PTU, Fiber Disk Filter, I&D and Sewer Network approved Structural Design and Dwg. for MPS approved Structural Design and Dwg. for CCT with Tonner Room approved Contract Agreement is signed on 08.10.2024 and Date of Start 14-10-2024 & Date of Completion 13-01-2026 Survey and Soil investigation work completed Approach Road work in progress BEP, Layout and HFD approved for 10 MLD STP.','Firm delayed submission of Design and drawing','Liquidity Damage (L.D.) imposed on firm for delay.','2026-04-24','2026-04-14','2026-06-17 14:58:56'),(13,13,3,11,15,'I&D and STP works at District-Hapur','NGP','DBOT','2023-09-19',49.06,22.85,1.42,24.79,1,6.00,1,39.28,'2024-11-08','2026-02-07','','+0.00 48.00','+0.00 6.97','2026-06-09','Revised vetted BEP Civil/Mechanical GA & R/F of MPS, SHU and SBR has been submitted by the firm on Dt 25.10.2025 and approved by the Department except  Civil GA and R/F of SBR. SBR Civil work Completed, MPS & STP work is in progress. Date of start is given on 08.11.24. Date of completion of work is 05.02.2026 to M/s SKC Technocrat Pvt. Ltd (Formerly M/s Satish Kumar & Co.) & M/s. Geo Miller & Co. Pvt. Ltd. (JV), Reg. Office B-29, IIIrd Floor, RDC Rajnagar, Ghaziabad - 201013. AGREEMENT cost of project is Rs. 39,28,13,617.00. Land Issue Resolved in March 2025. The amount of mobilization advance has been claimed by the firm. BEP and GAD sent for vetting to IIT BHU VARANASI on 19.06.25 LD of Rs. 32.00 Lac has been imposed on firm for delay of work, as per contract agreement.','Firm delayed submission of Design and drawing.','LD has been imposed vide letter no- 422/790/33 Dt 22.09.2025 due to delay in approval of Design/Drawing.','2026-02-07','2026-06-07','2026-06-17 14:58:56'),(14,14,4,12,8,'I&D and STP works at Hathras Town','NGP','DBOT','2023-01-30',128.91,70.48,4.55,53.88,1,24.00,10,119.05,'2024-09-06','2026-06-05','','+2.79 52.00','+0.00 20.69','2026-06-08','Survey and soil investigation has been completed by firm Project was delayed as the land for STP was handed over in March 2025 by Nagar Palika Parishad Hathras. After that BEP is approved and structural drawings of SBR also vetted by IIT and at present excavation for SBR is in progress Date of start is 06.09.2024 and date of completion is 05.06.2024. Survey work is going on.','Land issued by NPP','Project Manager personally contacted the District Magistrate and requested to remove the potato crop, on which the District Magistrate talked to the Executive Officer over telephone and directed to remove the potato crop within 7 working days. As per the instructions of the District Magistrate, the construction work of STP could be started in the month of March 2025 after removing the potato crop from the land provided by the Executive Officer Municipal Council Hathras','2026-11-30','2026-06-05','2026-06-17 14:58:56'),(15,15,7,3,9,'I&D and STP works at Kosi Kalan Town, District Mathura','NGP','DBOT','2022-10-25',66.59,31.24,2.03,33.32,1,12.00,1,53.60,'2024-10-16','2026-07-15','','+0.31 46.26','+0.00 13.52','2026-06-08','Continous instruction has been given to firm for expediting the work. BEP of STP has been approved. Boundary wall construction work is going on at site. Preparation for PCC work of SBR basin is in progress, hindered due to rain at site. LOA has been issued on date 18.06.2024 and Date of start has been given 16.10.2024 to the firm. Survey work is going on Survey and soil investigation has been done by firm. Ground improvement work of SBR basin is completed, PCC work  is in progress.','Firm has taken additional time in initial document submission and ULB\'s continuous waste disposal at project site also hindered the work.','Letter had been written to ULB to stop waste disposal at site. It was stopped and site was cleared for the work. Additionally notices/letters has been written to the firm for expediting the progress. Now the firm has been expedited the work and SBR basin work is in progress.','2026-07-16','2026-07-16','2026-06-17 14:58:56'),(16,16,8,13,18,'I&D and STP works at Meerut','NGP2-EAP','HAM','2020-05-06',690.71,363.78,26.31,280.19,1,220.00,2,369.74,'2024-11-11','2026-11-10','','+0.58 56.84','+0.00 191.82','2026-06-08','QAP, Date Sheet and GAD of Decanter, Diffuser, Vortex Grit Chamber, Turbo Air Blower, Fine & Coarse Screens, Chlorination System & Leak Absorption System, RAS SAS, RSTP Pumps, Belt Filter Press, Gravity Belt Thickener, Screw Pumps approved. QAP, Date Sheet and GAD of Gas Flare System, under re-submission., RCC drawing & design Calculations of Odean Nala I&D under re-submission. GAD, Blower & Panel Building, SBR piping, HT panel & workshop, Security HT Panel-2  Metering Room, Electrical BEP, pending with Concessionaire. GAD of Odean Nala & Abu Nala-2 I&Ds under review with IIT Roorkee., RCC of Compound walls approved. . Payment for1st and 2nd MS have been released BEP, Layout and HFD approved for 220 MLD STP, 2 I&D’s & MPS, BEP of Treated Effluent Pipeline from Lohia Nagar STP to Outfall pending with Concessionaire, BEP of EPS and Pipeline pending with Concessionaire. \nGAD, Structural Design and Dwg. for Admin Building, SBR, CCT, Tonner Room approved\nQAP, Date Sheet and GAD of Decanter, Diffuser approved, QAP, Date Sheet and GAD of Air Blowers under review.,  Vortex Grit Remover approved by PE.\nGAD of Primary Clarifier approved by UPJN. , QAP, Date Sheet and GAD of Chlorination System pending with Concessionaire.\nQAP of Filter Belt Press pending with Concessionaire., Revised QAP of Pumps to be submitted by Concessionaire. Revised GAD of MPS pending with Concessionaire. Work in progress at only 1 front of STP, Concessionaire need to open multiple working fronts.\nInadequate Manpower deployment at site, Manpower deployment to be increased. ESIA/ ESMP under review with World Bank BEP of EPS and Pipeline works has been recommended by PE.','The 3rd and 4th milestones are delayed as the design and drawings have not been submitted by the firm. Due to this work not having started on different fronts.','','2027-02-21','2027-02-11','2026-06-17 14:58:56'),(17,17,12,10,5,'I&D and STP works at Saharanpur','NGP2-EAP','HAM','2022-06-16',577.23,266.34,20.55,290.34,1,135.00,61,343.88,'2025-11-01','2027-10-31','','+0.15 25.65','+0.00 46.62','2026-06-08','LOA issue on dt. 26.07.2024. CA signed on dated 27.09.2024. Financial Closure documents submitted in NMCG, is under scrutiny. About 6.0 m level differnces as given in tender document and actual site level. as discussed NMCG meeting held on 07.01.2025. In the review meeting on 25.04.25 at NMCG, UPJN-R/PE were asked to work out on the possible alternatives options like retaining wall option, backfilling option or others etc. Post which UPJN-R and PE had to work on optimization of the solution and comeback with all possible solution.\nAccordingly, additional cost implication worth Rs. 81 crore for STP due to level difference sent to NMCG on 21.04.25 Out of various feasible technical solutions to counter the implication arose due to mis-match of site data, option no. 4 has been approved in-principle by NMCG and communicated vide letter no. Pr-13011/1/2022 – O/o PS NMCG dated 03.10.2025. Concessionaire have to submit the detailed estimate with in one month. Effective date of start  01.11.2025  given to concessionaire vide Lt. 1077/122(Namami Gange)132 dt. 31.10.2025','','','2027-11-01','2027-11-01','2026-06-17 14:58:56'),(18,18,5,NULL,16,'Interception & Diversion Of 14 Untapped Drains Of Kanpur City (Along with Supplementary Works)','NGP2-NON EAP','DBOT','2025-05-02',138.11,97.17,7.77,2.03,0,0.00,14,79.39,'2026-01-09','2027-09-08','','+0.00 2.47','+0.00 0.00','2026-06-08','','','','2027-09-08','2027-07-08','2026-06-17 14:58:56'),(19,19,10,14,6,'Interception, Diversion of Balance 13 drains and Augmentation of Salori STP capacity by 43 MLD (Sewerage District-C) at Prayagraj Uttar Pradesh under DBOT mode','NGP','DBOT','2023-03-14',331.75,180.27,11.22,140.27,1,43.00,13,204.40,'2024-03-19','2025-08-18','','+0.04 94.82','+18.03 99.95','2026-06-08','Casting of 10th  Lift of Wall at AB Culvert SPS has been completed.Compound wall & Sinking  work is under progress 2670 m laying of Rising main completed. Balance Laying is under progress. Sitaram Ghat SPS- RCC work for wet well is under progress. 1600 m laying of gravity intercepter line has been completed. Manhole construction work is under progress. RCC work for I&D is under progress. 43 MLD Salori STP partially commissioned on dated 31.12.2025. RCC work for PTU, SBR Basin, CCT Unit, MCC Room ,Chlorination room, Air Blower, Sludge Dewatering Unit  & TEPS is completed. RCC work for chlorine tonner yard is under Progress. Tiles, putti, painting and other finishing work for all unit of STP is under Progress. RCC work completed  for Admin Building and Staff quarter, Brick work & Plaster is under progress.','Progress was hampered due to site submergence in 2024,  Construction of River front road, Mahakumbh-2025 and site submergence in 2025 during monsoon.','','2026-04-30','2026-04-30','2026-06-17 14:58:56'),(20,20,10,14,17,'Interception, Diversion of Balance 7 drains and Augmentation of Rajapur STP capacity by 90 MLD (Sewerage District-D) at Prayagraj Uttar Pradesh under DBOT mode','NGP','DBOT','2023-01-27',475.98,242.85,15.24,217.89,1,90.00,7,309.74,'2024-08-24','2026-02-23','','+0.81 80.34','+52.88 115.28','2026-06-08','Plinth Beam Casting is Completed for PTU, Column Casting is under Progress. RCC work &  Hydro test of SBR Basin 1,3& 4 is completed. Walkway & channel work is under progress RCC work & Hydro test of CCT  is completed. RCC work of TEPH  is completed. Mechanical work is in progress. RCC work of  workshop Building,sub station Building is completed, Finishing work is under progress. RCC work for Air Blower Building is completed . Finishing work is under progress. Admin Building &  BFP building - RCC work is under Progress. RCC work is under progress for  Rajapur 56 mld MPS. RCC work is under progress for Mumfordganj 39 mld MPS. Shifting of Existing Rising main inside Mumfordganj SPS Campus work is completed. 2950 m laying of Rising main completed. Balance Laying is under progress. 1272 m laying of Gravity main (Sadar Bazar) & 2342 m laying of Gravity main (Sankar Ghat) completed Balance Laying is under progress RCC work completed for 5 Nos I&D , work is under progress for 1 Nos. I&D. Work was hampered due to Vehical restriction and overcrowding during Mahakumbh -2025, River Front road construction and Flood in 2024 & 2025.','Work was hampered due to Vehical restriction and overcrowding during Mahakumbh -2025, River Front road construction and Flood in 2024 &2025.','','2026-02-23','2026-02-23','2026-06-17 14:58:56'),(21,21,10,14,7,'Interception, Diversion of Balance discharge of 02 drains and 50 MLD STP to Augment existing Treatment Capacity (80 MLD) Naini STP for Sewerage District-A at Prayagraj Uttar Pradesh under DBOT mode','NGP','DBOT','2023-09-05',186.47,83.71,5.44,97.32,1,50.00,2,95.57,'2025-03-04','2026-07-03','','+0.38 68.33','+28.87 37.35','2026-06-08','Gates and screen installation work in PTU is under progress Gas engine Building Excavation work started at site Concreting work of Grid Slab of SBR basin-1, 2 3 &4  is completed and shuttering, reinforcement and concreting work of basin wall - 1 2  3 & 4 upto 100% height is completed. Walkway work also completed . Gravel padding, PCC and Reinforcement of CCT raft  Wall  & Walkway is completed Excavation, Reinforcement and Concreting work upto slab level is completed in PTU Walkway work is completed. Piling work of I&D Structure is completed. Wet Well of SPS is completed. Casting of columns of claritubesettler is completed and shuttering work of beam and grade slab is completed. Staff quarter upto ground floor column is completed and Shuttering and reinforcement work for Ground Floor beam and slab is completed. Gravel padding, PCC and raft of Admin Building is completed and reinforcement & shuttering work of plinth beam is completed. Finishing work of Security Cabin is completed. Workshop Building Footing work is completed column work is in progress. Dewatering Building foundation completed Column work is also completed. Decenter Blower clorination system Gate Screen, Screw Press Screen and diffuser  is receieved at site. Approach bridge Pilling work in completed. BEP of 50 MLD STP has been approved. Structure design & drawing of SBR, Claritube settler, Staff quarter, CCT, PTU, Admin Building cum Blower Room and Workshop Building has been approved. Excavation, PCC of work shop building is completed Column work is under progress. Soil testing of STP & SPS site has been completed. BEP and Structure design and drawing has been Approved for 2.90 MLD Bargad Ghat SPS. Survey, Design and Drawing work of remaining structure is in progress.','Site submergence during flood period. \nFirm has requested for technology change and the same was rejected by NMCG, New Delhi on dated 27.05.2025','Notice regarding LD has been issued to the firm for delay','2026-07-03','2026-07-03','2026-06-17 14:58:56'),(22,22,7,4,4,'Mathura sewerage scheme (I&D and STP Works for balance drain)','NGP2-NON EAP','HAM','2022-09-07',292.56,149.85,9.61,133.10,1,60.00,4,240.01,'2024-11-30','2026-11-29','','+0.83 84.27','+0.00 155.37','2026-06-08','LOA issued to L1 Bidder on on 27.09.2023. CA signed on 12.12.2023. Effective date of start shall be to concessionaire after financial closure. Effective date of start has been given to concessionaire as 30.11.2024. IPS Kala Patthar civil work and its Rising main has been completed SBR basin and MPS construction work is in progress in STP premises. Dairy farm IPS rising main laying work is in progress.','No Delay','-','2026-11-30','2026-11-30','2026-06-17 14:58:56'),(23,23,6,NULL,11,'Pollution Abatement Of Gomti River (Phase 1 Part 1) Lucknow','NGP','DBOT','2024-07-29',240.93,123.45,6.97,110.51,2,42.50,2,187.90,'2024-09-07','2026-06-06','','+0.02 92.56','+0.00 128.44','2026-06-09','39 MLD STP Daulatganj Operation & Maintenance started on dt. 05.11.2024. SBR Basin -Hydro testing work completed.  CCT -  Hydro testing work completed.  MPS - Sump wall 7th lift and coarse screen chamber wall 3rd lift reinforcement & shuttering work is in progress. PTU - Wall reinforcement, shuttering and casting work is in progress. HT Building - Plaster work is in progress. Admin Building - Ist floor roof slab shuttering work is in progress.  SHU - Column above Plinth beam work is in progress. Transformer yard - Casting work is completed. DG Platform - Casting work is completed. Supply of Decanter & Defuser completed. Supply of PLC Panel, Motor of MPS, RAS, SAS Pump  & Blower completed. Decanter installation work is in progress.','Slow progress by firm.','L.D. imposed Rs. 66,74,000.00 on firm','2026-06-06','2026-07-06','2026-06-17 14:58:56'),(24,24,6,15,11,'Pollution Abatement of Gomti River (Phase-II, Part-I) Lucknow','NGP','DBOT','2023-01-30',264.67,137.55,8.53,118.60,1,50.00,3,187.74,'2024-06-14','2026-03-13','','+0.44 22.70','+0.00 24.12','2026-06-09','Design & Drawing work is in progress. SBR Basin  4 - Common wall 3rd lift reinforcement, shuttering and casting work is in progress. SBR Basin 3- Decanter wall 3rd lift and selector zone wall 3rd lift reinforcement shuttering & casting work is in progress. SBR Basin 2 - Selector zone  outer wall 3rd lift reinforcement, shuttering and casting work is in progress. SBR Basin 1 -Excavation work is in progress. IPS - Wall 1st lift reinforcement & shuttering  work is in progress. Faizullaganj (U/S) I&D - Approach drain excavation, PCC, reinforcement, shuttering and casting work is in progress.','Slow progress by firm.','L.D. imposed Rs. 64,13,000.00 on firm','2026-04-13','2026-04-13','2026-06-17 14:58:56');
/*!40000 ALTER TABLE `audit_sewerage_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:01
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:01
CREATE DATABASE  IF NOT EXISTS `jjm_ongoing_projects` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jjm_ongoing_projects`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jjm_ongoing_projects
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
-- Table structure for table `agencies`
--

DROP TABLE IF EXISTS `agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agencies` (
  `agency_id` int NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(255) NOT NULL,
  PRIMARY KEY (`agency_id`),
  UNIQUE KEY `agency_name` (`agency_name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencies`
--

LOCK TABLES `agencies` WRITE;
/*!40000 ALTER TABLE `agencies` DISABLE KEYS */;
INSERT INTO `agencies` VALUES (9,'M/s 21st Century Enviro Engineers Pvt. Ltd. -M/s Sattva Engineering Const. Ltd. JV'),(3,'M/s Aastha Enviro Engineers Pvt Ltd'),(1,'M/s AWWMPL  Pvt Ltd'),(21,'M/s EIEL Mathura Infra Engineers Private Limited'),(16,'M/s Enviro Infra Engineers Ltd, Bhugan Infracon Pvt. Ltd. & Micro Transmission System, JV'),(18,'M/s HNB Private ltd. - M/s Tirupati Cements Products (JV)'),(20,'M/s JWIL-SSG (Joint Venture)'),(13,'M/s Neercare India pvt KLtd JV M/s EMIT Group India Pvt Ltd JV EMS Ltd'),(7,'M/s R K Engineers Sales Ltd'),(10,'M/s R.K. Engineers Sales Ltd.-M/s Anand Constrwell Pvt. Ldt. (JV)'),(22,'M/s R.K. Engineers- Khilari Infrastructure (JV)'),(2,'M/s Shailesh Kumar J.V.'),(6,'M/s SIMA -G D- N.P. (JV)'),(5,'M/s SKC Technocrat Pvt. Ltd (Formerly M/s Satish Kumar & Co.) & M/s Malvika Technical Services (JV)'),(12,'M/s SKC Technocrat Pvt. Ltd (Formerly M/s Satish Kumar & Co.) & M/s. Geo Miller & Co. Pvt. Ltd. (JV)'),(17,'M/s Technocraft Ventures Limited'),(19,'M/s Triveni Engineering and Industries'),(15,'M/s. Meerut STP Pvt. Ltd.');
/*!40000 ALTER TABLE `agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `district_id` int NOT NULL,
  `city_name` varchar(255) NOT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `uk_city` (`district_id`,`city_name`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,1,'Agra'),(2,3,'Chhata'),(10,3,'Kosi Kalan'),(16,3,'Mathura'),(3,3,'Vrindavan'),(4,8,'Banat'),(5,8,'Bantikhera Banat'),(6,8,'Shamli'),(7,8,'Thanabhawan'),(12,10,'Saharanpur'),(8,13,'Hapur'),(9,14,'Hathras'),(11,16,'Meerut'),(13,19,'Prayagraj'),(17,23,'Lucknow');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `district_id` int NOT NULL AUTO_INCREMENT,
  `district_name` varchar(255) NOT NULL,
  PRIMARY KEY (`district_id`),
  UNIQUE KEY `district_name` (`district_name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'Agra'),(6,'Bulandshahr'),(13,'Hapur'),(14,'Hathras'),(18,'Kanpur Nagar'),(23,'Lucknow'),(3,'Mathura'),(16,'Meerut'),(5,'Pratapgarh'),(19,'PrayagRaj'),(4,'Rae Bareli'),(10,'Saharanpur'),(8,'Shamli');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
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
  `work_component` text,
  `component_count` int DEFAULT NULL,
  `capacity_length_no` varchar(255) DEFAULT NULL,
  `physical_progress` decimal(10,2) DEFAULT NULL,
  `photos` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`component_id`),
  KEY `idx_proj` (`project_id`),
  CONSTRAINT `project_components_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `sewerage_projects` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_components`
--

LOCK TABLES `project_components` WRITE;
/*!40000 ALTER TABLE `project_components` DISABLE KEYS */;
INSERT INTO `project_components` VALUES (1,1,'Effluent Disposal Line (km.)',2,'2.01',92.50,'12'),(2,1,'Intercepting Sewer (km)',3,'1.94',82.00,'4'),(3,1,'Interception And Diversion',1,'22.00',0.00,'0'),(4,1,'MPS (MLD)',3,'373.50',82.67,'45'),(5,1,'Rising main (mtr.)',3,'8970.00',76.67,'26'),(6,1,'STP (MLD)',13,'177.60',26.25,'88'),(7,2,'Interception And Diversion',1,'40.00',0.00,'0'),(8,3,'Ancilliary works(Admin building,staff quarter ,roa',1,'1.00',22.30,'4'),(9,3,'I/C Sewer line (Mtr.)',1,'2170.00',27.00,'0'),(10,3,'Interception And Diversion',1,'11.00',0.00,'0'),(11,3,'MPS (MLD)',1,'6.00',40.00,'14'),(12,3,'Rising Main (Meter)',1,'5500.00',0.00,'0'),(13,3,'STP (MLD)',1,'6.00',15.50,'8'),(14,4,'FSTP(KLD)',1,'8.00',3.90,'4'),(15,5,'Admin Building',1,'1.00',0.00,'0'),(16,5,'Boundary wall, staff quarter',1,'1.00',0.00,'0'),(17,5,'Cesspool Vehicle',1,'3.00',0.00,'0'),(18,5,'FSTP(KLD)',1,'15.00',28.00,'4'),(19,5,'Solar Power (kw)',1,'35.00',0.00,'0'),(20,6,'Boundary wall',1,'286.00',10.00,'0'),(21,6,'Interception And Diversion',1,'1.00',0.00,'0'),(22,6,'MPS (MLD)',1,'15.00',0.00,'0'),(23,6,'Others',1,'1.00',0.00,'0'),(24,6,'STP (MLD)',1,'10.00',3.00,'0'),(25,7,'Ancilliary works(Admin building,staff quarter ,roa',1,'1.00',96.00,'11'),(26,7,'Interception And Diversion',1,'2.00',97.00,'0'),(27,7,'MPS (MLD)',1,'6.00',88.00,'8'),(28,7,'Online Monitoring/LCS/MCS for proposed STPs and Ex',1,'1.00',0.00,'0'),(29,7,'Rising main (mtr.)',1,'3700.00',99.00,'0'),(30,7,'STP (MLD)',1,'13.00',98.00,'33'),(31,7,'Treated water sump and associated works',1,'1.00',99.00,'0'),(32,7,'Upgradation of MPS',1,'1.00',62.00,'0'),(33,8,'Co-treatment Unit for Fecal Sludge (KLD)',1,'5.00',3.00,'0'),(34,8,'Effluent Disposal Line (km.)',1,'0.60',65.00,'0'),(35,8,'Interception And Diversion',1,'2.00',55.00,'0'),(36,8,'MPS (MLD)',1,'6.00',85.90,'8'),(37,8,'Power Connection',1,'1.00',0.00,'0'),(38,8,'Rising main (mtr.)',1,'50.00',0.00,'0'),(39,8,'Sewer Line (km.)',1,'0.60',65.00,'0'),(40,8,'STP (MLD)',1,'5.00',61.20,'24'),(41,9,'Co-treatment Unit for Fecal Sludge (KLD)',1,'5.00',3.00,'0'),(42,9,'Effluent Disposal Line (km.)',1,'0.40',0.00,'0'),(43,9,'Interception And Diversion',1,'4.00',0.00,'0'),(44,9,'MPS (MLD)',1,'6.00',0.00,'0'),(45,9,'Power Connection',1,'1.00',0.00,'0'),(46,9,'Rising main (mtr.)',1,'50.00',0.00,'0'),(47,9,'Sewer Line (km.)',1,'2.00',0.00,'0'),(48,9,'STP (MLD)',1,'5.00',24.00,'13'),(49,10,'MPS (MLD)',1,'28.00',0.00,'0'),(50,10,'Power Connection',1,'1.00',0.00,'0'),(51,10,'Rising main (mtr.)',1,'50.00',0.00,'0'),(52,10,'Sewer Line (km.)',1,'3.83',0.00,'0'),(53,10,'STP (MLD)',1,'20.00',0.00,'4'),(54,11,'Co-treatment Unit for Fecal Sludge (KLD)',1,'20.00',3.00,'0'),(55,11,'Effluent Disposal Line (km.)',1,'0.10',0.00,'0'),(56,11,'Interception And Diversion',1,'1.00',95.00,'9'),(57,11,'MPS (MLD)',1,'48.00',60.90,'8'),(58,11,'Power Connection',1,'1.00',0.00,'0'),(59,11,'Rising main (mtr.)',1,'100.00',0.00,'7'),(60,11,'Sewer Line (km.)',1,'0.10',0.00,'0'),(61,11,'STP (MLD)',1,'40.00',68.92,'21'),(62,12,'Co-treatment Unit for Fecal Sludge (KLD)',1,'10.00',3.00,'0'),(63,12,'Interception And Diversion',1,'3.00',35.00,'4'),(64,12,'MPS (MLD)',1,'13.00',44.70,'4'),(65,12,'Power Connection',1,'1.00',0.00,'0'),(66,12,'Rising main (mtr.)',1,'60.00',0.00,'0'),(67,12,'Sewer Line (km.)',1,'5.60',7.00,'0'),(68,12,'STP (MLD)',1,'10.00',54.90,'18'),(69,13,'Drains',1,'1.00',5.00,'0'),(70,13,'MPS (MLD)',1,'8.00',60.00,'12'),(71,13,'Others',1,'1.00',30.00,'8'),(72,13,'STP (MLD)',1,'6.00',50.00,'12'),(73,14,'Admin Building',1,'1.00',45.00,'4'),(74,14,'Boundary wall (mtr.)',1,'800.00',0.00,'0'),(75,14,'Intercepting Sewer (km)',1,'5.67',33.10,'4'),(76,14,'MPS (MLD)',1,'54.00',77.00,'8'),(77,14,'Nala Tapping Arrangement ( No.)',1,'8.00',0.00,'0'),(78,14,'Rising main (mtr.)',1,'0.13',36.50,'0'),(79,14,'Staff Quarter type 2',1,'1.00',0.00,'0'),(80,14,'STP (MLD)',1,'24.00',72.00,'16'),(81,15,'Ancilliary works(Admin building,staff quarter ,roa',1,'1.00',31.05,'7'),(82,15,'Intercepting Sewer (km)',1,'0.03',0.00,'0'),(83,15,'MPS (MLD)',1,'12.00',37.05,'4'),(84,15,'Nala Tapping Arrangement ( No.)',1,'1.00',0.00,'0'),(85,15,'Rising main (mtr.)',1,'100.00',0.00,'0'),(86,15,'STP (MLD)',1,'12.00',51.95,'16'),(87,16,'Interception And Diversion',1,'2.00',50.70,'0'),(88,16,'MPS',1,'1.00',80.60,'6'),(89,16,'Power Connection',1,'1.00',0.00,'0'),(90,16,'Rising main (mtr.)',1,'100.00',0.00,'0'),(91,16,'Sewer Line (km.)',1,'5.60',10.00,'0'),(92,16,'STP (MLD)',1,'220.00',55.70,'47'),(93,17,'Effluent Disposal Line (km.)',1,'0.10',4.00,'0'),(94,17,'Interception And Diversion',1,'61.00',4.00,'0'),(95,17,'MPS (MLD)',1,'172.30',4.00,'0'),(96,17,'Power Connection',1,'1.00',4.00,'0'),(97,17,'Rising main (mtr.)',1,'50.00',4.00,'0'),(98,17,'Sewer Line (km.)',1,'16.00',4.00,'4'),(99,17,'STP (MLD)',1,'135.00',33.60,'0'),(100,18,'Construction of SPS and Lift Station (Nos)',1,'7.00',0.00,'0'),(101,18,'Interception and Diversion Work of Drains (Nos)',1,'14.00',0.00,'0'),(102,18,'Laying of Diversion Sewer (meter)',1,'2515.00',0.00,'0'),(103,18,'Laying of Rising main (meter)',1,'11253.00',6.56,'0'),(104,18,'Miscellaneous Works',1,'1.00',0.00,'0'),(105,19,'Effluent Disposal Line (km.)',1,'0.30',85.00,'16'),(106,19,'Effluent Pumping Station (MLD)',1,'43.00',100.00,'28'),(107,19,'Interception And Diversion',1,'13.00',70.00,'8'),(108,19,'IPS (MLD)',1,'2.20',68.00,'21'),(109,19,'MPS (MLD)',1,'32.00',72.00,'16'),(110,19,'Rehabilitation of Sewer Line',1,'3.30',0.00,'0'),(111,19,'Rising main (mtr.)',1,'4070.00',94.00,'20'),(112,19,'Sewer Line (km.)',1,'2.16',94.00,'8'),(113,19,'STP (MLD)',1,'43.00',99.00,'105'),(114,20,'Effluent Disposal Line (km.)',1,'0.30',73.00,'8'),(115,20,'Effluent Pumping Station (MLD)',1,'90.00',73.00,'4'),(116,20,'Interception And Diversion',1,'7.00',80.00,'42'),(117,20,'MPS (MLD)',2,'95.00',71.50,'103'),(118,20,'Rehabilitation of Bund and Bund Road',1,'1.00',37.00,'0'),(119,20,'Rising main (mtr.)',1,'3450.00',88.00,'9'),(120,20,'Sewer Line (km.)',1,'4.20',88.00,'23'),(121,20,'STP (MLD)',1,'90.00',81.00,'114'),(122,21,'Co-treatment Unit for Fecal Sludge (KLD)',1,'20.00',0.00,'0'),(123,21,'Interception And Diversion',1,'2.00',84.00,'24'),(124,21,'IPS (MLD)',1,'2.90',67.50,'85'),(125,21,'Rising main (mtr.)',1,'100.00',25.00,'0'),(126,21,'Sewer Line (km.)',1,'0.06',86.00,'0'),(127,21,'STP (MLD)',1,'50.00',68.00,'211'),(128,22,'I/C Sewer line (Mtr.)',1,'1970.00',97.06,'4'),(129,22,'Interception And Diversion',1,'4.00',68.15,'4'),(130,22,'IPS (MLD)',2,'47.00',69.13,'13'),(131,22,'MPS (MLD)',1,'60.00',100.00,'8'),(132,22,'Rising main (mtr.)',1,'9290.00',97.44,'8'),(133,22,'STP (MLD)',1,'60.00',81.84,'14'),(134,23,'Interception And Diversion',1,'1.00',3.00,'0'),(135,23,'MPS',1,'3.50',46.50,'0'),(136,23,'STP (MLD)',2,'42.50',87.85,'59'),(137,23,'Uppgradation of SPS',3,'3.00',100.00,'0'),(138,24,'Interception And Diversion',1,'3.00',14.58,'0'),(139,24,'Rising main (mtr.)',1,'3500.00',57.12,'0'),(140,24,'SPS (MLD)',1,'22.60',3.69,'0'),(141,24,'STP (MLD)',1,'50.00',22.57,'41');
/*!40000 ALTER TABLE `project_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sewerage_projects`
--

DROP TABLE IF EXISTS `sewerage_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sewerage_projects` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `sr_no` int DEFAULT NULL,
  `district_id` int DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `agency_id` int DEFAULT NULL,
  `project_name` text,
  `scheme_type` varchar(255) DEFAULT NULL,
  `project_mode` varchar(255) DEFAULT NULL,
  `sanction_date` date DEFAULT NULL,
  `sanction_cost` decimal(15,2) DEFAULT NULL,
  `work_cost` decimal(15,2) DEFAULT NULL,
  `centage` decimal(15,2) DEFAULT NULL,
  `om_cost` decimal(15,2) DEFAULT NULL,
  `stp_count` int DEFAULT NULL,
  `stp_capacity` decimal(15,2) DEFAULT NULL,
  `drain_count` int DEFAULT NULL,
  `agreement_cost` decimal(15,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `agreement_completion_date` date DEFAULT NULL,
  `revised_date` varchar(255) DEFAULT NULL,
  `physical_progress` varchar(255) DEFAULT NULL,
  `financial_progress` varchar(255) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `remarks` text,
  `reason_for_delay` text,
  `action_taken` text,
  `tentative_inauguration_date` date DEFAULT NULL,
  `tentative_zero_discharge_date` date DEFAULT NULL,
  `scrape_time` datetime DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  KEY `district_id` (`district_id`),
  KEY `city_id` (`city_id`),
  KEY `agency_id` (`agency_id`),
  KEY `idx_sr` (`sr_no`),
  KEY `idx_upd` (`update_date`),
  CONSTRAINT `sewerage_projects_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`),
  CONSTRAINT `sewerage_projects_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`),
  CONSTRAINT `sewerage_projects_ibfk_3` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sewerage_projects`
--

LOCK TABLES `sewerage_projects` WRITE;
/*!40000 ALTER TABLE `sewerage_projects` DISABLE KEYS */;
INSERT INTO `sewerage_projects` VALUES (1,1,1,1,1,'Agra Sewerage Scheme( Interception & diversion and STP works)','NGP2-EAP','HAM','2020-05-06',842.25,371.29,25.40,445.56,13,177.60,26,582.84,'2023-04-05','2025-04-04','04-Apr-2025 31-Dec-2025','+0.00 83.01','+0.00 336.24','2026-06-08','Component wise progress of Agra (HAM) 100 MLD STP- 68%, WIP 35 MLD STP- 76.2, WIP 31 MLD STP- 76.48%, WIP MPS 03 Nos.- 73%, WIP Rising Main 9.55 Km- 55%%, WIP Gravity Sewer 2.55 Km- 80%, WIP DSTP 10 Nos.- 5%, WIP Note- 1st Stage permission is granted for 07 Nos. DSTP Forest Land and 2nd stage permission is under process As per pervious meeting discussion, In order to complete the remaining works of 31 MLD and 35 MLD STP and make them operational as per the prescribed timeline, Direction  has been given to firm to complete the works as early as possible by increasing manpower. As per pervious meeting discussion, In order to 07 Nos. DSTP forest clearance , Land Gazette notification meeting has been conducted on 02.05.2025 and soon gazette notification will be published and after that stage 2 permission will be applied','NOC of land for 7 Nos DSTP, Road cutting permission for laying of rising main ,','1st Stage Permission was granted from forest department and 2nd stage permission is under process. A request was made by District Magistrate proposal sent to Revenue  department UP Lucknow for 1 No. DSTP Indira Memorial.  In current laying of rising main and intercepting sewer line permission was granted by district administration and work is under progress. MPS Nagla Buri public hindrance was resolved work is under progress.','2026-11-01','2026-09-01','2026-06-17 15:02:51'),(2,2,1,NULL,NULL,'Balance Darins Tapping and Augmentation of SPSs at Agra City','NGP','DBOT','2025-06-11',126.41,86.37,6.90,34.01,0,0.00,0,66.86,'2026-04-02','2027-10-01','','+0.00 0.00','+0.00 0.00',NULL,'','','','2027-11-01','2027-10-31','2026-06-17 15:02:51'),(3,3,3,2,2,'Chhata Town Sewerage Scheme (I&D and STP works), District Mathura','NGP','DBOT','2022-10-25',56.15,34.52,2.23,19.40,1,6.00,14,48.97,'2024-11-12','2026-08-11','','+0.32 17.58','+0.00 2.69','2026-06-08','STP site is flooded due to overflow from Bahrauli branch drain, (situated near to the site) from 1 month. The current water level at STP site is higher to the HFL, provided by irrigation department. At this situation all works are heavily affected. Not only in present this kind of situation during monsoon will affect the operation and maintenance services in later too.\n            Due to the current scenario of site, we have sent a letter to SDM, Chhata, requesting a new land for \n           construction of STP in this project with all requisite details of the scenario of original project site. Construction of HTS and staff quarter building is in progress at MPS. Project is slightly delayed due to problem of water logging at STP Site as PWD, Mathura was constructing a culvert on Kosi Drain and due to diversion of drain the water of kosi drain got obstructed. The STP site is located near to the branch drain of kosi drain at upstream side which got over flowed and leading to water logging at STP Site.This hindrance cleared in march 2025 after that work was resumed. Date of Start 12.11.2024 has been given to the firm. Survey and soil investigation has completed by firm. BEP of STP has been approved. Boundary wall construction work is going on at site.','Project is slightly delayed due to problem of water logging at STP Site as PWD, Mathura was constructing a culvert on Kosi Drain and due to diversion of drain the water of kosi drain got obstructed. The STP site is located near to the branch drain of kosi drain at upstream side which got over flowed and leading to water logging at STP Site.','Communication has been done to PWD and Irrigation Department for the problem of water logging at site. Additionally firm has been instructed to take preventive measures and initiate the work. Now the Piling and associated work has been commenced at site for SBR basin.','2026-08-12','2026-08-12','2026-06-17 15:02:51'),(4,4,4,NULL,3,'DPR OF 08 KLD Fecal Sludge Treatment Plant At Dalmau Raibareli','NMCG','DBOT','2024-08-28',4.40,3.01,0.18,1.21,0,0.00,0,3.00,'2026-02-06','2026-11-05','','+0.15 3.90','+0.00 0.00','2026-06-09','Technical Bid open on dt. 22.08.2025. LOA issued to Firm M/s Aastha Enviro Engineers Pvt. Ltd. on dt. 30.12.2025. NOC received from NMCG  of FBER on dt. 19.12.2025 TBER sent to NMCG for review and approval. NOC received from NMCG on dt. 03.10.2025. Financial bid open on dt. 10.10.2025. Financial Evaluation work is in progress. FBER sent to NMCG for review and approval on dt. 01.12.2025. Date of start  given to Firm M/s Aastha Enviro Engineers Pvt. Ltd. on dt. 06.02.2026. Bid Document uploaded at e-tender portal on dt. 27.06.2025. Pre-bid Meeting dt. 04.07.2025 at 12:00 PM. Pre-bid reply sent to NMCG for review and approval on dt. 07.07.2025. Soil testing and Survey completed. Design & Drawing work is in progress. Boundary wall work is in progress. NMCG sent final pre-bid replies on dt. 05.08.2025. Final pre-bid replies uploaded on e-tender portal on dt. 07.08.2025 Bid Submission date 22.08.2025.','','','2026-12-05','2026-12-05','2026-06-17 15:02:51'),(5,5,5,NULL,3,'Faecal Sludge Management for Pollution abatement of river Ganga at Manikpur, Pratapgarh','Non EAP','DBOT','2025-01-22',8.56,5.73,0.19,1.90,0,0.00,0,4.62,'2026-02-05','2026-11-04','','+16.00 28.00','+0.00 0.00','2026-06-08','NMCG New Delhi has given approval for issuance of LOA to the L1 Firm  M/s Aastha LOA has been issued to firm on dated 23.12.2025 Date of start has been issued to firm on dated 04.02.2026. Date of start 05.02.2026 and Date of Completion 04.11.2026 Soil test has been done, Survey and site cleaning work is under progress. Construction of Boundary wall is under progress. Excavation and PCC work is under progress for various unit. Vetting of BEP, Design & Drawing is completed. Construction of staff quarter, admin building cum lab are under progress.','','','2026-11-04','2026-11-04','2026-06-17 15:02:51'),(6,6,6,NULL,5,'Gulaothi I&D works','NMCG','DBOT','2024-08-28',50.98,17.13,1.37,13.20,1,10.00,1,51.19,'2025-12-01','2027-05-31','','+0.00 9.00','+0.00 2.09','2026-06-09','AA&ES issued on Dt 28.08.2024 NIT issued by SE, Meerut vide letter no. 257/731/15 Dt 08.11.2024 LOA & Date of start is given on 26.11.2025.  Date of  start is 01.12.2025 & Date of completion of work is 31.05.2027 issued to M/s SKC Technocrat Private Limited- M/s Malvika Technical Services (JV), B-29, RDC, Raj Nagar, Ghaziabad- 201002 Soil Testing Complete. Boundary Wall work is in progress. BEP submitted by the firm on Dated 03.02.2026. Some Observation were found in the examination of BEP, after which BEP was returned to the firm on 08.02.2026. The land purchase proposal has been Sanctioned and GO issued. The funds Released to ULB Gulaothi. Land Registry work is completed. ULB handed over the land to U.P. Jal Nigam for work on Dated 20.12.2025. Mobilization Amount of Rs. 1.04 Crore claimed by firm. Revised BEP submitted by the firm.  BEP send to IIT BHU for vetting After checking it.','','-','2027-05-31','2027-05-31','2026-06-17 15:02:51'),(7,7,3,3,6,'I&D and 13 MLD STP works at Vrindavan City','NGP','DBOT','2022-10-25',77.70,39.90,2.56,35.24,1,13.00,2,65.86,'2024-06-11','2026-03-10','','+0.05 92.93','+0.00 35.24','2026-06-08','Kalideh MPS rising main works has been done. STP site is water logged from 10.08.2025, work is affected due to this STP site had been water logged from 10.08.2025 to 18.09.2025, due to the high flood of Yamuna. After receding of water construction work is in progress along with corrective works due to the damage by flood at site. Work is going in SBR basin,  CCT, Admin building, Pannel room, SHU and in MPS  units. LOA issued to firm on dated 15.03.2024. Effective Date of start for the work is 11.06.2024.Work is in progress.','Initially preliminary work at Site got hindered due to start of monsoon just after the date of start of the project. Firm has started the work after the monsoon  and currently the work is being going on almost on all fronts by the firm. The progress is being regularly expedited by firm to complete the work on scheduled date.','-','2026-03-11','2026-03-11','2026-06-17 15:02:51'),(8,8,8,4,7,'I&D and STP Work in Banat, Shamli','NGP','DBOT','2023-05-25',48.71,24.93,1.58,22.20,1,5.00,3,37.92,'2024-10-14','2026-04-13','','+0.05 73.20','+0.00 14.70','2026-06-08','Contract Agreement is signed on 08.10.2024 and Date of Start 14-10-2024 & Date of Completion 13-01-2026 Survey and Soil investigation work completed BEP, Layout and HFD approved for 05 MLD STP. Gate Schedule approved GAD, Structural design and drawing of CCT with Tonner Room & HT Substation approved GAD, Structural Design and Dwg. for SBR and Boundary wall approved. Approach Road and boundary wall work in progress GAD for Sludge Handling Unit Submitted, which are clear for Vetting & Structural Design. Project is 4 months behind schedule. Delay in design/drawing submission by Contractor. Contractor need to increase expedite the progress of work and submission of design/drawings. GAD, Structural Design and Dwg. for SHU approved GAD, Structural design and drawing of I&D Structure approved GAD and Data Sheet of Diffuser and decanter approved BEP, P&ID of MPS approved GAD, Structural design and drawing of PTU Structure approved GAD, Structural design and drawing of CCT, HT Substation Building and MPS which are clear for Vetting. Structural Design and Dwg. for MPS approved Data Sheet, QAP, Curves etc. of Turbo Blower, Centrifuge approved','Firm delayed submission of Design and drawing','Liquidity Damage (L.D.) imposed on firm for delay.','2026-04-24','2026-04-14','2026-06-17 15:02:51'),(9,9,8,5,7,'I&D and STP Work in Bantikhera and Babri village, Shamli','NGP','DBOT','2023-05-25',55.47,29.41,1.84,24.22,1,5.00,1,41.91,'2024-10-14','2026-04-13','','+0.05 15.55','+0.00 3.62','2026-06-08','GAD of SBR is Clear for Vetting and Structural design Date Sheet, QAP, Curves etc. of Turbo Blower, Centrifuge approved Gate Schedule approved GAD, Structural design & Dwg. of PTU approved Contract Agreement is signed on 08.10.2024 and Date of Start 14-10-2024 & Date of Completion 13-01-2026 Survey and Soil investigation work completed BEP, Layout and HFD approved for 05 MLD STP. Work halted due to unresolved land dispute. Project is 7 months behind schedule.','Due to land dispute','Letters has been written to the District Administration requesting their intervention to resolve the dispute with the nearby farmers.','2026-04-24','2026-04-14','2026-06-17 15:02:51'),(10,10,10,NULL,9,'I&D and STP Work in Deobandh','NGP','DBOT','2024-07-25',134.71,67.42,4.46,62.83,1,20.00,4,95.25,'2026-02-09','2027-07-08','','+0.00 0.00','+0.00 0.00','2026-06-08','Approval on Technical bid from NMCG recieved on 29.07.2025 Letter to lowest bidder regarding power consumption written on dated 14.08.2025 last date for reply is 20.08.2025 Reply received on dated 20.08.2025 NOC on pre- Bid Documents recieved 0n 18.12.2024 Technical Bid opened on 25.01.2025 Technical bid evaluation sheet and document send to NMCG on 28.04.2025 LOA issued to M/s 21st Century Enviro Engineers Pvt. Ltd. -M/s Sattva Engineering Const. Ltd. JV.  on dt. 14.11.2025 Financial bid send to NMCG on dated 04.09.2025 Approval recieved on 16.09.2025 AA&ES recieved on 25.07.2024. Construction activity has been stopped in compliance with the directions issued by the Superintending Engineer, Circle Office, Uttar Pradesh Jal Nigam (Rural), Saharanpur, vide letter no. 168/122 (Namami Gange)/44 dated 20.02.2026, due to an increase in drain discharge from 13.8 MLD to 20.36 MLD, with instructions to the firm not to commence construction activities. Draft pre-bid reply send to NMCG 24.11.2024 Pre-bid meeting held on 07.11.2024 Financial bid opened on 07-08-2025 and financial evaluation under process. Draft bid document and NIT sent to NMCG on 05.08.2024 for approval. Comments on draft Bid Documents recieved on 17.10.2024 NIT published on 24-10-2024','-','-','2027-11-08','2027-11-08','2026-06-17 15:02:51'),(11,11,8,6,10,'I&D and STP Work in Shamli','NGP','DBOT','2023-05-25',206.02,103.19,6.66,96.17,1,40.00,1,120.92,'2024-10-14','2026-04-13','','+0.05 77.95','+0.00 41.81','2026-06-08','Primary Clariflocculator GAD Submitted, which clear for Vetting & Structural Design. CCT GAD Submitted which clear for Vetting & Structural Design. BEP, P&ID, HFD of MPS approved Data Sheet, QAP, Curves etc. of Turbo Blower, Centrifuge approved Gate Schedule & Electrical load list approved GAD, Structural Design and Dwg. of CCT/Toner Room & Fiber Disk Filter approved GAD, Structural Design and Dwg. for MPS approved Contract Agreement is signed on 08.10.2024 and Date of Start 14-10-2024 & Date of Completion 13-01-2026 Approach Road and Boundary wall work in progress BEP, Layout and HFD approved for 40 MLD STP. GAD, Structural Design and Dwg. for SBR and Boundary wall approved. GAD for Admin Building and Sludge Handling and Dewatering Building Submitted, which clear for Vetting & Structural Design. CCT and I&D GAD Submitted, which clear for Vetting & Structural Design. Project is 4 months behind schedule. Delay in design/drawing submission by Contractor. Contractor need to increase expedite the progress of work and submission of design/drawings. GAD, Structural Design and Dwg. for SHU  approved GAD, Structural Design and Dwg. of I&D Structure approved GAD and Data sheet of Decanter and diffuser approved GAD, Structural Design and Dwg. for Admin. Building & Lab approved GAD, Structural Design and Dwg. of Staff Quarter approved','Firm delayed submission of\nDesign and drawing','Liquidity Damage (L.D.) imposed on firm for delay.','2026-04-24','2026-04-14','2026-06-17 15:02:51'),(12,12,8,7,7,'I&D and STP Work in Thanabhawan, Shamli','NGP','DBOT','2023-05-25',97.19,55.63,3.50,38.06,1,10.00,5,63.72,'2024-10-14','2026-04-13','','+0.05 68.15','+0.00 19.11','2026-06-08','GAD, Structural Design and Dwg. for SBR and Boundary wall approved. GAD for Sludge Handling Unit Submitted, which are clear for Vetting & Structural Design. CCT GAD were Submitted, which clear for Vetting & Structural Design. Boundary Wall work in progress Project is 4 months behind schedule. Delay in design/drawing submission by Contractor. Contractor need to increase expedite the progress of work and submission of design/drawings. GAD, Structural Design and Dwg. for SHU approved GAD and Data Sheet of Diffuser and decanter approved BEP, P&ID of MPS approved GAD of MPS submitted which is clear for vetting GAD, Structural Design and Dwg. for PTU and CCT  Submitted which are clear for Vetting Structural Design and Dwg. for MPS submitted which is clear for Vetting GAD of Fiber Disk filter submitted which is clear for vetting Data Sheet, QAP, Curves etc. of Turbo Blower, Centrifuge approved Gate Schedule & Electrical load list approved Structural Design and Dwg. of PTU, Fiber Disk Filter, I&D and Sewer Network approved Structural Design and Dwg. for MPS approved Structural Design and Dwg. for CCT with Tonner Room approved Contract Agreement is signed on 08.10.2024 and Date of Start 14-10-2024 & Date of Completion 13-01-2026 Survey and Soil investigation work completed Approach Road work in progress BEP, Layout and HFD approved for 10 MLD STP.','Firm delayed submission of Design and drawing','Liquidity Damage (L.D.) imposed on firm for delay.','2026-04-24','2026-04-14','2026-06-17 15:02:51'),(13,13,13,8,12,'I&D and STP works at District-Hapur','NGP','DBOT','2023-09-19',49.06,22.85,1.42,24.79,1,6.00,1,39.28,'2024-11-08','2026-02-07','','+0.00 48.00','+0.00 6.97','2026-06-09','Revised vetted BEP Civil/Mechanical GA & R/F of MPS, SHU and SBR has been submitted by the firm on Dt 25.10.2025 and approved by the Department except  Civil GA and R/F of SBR. SBR Civil work Completed, MPS & STP work is in progress. Date of start is given on 08.11.24. Date of completion of work is 05.02.2026 to M/s SKC Technocrat Pvt. Ltd (Formerly M/s Satish Kumar & Co.) & M/s. Geo Miller & Co. Pvt. Ltd. (JV), Reg. Office B-29, IIIrd Floor, RDC Rajnagar, Ghaziabad - 201013. AGREEMENT cost of project is Rs. 39,28,13,617.00. Land Issue Resolved in March 2025. The amount of mobilization advance has been claimed by the firm. BEP and GAD sent for vetting to IIT BHU VARANASI on 19.06.25 LD of Rs. 32.00 Lac has been imposed on firm for delay of work, as per contract agreement.','Firm delayed submission of Design and drawing.','LD has been imposed vide letter no- 422/790/33 Dt 22.09.2025 due to delay in approval of Design/Drawing.','2026-02-07','2026-06-07','2026-06-17 15:02:51'),(14,14,14,9,13,'I&D and STP works at Hathras Town','NGP','DBOT','2023-01-30',128.91,70.48,4.55,53.88,1,24.00,10,119.05,'2024-09-06','2026-06-05','','+2.79 52.00','+0.00 20.69','2026-06-08','Survey and soil investigation has been completed by firm Project was delayed as the land for STP was handed over in March 2025 by Nagar Palika Parishad Hathras. After that BEP is approved and structural drawings of SBR also vetted by IIT and at present excavation for SBR is in progress Date of start is 06.09.2024 and date of completion is 05.06.2024. Survey work is going on.','Land issued by NPP','Project Manager personally contacted the District Magistrate and requested to remove the potato crop, on which the District Magistrate talked to the Executive Officer over telephone and directed to remove the potato crop within 7 working days. As per the instructions of the District Magistrate, the construction work of STP could be started in the month of March 2025 after removing the potato crop from the land provided by the Executive Officer Municipal Council Hathras','2026-11-30','2026-06-05','2026-06-17 15:02:51'),(15,15,3,10,7,'I&D and STP works at Kosi Kalan Town, District Mathura','NGP','DBOT','2022-10-25',66.59,31.24,2.03,33.32,1,12.00,1,53.60,'2024-10-16','2026-07-15','','+0.31 46.26','+0.00 13.52','2026-06-08','Continous instruction has been given to firm for expediting the work. BEP of STP has been approved. Boundary wall construction work is going on at site. Preparation for PCC work of SBR basin is in progress, hindered due to rain at site. LOA has been issued on date 18.06.2024 and Date of start has been given 16.10.2024 to the firm. Survey work is going on Survey and soil investigation has been done by firm. Ground improvement work of SBR basin is completed, PCC work  is in progress.','Firm has taken additional time in initial document submission and ULB\'s continuous waste disposal at project site also hindered the work.','Letter had been written to ULB to stop waste disposal at site. It was stopped and site was cleared for the work. Additionally notices/letters has been written to the firm for expediting the progress. Now the firm has been expedited the work and SBR basin work is in progress.','2026-07-16','2026-07-16','2026-06-17 15:02:51'),(16,16,16,11,15,'I&D and STP works at Meerut','NGP2-EAP','HAM','2020-05-06',690.71,363.78,26.31,280.19,1,220.00,2,369.74,'2024-11-11','2026-11-10','','+0.58 56.84','+0.00 191.82','2026-06-08','QAP, Date Sheet and GAD of Decanter, Diffuser, Vortex Grit Chamber, Turbo Air Blower, Fine & Coarse Screens, Chlorination System & Leak Absorption System, RAS SAS, RSTP Pumps, Belt Filter Press, Gravity Belt Thickener, Screw Pumps approved. QAP, Date Sheet and GAD of Gas Flare System, under re-submission., RCC drawing & design Calculations of Odean Nala I&D under re-submission. GAD, Blower & Panel Building, SBR piping, HT panel & workshop, Security HT Panel-2  Metering Room, Electrical BEP, pending with Concessionaire. GAD of Odean Nala & Abu Nala-2 I&Ds under review with IIT Roorkee., RCC of Compound walls approved. . Payment for1st and 2nd MS have been released BEP, Layout and HFD approved for 220 MLD STP, 2 I&D’s & MPS, BEP of Treated Effluent Pipeline from Lohia Nagar STP to Outfall pending with Concessionaire, BEP of EPS and Pipeline pending with Concessionaire. \nGAD, Structural Design and Dwg. for Admin Building, SBR, CCT, Tonner Room approved\nQAP, Date Sheet and GAD of Decanter, Diffuser approved, QAP, Date Sheet and GAD of Air Blowers under review.,  Vortex Grit Remover approved by PE.\nGAD of Primary Clarifier approved by UPJN. , QAP, Date Sheet and GAD of Chlorination System pending with Concessionaire.\nQAP of Filter Belt Press pending with Concessionaire., Revised QAP of Pumps to be submitted by Concessionaire. Revised GAD of MPS pending with Concessionaire. Work in progress at only 1 front of STP, Concessionaire need to open multiple working fronts.\nInadequate Manpower deployment at site, Manpower deployment to be increased. ESIA/ ESMP under review with World Bank BEP of EPS and Pipeline works has been recommended by PE.','The 3rd and 4th milestones are delayed as the design and drawings have not been submitted by the firm. Due to this work not having started on different fronts.','','2027-02-21','2027-02-11','2026-06-17 15:02:51'),(17,17,10,12,16,'I&D and STP works at Saharanpur','NGP2-EAP','HAM','2022-06-16',577.23,266.34,20.55,290.34,1,135.00,61,343.88,'2025-11-01','2027-10-31','','+0.15 25.65','+0.00 46.62','2026-06-08','LOA issue on dt. 26.07.2024. CA signed on dated 27.09.2024. Financial Closure documents submitted in NMCG, is under scrutiny. About 6.0 m level differnces as given in tender document and actual site level. as discussed NMCG meeting held on 07.01.2025. In the review meeting on 25.04.25 at NMCG, UPJN-R/PE were asked to work out on the possible alternatives options like retaining wall option, backfilling option or others etc. Post which UPJN-R and PE had to work on optimization of the solution and comeback with all possible solution.\nAccordingly, additional cost implication worth Rs. 81 crore for STP due to level difference sent to NMCG on 21.04.25 Out of various feasible technical solutions to counter the implication arose due to mis-match of site data, option no. 4 has been approved in-principle by NMCG and communicated vide letter no. Pr-13011/1/2022 – O/o PS NMCG dated 03.10.2025. Concessionaire have to submit the detailed estimate with in one month. Effective date of start  01.11.2025  given to concessionaire vide Lt. 1077/122(Namami Gange)132 dt. 31.10.2025','','','2027-11-01','2027-11-01','2026-06-17 15:02:51'),(18,18,18,NULL,17,'Interception & Diversion Of 14 Untapped Drains Of Kanpur City (Along with Supplementary Works)','NGP2-NON EAP','DBOT','2025-05-02',138.11,97.17,7.77,2.03,0,0.00,14,79.39,'2026-01-09','2027-09-08','','+0.00 2.47','+0.00 0.00','2026-06-08','','','','2027-09-08','2027-07-08','2026-06-17 15:02:51'),(19,19,19,13,18,'Interception, Diversion of Balance 13 drains and Augmentation of Salori STP capacity by 43 MLD (Sewerage District-C) at Prayagraj Uttar Pradesh under DBOT mode','NGP','DBOT','2023-03-14',331.75,180.27,11.22,140.27,1,43.00,13,204.40,'2024-03-19','2025-08-18','','+0.04 94.82','+18.03 99.95','2026-06-08','Casting of 10th  Lift of Wall at AB Culvert SPS has been completed.Compound wall & Sinking  work is under progress 2670 m laying of Rising main completed. Balance Laying is under progress. Sitaram Ghat SPS- RCC work for wet well is under progress. 1600 m laying of gravity intercepter line has been completed. Manhole construction work is under progress. RCC work for I&D is under progress. 43 MLD Salori STP partially commissioned on dated 31.12.2025. RCC work for PTU, SBR Basin, CCT Unit, MCC Room ,Chlorination room, Air Blower, Sludge Dewatering Unit  & TEPS is completed. RCC work for chlorine tonner yard is under Progress. Tiles, putti, painting and other finishing work for all unit of STP is under Progress. RCC work completed  for Admin Building and Staff quarter, Brick work & Plaster is under progress.','Progress was hampered due to site submergence in 2024,  Construction of River front road, Mahakumbh-2025 and site submergence in 2025 during monsoon.','','2026-04-30','2026-04-30','2026-06-17 15:02:51'),(20,20,19,13,19,'Interception, Diversion of Balance 7 drains and Augmentation of Rajapur STP capacity by 90 MLD (Sewerage District-D) at Prayagraj Uttar Pradesh under DBOT mode','NGP','DBOT','2023-01-27',475.98,242.85,15.24,217.89,1,90.00,7,309.74,'2024-08-24','2026-02-23','','+0.81 80.34','+52.88 115.28','2026-06-08','Plinth Beam Casting is Completed for PTU, Column Casting is under Progress. RCC work &  Hydro test of SBR Basin 1,3& 4 is completed. Walkway & channel work is under progress RCC work & Hydro test of CCT  is completed. RCC work of TEPH  is completed. Mechanical work is in progress. RCC work of  workshop Building,sub station Building is completed, Finishing work is under progress. RCC work for Air Blower Building is completed . Finishing work is under progress. Admin Building &  BFP building - RCC work is under Progress. RCC work is under progress for  Rajapur 56 mld MPS. RCC work is under progress for Mumfordganj 39 mld MPS. Shifting of Existing Rising main inside Mumfordganj SPS Campus work is completed. 2950 m laying of Rising main completed. Balance Laying is under progress. 1272 m laying of Gravity main (Sadar Bazar) & 2342 m laying of Gravity main (Sankar Ghat) completed Balance Laying is under progress RCC work completed for 5 Nos I&D , work is under progress for 1 Nos. I&D. Work was hampered due to Vehical restriction and overcrowding during Mahakumbh -2025, River Front road construction and Flood in 2024 & 2025.','Work was hampered due to Vehical restriction and overcrowding during Mahakumbh -2025, River Front road construction and Flood in 2024 &2025.','','2026-02-23','2026-02-23','2026-06-17 15:02:51'),(21,21,19,13,20,'Interception, Diversion of Balance discharge of 02 drains and 50 MLD STP to Augment existing Treatment Capacity (80 MLD) Naini STP for Sewerage District-A at Prayagraj Uttar Pradesh under DBOT mode','NGP','DBOT','2023-09-05',186.47,83.71,5.44,97.32,1,50.00,2,95.57,'2025-03-04','2026-07-03','','+0.38 68.33','+28.87 37.35','2026-06-08','Gates and screen installation work in PTU is under progress Gas engine Building Excavation work started at site Concreting work of Grid Slab of SBR basin-1, 2 3 &4  is completed and shuttering, reinforcement and concreting work of basin wall - 1 2  3 & 4 upto 100% height is completed. Walkway work also completed . Gravel padding, PCC and Reinforcement of CCT raft  Wall  & Walkway is completed Excavation, Reinforcement and Concreting work upto slab level is completed in PTU Walkway work is completed. Piling work of I&D Structure is completed. Wet Well of SPS is completed. Casting of columns of claritubesettler is completed and shuttering work of beam and grade slab is completed. Staff quarter upto ground floor column is completed and Shuttering and reinforcement work for Ground Floor beam and slab is completed. Gravel padding, PCC and raft of Admin Building is completed and reinforcement & shuttering work of plinth beam is completed. Finishing work of Security Cabin is completed. Workshop Building Footing work is completed column work is in progress. Dewatering Building foundation completed Column work is also completed. Decenter Blower clorination system Gate Screen, Screw Press Screen and diffuser  is receieved at site. Approach bridge Pilling work in completed. BEP of 50 MLD STP has been approved. Structure design & drawing of SBR, Claritube settler, Staff quarter, CCT, PTU, Admin Building cum Blower Room and Workshop Building has been approved. Excavation, PCC of work shop building is completed Column work is under progress. Soil testing of STP & SPS site has been completed. BEP and Structure design and drawing has been Approved for 2.90 MLD Bargad Ghat SPS. Survey, Design and Drawing work of remaining structure is in progress.','Site submergence during flood period. \nFirm has requested for technology change and the same was rejected by NMCG, New Delhi on dated 27.05.2025','Notice regarding LD has been issued to the firm for delay','2026-07-03','2026-07-03','2026-06-17 15:02:51'),(22,22,3,16,21,'Mathura sewerage scheme (I&D and STP Works for balance drain)','NGP2-NON EAP','HAM','2022-09-07',292.56,149.85,9.61,133.10,1,60.00,4,240.01,'2024-11-30','2026-11-29','','+0.83 84.27','+0.00 155.37','2026-06-08','LOA issued to L1 Bidder on on 27.09.2023. CA signed on 12.12.2023. Effective date of start shall be to concessionaire after financial closure. Effective date of start has been given to concessionaire as 30.11.2024. IPS Kala Patthar civil work and its Rising main has been completed SBR basin and MPS construction work is in progress in STP premises. Dairy farm IPS rising main laying work is in progress.','No Delay','-','2026-11-30','2026-11-30','2026-06-17 15:02:51'),(23,23,23,NULL,22,'Pollution Abatement Of Gomti River (Phase 1 Part 1) Lucknow','NGP','DBOT','2024-07-29',240.93,123.45,6.97,110.51,2,42.50,2,187.90,'2024-09-07','2026-06-06','','+0.02 92.56','+0.00 128.44','2026-06-09','39 MLD STP Daulatganj Operation & Maintenance started on dt. 05.11.2024. SBR Basin -Hydro testing work completed.  CCT -  Hydro testing work completed.  MPS - Sump wall 7th lift and coarse screen chamber wall 3rd lift reinforcement & shuttering work is in progress. PTU - Wall reinforcement, shuttering and casting work is in progress. HT Building - Plaster work is in progress. Admin Building - Ist floor roof slab shuttering work is in progress.  SHU - Column above Plinth beam work is in progress. Transformer yard - Casting work is completed. DG Platform - Casting work is completed. Supply of Decanter & Defuser completed. Supply of PLC Panel, Motor of MPS, RAS, SAS Pump  & Blower completed. Decanter installation work is in progress.','Slow progress by firm.','L.D. imposed Rs. 66,74,000.00 on firm','2026-06-06','2026-07-06','2026-06-17 15:02:51'),(24,24,23,17,22,'Pollution Abatement of Gomti River (Phase-II, Part-I) Lucknow','NGP','DBOT','2023-01-30',264.67,137.55,8.53,118.60,1,50.00,3,187.74,'2024-06-14','2026-03-13','','+0.44 22.70','+0.00 24.12','2026-06-09','Design & Drawing work is in progress. SBR Basin  4 - Common wall 3rd lift reinforcement, shuttering and casting work is in progress. SBR Basin 3- Decanter wall 3rd lift and selector zone wall 3rd lift reinforcement shuttering & casting work is in progress. SBR Basin 2 - Selector zone  outer wall 3rd lift reinforcement, shuttering and casting work is in progress. SBR Basin 1 -Excavation work is in progress. IPS - Wall 1st lift reinforcement & shuttering  work is in progress. Faizullaganj (U/S) I&D - Approach drain excavation, PCC, reinforcement, shuttering and casting work is in progress.','Slow progress by firm.','L.D. imposed Rs. 64,13,000.00 on firm','2026-04-13','2026-04-13','2026-06-17 15:02:51');
/*!40000 ALTER TABLE `sewerage_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:01
CREATE DATABASE  IF NOT EXISTS `weekly_progress_of_namami_gange_undertendering_projects` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `weekly_progress_of_namami_gange_undertendering_projects`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: weekly_progress_of_namami_gange_undertendering_projects
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
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `district_id` int NOT NULL,
  `city_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`city_id`),
  KEY `district_id` (`district_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,1,'Aligarh'),(2,2,'nan'),(3,3,'Lucknow'),(4,4,'nan'),(5,5,'Bhadohi'),(6,6,'nan');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `district_id` int NOT NULL AUTO_INCREMENT,
  `district_name` varchar(255) NOT NULL,
  PRIMARY KEY (`district_id`),
  UNIQUE KEY `district_name` (`district_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'Aligar'),(2,'Chandauli'),(3,'Lucknow'),(4,'Moradabad'),(5,'Sant Ravidas Nagar'),(6,'Varanasi');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `undertendering_projects`
--

DROP TABLE IF EXISTS `undertendering_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `undertendering_projects` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `sr_no` int DEFAULT NULL,
  `district_id` int NOT NULL,
  `city_id` int DEFAULT NULL,
  `project_name` text,
  `scheme_type` varchar(100) DEFAULT NULL,
  `project_mode` varchar(100) DEFAULT NULL,
  `sanction_date` date DEFAULT NULL,
  `sanction_cost` decimal(12,2) DEFAULT NULL,
  `work_cost` decimal(12,2) DEFAULT NULL,
  `centage` decimal(12,2) DEFAULT NULL,
  `om_cost` decimal(12,2) DEFAULT NULL,
  `stp_count` int DEFAULT NULL,
  `stp_capacity` decimal(12,2) DEFAULT NULL,
  `drain_count` int DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `remarks` longtext,
  `scrape_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_id`),
  KEY `district_id` (`district_id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `undertendering_projects_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`),
  CONSTRAINT `undertendering_projects_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `undertendering_projects`
--

LOCK TABLES `undertendering_projects` WRITE;
/*!40000 ALTER TABLE `undertendering_projects` DISABLE KEYS */;
INSERT INTO `undertendering_projects` VALUES (1,1,1,1,'Aligarh Sewerage Scheme (I&D And STP Works)','NGP2-NON EAP','HAM','2024-10-21',496.02,240.02,15.12,240.88,2,113.00,2,'2026-06-16','NOC has been received from NMCG regarding retendering on dt. 21.01.2026 | Draft Tender document has been sent to NMCG for review on dt. 11.02.2026 | Approval on the Draft Tender document has been received from to NMCG on dt. 10.04.2026 | NIT has been published on E-Tender portal on dt. 10.04.2026 | Last date of bid submission is 25.05.2026 | Prebid meeting has been done on 20.04.2026. | prebid query reply has been sent to NMCG on dt 18-05-2026, which is under review. | Last date for bid submission has been extended upto 24-06-2026,as per NMCG instructions. | Approved prebid-reply uploaded on e-tender portal on dated 09-06-2026','2026-06-16 12:16:10'),(2,2,2,2,'I&D and STP works at Pt Deen Dayal Upadhyay Nagar Chandauli','NGP2-NON EAP','HAM','2025-01-22',262.78,95.00,7.60,129.67,1,45.00,2,'2026-05-26','Pre-bid reply sent to NMCG for approval on 14.08.2025 after approval from CE(Ganga) and SMCG | Pre-bid meeting held on 09.07.2025 | Bids will be opened on 19.08.2025 | Draft Pre-bid reply sent to CE(Ganga) on 04.08.2025 | Approved RFP Documents received from NMCG on 18.06.2025. NIT Shall be issued on 21.06.2025 | Date for bid opening extended upto 04.09.2025 | Date of bid opening is 07.10.2025 | AAE&S issued on 22.01.2025 | Revised model RFP Document received from NMCG on 06.05.2025, RFP sent to NMCG on 23.05.2025 for approval | Financial bids opened on 07.01.2026. CBER sent to NMCG on 03.02.2026 for approval | Approval of CBER received from NMCG on 20.02.2026 and communicated by CE(Ganga) on 23.02.2026 | M/s Enviro Infra Engineers Limited has been selected as L1 bidder | LOA issued on 25.02.2026 | Bidder vide its letter  03.03.3036 has requested to waive off the APS imposed for which guidance has been sought from HQ | Letter written to NMCG on 19.05.2026 to take decision about the APS imposed | NIT issued on 21.06.2025. Tender also published on e-Tender portal on 24.06.2025 | Bids opened on 07.10.2025. Technical evaluation in process','2026-06-16 12:16:10'),(3,3,3,3,'Pollution Abatement of Gomti River (Phase-II, Part-II ) Lucknow','NGP','HAM','2023-09-19',351.03,207.99,13.14,129.90,1,100.00,1,'2026-06-15','Concessionaire Agreement has been signed on dt. 26.08.2025. Financial closure is in progress.','2026-06-16 12:16:10'),(4,4,4,4,'Prevention of Pollution of River Ramganga at Moradabad  under zone-3 & 4 construction of Interception & Diversion (I&D) of Drains and Sewerage Treatment Plant','NMCG','HAM','2025-05-02',420.41,238.53,14.14,181.87,2,80.00,5,'2026-04-21','DPR for interception and diversion works of 5 Untapped drains of Moradabad Zone 3 & Zone 4 along with 2 STP (15 MLD & 65 MLD) works is sanctioned by NMCG New Delhi on dated 02-05-2025 | Tender document of Zone 3 & 4 has been sent to NMCG on dated 30.06.2025 | All Documents Related to tendering has been send to NMCG by email on dated 02-08-2025 | A Query was  raised by NMCG regarding BOD value of Karula drain. therefore combined sampling by U.P.J.N Team & UPPCB Team has been done on date 04-10-2025. Results are Awaited. | The Moradabad Municipal Corporation is to provide land for the construction of the STP in Zone 4, but it has not yet been purchased/made available. Continuous requests are being made to the Moradabad Municipal Corporation regarding this matter. | The reply of the queries received in the pre-bid meeting of the e-tender invited for construction of STPs in Zone-3 and Zone-4 under Namami Gange Programme were sent to NMCG by email on 03.02.2026, which have been approved by NMCG vide letter no. Pr 22012/5/2025 NMCG dated 03.03.2026. | which have been publish on e-tender portal vide letter no. 138/nivida/10 dt 06.03.2026.. The proposed last date for uploading and opening the bids of the said invited e-tender is 15.04.2026. | The said e-tender was opened in this office on 15.04.2026 at 16.00 hrs. The technical evaluation of the bids received in the e-tender is in progress.','2026-06-16 12:16:10'),(5,5,5,5,'Interception and Diversion of Drains/Nala Falling in Varuna River and STP for Bhadohi Town','NGP2-NON EAP','DBOT','2025-03-06',127.26,52.86,4.23,54.69,3,25.00,3,'2026-05-26','AAE&S issued on 06.03.2025 | draft Tender Documents sent to NMCG for approval on 10.06.2025. Approval awaited | Comments on draft documents are received from NMCG to which compliance shall be sent by 17.07.2025 | NIT issued on 31.07.2025 | Bids will be opened on 10.09.2025 | Pre Bid meeting scheduled on 18.08.2025 | Pre-bid meeting held on 18.08.2025. Reply to queries shall be sent by 24.08.2025 | Reply to query sent to CE(Ganga) on 24.08.2025 and after discussion sent to NMCG on 01.09.2025 | Bids will be opened on 09.10.2025 | Financial bids opened on 05.01.2026. CBER sent to NMCG on 03.02.2026 for approval | LOA issued on 12.05.2026 | Bids opened on 09.10.2025. technical evaluation in process','2026-06-16 12:16:10'),(6,6,6,6,'I&D and STP works for Durga Drain (Sewerage District-IV), Varanasi','NGP2-NON EAP','HAM','2025-03-06',274.31,107.70,8.61,97.50,1,60.00,1,'2026-05-26','RFP invited on 27.06.2025 and bids shall be opened on 12.08.2025 | Pre bid meeting held on 15.07.2025 | Pre-bid reply sent to NMCG on 18.08.2025 after discussion with CE(Ganga) and SMCG | Bid submission date extended upto 27.08.2025 | Bid submission extended upto 12.09.2025 | Bids will be opened on 07.10.2025 | Bids opened on 07.10.2025. technical evaluation in process | Financial bids opened on 07.01.2026. CBER sent to NMCG on 03.02.2026 for approval | Approval of CBER received from NMCG on 18.02.2026 and communicated by CE(Ganga) on 20.02.2026 | M/s Enviro Infra Engineers Limited has been selected as L1 bidder | AAE&S issued on 06.03.2025 | Revised Draft RFP Document received from NMCG on 06.05.2025, RFP shall be sent to NMCG by 29.05.2025 for approval | Daft RFP documents were sent to NMCG on which comments were received on 18.06.2025. Compliance/clarifications sent on 19.06.2025 | Final approved RFP documents received from NMCG on 23.06.2025. RFP shall be floated by 27.06.2025 | Bidder vide its letter  03.03.3036 has requested to waive off the APS imposed for which guidance has been sought from HQ | Letter written to NMCG on 19.05.2026 to take decision about the APS imposed','2026-06-16 12:16:10');
/*!40000 ALTER TABLE `undertendering_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:01
CREATE DATABASE  IF NOT EXISTS `citywise_discharge_stp_capacity_and_gap_analysis_audit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `citywise_discharge_stp_capacity_and_gap_analysis_audit`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: citywise_discharge_stp_capacity_and_gap_analysis_audit
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
  `district_name` varchar(100) NOT NULL,
  PRIMARY KEY (`district_id`),
  UNIQUE KEY `district_name` (`district_name`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'Agra'),(2,'Aligarh'),(3,'Ambedkar Nagar'),(4,'Amethi'),(5,'Amroha'),(6,'Auraiya'),(7,'Ayodhya'),(8,'Azamgarh'),(9,'Baghpat'),(10,'Ballia'),(11,'Banda'),(12,'Barabanki'),(13,'Bareilly'),(14,'Bijnor'),(15,'Bulandshahr'),(16,'Chandauli'),(17,'Chitrakoot'),(18,'Deoria'),(19,'Etah'),(20,'Etawah'),(21,'Farrukhabad'),(22,'Fatehpur'),(23,'Firozabad'),(24,'Gautam Buddha Nagar'),(25,'Ghaziabad'),(26,'Ghazipur'),(27,'Gorakhpur'),(28,'Hamirpur'),(29,'Hapur'),(30,'Hardoi'),(31,'Hathras'),(32,'Jalaun'),(33,'Jaunpur'),(34,'Jhansi'),(35,'Kannauj'),(36,'Kanpur Dehat'),(37,'Kanpur Nagar'),(38,'Kasganj'),(39,'Kaushambi'),(40,'Lakhimpur Kheri'),(41,'Lalitpur'),(42,'Lucknow'),(43,'Mahoba'),(44,'Mainpuri'),(45,'Mathura'),(46,'Mau'),(47,'Meerut'),(48,'Mirzapur'),(49,'Moradabad'),(50,'Muzaffarnagar'),(51,'Pilibhit'),(52,'Pratapgarh'),(53,'PrayagRaj'),(54,'Rae Bareli'),(55,'Rampur'),(56,'Saharanpur'),(57,'Sambhal'),(58,'Sant Ravidas Nagar'),(59,'Shahjahanpur'),(60,'Shamli'),(61,'Sitapur'),(62,'Sonbhadra'),(63,'Sultanpur'),(64,'Unnao'),(65,'Varanasi');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drainage_stp_statistics`
--

DROP TABLE IF EXISTS `drainage_stp_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drainage_stp_statistics` (
  `drainage_stat_id` int NOT NULL AUTO_INCREMENT,
  `town_river_id` int NOT NULL,
  `tapped_partial_untapped_drains` int DEFAULT NULL,
  `not_to_be_tapped_drains` int DEFAULT NULL,
  `total_drains` int DEFAULT NULL,
  `discharge_through_drains_mld` decimal(10,2) DEFAULT NULL,
  `discharge_through_sewer_network_mld` decimal(10,2) DEFAULT NULL,
  `total_discharge_mld` decimal(10,2) DEFAULT NULL,
  `no_of_existing_stp` int DEFAULT NULL,
  `capacity_of_existing_stp` decimal(10,2) DEFAULT NULL,
  `utilization_capacity_of_existing_stp` decimal(10,2) DEFAULT NULL,
  `gap_installed_capacity_population_flow` decimal(10,2) DEFAULT NULL,
  `gap_utilization_capacity_population_flow` decimal(10,2) DEFAULT NULL,
  `gap_installed_capacity_actual_discharge` decimal(10,2) DEFAULT NULL,
  `gap_utilization_capacity_actual_discharge` decimal(10,2) DEFAULT NULL,
  `no_of_stp_under_construction` int DEFAULT NULL,
  `capacity_of_stp_under_construction` decimal(10,2) DEFAULT NULL,
  `no_of_stp_under_tendering` int DEFAULT NULL,
  `capacity_of_stp_under_tendering` decimal(10,2) DEFAULT NULL,
  `capacity_proposed` decimal(10,2) DEFAULT NULL,
  `total_capacity_mld` decimal(10,2) DEFAULT NULL,
  `sewage_gap_mld` decimal(10,2) DEFAULT NULL,
  `gap_based_on_population_mld` decimal(10,2) DEFAULT NULL,
  `remark` text,
  `scrape_time` datetime DEFAULT NULL,
  PRIMARY KEY (`drainage_stat_id`),
  UNIQUE KEY `town_river_id` (`town_river_id`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drainage_stp_statistics`
--

LOCK TABLES `drainage_stp_statistics` WRITE;
/*!40000 ALTER TABLE `drainage_stp_statistics` DISABLE KEYS */;
INSERT INTO `drainage_stp_statistics` VALUES (1,1,90,0,90,286.85,88.00,374.85,9,220.75,191.75,-65.32,-94.32,-154.10,-183.10,13,177.60,0,0.00,0.00,398.35,23.50,112.28,'After construction of 13 Nos STPs of total capacity 177.60  MLD there will be no gap in Agra City','2026-06-09 16:18:57'),(2,2,2,6,8,136.89,12.20,149.09,1,45.00,45.00,-76.55,-76.55,-104.09,-104.09,0,0.00,0,0.00,113.00,158.00,8.91,36.45,'DPR for proposed 65 & 48 MLD STP has been sanctioned in the 57th EC meeting of NMCG for amount 487.54 cr.','2026-06-09 16:18:57'),(3,3,6,0,6,19.41,0.00,19.41,0,0.00,0.00,-15.70,-15.70,-19.41,-19.41,0,0.00,0,0.00,0.00,0.00,0.00,-15.70,NULL,'2026-06-09 16:18:57'),(4,4,8,0,8,11.68,0.00,11.68,0,0.00,0.00,-11.99,-11.99,-11.68,-11.68,0,0.00,0,0.00,15.00,15.00,3.32,3.01,NULL,'2026-06-09 16:18:57'),(5,5,0,1,1,0.00,0.00,0.00,0,0.00,0.00,-3.71,-3.71,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.71,NULL,'2026-06-09 16:18:57'),(6,6,0,1,1,0.00,0.00,0.00,0,0.00,0.00,-30.24,-30.24,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-30.24,NULL,'2026-06-09 16:18:57'),(7,7,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.25,-1.25,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.25,NULL,'2026-06-09 16:18:57'),(8,8,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.51,-1.51,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.51,NULL,'2026-06-09 16:18:57'),(9,9,2,0,2,16.46,0.00,16.46,0,0.00,0.00,-12.42,-12.42,-16.46,-16.46,0,0.00,0,0.00,0.00,0.00,0.00,-12.42,NULL,'2026-06-09 16:18:57'),(10,10,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-4.16,-4.16,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-4.16,NULL,'2026-06-09 16:18:57'),(11,11,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-4.83,-4.83,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-4.83,NULL,'2026-06-09 16:18:57'),(12,12,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-4.19,-4.19,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-4.19,NULL,'2026-06-09 16:18:57'),(13,13,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.41,-2.41,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.41,NULL,'2026-06-09 16:18:57'),(14,14,21,0,21,30.87,12.50,43.37,2,18.00,16.00,-32.32,-34.32,-25.37,-27.37,1,33.00,0,0.00,0.00,51.00,7.63,0.68,NULL,'2026-06-09 16:18:57'),(15,15,22,0,22,22.46,0.00,22.46,0,0.00,0.00,-2.26,-2.26,-22.46,-22.46,1,8.00,0,0.00,0.00,8.00,0.00,5.74,NULL,'2026-06-09 16:18:57'),(16,16,4,0,4,8.60,0.00,8.60,1,14.00,8.60,4.00,-1.40,5.40,0.00,0,0.00,0,0.00,0.00,14.00,5.40,4.00,NULL,'2026-06-09 16:18:57'),(17,17,1,0,1,12.10,0.00,12.10,0,0.00,0.00,-14.67,-14.67,-12.10,-12.10,1,20.00,0,0.00,0.00,20.00,7.90,5.33,NULL,'2026-06-09 16:18:57'),(18,18,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-5.93,-5.93,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-5.93,NULL,'2026-06-09 16:18:57'),(19,19,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.93,-1.93,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.93,NULL,'2026-06-09 16:18:57'),(20,20,1,0,1,10.44,0.00,10.44,0,0.00,0.00,-21.17,-21.17,-10.44,-10.44,0,0.00,0,0.00,0.00,0.00,0.00,-21.17,'Bioremediation treatment is being done by Nagar palika ,Banda.','2026-06-09 16:18:57'),(21,21,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.52,-1.52,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.52,NULL,'2026-06-09 16:18:57'),(22,22,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.21,-1.21,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.21,NULL,'2026-06-09 16:18:57'),(23,23,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.79,-1.79,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.79,NULL,'2026-06-09 16:18:57'),(24,24,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.98,-0.98,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.98,NULL,'2026-06-09 16:18:57'),(25,25,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.58,-1.58,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.58,NULL,'2026-06-09 16:18:57'),(26,26,1,0,1,18.00,0.00,18.00,0,0.00,0.00,-13.94,-13.94,-18.00,-18.00,0,0.00,0,0.00,0.00,0.00,0.00,-13.94,NULL,'2026-06-09 16:18:57'),(27,27,1,0,1,0.87,25.00,25.87,2,36.00,26.00,-87.58,-97.58,10.13,0.13,0,0.00,0,0.00,0.00,36.00,10.13,-87.58,NULL,'2026-06-09 16:18:57'),(28,28,11,2,13,41.21,0.00,41.21,1,42.00,43.03,-81.58,-80.55,0.79,1.82,0,0.00,0,0.00,0.00,42.00,0.79,-81.58,NULL,'2026-06-09 16:18:57'),(29,29,1,0,1,18.82,0.00,18.82,1,20.00,18.57,-103.58,-105.01,1.18,-0.25,0,0.00,0,0.00,0.00,20.00,1.18,-103.58,'25 mld stp with sewer network is proposed under Amrut.2','2026-06-09 16:18:57'),(30,30,2,1,3,11.05,0.00,11.05,1,24.00,21.41,9.42,6.83,12.95,10.36,0,0.00,0,0.00,0.00,24.00,12.95,9.42,NULL,'2026-06-09 16:18:57'),(31,31,2,0,2,2.56,2.50,5.06,4,5.06,3.80,1.07,-0.19,0.00,-1.26,0,0.00,0,0.00,0.00,5.06,0.00,1.07,NULL,'2026-06-09 16:18:57'),(32,32,2,14,16,24.00,15.00,39.00,1,40.00,15.00,-0.36,-25.36,1.00,-24.00,0,0.00,0,0.00,0.00,40.00,1.00,-0.36,NULL,'2026-06-09 16:18:57'),(33,33,1,0,1,6.91,0.00,6.91,0,0.00,0.00,-6.91,-6.91,-6.91,-6.91,0,0.00,0,0.00,10.00,10.00,3.09,3.09,'ok','2026-06-09 16:18:57'),(34,34,1,0,1,2.50,3.50,6.00,2,6.25,5.75,3.01,2.51,0.25,-0.25,0,0.00,0,0.00,0.00,6.25,0.25,3.01,NULL,'2026-06-09 16:18:57'),(35,35,2,0,2,29.33,0.00,29.33,0,0.00,0.00,-18.13,-18.13,-29.33,-29.33,0,0.00,0,0.00,45.00,45.00,15.67,26.87,'DPR for I&D and 45 MLD STP approved by NMCG on 22.01.2025. Revised Draft RFP Document received from NMCG on 06.05.2025, RFP shall be sent to NMCG by 22.05.2025 for approval','2026-06-09 16:18:57'),(36,36,16,0,16,0.00,0.00,0.00,1,3.42,3.42,1.99,1.99,3.42,3.42,0,0.00,0,0.00,0.00,3.42,3.42,1.99,NULL,'2026-06-09 16:18:57'),(37,37,1,0,1,5.00,0.00,5.00,0,0.00,0.00,-1.17,-1.17,-5.00,-5.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.17,NULL,'2026-06-09 16:18:57'),(38,38,11,0,11,1.38,0.00,1.38,0,0.00,0.00,-6.48,-6.48,-1.38,-1.38,0,0.00,0,0.00,6.00,6.00,4.62,-0.48,NULL,'2026-06-09 16:18:57'),(39,39,2,0,2,2.45,0.00,2.45,0,0.00,0.00,-3.82,-3.82,-2.45,-2.45,0,0.00,0,0.00,3.00,3.00,0.55,-0.82,NULL,'2026-06-09 16:18:57'),(40,40,1,0,1,4.00,12.00,16.00,1,24.00,24.00,7.80,7.80,8.00,8.00,0,0.00,0,0.00,0.00,24.00,8.00,7.80,'There is no gap at present','2026-06-09 16:18:57'),(41,41,0,0,0,0.00,1.40,1.40,1,1.60,1.60,-0.40,-0.40,0.20,0.20,0,0.00,0,0.00,0.00,1.60,0.20,-0.40,'There is no gap at present','2026-06-09 16:18:57'),(42,42,2,0,2,30.99,0.00,30.99,3,44.95,36.50,12.03,3.58,13.96,5.51,0,0.00,0,0.00,0.00,44.95,13.96,12.03,'There is no gap at present','2026-06-09 16:18:57'),(43,43,4,1,5,29.38,0.00,29.38,1,30.00,22.00,-7.69,-15.69,0.62,-7.38,0,0.00,0,0.00,0.00,30.00,0.62,-7.69,'Tapped to 30 mld STP Farrukhabad.','2026-06-09 16:18:57'),(44,44,3,0,3,10.34,0.00,10.34,1,17.70,13.00,17.70,13.00,7.36,2.66,0,0.00,0,0.00,0.00,17.70,7.36,17.70,'Tapped to 17.70 MLD STP at Fatehgarh.','2026-06-09 16:18:57'),(45,45,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-4.28,-4.28,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-4.28,NULL,'2026-06-09 16:18:57'),(46,46,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.03,-2.03,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.03,NULL,'2026-06-09 16:18:57'),(47,47,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.47,-1.47,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.47,NULL,'2026-06-09 16:18:57'),(48,48,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.54,-3.54,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.54,NULL,'2026-06-09 16:18:57'),(49,49,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.29,-3.29,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.29,NULL,'2026-06-09 16:18:57'),(50,50,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.24,-3.24,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.24,NULL,'2026-06-09 16:18:57'),(51,51,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.74,-2.74,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.74,NULL,'2026-06-09 16:18:57'),(52,52,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.97,-3.97,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.97,NULL,'2026-06-09 16:18:57'),(53,53,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-26.35,-26.35,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-26.35,NULL,'2026-06-09 16:18:57'),(54,54,2,0,2,54.26,5.50,59.76,2,70.00,49.00,-23.00,-44.00,10.24,-10.76,0,0.00,0,0.00,0.00,70.00,10.24,-23.00,'There is no gap at present','2026-06-09 16:18:57'),(55,55,1,0,1,13.00,85.00,98.00,5,174.00,69.50,76.00,-28.50,76.00,-28.50,0,0.00,0,0.00,0.00,174.00,76.00,76.00,NULL,'2026-06-09 16:18:57'),(56,56,1,0,1,15.00,117.00,132.00,8,411.00,309.00,279.00,177.00,279.00,177.00,0,0.00,0,0.00,0.00,411.00,279.00,279.00,NULL,'2026-06-09 16:18:57'),(57,57,8,0,8,306.49,0.00,306.49,11,535.00,438.50,166.42,69.92,228.51,132.01,0,0.00,0,0.00,0.00,535.00,228.51,166.42,NULL,'2026-06-09 16:18:57'),(58,58,0,0,0,0.00,0.00,0.00,1,3.00,3.00,-365.58,-365.58,3.00,3.00,0,0.00,0,0.00,0.00,3.00,3.00,-365.58,NULL,'2026-06-09 16:18:57'),(59,59,2,0,2,52.00,0.00,52.00,1,21.50,21.50,-347.08,-347.08,-30.50,-30.50,0,0.00,0,0.00,0.00,21.50,0.00,-347.08,NULL,'2026-06-09 16:18:57'),(60,60,0,23,23,0.00,0.00,0.00,1,21.00,2.50,5.50,-13.00,21.00,2.50,0,0.00,0,0.00,0.00,21.00,21.00,5.50,NULL,'2026-06-09 16:18:57'),(61,61,8,0,8,5.30,0.00,5.30,0,0.00,0.00,-3.35,-3.35,-5.30,-5.30,0,0.00,0,0.00,0.00,0.00,0.00,-3.35,NULL,'2026-06-09 16:18:57'),(62,62,3,0,3,4.41,0.00,4.41,0,0.00,0.00,-4.58,-4.58,-4.41,-4.41,0,0.00,0,0.00,0.00,0.00,0.00,-4.58,NULL,'2026-06-09 16:18:57'),(63,63,7,0,7,3.57,0.00,3.57,0,0.00,0.00,-4.11,-4.11,-3.57,-3.57,0,0.00,0,0.00,0.00,0.00,0.00,-4.11,NULL,'2026-06-09 16:18:57'),(64,64,24,0,24,47.82,0.00,47.82,3,50.00,0.00,-74.38,-124.38,2.18,-47.82,0,0.00,0,0.00,0.00,50.00,2.18,-74.38,NULL,'2026-06-09 16:18:57'),(65,65,9,0,9,49.96,0.00,49.96,0,0.00,0.00,-124.38,-124.38,-49.96,-49.96,0,0.00,0,0.00,44.00,44.00,0.00,-80.38,'Revised DPR will be submitted by 15/04/2025','2026-06-09 16:18:57'),(66,66,6,0,6,27.00,0.00,27.00,1,10.00,0.00,-114.38,-124.38,-17.00,-27.00,1,30.00,0,0.00,0.00,40.00,13.00,-84.38,NULL,'2026-06-09 16:18:57'),(67,67,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.93,-0.93,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.93,NULL,'2026-06-09 16:18:57'),(68,68,2,0,2,2.80,0.00,2.80,0,0.00,0.00,-4.39,-4.39,-2.80,-2.80,0,0.00,0,0.00,0.00,0.00,0.00,-4.39,'DPR for I&D work of this drain has been sent to SBM Nideshalay for approval by UPJN (U) in October,2023.','2026-06-09 16:18:57'),(69,69,1,0,1,1.40,0.00,1.40,0,0.00,0.00,-4.39,-4.39,-1.40,-1.40,0,0.00,0,0.00,0.00,0.00,0.00,-4.39,'DPR for I&D work of this drain has been sent to SBM Nideshalay for approval by UPJN (U) in October,2023.','2026-06-09 16:18:57'),(70,70,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.87,-1.87,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.87,NULL,'2026-06-09 16:18:57'),(71,71,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-5.10,-5.10,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-5.10,NULL,'2026-06-09 16:18:57'),(72,72,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-8.51,-8.51,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-8.51,NULL,'2026-06-09 16:18:57'),(73,73,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.22,-1.22,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.22,NULL,'2026-06-09 16:18:57'),(74,74,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-6.15,-6.15,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-6.15,NULL,'2026-06-09 16:18:57'),(75,75,2,0,2,7.50,0.00,7.50,2,9.00,7.50,2.85,1.35,1.50,0.00,0,0.00,0,0.00,0.00,9.00,1.50,2.85,NULL,'2026-06-09 16:18:57'),(76,76,1,0,1,6.00,0.00,6.00,1,30.00,7.00,-6.29,-29.29,24.00,1.00,0,0.00,1,6.00,0.00,36.00,30.00,-0.29,NULL,'2026-06-09 16:18:57'),(77,77,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.72,-0.72,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.72,NULL,'2026-06-09 16:18:57'),(78,78,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-4.08,-4.08,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-4.08,NULL,'2026-06-09 16:18:57'),(79,79,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.10,-1.10,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.10,NULL,'2026-06-09 16:18:57'),(80,80,0,1,1,0.00,0.00,0.00,0,0.00,0.00,-27.04,-27.04,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-27.04,'Sample Was Taken At Confluence Point Of Chhuiya Drain At Sai River. DIscharge was found very less. DPR for sewerage system is being prepared by U.P.Jal Nigam(Urban).','2026-06-09 16:18:57'),(81,81,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.11,-1.11,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.11,NULL,'2026-06-09 16:18:57'),(82,82,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.42,-0.42,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.42,NULL,'2026-06-09 16:18:57'),(83,83,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.82,-0.82,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.82,NULL,'2026-06-09 16:18:57'),(84,84,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-5.07,-5.07,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-5.07,NULL,'2026-06-09 16:18:57'),(85,85,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.33,-1.33,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.33,NULL,'2026-06-09 16:18:57'),(86,86,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-4.94,-4.94,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-4.94,NULL,'2026-06-09 16:18:57'),(87,87,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.57,-3.57,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.57,NULL,'2026-06-09 16:18:57'),(88,88,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-8.01,-8.01,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-8.01,NULL,'2026-06-09 16:18:57'),(89,89,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-11.01,-11.01,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-11.01,NULL,'2026-06-09 16:18:57'),(90,90,10,0,10,16.32,3.90,20.22,0,0.00,0.00,-18.86,-18.86,-20.22,-20.22,1,24.00,0,0.00,0.00,24.00,3.78,5.14,'After construction of 1 No STP 24 MLD  there will be no gap','2026-06-09 16:18:57'),(91,91,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.88,-1.88,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.88,NULL,'2026-06-09 16:18:57'),(92,92,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-7.39,-7.39,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-7.39,NULL,'2026-06-09 16:18:57'),(93,93,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.13,-2.13,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.13,NULL,'2026-06-09 16:18:57'),(94,94,1,0,1,11.00,0.00,11.00,0,0.00,0.00,-6.70,-6.70,-11.00,-11.00,0,0.00,0,0.00,0.00,0.00,0.00,-6.70,'DPR for I&D and STP works has been sanctioned under SBM 2 (UPJN-U)','2026-06-09 16:18:57'),(95,95,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-6.43,-6.43,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-6.43,NULL,'2026-06-09 16:18:57'),(96,96,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.04,-1.04,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.04,NULL,'2026-06-09 16:18:57'),(97,97,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.82,-1.82,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.82,NULL,'2026-06-09 16:18:57'),(98,98,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.04,-1.04,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.04,NULL,'2026-06-09 16:18:57'),(99,99,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-27.25,-27.25,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-27.25,NULL,'2026-06-09 16:18:57'),(100,100,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.80,-1.80,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.80,NULL,'2026-06-09 16:18:57'),(101,101,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.15,-1.15,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.15,NULL,'2026-06-09 16:18:57'),(102,102,14,0,14,23.44,0.00,23.44,1,30.00,26.50,1.83,-1.67,6.56,3.06,0,0.00,0,0.00,0.00,30.00,6.56,1.83,NULL,'2026-06-09 16:18:57'),(103,103,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.12,-1.12,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.12,NULL,'2026-06-09 16:18:57'),(104,104,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.35,-3.35,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.35,NULL,'2026-06-09 16:18:57'),(105,105,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.11,-2.11,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.11,NULL,'2026-06-09 16:18:57'),(106,106,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.26,-1.26,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.26,NULL,'2026-06-09 16:18:57'),(107,107,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.61,-1.61,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.61,NULL,'2026-06-09 16:18:57'),(108,108,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.57,-3.57,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.57,NULL,'2026-06-09 16:18:57'),(109,109,10,0,10,42.00,0.00,42.00,2,52.00,0.00,-14.64,-66.64,10.00,-42.00,0,0.00,0,0.00,0.00,52.00,10.00,-14.64,'Tapped in Existing 26.00 MLD STP at Shivpuri Road maintained by Jhansi Nagar nigam. and 26 MLD STP Laxmital maintained by UPJN(U).','2026-06-09 16:18:57'),(110,110,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.00,-1.00,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.00,NULL,'2026-06-09 16:18:57'),(111,111,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-8.03,-8.03,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-8.03,NULL,'2026-06-09 16:18:57'),(112,112,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.59,-1.59,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.59,NULL,'2026-06-09 16:18:57'),(113,113,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.32,-2.32,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.32,NULL,'2026-06-09 16:18:57'),(114,114,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.75,-2.75,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.75,NULL,'2026-06-09 16:18:57'),(115,115,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.55,-1.55,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.55,NULL,'2026-06-09 16:18:57'),(116,116,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-8.35,-8.35,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-8.35,NULL,'2026-06-09 16:18:57'),(117,117,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-6.84,-6.84,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-6.84,NULL,'2026-06-09 16:18:57'),(118,118,4,0,4,20.00,0.00,20.00,1,13.00,0.00,1.83,-11.17,-7.00,-20.00,0,0.00,0,0.00,0.00,13.00,0.00,1.83,'Tapped in Existing 13.00 MLD STP  maintained by UPJN (U)','2026-06-09 16:18:57'),(119,119,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-4.64,-4.64,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-4.64,NULL,'2026-06-09 16:18:57'),(120,120,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.78,-1.78,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.78,NULL,'2026-06-09 16:18:57'),(121,121,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.25,-1.25,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.25,NULL,'2026-06-09 16:18:57'),(122,122,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.55,-1.55,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.55,NULL,'2026-06-09 16:18:57'),(123,123,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.47,-3.47,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.47,NULL,'2026-06-09 16:18:57'),(124,124,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.84,-2.84,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.84,NULL,'2026-06-09 16:18:57'),(125,125,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.41,-1.41,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.41,NULL,'2026-06-09 16:18:57'),(126,126,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.02,-1.02,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.02,NULL,'2026-06-09 16:18:57'),(127,127,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.46,-3.46,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.46,NULL,'2026-06-09 16:18:57'),(128,128,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.77,-2.77,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.77,NULL,'2026-06-09 16:18:57'),(129,129,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.97,-2.97,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.97,NULL,'2026-06-09 16:18:57'),(130,130,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.27,-3.27,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.27,NULL,'2026-06-09 16:18:57'),(131,131,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.30,-2.30,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.30,NULL,'2026-06-09 16:18:57'),(132,132,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.35,-1.35,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.35,NULL,'2026-06-09 16:18:57'),(133,133,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.99,-2.99,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.99,NULL,'2026-06-09 16:18:57'),(134,134,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.24,-2.24,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.24,NULL,'2026-06-09 16:18:57'),(135,135,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.13,-1.13,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.13,NULL,'2026-06-09 16:18:57'),(136,136,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.98,-1.98,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.98,NULL,'2026-06-09 16:18:57'),(137,137,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.78,-2.78,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.78,NULL,'2026-06-09 16:18:57'),(138,138,6,0,6,1.30,0.00,1.30,0,0.00,0.00,-1.40,-1.40,-1.30,-1.30,0,0.00,0,0.00,0.00,0.00,0.00,-1.40,'Onsite Treatment at Bithoor.','2026-06-09 16:18:57'),(139,139,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-5.14,-5.14,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-5.14,NULL,'2026-06-09 16:18:57'),(140,140,20,1,21,187.15,8.75,195.90,4,224.00,184.00,-202.00,-242.00,28.10,-11.90,0,0.00,0,0.00,0.00,224.00,28.10,-202.00,'Flow of drains goes to 36/43/130 MLD STP, Jajmau and DPR for I&D works of untapped drains of Kanpur city has been sanctioned by NMCG, New Delhi in 61th EC meeting vide letter no. Pr-12012/21/2020TECH1 NMCG (Comp. No.: 263215) dated 02-05-2025. At present for execution of provisioned works NIT issued by SE , Kanpur vide letter no. 588/AC-9/10 Date - 13/06/2025. Technical and Financial bid of Tender has been opened on 21.07.2025 and 25.09.2025 respectively. Meeting of Tender Sanction Committee at HQ level conducted on date 01.11.2025. Proposal forwarded to NMCG, New Delhi for review/approval of Financial Bids on 03.11.2025.','2026-06-09 16:18:57'),(141,141,9,0,9,98.42,131.85,230.27,3,282.00,189.77,-144.00,-236.23,51.73,-40.50,0,0.00,0,0.00,0.00,282.00,51.73,-144.00,'Flow of these drains goes to 210 MLD STP Bingawan/42 MLD Sajari/30 MLD STP Panka and DPR for I&D works of untapped drains of Kanpur city has been sanctioned by NMCG, New Delhi in 61th EC meeting vide letter no. Pr-12012/21/2020TECH1 NMCG (Comp. No.: 263215) dated 02-05-2025. At present for execution of provisioned works NIT issued by SE , Kanpur vide letter no. 588/AC-9/10 Date - 13/06/2025. Technical bid opened on Scheduled date - 21/07/2025. 06 nos Bidders participated in Tender. Technical Bid evaluation under progress.','2026-06-09 16:18:57'),(142,142,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.68,-1.68,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.68,NULL,'2026-06-09 16:18:57'),(143,143,2,1,3,12.76,0.00,12.76,1,15.00,12.00,2.83,-0.17,2.24,-0.76,0,0.00,0,0.00,0.00,15.00,2.24,2.83,'There is no gap at present','2026-06-09 16:18:57'),(144,144,2,0,2,0.50,0.00,0.50,0,0.00,0.00,-1.97,-1.97,-0.50,-0.50,0,0.00,0,0.00,0.00,0.00,0.00,-1.97,NULL,'2026-06-09 16:18:57'),(145,145,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.01,-1.01,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.01,NULL,'2026-06-09 16:18:57'),(146,146,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.47,-1.47,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.47,NULL,'2026-06-09 16:18:57'),(147,147,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.74,-1.74,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.74,NULL,'2026-06-09 16:18:57'),(148,148,0,0,0,0.00,0.00,0.00,0,0.00,0.00,0.00,0.00,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,0.00,NULL,'2026-06-09 16:18:57'),(149,149,5,0,5,6.68,0.00,6.68,0,0.00,0.00,-4.28,-4.28,-6.68,-6.68,0,0.00,0,0.00,0.00,0.00,0.00,-4.28,'DPR has been prepared by U.P. Jal Nigam (Urban) in SBM 2.0 and submmited for approval.','2026-06-09 16:18:57'),(150,150,3,0,3,8.00,0.00,8.00,0,0.00,0.00,-4.28,-4.28,-8.00,-8.00,0,0.00,0,0.00,0.00,0.00,0.00,-4.28,'Originating from Dist Lakhimpur & falls in Ghagra river.','2026-06-09 16:18:57'),(151,151,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.37,-2.37,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.37,NULL,'2026-06-09 16:18:57'),(152,152,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-20.86,-20.86,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-20.86,NULL,'2026-06-09 16:18:57'),(153,153,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.95,-0.95,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.95,NULL,'2026-06-09 16:18:57'),(154,154,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-6.17,-6.17,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-6.17,NULL,'2026-06-09 16:18:57'),(155,155,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.74,-1.74,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.74,NULL,'2026-06-09 16:18:57'),(156,156,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.93,-0.93,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.93,NULL,'2026-06-09 16:18:57'),(157,157,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-5.64,-5.64,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-5.64,NULL,'2026-06-09 16:18:57'),(158,158,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.37,-1.37,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.37,NULL,'2026-06-09 16:18:57'),(159,159,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.18,-1.18,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.18,NULL,'2026-06-09 16:18:57'),(160,160,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.15,-1.15,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.15,NULL,'2026-06-09 16:18:57'),(161,161,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.84,-1.84,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.84,NULL,'2026-06-09 16:18:57'),(162,162,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.96,-0.96,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.96,NULL,'2026-06-09 16:18:57'),(163,163,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.50,-3.50,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.50,NULL,'2026-06-09 16:18:57'),(164,164,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.69,-0.69,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.69,NULL,'2026-06-09 16:18:57'),(165,165,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.52,-0.52,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.52,NULL,'2026-06-09 16:18:57'),(166,166,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.38,-1.38,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.38,NULL,'2026-06-09 16:18:57'),(167,167,32,1,33,550.98,173.55,724.53,9,624.50,564.00,137.03,76.53,-100.03,-160.53,2,53.50,0,0.00,195.00,873.00,148.47,385.53,'Revised DPR of 145 MLD Basantkunj STP had been sent to NMCG vide APD, SMCG-UP letter no. 775/369/SMCG-UP/01 dt. 02.12.2025 with incorporating the comments raised by NMCG. DPR for 75 MLD Bharwara has been submitted to NMCG vide letter no. 1050/0369/SMCG-UP/12 dt. 27.09.2022 for approval. CE (Ganga) again requested to NMCG for approval of DPR on dt.19.06.2024.','2026-06-09 16:18:57'),(168,168,1,0,1,54.78,0.00,54.78,0,0.00,0.00,-487.47,-487.47,-54.78,-54.78,0,0.00,1,100.00,0.00,100.00,45.22,-387.47,'Concessionaire Agreement has been signed on dt. 26.08.2025. Financial closure is in progress.','2026-06-09 16:18:57'),(169,169,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.61,-0.61,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.61,NULL,'2026-06-09 16:18:57'),(170,170,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.27,-1.27,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.27,NULL,'2026-06-09 16:18:57'),(171,171,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.89,-1.89,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.89,NULL,'2026-06-09 16:18:57'),(172,172,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.76,-0.76,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.76,NULL,'2026-06-09 16:18:57'),(173,173,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.49,-3.49,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.49,NULL,'2026-06-09 16:18:57'),(174,174,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-4.38,-4.38,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-4.38,NULL,'2026-06-09 16:18:57'),(175,175,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.62,-1.62,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.62,NULL,'2026-06-09 16:18:57'),(176,176,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.72,-2.72,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.72,NULL,'2026-06-09 16:18:57'),(177,177,6,0,6,9.04,0.00,9.04,0,0.00,0.00,-12.96,-12.96,-9.04,-9.04,0,0.00,0,0.00,0.00,0.00,0.00,-12.96,'Discharge of this drain is accumulates in Keerat Sagar, kalyan Sagar and Dariba pond.','2026-06-09 16:18:57'),(178,178,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.94,-3.94,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.94,NULL,'2026-06-09 16:18:57'),(179,179,14,0,14,2.63,0.00,2.63,0,0.00,0.00,-3.94,-3.94,-2.63,-2.63,0,0.00,1,6.00,0.00,6.00,3.37,2.06,'After construction of 1 No STP 6 MLD  there will be no gap','2026-06-09 16:18:57'),(180,180,2,0,2,1.54,2.30,3.84,1,2.76,2.76,-2.60,-2.60,-1.08,-1.08,0,0.00,0,0.00,0.00,2.76,0.00,-2.60,'4.50 MLD STP is proposed at goverdhan inder SBM 2.0 by UPJN(U),after which there shall be no gap.','2026-06-09 16:18:57'),(181,181,1,0,1,5.64,0.00,5.64,0,0.00,0.00,-8.82,-8.82,-5.64,-5.64,1,12.00,0,0.00,0.00,12.00,6.36,3.18,'After construction of 1 No STP 12 MLD there will be no gap','2026-06-09 16:18:57'),(182,182,23,0,23,68.55,12.00,80.55,4,67.30,67.30,-31.41,-31.41,-13.25,-13.25,0,0.00,1,60.00,0.00,127.30,46.75,28.59,'After construction of 1 No STP 60 MLD there will be no gap','2026-06-09 16:18:57'),(183,183,13,0,13,11.49,0.00,11.49,2,12.00,12.00,-5.00,-5.00,0.51,0.51,1,13.00,0,0.00,0.00,25.00,13.51,8.00,'After construction of 1 No STP 13 MLD there will be no gap','2026-06-09 16:18:57'),(184,184,5,0,5,2.21,0.00,2.21,0,0.00,0.00,-1.03,-1.03,-2.21,-2.21,0,0.00,0,0.00,0.00,0.00,0.00,-1.03,'DPR for 3.5MLD STP submitted to NMCG, on which NMCG suggested to go for FSTP. DPR  for FSTP submitted to SMCG on 10.10.2024. Observations received to which compliance shall be sent by 31.05.2025','2026-06-09 16:18:57'),(185,185,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.45,-1.45,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.45,NULL,'2026-06-09 16:18:57'),(186,186,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.31,-3.31,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.31,NULL,'2026-06-09 16:18:57'),(187,187,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.66,-3.66,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.66,NULL,'2026-06-09 16:18:57'),(188,188,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.38,-1.38,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.38,NULL,'2026-06-09 16:18:57'),(189,189,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.83,-1.83,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.83,NULL,'2026-06-09 16:18:57'),(190,190,0,1,1,0.00,0.00,0.00,0,0.00,0.00,-0.67,-0.67,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.67,NULL,'2026-06-09 16:18:57'),(191,191,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.68,-3.68,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.68,NULL,'2026-06-09 16:18:57'),(192,192,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.97,-2.97,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.97,NULL,'2026-06-09 16:18:57'),(193,193,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-11.04,-11.04,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-11.04,NULL,'2026-06-09 16:18:57'),(194,194,3,0,3,307.22,26.00,333.22,14,179.00,141.27,-43.24,-80.97,-154.22,-191.95,1,220.00,0,0.00,60.00,459.00,125.78,236.76,'Land acquisition for DPR preparation of  Abu Nallah 1 I&D and STP is under process after which DPR will be prepared and submitted.','2026-06-09 16:18:57'),(195,195,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.65,-2.65,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.65,NULL,'2026-06-09 16:18:57'),(196,196,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.59,-2.59,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.59,NULL,'2026-06-09 16:18:57'),(197,197,0,1,1,0.00,0.00,0.00,0,0.00,0.00,-8.07,-8.07,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-8.07,NULL,'2026-06-09 16:18:57'),(198,198,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.56,-3.56,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.56,NULL,'2026-06-09 16:18:57'),(199,199,0,22,22,0.00,0.00,0.00,0,0.00,0.00,-4.41,-4.41,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-4.41,NULL,'2026-06-09 16:18:57'),(200,200,22,5,27,27.39,0.00,27.39,4,38.00,31.00,8.25,1.25,10.61,3.61,0,0.00,0,0.00,0.00,38.00,10.61,8.25,NULL,'2026-06-09 16:18:57'),(201,201,24,0,24,97.97,36.00,133.97,3,103.00,51.00,-35.53,-87.53,-30.97,-82.97,0,0.00,2,80.00,0.00,183.00,49.03,44.47,NULL,'2026-06-09 16:18:57'),(202,202,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.20,-2.20,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.20,NULL,'2026-06-09 16:18:57'),(203,203,3,0,3,7.40,0.00,7.40,1,10.00,7.13,1.90,-0.97,2.60,-0.27,0,0.00,0,0.00,0.00,10.00,2.60,1.90,NULL,'2026-06-09 16:18:57'),(204,204,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.47,-2.47,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.47,NULL,'2026-06-09 16:18:57'),(205,205,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.63,-2.63,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.63,NULL,'2026-06-09 16:18:57'),(206,206,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-9.98,-9.98,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-9.98,NULL,'2026-06-09 16:18:57'),(207,207,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.83,-3.83,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.83,NULL,'2026-06-09 16:18:57'),(208,208,7,3,10,51.09,7.44,58.53,3,87.00,61.05,26.95,1.00,28.47,2.52,0,0.00,0,0.00,0.00,87.00,28.47,26.95,'22 MLD STP Sahawali: Commercial Operation Date declared, Plant under O&M since 01.04.2024.	32.5 MLD Kidwai Nagar Commercial Operation date declared July 2024: 02 Nos. I&D work completed, STP running by 04 I&D. IPS 2A work Completed in June 2025.','2026-06-09 16:18:57'),(209,209,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.75,-3.75,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.75,NULL,'2026-06-09 16:18:57'),(210,210,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.68,-2.68,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.68,NULL,'2026-06-09 16:18:57'),(211,211,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.82,-1.82,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.82,NULL,'2026-06-09 16:18:57'),(212,212,3,1,4,90.00,0.00,90.00,0,0.00,0.00,-18.14,-18.14,-90.00,-90.00,0,0.00,0,0.00,0.00,0.00,0.00,-18.14,NULL,'2026-06-09 16:18:57'),(213,213,5,0,5,1.59,0.00,1.59,0,0.00,0.00,-1.34,-1.34,-1.59,-1.59,0,0.00,0,0.00,0.00,0.00,0.00,-1.34,NULL,'2026-06-09 16:18:57'),(214,214,4,0,4,7.10,0.00,7.10,1,8.95,0.00,7.64,-1.31,1.85,-7.10,0,0.00,0,0.00,0.00,8.95,1.85,7.64,NULL,'2026-06-09 16:18:57'),(215,215,46,2,48,166.48,92.09,258.57,7,168.00,208.80,-69.86,-29.06,-90.57,-49.77,2,133.00,0,0.00,28.00,329.00,70.43,91.14,'DPR submitted to NMCG for 28 MLD on 16.10.2023 to meet the gap of year 2037','2026-06-09 16:18:57'),(216,216,30,3,33,125.73,86.22,211.95,3,172.00,231.23,-65.86,-6.63,-39.95,19.28,1,50.00,0,0.00,44.00,266.00,54.05,28.14,'DPR for 44 MLD is under preparation and will be submitted by 10.04.2025','2026-06-09 16:18:57'),(217,217,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.89,-0.89,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.89,NULL,'2026-06-09 16:18:57'),(218,218,9,0,9,2.12,0.00,2.12,0,0.00,0.00,-0.71,-0.71,-2.12,-2.12,0,0.00,0,0.00,0.00,0.00,0.00,-0.71,'Date of start given to Firm M/s Aastha Enviro Engineers Pvt. Ltd. on dt. 06.02.2026. Soil testing and Survey completed. Design & Drawing work is in progress. Boundary wall work is in progress.','2026-06-09 16:18:57'),(219,219,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.65,-1.65,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.65,NULL,'2026-06-09 16:18:57'),(220,220,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.47,-0.47,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.47,NULL,'2026-06-09 16:18:57'),(221,221,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.97,-0.97,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.97,NULL,'2026-06-09 16:18:57'),(222,222,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.84,-0.84,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.84,NULL,'2026-06-09 16:18:57'),(223,223,7,0,7,32.80,0.00,32.80,1,18.00,3.50,-8.25,-22.75,-14.80,-29.30,0,0.00,0,0.00,0.00,18.00,0.00,-8.25,'DPR has been sent to NMCG vide SMCG letter no. 131/032/SMCG-UP/02 dt. 22.01.2026. NMCG returned the DPR to the State with the direction to consider taking up this project from State funds or explore other funding schemes.','2026-06-09 16:18:57'),(224,224,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.05,-1.05,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.05,NULL,'2026-06-09 16:18:57'),(225,225,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.79,-0.79,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.79,NULL,'2026-06-09 16:18:57'),(226,226,3,0,3,33.39,0.00,33.39,3,34.00,34.00,-10.47,-10.47,0.61,0.61,0,0.00,0,0.00,0.00,34.00,0.61,-10.47,NULL,'2026-06-09 16:18:57'),(227,227,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.07,-2.07,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.07,NULL,'2026-06-09 16:18:57'),(228,228,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.71,-2.71,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.71,NULL,'2026-06-09 16:18:57'),(229,229,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.10,-2.10,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.10,NULL,'2026-06-09 16:18:57'),(230,230,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.21,-3.21,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.21,NULL,'2026-06-09 16:18:57'),(231,231,4,0,4,15.65,0.00,15.65,0,0.00,0.00,-14.58,-14.58,-15.65,-15.65,0,0.00,0,0.00,20.00,20.00,4.35,5.42,'AA&ES received on 25.07.2024. Draft bid document and NIT sent to NMCG on 05.08.2024 for approval. NIT published on 24-10-2024, Pre-bid meeting held on 07.11.2024, Last date of bid submission is on 24.01.2025. Technical bid opened on 25.01.2025. Tender Bid Evaluation Sheet send to NMCG on dated 28.04.2025 for approval. Approval from NMCG recieved on 29.07.2025, Financial bid opened on dated 07.08.2025 and send to NMCG on dated 04.09.2025 for approval. Approval recieved on 16.09.2025..','2026-06-09 16:18:57'),(232,232,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-7.86,-7.86,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-7.86,NULL,'2026-06-09 16:18:57'),(233,233,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.08,-3.08,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.08,NULL,'2026-06-09 16:18:57'),(234,234,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.51,-1.51,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.51,NULL,'2026-06-09 16:18:57'),(235,235,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.62,-3.62,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.62,NULL,'2026-06-09 16:18:57'),(236,236,99,6,105,97.64,24.00,121.64,1,38.00,38.00,-82.12,-82.12,-83.64,-83.64,0,0.00,1,135.00,0.00,173.00,51.36,52.88,'LOA issue to M/s Enviro Infra Engineers Ltd.-Bhugan Infracon Pvt. Ltd.-Micro Transmission Systems JV on dt. 26.07.2024 & Concession Agreement is signed on 27.09.2024, For Finnancial closer document submitted by Concessanair in NMCG and under Scrutiny. Difference between the actual and provided NGL of proposed STP site has been found during field survry. Effective date yet not declared due to STP land level issue. In the review meeting on 25.04.25 at NMCG, UPJN-R/PE were asked to work out on the possible alternatives options like retaining wall option, backfilling option or others etc. Post which UPJN-R and PE had to work on optimization of the solution and comeback with all possible solution. Accordingly, additional cost implication worth Rs. 81 crore for STP due to level difference sent to NMCG on 21.04.25.','2026-06-09 16:18:57'),(237,237,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.57,-2.57,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.57,NULL,'2026-06-09 16:18:57'),(238,238,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.46,-1.46,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.46,NULL,'2026-06-09 16:18:57'),(239,239,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-33.69,-33.69,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-33.69,NULL,'2026-06-09 16:18:57'),(240,240,1,1,2,3.40,0.00,3.40,0,0.00,0.00,-12.77,-12.77,-3.40,-3.40,0,0.00,1,5.00,3.00,8.00,4.60,-4.77,NULL,'2026-06-09 16:18:57'),(241,241,2,0,2,11.50,0.00,11.50,0,0.00,0.00,-12.77,-12.77,-11.50,-11.50,0,0.00,0,0.00,17.00,17.00,5.50,4.23,'Revised DPR for 18 MLD, 5 MLD and 3 MLD STP approved by NMCG on 06.03.2025. Draft Tender Document shall be sent to NMCG by 05.06.2025','2026-06-09 16:18:57'),(242,242,0,0,0,0.00,0.00,0.00,1,40.00,5.00,-8.48,-43.48,40.00,5.00,0,0.00,0,0.00,0.00,40.00,40.00,-8.48,NULL,'2026-06-09 16:18:57'),(243,243,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.42,-1.42,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.42,NULL,'2026-06-09 16:18:57'),(244,244,3,1,4,3.07,0.00,3.07,0,0.00,0.00,-3.16,-3.16,-3.07,-3.07,1,5.00,0,0.00,0.00,5.00,1.93,1.84,'LOA issue to M/s R.K. Engineers Sales Ltd. on Date 13-09-2024  Contract Agreement is signed on 08.10.2024, Survey and Soil investigation work completed, BEP, Layout and HFD approved for 05 MLD STP. GAD, Structural Design and Dwg. for SBR and Boundary wall approved. GAD for Sludge Handling Unit Submitted, which are clear for Vetting & Structural Design.','2026-06-09 16:18:57'),(245,245,1,0,1,3.00,0.00,3.00,0,0.00,0.00,-3.03,-3.03,-3.00,-3.00,1,5.00,0,0.00,0.00,5.00,2.00,1.97,'LOA issue to M/s R.K. Engineers Sales Ltd. on Date 13-09-2024  Contract Agreement is signed on 08.10.2024, Survey and Soil investigation work completed, BEP and HFD approved for 05 MLD STP. Work stop due to land Dispute.','2026-06-09 16:18:57'),(246,246,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.56,-1.56,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.56,NULL,'2026-06-09 16:18:57'),(247,247,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.67,-3.67,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.67,NULL,'2026-06-09 16:18:57'),(248,248,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.56,-2.56,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.56,NULL,'2026-06-09 16:18:57'),(249,249,1,0,1,12.00,0.00,12.00,1,15.00,14.50,1.61,1.11,3.00,2.50,0,0.00,0,0.00,0.00,15.00,3.00,1.61,'STP commissioned on 12.02 2024 and Under O&M since 01.04.2025.','2026-06-09 16:18:57'),(250,250,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-6.11,-6.11,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-6.11,NULL,'2026-06-09 16:18:57'),(251,251,1,1,2,20.10,0.00,20.10,0,0.00,0.00,-16.31,-16.31,-20.10,-20.10,1,40.00,0,0.00,0.00,40.00,19.90,23.69,'LOA issue to M/s R.K. Engineers Sales Ltd.-M/s Anand Constrwell Pvt. Ldt. (JV) on Date 04-07-2024 Contract Agreement is signed on 08.10.2024, Survey and Soil investigation work completed, BEP, Layout and HFD approved for 40 MLD STP. GAD, Structural Design and Dwg. for SBR and Boundary wall approved. GAD for Admin Building and Sludge Handling and Dewatering Building Submitted, which clear for Vetting & Structural Design. CCT and I&D GAD Submitted, which clear for Vetting & Structural Design.','2026-06-09 16:18:57'),(252,252,5,0,5,6.70,0.00,6.70,0,0.00,0.00,-5.40,-5.40,-6.70,-6.70,1,10.00,0,0.00,0.00,10.00,3.30,4.60,'LOA issue to M/s R.K. Engineers Sales Ltd. on Date 13-09-2024  Contract Agreement is signed on 08.10.2024, Survey and Soil investigation work completed, BEP, Layout and HFD approved for 10 MLD STP. GAD, Structural Design and Dwg. for SBR and Boundary wall approved. GAD for Sludge Handling Unit Submitted, which are clear for Vetting & Structural Design.. CCT GAD were Submitted, which clear for Vetting & Structural Design.','2026-06-09 16:18:57'),(253,253,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.86,-1.86,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.86,NULL,'2026-06-09 16:18:57'),(254,254,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-7.65,-7.65,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-7.65,NULL,'2026-06-09 16:18:57'),(255,255,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.49,-1.49,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.49,NULL,'2026-06-09 16:18:57'),(256,256,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-6.66,-6.66,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-6.66,NULL,'2026-06-09 16:18:57'),(257,257,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-8.50,-8.50,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-8.50,NULL,'2026-06-09 16:18:57'),(258,258,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-8.45,-8.45,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-8.45,NULL,'2026-06-09 16:18:57'),(259,259,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.51,-1.51,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.51,NULL,'2026-06-09 16:18:57'),(260,260,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.52,-2.52,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.52,NULL,'2026-06-09 16:18:57'),(261,261,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.52,-2.52,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.52,NULL,'2026-06-09 16:18:57'),(262,262,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.99,-0.99,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.99,NULL,'2026-06-09 16:18:57'),(263,263,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.78,-1.78,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.78,NULL,'2026-06-09 16:18:57'),(264,264,21,0,21,12.72,0.00,12.72,0,0.00,0.00,-24.32,-24.32,-12.72,-12.72,0,0.00,0,0.00,0.00,0.00,0.00,-24.32,'DPR preparation work is in progress.','2026-06-09 16:18:57'),(265,265,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.22,-0.22,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.22,NULL,'2026-06-09 16:18:57'),(266,266,2,0,2,3.40,0.00,3.40,0,0.00,0.00,-2.78,-2.78,-3.40,-3.40,0,0.00,0,0.00,0.00,0.00,0.00,-2.78,NULL,'2026-06-09 16:18:57'),(267,267,5,1,6,13.94,0.00,13.94,3,17.00,16.04,2.64,1.68,3.06,2.10,0,0.00,0,0.00,0.00,17.00,3.06,2.64,'Extra Work of Boundarywall, Fixing of Handrailing at 10 MLD STP, Drain Lining of Karundiya Drain and Installation of SCADA etc is still pending.','2026-06-09 16:18:57'),(268,268,7,0,7,11.96,0.00,11.96,0,0.00,0.00,-19.32,-19.32,-11.96,-11.96,1,5.00,0,0.00,0.00,5.00,0.00,-14.32,'Total 7 drains are discharging into River Ganga in NPP Shuklaganj out of which 5 drains of discharge 4.66 MLD has to be Intercepted & Diverted to under Construction 5 MLD STP Shuklaganj and rest of the 02 drains of discharge 7.3 MLD has to be tapped & treated by U.P. J.N. (Urban) under SBM 2 programme. The work of tapping domestic sewage outflow through I&D was completed on 30.12.2025 by tapping 04 drains namely Indira Nagar, Manohar Nagar-1, Manohar Nagar-2 and Railway Bridge and trial run of the scheme has been started. The trial run of the scheme is to be done for 03 months, after which the operation of STP will start at full capacity. The work of cleaning 1.96 km drain and construction of Connecting Drain of 190 meters to bring 01 drain Ganga Vishnu Drain to I&D is to be done by M/s KRMPL','2026-06-09 16:18:57'),(269,269,1,0,1,11.36,0.00,11.36,1,15.00,4.00,-7.20,-18.20,3.64,-7.36,0,0.00,0,0.00,0.00,15.00,3.64,-7.20,'The overall progress of the project is 99%. All works (Civil/Electrical & Mechanical) of the STP has been completed. Due to the rise in groundwater levels resulting from floods in the Ganga River and rainfall, the construction of the remaining 01 number of Manhole near the STP premises and the Dewatering work remained disrupted from August 2025 to January 2026. Against the Dewatering and Desilting works in the 1200 mm RCC Pipe, the Dewatering work is currently in progress. Re-laying of a 1.20 km length of 1200 mm RCC Pipe from MH 27 to MH-39, and the construction of 14 numbers of Manholes are pending. Concessionaire M/s Kanpur River Management Pvt. Ltd., Kanpur has targeted to complete the works of the project by October 2026','2026-06-09 16:18:57'),(270,270,1,0,1,78.00,0.00,78.00,2,105.00,95.00,-142.50,-152.50,27.00,17.00,0,0.00,0,0.00,0.00,105.00,27.00,-142.50,NULL,'2026-06-09 16:18:57'),(271,271,28,0,28,73.73,141.27,215.00,4,110.00,23.50,-137.50,-224.00,-105.00,-191.50,1,7.00,0,0.00,140.00,257.00,42.00,9.50,'There are 02 partially tapped drains for which construction of 55 MLD STP is in progress under Namami Gange. For 02 untapped drains, construction of 07 MLD STP is in progress under AMRUT 2.0','2026-06-09 16:18:57'),(272,272,43,0,43,226.80,130.20,357.00,2,260.00,180.00,12.50,-67.50,-97.00,-177.00,0,0.00,1,60.00,0.00,320.00,0.00,72.50,'Revised DPR for 60 MLD STP approved by NMCG on 06.03.2025. Bids opened on 07.10.2025, evaluation in process','2026-06-09 16:18:57');
/*!40000 ALTER TABLE `drainage_stp_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `population_statistics`
--

DROP TABLE IF EXISTS `population_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `population_statistics` (
  `population_stat_id` int NOT NULL AUTO_INCREMENT,
  `town_city_id` int NOT NULL,
  `present_population_2024` decimal(10,2) DEFAULT NULL,
  `present_population_based_sewage_generation_2024` decimal(10,2) DEFAULT NULL,
  `length_of_sewerage_network_km` decimal(10,2) DEFAULT NULL,
  `no_of_house_holds` int DEFAULT NULL,
  `no_of_hh_connected_to_sewerage_network` int DEFAULT NULL,
  `projected_population_2037` decimal(10,2) DEFAULT NULL,
  `population_based_sewage_generation_2037` decimal(10,2) DEFAULT NULL,
  `sewage_gap_based_on_projected_population_2037` decimal(10,2) DEFAULT NULL,
  `scrape_time` datetime DEFAULT NULL,
  PRIMARY KEY (`population_stat_id`),
  UNIQUE KEY `town_city_id` (`town_city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `population_statistics`
--

LOCK TABLES `population_statistics` WRITE;
/*!40000 ALTER TABLE `population_statistics` DISABLE KEYS */;
INSERT INTO `population_statistics` VALUES (1,1,23.78,286.07,1613.00,396000,210000,32.81,354.41,43.94,'2026-06-09 16:18:57'),(2,2,11.25,121.55,106.57,147000,21468,12.94,139.73,18.27,'2026-06-09 16:18:57'),(3,3,1.45,15.70,NULL,NULL,NULL,NULL,NULL,0.00,'2026-06-09 16:18:57'),(4,4,1.11,11.99,NULL,NULL,NULL,NULL,NULL,15.00,'2026-06-09 16:18:57'),(5,5,0.34,3.71,NULL,NULL,NULL,NULL,NULL,0.00,'2026-06-09 16:18:57'),(6,6,2.80,30.24,0.00,46667,0,3.53,38.10,-38.10,'2026-06-09 16:18:57'),(7,7,0.12,1.25,NULL,1706,NULL,0.14,1.55,-1.55,'2026-06-09 16:18:57'),(8,8,0.14,1.51,NULL,2071,NULL,0.17,1.82,-1.82,'2026-06-09 16:18:57'),(9,9,1.15,12.42,0.00,20838,0,1.49,16.09,-16.09,'2026-06-09 16:18:57'),(10,10,0.38,4.16,NULL,5084,NULL,0.50,5.45,-5.45,'2026-06-09 16:18:57'),(11,11,0.45,4.83,NULL,5750,NULL,0.61,6.63,-6.63,'2026-06-09 16:18:57'),(12,12,0.39,4.19,NULL,5219,NULL,0.54,5.83,-5.83,'2026-06-09 16:18:57'),(13,13,0.22,2.41,NULL,3071,NULL,0.28,3.05,-3.05,'2026-06-09 16:18:57'),(14,14,4.66,50.32,248.00,59870,19800,6.54,70.69,-19.69,'2026-06-09 16:18:57'),(15,15,0.34,2.26,NULL,NULL,NULL,0.43,2.86,5.14,'2026-06-09 16:18:57'),(16,16,0.94,10.00,NULL,NULL,NULL,1.30,14.00,0.00,'2026-06-09 16:18:57'),(17,17,1.35,14.67,NULL,NULL,NULL,1.80,19.45,0.55,'2026-06-09 16:18:57'),(18,18,0.55,5.93,NULL,8618,NULL,0.59,6.44,-6.44,'2026-06-09 16:18:57'),(19,19,0.18,1.93,NULL,2510,NULL,0.21,2.26,-2.26,'2026-06-09 16:18:57'),(20,20,1.96,21.17,0.00,29162,0,2.31,24.95,-24.95,'2026-06-09 16:18:57'),(21,21,0.14,1.52,NULL,NULL,NULL,0.17,1.85,-1.85,'2026-06-09 16:18:57'),(22,22,0.11,1.21,NULL,NULL,NULL,0.13,1.47,-1.47,'2026-06-09 16:18:57'),(23,23,0.16,1.79,NULL,2505,NULL,0.20,2.14,-2.14,'2026-06-09 16:18:57'),(24,24,0.09,0.98,NULL,NULL,NULL,0.11,1.24,-1.24,'2026-06-09 16:18:57'),(25,25,0.14,1.58,NULL,NULL,NULL,0.19,2.11,-2.11,'2026-06-09 16:18:57'),(26,26,1.45,13.94,NULL,NULL,NULL,NULL,NULL,0.00,'2026-06-09 16:18:57'),(27,27,11.36,123.58,314.00,206545,65219,13.96,150.74,-52.74,'2026-06-09 16:18:57'),(28,28,1.35,14.58,81.00,22500,0,1.70,18.37,5.63,'2026-06-09 16:18:57'),(29,29,0.37,3.99,58.87,7400,7400,0.53,5.72,-0.66,'2026-06-09 16:18:57'),(30,30,3.74,40.36,237.00,52690,27917,4.65,50.23,-10.23,'2026-06-09 16:18:57'),(31,31,0.64,6.91,0.00,12800,0,0.90,9.74,0.26,'2026-06-09 16:18:57'),(32,32,0.30,3.24,25.57,6100,6100,0.43,4.64,1.61,'2026-06-09 16:18:57'),(33,33,1.67,18.13,NULL,NULL,NULL,2.25,24.33,20.67,'2026-06-09 16:18:57'),(34,34,0.21,1.43,NULL,NULL,NULL,0.27,1.82,1.60,'2026-06-09 16:18:57'),(35,35,0.17,1.17,NULL,NULL,NULL,0.22,1.48,-1.48,'2026-06-09 16:18:57'),(36,36,0.51,6.48,NULL,NULL,NULL,NULL,NULL,6.00,'2026-06-09 16:18:57'),(37,37,0.28,3.82,NULL,NULL,NULL,NULL,NULL,3.00,'2026-06-09 16:18:57'),(38,38,1.50,16.20,46.00,25000,15000,1.72,18.63,5.37,'2026-06-09 16:18:57'),(39,39,0.18,2.00,0.00,3157,0,3.50,37.76,-36.16,'2026-06-09 16:18:57'),(40,40,3.04,32.92,23.50,44000,4450,3.50,37.76,7.19,'2026-06-09 16:18:57'),(41,41,3.49,37.69,0.00,51336,0,4.07,43.96,-13.96,'2026-06-09 16:18:57'),(42,42,0.00,0.00,NULL,NULL,NULL,0.00,0.00,17.70,'2026-06-09 16:18:57'),(43,43,0.39,4.28,NULL,NULL,NULL,0.43,4.70,-4.70,'2026-06-09 16:18:57'),(44,44,0.19,2.03,NULL,NULL,NULL,0.22,2.44,-2.44,'2026-06-09 16:18:57'),(45,45,0.13,1.47,NULL,NULL,NULL,0.18,1.94,-1.94,'2026-06-09 16:18:57'),(46,46,0.33,3.54,NULL,NULL,NULL,0.38,4.12,-4.12,'2026-06-09 16:18:57'),(47,47,0.30,3.29,NULL,NULL,NULL,0.35,3.82,-3.82,'2026-06-09 16:18:57'),(48,48,0.30,3.24,NULL,NULL,NULL,0.35,3.77,-3.77,'2026-06-09 16:18:57'),(49,49,0.25,2.74,NULL,NULL,NULL,0.29,3.19,-3.19,'2026-06-09 16:18:57'),(50,50,0.37,3.97,NULL,NULL,NULL,0.48,5.16,-5.16,'2026-06-09 16:18:57'),(51,51,2.44,26.35,NULL,NULL,NULL,2.94,31.75,-31.75,'2026-06-09 16:18:57'),(52,52,8.61,93.00,187.00,193000,26342,9.90,106.94,-36.94,'2026-06-09 16:18:57'),(53,53,9.15,98.00,NULL,183000,183000,12.60,136.00,38.00,'2026-06-09 16:18:57'),(54,54,12.25,132.00,NULL,245000,245000,16.50,178.00,233.00,'2026-06-09 16:18:57'),(55,55,33.26,368.58,2300.00,652000,652000,43.80,475.00,84.50,'2026-06-09 16:18:57'),(56,56,1.40,15.50,NULL,NULL,NULL,1.90,20.52,0.48,'2026-06-09 16:18:57'),(57,57,0.31,3.35,NULL,NULL,NULL,0.39,4.25,-4.25,'2026-06-09 16:18:57'),(58,58,0.42,4.58,NULL,NULL,NULL,0.53,5.77,-5.77,'2026-06-09 16:18:57'),(59,59,0.29,4.11,NULL,NULL,NULL,NULL,NULL,0.00,'2026-06-09 16:18:57'),(60,60,11.40,124.38,307.00,246647,45428,16.50,185.00,-51.00,'2026-06-09 16:18:57'),(61,61,0.08,0.93,NULL,NULL,NULL,0.10,1.07,-1.07,'2026-06-09 16:18:57'),(62,62,0.41,4.39,0.00,NULL,0,0.44,4.76,-4.76,'2026-06-09 16:18:57'),(63,63,0.17,1.87,NULL,NULL,NULL,0.22,2.40,-2.40,'2026-06-09 16:18:57'),(64,64,0.47,5.10,NULL,NULL,NULL,0.53,5.75,-5.75,'2026-06-09 16:18:57'),(65,65,0.79,8.51,NULL,NULL,NULL,0.92,10.00,-10.00,'2026-06-09 16:18:57'),(66,66,0.11,1.22,NULL,NULL,NULL,0.14,1.51,-1.51,'2026-06-09 16:18:57'),(67,67,0.57,6.15,NULL,NULL,NULL,0.83,8.96,-8.96,'2026-06-09 16:18:57'),(68,68,0.57,6.15,65.00,11400,11400,0.81,8.74,0.26,'2026-06-09 16:18:57'),(69,69,3.41,36.29,42.00,59000,5100,3.99,43.07,-7.07,'2026-06-09 16:18:57'),(70,70,0.13,0.72,NULL,NULL,NULL,0.16,0.92,-0.92,'2026-06-09 16:18:57'),(71,71,0.38,4.08,NULL,NULL,NULL,0.48,5.19,-5.19,'2026-06-09 16:18:57'),(72,72,0.20,1.10,NULL,NULL,NULL,1.40,0.25,-0.25,'2026-06-09 16:18:57'),(73,73,2.50,27.04,NULL,NULL,NULL,3.18,34.35,-34.35,'2026-06-09 16:18:57'),(74,74,0.20,1.11,NULL,NULL,NULL,0.25,1.41,-1.41,'2026-06-09 16:18:57'),(75,75,0.08,0.42,NULL,NULL,NULL,0.10,0.54,-0.54,'2026-06-09 16:18:57'),(76,76,0.15,0.82,NULL,NULL,NULL,0.19,1.04,-1.04,'2026-06-09 16:18:57'),(77,77,0.47,5.07,NULL,NULL,NULL,0.60,6.44,-6.44,'2026-06-09 16:18:57'),(78,78,0.24,1.33,NULL,NULL,NULL,0.30,1.69,-1.69,'2026-06-09 16:18:57'),(79,79,0.46,4.94,NULL,NULL,NULL,0.58,6.28,-6.28,'2026-06-09 16:18:57'),(80,80,0.33,3.57,NULL,NULL,NULL,0.42,4.53,-4.53,'2026-06-09 16:18:57'),(81,81,0.74,8.01,NULL,NULL,NULL,0.94,10.17,-10.17,'2026-06-09 16:18:57'),(82,82,1.02,11.01,NULL,NULL,NULL,1.30,13.99,-13.99,'2026-06-09 16:18:57'),(83,83,1.74,18.86,0.00,30000,0,2.00,21.61,2.39,'2026-06-09 16:18:57'),(84,84,0.17,1.88,NULL,NULL,NULL,0.20,2.18,-2.18,'2026-06-09 16:18:57'),(85,85,0.68,7.39,NULL,9560,NULL,0.79,8.56,-8.56,'2026-06-09 16:18:57'),(86,86,0.20,2.13,NULL,2515,NULL,0.26,2.78,-2.78,'2026-06-09 16:18:57'),(87,87,0.62,6.70,0.00,8408,0,0.73,7.88,-7.88,'2026-06-09 16:18:57'),(88,88,0.59,6.43,NULL,8655,NULL,0.63,6.83,-6.83,'2026-06-09 16:18:57'),(89,89,0.09,1.04,NULL,1382,NULL,0.11,1.19,-1.19,'2026-06-09 16:18:57'),(90,90,0.17,1.82,NULL,2202,NULL,0.22,2.42,-2.42,'2026-06-09 16:18:57'),(91,91,0.09,1.04,NULL,1352,NULL,0.12,1.26,-1.26,'2026-06-09 16:18:57'),(92,92,2.52,27.25,NULL,33919,NULL,3.30,35.59,-35.59,'2026-06-09 16:18:57'),(93,93,0.17,1.80,NULL,2205,NULL,0.22,2.34,-2.34,'2026-06-09 16:18:57'),(94,94,0.11,1.15,NULL,1570,NULL,0.12,1.32,-1.32,'2026-06-09 16:18:57'),(95,95,2.60,28.17,NULL,NULL,NULL,NULL,NULL,30.00,'2026-06-09 16:18:57'),(96,96,0.10,1.12,NULL,NULL,NULL,0.12,1.34,-1.34,'2026-06-09 16:18:57'),(97,97,0.31,3.35,NULL,NULL,NULL,0.38,4.17,-4.17,'2026-06-09 16:18:57'),(98,98,0.19,2.11,NULL,NULL,NULL,0.22,2.45,-2.45,'2026-06-09 16:18:57'),(99,99,0.12,1.26,NULL,NULL,NULL,0.14,1.54,-1.54,'2026-06-09 16:18:57'),(100,100,0.15,1.61,NULL,NULL,NULL,0.20,2.23,-2.23,'2026-06-09 16:18:57'),(101,101,0.33,3.57,NULL,NULL,NULL,0.39,4.29,-4.29,'2026-06-09 16:18:57'),(102,102,6.17,66.64,0.00,NULL,0,7.32,79.07,-27.07,'2026-06-09 16:18:57'),(103,103,0.09,1.00,NULL,NULL,NULL,0.12,1.26,-1.26,'2026-06-09 16:18:57'),(104,104,0.74,8.03,NULL,NULL,NULL,0.88,9.57,-9.57,'2026-06-09 16:18:57'),(105,105,0.14,1.59,NULL,NULL,NULL,0.16,1.77,-1.77,'2026-06-09 16:18:57'),(106,106,0.21,2.32,NULL,NULL,NULL,0.25,2.69,-2.69,'2026-06-09 16:18:57'),(107,107,0.25,2.75,NULL,NULL,NULL,0.28,3.02,-3.02,'2026-06-09 16:18:57'),(108,108,0.14,1.55,NULL,NULL,NULL,0.18,1.92,-1.92,'2026-06-09 16:18:57'),(109,109,0.77,8.35,NULL,NULL,NULL,0.95,10.30,-10.30,'2026-06-09 16:18:57'),(110,110,0.63,6.84,NULL,NULL,NULL,0.87,9.34,-9.34,'2026-06-09 16:18:57'),(111,111,1.03,11.17,33.00,22092,6190,1.22,13.20,-0.20,'2026-06-09 16:18:57'),(112,112,0.43,4.64,NULL,NULL,NULL,0.60,6.44,-6.44,'2026-06-09 16:18:57'),(113,113,0.16,1.78,NULL,NULL,NULL,0.22,2.35,-2.35,'2026-06-09 16:18:57'),(114,114,0.11,1.25,NULL,NULL,NULL,0.15,1.60,-1.60,'2026-06-09 16:18:57'),(115,115,0.14,1.55,NULL,NULL,NULL,0.18,1.92,-1.92,'2026-06-09 16:18:57'),(116,116,0.32,3.47,NULL,NULL,NULL,0.42,4.57,-4.57,'2026-06-09 16:18:57'),(117,117,0.26,2.84,NULL,NULL,NULL,0.34,3.65,-3.65,'2026-06-09 16:18:57'),(118,118,0.13,1.41,NULL,NULL,NULL,0.16,1.80,-1.80,'2026-06-09 16:18:57'),(119,119,0.09,1.02,NULL,NULL,NULL,0.11,1.23,-1.23,'2026-06-09 16:18:57'),(120,120,0.32,3.46,NULL,NULL,NULL,0.42,4.54,-4.54,'2026-06-09 16:18:57'),(121,121,0.25,2.77,NULL,NULL,NULL,0.31,3.36,-3.36,'2026-06-09 16:18:57'),(122,122,0.27,2.97,NULL,NULL,NULL,0.33,3.60,-3.60,'2026-06-09 16:18:57'),(123,123,0.30,3.27,NULL,NULL,NULL,0.37,3.97,-3.97,'2026-06-09 16:18:57'),(124,124,0.21,2.30,NULL,NULL,NULL,0.26,2.80,-2.80,'2026-06-09 16:18:57'),(125,125,0.12,1.35,NULL,NULL,NULL,0.15,1.64,-1.64,'2026-06-09 16:18:57'),(126,126,0.28,2.99,NULL,NULL,NULL,0.33,3.64,-3.64,'2026-06-09 16:18:57'),(127,127,0.21,2.24,NULL,NULL,NULL,0.26,2.82,-2.82,'2026-06-09 16:18:57'),(128,128,0.10,1.13,NULL,NULL,NULL,0.13,1.38,-1.38,'2026-06-09 16:18:57'),(129,129,0.18,1.98,NULL,NULL,NULL,0.24,2.64,-2.64,'2026-06-09 16:18:57'),(130,130,0.26,2.78,NULL,3442,NULL,0.32,3.48,-3.48,'2026-06-09 16:18:57'),(131,131,0.13,1.40,0.00,2654,0,0.16,1.67,-1.67,'2026-06-09 16:18:57'),(132,132,0.48,5.14,NULL,7407,NULL,0.54,5.84,-5.84,'2026-06-09 16:18:57'),(133,133,35.50,426.00,3575.00,596000,295000,38.14,457.68,48.32,'2026-06-09 16:18:57'),(134,134,0.16,1.68,NULL,2121,NULL,0.20,2.18,-2.18,'2026-06-09 16:18:57'),(135,135,1.12,12.17,0.00,19562,0,1.29,13.91,1.09,'2026-06-09 16:18:57'),(136,136,0.29,1.97,NULL,NULL,NULL,0.37,2.50,-2.50,'2026-06-09 16:18:57'),(137,137,0.18,1.01,NULL,NULL,NULL,0.23,1.28,-1.28,'2026-06-09 16:18:57'),(138,138,0.26,1.47,NULL,NULL,NULL,0.33,1.86,-1.86,'2026-06-09 16:18:57'),(139,139,0.31,1.74,NULL,NULL,NULL,0.40,2.22,-2.22,'2026-06-09 16:18:57'),(140,140,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,'2026-06-09 16:18:57'),(141,141,0.76,4.28,NULL,NULL,NULL,0.97,5.44,-5.44,'2026-06-09 16:18:57'),(142,142,0.42,2.37,NULL,NULL,NULL,0.54,3.02,-3.02,'2026-06-09 16:18:57'),(143,143,1.93,20.86,NULL,NULL,NULL,2.45,26.50,-26.50,'2026-06-09 16:18:57'),(144,144,0.17,0.95,NULL,NULL,NULL,0.22,1.21,-1.21,'2026-06-09 16:18:57'),(145,145,0.57,6.17,NULL,NULL,NULL,0.73,7.84,-7.84,'2026-06-09 16:18:57'),(146,146,0.31,1.74,NULL,NULL,NULL,0.39,2.21,-2.21,'2026-06-09 16:18:57'),(147,147,0.17,0.93,NULL,NULL,NULL,0.21,1.18,-1.18,'2026-06-09 16:18:57'),(148,148,0.52,5.64,NULL,NULL,NULL,0.66,7.17,-7.17,'2026-06-09 16:18:57'),(149,149,0.24,1.37,NULL,NULL,NULL,0.31,1.74,-1.74,'2026-06-09 16:18:57'),(150,150,0.11,1.18,NULL,NULL,NULL,0.13,1.39,-1.39,'2026-06-09 16:18:57'),(151,151,0.10,1.15,NULL,NULL,NULL,0.12,1.33,-1.33,'2026-06-09 16:18:57'),(152,152,0.17,1.84,NULL,NULL,NULL,0.20,2.23,-2.23,'2026-06-09 16:18:57'),(153,153,0.17,0.96,NULL,NULL,NULL,0.22,1.22,-1.22,'2026-06-09 16:18:57'),(154,154,0.62,3.50,NULL,NULL,NULL,0.79,4.44,-4.44,'2026-06-09 16:18:57'),(155,155,0.12,0.69,NULL,NULL,NULL,0.16,0.87,-0.87,'2026-06-09 16:18:57'),(156,156,0.09,0.52,NULL,NULL,NULL,0.12,0.66,-0.66,'2026-06-09 16:18:57'),(157,157,0.25,1.38,NULL,NULL,NULL,0.31,1.75,-1.75,'2026-06-09 16:18:57'),(158,158,40.62,487.47,2768.00,718925,356099,58.58,702.91,270.09,'2026-06-09 16:18:57'),(159,159,0.11,0.61,NULL,NULL,NULL,0.14,0.77,-0.77,'2026-06-09 16:18:57'),(160,160,0.23,1.27,NULL,NULL,NULL,0.29,1.61,-1.61,'2026-06-09 16:18:57'),(161,161,0.34,1.89,NULL,NULL,NULL,0.43,2.40,-2.40,'2026-06-09 16:18:57'),(162,162,0.14,0.76,NULL,NULL,NULL,0.17,0.96,-0.96,'2026-06-09 16:18:57'),(163,163,0.32,3.49,NULL,NULL,NULL,0.37,4.06,-4.06,'2026-06-09 16:18:57'),(164,164,0.40,4.38,NULL,NULL,NULL,0.57,6.12,-6.12,'2026-06-09 16:18:57'),(165,165,0.15,1.62,NULL,NULL,NULL,0.16,1.77,-1.77,'2026-06-09 16:18:57'),(166,166,0.25,2.72,NULL,NULL,NULL,0.32,3.42,-3.42,'2026-06-09 16:18:57'),(167,167,1.20,12.96,0.00,NULL,0,1.48,16.04,-16.04,'2026-06-09 16:18:57'),(168,168,0.36,3.94,0.00,6000,0,0.41,4.47,-4.47,'2026-06-09 16:18:57'),(169,169,0.36,3.94,0.00,6000,0,0.41,4.47,1.53,'2026-06-09 16:18:57'),(170,170,0.50,5.36,0.00,8330,0,0.58,5.21,-2.45,'2026-06-09 16:18:57'),(171,171,0.81,8.82,0.00,13620,0,0.93,10.06,1.94,'2026-06-09 16:18:57'),(172,172,9.14,98.71,290.00,162000,38000,12.61,136.22,-8.92,'2026-06-09 16:18:57'),(173,173,1.51,17.00,70.00,30000,7000,1.74,18.75,6.25,'2026-06-09 16:18:57'),(174,174,0.15,1.03,NULL,NULL,NULL,0.19,1.31,-1.31,'2026-06-09 16:18:57'),(175,175,0.13,1.45,NULL,NULL,NULL,0.15,1.63,-1.63,'2026-06-09 16:18:57'),(176,176,0.31,3.31,NULL,NULL,NULL,0.49,5.26,-5.26,'2026-06-09 16:18:57'),(177,177,0.34,3.66,NULL,NULL,NULL,0.43,4.67,-4.67,'2026-06-09 16:18:57'),(178,178,0.13,1.38,NULL,NULL,NULL,0.14,1.53,-1.53,'2026-06-09 16:18:57'),(179,179,0.17,1.83,NULL,NULL,NULL,0.20,2.13,-2.13,'2026-06-09 16:18:57'),(180,180,0.06,0.67,NULL,NULL,NULL,0.07,0.07,-0.07,'2026-06-09 16:18:57'),(181,181,0.34,3.68,NULL,NULL,NULL,0.40,4.34,-4.34,'2026-06-09 16:18:57'),(182,182,0.27,2.97,NULL,NULL,NULL,0.34,3.65,-3.65,'2026-06-09 16:18:57'),(183,183,1.02,11.04,NULL,NULL,NULL,1.26,13.56,-13.56,'2026-06-09 16:18:57'),(184,184,18.52,222.24,677.47,298000,39874,25.77,278.33,180.67,'2026-06-09 16:18:57'),(185,185,0.25,2.65,NULL,NULL,NULL,0.30,3.28,-3.28,'2026-06-09 16:18:57'),(186,186,0.24,2.59,NULL,NULL,NULL,0.28,3.04,-3.04,'2026-06-09 16:18:57'),(187,187,0.75,8.07,NULL,NULL,NULL,0.96,10.41,-10.41,'2026-06-09 16:18:57'),(188,188,0.33,3.56,NULL,NULL,NULL,0.43,4.66,-4.66,'2026-06-09 16:18:57'),(189,189,0.40,4.41,NULL,NULL,NULL,NULL,NULL,0.00,'2026-06-09 16:18:57'),(190,190,2.75,29.75,NULL,NULL,NULL,NULL,NULL,38.00,'2026-06-09 16:18:57'),(191,191,12.82,138.53,244.00,186452,79802,14.31,154.57,28.43,'2026-06-09 16:18:57'),(192,192,0.20,2.20,NULL,NULL,NULL,0.23,2.49,-2.49,'2026-06-09 16:18:57'),(193,193,0.75,8.10,NULL,NULL,NULL,0.89,9.66,0.34,'2026-06-09 16:18:57'),(194,194,0.23,2.47,NULL,NULL,NULL,0.25,2.72,-2.72,'2026-06-09 16:18:57'),(195,195,0.24,2.63,NULL,NULL,NULL,0.30,3.23,-3.23,'2026-06-09 16:18:57'),(196,196,0.92,9.98,NULL,NULL,NULL,1.16,12.53,-12.53,'2026-06-09 16:18:57'),(197,197,0.35,3.83,NULL,NULL,NULL,0.43,4.59,-4.59,'2026-06-09 16:18:57'),(198,198,5.56,60.05,65.00,136400,7700,8.42,90.90,-3.90,'2026-06-09 16:18:57'),(199,199,0.35,3.75,NULL,NULL,NULL,0.43,4.67,-4.67,'2026-06-09 16:18:57'),(200,200,0.25,2.68,NULL,NULL,NULL,0.30,3.23,-3.23,'2026-06-09 16:18:57'),(201,201,0.17,1.82,NULL,NULL,NULL,0.19,2.01,-2.01,'2026-06-09 16:18:57'),(202,202,1.68,18.14,0.00,28000,0,2.12,22.86,-22.86,'2026-06-09 16:18:57'),(203,203,0.20,1.34,NULL,NULL,NULL,0.25,1.70,-1.70,'2026-06-09 16:18:57'),(204,204,0.19,1.31,NULL,NULL,NULL,0.25,1.66,7.29,'2026-06-09 16:18:57'),(205,205,19.82,237.86,1441.00,354000,207000,24.97,299.64,295.36,'2026-06-09 16:18:57'),(206,206,0.16,0.89,NULL,NULL,NULL,0.20,1.13,-1.13,'2026-06-09 16:18:57'),(207,207,0.13,0.71,NULL,NULL,NULL,0.16,0.90,-0.90,'2026-06-09 16:18:57'),(208,208,0.29,1.65,NULL,NULL,NULL,0.37,2.09,-2.09,'2026-06-09 16:18:57'),(209,209,0.08,0.47,NULL,NULL,NULL,0.11,0.60,-0.60,'2026-06-09 16:18:57'),(210,210,0.17,0.97,NULL,NULL,NULL,0.22,1.23,-1.23,'2026-06-09 16:18:57'),(211,211,0.15,0.84,NULL,NULL,NULL,0.19,1.07,-1.07,'2026-06-09 16:18:57'),(212,212,2.43,26.25,NULL,NULL,NULL,3.09,33.36,-15.36,'2026-06-09 16:18:57'),(213,213,0.19,1.05,NULL,NULL,NULL,0.24,1.33,-1.33,'2026-06-09 16:18:57'),(214,214,0.14,0.79,NULL,NULL,NULL,0.18,1.00,-1.00,'2026-06-09 16:18:57'),(215,215,3.77,44.47,161.00,62833,24737,4.75,51.30,-17.30,'2026-06-09 16:18:57'),(216,216,0.19,2.07,NULL,NULL,NULL,0.23,2.44,-2.44,'2026-06-09 16:18:57'),(217,217,0.25,2.71,NULL,NULL,NULL,0.30,3.27,-3.27,'2026-06-09 16:18:57'),(218,218,0.19,2.10,NULL,NULL,NULL,0.25,2.66,-2.66,'2026-06-09 16:18:57'),(219,219,0.30,3.21,NULL,NULL,NULL,0.38,4.15,-4.15,'2026-06-09 16:18:57'),(220,220,1.35,14.58,NULL,NULL,NULL,1.39,15.11,4.89,'2026-06-09 16:18:57'),(221,221,0.73,7.86,NULL,NULL,NULL,0.89,9.58,-9.58,'2026-06-09 16:18:57'),(222,222,0.29,3.08,NULL,NULL,NULL,0.36,3.84,-3.84,'2026-06-09 16:18:57'),(223,223,0.14,1.51,NULL,NULL,NULL,0.15,1.66,-1.66,'2026-06-09 16:18:57'),(224,224,0.34,3.62,NULL,NULL,NULL,0.40,4.30,-4.30,'2026-06-09 16:18:57'),(225,225,10.01,120.12,245.00,150300,41371,11.87,128.19,44.81,'2026-06-09 16:18:57'),(226,226,0.24,2.57,NULL,NULL,NULL,0.29,3.10,-3.10,'2026-06-09 16:18:57'),(227,227,0.14,1.46,NULL,NULL,NULL,0.18,1.89,-1.89,'2026-06-09 16:18:57'),(228,228,3.12,33.69,0.00,52000,0,3.93,42.46,-42.46,'2026-06-09 16:18:57'),(229,229,1.18,12.77,NULL,NULL,NULL,1.45,15.66,9.34,'2026-06-09 16:18:57'),(230,230,4.49,48.48,0.00,85000,0,5.42,58.49,-18.49,'2026-06-09 16:18:57'),(231,231,0.13,1.42,NULL,NULL,NULL,0.13,1.42,-1.42,'2026-06-09 16:18:57'),(232,232,0.29,3.16,NULL,NULL,NULL,0.34,3.67,1.33,'2026-06-09 16:18:57'),(233,233,0.27,3.03,NULL,NULL,NULL,0.35,3.74,1.26,'2026-06-09 16:18:57'),(234,234,0.14,1.56,NULL,NULL,NULL,0.18,1.93,-1.93,'2026-06-09 16:18:57'),(235,235,0.34,3.67,NULL,NULL,NULL,0.39,4.26,-4.26,'2026-06-09 16:18:57'),(236,236,0.24,2.56,NULL,NULL,NULL,0.30,3.25,-3.25,'2026-06-09 16:18:57'),(237,237,1.24,13.39,NULL,NULL,NULL,1.27,13.70,1.30,'2026-06-09 16:18:57'),(238,238,0.57,6.11,NULL,NULL,NULL,0.68,7.29,-7.29,'2026-06-09 16:18:57'),(239,239,1.51,16.31,NULL,NULL,NULL,1.65,17.82,22.18,'2026-06-09 16:18:57'),(240,240,0.50,5.40,NULL,NULL,NULL,0.54,5.91,4.09,'2026-06-09 16:18:57'),(241,241,0.17,1.86,NULL,NULL,NULL,0.19,2.09,-2.09,'2026-06-09 16:18:57'),(242,242,0.71,7.65,NULL,NULL,NULL,0.90,9.73,-9.73,'2026-06-09 16:18:57'),(243,243,0.27,1.49,NULL,NULL,NULL,0.34,1.89,-1.89,'2026-06-09 16:18:57'),(244,244,0.62,6.66,NULL,NULL,NULL,0.78,8.46,-8.46,'2026-06-09 16:18:57'),(245,245,0.79,8.50,NULL,NULL,NULL,1.00,10.79,-10.79,'2026-06-09 16:18:57'),(246,246,0.78,8.45,NULL,NULL,NULL,0.99,10.74,-10.74,'2026-06-09 16:18:57'),(247,247,0.27,1.51,NULL,NULL,NULL,0.34,1.92,-1.92,'2026-06-09 16:18:57'),(248,248,0.23,2.52,NULL,NULL,NULL,0.30,3.21,-3.21,'2026-06-09 16:18:57'),(249,249,0.18,0.99,NULL,NULL,NULL,0.22,1.26,-1.26,'2026-06-09 16:18:57'),(250,250,0.32,1.78,NULL,NULL,NULL,0.40,2.26,-2.26,'2026-06-09 16:18:57'),(251,251,2.25,24.32,NULL,NULL,NULL,2.86,30.90,-30.90,'2026-06-09 16:18:57'),(252,252,0.40,0.22,NULL,NULL,NULL,0.50,2.82,-2.82,'2026-06-09 16:18:57'),(253,253,0.22,2.78,NULL,NULL,NULL,NULL,NULL,0.00,'2026-06-09 16:18:57'),(254,254,1.33,14.36,NULL,NULL,NULL,NULL,NULL,17.00,'2026-06-09 16:18:57'),(255,255,1.79,19.32,NULL,NULL,NULL,2.33,25.22,-20.22,'2026-06-09 16:18:57'),(256,256,2.06,22.20,NULL,NULL,NULL,2.40,25.93,-10.93,'2026-06-09 16:18:57'),(257,257,20.63,247.50,1442.00,415000,156300,28.37,340.50,341.50,'2026-06-09 16:18:57');
/*!40000 ALTER TABLE `population_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rivers`
--

DROP TABLE IF EXISTS `rivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rivers` (
  `river_id` int NOT NULL AUTO_INCREMENT,
  `river_name` varchar(100) NOT NULL,
  PRIMARY KEY (`river_id`),
  UNIQUE KEY `river_name` (`river_name`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rivers`
--

LOCK TABLES `rivers` WRITE;
/*!40000 ALTER TABLE `rivers` DISABLE KEYS */;
INSERT INTO `rivers` VALUES (2,'Aligarh  Drain ( Irrigation )'),(270,'Assi'),(68,'Betwa'),(27,'DEVRANIYA'),(6,'Ganga'),(4,'Ghaghara'),(38,'Ghaghra'),(5,'Gomti'),(55,'Harnandi (Hindon)'),(40,'Ishan'),(143,'kaali Nadi'),(32,'Kali'),(208,'Kali West'),(90,'Karvan'),(20,'Ken'),(242,'Khannaut'),(179,'Kosi Arterial Channel'),(244,'Krishni'),(36,'Mandakini'),(240,'Morwa'),(7,'NA'),(28,'NAKTIA RIVER'),(109,'Pahunch'),(141,'Pandu'),(29,'Ram ganga'),(64,'Ramgarhtal'),(65,'Rapti'),(66,'Rohini'),(77,'Sai'),(145,'Sarayan'),(14,'Saryu'),(266,'Sone'),(3,'Tamsa'),(150,'ULL RIVER'),(241,'Varuna'),(1,'Yamuna');
/*!40000 ALTER TABLE `rivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `town_rivers`
--

DROP TABLE IF EXISTS `town_rivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `town_rivers` (
  `town_river_id` int NOT NULL AUTO_INCREMENT,
  `town_city_id` int NOT NULL,
  `river_id` int NOT NULL,
  PRIMARY KEY (`town_river_id`),
  UNIQUE KEY `town_city_id` (`town_city_id`,`river_id`),
  KEY `river_id` (`river_id`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `town_rivers`
--

LOCK TABLES `town_rivers` WRITE;
/*!40000 ALTER TABLE `town_rivers` DISABLE KEYS */;
INSERT INTO `town_rivers` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,7),(9,9,1),(10,10,7),(11,11,7),(12,12,7),(13,13,7),(14,14,14),(15,15,3),(16,16,1),(17,17,6),(18,18,7),(19,19,7),(20,20,20),(21,21,7),(22,22,7),(23,23,7),(24,24,7),(25,25,7),(26,26,5),(27,27,27),(28,27,28),(29,27,29),(30,28,6),(31,29,6),(32,30,32),(33,31,32),(34,32,6),(35,33,6),(36,34,36),(37,35,1),(38,36,38),(39,37,38),(40,38,40),(41,39,1),(42,40,1),(43,41,6),(44,42,6),(45,43,7),(46,44,7),(47,45,7),(48,46,7),(49,47,7),(50,48,7),(51,49,7),(52,50,7),(53,51,6),(54,52,1),(55,53,55),(56,54,55),(59,55,1),(58,55,32),(57,55,55),(60,56,6),(61,57,6),(62,58,6),(63,59,38),(64,60,64),(65,60,65),(66,60,66),(67,61,7),(69,62,1),(68,62,68),(70,63,7),(71,64,7),(72,65,7),(73,66,7),(74,67,7),(75,68,6),(76,69,32),(77,70,77),(78,71,77),(79,72,77),(80,73,77),(81,74,77),(82,75,77),(83,76,77),(84,77,77),(85,78,77),(86,79,77),(87,80,77),(88,81,77),(89,82,77),(90,83,90),(91,84,7),(92,85,7),(93,86,7),(94,87,1),(95,88,7),(96,89,7),(97,90,7),(98,91,7),(99,92,7),(100,93,7),(101,94,7),(102,95,5),(103,96,7),(104,97,7),(105,98,7),(106,99,7),(107,100,7),(108,101,7),(109,102,109),(110,103,7),(111,104,7),(112,105,7),(113,106,7),(114,107,7),(115,108,7),(116,109,7),(117,110,7),(118,111,6),(119,112,7),(120,113,7),(121,114,7),(122,115,7),(123,116,7),(124,117,7),(125,118,7),(126,119,7),(127,120,7),(128,121,7),(129,122,7),(130,123,7),(131,124,7),(132,125,7),(133,126,7),(134,127,7),(135,128,7),(136,129,7),(137,130,6),(138,131,6),(139,132,7),(140,133,6),(141,133,141),(142,134,7),(143,135,143),(144,136,6),(145,137,145),(146,138,145),(147,139,145),(148,140,145),(149,141,145),(150,141,150),(151,142,145),(152,143,145),(153,144,145),(154,145,145),(155,146,145),(156,147,145),(157,148,145),(158,149,145),(159,150,7),(160,151,7),(161,152,7),(162,153,5),(163,154,5),(164,155,5),(165,156,5),(166,157,5),(167,158,5),(168,158,77),(169,159,5),(170,160,5),(171,161,5),(172,162,5),(173,163,7),(174,164,7),(175,165,7),(176,166,7),(177,167,7),(178,168,40),(179,169,179),(180,170,1),(181,171,179),(182,172,1),(183,173,1),(184,174,4),(185,175,7),(186,176,7),(187,177,7),(188,178,7),(189,179,7),(190,180,55),(191,181,7),(192,182,7),(193,183,7),(194,184,32),(195,185,7),(196,186,7),(197,187,55),(198,188,7),(199,189,6),(200,190,6),(201,191,29),(202,192,7),(203,193,55),(204,194,7),(205,195,7),(206,196,7),(207,197,7),(208,198,208),(209,199,7),(210,200,7),(211,201,7),(212,202,5),(213,203,6),(214,204,77),(216,205,1),(215,205,6),(217,206,77),(218,207,6),(219,208,77),(220,209,77),(221,210,77),(222,211,77),(223,212,77),(224,213,77),(225,214,77),(226,215,29),(227,216,7),(228,217,7),(229,218,7),(230,219,7),(231,220,208),(232,221,7),(233,222,7),(234,223,32),(235,224,32),(236,225,55),(237,226,7),(238,227,7),(239,228,6),(240,229,240),(241,229,241),(242,230,242),(243,231,7),(244,232,244),(245,233,244),(246,234,7),(247,235,7),(248,236,7),(249,237,1),(250,238,7),(251,239,244),(252,240,244),(253,241,7),(254,242,145),(255,243,145),(256,244,145),(257,245,145),(258,246,145),(259,247,145),(260,248,5),(261,248,145),(262,249,145),(263,250,145),(264,251,145),(265,252,145),(266,253,266),(267,254,5),(268,255,6),(269,256,6),(271,257,6),(272,257,241),(270,257,270);
/*!40000 ALTER TABLE `town_rivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `towns_cities`
--

DROP TABLE IF EXISTS `towns_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `towns_cities` (
  `town_city_id` int NOT NULL AUTO_INCREMENT,
  `district_id` int NOT NULL,
  `town_city_name` varchar(150) NOT NULL,
  PRIMARY KEY (`town_city_id`),
  UNIQUE KEY `district_id` (`district_id`,`town_city_name`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `towns_cities`
--

LOCK TABLES `towns_cities` WRITE;
/*!40000 ALTER TABLE `towns_cities` DISABLE KEYS */;
INSERT INTO `towns_cities` VALUES (1,1,'Agra'),(2,2,'Aligarh'),(3,3,'AKBARPUR'),(4,3,'Tanda'),(5,4,'Gauriganj'),(6,5,'Amroha'),(7,6,'Achhalda'),(8,6,'Atasu'),(9,6,'Auraiya'),(10,6,'Babarpur Ajitmal'),(11,6,'Bidhuna'),(12,6,'Dibiyapur'),(13,6,'Phaphund'),(14,7,'Ayodhya'),(15,8,'Jahanganj Bazar'),(16,9,'Baghpat Town'),(17,10,'Ballia'),(18,11,'Atarra'),(19,11,'Baberu'),(20,11,'Banda'),(21,11,'Bisanda Buzurg'),(22,11,'Mataundh'),(23,11,'Naraini'),(24,11,'Oran'),(25,11,'Tindwari'),(26,12,'Nawabganj'),(27,13,'Bareilly'),(28,14,'Bijnor'),(29,15,'Anupshahr(NPP)'),(30,15,'BULANDSHAHR (NPP)'),(31,15,'Gulaothi'),(32,15,'Narora'),(33,16,'Mugalsarai'),(34,17,'Chitrakoot Manikpur Sarhat (NP)'),(35,17,'Rajapur (NP)'),(36,18,'Gaura Barhaj'),(37,18,'Lar'),(38,19,'etah'),(39,20,'Bakewar'),(40,20,'Etawah'),(41,21,'Farrukhabad cum Fatehgarh'),(42,21,'Fatehgarh'),(43,21,'Kaimganj'),(44,21,'Kamalganj'),(45,21,'Kampil'),(46,21,'Khimsepur'),(47,21,'Mohammadabad'),(48,21,'Nawabganj'),(49,21,'Sankisa Basantpur'),(50,21,'Shamsabad'),(51,22,'Fatehpur (NPP)'),(52,23,'Firozabad'),(53,24,'Greater Noida'),(54,24,'Noida'),(55,25,'Ghaziabad'),(56,26,'Ghazipur'),(57,26,'Saidpur'),(58,26,'Zamania'),(59,27,'Barhalganj'),(60,27,'Gorakhpur'),(61,28,'Gohand'),(62,28,'Hamirpur'),(63,28,'Kurara'),(64,28,'Maudaha'),(65,28,'Rath'),(66,28,'Sarila'),(67,28,'Sumerpur'),(68,29,'Garmukteshwar'),(69,29,'Hapur'),(70,30,'Beniganj'),(71,30,'Bilgram'),(72,30,'Gopamau'),(73,30,'Hardoi'),(74,30,'Kachauna Patsaini'),(75,30,'Kursath'),(76,30,'Madhoganj'),(77,30,'Mallawan'),(78,30,'Pali'),(79,30,'Pihani'),(80,30,'Sandi'),(81,30,'Sandila'),(82,30,'Shahabad'),(83,31,'Hathras'),(84,32,'Ait'),(85,32,'Jalaun - NPP'),(86,32,'Kadaura'),(87,32,'Kalpi'),(88,32,'Konch'),(89,32,'Kotra'),(90,32,'Madhogarh'),(91,32,'Nadigaon'),(92,32,'Orai'),(93,32,'Rampura'),(94,32,'Umri'),(95,33,'Jaunpur'),(96,34,'Badagaon'),(97,34,'Barua Sagar'),(98,34,'Chirgaon'),(99,34,'Erich'),(100,34,'Garautha'),(101,34,'Gursarai'),(102,34,'Jhansi'),(103,34,'Kathera'),(104,34,'Mauranipur'),(105,34,'Moth'),(106,34,'Ranipur'),(107,34,'Samthar'),(108,34,'Todi Fatehpur'),(109,35,'Chhibramau'),(110,35,'Gursahaiganj'),(111,35,'Kannauj'),(112,35,'Samdhan'),(113,35,'Saurikh'),(114,35,'Sikandarpur'),(115,35,'Talgram'),(116,35,'Tirwaganj'),(117,36,'Akbarpur'),(118,36,'Amraudha'),(119,36,'Derapur'),(120,36,'Jhinjhak'),(121,36,'Kanchausi'),(122,36,'Musa Nagar'),(123,36,'Pukharayan'),(124,36,'Rajpur'),(125,36,'Raniya'),(126,36,'Rasulabad'),(127,36,'Rura'),(128,36,'Shivli'),(129,36,'Sikandra'),(130,37,'Bilhaur'),(131,37,'Bithoor'),(132,37,'Ghatampur'),(133,37,'Kanpur Nagar'),(134,37,'Shivrajpur'),(135,38,'Kasganj'),(136,39,'Daranagar'),(137,40,'Barbar'),(138,40,'Bhira'),(139,40,'Dhaurahara'),(140,40,'Gola'),(141,40,'Gola Gokaran Nath'),(142,40,'Kheri'),(143,40,'Lakhimpur'),(144,40,'Mailani'),(145,40,'Mohammadi'),(146,40,'Nighasan'),(147,40,'Oel Dhakhwa'),(148,40,'Palia'),(149,40,'Singahi Bhedaura'),(150,41,'Mehroni'),(151,41,'Pali'),(152,41,'Talbehat'),(153,42,'Amethi'),(154,42,'Bakshi Ka Talab'),(155,42,'Gosaiganj'),(156,42,'Intaunja'),(157,42,'Kakori'),(158,42,'Lucknow'),(159,42,'Mahona'),(160,42,'Malihabad'),(161,42,'Mohanlalganj'),(162,42,'Nagram'),(163,43,'Charkhari'),(164,43,'Kabrai'),(165,43,'Kharela'),(166,43,'Kulpahad'),(167,43,'Mahoba'),(168,44,'Chhata'),(169,45,'Chhata'),(170,45,'Govardhan'),(171,45,'Kosi Kalan'),(172,45,'Mathura'),(173,45,'Vrindavan'),(174,46,'Dohrighat'),(175,47,'Bahsuma'),(176,47,'Daurala'),(177,47,'Hastinapur'),(178,47,'Karnawal'),(179,47,'Kharkhoda'),(180,47,'Kinauni'),(181,47,'Kithaur'),(182,47,'Lawar'),(183,47,'Mawana'),(184,47,'Meerut'),(185,47,'Parikshitgarh'),(186,47,'Phalauda'),(187,47,'Sardhana'),(188,47,'Sewal Khas'),(189,48,'Chunar'),(190,48,'Mirzapur'),(191,49,'Moradabad'),(192,50,'Bhokarrhedi'),(193,50,'Budhana'),(194,50,'Charthawal'),(195,50,'Jansath'),(196,50,'Khatauli'),(197,50,'Mirapur'),(198,50,'Muzaffarnagar'),(199,50,'Purquazi'),(200,50,'Shahpur'),(201,50,'Sisauli'),(202,51,'Pilibhit'),(203,52,'Manikpur'),(204,52,'Pratapgarh City (NP)'),(205,53,'Prayagraj (M. Corp)'),(206,54,'Bachhrawan'),(207,54,'Dalmau'),(208,54,'Lalganj'),(209,54,'Maharajganj'),(210,54,'Naserabad'),(211,54,'Parsadepur'),(212,54,'Rae Bareli'),(213,54,'Salon'),(214,54,'Unchahar'),(215,55,'Rampur'),(216,56,'Ambehta'),(217,56,'Behat'),(218,56,'Chhutmalpur'),(219,56,'Chilkana Sultanpur'),(220,56,'Deoband'),(221,56,'Gangoh'),(222,56,'Nakur'),(223,56,'Nanauta'),(224,56,'Rampur Maniharan'),(225,56,'Saharanpur'),(226,56,'Sarsawan'),(227,56,'Titron'),(228,57,'Sambhal'),(229,58,'Bhadohi'),(230,59,'SHAHJAHANPUR (NPP)'),(231,60,'Ailum'),(232,60,'Banat'),(233,60,'Bantikhera & Babri'),(234,60,'Gadhi Pukta'),(235,60,'Jalalabad'),(236,60,'Jhinjhana'),(237,60,'Kairana'),(238,60,'Kandhla'),(239,60,'Shamli'),(240,60,'Thanabhawan'),(241,60,'Unn'),(242,61,'Biswan'),(243,61,'Hargaon'),(244,61,'Khairabad'),(245,61,'Laharpur'),(246,61,'Mahmodabad'),(247,61,'Maholi'),(248,61,'Mishrikh Namisharanay'),(249,61,'Paintepur'),(250,61,'Sidhauli'),(251,61,'Sitapur'),(252,61,'Tambor Ahamdabad'),(253,62,'Chopan'),(254,63,'Sultanpur'),(255,64,'Shuklaganj NPP'),(256,64,'Unnao NPP'),(257,65,'Varanasi');
/*!40000 ALTER TABLE `towns_cities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:01
CREATE DATABASE  IF NOT EXISTS `audit_weekly_progress_of_namami_gange_completed_projects` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `audit_weekly_progress_of_namami_gange_completed_projects`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: audit_weekly_progress_of_namami_gange_completed_projects
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
-- Table structure for table `audit_agencies`
--

DROP TABLE IF EXISTS `audit_agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_agencies` (
  `agency_id` int NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`agency_id`),
  UNIQUE KEY `agency_name` (`agency_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10367 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_agencies`
--

LOCK TABLES `audit_agencies` WRITE;
/*!40000 ALTER TABLE `audit_agencies` DISABLE KEYS */;
INSERT INTO `audit_agencies` VALUES (10342,'M/s Anandi Lal Lalpuriya JV M/s Krishna  Contractors JV M/s Khilari  SS'),(10347,'M/S C.S. ENTERPRISES'),(10333,'M/s Eco Protection Engineer Pvt Ltd'),(10335,'M/s EIEPL Bareilly Infra Engineers Ltd'),(10361,'M/s EIEPL- ABI(JV)'),(10351,'M/S Elefo Biotech Pvt Limited'),(10337,'M/s EMS India Pvt Limited JV with M/s UEM India Pvt Ltd'),(10363,'M/s Enviro Infra Engineers limited MTS JV'),(10345,'M/S G.S.J. Envo Limited'),(10350,'M/s Hindustan Engineering, Lucknow'),(10339,'M/S HNB Engineers Private Ltd.'),(10334,'M/s ICPL-OASIS-LNA (JV)'),(10346,'M/s Kanpur River Management Pvt. Ltd.'),(10362,'M/s KRMPL Kanpur'),(10358,'M/s L&T Construction, WSW & C-IC, Network Project'),(10353,'M/s Larsen & Toubro Limited'),(10336,'M/s Laxmi Construction & Co JV M/s Backcone Enterprises JV M/s Oasis OPC Solution'),(10341,'M/s Mirzapur Ghazipur STPs Private Limited'),(10354,'M/S Muzaffarnagar STP Pvt Ltd'),(10349,'M/s MWMPL Pvt Ltd'),(10359,'M/s Passavant Energy & Environment'),(10356,'M/s Prayagraj Water Private Limited'),(10357,'M/s Ramky Infrastructure Ltd.'),(10332,'M/S Satish kumar &co.'),(10340,'M/s Shree- Tech Construction'),(10348,'M/S Shrishti Sam Lain Yogi JV'),(10360,'M/s SIPL RKC JV'),(10364,'M/s SNET- N&S –RISPL JV'),(10343,'M/s SPML- PPPL JV'),(10344,'M/S Surendra Singh'),(10355,'M/s UEM India Pvt Ltd'),(10366,'M/s Varanasi STP Project Pvt. Ltd'),(10338,'M/s VVIP-BCPL Joint Venture'),(10352,'Moradabad STP Pvt Ltd'),(10365,'Pkg-1- M/s EMS Infracon Pvt. Ltd, Pkg-2- M/s UEM India Pvt. Ltd, Pkg-3- M/s Va Tech Wabag Ltd, Pkg-4- M/s Sriram EPC Ltd and Pkg-5- M/s Kirloskar Brothers Ltd');
/*!40000 ALTER TABLE `audit_agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_cities`
--

DROP TABLE IF EXISTS `audit_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_cities` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `district_id` int NOT NULL,
  `city_name` varchar(255) NOT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `uk_city` (`district_id`,`city_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9184 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_cities`
--

LOCK TABLES `audit_cities` WRITE;
/*!40000 ALTER TABLE `audit_cities` DISABLE KEYS */;
INSERT INTO `audit_cities` VALUES (9153,6507,'Ayodhya'),(9154,6507,'Faizabad'),(9155,6508,'Baghpat'),(9156,6509,'Bareilly'),(9157,6510,'Anupshehar'),(9158,6510,'Narora'),(9159,6511,'Etawah'),(9160,6512,'Farrukhabad-Fatehgarh'),(9161,6513,'Firozabad'),(9162,6514,'Ghazipur'),(9163,6515,'Garmukteshwar'),(9164,6516,'Jaunpur'),(9165,6517,'Kannauj'),(9167,6518,'Bithoor'),(9166,6518,'Kanpur Nagar'),(9168,6519,'Kasganj'),(9169,6520,'Mathura'),(9170,6520,'Vrindavan'),(9171,6521,'Chunar'),(9172,6521,'Mirzapur'),(9173,6522,'Moradabad'),(9174,6523,'Budhana'),(9175,6523,'Muzzaffarnagar'),(9177,6524,'Naini, Jhunsi, Phaphamau'),(9176,6524,'Prayagraj'),(9178,6525,'Kairana'),(9179,6526,'Sultanpur'),(9180,6527,'Shuklaganj'),(9181,6527,'Unnao'),(9183,6528,'Ramnagar'),(9182,6528,'Varanasi');
/*!40000 ALTER TABLE `audit_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_districts`
--

DROP TABLE IF EXISTS `audit_districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_districts` (
  `district_id` int NOT NULL AUTO_INCREMENT,
  `district_name` varchar(255) NOT NULL,
  PRIMARY KEY (`district_id`),
  UNIQUE KEY `district_name` (`district_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6529 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_districts`
--

LOCK TABLES `audit_districts` WRITE;
/*!40000 ALTER TABLE `audit_districts` DISABLE KEYS */;
INSERT INTO `audit_districts` VALUES (6507,'Ayodhya'),(6508,'Baghpat'),(6509,'Bareilly'),(6510,'Bulandshahr'),(6511,'Etawah'),(6512,'Farrukhabad'),(6513,'Firozabad'),(6514,'Ghazipur'),(6515,'Hapur'),(6516,'Jaunpur'),(6517,'Kannauj'),(6518,'Kanpur Nagar'),(6519,'Kasganj'),(6520,'Mathura'),(6521,'Mirzapur'),(6522,'Moradabad'),(6523,'Muzaffarnagar'),(6524,'PrayagRaj'),(6525,'Shamli'),(6526,'Sultanpur'),(6527,'Unnao'),(6528,'Varanasi');
/*!40000 ALTER TABLE `audit_districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_sewerage_projects`
--

DROP TABLE IF EXISTS `audit_sewerage_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_sewerage_projects` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `sr_no` int DEFAULT NULL,
  `district_id` int NOT NULL,
  `city_id` int DEFAULT NULL,
  `agency_id` int DEFAULT NULL,
  `project_name` varchar(1000) NOT NULL,
  `scheme_type` varchar(100) DEFAULT NULL,
  `project_mode` varchar(100) DEFAULT NULL,
  `sanction_date` date DEFAULT NULL,
  `sanction_cost` decimal(15,2) DEFAULT NULL,
  `work_cost` decimal(15,2) DEFAULT NULL,
  `centage` decimal(15,2) DEFAULT NULL,
  `om_cost` decimal(15,2) DEFAULT NULL,
  `stp_count` int DEFAULT NULL,
  `stp_capacity` decimal(15,2) DEFAULT NULL,
  `drain_count` int DEFAULT NULL,
  `agreement_cost` decimal(15,2) DEFAULT NULL,
  `remarks` longtext,
  `snapshot_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13025 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_sewerage_projects`
--

LOCK TABLES `audit_sewerage_projects` WRITE;
/*!40000 ALTER TABLE `audit_sewerage_projects` DISABLE KEYS */;
INSERT INTO `audit_sewerage_projects` VALUES (12981,NULL,6507,9153,10332,'I&D of Drains at Ayodhya-Ayodhya. DBOT, NGP','NGP','DBOT','2018-06-11',37.67,16.26,1.10,20.31,0,0.00,5,29.03,NULL,'2026-06-16 09:28:00'),(12982,NULL,6507,9154,10333,'Pollution Abatement Works for River Saryu/Ghaghara at Faizabad town, District-Ayodhya (Interception & Diversion of Drains with 33 MLD STP)','NGP','HAM','2021-05-06',221.66,109.03,7.62,105.01,1,33.00,15,149.47,'Completed','2026-06-16 09:28:00'),(12983,NULL,6508,9155,10334,'I&D and STP works at Bagpat','NGP','DBOT','2019-02-19',77.36,38.72,2.66,35.98,1,14.00,4,65.49,NULL,'2026-06-16 09:28:00'),(12984,NULL,6509,9156,10335,'Development of Sewage Treatment Plant at Bareilly','NGP','HAM','2019-01-03',271.39,139.44,10.70,121.25,3,63.00,15,233.72,NULL,'2026-06-16 09:28:00'),(12985,NULL,6510,9157,10336,'Anupshahar Sewerage Scheme','EAP','DBOT','2014-05-19',75.79,67.12,5.27,3.40,2,2.50,2,69.30,'Scheme Handed over to Local Bodies on dated 30.06.2024. After the said date, the operation and maintenance of the scheme is being done by Local Bodies.','2026-06-16 09:28:00'),(12986,NULL,6510,9158,10337,'Narora Sewerage Scheme','EAP','DBOT','2014-03-04',48.45,39.73,2.26,6.46,1,4.00,1,37.73,'Scheme Handed over to Local Bodies. The operation and maintenance of the scheme is being done by Local Bodies from 01.08.2025.','2026-06-16 09:28:00'),(12987,NULL,6511,9159,10338,'Etawah Sewerage Scheme ( Interception & Diversion Works) DIstt- Etawah','NGP1-NON EAP','DBOT','2019-02-28',140.60,56.85,3.90,79.85,1,21.00,2,119.93,'work completed. O&M in progress','2026-06-16 09:28:00'),(12988,NULL,6512,9160,10339,'I&D and STP works at Farrukhabad-Fatehgarh','NGP','HAM','2021-02-09',261.12,188.71,6.98,72.41,2,47.70,8,252.41,'Work Completed. Operation and Maintenance works under progress by M/S HNB Eng. Pvt. Ltd. Pune.','2026-06-16 09:28:00'),(12989,NULL,6513,9161,10340,'Firozabad Sewerage Scheme ( Interception & Diversion Works)  Distt Firozabad','NGP1-NON EAP','DBOT','2019-03-01',51.08,23.92,1.63,25.53,0,0.00,4,42.43,'work completed. O&M in progress','2026-06-16 09:28:00'),(12990,NULL,6514,9162,10341,'Sewerage, Sewage Treatment & Disposal for Ghazipur, U.P.','NGP','HAM','2020-05-06',152.83,50.96,4.08,96.17,1,21.00,23,140.94,'STP has been commissioned. Proposal of Additional cost implication approved by NMCG in EC meeting dt 13.02.2024. Work of TEPS and retaining wall is in progress. Works as per original agreement completed. Additional Work in progress','2026-06-16 09:28:00'),(12991,NULL,6515,9163,10342,'Garhmukteshwar Sewerage Scheme.','Non EAP','DBOT','2011-02-24',46.51,40.68,3.25,2.58,2,9.00,2,32.71,'Work completed. O&M in progress','2026-06-16 09:28:00'),(12992,NULL,6516,9164,10343,'Interception & Diversion  (I&D)  of Drains and Sewerage Treatment Plant at Jaunpur , U.P.','NGP','DBOT','2019-02-12',206.05,119.01,9.25,63.91,1,30.00,14,164.00,'Project under O&M by UPJN(Rural)','2026-06-16 09:28:00'),(12993,NULL,6517,9165,10344,'Kannauj Sewerage Scheme Phase II','Non EAP','DBOT','2011-02-24',43.66,37.77,3.63,2.26,0,0.00,0,39.65,'O&M works are being done by NPP, Kannauj.','2026-06-16 09:28:00'),(12994,NULL,6518,9166,10345,'I and D  of Sisamau and 5 other drains','NGP','DBOT','2016-10-03',63.80,57.63,4.61,1.55,0,0.00,3,57.12,'O&M work is in progress by M/s KRMPL under One city One operator.','2026-06-16 09:28:00'),(12995,NULL,6518,9166,10346,'I&D and STP works at Kanpur-Pankha','NGP','HAM','2018-03-12',967.23,248.39,31.05,718.84,1,30.00,3,708.70,'30 MLD STP Panka commissioned on dated 24.06.2023 and renovation work of 130 MLD STP Jajmau has been completed & COD issued on 17.10.2025. O&M work is in progress by M/s KRMPL under One city One operator.','2026-06-16 09:28:00'),(12996,NULL,6518,9167,10347,'Interception Diversion and Treatment works at Bithoor Town Kanpur','NGP','DBOT','2017-10-16',13.40,10.75,0.70,2.45,1,1.30,6,9.99,'Operation & Maintenance work under progress by M/S CS Enterprises','2026-06-16 09:28:00'),(12997,NULL,6518,9166,10348,'Sewerage Works in Sewerage Dist 1 Kanpur','NGP','DBOT','2016-10-18',430.49,392.82,23.81,12.86,0,0.00,3,418.31,'Operation & Maintenance work under progress by M/s Shristi Sam lain Yogi (JV)','2026-06-16 09:28:00'),(12998,NULL,6519,9168,10338,'Interception & Diversion (I&D) of drains and Sewerage Treatment Plant at Kasganj','NGP1-NON EAP','DBOT','2018-12-24',76.73,36.60,2.49,37.64,1,15.00,2,67.56,'* work completed. \n* O&M in progress','2026-06-16 09:28:00'),(12999,NULL,6520,9169,10349,'Rehabilation / Upgradation of Mathura Sewerage Scheme','NGP1-NON EAP','HAM','2017-12-13',460.45,264.39,8.78,187.28,1,30.00,19,437.95,'Work completed O&M in progress','2026-06-16 09:28:00'),(13000,NULL,6520,9170,10350,'Rehabilitation of Sewerage Infrastructure and Augmentation/upgradation of STP at Vrindavan','NGP1-NON EAP','DBOT','2017-03-29',42.82,14.76,1.18,26.88,1,4.00,3,33.50,'O&M  is Running','2026-06-16 09:28:00'),(13001,NULL,6521,9171,10351,'Faecal Sludge Management for abatement of pollution in River Ganga at Chunar, Mirzapur, U.P.','NGP','DBOT','2019-03-07',2.70,1.93,0.29,0.48,0,0.00,14,2.05,'Project under O&M by UPJN(Rural)','2026-06-16 09:28:00'),(13002,NULL,6521,9172,10341,'Interception & Diversion and STP at Mirzapur, U.P.','NGP','HAM','2020-05-28',129.08,50.50,4.04,73.06,2,17.00,18,151.58,'Temporary arrangement for discharge of treated effluent into existing channel completed. Permission for discharge of treated effluent yet to be obtained. DGC denied recommendation for discharge in irrigation canal. Now location for discharge is identified 02 KM downstream of canal into Khajuri River for which draft variation proposal was sent to NMCG. In meeting dt 07.06.2024 under chairmanship of ED(P) NMCG it is directed to send the variation proposal through UPJN(HQ)/SMCG for approval which is submitted to CE(Ganga) on 14.06.2024 Works completed. Balance work shall be completed after approval of variation','2026-06-16 09:28:00'),(13003,NULL,6522,9173,10352,'Interception & Diversion (I&D) of Drains and Sewerage Treatment Plant at Moradabad zone 2','NGP','HAM','2018-07-23',118.69,53.53,3.52,61.64,1,25.00,5,113.85,'STP under O&M','2026-06-16 09:28:00'),(13004,NULL,6522,9173,10353,'Prevention of Pollution of River Ramganga at Moradabad','Non EAP','DBOT','2011-02-24',330.03,278.85,19.03,32.17,1,58.00,14,244.00,'Under O&M','2026-06-16 09:28:00'),(13005,NULL,6523,9174,10354,'I&D and STP Work in Budhana Town','Non EAP','HAM','2019-02-18',48.76,25.10,1.70,21.96,1,10.00,3,41.28,'Commercial Operation Date declared, Plant under O&M since 01.04.2024.','2026-06-16 09:28:00'),(13006,NULL,6523,9175,10354,'I&D and STP Work in Muzaffarnagar','NGP','HAM','2020-01-13',234.03,108.32,7.33,118.36,2,54.50,5,205.09,'22 MLD STP Sahawali: Commercial Operation Date declared, Plant under O&M since 01.04.2024. 32.5 MLD Kidwai Nagar:Commercial Operation Date declared, Plant under O&M since 01.07.2024.','2026-06-16 09:28:00'),(13007,NULL,6524,9176,10355,'14 MLD Capacity STP at Salori Allahabad','NGRBA EAP','DBOT','2020-07-09',39.36,24.25,1.90,13.21,1,14.00,0,53.39,'In O&M under UPJN (Urban)','2026-06-16 09:28:00'),(13008,NULL,6524,9177,10356,'I&D and STP works for Naini (District-G) and Jhunsi works),  Phaphamau (District-F)','NGP','HAM','2019-05-19',767.59,280.14,21.66,465.79,3,72.00,18,350.60,'Under O&M','2026-06-16 09:28:00'),(13009,NULL,6524,9176,10356,'Rehabilitation and Operation & Maintenance of existing Sewage Treatment Infrastructure at Allahabad Uttar Pradesh under Hybrid Annuity based PPP Mode','NGP','HAM','2018-03-09',904.00,58.15,0.00,845.85,0,0.00,16,557.60,'Under O&M Rehabilitation of 3 no of STP of Capacity 29,60 and 60 MLD STP and associated MPS/SPS','2026-06-16 09:28:00'),(13010,NULL,6524,9176,10337,'Sewer Network in District E of Allahabad Part-II','NGRBA EAP','DBOT','2016-09-28',52.78,48.90,3.88,0.00,0,0.00,0,46.69,NULL,'2026-06-16 09:28:00'),(13011,NULL,6524,9176,10339,'Sewerage and Non Sewerage Schemes for Pollution abatement of River Ganga at Allahabad District B&EU.P','Non EAP','DBOT','2010-05-06',207.39,187.53,19.86,0.00,3,85.00,0,118.20,NULL,'2026-06-16 09:28:00'),(13012,NULL,6524,9176,10357,'Sewerage and Non Sewerage Schemes for Pollution abatement of River Ganga at Allahabad U.P District A','EAP','DBOT','2010-05-06',97.95,97.95,0.00,0.00,1,20.00,0,97.95,NULL,'2026-06-16 09:28:00'),(13013,NULL,6524,9176,10358,'Sewerage Scheme for District A','NGRBA EAP','DBOT','2019-11-11',299.39,269.10,19.75,10.54,0,0.00,0,292.29,'Under O&M','2026-06-16 09:28:00'),(13014,NULL,6524,9176,10337,'Sewerage Scheme for District B','NGRBA EAP','DBOT','2019-11-11',300.84,278.28,18.81,3.75,0,0.00,0,280.86,'Under O&M','2026-06-16 09:28:00'),(13015,NULL,6524,9176,10359,'Sewerage Scheme for District C','NGRBA EAP','DBOT','2019-09-13',170.95,154.01,9.87,7.07,0,0.00,0,165.41,'Under O&M','2026-06-16 09:28:00'),(13016,NULL,6524,9176,10355,'Sewerage work in Sewerage District E of Allahabad','NGRBA EAP','DBOT','2011-02-22',142.00,126.70,6.57,8.73,0,0.00,0,123.05,NULL,'2026-06-16 09:28:00'),(13017,NULL,6525,9178,10360,'I&D and STP Work in Kairana','CGF','DBOT','2020-12-07',78.42,37.28,2.63,38.51,1,15.00,1,59.19,'Commercial Operation Date declared, Plant under O&M since 01.03.2025.','2026-06-16 09:28:00'),(13018,NULL,6526,9179,10361,'I&D of Drains and Sewerage Treatment Plant works with 15 Years O&M at Sultanpur','NGP','DBOT','2018-12-24',70.18,40.83,2.59,26.76,3,17.00,6,67.59,'10 MLD Oxidation Pond upgradation completed. SCADA works under progress. 2 MLD STP work completed. SCADA wortks in progress 5MLD STP work completed. SCADA works under progress.','2026-06-16 09:28:00'),(13019,NULL,6527,9180,10362,'I&D of Drains and STP works in Shuklaganj (05MLD)','NGP','HAM','2017-07-28',65.18,25.93,1.90,37.35,1,5.00,5,38.87,'Total 7 drains are discharging into River Ganga in NPP Shuklaganj out of which 5 drains of discharge 4.66 MLD has to be Intercepted & Diverted to under Construction 5 MLD STP Shuklaganj and rest of the 02 drains of discharge 7.3 MLD has to be tapped & treated by U.P. J.N. (Urban) under SBM 2 programme. The work of tapping domestic sewage outflow through I&D was completed on 30.12.2025 by tapping 04 drains namely Indira Nagar, Manohar Nagar-1, Manohar Nagar-2 and Railway Bridge and trial run of the scheme has been started. The trial run of the scheme is to be done for 03 months, after which the operation of STP will start at full capacity. The work of cleaning 1.96 km drain and construction of Connecting Drain of 50 meters to bring 01 drain Ganga Vishnu Drain to I&D is to be done by M/s KRMPL','2026-06-16 09:28:00'),(13020,NULL,6527,9181,10362,'I&D of Drains and STP works in Unnao (15MLD)','NGP','HAM','2017-07-28',102.20,43.73,3.22,55.25,1,15.00,1,68.68,'The overall progress of the project is 99%. All works (Civil/Electrical & Mechanical) of the STP has been completed. Due to the rise in groundwater levels resulting from floods in the Ganga River and rainfall, the construction of the remaining 01 number of Manhole near the STP premises and the Dewatering work remained disrupted from August 2025 to January 2026. Against the Dewatering and dewatering works in 1200 mm RCC Pipe are in progress and dewatering work is being done in a length of 50 meters ahead of MH 37, which will be completed by the concessionaire M/s Kanpur River Management Pvt. Ltd., Kanpur by 15 June 2026','2026-06-16 09:28:00'),(13021,NULL,6528,9182,10363,'I&D and Treatment works for Assi-BHU Area (Phase-II), Varanasi','NGP','DBOT','2022-10-19',308.09,97.62,7.81,172.94,1,55.00,2,151.55,'55 MLD STP has been  commissioned with the  flow of 8 MLD STP Bhagwanpur STP and IPS are commissioned Finishing works are in progress Power connection of MPS done. MPS shall be commissioned on 18.02.2026 STP under trial-run','2026-06-16 09:28:00'),(13022,NULL,6528,9183,10364,'Interception, Diversion of Drains & Sewage Treatment Works at Ramnagar, Dist. Varanasi','NGP','DBOT','2017-07-28',71.26,21.89,1.75,45.91,1,10.00,5,69.42,'Project under O&M by UPJN(Rural)','2026-06-16 09:28:00'),(13023,NULL,6528,9182,10365,'JICA Assisted Ganga Action Plan (GAP) Phase-II, Varanasi','NGP','DBOT','2010-07-14',659.62,629.16,26.21,0.00,1,140.00,5,488.80,'SPS, MPS, 140 MLD STP Dinapur is under O&M by UPJN(Urban)','2026-06-16 09:28:00'),(13024,NULL,6528,9182,10366,'Sewerage Treatment Plant for Assi-BHU Sewerage District at Ramana, Varanasi','NGP','HAM','2017-09-21',161.31,102.00,8.16,26.11,1,50.00,1,153.15,'Project under O&M by UPJN(Rural)','2026-06-16 09:28:00');
/*!40000 ALTER TABLE `audit_sewerage_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:01
CREATE DATABASE  IF NOT EXISTS `jjm_completed_projects_audit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jjm_completed_projects_audit`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jjm_completed_projects_audit
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
-- Table structure for table `audit_agencies`
--

DROP TABLE IF EXISTS `audit_agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_agencies` (
  `audit_agency_id` int NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(255) NOT NULL,
  PRIMARY KEY (`audit_agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_agencies`
--

LOCK TABLES `audit_agencies` WRITE;
/*!40000 ALTER TABLE `audit_agencies` DISABLE KEYS */;
INSERT INTO `audit_agencies` VALUES (1,'M/s Anandi Lal Lalpuriya JV M/s Krishna  Contractors JV M/s Khilari  SS'),(2,'M/S C.S. ENTERPRISES'),(3,'M/s Eco Protection Engineer Pvt Ltd'),(4,'M/s EIEPL Bareilly Infra Engineers Ltd'),(5,'M/s EIEPL- ABI(JV)'),(6,'M/S Elefo Biotech Pvt Limited'),(7,'M/s EMS India Pvt Limited JV with M/s UEM India Pvt Ltd'),(8,'M/s Enviro Infra Engineers limited MTS JV'),(9,'M/S G.S.J. Envo Limited'),(10,'M/s Hindustan Engineering, Lucknow'),(11,'M/S HNB Engineers Private Ltd.'),(12,'M/s ICPL-OASIS-LNA (JV)'),(13,'M/s Kanpur River Management Pvt. Ltd.'),(14,'M/s KRMPL Kanpur'),(15,'M/s L&T Construction, WSW & C-IC, Network Project'),(16,'M/s Larsen & Toubro Limited'),(17,'M/s Laxmi Construction & Co JV M/s Backcone Enterprises JV M/s Oasis OPC Solution'),(18,'M/s Mirzapur Ghazipur STPs Private Limited'),(19,'M/S Muzaffarnagar STP Pvt Ltd'),(20,'M/s MWMPL Pvt Ltd'),(21,'M/s Passavant Energy & Environment'),(22,'M/s Prayagraj Water Private Limited'),(23,'M/s Ramky Infrastructure Ltd.'),(24,'M/S Satish kumar &co.'),(25,'M/s Shree- Tech Construction'),(26,'M/S Shrishti Sam Lain Yogi JV'),(27,'M/s SIPL RKC JV'),(28,'M/s SNET- N&S –RISPL JV'),(29,'M/s SPML- PPPL JV'),(30,'M/S Surendra Singh'),(31,'M/s UEM India Pvt Ltd'),(32,'M/s Varanasi STP Project Pvt. Ltd'),(33,'M/s VVIP-BCPL Joint Venture'),(34,'Moradabad STP Pvt Ltd'),(35,'Pkg-1- M/s EMS Infracon Pvt. Ltd, Pkg-2- M/s UEM India Pvt. Ltd, Pkg-3- M/s Va Tech Wabag Ltd, Pkg-4- M/s Sriram EPC Ltd and Pkg-5- M/s Kirloskar Brothers Ltd');
/*!40000 ALTER TABLE `audit_agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_cities`
--

DROP TABLE IF EXISTS `audit_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_cities` (
  `audit_city_id` int NOT NULL AUTO_INCREMENT,
  `audit_district_id` int NOT NULL,
  `city_name` varchar(255) NOT NULL,
  PRIMARY KEY (`audit_city_id`),
  KEY `audit_district_id` (`audit_district_id`),
  CONSTRAINT `audit_cities_ibfk_1` FOREIGN KEY (`audit_district_id`) REFERENCES `audit_districts` (`audit_district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_cities`
--

LOCK TABLES `audit_cities` WRITE;
/*!40000 ALTER TABLE `audit_cities` DISABLE KEYS */;
INSERT INTO `audit_cities` VALUES (1,2,'Ayodhya'),(2,1,'Faizabad'),(3,3,'Baghpat'),(4,4,'Bareilly'),(5,5,'Anupshehar'),(6,5,'Narora'),(7,6,'Etawah'),(8,7,'Farrukhabad-Fatehgarh'),(9,8,'Firozabad'),(10,9,'Ghazipur'),(11,10,'Garmukteshwar'),(12,11,'Jaunpur'),(13,12,'Kannauj'),(14,13,'Bithoor'),(15,13,'Kanpur Nagar'),(16,14,'Kasganj'),(17,15,'Mathura'),(18,15,'Vrindavan'),(19,16,'Chunar'),(20,16,'Mirzapur'),(21,17,'Moradabad'),(22,18,'Budhana'),(23,18,'Muzzaffarnagar'),(24,19,'Naini, Jhunsi, Phaphamau'),(25,19,'Prayagraj'),(26,20,'Kairana'),(27,21,'Sultanpur'),(28,22,'Shuklaganj'),(29,22,'Unnao'),(30,23,'Ramnagar'),(31,23,'Varanasi');
/*!40000 ALTER TABLE `audit_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_districts`
--

DROP TABLE IF EXISTS `audit_districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_districts` (
  `audit_district_id` int NOT NULL AUTO_INCREMENT,
  `district_name` varchar(255) NOT NULL,
  PRIMARY KEY (`audit_district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_districts`
--

LOCK TABLES `audit_districts` WRITE;
/*!40000 ALTER TABLE `audit_districts` DISABLE KEYS */;
INSERT INTO `audit_districts` VALUES (1,'Ayodhya'),(2,'Ayodhya UUUUU'),(3,'Baghpat'),(4,'Bareilly'),(5,'Bulandshahr'),(6,'Etawah'),(7,'Farrukhabad'),(8,'Firozabad'),(9,'Ghazipur'),(10,'Hapur'),(11,'Jaunpur'),(12,'Kannauj'),(13,'Kanpur Nagar'),(14,'Kasganj'),(15,'Mathura'),(16,'Mirzapur'),(17,'Moradabad'),(18,'Muzaffarnagar'),(19,'PrayagRaj'),(20,'Shamli'),(21,'Sultanpur'),(22,'Unnao'),(23,'Varanasi');
/*!40000 ALTER TABLE `audit_districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_sewerage_projects`
--

DROP TABLE IF EXISTS `audit_sewerage_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_sewerage_projects` (
  `audit_project_id` int NOT NULL AUTO_INCREMENT,
  `sr_no` int DEFAULT NULL,
  `audit_district_id` int DEFAULT NULL,
  `audit_city_id` int DEFAULT NULL,
  `audit_agency_id` int DEFAULT NULL,
  `project_name` text,
  `scheme_type` varchar(255) DEFAULT NULL,
  `project_mode` varchar(255) DEFAULT NULL,
  `sanction_date` date DEFAULT NULL,
  `sanction_cost` decimal(15,2) DEFAULT NULL,
  `work_cost` decimal(15,2) DEFAULT NULL,
  `centage` decimal(15,2) DEFAULT NULL,
  `om_cost` decimal(15,2) DEFAULT NULL,
  `stp_count` int DEFAULT NULL,
  `stp_capacity` decimal(15,2) DEFAULT NULL,
  `drain_count` int DEFAULT NULL,
  `agreement_cost` decimal(15,2) DEFAULT NULL,
  `remarks` text,
  `scrape_time` datetime DEFAULT NULL,
  PRIMARY KEY (`audit_project_id`),
  KEY `audit_district_id` (`audit_district_id`),
  KEY `audit_city_id` (`audit_city_id`),
  KEY `audit_agency_id` (`audit_agency_id`),
  CONSTRAINT `audit_sewerage_projects_ibfk_1` FOREIGN KEY (`audit_district_id`) REFERENCES `audit_districts` (`audit_district_id`),
  CONSTRAINT `audit_sewerage_projects_ibfk_2` FOREIGN KEY (`audit_city_id`) REFERENCES `audit_cities` (`audit_city_id`),
  CONSTRAINT `audit_sewerage_projects_ibfk_3` FOREIGN KEY (`audit_agency_id`) REFERENCES `audit_agencies` (`audit_agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_sewerage_projects`
--

LOCK TABLES `audit_sewerage_projects` WRITE;
/*!40000 ALTER TABLE `audit_sewerage_projects` DISABLE KEYS */;
INSERT INTO `audit_sewerage_projects` VALUES (1,1,2,1,24,'I&D of Drains at Ayodhya-Ayodhya. DBOT, NGP','NGP','DBOT','2018-06-11',37.67,16.26,1.10,20.31,0,0.00,5,29.03,NULL,'2026-06-17 14:54:46'),(2,2,1,2,3,'Pollution Abatement Works for River Saryu/Ghaghara at Faizabad town, District-Ayodhya (Interception & Diversion of Drains with 33 MLD STP)','NGP','HAM','2021-05-06',221.66,109.03,7.62,105.01,1,33.00,15,149.47,'Completed','2026-06-17 14:54:46'),(3,3,3,3,12,'I&D and STP works at Bagpat','NGP','DBOT','2019-02-19',77.36,38.72,2.66,35.98,1,14.00,4,65.49,NULL,'2026-06-17 14:54:46'),(4,4,4,4,4,'Development of Sewage Treatment Plant at Bareilly','NGP','HAM','2019-01-03',271.39,139.44,10.70,121.25,3,63.00,15,233.72,NULL,'2026-06-17 14:54:46'),(5,5,5,5,17,'Anupshahar Sewerage Scheme','EAP','DBOT','2014-05-19',75.79,67.12,5.27,3.40,2,2.50,2,69.30,'Scheme Handed over to Local Bodies on dated 30.06.2024. After the said date, the operation and maintenance of the scheme is being done by Local Bodies.','2026-06-17 14:54:46'),(6,6,5,6,7,'Narora Sewerage Scheme','EAP','DBOT','2014-03-04',48.45,39.73,2.26,6.46,1,4.00,1,37.73,'Scheme Handed over to Local Bodies. The operation and maintenance of the scheme is being done by Local Bodies from 01.08.2025.','2026-06-17 14:54:46'),(7,7,6,7,33,'Etawah Sewerage Scheme ( Interception & Diversion Works) DIstt- Etawah','NGP1-NON EAP','DBOT','2019-02-28',140.60,56.85,3.90,79.85,1,21.00,2,119.93,'work completed. O&M in progress','2026-06-17 14:54:46'),(8,8,7,8,11,'I&D and STP works at Farrukhabad-Fatehgarh','NGP','HAM','2021-02-09',261.12,188.71,6.98,72.41,2,47.70,8,252.41,'Work Completed. Operation and Maintenance works under progress by M/S HNB Eng. Pvt. Ltd. Pune.','2026-06-17 14:54:46'),(9,9,8,9,25,'Firozabad Sewerage Scheme ( Interception & Diversion Works)  Distt Firozabad','NGP1-NON EAP','DBOT','2019-03-01',51.08,23.92,1.63,25.53,0,0.00,4,42.43,'work completed. O&M in progress','2026-06-17 14:54:46'),(10,10,9,10,18,'Sewerage, Sewage Treatment & Disposal for Ghazipur, U.P.','NGP','HAM','2020-05-06',152.83,50.96,4.08,96.17,1,21.00,23,140.94,'STP has been commissioned. Proposal of Additional cost implication approved by NMCG in EC meeting dt 13.02.2024. Work of TEPS and retaining wall is in progress. Works as per original agreement completed. Additional Work in progress','2026-06-17 14:54:46'),(11,11,10,11,1,'Garhmukteshwar Sewerage Scheme.','Non EAP','DBOT','2011-02-24',46.51,40.68,3.25,2.58,2,9.00,2,32.71,'Work completed. O&M in progress','2026-06-17 14:54:46'),(12,12,11,12,29,'Interception & Diversion  (I&D)  of Drains and Sewerage Treatment Plant at Jaunpur , U.P.','NGP','DBOT','2019-02-12',206.05,119.01,9.25,63.91,1,30.00,14,164.00,'Project under O&M by UPJN(Rural)','2026-06-17 14:54:46'),(13,13,12,13,30,'Kannauj Sewerage Scheme Phase II','Non EAP','DBOT','2011-02-24',43.66,37.77,3.63,2.26,0,0.00,0,39.65,'O&M works are being done by NPP, Kannauj.','2026-06-17 14:54:46'),(14,14,13,15,9,'I and D  of Sisamau and 5 other drains','NGP','DBOT','2016-10-03',63.80,57.63,4.61,1.55,0,0.00,3,57.12,'O&M work is in progress by M/s KRMPL under One city One operator.','2026-06-17 14:54:46'),(15,15,13,15,13,'I&D and STP works at Kanpur-Pankha','NGP','HAM','2018-03-12',967.23,248.39,31.05,718.84,1,30.00,3,708.70,'30 MLD STP Panka commissioned on dated 24.06.2023 and renovation work of 130 MLD STP Jajmau has been completed & COD issued on 17.10.2025. O&M work is in progress by M/s KRMPL under One city One operator.','2026-06-17 14:54:46'),(16,16,13,14,2,'Interception Diversion and Treatment works at Bithoor Town Kanpur','NGP','DBOT','2017-10-16',13.40,10.75,0.70,2.45,1,1.30,6,9.99,'Operation & Maintenance work under progress by M/S CS Enterprises','2026-06-17 14:54:46'),(17,17,13,15,26,'Sewerage Works in Sewerage Dist 1 Kanpur','NGP','DBOT','2016-10-18',430.49,392.82,23.81,12.86,0,0.00,3,418.31,'Operation & Maintenance work under progress by M/s Shristi Sam lain Yogi (JV)','2026-06-17 14:54:46'),(18,18,14,16,33,'Interception & Diversion (I&D) of drains and Sewerage Treatment Plant at Kasganj','NGP1-NON EAP','DBOT','2018-12-24',76.73,36.60,2.49,37.64,1,15.00,2,67.56,'* work completed. \n* O&M in progress','2026-06-17 14:54:46'),(19,19,15,17,20,'Rehabilation / Upgradation of Mathura Sewerage Scheme','NGP1-NON EAP','HAM','2017-12-13',460.45,264.39,8.78,187.28,1,30.00,19,437.95,'Work completed O&M in progress','2026-06-17 14:54:46'),(20,20,15,18,10,'Rehabilitation of Sewerage Infrastructure and Augmentation/upgradation of STP at Vrindavan','NGP1-NON EAP','DBOT','2017-03-29',42.82,14.76,1.18,26.88,1,4.00,3,33.50,'O&M  is Running','2026-06-17 14:54:46'),(21,21,16,19,6,'Faecal Sludge Management for abatement of pollution in River Ganga at Chunar, Mirzapur, U.P.','NGP','DBOT','2019-03-07',2.70,1.93,0.29,0.48,0,0.00,14,2.05,'Project under O&M by UPJN(Rural)','2026-06-17 14:54:46'),(22,22,16,20,18,'Interception & Diversion and STP at Mirzapur, U.P.','NGP','HAM','2020-05-28',129.08,50.50,4.04,73.06,2,17.00,18,151.58,'Temporary arrangement for discharge of treated effluent into existing channel completed. Permission for discharge of treated effluent yet to be obtained. DGC denied recommendation for discharge in irrigation canal. Now location for discharge is identified 02 KM downstream of canal into Khajuri River for which draft variation proposal was sent to NMCG. In meeting dt 07.06.2024 under chairmanship of ED(P) NMCG it is directed to send the variation proposal through UPJN(HQ)/SMCG for approval which is submitted to CE(Ganga) on 14.06.2024 Works completed. Balance work shall be completed after approval of variation','2026-06-17 14:54:46'),(23,23,17,21,34,'Interception & Diversion (I&D) of Drains and Sewerage Treatment Plant at Moradabad zone 2','NGP','HAM','2018-07-23',118.69,53.53,3.52,61.64,1,25.00,5,113.85,'STP under O&M','2026-06-17 14:54:46'),(24,24,17,21,16,'Prevention of Pollution of River Ramganga at Moradabad','Non EAP','DBOT','2011-02-24',330.03,278.85,19.03,32.17,1,58.00,14,244.00,'Under O&M','2026-06-17 14:54:46'),(25,25,18,22,19,'I&D and STP Work in Budhana Town','Non EAP','HAM','2019-02-18',48.76,25.10,1.70,21.96,1,10.00,3,41.28,'Commercial Operation Date declared, Plant under O&M since 01.04.2024.','2026-06-17 14:54:46'),(26,26,18,23,19,'I&D and STP Work in Muzaffarnagar','NGP','HAM','2020-01-13',234.03,108.32,7.33,118.36,2,54.50,5,205.09,'22 MLD STP Sahawali: Commercial Operation Date declared, Plant under O&M since 01.04.2024. 32.5 MLD Kidwai Nagar:Commercial Operation Date declared, Plant under O&M since 01.07.2024.','2026-06-17 14:54:46'),(27,27,19,25,31,'14 MLD Capacity STP at Salori Allahabad','NGRBA EAP','DBOT','2020-07-09',39.36,24.25,1.90,13.21,1,14.00,0,53.39,'In O&M under UPJN (Urban)','2026-06-17 14:54:46'),(28,28,19,24,22,'I&D and STP works for Naini (District-G) and Jhunsi works),  Phaphamau (District-F)','NGP','HAM','2019-05-19',767.59,280.14,21.66,465.79,3,72.00,18,350.60,'Under O&M','2026-06-17 14:54:46'),(29,29,19,25,22,'Rehabilitation and Operation & Maintenance of existing Sewage Treatment Infrastructure at Allahabad Uttar Pradesh under Hybrid Annuity based PPP Mode','NGP','HAM','2018-03-09',904.00,58.15,0.00,845.85,0,0.00,16,557.60,'Under O&M Rehabilitation of 3 no of STP of Capacity 29,60 and 60 MLD STP and associated MPS/SPS','2026-06-17 14:54:46'),(30,30,19,25,7,'Sewer Network in District E of Allahabad Part-II','NGRBA EAP','DBOT','2016-09-28',52.78,48.90,3.88,0.00,0,0.00,0,46.69,NULL,'2026-06-17 14:54:46'),(31,31,19,25,11,'Sewerage and Non Sewerage Schemes for Pollution abatement of River Ganga at Allahabad District B&EU.P','Non EAP','DBOT','2010-05-06',207.39,187.53,19.86,0.00,3,85.00,0,118.20,NULL,'2026-06-17 14:54:46'),(32,32,19,25,23,'Sewerage and Non Sewerage Schemes for Pollution abatement of River Ganga at Allahabad U.P District A','EAP','DBOT','2010-05-06',97.95,97.95,0.00,0.00,1,20.00,0,97.95,NULL,'2026-06-17 14:54:46'),(33,33,19,25,15,'Sewerage Scheme for District A','NGRBA EAP','DBOT','2019-11-11',299.39,269.10,19.75,10.54,0,0.00,0,292.29,'Under O&M','2026-06-17 14:54:46'),(34,34,19,25,7,'Sewerage Scheme for District B','NGRBA EAP','DBOT','2019-11-11',300.84,278.28,18.81,3.75,0,0.00,0,280.86,'Under O&M','2026-06-17 14:54:46'),(35,35,19,25,21,'Sewerage Scheme for District C','NGRBA EAP','DBOT','2019-09-13',170.95,154.01,9.87,7.07,0,0.00,0,165.41,'Under O&M','2026-06-17 14:54:46'),(36,36,19,25,31,'Sewerage work in Sewerage District E of Allahabad','NGRBA EAP','DBOT','2011-02-22',142.00,126.70,6.57,8.73,0,0.00,0,123.05,NULL,'2026-06-17 14:54:46'),(37,37,20,26,27,'I&D and STP Work in Kairana','CGF','DBOT','2020-12-07',78.42,37.28,2.63,38.51,1,15.00,1,59.19,'Commercial Operation Date declared, Plant under O&M since 01.03.2025.','2026-06-17 14:54:46'),(38,38,21,27,5,'I&D of Drains and Sewerage Treatment Plant works with 15 Years O&M at Sultanpur','NGP','DBOT','2018-12-24',70.18,40.83,2.59,26.76,3,17.00,6,67.59,'10 MLD Oxidation Pond upgradation completed. SCADA works under progress. 2 MLD STP work completed. SCADA wortks in progress 5MLD STP work completed. SCADA works under progress.','2026-06-17 14:54:46'),(39,39,22,28,14,'I&D of Drains and STP works in Shuklaganj (05MLD)','NGP','HAM','2017-07-28',65.18,25.93,1.90,37.35,1,5.00,5,38.87,'Total 7 drains are discharging into River Ganga in NPP Shuklaganj out of which 5 drains of discharge 4.66 MLD has to be Intercepted & Diverted to under Construction 5 MLD STP Shuklaganj and rest of the 02 drains of discharge 7.3 MLD has to be tapped & treated by U.P. J.N. (Urban) under SBM 2 programme. The work of tapping domestic sewage outflow through I&D was completed on 30.12.2025 by tapping 04 drains namely Indira Nagar, Manohar Nagar-1, Manohar Nagar-2 and Railway Bridge and trial run of the scheme has been started. The trial run of the scheme is to be done for 03 months, after which the operation of STP will start at full capacity. The work of cleaning 1.96 km drain and construction of Connecting Drain of 50 meters to bring 01 drain Ganga Vishnu Drain to I&D is to be done by M/s KRMPL','2026-06-17 14:54:46'),(40,40,22,29,14,'I&D of Drains and STP works in Unnao (15MLD)','NGP','HAM','2017-07-28',102.20,43.73,3.22,55.25,1,15.00,1,68.68,'The overall progress of the project is 99%. All works (Civil/Electrical & Mechanical) of the STP has been completed. Due to the rise in groundwater levels resulting from floods in the Ganga River and rainfall, the construction of the remaining 01 number of Manhole near the STP premises and the Dewatering work remained disrupted from August 2025 to January 2026. Against the Dewatering and dewatering works in 1200 mm RCC Pipe are in progress and dewatering work is being done in a length of 50 meters ahead of MH 37, which will be completed by the concessionaire M/s Kanpur River Management Pvt. Ltd., Kanpur by 15 June 2026','2026-06-17 14:54:46'),(41,41,23,31,8,'I&D and Treatment works for Assi-BHU Area (Phase-II), Varanasi','NGP','DBOT','2022-10-19',308.09,97.62,7.81,172.94,1,55.00,2,151.55,'55 MLD STP has been  commissioned with the  flow of 8 MLD STP Bhagwanpur STP and IPS are commissioned Finishing works are in progress Power connection of MPS done. MPS shall be commissioned on 18.02.2026 STP under trial-run','2026-06-17 14:54:46'),(42,42,23,30,28,'Interception, Diversion of Drains & Sewage Treatment Works at Ramnagar, Dist. Varanasi','NGP','DBOT','2017-07-28',71.26,21.89,1.75,45.91,1,10.00,5,69.42,'Project under O&M by UPJN(Rural)','2026-06-17 14:54:46'),(43,43,23,31,35,'JICA Assisted Ganga Action Plan (GAP) Phase-II, Varanasi','NGP','DBOT','2010-07-14',659.62,629.16,26.21,0.00,1,140.00,5,488.80,'SPS, MPS, 140 MLD STP Dinapur is under O&M by UPJN(Urban)','2026-06-17 14:54:46'),(44,44,23,31,32,'Sewerage Treatment Plant for Assi-BHU Sewerage District at Ramana, Varanasi','NGP','HAM','2017-09-21',161.31,102.00,8.16,26.11,1,50.00,1,153.15,'Project under O&M by UPJN(Rural)','2026-06-17 14:54:46');
/*!40000 ALTER TABLE `audit_sewerage_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:01
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:01
CREATE DATABASE  IF NOT EXISTS `jjm_dpr_projects` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jjm_dpr_projects`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jjm_dpr_projects
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
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `district_id` int NOT NULL,
  `city_name` varchar(255) NOT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `uk_city` (`district_id`,`city_name`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,1,'(Unknown)'),(2,2,'(Unknown)'),(3,3,'(Unknown)'),(4,4,'(Unknown)'),(5,5,'(Unknown)');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `district_id` int NOT NULL AUTO_INCREMENT,
  `district_name` varchar(255) NOT NULL,
  PRIMARY KEY (`district_id`),
  UNIQUE KEY `district_name` (`district_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'Ambedkar AAAAAAAAAAA Nagar'),(2,'Gorakhpur'),(3,'Lucknow'),(4,'PrayagRaj'),(5,'Varanasi');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dpr_projects`
--

DROP TABLE IF EXISTS `dpr_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dpr_projects` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `sr_no` int DEFAULT NULL,
  `district_id` int DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `project_name` text,
  `stp_count` int DEFAULT NULL,
  `stp_capacity` decimal(15,2) DEFAULT NULL,
  `drain_count` int DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `remarks` text,
  `scrape_time` datetime DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  KEY `district_id` (`district_id`),
  KEY `city_id` (`city_id`),
  KEY `idx_sr` (`sr_no`),
  CONSTRAINT `dpr_projects_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`),
  CONSTRAINT `dpr_projects_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dpr_projects`
--

LOCK TABLES `dpr_projects` WRITE;
/*!40000 ALTER TABLE `dpr_projects` DISABLE KEYS */;
INSERT INTO `dpr_projects` VALUES (1,1,1,1,'STP and I&D Work in Tanda nagar palika parishad ambedkarnagar',1,15.00,0,'2024-08-14','I&D of drains and STP DPR amount Rs. 207.12 Cr. has been send to NMCG for approval on dt. 18.08.2023. DPR is pending for approval at NMCG','2026-06-17 15:03:58'),(2,2,2,2,'I & D and Treatment for 8 Drains out of 9 Drains Falling in Rapti River',1,44.00,8,'2025-10-08','Presently 6 Land has been identified for DSTP and STP .No Government land had been available written by District Administration vide Letter No-4392/-24 dt 16/01/2024. | Presently land has been identified and proposal for purchasing land by Nagar Nigam has been under process with the help of District Magistrate and Commissioner Sir. | Due to non-availability of land for the STP plant, the process of purchasing land is under process with District Magistrate vide letter no.-2548/M-8/56 dated 03/10/2025','2026-06-17 15:03:58'),(3,3,3,3,'Pollution Abatement of Gomti River (Phase-IV), Lucknow',1,145.00,0,'2026-06-15','Revised DPR of 145 MLD Basantkunj STP had been sent to NMCG vide APD, SMCG-UP letter no. 775/369/SMCG-UP/01 dt. 02.12.2025 with incorporating the comments raised by NMCG. | A meeting to discuss the DPR for 145 MLD Basantkunj STP held virtually on dt. 29.01.2026 under the chairmanship of D.G., NMCG.','2026-06-17 15:03:58'),(4,4,4,4,'I&D of Kashipur drain and Augmentation of Kodra STP by 35 MLD (Sewerage District - E) at Prayagraj',1,35.00,1,'2026-06-09','DPR is prepared and sent to NMCG vide letter no. 1213/0786-T/SMCG-UP/01 on dated 16.10.2023  for review and approval. | Observation has been raised by NMCG, New Delhi on dated 14.05.2024. In continuation of the same DPR is being revised and submitted to HQ, UPJN on 12.08.2024 | Compliance Report of the observation and revised DPR has been submitted by UPJN to SMCG, Lucknow. SMCG, Lucknow has been examined and send to NMCG, Delhi on dated 10.10.2024 | Comprehensive plan  of Nagar Nigam,  Prayagraj is being prepared. | Revised DPR has been sent to HQ, UPJN (R), Lucknow | Revised DPR send to NMCG vide SMCG, Lucknow letter no. 941/032/SMCG-UP/12 Dated 30.12.2025 | Observation raised by NMCG, New Delhi on Kodra STP DPR has been complied and submitted to SMCG, Lucknow','2026-06-17 15:03:58'),(5,5,4,4,'Interception and Diversion of Additional flow from Sasurkhaderi Drain and Augmentation of Numayadahi STP (57 MLD) in Sewerage District-B, Prayagraj',1,57.00,0,'2026-06-09','DPR has been submitted to SMCG, Lucknow | DPR has been submitted to NMCG, New Delhi  on dated 02.05.2025 | Comprehensive plan  of Nagar Nigam,  Prayagraj is being prepared. | Revised DPR has been sent to HQ, UPJN (R), Lucknow | Revised DPR send to NMCG vide SMCG, Lucknow letter no. 940/032/SMCG-UP/11 Dated 30.12.2025 | Observations has been raise by NMCG, New Delhi on Numayadahi DPR which are under review.','2026-06-17 15:03:58'),(6,6,5,5,'DPR for tapping of newly Identified Drains falling in River Varuna in Varanasi',0,0.00,0,'2026-06-09','DPR submitted to NMCG in January 2026 | TPA visit conducted on 15.03.2026 | EC held on 15.05.2026','2026-06-17 15:03:58'),(7,7,5,5,'Upgradation and Capacity Augmentation of Existing 80 MLD STP Dinapur in Varanasi',1,250.00,0,'2026-05-26','IIT Roorkee has been appointed as TPA by NMCG | In accordance to the new drains identified in Varuna River the capacity shall now be enhance to 250 MLD. revised DPR shall be submitted by 31.12.2025 | As per PFR sent to NMCG on 04.08.2025, capacity is now proposed to be 250 MLD | TPA visit held on 15.03.3036 | EC held on 15.05.2026 | DPR sent by CE(Vns Zone) to CE(Ganga) vide letter no.  838/W-14/52 dt 01.07.2024 | DPR was sent to NMCG by SMCG on 10.07.2024. | DPR for capacity Enhancement of Existing 80 MLD STP Dinapur to 250 MLD STP in VAranasi city sent by CE (Vns Zone) to CE(Ganga) vide letter no. 1392/W-14/189 dt 01.12.2025 | DPR forwarded by SMCG to NMCG on 10.12.2025 | NMCG has returned the DPR on 24.07.2024 stating \" Comprehensive action plan for entire Varuna stretch is to be submitted\"','2026-06-17 15:03:58');
/*!40000 ALTER TABLE `dpr_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:01
CREATE DATABASE  IF NOT EXISTS `weekly_progress_of_namami_gange_drp_projects_audit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `weekly_progress_of_namami_gange_drp_projects_audit`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: weekly_progress_of_namami_gange_drp_projects_audit
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
-- Table structure for table `audit_cities`
--

DROP TABLE IF EXISTS `audit_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_cities` (
  `audit_city_id` int NOT NULL AUTO_INCREMENT,
  `audit_district_id` int DEFAULT NULL,
  `city_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`audit_city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_cities`
--

LOCK TABLES `audit_cities` WRITE;
/*!40000 ALTER TABLE `audit_cities` DISABLE KEYS */;
INSERT INTO `audit_cities` VALUES (1,1,'nan'),(2,2,'nan'),(3,3,'nan'),(4,4,'nan'),(5,5,'nan');
/*!40000 ALTER TABLE `audit_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_districts`
--

DROP TABLE IF EXISTS `audit_districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_districts` (
  `audit_district_id` int NOT NULL AUTO_INCREMENT,
  `district_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`audit_district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_districts`
--

LOCK TABLES `audit_districts` WRITE;
/*!40000 ALTER TABLE `audit_districts` DISABLE KEYS */;
INSERT INTO `audit_districts` VALUES (1,'Ambedkar AAAAAAAAAAA Nagar'),(2,'Gorakhpur'),(3,'Lucknow'),(4,'PrayagRaj'),(5,'Varanasi');
/*!40000 ALTER TABLE `audit_districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_drp_projects`
--

DROP TABLE IF EXISTS `audit_drp_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_drp_projects` (
  `audit_project_id` int NOT NULL AUTO_INCREMENT,
  `sr_no` int DEFAULT NULL,
  `audit_district_id` int DEFAULT NULL,
  `audit_city_id` int DEFAULT NULL,
  `project_name` longtext,
  `stp_count` int DEFAULT NULL,
  `stp_capacity` decimal(12,2) DEFAULT NULL,
  `drain_count` int DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `remarks` longtext,
  `snapshot_time` datetime DEFAULT NULL,
  PRIMARY KEY (`audit_project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_drp_projects`
--

LOCK TABLES `audit_drp_projects` WRITE;
/*!40000 ALTER TABLE `audit_drp_projects` DISABLE KEYS */;
INSERT INTO `audit_drp_projects` VALUES (1,1,1,1,'STP and I&D Work in Tanda nagar palika parishad ambedkarnagar',1,15.00,0,'2024-08-14','I&D of drains and STP DPR amount Rs. 207.12 Cr. has been send to NMCG for approval on dt. 18.08.2023. DPR is pending for approval at NMCG','2026-06-17 13:49:39'),(2,2,2,2,'I & D and Treatment for 8 Drains out of 9 Drains Falling in Rapti River',1,44.00,8,'2025-10-08','Presently 6 Land has been identified for DSTP and STP .No Government land had been available written by District Administration vide Letter No-4392/-24 dt 16/01/2024. | Presently land has been identified and proposal for purchasing land by Nagar Nigam has been under process with the help of District Magistrate and Commissioner Sir. | Due to non-availability of land for the STP plant, the process of purchasing land is under process with District Magistrate vide letter no.-2548/M-8/56 dated 03/10/2025','2026-06-17 13:49:39'),(3,3,3,3,'Pollution Abatement of Gomti River (Phase-IV), Lucknow',1,145.00,0,'2026-06-15','Revised DPR of 145 MLD Basantkunj STP had been sent to NMCG vide APD, SMCG-UP letter no. 775/369/SMCG-UP/01 dt. 02.12.2025 with incorporating the comments raised by NMCG. | A meeting to discuss the DPR for 145 MLD Basantkunj STP held virtually on dt. 29.01.2026 under the chairmanship of D.G., NMCG.','2026-06-17 13:49:39'),(4,4,4,4,'I&D of Kashipur drain and Augmentation of Kodra STP by 35 MLD (Sewerage District - E) at Prayagraj',1,35.00,1,'2026-06-09','DPR is prepared and sent to NMCG vide letter no. 1213/0786-T/SMCG-UP/01 on dated 16.10.2023  for review and approval. | Observation has been raised by NMCG, New Delhi on dated 14.05.2024. In continuation of the same DPR is being revised and submitted to HQ, UPJN on 12.08.2024 | Compliance Report of the observation and revised DPR has been submitted by UPJN to SMCG, Lucknow. SMCG, Lucknow has been examined and send to NMCG, Delhi on dated 10.10.2024 | Comprehensive plan  of Nagar Nigam,  Prayagraj is being prepared. | Revised DPR has been sent to HQ, UPJN (R), Lucknow | Revised DPR send to NMCG vide SMCG, Lucknow letter no. 941/032/SMCG-UP/12 Dated 30.12.2025 | Observation raised by NMCG, New Delhi on Kodra STP DPR has been complied and submitted to SMCG, Lucknow','2026-06-17 13:49:39'),(5,5,4,4,'Interception and Diversion of Additional flow from Sasurkhaderi Drain and Augmentation of Numayadahi STP (57 MLD) in Sewerage District-B, Prayagraj',1,57.00,0,'2026-06-09','DPR has been submitted to SMCG, Lucknow | DPR has been submitted to NMCG, New Delhi  on dated 02.05.2025 | Comprehensive plan  of Nagar Nigam,  Prayagraj is being prepared. | Revised DPR has been sent to HQ, UPJN (R), Lucknow | Revised DPR send to NMCG vide SMCG, Lucknow letter no. 940/032/SMCG-UP/11 Dated 30.12.2025 | Observations has been raise by NMCG, New Delhi on Numayadahi DPR which are under review.','2026-06-17 13:49:39'),(6,6,5,5,'DPR for tapping of newly Identified Drains falling in River Varuna in Varanasi',0,0.00,0,'2026-06-09','DPR submitted to NMCG in January 2026 | TPA visit conducted on 15.03.2026 | EC held on 15.05.2026','2026-06-17 13:49:39'),(7,7,5,5,'Upgradation and Capacity Augmentation of Existing 80 MLD STP Dinapur in Varanasi',1,250.00,0,'2026-05-26','IIT Roorkee has been appointed as TPA by NMCG | In accordance to the new drains identified in Varuna River the capacity shall now be enhance to 250 MLD. revised DPR shall be submitted by 31.12.2025 | As per PFR sent to NMCG on 04.08.2025, capacity is now proposed to be 250 MLD | TPA visit held on 15.03.3036 | EC held on 15.05.2026 | DPR sent by CE(Vns Zone) to CE(Ganga) vide letter no.  838/W-14/52 dt 01.07.2024 | DPR was sent to NMCG by SMCG on 10.07.2024. | DPR for capacity Enhancement of Existing 80 MLD STP Dinapur to 250 MLD STP in VAranasi city sent by CE (Vns Zone) to CE(Ganga) vide letter no. 1392/W-14/189 dt 01.12.2025 | DPR forwarded by SMCG to NMCG on 10.12.2025 | NMCG has returned the DPR on 24.07.2024 stating \" Comprehensive action plan for entire Varuna stretch is to be submitted\"','2026-06-17 13:49:39');
/*!40000 ALTER TABLE `audit_drp_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:01
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:02
CREATE DATABASE  IF NOT EXISTS `jjm_dpr_projects_audit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jjm_dpr_projects_audit`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jjm_dpr_projects_audit
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
-- Table structure for table `audit_cities`
--

DROP TABLE IF EXISTS `audit_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_cities` (
  `audit_city_id` int NOT NULL AUTO_INCREMENT,
  `audit_district_id` int NOT NULL,
  `city_name` varchar(255) NOT NULL,
  PRIMARY KEY (`audit_city_id`),
  KEY `audit_district_id` (`audit_district_id`),
  CONSTRAINT `audit_cities_ibfk_1` FOREIGN KEY (`audit_district_id`) REFERENCES `audit_districts` (`audit_district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_cities`
--

LOCK TABLES `audit_cities` WRITE;
/*!40000 ALTER TABLE `audit_cities` DISABLE KEYS */;
INSERT INTO `audit_cities` VALUES (1,1,'(Unknown)'),(2,2,'(Unknown)'),(3,3,'(Unknown)'),(4,4,'(Unknown)'),(5,5,'(Unknown)');
/*!40000 ALTER TABLE `audit_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_districts`
--

DROP TABLE IF EXISTS `audit_districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_districts` (
  `audit_district_id` int NOT NULL AUTO_INCREMENT,
  `district_name` varchar(255) NOT NULL,
  PRIMARY KEY (`audit_district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_districts`
--

LOCK TABLES `audit_districts` WRITE;
/*!40000 ALTER TABLE `audit_districts` DISABLE KEYS */;
INSERT INTO `audit_districts` VALUES (1,'Ambedkar AAAAAAAAAAA Nagar'),(2,'Gorakhpur'),(3,'Lucknow'),(4,'PrayagRaj'),(5,'Varanasi');
/*!40000 ALTER TABLE `audit_districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_dpr_projects`
--

DROP TABLE IF EXISTS `audit_dpr_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_dpr_projects` (
  `audit_project_id` int NOT NULL AUTO_INCREMENT,
  `sr_no` int DEFAULT NULL,
  `audit_district_id` int DEFAULT NULL,
  `audit_city_id` int DEFAULT NULL,
  `project_name` text,
  `stp_count` int DEFAULT NULL,
  `stp_capacity` decimal(15,2) DEFAULT NULL,
  `drain_count` int DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `remarks` text,
  `scrape_time` datetime DEFAULT NULL,
  PRIMARY KEY (`audit_project_id`),
  KEY `audit_district_id` (`audit_district_id`),
  KEY `audit_city_id` (`audit_city_id`),
  CONSTRAINT `audit_dpr_projects_ibfk_1` FOREIGN KEY (`audit_district_id`) REFERENCES `audit_districts` (`audit_district_id`),
  CONSTRAINT `audit_dpr_projects_ibfk_2` FOREIGN KEY (`audit_city_id`) REFERENCES `audit_cities` (`audit_city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_dpr_projects`
--

LOCK TABLES `audit_dpr_projects` WRITE;
/*!40000 ALTER TABLE `audit_dpr_projects` DISABLE KEYS */;
INSERT INTO `audit_dpr_projects` VALUES (1,1,1,1,'STP and I&D Work in Tanda nagar palika parishad ambedkarnagar',1,15.00,0,'2024-08-14','I&D of drains and STP DPR amount Rs. 207.12 Cr. has been send to NMCG for approval on dt. 18.08.2023. DPR is pending for approval at NMCG','2026-06-17 14:56:39'),(2,2,2,2,'I & D and Treatment for 8 Drains out of 9 Drains Falling in Rapti River',1,44.00,8,'2025-10-08','Presently 6 Land has been identified for DSTP and STP .No Government land had been available written by District Administration vide Letter No-4392/-24 dt 16/01/2024. | Presently land has been identified and proposal for purchasing land by Nagar Nigam has been under process with the help of District Magistrate and Commissioner Sir. | Due to non-availability of land for the STP plant, the process of purchasing land is under process with District Magistrate vide letter no.-2548/M-8/56 dated 03/10/2025','2026-06-17 14:56:39'),(3,3,3,3,'Pollution Abatement of Gomti River (Phase-IV), Lucknow',1,145.00,0,'2026-06-15','Revised DPR of 145 MLD Basantkunj STP had been sent to NMCG vide APD, SMCG-UP letter no. 775/369/SMCG-UP/01 dt. 02.12.2025 with incorporating the comments raised by NMCG. | A meeting to discuss the DPR for 145 MLD Basantkunj STP held virtually on dt. 29.01.2026 under the chairmanship of D.G., NMCG.','2026-06-17 14:56:39'),(4,4,4,4,'I&D of Kashipur drain and Augmentation of Kodra STP by 35 MLD (Sewerage District - E) at Prayagraj',1,35.00,1,'2026-06-09','DPR is prepared and sent to NMCG vide letter no. 1213/0786-T/SMCG-UP/01 on dated 16.10.2023  for review and approval. | Observation has been raised by NMCG, New Delhi on dated 14.05.2024. In continuation of the same DPR is being revised and submitted to HQ, UPJN on 12.08.2024 | Compliance Report of the observation and revised DPR has been submitted by UPJN to SMCG, Lucknow. SMCG, Lucknow has been examined and send to NMCG, Delhi on dated 10.10.2024 | Comprehensive plan  of Nagar Nigam,  Prayagraj is being prepared. | Revised DPR has been sent to HQ, UPJN (R), Lucknow | Revised DPR send to NMCG vide SMCG, Lucknow letter no. 941/032/SMCG-UP/12 Dated 30.12.2025 | Observation raised by NMCG, New Delhi on Kodra STP DPR has been complied and submitted to SMCG, Lucknow','2026-06-17 14:56:39'),(5,5,4,4,'Interception and Diversion of Additional flow from Sasurkhaderi Drain and Augmentation of Numayadahi STP (57 MLD) in Sewerage District-B, Prayagraj',1,57.00,0,'2026-06-09','DPR has been submitted to SMCG, Lucknow | DPR has been submitted to NMCG, New Delhi  on dated 02.05.2025 | Comprehensive plan  of Nagar Nigam,  Prayagraj is being prepared. | Revised DPR has been sent to HQ, UPJN (R), Lucknow | Revised DPR send to NMCG vide SMCG, Lucknow letter no. 940/032/SMCG-UP/11 Dated 30.12.2025 | Observations has been raise by NMCG, New Delhi on Numayadahi DPR which are under review.','2026-06-17 14:56:39'),(6,6,5,5,'DPR for tapping of newly Identified Drains falling in River Varuna in Varanasi',0,0.00,0,'2026-06-09','DPR submitted to NMCG in January 2026 | TPA visit conducted on 15.03.2026 | EC held on 15.05.2026','2026-06-17 14:56:39'),(7,7,5,5,'Upgradation and Capacity Augmentation of Existing 80 MLD STP Dinapur in Varanasi',1,250.00,0,'2026-05-26','IIT Roorkee has been appointed as TPA by NMCG | In accordance to the new drains identified in Varuna River the capacity shall now be enhance to 250 MLD. revised DPR shall be submitted by 31.12.2025 | As per PFR sent to NMCG on 04.08.2025, capacity is now proposed to be 250 MLD | TPA visit held on 15.03.3036 | EC held on 15.05.2026 | DPR sent by CE(Vns Zone) to CE(Ganga) vide letter no.  838/W-14/52 dt 01.07.2024 | DPR was sent to NMCG by SMCG on 10.07.2024. | DPR for capacity Enhancement of Existing 80 MLD STP Dinapur to 250 MLD STP in VAranasi city sent by CE (Vns Zone) to CE(Ganga) vide letter no. 1392/W-14/189 dt 01.12.2025 | DPR forwarded by SMCG to NMCG on 10.12.2025 | NMCG has returned the DPR on 24.07.2024 stating \" Comprehensive action plan for entire Varuna stretch is to be submitted\"','2026-06-17 14:56:39');
/*!40000 ALTER TABLE `audit_dpr_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:02
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:02
CREATE DATABASE  IF NOT EXISTS `citywise_discharge_stp_capacity_and_gap_analysis` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `citywise_discharge_stp_capacity_and_gap_analysis`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: citywise_discharge_stp_capacity_and_gap_analysis
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
  `district_name` varchar(100) NOT NULL,
  PRIMARY KEY (`district_id`),
  UNIQUE KEY `district_name` (`district_name`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'Agra'),(2,'Aligarh'),(3,'Ambedkar Nagar'),(4,'Amethi'),(5,'Amroha'),(6,'Auraiya'),(7,'Ayodhya'),(8,'Azamgarh'),(9,'Baghpat'),(10,'Ballia'),(11,'Banda'),(12,'Barabanki'),(13,'Bareilly'),(14,'Bijnor'),(15,'Bulandshahr'),(16,'Chandauli'),(17,'Chitrakoot'),(18,'Deoria'),(19,'Etah'),(20,'Etawah'),(21,'Farrukhabad'),(22,'Fatehpur'),(23,'Firozabad'),(24,'Gautam Buddha Nagar'),(25,'Ghaziabad'),(26,'Ghazipur'),(27,'Gorakhpur'),(28,'Hamirpur'),(29,'Hapur'),(30,'Hardoi'),(31,'Hathras'),(32,'Jalaun'),(33,'Jaunpur'),(34,'Jhansi'),(35,'Kannauj'),(36,'Kanpur Dehat'),(37,'Kanpur Nagar'),(38,'Kasganj'),(39,'Kaushambi'),(40,'Lakhimpur Kheri'),(41,'Lalitpur'),(42,'Lucknow'),(43,'Mahoba'),(44,'Mainpuri'),(45,'Mathura'),(46,'Mau'),(47,'Meerut'),(48,'Mirzapur'),(49,'Moradabad'),(50,'Muzaffarnagar'),(51,'Pilibhit'),(52,'Pratapgarh'),(53,'PrayagRaj'),(54,'Rae Bareli'),(55,'Rampur'),(56,'Saharanpur'),(57,'Sambhal'),(58,'Sant Ravidas Nagar'),(59,'Shahjahanpur'),(60,'Shamli'),(61,'Sitapur'),(62,'Sonbhadra'),(63,'Sultanpur'),(64,'Unnao'),(65,'Varanasi');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drainage_stp_statistics`
--

DROP TABLE IF EXISTS `drainage_stp_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drainage_stp_statistics` (
  `drainage_stat_id` int NOT NULL AUTO_INCREMENT,
  `town_river_id` int NOT NULL,
  `tapped_partial_untapped_drains` int DEFAULT NULL,
  `not_to_be_tapped_drains` int DEFAULT NULL,
  `total_drains` int DEFAULT NULL,
  `discharge_through_drains_mld` decimal(10,2) DEFAULT NULL,
  `discharge_through_sewer_network_mld` decimal(10,2) DEFAULT NULL,
  `total_discharge_mld` decimal(10,2) DEFAULT NULL,
  `no_of_existing_stp` int DEFAULT NULL,
  `capacity_of_existing_stp` decimal(10,2) DEFAULT NULL,
  `utilization_capacity_of_existing_stp` decimal(10,2) DEFAULT NULL,
  `gap_installed_capacity_population_flow` decimal(10,2) DEFAULT NULL,
  `gap_utilization_capacity_population_flow` decimal(10,2) DEFAULT NULL,
  `gap_installed_capacity_actual_discharge` decimal(10,2) DEFAULT NULL,
  `gap_utilization_capacity_actual_discharge` decimal(10,2) DEFAULT NULL,
  `no_of_stp_under_construction` int DEFAULT NULL,
  `capacity_of_stp_under_construction` decimal(10,2) DEFAULT NULL,
  `no_of_stp_under_tendering` int DEFAULT NULL,
  `capacity_of_stp_under_tendering` decimal(10,2) DEFAULT NULL,
  `capacity_proposed` decimal(10,2) DEFAULT NULL,
  `total_capacity_mld` decimal(10,2) DEFAULT NULL,
  `sewage_gap_mld` decimal(10,2) DEFAULT NULL,
  `gap_based_on_population_mld` decimal(10,2) DEFAULT NULL,
  `remark` text,
  `scrape_time` datetime DEFAULT NULL,
  PRIMARY KEY (`drainage_stat_id`),
  UNIQUE KEY `town_river_id` (`town_river_id`),
  CONSTRAINT `drainage_stp_statistics_ibfk_1` FOREIGN KEY (`town_river_id`) REFERENCES `town_rivers` (`town_river_id`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drainage_stp_statistics`
--

LOCK TABLES `drainage_stp_statistics` WRITE;
/*!40000 ALTER TABLE `drainage_stp_statistics` DISABLE KEYS */;
INSERT INTO `drainage_stp_statistics` VALUES (1,1,90,0,90,286.85,88.00,374.85,9,220.75,191.75,-65.32,-94.32,-154.10,-183.10,13,177.60,0,0.00,0.00,398.35,23.50,112.28,'After construction of 13 Nos STPs of total capacity 177.60  MLD there will be no gap in Agra City','2026-06-09 16:19:09'),(2,2,2,6,8,136.89,12.20,149.09,1,45.00,45.00,-76.55,-76.55,-104.09,-104.09,0,0.00,0,0.00,113.00,158.00,8.91,36.45,'DPR for proposed 65 & 48 MLD STP has been sanctioned in the 57th EC meeting of NMCG for amount 487.54 cr.','2026-06-09 16:19:09'),(3,3,6,0,6,19.41,0.00,19.41,0,0.00,0.00,-15.70,-15.70,-19.41,-19.41,0,0.00,0,0.00,0.00,0.00,0.00,-15.70,NULL,'2026-06-09 16:19:09'),(4,4,8,0,8,11.68,0.00,11.68,0,0.00,0.00,-11.99,-11.99,-11.68,-11.68,0,0.00,0,0.00,15.00,15.00,3.32,3.01,NULL,'2026-06-09 16:19:09'),(5,5,0,1,1,0.00,0.00,0.00,0,0.00,0.00,-3.71,-3.71,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.71,NULL,'2026-06-09 16:19:09'),(6,6,0,1,1,0.00,0.00,0.00,0,0.00,0.00,-30.24,-30.24,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-30.24,NULL,'2026-06-09 16:19:09'),(7,7,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.25,-1.25,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.25,NULL,'2026-06-09 16:19:09'),(8,8,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.51,-1.51,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.51,NULL,'2026-06-09 16:19:09'),(9,9,2,0,2,16.46,0.00,16.46,0,0.00,0.00,-12.42,-12.42,-16.46,-16.46,0,0.00,0,0.00,0.00,0.00,0.00,-12.42,NULL,'2026-06-09 16:19:09'),(10,10,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-4.16,-4.16,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-4.16,NULL,'2026-06-09 16:19:09'),(11,11,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-4.83,-4.83,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-4.83,NULL,'2026-06-09 16:19:09'),(12,12,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-4.19,-4.19,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-4.19,NULL,'2026-06-09 16:19:09'),(13,13,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.41,-2.41,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.41,NULL,'2026-06-09 16:19:09'),(14,14,21,0,21,30.87,12.50,43.37,2,18.00,16.00,-32.32,-34.32,-25.37,-27.37,1,33.00,0,0.00,0.00,51.00,7.63,0.68,NULL,'2026-06-09 16:19:09'),(15,15,22,0,22,22.46,0.00,22.46,0,0.00,0.00,-2.26,-2.26,-22.46,-22.46,1,8.00,0,0.00,0.00,8.00,0.00,5.74,NULL,'2026-06-09 16:19:09'),(16,16,4,0,4,8.60,0.00,8.60,1,14.00,8.60,4.00,-1.40,5.40,0.00,0,0.00,0,0.00,0.00,14.00,5.40,4.00,NULL,'2026-06-09 16:19:09'),(17,17,1,0,1,12.10,0.00,12.10,0,0.00,0.00,-14.67,-14.67,-12.10,-12.10,1,20.00,0,0.00,0.00,20.00,7.90,5.33,NULL,'2026-06-09 16:19:09'),(18,18,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-5.93,-5.93,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-5.93,NULL,'2026-06-09 16:19:09'),(19,19,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.93,-1.93,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.93,NULL,'2026-06-09 16:19:09'),(20,20,1,0,1,10.44,0.00,10.44,0,0.00,0.00,-21.17,-21.17,-10.44,-10.44,0,0.00,0,0.00,0.00,0.00,0.00,-21.17,'Bioremediation treatment is being done by Nagar palika ,Banda.','2026-06-09 16:19:09'),(21,21,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.52,-1.52,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.52,NULL,'2026-06-09 16:19:09'),(22,22,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.21,-1.21,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.21,NULL,'2026-06-09 16:19:09'),(23,23,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.79,-1.79,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.79,NULL,'2026-06-09 16:19:09'),(24,24,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.98,-0.98,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.98,NULL,'2026-06-09 16:19:09'),(25,25,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.58,-1.58,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.58,NULL,'2026-06-09 16:19:09'),(26,26,1,0,1,18.00,0.00,18.00,0,0.00,0.00,-13.94,-13.94,-18.00,-18.00,0,0.00,0,0.00,0.00,0.00,0.00,-13.94,NULL,'2026-06-09 16:19:09'),(27,27,1,0,1,0.87,25.00,25.87,2,36.00,26.00,-87.58,-97.58,10.13,0.13,0,0.00,0,0.00,0.00,36.00,10.13,-87.58,NULL,'2026-06-09 16:19:09'),(28,28,11,2,13,41.21,0.00,41.21,1,42.00,43.03,-81.58,-80.55,0.79,1.82,0,0.00,0,0.00,0.00,42.00,0.79,-81.58,NULL,'2026-06-09 16:19:09'),(29,29,1,0,1,18.82,0.00,18.82,1,20.00,18.57,-103.58,-105.01,1.18,-0.25,0,0.00,0,0.00,0.00,20.00,1.18,-103.58,'25 mld stp with sewer network is proposed under Amrut.2','2026-06-09 16:19:09'),(30,30,2,1,3,11.05,0.00,11.05,1,24.00,21.41,9.42,6.83,12.95,10.36,0,0.00,0,0.00,0.00,24.00,12.95,9.42,NULL,'2026-06-09 16:19:09'),(31,31,2,0,2,2.56,2.50,5.06,4,5.06,3.80,1.07,-0.19,0.00,-1.26,0,0.00,0,0.00,0.00,5.06,0.00,1.07,NULL,'2026-06-09 16:19:09'),(32,32,2,14,16,24.00,15.00,39.00,1,40.00,15.00,-0.36,-25.36,1.00,-24.00,0,0.00,0,0.00,0.00,40.00,1.00,-0.36,NULL,'2026-06-09 16:19:09'),(33,33,1,0,1,6.91,0.00,6.91,0,0.00,0.00,-6.91,-6.91,-6.91,-6.91,0,0.00,0,0.00,10.00,10.00,3.09,3.09,'ok','2026-06-09 16:19:09'),(34,34,1,0,1,2.50,3.50,6.00,2,6.25,5.75,3.01,2.51,0.25,-0.25,0,0.00,0,0.00,0.00,6.25,0.25,3.01,NULL,'2026-06-09 16:19:09'),(35,35,2,0,2,29.33,0.00,29.33,0,0.00,0.00,-18.13,-18.13,-29.33,-29.33,0,0.00,0,0.00,45.00,45.00,15.67,26.87,'DPR for I&D and 45 MLD STP approved by NMCG on 22.01.2025. Revised Draft RFP Document received from NMCG on 06.05.2025, RFP shall be sent to NMCG by 22.05.2025 for approval','2026-06-09 16:19:09'),(36,36,16,0,16,0.00,0.00,0.00,1,3.42,3.42,1.99,1.99,3.42,3.42,0,0.00,0,0.00,0.00,3.42,3.42,1.99,NULL,'2026-06-09 16:19:09'),(37,37,1,0,1,5.00,0.00,5.00,0,0.00,0.00,-1.17,-1.17,-5.00,-5.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.17,NULL,'2026-06-09 16:19:09'),(38,38,11,0,11,1.38,0.00,1.38,0,0.00,0.00,-6.48,-6.48,-1.38,-1.38,0,0.00,0,0.00,6.00,6.00,4.62,-0.48,NULL,'2026-06-09 16:19:09'),(39,39,2,0,2,2.45,0.00,2.45,0,0.00,0.00,-3.82,-3.82,-2.45,-2.45,0,0.00,0,0.00,3.00,3.00,0.55,-0.82,NULL,'2026-06-09 16:19:09'),(40,40,1,0,1,4.00,12.00,16.00,1,24.00,24.00,7.80,7.80,8.00,8.00,0,0.00,0,0.00,0.00,24.00,8.00,7.80,'There is no gap at present','2026-06-09 16:19:09'),(41,41,0,0,0,0.00,1.40,1.40,1,1.60,1.60,-0.40,-0.40,0.20,0.20,0,0.00,0,0.00,0.00,1.60,0.20,-0.40,'There is no gap at present','2026-06-09 16:19:09'),(42,42,2,0,2,30.99,0.00,30.99,3,44.95,36.50,12.03,3.58,13.96,5.51,0,0.00,0,0.00,0.00,44.95,13.96,12.03,'There is no gap at present','2026-06-09 16:19:09'),(43,43,4,1,5,29.38,0.00,29.38,1,30.00,22.00,-7.69,-15.69,0.62,-7.38,0,0.00,0,0.00,0.00,30.00,0.62,-7.69,'Tapped to 30 mld STP Farrukhabad.','2026-06-09 16:19:09'),(44,44,3,0,3,10.34,0.00,10.34,1,17.70,13.00,17.70,13.00,7.36,2.66,0,0.00,0,0.00,0.00,17.70,7.36,17.70,'Tapped to 17.70 MLD STP at Fatehgarh.','2026-06-09 16:19:09'),(45,45,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-4.28,-4.28,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-4.28,NULL,'2026-06-09 16:19:09'),(46,46,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.03,-2.03,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.03,NULL,'2026-06-09 16:19:09'),(47,47,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.47,-1.47,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.47,NULL,'2026-06-09 16:19:09'),(48,48,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.54,-3.54,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.54,NULL,'2026-06-09 16:19:09'),(49,49,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.29,-3.29,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.29,NULL,'2026-06-09 16:19:09'),(50,50,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.24,-3.24,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.24,NULL,'2026-06-09 16:19:09'),(51,51,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.74,-2.74,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.74,NULL,'2026-06-09 16:19:09'),(52,52,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.97,-3.97,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.97,NULL,'2026-06-09 16:19:09'),(53,53,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-26.35,-26.35,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-26.35,NULL,'2026-06-09 16:19:09'),(54,54,2,0,2,54.26,5.50,59.76,2,70.00,49.00,-23.00,-44.00,10.24,-10.76,0,0.00,0,0.00,0.00,70.00,10.24,-23.00,'There is no gap at present','2026-06-09 16:19:09'),(55,55,1,0,1,13.00,85.00,98.00,5,174.00,69.50,76.00,-28.50,76.00,-28.50,0,0.00,0,0.00,0.00,174.00,76.00,76.00,NULL,'2026-06-09 16:19:09'),(56,56,1,0,1,15.00,117.00,132.00,8,411.00,309.00,279.00,177.00,279.00,177.00,0,0.00,0,0.00,0.00,411.00,279.00,279.00,NULL,'2026-06-09 16:19:09'),(57,57,8,0,8,306.49,0.00,306.49,11,535.00,438.50,166.42,69.92,228.51,132.01,0,0.00,0,0.00,0.00,535.00,228.51,166.42,NULL,'2026-06-09 16:19:09'),(58,58,0,0,0,0.00,0.00,0.00,1,3.00,3.00,-365.58,-365.58,3.00,3.00,0,0.00,0,0.00,0.00,3.00,3.00,-365.58,NULL,'2026-06-09 16:19:09'),(59,59,2,0,2,52.00,0.00,52.00,1,21.50,21.50,-347.08,-347.08,-30.50,-30.50,0,0.00,0,0.00,0.00,21.50,0.00,-347.08,NULL,'2026-06-09 16:19:09'),(60,60,0,23,23,0.00,0.00,0.00,1,21.00,2.50,5.50,-13.00,21.00,2.50,0,0.00,0,0.00,0.00,21.00,21.00,5.50,NULL,'2026-06-09 16:19:09'),(61,61,8,0,8,5.30,0.00,5.30,0,0.00,0.00,-3.35,-3.35,-5.30,-5.30,0,0.00,0,0.00,0.00,0.00,0.00,-3.35,NULL,'2026-06-09 16:19:09'),(62,62,3,0,3,4.41,0.00,4.41,0,0.00,0.00,-4.58,-4.58,-4.41,-4.41,0,0.00,0,0.00,0.00,0.00,0.00,-4.58,NULL,'2026-06-09 16:19:09'),(63,63,7,0,7,3.57,0.00,3.57,0,0.00,0.00,-4.11,-4.11,-3.57,-3.57,0,0.00,0,0.00,0.00,0.00,0.00,-4.11,NULL,'2026-06-09 16:19:09'),(64,64,24,0,24,47.82,0.00,47.82,3,50.00,0.00,-74.38,-124.38,2.18,-47.82,0,0.00,0,0.00,0.00,50.00,2.18,-74.38,NULL,'2026-06-09 16:19:09'),(65,65,9,0,9,49.96,0.00,49.96,0,0.00,0.00,-124.38,-124.38,-49.96,-49.96,0,0.00,0,0.00,44.00,44.00,0.00,-80.38,'Revised DPR will be submitted by 15/04/2025','2026-06-09 16:19:09'),(66,66,6,0,6,27.00,0.00,27.00,1,10.00,0.00,-114.38,-124.38,-17.00,-27.00,1,30.00,0,0.00,0.00,40.00,13.00,-84.38,NULL,'2026-06-09 16:19:09'),(67,67,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.93,-0.93,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.93,NULL,'2026-06-09 16:19:09'),(68,68,2,0,2,2.80,0.00,2.80,0,0.00,0.00,-4.39,-4.39,-2.80,-2.80,0,0.00,0,0.00,0.00,0.00,0.00,-4.39,'DPR for I&D work of this drain has been sent to SBM Nideshalay for approval by UPJN (U) in October,2023.','2026-06-09 16:19:09'),(69,69,1,0,1,1.40,0.00,1.40,0,0.00,0.00,-4.39,-4.39,-1.40,-1.40,0,0.00,0,0.00,0.00,0.00,0.00,-4.39,'DPR for I&D work of this drain has been sent to SBM Nideshalay for approval by UPJN (U) in October,2023.','2026-06-09 16:19:09'),(70,70,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.87,-1.87,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.87,NULL,'2026-06-09 16:19:09'),(71,71,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-5.10,-5.10,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-5.10,NULL,'2026-06-09 16:19:09'),(72,72,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-8.51,-8.51,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-8.51,NULL,'2026-06-09 16:19:09'),(73,73,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.22,-1.22,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.22,NULL,'2026-06-09 16:19:09'),(74,74,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-6.15,-6.15,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-6.15,NULL,'2026-06-09 16:19:09'),(75,75,2,0,2,7.50,0.00,7.50,2,9.00,7.50,2.85,1.35,1.50,0.00,0,0.00,0,0.00,0.00,9.00,1.50,2.85,NULL,'2026-06-09 16:19:09'),(76,76,1,0,1,6.00,0.00,6.00,1,30.00,7.00,-6.29,-29.29,24.00,1.00,0,0.00,1,6.00,0.00,36.00,30.00,-0.29,NULL,'2026-06-09 16:19:09'),(77,77,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.72,-0.72,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.72,NULL,'2026-06-09 16:19:09'),(78,78,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-4.08,-4.08,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-4.08,NULL,'2026-06-09 16:19:09'),(79,79,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.10,-1.10,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.10,NULL,'2026-06-09 16:19:09'),(80,80,0,1,1,0.00,0.00,0.00,0,0.00,0.00,-27.04,-27.04,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-27.04,'Sample Was Taken At Confluence Point Of Chhuiya Drain At Sai River. DIscharge was found very less. DPR for sewerage system is being prepared by U.P.Jal Nigam(Urban).','2026-06-09 16:19:09'),(81,81,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.11,-1.11,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.11,NULL,'2026-06-09 16:19:09'),(82,82,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.42,-0.42,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.42,NULL,'2026-06-09 16:19:09'),(83,83,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.82,-0.82,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.82,NULL,'2026-06-09 16:19:09'),(84,84,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-5.07,-5.07,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-5.07,NULL,'2026-06-09 16:19:09'),(85,85,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.33,-1.33,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.33,NULL,'2026-06-09 16:19:09'),(86,86,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-4.94,-4.94,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-4.94,NULL,'2026-06-09 16:19:09'),(87,87,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.57,-3.57,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.57,NULL,'2026-06-09 16:19:09'),(88,88,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-8.01,-8.01,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-8.01,NULL,'2026-06-09 16:19:09'),(89,89,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-11.01,-11.01,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-11.01,NULL,'2026-06-09 16:19:09'),(90,90,10,0,10,16.32,3.90,20.22,0,0.00,0.00,-18.86,-18.86,-20.22,-20.22,1,24.00,0,0.00,0.00,24.00,3.78,5.14,'After construction of 1 No STP 24 MLD  there will be no gap','2026-06-09 16:19:09'),(91,91,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.88,-1.88,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.88,NULL,'2026-06-09 16:19:09'),(92,92,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-7.39,-7.39,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-7.39,NULL,'2026-06-09 16:19:09'),(93,93,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.13,-2.13,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.13,NULL,'2026-06-09 16:19:09'),(94,94,1,0,1,11.00,0.00,11.00,0,0.00,0.00,-6.70,-6.70,-11.00,-11.00,0,0.00,0,0.00,0.00,0.00,0.00,-6.70,'DPR for I&D and STP works has been sanctioned under SBM 2 (UPJN-U)','2026-06-09 16:19:09'),(95,95,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-6.43,-6.43,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-6.43,NULL,'2026-06-09 16:19:09'),(96,96,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.04,-1.04,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.04,NULL,'2026-06-09 16:19:09'),(97,97,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.82,-1.82,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.82,NULL,'2026-06-09 16:19:09'),(98,98,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.04,-1.04,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.04,NULL,'2026-06-09 16:19:09'),(99,99,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-27.25,-27.25,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-27.25,NULL,'2026-06-09 16:19:09'),(100,100,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.80,-1.80,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.80,NULL,'2026-06-09 16:19:09'),(101,101,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.15,-1.15,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.15,NULL,'2026-06-09 16:19:09'),(102,102,14,0,14,23.44,0.00,23.44,1,30.00,26.50,1.83,-1.67,6.56,3.06,0,0.00,0,0.00,0.00,30.00,6.56,1.83,NULL,'2026-06-09 16:19:09'),(103,103,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.12,-1.12,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.12,NULL,'2026-06-09 16:19:09'),(104,104,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.35,-3.35,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.35,NULL,'2026-06-09 16:19:09'),(105,105,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.11,-2.11,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.11,NULL,'2026-06-09 16:19:09'),(106,106,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.26,-1.26,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.26,NULL,'2026-06-09 16:19:09'),(107,107,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.61,-1.61,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.61,NULL,'2026-06-09 16:19:09'),(108,108,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.57,-3.57,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.57,NULL,'2026-06-09 16:19:09'),(109,109,10,0,10,42.00,0.00,42.00,2,52.00,0.00,-14.64,-66.64,10.00,-42.00,0,0.00,0,0.00,0.00,52.00,10.00,-14.64,'Tapped in Existing 26.00 MLD STP at Shivpuri Road maintained by Jhansi Nagar nigam. and 26 MLD STP Laxmital maintained by UPJN(U).','2026-06-09 16:19:09'),(110,110,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.00,-1.00,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.00,NULL,'2026-06-09 16:19:09'),(111,111,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-8.03,-8.03,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-8.03,NULL,'2026-06-09 16:19:09'),(112,112,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.59,-1.59,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.59,NULL,'2026-06-09 16:19:09'),(113,113,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.32,-2.32,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.32,NULL,'2026-06-09 16:19:09'),(114,114,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.75,-2.75,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.75,NULL,'2026-06-09 16:19:09'),(115,115,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.55,-1.55,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.55,NULL,'2026-06-09 16:19:09'),(116,116,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-8.35,-8.35,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-8.35,NULL,'2026-06-09 16:19:09'),(117,117,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-6.84,-6.84,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-6.84,NULL,'2026-06-09 16:19:09'),(118,118,4,0,4,20.00,0.00,20.00,1,13.00,0.00,1.83,-11.17,-7.00,-20.00,0,0.00,0,0.00,0.00,13.00,0.00,1.83,'Tapped in Existing 13.00 MLD STP  maintained by UPJN (U)','2026-06-09 16:19:09'),(119,119,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-4.64,-4.64,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-4.64,NULL,'2026-06-09 16:19:09'),(120,120,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.78,-1.78,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.78,NULL,'2026-06-09 16:19:09'),(121,121,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.25,-1.25,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.25,NULL,'2026-06-09 16:19:09'),(122,122,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.55,-1.55,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.55,NULL,'2026-06-09 16:19:09'),(123,123,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.47,-3.47,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.47,NULL,'2026-06-09 16:19:09'),(124,124,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.84,-2.84,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.84,NULL,'2026-06-09 16:19:09'),(125,125,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.41,-1.41,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.41,NULL,'2026-06-09 16:19:09'),(126,126,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.02,-1.02,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.02,NULL,'2026-06-09 16:19:09'),(127,127,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.46,-3.46,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.46,NULL,'2026-06-09 16:19:09'),(128,128,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.77,-2.77,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.77,NULL,'2026-06-09 16:19:09'),(129,129,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.97,-2.97,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.97,NULL,'2026-06-09 16:19:09'),(130,130,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.27,-3.27,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.27,NULL,'2026-06-09 16:19:09'),(131,131,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.30,-2.30,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.30,NULL,'2026-06-09 16:19:09'),(132,132,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.35,-1.35,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.35,NULL,'2026-06-09 16:19:09'),(133,133,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.99,-2.99,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.99,NULL,'2026-06-09 16:19:09'),(134,134,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.24,-2.24,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.24,NULL,'2026-06-09 16:19:09'),(135,135,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.13,-1.13,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.13,NULL,'2026-06-09 16:19:09'),(136,136,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.98,-1.98,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.98,NULL,'2026-06-09 16:19:09'),(137,137,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.78,-2.78,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.78,NULL,'2026-06-09 16:19:09'),(138,138,6,0,6,1.30,0.00,1.30,0,0.00,0.00,-1.40,-1.40,-1.30,-1.30,0,0.00,0,0.00,0.00,0.00,0.00,-1.40,'Onsite Treatment at Bithoor.','2026-06-09 16:19:09'),(139,139,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-5.14,-5.14,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-5.14,NULL,'2026-06-09 16:19:09'),(140,140,20,1,21,187.15,8.75,195.90,4,224.00,184.00,-202.00,-242.00,28.10,-11.90,0,0.00,0,0.00,0.00,224.00,28.10,-202.00,'Flow of drains goes to 36/43/130 MLD STP, Jajmau and DPR for I&D works of untapped drains of Kanpur city has been sanctioned by NMCG, New Delhi in 61th EC meeting vide letter no. Pr-12012/21/2020TECH1 NMCG (Comp. No.: 263215) dated 02-05-2025. At present for execution of provisioned works NIT issued by SE , Kanpur vide letter no. 588/AC-9/10 Date - 13/06/2025. Technical and Financial bid of Tender has been opened on 21.07.2025 and 25.09.2025 respectively. Meeting of Tender Sanction Committee at HQ level conducted on date 01.11.2025. Proposal forwarded to NMCG, New Delhi for review/approval of Financial Bids on 03.11.2025.','2026-06-09 16:19:09'),(141,141,9,0,9,98.42,131.85,230.27,3,282.00,189.77,-144.00,-236.23,51.73,-40.50,0,0.00,0,0.00,0.00,282.00,51.73,-144.00,'Flow of these drains goes to 210 MLD STP Bingawan/42 MLD Sajari/30 MLD STP Panka and DPR for I&D works of untapped drains of Kanpur city has been sanctioned by NMCG, New Delhi in 61th EC meeting vide letter no. Pr-12012/21/2020TECH1 NMCG (Comp. No.: 263215) dated 02-05-2025. At present for execution of provisioned works NIT issued by SE , Kanpur vide letter no. 588/AC-9/10 Date - 13/06/2025. Technical bid opened on Scheduled date - 21/07/2025. 06 nos Bidders participated in Tender. Technical Bid evaluation under progress.','2026-06-09 16:19:09'),(142,142,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.68,-1.68,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.68,NULL,'2026-06-09 16:19:09'),(143,143,2,1,3,12.76,0.00,12.76,1,15.00,12.00,2.83,-0.17,2.24,-0.76,0,0.00,0,0.00,0.00,15.00,2.24,2.83,'There is no gap at present','2026-06-09 16:19:09'),(144,144,2,0,2,0.50,0.00,0.50,0,0.00,0.00,-1.97,-1.97,-0.50,-0.50,0,0.00,0,0.00,0.00,0.00,0.00,-1.97,NULL,'2026-06-09 16:19:09'),(145,145,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.01,-1.01,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.01,NULL,'2026-06-09 16:19:09'),(146,146,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.47,-1.47,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.47,NULL,'2026-06-09 16:19:09'),(147,147,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.74,-1.74,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.74,NULL,'2026-06-09 16:19:09'),(148,148,0,0,0,0.00,0.00,0.00,0,0.00,0.00,0.00,0.00,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,0.00,NULL,'2026-06-09 16:19:09'),(149,149,5,0,5,6.68,0.00,6.68,0,0.00,0.00,-4.28,-4.28,-6.68,-6.68,0,0.00,0,0.00,0.00,0.00,0.00,-4.28,'DPR has been prepared by U.P. Jal Nigam (Urban) in SBM 2.0 and submmited for approval.','2026-06-09 16:19:09'),(150,150,3,0,3,8.00,0.00,8.00,0,0.00,0.00,-4.28,-4.28,-8.00,-8.00,0,0.00,0,0.00,0.00,0.00,0.00,-4.28,'Originating from Dist Lakhimpur & falls in Ghagra river.','2026-06-09 16:19:09'),(151,151,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.37,-2.37,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.37,NULL,'2026-06-09 16:19:09'),(152,152,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-20.86,-20.86,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-20.86,NULL,'2026-06-09 16:19:09'),(153,153,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.95,-0.95,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.95,NULL,'2026-06-09 16:19:09'),(154,154,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-6.17,-6.17,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-6.17,NULL,'2026-06-09 16:19:09'),(155,155,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.74,-1.74,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.74,NULL,'2026-06-09 16:19:09'),(156,156,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.93,-0.93,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.93,NULL,'2026-06-09 16:19:09'),(157,157,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-5.64,-5.64,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-5.64,NULL,'2026-06-09 16:19:09'),(158,158,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.37,-1.37,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.37,NULL,'2026-06-09 16:19:09'),(159,159,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.18,-1.18,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.18,NULL,'2026-06-09 16:19:09'),(160,160,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.15,-1.15,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.15,NULL,'2026-06-09 16:19:09'),(161,161,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.84,-1.84,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.84,NULL,'2026-06-09 16:19:09'),(162,162,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.96,-0.96,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.96,NULL,'2026-06-09 16:19:09'),(163,163,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.50,-3.50,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.50,NULL,'2026-06-09 16:19:09'),(164,164,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.69,-0.69,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.69,NULL,'2026-06-09 16:19:09'),(165,165,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.52,-0.52,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.52,NULL,'2026-06-09 16:19:09'),(166,166,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.38,-1.38,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.38,NULL,'2026-06-09 16:19:09'),(167,167,32,1,33,550.98,173.55,724.53,9,624.50,564.00,137.03,76.53,-100.03,-160.53,2,53.50,0,0.00,195.00,873.00,148.47,385.53,'Revised DPR of 145 MLD Basantkunj STP had been sent to NMCG vide APD, SMCG-UP letter no. 775/369/SMCG-UP/01 dt. 02.12.2025 with incorporating the comments raised by NMCG. DPR for 75 MLD Bharwara has been submitted to NMCG vide letter no. 1050/0369/SMCG-UP/12 dt. 27.09.2022 for approval. CE (Ganga) again requested to NMCG for approval of DPR on dt.19.06.2024.','2026-06-09 16:19:09'),(168,168,1,0,1,54.78,0.00,54.78,0,0.00,0.00,-487.47,-487.47,-54.78,-54.78,0,0.00,1,100.00,0.00,100.00,45.22,-387.47,'Concessionaire Agreement has been signed on dt. 26.08.2025. Financial closure is in progress.','2026-06-09 16:19:09'),(169,169,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.61,-0.61,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.61,NULL,'2026-06-09 16:19:09'),(170,170,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.27,-1.27,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.27,NULL,'2026-06-09 16:19:09'),(171,171,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.89,-1.89,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.89,NULL,'2026-06-09 16:19:09'),(172,172,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.76,-0.76,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.76,NULL,'2026-06-09 16:19:09'),(173,173,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.49,-3.49,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.49,NULL,'2026-06-09 16:19:09'),(174,174,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-4.38,-4.38,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-4.38,NULL,'2026-06-09 16:19:09'),(175,175,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.62,-1.62,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.62,NULL,'2026-06-09 16:19:09'),(176,176,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.72,-2.72,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.72,NULL,'2026-06-09 16:19:09'),(177,177,6,0,6,9.04,0.00,9.04,0,0.00,0.00,-12.96,-12.96,-9.04,-9.04,0,0.00,0,0.00,0.00,0.00,0.00,-12.96,'Discharge of this drain is accumulates in Keerat Sagar, kalyan Sagar and Dariba pond.','2026-06-09 16:19:09'),(178,178,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.94,-3.94,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.94,NULL,'2026-06-09 16:19:09'),(179,179,14,0,14,2.63,0.00,2.63,0,0.00,0.00,-3.94,-3.94,-2.63,-2.63,0,0.00,1,6.00,0.00,6.00,3.37,2.06,'After construction of 1 No STP 6 MLD  there will be no gap','2026-06-09 16:19:09'),(180,180,2,0,2,1.54,2.30,3.84,1,2.76,2.76,-2.60,-2.60,-1.08,-1.08,0,0.00,0,0.00,0.00,2.76,0.00,-2.60,'4.50 MLD STP is proposed at goverdhan inder SBM 2.0 by UPJN(U),after which there shall be no gap.','2026-06-09 16:19:09'),(181,181,1,0,1,5.64,0.00,5.64,0,0.00,0.00,-8.82,-8.82,-5.64,-5.64,1,12.00,0,0.00,0.00,12.00,6.36,3.18,'After construction of 1 No STP 12 MLD there will be no gap','2026-06-09 16:19:09'),(182,182,23,0,23,68.55,12.00,80.55,4,67.30,67.30,-31.41,-31.41,-13.25,-13.25,0,0.00,1,60.00,0.00,127.30,46.75,28.59,'After construction of 1 No STP 60 MLD there will be no gap','2026-06-09 16:19:09'),(183,183,13,0,13,11.49,0.00,11.49,2,12.00,12.00,-5.00,-5.00,0.51,0.51,1,13.00,0,0.00,0.00,25.00,13.51,8.00,'After construction of 1 No STP 13 MLD there will be no gap','2026-06-09 16:19:09'),(184,184,5,0,5,2.21,0.00,2.21,0,0.00,0.00,-1.03,-1.03,-2.21,-2.21,0,0.00,0,0.00,0.00,0.00,0.00,-1.03,'DPR for 3.5MLD STP submitted to NMCG, on which NMCG suggested to go for FSTP. DPR  for FSTP submitted to SMCG on 10.10.2024. Observations received to which compliance shall be sent by 31.05.2025','2026-06-09 16:19:09'),(185,185,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.45,-1.45,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.45,NULL,'2026-06-09 16:19:09'),(186,186,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.31,-3.31,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.31,NULL,'2026-06-09 16:19:09'),(187,187,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.66,-3.66,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.66,NULL,'2026-06-09 16:19:09'),(188,188,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.38,-1.38,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.38,NULL,'2026-06-09 16:19:09'),(189,189,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.83,-1.83,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.83,NULL,'2026-06-09 16:19:09'),(190,190,0,1,1,0.00,0.00,0.00,0,0.00,0.00,-0.67,-0.67,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.67,NULL,'2026-06-09 16:19:09'),(191,191,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.68,-3.68,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.68,NULL,'2026-06-09 16:19:09'),(192,192,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.97,-2.97,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.97,NULL,'2026-06-09 16:19:09'),(193,193,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-11.04,-11.04,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-11.04,NULL,'2026-06-09 16:19:09'),(194,194,3,0,3,307.22,26.00,333.22,14,179.00,141.27,-43.24,-80.97,-154.22,-191.95,1,220.00,0,0.00,60.00,459.00,125.78,236.76,'Land acquisition for DPR preparation of  Abu Nallah 1 I&D and STP is under process after which DPR will be prepared and submitted.','2026-06-09 16:19:09'),(195,195,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.65,-2.65,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.65,NULL,'2026-06-09 16:19:09'),(196,196,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.59,-2.59,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.59,NULL,'2026-06-09 16:19:09'),(197,197,0,1,1,0.00,0.00,0.00,0,0.00,0.00,-8.07,-8.07,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-8.07,NULL,'2026-06-09 16:19:09'),(198,198,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.56,-3.56,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.56,NULL,'2026-06-09 16:19:09'),(199,199,0,22,22,0.00,0.00,0.00,0,0.00,0.00,-4.41,-4.41,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-4.41,NULL,'2026-06-09 16:19:09'),(200,200,22,5,27,27.39,0.00,27.39,4,38.00,31.00,8.25,1.25,10.61,3.61,0,0.00,0,0.00,0.00,38.00,10.61,8.25,NULL,'2026-06-09 16:19:09'),(201,201,24,0,24,97.97,36.00,133.97,3,103.00,51.00,-35.53,-87.53,-30.97,-82.97,0,0.00,2,80.00,0.00,183.00,49.03,44.47,NULL,'2026-06-09 16:19:09'),(202,202,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.20,-2.20,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.20,NULL,'2026-06-09 16:19:09'),(203,203,3,0,3,7.40,0.00,7.40,1,10.00,7.13,1.90,-0.97,2.60,-0.27,0,0.00,0,0.00,0.00,10.00,2.60,1.90,NULL,'2026-06-09 16:19:09'),(204,204,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.47,-2.47,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.47,NULL,'2026-06-09 16:19:09'),(205,205,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.63,-2.63,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.63,NULL,'2026-06-09 16:19:09'),(206,206,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-9.98,-9.98,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-9.98,NULL,'2026-06-09 16:19:09'),(207,207,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.83,-3.83,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.83,NULL,'2026-06-09 16:19:09'),(208,208,7,3,10,51.09,7.44,58.53,3,87.00,61.05,26.95,1.00,28.47,2.52,0,0.00,0,0.00,0.00,87.00,28.47,26.95,'22 MLD STP Sahawali: Commercial Operation Date declared, Plant under O&M since 01.04.2024.	32.5 MLD Kidwai Nagar Commercial Operation date declared July 2024: 02 Nos. I&D work completed, STP running by 04 I&D. IPS 2A work Completed in June 2025.','2026-06-09 16:19:09'),(209,209,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.75,-3.75,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.75,NULL,'2026-06-09 16:19:09'),(210,210,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.68,-2.68,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.68,NULL,'2026-06-09 16:19:09'),(211,211,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.82,-1.82,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.82,NULL,'2026-06-09 16:19:09'),(212,212,3,1,4,90.00,0.00,90.00,0,0.00,0.00,-18.14,-18.14,-90.00,-90.00,0,0.00,0,0.00,0.00,0.00,0.00,-18.14,NULL,'2026-06-09 16:19:09'),(213,213,5,0,5,1.59,0.00,1.59,0,0.00,0.00,-1.34,-1.34,-1.59,-1.59,0,0.00,0,0.00,0.00,0.00,0.00,-1.34,NULL,'2026-06-09 16:19:09'),(214,214,4,0,4,7.10,0.00,7.10,1,8.95,0.00,7.64,-1.31,1.85,-7.10,0,0.00,0,0.00,0.00,8.95,1.85,7.64,NULL,'2026-06-09 16:19:09'),(215,215,46,2,48,166.48,92.09,258.57,7,168.00,208.80,-69.86,-29.06,-90.57,-49.77,2,133.00,0,0.00,28.00,329.00,70.43,91.14,'DPR submitted to NMCG for 28 MLD on 16.10.2023 to meet the gap of year 2037','2026-06-09 16:19:09'),(216,216,30,3,33,125.73,86.22,211.95,3,172.00,231.23,-65.86,-6.63,-39.95,19.28,1,50.00,0,0.00,44.00,266.00,54.05,28.14,'DPR for 44 MLD is under preparation and will be submitted by 10.04.2025','2026-06-09 16:19:09'),(217,217,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.89,-0.89,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.89,NULL,'2026-06-09 16:19:09'),(218,218,9,0,9,2.12,0.00,2.12,0,0.00,0.00,-0.71,-0.71,-2.12,-2.12,0,0.00,0,0.00,0.00,0.00,0.00,-0.71,'Date of start given to Firm M/s Aastha Enviro Engineers Pvt. Ltd. on dt. 06.02.2026. Soil testing and Survey completed. Design & Drawing work is in progress. Boundary wall work is in progress.','2026-06-09 16:19:09'),(219,219,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.65,-1.65,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.65,NULL,'2026-06-09 16:19:09'),(220,220,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.47,-0.47,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.47,NULL,'2026-06-09 16:19:09'),(221,221,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.97,-0.97,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.97,NULL,'2026-06-09 16:19:09'),(222,222,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.84,-0.84,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.84,NULL,'2026-06-09 16:19:09'),(223,223,7,0,7,32.80,0.00,32.80,1,18.00,3.50,-8.25,-22.75,-14.80,-29.30,0,0.00,0,0.00,0.00,18.00,0.00,-8.25,'DPR has been sent to NMCG vide SMCG letter no. 131/032/SMCG-UP/02 dt. 22.01.2026. NMCG returned the DPR to the State with the direction to consider taking up this project from State funds or explore other funding schemes.','2026-06-09 16:19:09'),(224,224,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.05,-1.05,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.05,NULL,'2026-06-09 16:19:09'),(225,225,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.79,-0.79,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.79,NULL,'2026-06-09 16:19:09'),(226,226,3,0,3,33.39,0.00,33.39,3,34.00,34.00,-10.47,-10.47,0.61,0.61,0,0.00,0,0.00,0.00,34.00,0.61,-10.47,NULL,'2026-06-09 16:19:09'),(227,227,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.07,-2.07,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.07,NULL,'2026-06-09 16:19:09'),(228,228,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.71,-2.71,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.71,NULL,'2026-06-09 16:19:09'),(229,229,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.10,-2.10,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.10,NULL,'2026-06-09 16:19:09'),(230,230,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.21,-3.21,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.21,NULL,'2026-06-09 16:19:09'),(231,231,4,0,4,15.65,0.00,15.65,0,0.00,0.00,-14.58,-14.58,-15.65,-15.65,0,0.00,0,0.00,20.00,20.00,4.35,5.42,'AA&ES received on 25.07.2024. Draft bid document and NIT sent to NMCG on 05.08.2024 for approval. NIT published on 24-10-2024, Pre-bid meeting held on 07.11.2024, Last date of bid submission is on 24.01.2025. Technical bid opened on 25.01.2025. Tender Bid Evaluation Sheet send to NMCG on dated 28.04.2025 for approval. Approval from NMCG recieved on 29.07.2025, Financial bid opened on dated 07.08.2025 and send to NMCG on dated 04.09.2025 for approval. Approval recieved on 16.09.2025..','2026-06-09 16:19:09'),(232,232,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-7.86,-7.86,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-7.86,NULL,'2026-06-09 16:19:09'),(233,233,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.08,-3.08,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.08,NULL,'2026-06-09 16:19:09'),(234,234,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.51,-1.51,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.51,NULL,'2026-06-09 16:19:09'),(235,235,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.62,-3.62,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.62,NULL,'2026-06-09 16:19:09'),(236,236,99,6,105,97.64,24.00,121.64,1,38.00,38.00,-82.12,-82.12,-83.64,-83.64,0,0.00,1,135.00,0.00,173.00,51.36,52.88,'LOA issue to M/s Enviro Infra Engineers Ltd.-Bhugan Infracon Pvt. Ltd.-Micro Transmission Systems JV on dt. 26.07.2024 & Concession Agreement is signed on 27.09.2024, For Finnancial closer document submitted by Concessanair in NMCG and under Scrutiny. Difference between the actual and provided NGL of proposed STP site has been found during field survry. Effective date yet not declared due to STP land level issue. In the review meeting on 25.04.25 at NMCG, UPJN-R/PE were asked to work out on the possible alternatives options like retaining wall option, backfilling option or others etc. Post which UPJN-R and PE had to work on optimization of the solution and comeback with all possible solution. Accordingly, additional cost implication worth Rs. 81 crore for STP due to level difference sent to NMCG on 21.04.25.','2026-06-09 16:19:09'),(237,237,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.57,-2.57,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.57,NULL,'2026-06-09 16:19:09'),(238,238,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.46,-1.46,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.46,NULL,'2026-06-09 16:19:09'),(239,239,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-33.69,-33.69,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-33.69,NULL,'2026-06-09 16:19:09'),(240,240,1,1,2,3.40,0.00,3.40,0,0.00,0.00,-12.77,-12.77,-3.40,-3.40,0,0.00,1,5.00,3.00,8.00,4.60,-4.77,NULL,'2026-06-09 16:19:09'),(241,241,2,0,2,11.50,0.00,11.50,0,0.00,0.00,-12.77,-12.77,-11.50,-11.50,0,0.00,0,0.00,17.00,17.00,5.50,4.23,'Revised DPR for 18 MLD, 5 MLD and 3 MLD STP approved by NMCG on 06.03.2025. Draft Tender Document shall be sent to NMCG by 05.06.2025','2026-06-09 16:19:09'),(242,242,0,0,0,0.00,0.00,0.00,1,40.00,5.00,-8.48,-43.48,40.00,5.00,0,0.00,0,0.00,0.00,40.00,40.00,-8.48,NULL,'2026-06-09 16:19:09'),(243,243,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.42,-1.42,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.42,NULL,'2026-06-09 16:19:09'),(244,244,3,1,4,3.07,0.00,3.07,0,0.00,0.00,-3.16,-3.16,-3.07,-3.07,1,5.00,0,0.00,0.00,5.00,1.93,1.84,'LOA issue to M/s R.K. Engineers Sales Ltd. on Date 13-09-2024  Contract Agreement is signed on 08.10.2024, Survey and Soil investigation work completed, BEP, Layout and HFD approved for 05 MLD STP. GAD, Structural Design and Dwg. for SBR and Boundary wall approved. GAD for Sludge Handling Unit Submitted, which are clear for Vetting & Structural Design.','2026-06-09 16:19:09'),(245,245,1,0,1,3.00,0.00,3.00,0,0.00,0.00,-3.03,-3.03,-3.00,-3.00,1,5.00,0,0.00,0.00,5.00,2.00,1.97,'LOA issue to M/s R.K. Engineers Sales Ltd. on Date 13-09-2024  Contract Agreement is signed on 08.10.2024, Survey and Soil investigation work completed, BEP and HFD approved for 05 MLD STP. Work stop due to land Dispute.','2026-06-09 16:19:09'),(246,246,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.56,-1.56,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.56,NULL,'2026-06-09 16:19:09'),(247,247,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-3.67,-3.67,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-3.67,NULL,'2026-06-09 16:19:09'),(248,248,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.56,-2.56,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.56,NULL,'2026-06-09 16:19:09'),(249,249,1,0,1,12.00,0.00,12.00,1,15.00,14.50,1.61,1.11,3.00,2.50,0,0.00,0,0.00,0.00,15.00,3.00,1.61,'STP commissioned on 12.02 2024 and Under O&M since 01.04.2025.','2026-06-09 16:19:09'),(250,250,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-6.11,-6.11,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-6.11,NULL,'2026-06-09 16:19:09'),(251,251,1,1,2,20.10,0.00,20.10,0,0.00,0.00,-16.31,-16.31,-20.10,-20.10,1,40.00,0,0.00,0.00,40.00,19.90,23.69,'LOA issue to M/s R.K. Engineers Sales Ltd.-M/s Anand Constrwell Pvt. Ldt. (JV) on Date 04-07-2024 Contract Agreement is signed on 08.10.2024, Survey and Soil investigation work completed, BEP, Layout and HFD approved for 40 MLD STP. GAD, Structural Design and Dwg. for SBR and Boundary wall approved. GAD for Admin Building and Sludge Handling and Dewatering Building Submitted, which clear for Vetting & Structural Design. CCT and I&D GAD Submitted, which clear for Vetting & Structural Design.','2026-06-09 16:19:09'),(252,252,5,0,5,6.70,0.00,6.70,0,0.00,0.00,-5.40,-5.40,-6.70,-6.70,1,10.00,0,0.00,0.00,10.00,3.30,4.60,'LOA issue to M/s R.K. Engineers Sales Ltd. on Date 13-09-2024  Contract Agreement is signed on 08.10.2024, Survey and Soil investigation work completed, BEP, Layout and HFD approved for 10 MLD STP. GAD, Structural Design and Dwg. for SBR and Boundary wall approved. GAD for Sludge Handling Unit Submitted, which are clear for Vetting & Structural Design.. CCT GAD were Submitted, which clear for Vetting & Structural Design.','2026-06-09 16:19:09'),(253,253,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.86,-1.86,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.86,NULL,'2026-06-09 16:19:09'),(254,254,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-7.65,-7.65,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-7.65,NULL,'2026-06-09 16:19:09'),(255,255,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.49,-1.49,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.49,NULL,'2026-06-09 16:19:09'),(256,256,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-6.66,-6.66,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-6.66,NULL,'2026-06-09 16:19:09'),(257,257,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-8.50,-8.50,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-8.50,NULL,'2026-06-09 16:19:09'),(258,258,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-8.45,-8.45,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-8.45,NULL,'2026-06-09 16:19:09'),(259,259,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.51,-1.51,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.51,NULL,'2026-06-09 16:19:09'),(260,260,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.52,-2.52,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.52,NULL,'2026-06-09 16:19:09'),(261,261,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-2.52,-2.52,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-2.52,NULL,'2026-06-09 16:19:09'),(262,262,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.99,-0.99,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.99,NULL,'2026-06-09 16:19:09'),(263,263,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-1.78,-1.78,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-1.78,NULL,'2026-06-09 16:19:09'),(264,264,21,0,21,12.72,0.00,12.72,0,0.00,0.00,-24.32,-24.32,-12.72,-12.72,0,0.00,0,0.00,0.00,0.00,0.00,-24.32,'DPR preparation work is in progress.','2026-06-09 16:19:09'),(265,265,0,0,0,0.00,0.00,0.00,0,0.00,0.00,-0.22,-0.22,0.00,0.00,0,0.00,0,0.00,0.00,0.00,0.00,-0.22,NULL,'2026-06-09 16:19:09'),(266,266,2,0,2,3.40,0.00,3.40,0,0.00,0.00,-2.78,-2.78,-3.40,-3.40,0,0.00,0,0.00,0.00,0.00,0.00,-2.78,NULL,'2026-06-09 16:19:09'),(267,267,5,1,6,13.94,0.00,13.94,3,17.00,16.04,2.64,1.68,3.06,2.10,0,0.00,0,0.00,0.00,17.00,3.06,2.64,'Extra Work of Boundarywall, Fixing of Handrailing at 10 MLD STP, Drain Lining of Karundiya Drain and Installation of SCADA etc is still pending.','2026-06-09 16:19:09'),(268,268,7,0,7,11.96,0.00,11.96,0,0.00,0.00,-19.32,-19.32,-11.96,-11.96,1,5.00,0,0.00,0.00,5.00,0.00,-14.32,'Total 7 drains are discharging into River Ganga in NPP Shuklaganj out of which 5 drains of discharge 4.66 MLD has to be Intercepted & Diverted to under Construction 5 MLD STP Shuklaganj and rest of the 02 drains of discharge 7.3 MLD has to be tapped & treated by U.P. J.N. (Urban) under SBM 2 programme. The work of tapping domestic sewage outflow through I&D was completed on 30.12.2025 by tapping 04 drains namely Indira Nagar, Manohar Nagar-1, Manohar Nagar-2 and Railway Bridge and trial run of the scheme has been started. The trial run of the scheme is to be done for 03 months, after which the operation of STP will start at full capacity. The work of cleaning 1.96 km drain and construction of Connecting Drain of 190 meters to bring 01 drain Ganga Vishnu Drain to I&D is to be done by M/s KRMPL','2026-06-09 16:19:09'),(269,269,1,0,1,11.36,0.00,11.36,1,15.00,4.00,-7.20,-18.20,3.64,-7.36,0,0.00,0,0.00,0.00,15.00,3.64,-7.20,'The overall progress of the project is 99%. All works (Civil/Electrical & Mechanical) of the STP has been completed. Due to the rise in groundwater levels resulting from floods in the Ganga River and rainfall, the construction of the remaining 01 number of Manhole near the STP premises and the Dewatering work remained disrupted from August 2025 to January 2026. Against the Dewatering and Desilting works in the 1200 mm RCC Pipe, the Dewatering work is currently in progress. Re-laying of a 1.20 km length of 1200 mm RCC Pipe from MH 27 to MH-39, and the construction of 14 numbers of Manholes are pending. Concessionaire M/s Kanpur River Management Pvt. Ltd., Kanpur has targeted to complete the works of the project by October 2026','2026-06-09 16:19:09'),(270,270,1,0,1,78.00,0.00,78.00,2,105.00,95.00,-142.50,-152.50,27.00,17.00,0,0.00,0,0.00,0.00,105.00,27.00,-142.50,NULL,'2026-06-09 16:19:09'),(271,271,28,0,28,73.73,141.27,215.00,4,110.00,23.50,-137.50,-224.00,-105.00,-191.50,1,7.00,0,0.00,140.00,257.00,42.00,9.50,'There are 02 partially tapped drains for which construction of 55 MLD STP is in progress under Namami Gange. For 02 untapped drains, construction of 07 MLD STP is in progress under AMRUT 2.0','2026-06-09 16:19:09'),(272,272,43,0,43,226.80,130.20,357.00,2,260.00,180.00,12.50,-67.50,-97.00,-177.00,0,0.00,1,60.00,0.00,320.00,0.00,72.50,'Revised DPR for 60 MLD STP approved by NMCG on 06.03.2025. Bids opened on 07.10.2025, evaluation in process','2026-06-09 16:19:09');
/*!40000 ALTER TABLE `drainage_stp_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `population_statistics`
--

DROP TABLE IF EXISTS `population_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `population_statistics` (
  `population_stat_id` int NOT NULL AUTO_INCREMENT,
  `town_city_id` int NOT NULL,
  `present_population_2024` decimal(10,2) DEFAULT NULL,
  `present_population_based_sewage_generation_2024` decimal(10,2) DEFAULT NULL,
  `length_of_sewerage_network_km` decimal(10,2) DEFAULT NULL,
  `no_of_house_holds` int DEFAULT NULL,
  `no_of_hh_connected_to_sewerage_network` int DEFAULT NULL,
  `projected_population_2037` decimal(10,2) DEFAULT NULL,
  `population_based_sewage_generation_2037` decimal(10,2) DEFAULT NULL,
  `sewage_gap_based_on_projected_population_2037` decimal(10,2) DEFAULT NULL,
  `scrape_time` datetime DEFAULT NULL,
  PRIMARY KEY (`population_stat_id`),
  UNIQUE KEY `town_city_id` (`town_city_id`),
  CONSTRAINT `population_statistics_ibfk_1` FOREIGN KEY (`town_city_id`) REFERENCES `towns_cities` (`town_city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `population_statistics`
--

LOCK TABLES `population_statistics` WRITE;
/*!40000 ALTER TABLE `population_statistics` DISABLE KEYS */;
INSERT INTO `population_statistics` VALUES (1,1,23.78,286.07,1613.00,396000,210000,32.81,354.41,43.94,'2026-06-09 16:19:09'),(2,2,11.25,121.55,106.57,147000,21468,12.94,139.73,18.27,'2026-06-09 16:19:09'),(3,3,1.45,15.70,NULL,NULL,NULL,NULL,NULL,0.00,'2026-06-09 16:19:09'),(4,4,1.11,11.99,NULL,NULL,NULL,NULL,NULL,15.00,'2026-06-09 16:19:09'),(5,5,0.34,3.71,NULL,NULL,NULL,NULL,NULL,0.00,'2026-06-09 16:19:09'),(6,6,2.80,30.24,0.00,46667,0,3.53,38.10,-38.10,'2026-06-09 16:19:09'),(7,7,0.12,1.25,NULL,1706,NULL,0.14,1.55,-1.55,'2026-06-09 16:19:09'),(8,8,0.14,1.51,NULL,2071,NULL,0.17,1.82,-1.82,'2026-06-09 16:19:09'),(9,9,1.15,12.42,0.00,20838,0,1.49,16.09,-16.09,'2026-06-09 16:19:09'),(10,10,0.38,4.16,NULL,5084,NULL,0.50,5.45,-5.45,'2026-06-09 16:19:09'),(11,11,0.45,4.83,NULL,5750,NULL,0.61,6.63,-6.63,'2026-06-09 16:19:09'),(12,12,0.39,4.19,NULL,5219,NULL,0.54,5.83,-5.83,'2026-06-09 16:19:09'),(13,13,0.22,2.41,NULL,3071,NULL,0.28,3.05,-3.05,'2026-06-09 16:19:09'),(14,14,4.66,50.32,248.00,59870,19800,6.54,70.69,-19.69,'2026-06-09 16:19:09'),(15,15,0.34,2.26,NULL,NULL,NULL,0.43,2.86,5.14,'2026-06-09 16:19:09'),(16,16,0.94,10.00,NULL,NULL,NULL,1.30,14.00,0.00,'2026-06-09 16:19:09'),(17,17,1.35,14.67,NULL,NULL,NULL,1.80,19.45,0.55,'2026-06-09 16:19:09'),(18,18,0.55,5.93,NULL,8618,NULL,0.59,6.44,-6.44,'2026-06-09 16:19:09'),(19,19,0.18,1.93,NULL,2510,NULL,0.21,2.26,-2.26,'2026-06-09 16:19:09'),(20,20,1.96,21.17,0.00,29162,0,2.31,24.95,-24.95,'2026-06-09 16:19:09'),(21,21,0.14,1.52,NULL,NULL,NULL,0.17,1.85,-1.85,'2026-06-09 16:19:09'),(22,22,0.11,1.21,NULL,NULL,NULL,0.13,1.47,-1.47,'2026-06-09 16:19:09'),(23,23,0.16,1.79,NULL,2505,NULL,0.20,2.14,-2.14,'2026-06-09 16:19:09'),(24,24,0.09,0.98,NULL,NULL,NULL,0.11,1.24,-1.24,'2026-06-09 16:19:09'),(25,25,0.14,1.58,NULL,NULL,NULL,0.19,2.11,-2.11,'2026-06-09 16:19:09'),(26,26,1.45,13.94,NULL,NULL,NULL,NULL,NULL,0.00,'2026-06-09 16:19:09'),(27,27,11.36,123.58,314.00,206545,65219,13.96,150.74,-52.74,'2026-06-09 16:19:09'),(28,28,1.35,14.58,81.00,22500,0,1.70,18.37,5.63,'2026-06-09 16:19:09'),(29,29,0.37,3.99,58.87,7400,7400,0.53,5.72,-0.66,'2026-06-09 16:19:09'),(30,30,3.74,40.36,237.00,52690,27917,4.65,50.23,-10.23,'2026-06-09 16:19:09'),(31,31,0.64,6.91,0.00,12800,0,0.90,9.74,0.26,'2026-06-09 16:19:09'),(32,32,0.30,3.24,25.57,6100,6100,0.43,4.64,1.61,'2026-06-09 16:19:09'),(33,33,1.67,18.13,NULL,NULL,NULL,2.25,24.33,20.67,'2026-06-09 16:19:09'),(34,34,0.21,1.43,NULL,NULL,NULL,0.27,1.82,1.60,'2026-06-09 16:19:09'),(35,35,0.17,1.17,NULL,NULL,NULL,0.22,1.48,-1.48,'2026-06-09 16:19:09'),(36,36,0.51,6.48,NULL,NULL,NULL,NULL,NULL,6.00,'2026-06-09 16:19:09'),(37,37,0.28,3.82,NULL,NULL,NULL,NULL,NULL,3.00,'2026-06-09 16:19:09'),(38,38,1.50,16.20,46.00,25000,15000,1.72,18.63,5.37,'2026-06-09 16:19:09'),(39,39,0.18,2.00,0.00,3157,0,3.50,37.76,-36.16,'2026-06-09 16:19:09'),(40,40,3.04,32.92,23.50,44000,4450,3.50,37.76,7.19,'2026-06-09 16:19:09'),(41,41,3.49,37.69,0.00,51336,0,4.07,43.96,-13.96,'2026-06-09 16:19:09'),(42,42,0.00,0.00,NULL,NULL,NULL,0.00,0.00,17.70,'2026-06-09 16:19:09'),(43,43,0.39,4.28,NULL,NULL,NULL,0.43,4.70,-4.70,'2026-06-09 16:19:09'),(44,44,0.19,2.03,NULL,NULL,NULL,0.22,2.44,-2.44,'2026-06-09 16:19:09'),(45,45,0.13,1.47,NULL,NULL,NULL,0.18,1.94,-1.94,'2026-06-09 16:19:09'),(46,46,0.33,3.54,NULL,NULL,NULL,0.38,4.12,-4.12,'2026-06-09 16:19:09'),(47,47,0.30,3.29,NULL,NULL,NULL,0.35,3.82,-3.82,'2026-06-09 16:19:09'),(48,48,0.30,3.24,NULL,NULL,NULL,0.35,3.77,-3.77,'2026-06-09 16:19:09'),(49,49,0.25,2.74,NULL,NULL,NULL,0.29,3.19,-3.19,'2026-06-09 16:19:09'),(50,50,0.37,3.97,NULL,NULL,NULL,0.48,5.16,-5.16,'2026-06-09 16:19:09'),(51,51,2.44,26.35,NULL,NULL,NULL,2.94,31.75,-31.75,'2026-06-09 16:19:09'),(52,52,8.61,93.00,187.00,193000,26342,9.90,106.94,-36.94,'2026-06-09 16:19:09'),(53,53,9.15,98.00,NULL,183000,183000,12.60,136.00,38.00,'2026-06-09 16:19:09'),(54,54,12.25,132.00,NULL,245000,245000,16.50,178.00,233.00,'2026-06-09 16:19:09'),(55,55,33.26,368.58,2300.00,652000,652000,43.80,475.00,84.50,'2026-06-09 16:19:09'),(56,56,1.40,15.50,NULL,NULL,NULL,1.90,20.52,0.48,'2026-06-09 16:19:09'),(57,57,0.31,3.35,NULL,NULL,NULL,0.39,4.25,-4.25,'2026-06-09 16:19:09'),(58,58,0.42,4.58,NULL,NULL,NULL,0.53,5.77,-5.77,'2026-06-09 16:19:09'),(59,59,0.29,4.11,NULL,NULL,NULL,NULL,NULL,0.00,'2026-06-09 16:19:09'),(60,60,11.40,124.38,307.00,246647,45428,16.50,185.00,-51.00,'2026-06-09 16:19:09'),(61,61,0.08,0.93,NULL,NULL,NULL,0.10,1.07,-1.07,'2026-06-09 16:19:09'),(62,62,0.41,4.39,0.00,NULL,0,0.44,4.76,-4.76,'2026-06-09 16:19:09'),(63,63,0.17,1.87,NULL,NULL,NULL,0.22,2.40,-2.40,'2026-06-09 16:19:09'),(64,64,0.47,5.10,NULL,NULL,NULL,0.53,5.75,-5.75,'2026-06-09 16:19:09'),(65,65,0.79,8.51,NULL,NULL,NULL,0.92,10.00,-10.00,'2026-06-09 16:19:09'),(66,66,0.11,1.22,NULL,NULL,NULL,0.14,1.51,-1.51,'2026-06-09 16:19:09'),(67,67,0.57,6.15,NULL,NULL,NULL,0.83,8.96,-8.96,'2026-06-09 16:19:09'),(68,68,0.57,6.15,65.00,11400,11400,0.81,8.74,0.26,'2026-06-09 16:19:09'),(69,69,3.41,36.29,42.00,59000,5100,3.99,43.07,-7.07,'2026-06-09 16:19:09'),(70,70,0.13,0.72,NULL,NULL,NULL,0.16,0.92,-0.92,'2026-06-09 16:19:09'),(71,71,0.38,4.08,NULL,NULL,NULL,0.48,5.19,-5.19,'2026-06-09 16:19:09'),(72,72,0.20,1.10,NULL,NULL,NULL,1.40,0.25,-0.25,'2026-06-09 16:19:09'),(73,73,2.50,27.04,NULL,NULL,NULL,3.18,34.35,-34.35,'2026-06-09 16:19:09'),(74,74,0.20,1.11,NULL,NULL,NULL,0.25,1.41,-1.41,'2026-06-09 16:19:09'),(75,75,0.08,0.42,NULL,NULL,NULL,0.10,0.54,-0.54,'2026-06-09 16:19:09'),(76,76,0.15,0.82,NULL,NULL,NULL,0.19,1.04,-1.04,'2026-06-09 16:19:09'),(77,77,0.47,5.07,NULL,NULL,NULL,0.60,6.44,-6.44,'2026-06-09 16:19:09'),(78,78,0.24,1.33,NULL,NULL,NULL,0.30,1.69,-1.69,'2026-06-09 16:19:09'),(79,79,0.46,4.94,NULL,NULL,NULL,0.58,6.28,-6.28,'2026-06-09 16:19:09'),(80,80,0.33,3.57,NULL,NULL,NULL,0.42,4.53,-4.53,'2026-06-09 16:19:09'),(81,81,0.74,8.01,NULL,NULL,NULL,0.94,10.17,-10.17,'2026-06-09 16:19:09'),(82,82,1.02,11.01,NULL,NULL,NULL,1.30,13.99,-13.99,'2026-06-09 16:19:09'),(83,83,1.74,18.86,0.00,30000,0,2.00,21.61,2.39,'2026-06-09 16:19:09'),(84,84,0.17,1.88,NULL,NULL,NULL,0.20,2.18,-2.18,'2026-06-09 16:19:09'),(85,85,0.68,7.39,NULL,9560,NULL,0.79,8.56,-8.56,'2026-06-09 16:19:09'),(86,86,0.20,2.13,NULL,2515,NULL,0.26,2.78,-2.78,'2026-06-09 16:19:09'),(87,87,0.62,6.70,0.00,8408,0,0.73,7.88,-7.88,'2026-06-09 16:19:09'),(88,88,0.59,6.43,NULL,8655,NULL,0.63,6.83,-6.83,'2026-06-09 16:19:09'),(89,89,0.09,1.04,NULL,1382,NULL,0.11,1.19,-1.19,'2026-06-09 16:19:09'),(90,90,0.17,1.82,NULL,2202,NULL,0.22,2.42,-2.42,'2026-06-09 16:19:09'),(91,91,0.09,1.04,NULL,1352,NULL,0.12,1.26,-1.26,'2026-06-09 16:19:09'),(92,92,2.52,27.25,NULL,33919,NULL,3.30,35.59,-35.59,'2026-06-09 16:19:09'),(93,93,0.17,1.80,NULL,2205,NULL,0.22,2.34,-2.34,'2026-06-09 16:19:09'),(94,94,0.11,1.15,NULL,1570,NULL,0.12,1.32,-1.32,'2026-06-09 16:19:09'),(95,95,2.60,28.17,NULL,NULL,NULL,NULL,NULL,30.00,'2026-06-09 16:19:09'),(96,96,0.10,1.12,NULL,NULL,NULL,0.12,1.34,-1.34,'2026-06-09 16:19:09'),(97,97,0.31,3.35,NULL,NULL,NULL,0.38,4.17,-4.17,'2026-06-09 16:19:09'),(98,98,0.19,2.11,NULL,NULL,NULL,0.22,2.45,-2.45,'2026-06-09 16:19:09'),(99,99,0.12,1.26,NULL,NULL,NULL,0.14,1.54,-1.54,'2026-06-09 16:19:09'),(100,100,0.15,1.61,NULL,NULL,NULL,0.20,2.23,-2.23,'2026-06-09 16:19:09'),(101,101,0.33,3.57,NULL,NULL,NULL,0.39,4.29,-4.29,'2026-06-09 16:19:09'),(102,102,6.17,66.64,0.00,NULL,0,7.32,79.07,-27.07,'2026-06-09 16:19:09'),(103,103,0.09,1.00,NULL,NULL,NULL,0.12,1.26,-1.26,'2026-06-09 16:19:09'),(104,104,0.74,8.03,NULL,NULL,NULL,0.88,9.57,-9.57,'2026-06-09 16:19:09'),(105,105,0.14,1.59,NULL,NULL,NULL,0.16,1.77,-1.77,'2026-06-09 16:19:09'),(106,106,0.21,2.32,NULL,NULL,NULL,0.25,2.69,-2.69,'2026-06-09 16:19:09'),(107,107,0.25,2.75,NULL,NULL,NULL,0.28,3.02,-3.02,'2026-06-09 16:19:09'),(108,108,0.14,1.55,NULL,NULL,NULL,0.18,1.92,-1.92,'2026-06-09 16:19:09'),(109,109,0.77,8.35,NULL,NULL,NULL,0.95,10.30,-10.30,'2026-06-09 16:19:09'),(110,110,0.63,6.84,NULL,NULL,NULL,0.87,9.34,-9.34,'2026-06-09 16:19:09'),(111,111,1.03,11.17,33.00,22092,6190,1.22,13.20,-0.20,'2026-06-09 16:19:09'),(112,112,0.43,4.64,NULL,NULL,NULL,0.60,6.44,-6.44,'2026-06-09 16:19:09'),(113,113,0.16,1.78,NULL,NULL,NULL,0.22,2.35,-2.35,'2026-06-09 16:19:09'),(114,114,0.11,1.25,NULL,NULL,NULL,0.15,1.60,-1.60,'2026-06-09 16:19:09'),(115,115,0.14,1.55,NULL,NULL,NULL,0.18,1.92,-1.92,'2026-06-09 16:19:09'),(116,116,0.32,3.47,NULL,NULL,NULL,0.42,4.57,-4.57,'2026-06-09 16:19:09'),(117,117,0.26,2.84,NULL,NULL,NULL,0.34,3.65,-3.65,'2026-06-09 16:19:09'),(118,118,0.13,1.41,NULL,NULL,NULL,0.16,1.80,-1.80,'2026-06-09 16:19:09'),(119,119,0.09,1.02,NULL,NULL,NULL,0.11,1.23,-1.23,'2026-06-09 16:19:09'),(120,120,0.32,3.46,NULL,NULL,NULL,0.42,4.54,-4.54,'2026-06-09 16:19:09'),(121,121,0.25,2.77,NULL,NULL,NULL,0.31,3.36,-3.36,'2026-06-09 16:19:09'),(122,122,0.27,2.97,NULL,NULL,NULL,0.33,3.60,-3.60,'2026-06-09 16:19:09'),(123,123,0.30,3.27,NULL,NULL,NULL,0.37,3.97,-3.97,'2026-06-09 16:19:09'),(124,124,0.21,2.30,NULL,NULL,NULL,0.26,2.80,-2.80,'2026-06-09 16:19:09'),(125,125,0.12,1.35,NULL,NULL,NULL,0.15,1.64,-1.64,'2026-06-09 16:19:09'),(126,126,0.28,2.99,NULL,NULL,NULL,0.33,3.64,-3.64,'2026-06-09 16:19:09'),(127,127,0.21,2.24,NULL,NULL,NULL,0.26,2.82,-2.82,'2026-06-09 16:19:09'),(128,128,0.10,1.13,NULL,NULL,NULL,0.13,1.38,-1.38,'2026-06-09 16:19:09'),(129,129,0.18,1.98,NULL,NULL,NULL,0.24,2.64,-2.64,'2026-06-09 16:19:09'),(130,130,0.26,2.78,NULL,3442,NULL,0.32,3.48,-3.48,'2026-06-09 16:19:09'),(131,131,0.13,1.40,0.00,2654,0,0.16,1.67,-1.67,'2026-06-09 16:19:09'),(132,132,0.48,5.14,NULL,7407,NULL,0.54,5.84,-5.84,'2026-06-09 16:19:09'),(133,133,35.50,426.00,3575.00,596000,295000,38.14,457.68,48.32,'2026-06-09 16:19:09'),(134,134,0.16,1.68,NULL,2121,NULL,0.20,2.18,-2.18,'2026-06-09 16:19:09'),(135,135,1.12,12.17,0.00,19562,0,1.29,13.91,1.09,'2026-06-09 16:19:09'),(136,136,0.29,1.97,NULL,NULL,NULL,0.37,2.50,-2.50,'2026-06-09 16:19:09'),(137,137,0.18,1.01,NULL,NULL,NULL,0.23,1.28,-1.28,'2026-06-09 16:19:09'),(138,138,0.26,1.47,NULL,NULL,NULL,0.33,1.86,-1.86,'2026-06-09 16:19:09'),(139,139,0.31,1.74,NULL,NULL,NULL,0.40,2.22,-2.22,'2026-06-09 16:19:09'),(140,140,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,'2026-06-09 16:19:09'),(141,141,0.76,4.28,NULL,NULL,NULL,0.97,5.44,-5.44,'2026-06-09 16:19:09'),(142,142,0.42,2.37,NULL,NULL,NULL,0.54,3.02,-3.02,'2026-06-09 16:19:09'),(143,143,1.93,20.86,NULL,NULL,NULL,2.45,26.50,-26.50,'2026-06-09 16:19:09'),(144,144,0.17,0.95,NULL,NULL,NULL,0.22,1.21,-1.21,'2026-06-09 16:19:09'),(145,145,0.57,6.17,NULL,NULL,NULL,0.73,7.84,-7.84,'2026-06-09 16:19:09'),(146,146,0.31,1.74,NULL,NULL,NULL,0.39,2.21,-2.21,'2026-06-09 16:19:09'),(147,147,0.17,0.93,NULL,NULL,NULL,0.21,1.18,-1.18,'2026-06-09 16:19:09'),(148,148,0.52,5.64,NULL,NULL,NULL,0.66,7.17,-7.17,'2026-06-09 16:19:09'),(149,149,0.24,1.37,NULL,NULL,NULL,0.31,1.74,-1.74,'2026-06-09 16:19:09'),(150,150,0.11,1.18,NULL,NULL,NULL,0.13,1.39,-1.39,'2026-06-09 16:19:09'),(151,151,0.10,1.15,NULL,NULL,NULL,0.12,1.33,-1.33,'2026-06-09 16:19:09'),(152,152,0.17,1.84,NULL,NULL,NULL,0.20,2.23,-2.23,'2026-06-09 16:19:09'),(153,153,0.17,0.96,NULL,NULL,NULL,0.22,1.22,-1.22,'2026-06-09 16:19:09'),(154,154,0.62,3.50,NULL,NULL,NULL,0.79,4.44,-4.44,'2026-06-09 16:19:09'),(155,155,0.12,0.69,NULL,NULL,NULL,0.16,0.87,-0.87,'2026-06-09 16:19:09'),(156,156,0.09,0.52,NULL,NULL,NULL,0.12,0.66,-0.66,'2026-06-09 16:19:09'),(157,157,0.25,1.38,NULL,NULL,NULL,0.31,1.75,-1.75,'2026-06-09 16:19:09'),(158,158,40.62,487.47,2768.00,718925,356099,58.58,702.91,270.09,'2026-06-09 16:19:09'),(159,159,0.11,0.61,NULL,NULL,NULL,0.14,0.77,-0.77,'2026-06-09 16:19:09'),(160,160,0.23,1.27,NULL,NULL,NULL,0.29,1.61,-1.61,'2026-06-09 16:19:09'),(161,161,0.34,1.89,NULL,NULL,NULL,0.43,2.40,-2.40,'2026-06-09 16:19:09'),(162,162,0.14,0.76,NULL,NULL,NULL,0.17,0.96,-0.96,'2026-06-09 16:19:09'),(163,163,0.32,3.49,NULL,NULL,NULL,0.37,4.06,-4.06,'2026-06-09 16:19:09'),(164,164,0.40,4.38,NULL,NULL,NULL,0.57,6.12,-6.12,'2026-06-09 16:19:09'),(165,165,0.15,1.62,NULL,NULL,NULL,0.16,1.77,-1.77,'2026-06-09 16:19:09'),(166,166,0.25,2.72,NULL,NULL,NULL,0.32,3.42,-3.42,'2026-06-09 16:19:09'),(167,167,1.20,12.96,0.00,NULL,0,1.48,16.04,-16.04,'2026-06-09 16:19:09'),(168,168,0.36,3.94,0.00,6000,0,0.41,4.47,-4.47,'2026-06-09 16:19:09'),(169,169,0.36,3.94,0.00,6000,0,0.41,4.47,1.53,'2026-06-09 16:19:09'),(170,170,0.50,5.36,0.00,8330,0,0.58,5.21,-2.45,'2026-06-09 16:19:09'),(171,171,0.81,8.82,0.00,13620,0,0.93,10.06,1.94,'2026-06-09 16:19:09'),(172,172,9.14,98.71,290.00,162000,38000,12.61,136.22,-8.92,'2026-06-09 16:19:09'),(173,173,1.51,17.00,70.00,30000,7000,1.74,18.75,6.25,'2026-06-09 16:19:09'),(174,174,0.15,1.03,NULL,NULL,NULL,0.19,1.31,-1.31,'2026-06-09 16:19:09'),(175,175,0.13,1.45,NULL,NULL,NULL,0.15,1.63,-1.63,'2026-06-09 16:19:09'),(176,176,0.31,3.31,NULL,NULL,NULL,0.49,5.26,-5.26,'2026-06-09 16:19:09'),(177,177,0.34,3.66,NULL,NULL,NULL,0.43,4.67,-4.67,'2026-06-09 16:19:09'),(178,178,0.13,1.38,NULL,NULL,NULL,0.14,1.53,-1.53,'2026-06-09 16:19:09'),(179,179,0.17,1.83,NULL,NULL,NULL,0.20,2.13,-2.13,'2026-06-09 16:19:09'),(180,180,0.06,0.67,NULL,NULL,NULL,0.07,0.07,-0.07,'2026-06-09 16:19:09'),(181,181,0.34,3.68,NULL,NULL,NULL,0.40,4.34,-4.34,'2026-06-09 16:19:09'),(182,182,0.27,2.97,NULL,NULL,NULL,0.34,3.65,-3.65,'2026-06-09 16:19:09'),(183,183,1.02,11.04,NULL,NULL,NULL,1.26,13.56,-13.56,'2026-06-09 16:19:09'),(184,184,18.52,222.24,677.47,298000,39874,25.77,278.33,180.67,'2026-06-09 16:19:09'),(185,185,0.25,2.65,NULL,NULL,NULL,0.30,3.28,-3.28,'2026-06-09 16:19:09'),(186,186,0.24,2.59,NULL,NULL,NULL,0.28,3.04,-3.04,'2026-06-09 16:19:09'),(187,187,0.75,8.07,NULL,NULL,NULL,0.96,10.41,-10.41,'2026-06-09 16:19:09'),(188,188,0.33,3.56,NULL,NULL,NULL,0.43,4.66,-4.66,'2026-06-09 16:19:09'),(189,189,0.40,4.41,NULL,NULL,NULL,NULL,NULL,0.00,'2026-06-09 16:19:09'),(190,190,2.75,29.75,NULL,NULL,NULL,NULL,NULL,38.00,'2026-06-09 16:19:09'),(191,191,12.82,138.53,244.00,186452,79802,14.31,154.57,28.43,'2026-06-09 16:19:09'),(192,192,0.20,2.20,NULL,NULL,NULL,0.23,2.49,-2.49,'2026-06-09 16:19:09'),(193,193,0.75,8.10,NULL,NULL,NULL,0.89,9.66,0.34,'2026-06-09 16:19:09'),(194,194,0.23,2.47,NULL,NULL,NULL,0.25,2.72,-2.72,'2026-06-09 16:19:09'),(195,195,0.24,2.63,NULL,NULL,NULL,0.30,3.23,-3.23,'2026-06-09 16:19:09'),(196,196,0.92,9.98,NULL,NULL,NULL,1.16,12.53,-12.53,'2026-06-09 16:19:09'),(197,197,0.35,3.83,NULL,NULL,NULL,0.43,4.59,-4.59,'2026-06-09 16:19:09'),(198,198,5.56,60.05,65.00,136400,7700,8.42,90.90,-3.90,'2026-06-09 16:19:09'),(199,199,0.35,3.75,NULL,NULL,NULL,0.43,4.67,-4.67,'2026-06-09 16:19:09'),(200,200,0.25,2.68,NULL,NULL,NULL,0.30,3.23,-3.23,'2026-06-09 16:19:09'),(201,201,0.17,1.82,NULL,NULL,NULL,0.19,2.01,-2.01,'2026-06-09 16:19:09'),(202,202,1.68,18.14,0.00,28000,0,2.12,22.86,-22.86,'2026-06-09 16:19:09'),(203,203,0.20,1.34,NULL,NULL,NULL,0.25,1.70,-1.70,'2026-06-09 16:19:09'),(204,204,0.19,1.31,NULL,NULL,NULL,0.25,1.66,7.29,'2026-06-09 16:19:09'),(205,205,19.82,237.86,1441.00,354000,207000,24.97,299.64,295.36,'2026-06-09 16:19:09'),(206,206,0.16,0.89,NULL,NULL,NULL,0.20,1.13,-1.13,'2026-06-09 16:19:09'),(207,207,0.13,0.71,NULL,NULL,NULL,0.16,0.90,-0.90,'2026-06-09 16:19:09'),(208,208,0.29,1.65,NULL,NULL,NULL,0.37,2.09,-2.09,'2026-06-09 16:19:09'),(209,209,0.08,0.47,NULL,NULL,NULL,0.11,0.60,-0.60,'2026-06-09 16:19:09'),(210,210,0.17,0.97,NULL,NULL,NULL,0.22,1.23,-1.23,'2026-06-09 16:19:09'),(211,211,0.15,0.84,NULL,NULL,NULL,0.19,1.07,-1.07,'2026-06-09 16:19:09'),(212,212,2.43,26.25,NULL,NULL,NULL,3.09,33.36,-15.36,'2026-06-09 16:19:09'),(213,213,0.19,1.05,NULL,NULL,NULL,0.24,1.33,-1.33,'2026-06-09 16:19:09'),(214,214,0.14,0.79,NULL,NULL,NULL,0.18,1.00,-1.00,'2026-06-09 16:19:09'),(215,215,3.77,44.47,161.00,62833,24737,4.75,51.30,-17.30,'2026-06-09 16:19:09'),(216,216,0.19,2.07,NULL,NULL,NULL,0.23,2.44,-2.44,'2026-06-09 16:19:09'),(217,217,0.25,2.71,NULL,NULL,NULL,0.30,3.27,-3.27,'2026-06-09 16:19:09'),(218,218,0.19,2.10,NULL,NULL,NULL,0.25,2.66,-2.66,'2026-06-09 16:19:09'),(219,219,0.30,3.21,NULL,NULL,NULL,0.38,4.15,-4.15,'2026-06-09 16:19:09'),(220,220,1.35,14.58,NULL,NULL,NULL,1.39,15.11,4.89,'2026-06-09 16:19:09'),(221,221,0.73,7.86,NULL,NULL,NULL,0.89,9.58,-9.58,'2026-06-09 16:19:09'),(222,222,0.29,3.08,NULL,NULL,NULL,0.36,3.84,-3.84,'2026-06-09 16:19:09'),(223,223,0.14,1.51,NULL,NULL,NULL,0.15,1.66,-1.66,'2026-06-09 16:19:09'),(224,224,0.34,3.62,NULL,NULL,NULL,0.40,4.30,-4.30,'2026-06-09 16:19:09'),(225,225,10.01,120.12,245.00,150300,41371,11.87,128.19,44.81,'2026-06-09 16:19:09'),(226,226,0.24,2.57,NULL,NULL,NULL,0.29,3.10,-3.10,'2026-06-09 16:19:09'),(227,227,0.14,1.46,NULL,NULL,NULL,0.18,1.89,-1.89,'2026-06-09 16:19:09'),(228,228,3.12,33.69,0.00,52000,0,3.93,42.46,-42.46,'2026-06-09 16:19:09'),(229,229,1.18,12.77,NULL,NULL,NULL,1.45,15.66,9.34,'2026-06-09 16:19:09'),(230,230,4.49,48.48,0.00,85000,0,5.42,58.49,-18.49,'2026-06-09 16:19:09'),(231,231,0.13,1.42,NULL,NULL,NULL,0.13,1.42,-1.42,'2026-06-09 16:19:09'),(232,232,0.29,3.16,NULL,NULL,NULL,0.34,3.67,1.33,'2026-06-09 16:19:09'),(233,233,0.27,3.03,NULL,NULL,NULL,0.35,3.74,1.26,'2026-06-09 16:19:09'),(234,234,0.14,1.56,NULL,NULL,NULL,0.18,1.93,-1.93,'2026-06-09 16:19:09'),(235,235,0.34,3.67,NULL,NULL,NULL,0.39,4.26,-4.26,'2026-06-09 16:19:09'),(236,236,0.24,2.56,NULL,NULL,NULL,0.30,3.25,-3.25,'2026-06-09 16:19:09'),(237,237,1.24,13.39,NULL,NULL,NULL,1.27,13.70,1.30,'2026-06-09 16:19:09'),(238,238,0.57,6.11,NULL,NULL,NULL,0.68,7.29,-7.29,'2026-06-09 16:19:09'),(239,239,1.51,16.31,NULL,NULL,NULL,1.65,17.82,22.18,'2026-06-09 16:19:09'),(240,240,0.50,5.40,NULL,NULL,NULL,0.54,5.91,4.09,'2026-06-09 16:19:09'),(241,241,0.17,1.86,NULL,NULL,NULL,0.19,2.09,-2.09,'2026-06-09 16:19:09'),(242,242,0.71,7.65,NULL,NULL,NULL,0.90,9.73,-9.73,'2026-06-09 16:19:09'),(243,243,0.27,1.49,NULL,NULL,NULL,0.34,1.89,-1.89,'2026-06-09 16:19:09'),(244,244,0.62,6.66,NULL,NULL,NULL,0.78,8.46,-8.46,'2026-06-09 16:19:09'),(245,245,0.79,8.50,NULL,NULL,NULL,1.00,10.79,-10.79,'2026-06-09 16:19:09'),(246,246,0.78,8.45,NULL,NULL,NULL,0.99,10.74,-10.74,'2026-06-09 16:19:09'),(247,247,0.27,1.51,NULL,NULL,NULL,0.34,1.92,-1.92,'2026-06-09 16:19:09'),(248,248,0.23,2.52,NULL,NULL,NULL,0.30,3.21,-3.21,'2026-06-09 16:19:09'),(249,249,0.18,0.99,NULL,NULL,NULL,0.22,1.26,-1.26,'2026-06-09 16:19:09'),(250,250,0.32,1.78,NULL,NULL,NULL,0.40,2.26,-2.26,'2026-06-09 16:19:09'),(251,251,2.25,24.32,NULL,NULL,NULL,2.86,30.90,-30.90,'2026-06-09 16:19:09'),(252,252,0.40,0.22,NULL,NULL,NULL,0.50,2.82,-2.82,'2026-06-09 16:19:09'),(253,253,0.22,2.78,NULL,NULL,NULL,NULL,NULL,0.00,'2026-06-09 16:19:09'),(254,254,1.33,14.36,NULL,NULL,NULL,NULL,NULL,17.00,'2026-06-09 16:19:09'),(255,255,1.79,19.32,NULL,NULL,NULL,2.33,25.22,-20.22,'2026-06-09 16:19:09'),(256,256,2.06,22.20,NULL,NULL,NULL,2.40,25.93,-10.93,'2026-06-09 16:19:09'),(257,257,20.63,247.50,1442.00,415000,156300,28.37,340.50,341.50,'2026-06-09 16:19:09');
/*!40000 ALTER TABLE `population_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rivers`
--

DROP TABLE IF EXISTS `rivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rivers` (
  `river_id` int NOT NULL AUTO_INCREMENT,
  `river_name` varchar(100) NOT NULL,
  PRIMARY KEY (`river_id`),
  UNIQUE KEY `river_name` (`river_name`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rivers`
--

LOCK TABLES `rivers` WRITE;
/*!40000 ALTER TABLE `rivers` DISABLE KEYS */;
INSERT INTO `rivers` VALUES (2,'Aligarh  Drain ( Irrigation )'),(270,'Assi'),(68,'Betwa'),(27,'DEVRANIYA'),(6,'Ganga'),(4,'Ghaghara'),(38,'Ghaghra'),(5,'Gomti'),(55,'Harnandi (Hindon)'),(40,'Ishan'),(143,'kaali Nadi'),(32,'Kali'),(208,'Kali West'),(90,'Karvan'),(20,'Ken'),(242,'Khannaut'),(179,'Kosi Arterial Channel'),(244,'Krishni'),(36,'Mandakini'),(240,'Morwa'),(7,'NA'),(28,'NAKTIA RIVER'),(109,'Pahunch'),(141,'Pandu'),(29,'Ram ganga'),(64,'Ramgarhtal'),(65,'Rapti'),(66,'Rohini'),(77,'Sai'),(145,'Sarayan'),(14,'Saryu'),(266,'Sone'),(3,'Tamsa'),(150,'ULL RIVER'),(241,'Varuna'),(1,'Yamuna');
/*!40000 ALTER TABLE `rivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `town_rivers`
--

DROP TABLE IF EXISTS `town_rivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `town_rivers` (
  `town_river_id` int NOT NULL AUTO_INCREMENT,
  `town_city_id` int NOT NULL,
  `river_id` int NOT NULL,
  PRIMARY KEY (`town_river_id`),
  UNIQUE KEY `town_city_id` (`town_city_id`,`river_id`),
  KEY `river_id` (`river_id`),
  CONSTRAINT `town_rivers_ibfk_1` FOREIGN KEY (`town_city_id`) REFERENCES `towns_cities` (`town_city_id`),
  CONSTRAINT `town_rivers_ibfk_2` FOREIGN KEY (`river_id`) REFERENCES `rivers` (`river_id`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `town_rivers`
--

LOCK TABLES `town_rivers` WRITE;
/*!40000 ALTER TABLE `town_rivers` DISABLE KEYS */;
INSERT INTO `town_rivers` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,7),(9,9,1),(10,10,7),(11,11,7),(12,12,7),(13,13,7),(14,14,14),(15,15,3),(16,16,1),(17,17,6),(18,18,7),(19,19,7),(20,20,20),(21,21,7),(22,22,7),(23,23,7),(24,24,7),(25,25,7),(26,26,5),(27,27,27),(28,27,28),(29,27,29),(30,28,6),(31,29,6),(32,30,32),(33,31,32),(34,32,6),(35,33,6),(36,34,36),(37,35,1),(38,36,38),(39,37,38),(40,38,40),(41,39,1),(42,40,1),(43,41,6),(44,42,6),(45,43,7),(46,44,7),(47,45,7),(48,46,7),(49,47,7),(50,48,7),(51,49,7),(52,50,7),(53,51,6),(54,52,1),(55,53,55),(56,54,55),(59,55,1),(58,55,32),(57,55,55),(60,56,6),(61,57,6),(62,58,6),(63,59,38),(64,60,64),(65,60,65),(66,60,66),(67,61,7),(69,62,1),(68,62,68),(70,63,7),(71,64,7),(72,65,7),(73,66,7),(74,67,7),(75,68,6),(76,69,32),(77,70,77),(78,71,77),(79,72,77),(80,73,77),(81,74,77),(82,75,77),(83,76,77),(84,77,77),(85,78,77),(86,79,77),(87,80,77),(88,81,77),(89,82,77),(90,83,90),(91,84,7),(92,85,7),(93,86,7),(94,87,1),(95,88,7),(96,89,7),(97,90,7),(98,91,7),(99,92,7),(100,93,7),(101,94,7),(102,95,5),(103,96,7),(104,97,7),(105,98,7),(106,99,7),(107,100,7),(108,101,7),(109,102,109),(110,103,7),(111,104,7),(112,105,7),(113,106,7),(114,107,7),(115,108,7),(116,109,7),(117,110,7),(118,111,6),(119,112,7),(120,113,7),(121,114,7),(122,115,7),(123,116,7),(124,117,7),(125,118,7),(126,119,7),(127,120,7),(128,121,7),(129,122,7),(130,123,7),(131,124,7),(132,125,7),(133,126,7),(134,127,7),(135,128,7),(136,129,7),(137,130,6),(138,131,6),(139,132,7),(140,133,6),(141,133,141),(142,134,7),(143,135,143),(144,136,6),(145,137,145),(146,138,145),(147,139,145),(148,140,145),(149,141,145),(150,141,150),(151,142,145),(152,143,145),(153,144,145),(154,145,145),(155,146,145),(156,147,145),(157,148,145),(158,149,145),(159,150,7),(160,151,7),(161,152,7),(162,153,5),(163,154,5),(164,155,5),(165,156,5),(166,157,5),(167,158,5),(168,158,77),(169,159,5),(170,160,5),(171,161,5),(172,162,5),(173,163,7),(174,164,7),(175,165,7),(176,166,7),(177,167,7),(178,168,40),(179,169,179),(180,170,1),(181,171,179),(182,172,1),(183,173,1),(184,174,4),(185,175,7),(186,176,7),(187,177,7),(188,178,7),(189,179,7),(190,180,55),(191,181,7),(192,182,7),(193,183,7),(194,184,32),(195,185,7),(196,186,7),(197,187,55),(198,188,7),(199,189,6),(200,190,6),(201,191,29),(202,192,7),(203,193,55),(204,194,7),(205,195,7),(206,196,7),(207,197,7),(208,198,208),(209,199,7),(210,200,7),(211,201,7),(212,202,5),(213,203,6),(214,204,77),(216,205,1),(215,205,6),(217,206,77),(218,207,6),(219,208,77),(220,209,77),(221,210,77),(222,211,77),(223,212,77),(224,213,77),(225,214,77),(226,215,29),(227,216,7),(228,217,7),(229,218,7),(230,219,7),(231,220,208),(232,221,7),(233,222,7),(234,223,32),(235,224,32),(236,225,55),(237,226,7),(238,227,7),(239,228,6),(240,229,240),(241,229,241),(242,230,242),(243,231,7),(244,232,244),(245,233,244),(246,234,7),(247,235,7),(248,236,7),(249,237,1),(250,238,7),(251,239,244),(252,240,244),(253,241,7),(254,242,145),(255,243,145),(256,244,145),(257,245,145),(258,246,145),(259,247,145),(260,248,5),(261,248,145),(262,249,145),(263,250,145),(264,251,145),(265,252,145),(266,253,266),(267,254,5),(268,255,6),(269,256,6),(271,257,6),(272,257,241),(270,257,270);
/*!40000 ALTER TABLE `town_rivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `towns_cities`
--

DROP TABLE IF EXISTS `towns_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `towns_cities` (
  `town_city_id` int NOT NULL AUTO_INCREMENT,
  `district_id` int NOT NULL,
  `town_city_name` varchar(150) NOT NULL,
  PRIMARY KEY (`town_city_id`),
  UNIQUE KEY `district_id` (`district_id`,`town_city_name`),
  CONSTRAINT `towns_cities_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `towns_cities`
--

LOCK TABLES `towns_cities` WRITE;
/*!40000 ALTER TABLE `towns_cities` DISABLE KEYS */;
INSERT INTO `towns_cities` VALUES (1,1,'Agra'),(2,2,'Aligarh'),(3,3,'AKBARPUR'),(4,3,'Tanda'),(5,4,'Gauriganj'),(6,5,'Amroha'),(7,6,'Achhalda'),(8,6,'Atasu'),(9,6,'Auraiya'),(10,6,'Babarpur Ajitmal'),(11,6,'Bidhuna'),(12,6,'Dibiyapur'),(13,6,'Phaphund'),(14,7,'Ayodhya'),(15,8,'Jahanganj Bazar'),(16,9,'Baghpat Town'),(17,10,'Ballia'),(18,11,'Atarra'),(19,11,'Baberu'),(20,11,'Banda'),(21,11,'Bisanda Buzurg'),(22,11,'Mataundh'),(23,11,'Naraini'),(24,11,'Oran'),(25,11,'Tindwari'),(26,12,'Nawabganj'),(27,13,'Bareilly'),(28,14,'Bijnor'),(29,15,'Anupshahr(NPP)'),(30,15,'BULANDSHAHR (NPP)'),(31,15,'Gulaothi'),(32,15,'Narora'),(33,16,'Mugalsarai'),(34,17,'Chitrakoot Manikpur Sarhat (NP)'),(35,17,'Rajapur (NP)'),(36,18,'Gaura Barhaj'),(37,18,'Lar'),(38,19,'etah'),(39,20,'Bakewar'),(40,20,'Etawah'),(41,21,'Farrukhabad cum Fatehgarh'),(42,21,'Fatehgarh'),(43,21,'Kaimganj'),(44,21,'Kamalganj'),(45,21,'Kampil'),(46,21,'Khimsepur'),(47,21,'Mohammadabad'),(48,21,'Nawabganj'),(49,21,'Sankisa Basantpur'),(50,21,'Shamsabad'),(51,22,'Fatehpur (NPP)'),(52,23,'Firozabad'),(53,24,'Greater Noida'),(54,24,'Noida'),(55,25,'Ghaziabad'),(56,26,'Ghazipur'),(57,26,'Saidpur'),(58,26,'Zamania'),(59,27,'Barhalganj'),(60,27,'Gorakhpur'),(61,28,'Gohand'),(62,28,'Hamirpur'),(63,28,'Kurara'),(64,28,'Maudaha'),(65,28,'Rath'),(66,28,'Sarila'),(67,28,'Sumerpur'),(68,29,'Garmukteshwar'),(69,29,'Hapur'),(70,30,'Beniganj'),(71,30,'Bilgram'),(72,30,'Gopamau'),(73,30,'Hardoi'),(74,30,'Kachauna Patsaini'),(75,30,'Kursath'),(76,30,'Madhoganj'),(77,30,'Mallawan'),(78,30,'Pali'),(79,30,'Pihani'),(80,30,'Sandi'),(81,30,'Sandila'),(82,30,'Shahabad'),(83,31,'Hathras'),(84,32,'Ait'),(85,32,'Jalaun - NPP'),(86,32,'Kadaura'),(87,32,'Kalpi'),(88,32,'Konch'),(89,32,'Kotra'),(90,32,'Madhogarh'),(91,32,'Nadigaon'),(92,32,'Orai'),(93,32,'Rampura'),(94,32,'Umri'),(95,33,'Jaunpur'),(96,34,'Badagaon'),(97,34,'Barua Sagar'),(98,34,'Chirgaon'),(99,34,'Erich'),(100,34,'Garautha'),(101,34,'Gursarai'),(102,34,'Jhansi'),(103,34,'Kathera'),(104,34,'Mauranipur'),(105,34,'Moth'),(106,34,'Ranipur'),(107,34,'Samthar'),(108,34,'Todi Fatehpur'),(109,35,'Chhibramau'),(110,35,'Gursahaiganj'),(111,35,'Kannauj'),(112,35,'Samdhan'),(113,35,'Saurikh'),(114,35,'Sikandarpur'),(115,35,'Talgram'),(116,35,'Tirwaganj'),(117,36,'Akbarpur'),(118,36,'Amraudha'),(119,36,'Derapur'),(120,36,'Jhinjhak'),(121,36,'Kanchausi'),(122,36,'Musa Nagar'),(123,36,'Pukharayan'),(124,36,'Rajpur'),(125,36,'Raniya'),(126,36,'Rasulabad'),(127,36,'Rura'),(128,36,'Shivli'),(129,36,'Sikandra'),(130,37,'Bilhaur'),(131,37,'Bithoor'),(132,37,'Ghatampur'),(133,37,'Kanpur Nagar'),(134,37,'Shivrajpur'),(135,38,'Kasganj'),(136,39,'Daranagar'),(137,40,'Barbar'),(138,40,'Bhira'),(139,40,'Dhaurahara'),(140,40,'Gola'),(141,40,'Gola Gokaran Nath'),(142,40,'Kheri'),(143,40,'Lakhimpur'),(144,40,'Mailani'),(145,40,'Mohammadi'),(146,40,'Nighasan'),(147,40,'Oel Dhakhwa'),(148,40,'Palia'),(149,40,'Singahi Bhedaura'),(150,41,'Mehroni'),(151,41,'Pali'),(152,41,'Talbehat'),(153,42,'Amethi'),(154,42,'Bakshi Ka Talab'),(155,42,'Gosaiganj'),(156,42,'Intaunja'),(157,42,'Kakori'),(158,42,'Lucknow'),(159,42,'Mahona'),(160,42,'Malihabad'),(161,42,'Mohanlalganj'),(162,42,'Nagram'),(163,43,'Charkhari'),(164,43,'Kabrai'),(165,43,'Kharela'),(166,43,'Kulpahad'),(167,43,'Mahoba'),(168,44,'Chhata'),(169,45,'Chhata'),(170,45,'Govardhan'),(171,45,'Kosi Kalan'),(172,45,'Mathura'),(173,45,'Vrindavan'),(174,46,'Dohrighat'),(175,47,'Bahsuma'),(176,47,'Daurala'),(177,47,'Hastinapur'),(178,47,'Karnawal'),(179,47,'Kharkhoda'),(180,47,'Kinauni'),(181,47,'Kithaur'),(182,47,'Lawar'),(183,47,'Mawana'),(184,47,'Meerut'),(185,47,'Parikshitgarh'),(186,47,'Phalauda'),(187,47,'Sardhana'),(188,47,'Sewal Khas'),(189,48,'Chunar'),(190,48,'Mirzapur'),(191,49,'Moradabad'),(192,50,'Bhokarrhedi'),(193,50,'Budhana'),(194,50,'Charthawal'),(195,50,'Jansath'),(196,50,'Khatauli'),(197,50,'Mirapur'),(198,50,'Muzaffarnagar'),(199,50,'Purquazi'),(200,50,'Shahpur'),(201,50,'Sisauli'),(202,51,'Pilibhit'),(203,52,'Manikpur'),(204,52,'Pratapgarh City (NP)'),(205,53,'Prayagraj (M. Corp)'),(206,54,'Bachhrawan'),(207,54,'Dalmau'),(208,54,'Lalganj'),(209,54,'Maharajganj'),(210,54,'Naserabad'),(211,54,'Parsadepur'),(212,54,'Rae Bareli'),(213,54,'Salon'),(214,54,'Unchahar'),(215,55,'Rampur'),(216,56,'Ambehta'),(217,56,'Behat'),(218,56,'Chhutmalpur'),(219,56,'Chilkana Sultanpur'),(220,56,'Deoband'),(221,56,'Gangoh'),(222,56,'Nakur'),(223,56,'Nanauta'),(224,56,'Rampur Maniharan'),(225,56,'Saharanpur'),(226,56,'Sarsawan'),(227,56,'Titron'),(228,57,'Sambhal'),(229,58,'Bhadohi'),(230,59,'SHAHJAHANPUR (NPP)'),(231,60,'Ailum'),(232,60,'Banat'),(233,60,'Bantikhera & Babri'),(234,60,'Gadhi Pukta'),(235,60,'Jalalabad'),(236,60,'Jhinjhana'),(237,60,'Kairana'),(238,60,'Kandhla'),(239,60,'Shamli'),(240,60,'Thanabhawan'),(241,60,'Unn'),(242,61,'Biswan'),(243,61,'Hargaon'),(244,61,'Khairabad'),(245,61,'Laharpur'),(246,61,'Mahmodabad'),(247,61,'Maholi'),(248,61,'Mishrikh Namisharanay'),(249,61,'Paintepur'),(250,61,'Sidhauli'),(251,61,'Sitapur'),(252,61,'Tambor Ahamdabad'),(253,62,'Chopan'),(254,63,'Sultanpur'),(255,64,'Shuklaganj NPP'),(256,64,'Unnao NPP'),(257,65,'Varanasi');
/*!40000 ALTER TABLE `towns_cities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:02
CREATE DATABASE  IF NOT EXISTS `audit_weekly_progress_of_namami_gange_ongoingprojects` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `audit_weekly_progress_of_namami_gange_ongoingprojects`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: audit_weekly_progress_of_namami_gange_ongoingprojects
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
-- Table structure for table `audit_agencies`
--

DROP TABLE IF EXISTS `audit_agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_agencies` (
  `audit_agency_id` int NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`audit_agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_agencies`
--

LOCK TABLES `audit_agencies` WRITE;
/*!40000 ALTER TABLE `audit_agencies` DISABLE KEYS */;
INSERT INTO `audit_agencies` VALUES (1,'M/s 21st Century Enviro Engineers Pvt. Ltd. -M/s Sattva Engineering Const. Ltd. JV'),(2,'M/s Aastha Enviro Engineers Pvt Ltd'),(3,'M/s AWWMPL  Pvt Ltd'),(4,'M/s EIEL Mathura Infra Engineers Private Limited'),(5,'M/s Enviro Infra Engineers Ltd, Bhugan Infracon Pvt. Ltd. & Micro Transmission System, JV'),(6,'M/s HNB Private ltd. - M/s Tirupati Cements Products (JV)'),(7,'M/s JWIL-SSG (Joint Venture)'),(8,'M/s Neercare India pvt KLtd JV M/s EMIT Group India Pvt Ltd JV EMS Ltd'),(9,'M/s R K Engineers Sales Ltd'),(10,'M/s R.K. Engineers Sales Ltd.-M/s Anand Constrwell Pvt. Ldt. (JV)'),(11,'M/s R.K. Engineers- Khilari Infrastructure (JV)'),(12,'M/s Shailesh Kumar J.V.'),(13,'M/s SIMA -G D- N.P. (JV)'),(14,'M/s SKC Technocrat Pvt. Ltd (Formerly M/s Satish Kumar & Co.) & M/s Malvika Technical Services (JV)'),(15,'M/s SKC Technocrat Pvt. Ltd (Formerly M/s Satish Kumar & Co.) & M/s. Geo Miller & Co. Pvt. Ltd. (JV)'),(16,'M/s Technocraft Ventures Limited'),(17,'M/s Triveni Engineering and Industries'),(18,'M/s. Meerut STP Pvt. Ltd.');
/*!40000 ALTER TABLE `audit_agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_cities`
--

DROP TABLE IF EXISTS `audit_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_cities` (
  `audit_city_id` int NOT NULL AUTO_INCREMENT,
  `audit_district_id` int NOT NULL,
  `city_name` varchar(255) NOT NULL,
  PRIMARY KEY (`audit_city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_cities`
--

LOCK TABLES `audit_cities` WRITE;
/*!40000 ALTER TABLE `audit_cities` DISABLE KEYS */;
INSERT INTO `audit_cities` VALUES (1,1,'Agra'),(2,7,'Chhata'),(3,7,'Kosi Kalan'),(4,7,'Mathura'),(5,7,'Vrindavan'),(6,13,'Banat'),(7,13,'Bantikhera Banat'),(8,13,'Shamli'),(9,13,'Thanabhawan'),(10,12,'Saharanpur'),(11,3,'Hapur'),(12,4,'Hathras'),(13,8,'Meerut'),(14,10,'Prayagraj'),(15,6,'Lucknow');
/*!40000 ALTER TABLE `audit_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_districts`
--

DROP TABLE IF EXISTS `audit_districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_districts` (
  `audit_district_id` int NOT NULL AUTO_INCREMENT,
  `district_name` varchar(255) NOT NULL,
  PRIMARY KEY (`audit_district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_districts`
--

LOCK TABLES `audit_districts` WRITE;
/*!40000 ALTER TABLE `audit_districts` DISABLE KEYS */;
INSERT INTO `audit_districts` VALUES (1,'Agra'),(2,'Bulandshahr'),(3,'Hapur'),(4,'Hathras'),(5,'Kanpur Nagar'),(6,'Lucknow'),(7,'Mathura'),(8,'Meerut'),(9,'Pratapgarh'),(10,'PrayagRaj'),(11,'Rae Bareli'),(12,'Saharanpur'),(13,'Shamli');
/*!40000 ALTER TABLE `audit_districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_project_components`
--

DROP TABLE IF EXISTS `audit_project_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_project_components` (
  `audit_component_id` int NOT NULL AUTO_INCREMENT,
  `audit_project_id` int DEFAULT NULL,
  `work_component` varchar(500) DEFAULT NULL,
  `component_count` int DEFAULT NULL,
  `capacity_length_no` varchar(100) DEFAULT NULL,
  `physical_progress` decimal(10,2) DEFAULT NULL,
  `photos` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`audit_component_id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_project_components`
--

LOCK TABLES `audit_project_components` WRITE;
/*!40000 ALTER TABLE `audit_project_components` DISABLE KEYS */;
INSERT INTO `audit_project_components` VALUES (1,1,'Effluent Disposal Line (km.)',2,'2.01',92.50,'12'),(2,1,'Intercepting Sewer (km)',3,'1.94',82.00,'4'),(3,1,'Interception And Diversion',1,'22.00',0.00,'0'),(4,1,'MPS (MLD)',3,'373.50',82.67,'45'),(5,1,'Rising main (mtr.)',3,'8970.00',76.67,'26'),(6,1,'STP (MLD)',13,'177.60',26.25,'88'),(7,2,'Interception And Diversion',1,'40.00',0.00,'0'),(8,3,'Ancilliary works(Admin building,staff quarter ,roa',1,'1.00',22.30,'4'),(9,3,'I/C Sewer line (Mtr.)',1,'2170.00',27.00,'0'),(10,3,'Interception And Diversion',1,'11.00',0.00,'0'),(11,3,'MPS (MLD)',1,'6.00',40.00,'14'),(12,3,'Rising Main (Meter)',1,'5500.00',0.00,'0'),(13,3,'STP (MLD)',1,'6.00',15.50,'8'),(14,4,'FSTP(KLD)',1,'8.00',3.90,'4'),(15,5,'Admin Building',1,'1.00',0.00,'0'),(16,5,'Boundary wall, staff quarter',1,'1.00',0.00,'0'),(17,5,'Cesspool Vehicle',1,'3.00',0.00,'0'),(18,5,'FSTP(KLD)',1,'15.00',28.00,'4'),(19,5,'Solar Power (kw)',1,'35.00',0.00,'0'),(20,6,'Boundary wall',1,'286.00',10.00,'0'),(21,6,'Interception And Diversion',1,'1.00',0.00,'0'),(22,6,'MPS (MLD)',1,'15.00',0.00,'0'),(23,6,'Others',1,'1.00',0.00,'0'),(24,6,'STP (MLD)',1,'10.00',3.00,'0'),(25,7,'Ancilliary works(Admin building,staff quarter ,roa',1,'1.00',96.00,'11'),(26,7,'Interception And Diversion',1,'2.00',97.00,'0'),(27,7,'MPS (MLD)',1,'6.00',88.00,'8'),(28,7,'Online Monitoring/LCS/MCS for proposed STPs and Ex',1,'1.00',0.00,'0'),(29,7,'Rising main (mtr.)',1,'3700.00',99.00,'0'),(30,7,'STP (MLD)',1,'13.00',98.00,'33'),(31,7,'Treated water sump and associated works',1,'1.00',99.00,'0'),(32,7,'Upgradation of MPS',1,'1.00',62.00,'0'),(33,8,'Co-treatment Unit for Fecal Sludge (KLD)',1,'5.00',3.00,'0'),(34,8,'Effluent Disposal Line (km.)',1,'0.60',65.00,'0'),(35,8,'Interception And Diversion',1,'2.00',55.00,'0'),(36,8,'MPS (MLD)',1,'6.00',85.90,'8'),(37,8,'Power Connection',1,'1.00',0.00,'0'),(38,8,'Rising main (mtr.)',1,'50.00',0.00,'0'),(39,8,'Sewer Line (km.)',1,'0.60',65.00,'0'),(40,8,'STP (MLD)',1,'5.00',61.20,'24'),(41,9,'Co-treatment Unit for Fecal Sludge (KLD)',1,'5.00',3.00,'0'),(42,9,'Effluent Disposal Line (km.)',1,'0.40',0.00,'0'),(43,9,'Interception And Diversion',1,'4.00',0.00,'0'),(44,9,'MPS (MLD)',1,'6.00',0.00,'0'),(45,9,'Power Connection',1,'1.00',0.00,'0'),(46,9,'Rising main (mtr.)',1,'50.00',0.00,'0'),(47,9,'Sewer Line (km.)',1,'2.00',0.00,'0'),(48,9,'STP (MLD)',1,'5.00',24.00,'13'),(49,10,'MPS (MLD)',1,'28.00',0.00,'0'),(50,10,'Power Connection',1,'1.00',0.00,'0'),(51,10,'Rising main (mtr.)',1,'50.00',0.00,'0'),(52,10,'Sewer Line (km.)',1,'3.83',0.00,'0'),(53,10,'STP (MLD)',1,'20.00',0.00,'4'),(54,11,'Co-treatment Unit for Fecal Sludge (KLD)',1,'20.00',3.00,'0'),(55,11,'Effluent Disposal Line (km.)',1,'0.10',0.00,'0'),(56,11,'Interception And Diversion',1,'1.00',95.00,'9'),(57,11,'MPS (MLD)',1,'48.00',60.90,'8'),(58,11,'Power Connection',1,'1.00',0.00,'0'),(59,11,'Rising main (mtr.)',1,'100.00',0.00,'7'),(60,11,'Sewer Line (km.)',1,'0.10',0.00,'0'),(61,11,'STP (MLD)',1,'40.00',68.92,'21'),(62,12,'Co-treatment Unit for Fecal Sludge (KLD)',1,'10.00',3.00,'0'),(63,12,'Interception And Diversion',1,'3.00',35.00,'4'),(64,12,'MPS (MLD)',1,'13.00',44.70,'4'),(65,12,'Power Connection',1,'1.00',0.00,'0'),(66,12,'Rising main (mtr.)',1,'60.00',0.00,'0'),(67,12,'Sewer Line (km.)',1,'5.60',7.00,'0'),(68,12,'STP (MLD)',1,'10.00',54.90,'18'),(69,13,'Drains',1,'1.00',5.00,'0'),(70,13,'MPS (MLD)',1,'8.00',60.00,'12'),(71,13,'Others',1,'1.00',30.00,'8'),(72,13,'STP (MLD)',1,'6.00',50.00,'12'),(73,14,'Admin Building',1,'1.00',45.00,'4'),(74,14,'Boundary wall (mtr.)',1,'800.00',0.00,'0'),(75,14,'Intercepting Sewer (km)',1,'5.67',33.10,'4'),(76,14,'MPS (MLD)',1,'54.00',77.00,'8'),(77,14,'Nala Tapping Arrangement ( No.)',1,'8.00',0.00,'0'),(78,14,'Rising main (mtr.)',1,'0.13',36.50,'0'),(79,14,'Staff Quarter type 2',1,'1.00',0.00,'0'),(80,14,'STP (MLD)',1,'24.00',72.00,'16'),(81,15,'Ancilliary works(Admin building,staff quarter ,roa',1,'1.00',31.05,'7'),(82,15,'Intercepting Sewer (km)',1,'0.03',0.00,'0'),(83,15,'MPS (MLD)',1,'12.00',37.05,'4'),(84,15,'Nala Tapping Arrangement ( No.)',1,'1.00',0.00,'0'),(85,15,'Rising main (mtr.)',1,'100.00',0.00,'0'),(86,15,'STP (MLD)',1,'12.00',51.95,'16'),(87,16,'Interception And Diversion',1,'2.00',50.70,'0'),(88,16,'MPS',1,'1.00',80.60,'6'),(89,16,'Power Connection',1,'1.00',0.00,'0'),(90,16,'Rising main (mtr.)',1,'100.00',0.00,'0'),(91,16,'Sewer Line (km.)',1,'5.60',10.00,'0'),(92,16,'STP (MLD)',1,'220.00',55.70,'47'),(93,17,'Effluent Disposal Line (km.)',1,'0.10',4.00,'0'),(94,17,'Interception And Diversion',1,'61.00',4.00,'0'),(95,17,'MPS (MLD)',1,'172.30',4.00,'0'),(96,17,'Power Connection',1,'1.00',4.00,'0'),(97,17,'Rising main (mtr.)',1,'50.00',4.00,'0'),(98,17,'Sewer Line (km.)',1,'16.00',4.00,'4'),(99,17,'STP (MLD)',1,'135.00',33.60,'0'),(100,18,'Construction of SPS and Lift Station (Nos)',1,'7.00',0.00,'0'),(101,18,'Interception and Diversion Work of Drains (Nos)',1,'14.00',0.00,'0'),(102,18,'Laying of Diversion Sewer (meter)',1,'2515.00',0.00,'0'),(103,18,'Laying of Rising main (meter)',1,'11253.00',6.56,'0'),(104,18,'Miscellaneous Works',1,'1.00',0.00,'0'),(105,19,'Effluent Disposal Line (km.)',1,'0.30',85.00,'16'),(106,19,'Effluent Pumping Station (MLD)',1,'43.00',100.00,'28'),(107,19,'Interception And Diversion',1,'13.00',70.00,'8'),(108,19,'IPS (MLD)',1,'2.20',68.00,'21'),(109,19,'MPS (MLD)',1,'32.00',72.00,'16'),(110,19,'Rehabilitation of Sewer Line',1,'3.30',0.00,'0'),(111,19,'Rising main (mtr.)',1,'4070.00',94.00,'20'),(112,19,'Sewer Line (km.)',1,'2.16',94.00,'8'),(113,19,'STP (MLD)',1,'43.00',99.00,'105'),(114,20,'Effluent Disposal Line (km.)',1,'0.30',73.00,'8'),(115,20,'Effluent Pumping Station (MLD)',1,'90.00',73.00,'4'),(116,20,'Interception And Diversion',1,'7.00',80.00,'42'),(117,20,'MPS (MLD)',2,'95.00',71.50,'103'),(118,20,'Rehabilitation of Bund and Bund Road',1,'1.00',37.00,'0'),(119,20,'Rising main (mtr.)',1,'3450.00',88.00,'9'),(120,20,'Sewer Line (km.)',1,'4.20',88.00,'23'),(121,20,'STP (MLD)',1,'90.00',81.00,'114'),(122,21,'Co-treatment Unit for Fecal Sludge (KLD)',1,'20.00',0.00,'0'),(123,21,'Interception And Diversion',1,'2.00',84.00,'24'),(124,21,'IPS (MLD)',1,'2.90',67.50,'85'),(125,21,'Rising main (mtr.)',1,'100.00',25.00,'0'),(126,21,'Sewer Line (km.)',1,'0.06',86.00,'0'),(127,21,'STP (MLD)',1,'50.00',68.00,'211'),(128,22,'I/C Sewer line (Mtr.)',1,'1970.00',97.06,'4'),(129,22,'Interception And Diversion',1,'4.00',68.15,'4'),(130,22,'IPS (MLD)',2,'47.00',69.13,'13'),(131,22,'MPS (MLD)',1,'60.00',100.00,'8'),(132,22,'Rising main (mtr.)',1,'9290.00',97.44,'8'),(133,22,'STP (MLD)',1,'60.00',81.84,'14'),(134,23,'Interception And Diversion',1,'1.00',3.00,'0'),(135,23,'MPS',1,'3.50',46.50,'0'),(136,23,'STP (MLD)',2,'42.50',87.85,'59'),(137,23,'Uppgradation of SPS',3,'3.00',100.00,'0'),(138,24,'Interception And Diversion',1,'3.00',14.58,'0'),(139,24,'Rising main (mtr.)',1,'3500.00',57.12,'0'),(140,24,'SPS (MLD)',1,'22.60',3.69,'0'),(141,24,'STP (MLD)',1,'50.00',22.57,'41');
/*!40000 ALTER TABLE `audit_project_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_sewerage_projects`
--

DROP TABLE IF EXISTS `audit_sewerage_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_sewerage_projects` (
  `audit_project_id` int NOT NULL AUTO_INCREMENT,
  `sr_no` int DEFAULT NULL,
  `audit_district_id` int DEFAULT NULL,
  `audit_city_id` int DEFAULT NULL,
  `audit_agency_id` int DEFAULT NULL,
  `project_name` varchar(1000) DEFAULT NULL,
  `scheme_type` varchar(100) DEFAULT NULL,
  `project_mode` varchar(100) DEFAULT NULL,
  `sanction_date` date DEFAULT NULL,
  `sanction_cost` decimal(15,2) DEFAULT NULL,
  `work_cost` decimal(15,2) DEFAULT NULL,
  `centage` decimal(15,2) DEFAULT NULL,
  `om_cost` decimal(15,2) DEFAULT NULL,
  `stp_count` int DEFAULT NULL,
  `stp_capacity` decimal(15,2) DEFAULT NULL,
  `drain_count` int DEFAULT NULL,
  `agreement_cost` decimal(15,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `agreement_completion_date` date DEFAULT NULL,
  `revised_date` varchar(255) DEFAULT NULL,
  `physical_progress` varchar(100) DEFAULT NULL,
  `financial_progress` varchar(100) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `remarks` longtext,
  `reason_for_delay` longtext,
  `action_taken` longtext,
  `tentative_inauguration_date` date DEFAULT NULL,
  `tentative_zero_discharge_date` date DEFAULT NULL,
  `scrape_time` timestamp NULL DEFAULT NULL,
  `audit_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`audit_project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_sewerage_projects`
--

LOCK TABLES `audit_sewerage_projects` WRITE;
/*!40000 ALTER TABLE `audit_sewerage_projects` DISABLE KEYS */;
INSERT INTO `audit_sewerage_projects` VALUES (1,1,1,1,3,'Agra Sewerage Scheme( Interception & diversion and STP works)','NGP2-EAP','HAM','2020-05-06',842.25,371.29,25.40,445.56,13,177.60,26,582.84,'2023-04-05','2025-04-04','04-Apr-2025 31-Dec-2025','+0.00 83.01','+0.00 336.24','2026-06-08','Component wise progress of Agra (HAM) 100 MLD STP- 68%, WIP 35 MLD STP- 76.2, WIP 31 MLD STP- 76.48%, WIP MPS 03 Nos.- 73%, WIP Rising Main 9.55 Km- 55%%, WIP Gravity Sewer 2.55 Km- 80%, WIP DSTP 10 Nos.- 5%, WIP Note- 1st Stage permission is granted for 07 Nos. DSTP Forest Land and 2nd stage permission is under process As per pervious meeting discussion, In order to complete the remaining works of 31 MLD and 35 MLD STP and make them operational as per the prescribed timeline, Direction  has been given to firm to complete the works as early as possible by increasing manpower. As per pervious meeting discussion, In order to 07 Nos. DSTP forest clearance , Land Gazette notification meeting has been conducted on 02.05.2025 and soon gazette notification will be published and after that stage 2 permission will be applied','NOC of land for 7 Nos DSTP, Road cutting permission for laying of rising main ,','1st Stage Permission was granted from forest department and 2nd stage permission is under process. A request was made by District Magistrate proposal sent to Revenue  department UP Lucknow for 1 No. DSTP Indira Memorial.  In current laying of rising main and intercepting sewer line permission was granted by district administration and work is under progress. MPS Nagla Buri public hindrance was resolved work is under progress.','2026-11-01','2026-09-01','2026-06-16 07:39:04','2026-06-16 07:39:09'),(2,2,1,NULL,NULL,'Balance Darins Tapping and Augmentation of SPSs at Agra City','NGP','DBOT','2025-06-11',126.41,86.37,6.90,34.01,0,0.00,0,66.86,'2026-04-02','2027-10-01','','+0.00 0.00','+0.00 0.00',NULL,'','','','2027-11-01','2027-10-31','2026-06-16 07:39:04','2026-06-16 07:39:09'),(3,3,7,2,12,'Chhata Town Sewerage Scheme (I&D and STP works), District Mathura','NGP','DBOT','2022-10-25',56.15,34.52,2.23,19.40,1,6.00,14,48.97,'2024-11-12','2026-08-11','','+0.32 17.58','+0.00 2.69','2026-06-08','STP site is flooded due to overflow from Bahrauli branch drain, (situated near to the site) from 1 month. The current water level at STP site is higher to the HFL, provided by irrigation department. At this situation all works are heavily affected. Not only in present this kind of situation during monsoon will affect the operation and maintenance services in later too.\n            Due to the current scenario of site, we have sent a letter to SDM, Chhata, requesting a new land for \n           construction of STP in this project with all requisite details of the scenario of original project site. Construction of HTS and staff quarter building is in progress at MPS. Project is slightly delayed due to problem of water logging at STP Site as PWD, Mathura was constructing a culvert on Kosi Drain and due to diversion of drain the water of kosi drain got obstructed. The STP site is located near to the branch drain of kosi drain at upstream side which got over flowed and leading to water logging at STP Site.This hindrance cleared in march 2025 after that work was resumed. Date of Start 12.11.2024 has been given to the firm. Survey and soil investigation has completed by firm. BEP of STP has been approved. Boundary wall construction work is going on at site.','Project is slightly delayed due to problem of water logging at STP Site as PWD, Mathura was constructing a culvert on Kosi Drain and due to diversion of drain the water of kosi drain got obstructed. The STP site is located near to the branch drain of kosi drain at upstream side which got over flowed and leading to water logging at STP Site.','Communication has been done to PWD and Irrigation Department for the problem of water logging at site. Additionally firm has been instructed to take preventive measures and initiate the work. Now the Piling and associated work has been commenced at site for SBR basin.','2026-08-12','2026-08-12','2026-06-16 07:39:04','2026-06-16 07:39:09'),(4,4,11,NULL,2,'DPR OF 08 KLD Fecal Sludge Treatment Plant At Dalmau Raibareli','NMCG','DBOT','2024-08-28',4.40,3.01,0.18,1.21,0,0.00,0,3.00,'2026-02-06','2026-11-05','','+0.15 3.90','+0.00 0.00','2026-06-09','Technical Bid open on dt. 22.08.2025. LOA issued to Firm M/s Aastha Enviro Engineers Pvt. Ltd. on dt. 30.12.2025. NOC received from NMCG  of FBER on dt. 19.12.2025 TBER sent to NMCG for review and approval. NOC received from NMCG on dt. 03.10.2025. Financial bid open on dt. 10.10.2025. Financial Evaluation work is in progress. FBER sent to NMCG for review and approval on dt. 01.12.2025. Date of start  given to Firm M/s Aastha Enviro Engineers Pvt. Ltd. on dt. 06.02.2026. Bid Document uploaded at e-tender portal on dt. 27.06.2025. Pre-bid Meeting dt. 04.07.2025 at 12:00 PM. Pre-bid reply sent to NMCG for review and approval on dt. 07.07.2025. Soil testing and Survey completed. Design & Drawing work is in progress. Boundary wall work is in progress. NMCG sent final pre-bid replies on dt. 05.08.2025. Final pre-bid replies uploaded on e-tender portal on dt. 07.08.2025 Bid Submission date 22.08.2025.','','','2026-12-05','2026-12-05','2026-06-16 07:39:04','2026-06-16 07:39:09'),(5,5,9,NULL,2,'Faecal Sludge Management for Pollution abatement of river Ganga at Manikpur, Pratapgarh','Non EAP','DBOT','2025-01-22',8.56,5.73,0.19,1.90,0,0.00,0,4.62,'2026-02-05','2026-11-04','','+16.00 28.00','+0.00 0.00','2026-06-08','NMCG New Delhi has given approval for issuance of LOA to the L1 Firm  M/s Aastha LOA has been issued to firm on dated 23.12.2025 Date of start has been issued to firm on dated 04.02.2026. Date of start 05.02.2026 and Date of Completion 04.11.2026 Soil test has been done, Survey and site cleaning work is under progress. Construction of Boundary wall is under progress. Excavation and PCC work is under progress for various unit. Vetting of BEP, Design & Drawing is completed. Construction of staff quarter, admin building cum lab are under progress.','','','2026-11-04','2026-11-04','2026-06-16 07:39:04','2026-06-16 07:39:09'),(6,6,2,NULL,14,'Gulaothi I&D works','NMCG','DBOT','2024-08-28',50.98,17.13,1.37,13.20,1,10.00,1,51.19,'2025-12-01','2027-05-31','','+0.00 9.00','+0.00 2.09','2026-06-09','AA&ES issued on Dt 28.08.2024 NIT issued by SE, Meerut vide letter no. 257/731/15 Dt 08.11.2024 LOA & Date of start is given on 26.11.2025.  Date of  start is 01.12.2025 & Date of completion of work is 31.05.2027 issued to M/s SKC Technocrat Private Limited- M/s Malvika Technical Services (JV), B-29, RDC, Raj Nagar, Ghaziabad- 201002 Soil Testing Complete. Boundary Wall work is in progress. BEP submitted by the firm on Dated 03.02.2026. Some Observation were found in the examination of BEP, after which BEP was returned to the firm on 08.02.2026. The land purchase proposal has been Sanctioned and GO issued. The funds Released to ULB Gulaothi. Land Registry work is completed. ULB handed over the land to U.P. Jal Nigam for work on Dated 20.12.2025. Mobilization Amount of Rs. 1.04 Crore claimed by firm. Revised BEP submitted by the firm.  BEP send to IIT BHU for vetting After checking it.','','-','2027-05-31','2027-05-31','2026-06-16 07:39:04','2026-06-16 07:39:09'),(7,7,7,5,13,'I&D and 13 MLD STP works at Vrindavan City','NGP','DBOT','2022-10-25',77.70,39.90,2.56,35.24,1,13.00,2,65.86,'2024-06-11','2026-03-10','','+0.05 92.93','+0.00 35.24','2026-06-08','Kalideh MPS rising main works has been done. STP site is water logged from 10.08.2025, work is affected due to this STP site had been water logged from 10.08.2025 to 18.09.2025, due to the high flood of Yamuna. After receding of water construction work is in progress along with corrective works due to the damage by flood at site. Work is going in SBR basin,  CCT, Admin building, Pannel room, SHU and in MPS  units. LOA issued to firm on dated 15.03.2024. Effective Date of start for the work is 11.06.2024.Work is in progress.','Initially preliminary work at Site got hindered due to start of monsoon just after the date of start of the project. Firm has started the work after the monsoon  and currently the work is being going on almost on all fronts by the firm. The progress is being regularly expedited by firm to complete the work on scheduled date.','-','2026-03-11','2026-03-11','2026-06-16 07:39:04','2026-06-16 07:39:09'),(8,8,13,6,9,'I&D and STP Work in Banat, Shamli','NGP','DBOT','2023-05-25',48.71,24.93,1.58,22.20,1,5.00,3,37.92,'2024-10-14','2026-04-13','','+0.05 73.20','+0.00 14.70','2026-06-08','Contract Agreement is signed on 08.10.2024 and Date of Start 14-10-2024 & Date of Completion 13-01-2026 Survey and Soil investigation work completed BEP, Layout and HFD approved for 05 MLD STP. Gate Schedule approved GAD, Structural design and drawing of CCT with Tonner Room & HT Substation approved GAD, Structural Design and Dwg. for SBR and Boundary wall approved. Approach Road and boundary wall work in progress GAD for Sludge Handling Unit Submitted, which are clear for Vetting & Structural Design. Project is 4 months behind schedule. Delay in design/drawing submission by Contractor. Contractor need to increase expedite the progress of work and submission of design/drawings. GAD, Structural Design and Dwg. for SHU approved GAD, Structural design and drawing of I&D Structure approved GAD and Data Sheet of Diffuser and decanter approved BEP, P&ID of MPS approved GAD, Structural design and drawing of PTU Structure approved GAD, Structural design and drawing of CCT, HT Substation Building and MPS which are clear for Vetting. Structural Design and Dwg. for MPS approved Data Sheet, QAP, Curves etc. of Turbo Blower, Centrifuge approved','Firm delayed submission of Design and drawing','Liquidity Damage (L.D.) imposed on firm for delay.','2026-04-24','2026-04-14','2026-06-16 07:39:04','2026-06-16 07:39:09'),(9,9,13,7,9,'I&D and STP Work in Bantikhera and Babri village, Shamli','NGP','DBOT','2023-05-25',55.47,29.41,1.84,24.22,1,5.00,1,41.91,'2024-10-14','2026-04-13','','+0.05 15.55','+0.00 3.62','2026-06-08','GAD of SBR is Clear for Vetting and Structural design Date Sheet, QAP, Curves etc. of Turbo Blower, Centrifuge approved Gate Schedule approved GAD, Structural design & Dwg. of PTU approved Contract Agreement is signed on 08.10.2024 and Date of Start 14-10-2024 & Date of Completion 13-01-2026 Survey and Soil investigation work completed BEP, Layout and HFD approved for 05 MLD STP. Work halted due to unresolved land dispute. Project is 7 months behind schedule.','Due to land dispute','Letters has been written to the District Administration requesting their intervention to resolve the dispute with the nearby farmers.','2026-04-24','2026-04-14','2026-06-16 07:39:04','2026-06-16 07:39:09'),(10,10,12,NULL,1,'I&D and STP Work in Deobandh','NGP','DBOT','2024-07-25',134.71,67.42,4.46,62.83,1,20.00,4,95.25,'2026-02-09','2027-07-08','','+0.00 0.00','+0.00 0.00','2026-06-08','Approval on Technical bid from NMCG recieved on 29.07.2025 Letter to lowest bidder regarding power consumption written on dated 14.08.2025 last date for reply is 20.08.2025 Reply received on dated 20.08.2025 NOC on pre- Bid Documents recieved 0n 18.12.2024 Technical Bid opened on 25.01.2025 Technical bid evaluation sheet and document send to NMCG on 28.04.2025 LOA issued to M/s 21st Century Enviro Engineers Pvt. Ltd. -M/s Sattva Engineering Const. Ltd. JV.  on dt. 14.11.2025 Financial bid send to NMCG on dated 04.09.2025 Approval recieved on 16.09.2025 AA&ES recieved on 25.07.2024. Construction activity has been stopped in compliance with the directions issued by the Superintending Engineer, Circle Office, Uttar Pradesh Jal Nigam (Rural), Saharanpur, vide letter no. 168/122 (Namami Gange)/44 dated 20.02.2026, due to an increase in drain discharge from 13.8 MLD to 20.36 MLD, with instructions to the firm not to commence construction activities. Draft pre-bid reply send to NMCG 24.11.2024 Pre-bid meeting held on 07.11.2024 Financial bid opened on 07-08-2025 and financial evaluation under process. Draft bid document and NIT sent to NMCG on 05.08.2024 for approval. Comments on draft Bid Documents recieved on 17.10.2024 NIT published on 24-10-2024','-','-','2027-11-08','2027-11-08','2026-06-16 07:39:04','2026-06-16 07:39:09'),(11,11,13,8,10,'I&D and STP Work in Shamli','NGP','DBOT','2023-05-25',206.02,103.19,6.66,96.17,1,40.00,1,120.92,'2024-10-14','2026-04-13','','+0.05 77.95','+0.00 41.81','2026-06-08','Primary Clariflocculator GAD Submitted, which clear for Vetting & Structural Design. CCT GAD Submitted which clear for Vetting & Structural Design. BEP, P&ID, HFD of MPS approved Data Sheet, QAP, Curves etc. of Turbo Blower, Centrifuge approved Gate Schedule & Electrical load list approved GAD, Structural Design and Dwg. of CCT/Toner Room & Fiber Disk Filter approved GAD, Structural Design and Dwg. for MPS approved Contract Agreement is signed on 08.10.2024 and Date of Start 14-10-2024 & Date of Completion 13-01-2026 Approach Road and Boundary wall work in progress BEP, Layout and HFD approved for 40 MLD STP. GAD, Structural Design and Dwg. for SBR and Boundary wall approved. GAD for Admin Building and Sludge Handling and Dewatering Building Submitted, which clear for Vetting & Structural Design. CCT and I&D GAD Submitted, which clear for Vetting & Structural Design. Project is 4 months behind schedule. Delay in design/drawing submission by Contractor. Contractor need to increase expedite the progress of work and submission of design/drawings. GAD, Structural Design and Dwg. for SHU  approved GAD, Structural Design and Dwg. of I&D Structure approved GAD and Data sheet of Decanter and diffuser approved GAD, Structural Design and Dwg. for Admin. Building & Lab approved GAD, Structural Design and Dwg. of Staff Quarter approved','Firm delayed submission of\nDesign and drawing','Liquidity Damage (L.D.) imposed on firm for delay.','2026-04-24','2026-04-14','2026-06-16 07:39:04','2026-06-16 07:39:09'),(12,12,13,9,9,'I&D and STP Work in Thanabhawan, Shamli','NGP','DBOT','2023-05-25',97.19,55.63,3.50,38.06,1,10.00,5,63.72,'2024-10-14','2026-04-13','','+0.05 68.15','+0.00 19.11','2026-06-08','GAD, Structural Design and Dwg. for SBR and Boundary wall approved. GAD for Sludge Handling Unit Submitted, which are clear for Vetting & Structural Design. CCT GAD were Submitted, which clear for Vetting & Structural Design. Boundary Wall work in progress Project is 4 months behind schedule. Delay in design/drawing submission by Contractor. Contractor need to increase expedite the progress of work and submission of design/drawings. GAD, Structural Design and Dwg. for SHU approved GAD and Data Sheet of Diffuser and decanter approved BEP, P&ID of MPS approved GAD of MPS submitted which is clear for vetting GAD, Structural Design and Dwg. for PTU and CCT  Submitted which are clear for Vetting Structural Design and Dwg. for MPS submitted which is clear for Vetting GAD of Fiber Disk filter submitted which is clear for vetting Data Sheet, QAP, Curves etc. of Turbo Blower, Centrifuge approved Gate Schedule & Electrical load list approved Structural Design and Dwg. of PTU, Fiber Disk Filter, I&D and Sewer Network approved Structural Design and Dwg. for MPS approved Structural Design and Dwg. for CCT with Tonner Room approved Contract Agreement is signed on 08.10.2024 and Date of Start 14-10-2024 & Date of Completion 13-01-2026 Survey and Soil investigation work completed Approach Road work in progress BEP, Layout and HFD approved for 10 MLD STP.','Firm delayed submission of Design and drawing','Liquidity Damage (L.D.) imposed on firm for delay.','2026-04-24','2026-04-14','2026-06-16 07:39:04','2026-06-16 07:39:09'),(13,13,3,11,15,'I&D and STP works at District-Hapur','NGP','DBOT','2023-09-19',49.06,22.85,1.42,24.79,1,6.00,1,39.28,'2024-11-08','2026-02-07','','+0.00 48.00','+0.00 6.97','2026-06-09','Revised vetted BEP Civil/Mechanical GA & R/F of MPS, SHU and SBR has been submitted by the firm on Dt 25.10.2025 and approved by the Department except  Civil GA and R/F of SBR. SBR Civil work Completed, MPS & STP work is in progress. Date of start is given on 08.11.24. Date of completion of work is 05.02.2026 to M/s SKC Technocrat Pvt. Ltd (Formerly M/s Satish Kumar & Co.) & M/s. Geo Miller & Co. Pvt. Ltd. (JV), Reg. Office B-29, IIIrd Floor, RDC Rajnagar, Ghaziabad - 201013. AGREEMENT cost of project is Rs. 39,28,13,617.00. Land Issue Resolved in March 2025. The amount of mobilization advance has been claimed by the firm. BEP and GAD sent for vetting to IIT BHU VARANASI on 19.06.25 LD of Rs. 32.00 Lac has been imposed on firm for delay of work, as per contract agreement.','Firm delayed submission of Design and drawing.','LD has been imposed vide letter no- 422/790/33 Dt 22.09.2025 due to delay in approval of Design/Drawing.','2026-02-07','2026-06-07','2026-06-16 07:39:04','2026-06-16 07:39:09'),(14,14,4,12,8,'I&D and STP works at Hathras Town','NGP','DBOT','2023-01-30',128.91,70.48,4.55,53.88,1,24.00,10,119.05,'2024-09-06','2026-06-05','','+2.79 52.00','+0.00 20.69','2026-06-08','Survey and soil investigation has been completed by firm Project was delayed as the land for STP was handed over in March 2025 by Nagar Palika Parishad Hathras. After that BEP is approved and structural drawings of SBR also vetted by IIT and at present excavation for SBR is in progress Date of start is 06.09.2024 and date of completion is 05.06.2024. Survey work is going on.','Land issued by NPP','Project Manager personally contacted the District Magistrate and requested to remove the potato crop, on which the District Magistrate talked to the Executive Officer over telephone and directed to remove the potato crop within 7 working days. As per the instructions of the District Magistrate, the construction work of STP could be started in the month of March 2025 after removing the potato crop from the land provided by the Executive Officer Municipal Council Hathras','2026-11-30','2026-06-05','2026-06-16 07:39:04','2026-06-16 07:39:09'),(15,15,7,3,9,'I&D and STP works at Kosi Kalan Town, District Mathura','NGP','DBOT','2022-10-25',66.59,31.24,2.03,33.32,1,12.00,1,53.60,'2024-10-16','2026-07-15','','+0.31 46.26','+0.00 13.52','2026-06-08','Continous instruction has been given to firm for expediting the work. BEP of STP has been approved. Boundary wall construction work is going on at site. Preparation for PCC work of SBR basin is in progress, hindered due to rain at site. LOA has been issued on date 18.06.2024 and Date of start has been given 16.10.2024 to the firm. Survey work is going on Survey and soil investigation has been done by firm. Ground improvement work of SBR basin is completed, PCC work  is in progress.','Firm has taken additional time in initial document submission and ULB\'s continuous waste disposal at project site also hindered the work.','Letter had been written to ULB to stop waste disposal at site. It was stopped and site was cleared for the work. Additionally notices/letters has been written to the firm for expediting the progress. Now the firm has been expedited the work and SBR basin work is in progress.','2026-07-16','2026-07-16','2026-06-16 07:39:04','2026-06-16 07:39:09'),(16,16,8,13,18,'I&D and STP works at Meerut','NGP2-EAP','HAM','2020-05-06',690.71,363.78,26.31,280.19,1,220.00,2,369.74,'2024-11-11','2026-11-10','','+0.58 56.84','+0.00 191.82','2026-06-08','QAP, Date Sheet and GAD of Decanter, Diffuser, Vortex Grit Chamber, Turbo Air Blower, Fine & Coarse Screens, Chlorination System & Leak Absorption System, RAS SAS, RSTP Pumps, Belt Filter Press, Gravity Belt Thickener, Screw Pumps approved. QAP, Date Sheet and GAD of Gas Flare System, under re-submission., RCC drawing & design Calculations of Odean Nala I&D under re-submission. GAD, Blower & Panel Building, SBR piping, HT panel & workshop, Security HT Panel-2  Metering Room, Electrical BEP, pending with Concessionaire. GAD of Odean Nala & Abu Nala-2 I&Ds under review with IIT Roorkee., RCC of Compound walls approved. . Payment for1st and 2nd MS have been released BEP, Layout and HFD approved for 220 MLD STP, 2 I&D’s & MPS, BEP of Treated Effluent Pipeline from Lohia Nagar STP to Outfall pending with Concessionaire, BEP of EPS and Pipeline pending with Concessionaire. \nGAD, Structural Design and Dwg. for Admin Building, SBR, CCT, Tonner Room approved\nQAP, Date Sheet and GAD of Decanter, Diffuser approved, QAP, Date Sheet and GAD of Air Blowers under review.,  Vortex Grit Remover approved by PE.\nGAD of Primary Clarifier approved by UPJN. , QAP, Date Sheet and GAD of Chlorination System pending with Concessionaire.\nQAP of Filter Belt Press pending with Concessionaire., Revised QAP of Pumps to be submitted by Concessionaire. Revised GAD of MPS pending with Concessionaire. Work in progress at only 1 front of STP, Concessionaire need to open multiple working fronts.\nInadequate Manpower deployment at site, Manpower deployment to be increased. ESIA/ ESMP under review with World Bank BEP of EPS and Pipeline works has been recommended by PE.','The 3rd and 4th milestones are delayed as the design and drawings have not been submitted by the firm. Due to this work not having started on different fronts.','','2027-02-21','2027-02-11','2026-06-16 07:39:04','2026-06-16 07:39:09'),(17,17,12,10,5,'I&D and STP works at Saharanpur','NGP2-EAP','HAM','2022-06-16',577.23,266.34,20.55,290.34,1,135.00,61,343.88,'2025-11-01','2027-10-31','','+0.15 25.65','+0.00 46.62','2026-06-08','LOA issue on dt. 26.07.2024. CA signed on dated 27.09.2024. Financial Closure documents submitted in NMCG, is under scrutiny. About 6.0 m level differnces as given in tender document and actual site level. as discussed NMCG meeting held on 07.01.2025. In the review meeting on 25.04.25 at NMCG, UPJN-R/PE were asked to work out on the possible alternatives options like retaining wall option, backfilling option or others etc. Post which UPJN-R and PE had to work on optimization of the solution and comeback with all possible solution.\nAccordingly, additional cost implication worth Rs. 81 crore for STP due to level difference sent to NMCG on 21.04.25 Out of various feasible technical solutions to counter the implication arose due to mis-match of site data, option no. 4 has been approved in-principle by NMCG and communicated vide letter no. Pr-13011/1/2022 – O/o PS NMCG dated 03.10.2025. Concessionaire have to submit the detailed estimate with in one month. Effective date of start  01.11.2025  given to concessionaire vide Lt. 1077/122(Namami Gange)132 dt. 31.10.2025','','','2027-11-01','2027-11-01','2026-06-16 07:39:05','2026-06-16 07:39:09'),(18,18,5,NULL,16,'Interception & Diversion Of 14 Untapped Drains Of Kanpur City (Along with Supplementary Works)','NGP2-NON EAP','DBOT','2025-05-02',138.11,97.17,7.77,2.03,0,0.00,14,79.39,'2026-01-09','2027-09-08','','+0.00 2.47','+0.00 0.00','2026-06-08','','','','2027-09-08','2027-07-08','2026-06-16 07:39:05','2026-06-16 07:39:09'),(19,19,10,14,6,'Interception, Diversion of Balance 13 drains and Augmentation of Salori STP capacity by 43 MLD (Sewerage District-C) at Prayagraj Uttar Pradesh under DBOT mode','NGP','DBOT','2023-03-14',331.75,180.27,11.22,140.27,1,43.00,13,204.40,'2024-03-19','2025-08-18','','+0.04 94.82','+18.03 99.95','2026-06-08','Casting of 10th  Lift of Wall at AB Culvert SPS has been completed.Compound wall & Sinking  work is under progress 2670 m laying of Rising main completed. Balance Laying is under progress. Sitaram Ghat SPS- RCC work for wet well is under progress. 1600 m laying of gravity intercepter line has been completed. Manhole construction work is under progress. RCC work for I&D is under progress. 43 MLD Salori STP partially commissioned on dated 31.12.2025. RCC work for PTU, SBR Basin, CCT Unit, MCC Room ,Chlorination room, Air Blower, Sludge Dewatering Unit  & TEPS is completed. RCC work for chlorine tonner yard is under Progress. Tiles, putti, painting and other finishing work for all unit of STP is under Progress. RCC work completed  for Admin Building and Staff quarter, Brick work & Plaster is under progress.','Progress was hampered due to site submergence in 2024,  Construction of River front road, Mahakumbh-2025 and site submergence in 2025 during monsoon.','','2026-04-30','2026-04-30','2026-06-16 07:39:05','2026-06-16 07:39:09'),(20,20,10,14,17,'Interception, Diversion of Balance 7 drains and Augmentation of Rajapur STP capacity by 90 MLD (Sewerage District-D) at Prayagraj Uttar Pradesh under DBOT mode','NGP','DBOT','2023-01-27',475.98,242.85,15.24,217.89,1,90.00,7,309.74,'2024-08-24','2026-02-23','','+0.81 80.34','+52.88 115.28','2026-06-08','Plinth Beam Casting is Completed for PTU, Column Casting is under Progress. RCC work &  Hydro test of SBR Basin 1,3& 4 is completed. Walkway & channel work is under progress RCC work & Hydro test of CCT  is completed. RCC work of TEPH  is completed. Mechanical work is in progress. RCC work of  workshop Building,sub station Building is completed, Finishing work is under progress. RCC work for Air Blower Building is completed . Finishing work is under progress. Admin Building &  BFP building - RCC work is under Progress. RCC work is under progress for  Rajapur 56 mld MPS. RCC work is under progress for Mumfordganj 39 mld MPS. Shifting of Existing Rising main inside Mumfordganj SPS Campus work is completed. 2950 m laying of Rising main completed. Balance Laying is under progress. 1272 m laying of Gravity main (Sadar Bazar) & 2342 m laying of Gravity main (Sankar Ghat) completed Balance Laying is under progress RCC work completed for 5 Nos I&D , work is under progress for 1 Nos. I&D. Work was hampered due to Vehical restriction and overcrowding during Mahakumbh -2025, River Front road construction and Flood in 2024 & 2025.','Work was hampered due to Vehical restriction and overcrowding during Mahakumbh -2025, River Front road construction and Flood in 2024 &2025.','','2026-02-23','2026-02-23','2026-06-16 07:39:05','2026-06-16 07:39:09'),(21,21,10,14,7,'Interception, Diversion of Balance discharge of 02 drains and 50 MLD STP to Augment existing Treatment Capacity (80 MLD) Naini STP for Sewerage District-A at Prayagraj Uttar Pradesh under DBOT mode','NGP','DBOT','2023-09-05',186.47,83.71,5.44,97.32,1,50.00,2,95.57,'2025-03-04','2026-07-03','','+0.38 68.33','+28.87 37.35','2026-06-08','Gates and screen installation work in PTU is under progress Gas engine Building Excavation work started at site Concreting work of Grid Slab of SBR basin-1, 2 3 &4  is completed and shuttering, reinforcement and concreting work of basin wall - 1 2  3 & 4 upto 100% height is completed. Walkway work also completed . Gravel padding, PCC and Reinforcement of CCT raft  Wall  & Walkway is completed Excavation, Reinforcement and Concreting work upto slab level is completed in PTU Walkway work is completed. Piling work of I&D Structure is completed. Wet Well of SPS is completed. Casting of columns of claritubesettler is completed and shuttering work of beam and grade slab is completed. Staff quarter upto ground floor column is completed and Shuttering and reinforcement work for Ground Floor beam and slab is completed. Gravel padding, PCC and raft of Admin Building is completed and reinforcement & shuttering work of plinth beam is completed. Finishing work of Security Cabin is completed. Workshop Building Footing work is completed column work is in progress. Dewatering Building foundation completed Column work is also completed. Decenter Blower clorination system Gate Screen, Screw Press Screen and diffuser  is receieved at site. Approach bridge Pilling work in completed. BEP of 50 MLD STP has been approved. Structure design & drawing of SBR, Claritube settler, Staff quarter, CCT, PTU, Admin Building cum Blower Room and Workshop Building has been approved. Excavation, PCC of work shop building is completed Column work is under progress. Soil testing of STP & SPS site has been completed. BEP and Structure design and drawing has been Approved for 2.90 MLD Bargad Ghat SPS. Survey, Design and Drawing work of remaining structure is in progress.','Site submergence during flood period. \nFirm has requested for technology change and the same was rejected by NMCG, New Delhi on dated 27.05.2025','Notice regarding LD has been issued to the firm for delay','2026-07-03','2026-07-03','2026-06-16 07:39:05','2026-06-16 07:39:09'),(22,22,7,4,4,'Mathura sewerage scheme (I&D and STP Works for balance drain)','NGP2-NON EAP','HAM','2022-09-07',292.56,149.85,9.61,133.10,1,60.00,4,240.01,'2024-11-30','2026-11-29','','+0.83 84.27','+0.00 155.37','2026-06-08','LOA issued to L1 Bidder on on 27.09.2023. CA signed on 12.12.2023. Effective date of start shall be to concessionaire after financial closure. Effective date of start has been given to concessionaire as 30.11.2024. IPS Kala Patthar civil work and its Rising main has been completed SBR basin and MPS construction work is in progress in STP premises. Dairy farm IPS rising main laying work is in progress.','No Delay','-','2026-11-30','2026-11-30','2026-06-16 07:39:05','2026-06-16 07:39:09'),(23,23,6,NULL,11,'Pollution Abatement Of Gomti River (Phase 1 Part 1) Lucknow','NGP','DBOT','2024-07-29',240.93,123.45,6.97,110.51,2,42.50,2,187.90,'2024-09-07','2026-06-06','','+0.02 92.56','+0.00 128.44','2026-06-09','39 MLD STP Daulatganj Operation & Maintenance started on dt. 05.11.2024. SBR Basin -Hydro testing work completed.  CCT -  Hydro testing work completed.  MPS - Sump wall 7th lift and coarse screen chamber wall 3rd lift reinforcement & shuttering work is in progress. PTU - Wall reinforcement, shuttering and casting work is in progress. HT Building - Plaster work is in progress. Admin Building - Ist floor roof slab shuttering work is in progress.  SHU - Column above Plinth beam work is in progress. Transformer yard - Casting work is completed. DG Platform - Casting work is completed. Supply of Decanter & Defuser completed. Supply of PLC Panel, Motor of MPS, RAS, SAS Pump  & Blower completed. Decanter installation work is in progress.','Slow progress by firm.','L.D. imposed Rs. 66,74,000.00 on firm','2026-06-06','2026-07-06','2026-06-16 07:39:05','2026-06-16 07:39:09'),(24,24,6,15,11,'Pollution Abatement of Gomti River (Phase-II, Part-I) Lucknow','NGP','DBOT','2023-01-30',264.67,137.55,8.53,118.60,1,50.00,3,187.74,'2024-06-14','2026-03-13','','+0.44 22.70','+0.00 24.12','2026-06-09','Design & Drawing work is in progress. SBR Basin  4 - Common wall 3rd lift reinforcement, shuttering and casting work is in progress. SBR Basin 3- Decanter wall 3rd lift and selector zone wall 3rd lift reinforcement shuttering & casting work is in progress. SBR Basin 2 - Selector zone  outer wall 3rd lift reinforcement, shuttering and casting work is in progress. SBR Basin 1 -Excavation work is in progress. IPS - Wall 1st lift reinforcement & shuttering  work is in progress. Faizullaganj (U/S) I&D - Approach drain excavation, PCC, reinforcement, shuttering and casting work is in progress.','Slow progress by firm.','L.D. imposed Rs. 64,13,000.00 on firm','2026-04-13','2026-04-13','2026-06-16 07:39:05','2026-06-16 07:39:09');
/*!40000 ALTER TABLE `audit_sewerage_projects` ENABLE KEYS */;
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
  `component_count` int DEFAULT NULL,
  `capacity_length_no` varchar(100) DEFAULT NULL,
  `physical_progress` decimal(10,2) DEFAULT NULL,
  `photos` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`component_id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_components`
--

LOCK TABLES `project_components` WRITE;
/*!40000 ALTER TABLE `project_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_components` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:02
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:02
CREATE DATABASE  IF NOT EXISTS `jjm_undertendering_projects_audit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jjm_undertendering_projects_audit`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jjm_undertendering_projects_audit
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
-- Table structure for table `audit_cities`
--

DROP TABLE IF EXISTS `audit_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_cities` (
  `audit_city_id` int NOT NULL AUTO_INCREMENT,
  `audit_district_id` int NOT NULL,
  `city_name` varchar(255) NOT NULL,
  PRIMARY KEY (`audit_city_id`),
  KEY `audit_district_id` (`audit_district_id`),
  CONSTRAINT `audit_cities_ibfk_1` FOREIGN KEY (`audit_district_id`) REFERENCES `audit_districts` (`audit_district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_cities`
--

LOCK TABLES `audit_cities` WRITE;
/*!40000 ALTER TABLE `audit_cities` DISABLE KEYS */;
INSERT INTO `audit_cities` VALUES (1,1,'Aligarh'),(2,2,'(Unknown)'),(3,3,'Lucknow'),(4,4,'(Unknown)'),(5,5,'Bhadohi'),(6,6,'(Unknown)');
/*!40000 ALTER TABLE `audit_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_districts`
--

DROP TABLE IF EXISTS `audit_districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_districts` (
  `audit_district_id` int NOT NULL AUTO_INCREMENT,
  `district_name` varchar(255) NOT NULL,
  PRIMARY KEY (`audit_district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_districts`
--

LOCK TABLES `audit_districts` WRITE;
/*!40000 ALTER TABLE `audit_districts` DISABLE KEYS */;
INSERT INTO `audit_districts` VALUES (1,'Aligar'),(2,'Chandauli'),(3,'Lucknow'),(4,'Moradabad'),(5,'Sant Ravidas Nagar'),(6,'Varanasi');
/*!40000 ALTER TABLE `audit_districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_undertendering_projects`
--

DROP TABLE IF EXISTS `audit_undertendering_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_undertendering_projects` (
  `audit_project_id` int NOT NULL AUTO_INCREMENT,
  `sr_no` int DEFAULT NULL,
  `audit_district_id` int DEFAULT NULL,
  `audit_city_id` int DEFAULT NULL,
  `project_name` text,
  `scheme_type` varchar(255) DEFAULT NULL,
  `project_mode` varchar(255) DEFAULT NULL,
  `sanction_date` date DEFAULT NULL,
  `sanction_cost` decimal(15,2) DEFAULT NULL,
  `work_cost` decimal(15,2) DEFAULT NULL,
  `centage` decimal(15,2) DEFAULT NULL,
  `om_cost` decimal(15,2) DEFAULT NULL,
  `stp_count` int DEFAULT NULL,
  `stp_capacity` decimal(15,2) DEFAULT NULL,
  `drain_count` int DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `remarks` text,
  `scrape_time` datetime DEFAULT NULL,
  PRIMARY KEY (`audit_project_id`),
  KEY `audit_district_id` (`audit_district_id`),
  KEY `audit_city_id` (`audit_city_id`),
  CONSTRAINT `audit_undertendering_projects_ibfk_1` FOREIGN KEY (`audit_district_id`) REFERENCES `audit_districts` (`audit_district_id`),
  CONSTRAINT `audit_undertendering_projects_ibfk_2` FOREIGN KEY (`audit_city_id`) REFERENCES `audit_cities` (`audit_city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_undertendering_projects`
--

LOCK TABLES `audit_undertendering_projects` WRITE;
/*!40000 ALTER TABLE `audit_undertendering_projects` DISABLE KEYS */;
INSERT INTO `audit_undertendering_projects` VALUES (1,1,1,1,'Aligarh Sewerage Scheme (I&D And STP Works)','NGP2-NON EAP','HAM','2024-10-21',496.02,240.02,15.12,240.88,2,113.00,2,'2026-06-16','NOC has been received from NMCG regarding retendering on dt. 21.01.2026 | Draft Tender document has been sent to NMCG for review on dt. 11.02.2026 | Approval on the Draft Tender document has been received from to NMCG on dt. 10.04.2026 | NIT has been published on E-Tender portal on dt. 10.04.2026 | Last date of bid submission is 25.05.2026 | Prebid meeting has been done on 20.04.2026. | prebid query reply has been sent to NMCG on dt 18-05-2026, which is under review. | Last date for bid submission has been extended upto 24-06-2026,as per NMCG instructions. | Approved prebid-reply uploaded on e-tender portal on dated 09-06-2026','2026-06-17 14:56:20'),(2,2,2,2,'I&D and STP works at Pt Deen Dayal Upadhyay Nagar Chandauli','NGP2-NON EAP','HAM','2025-01-22',262.78,95.00,7.60,129.67,1,45.00,2,'2026-05-26','Pre-bid reply sent to NMCG for approval on 14.08.2025 after approval from CE(Ganga) and SMCG | Pre-bid meeting held on 09.07.2025 | Bids will be opened on 19.08.2025 | Draft Pre-bid reply sent to CE(Ganga) on 04.08.2025 | Approved RFP Documents received from NMCG on 18.06.2025. NIT Shall be issued on 21.06.2025 | Date for bid opening extended upto 04.09.2025 | Date of bid opening is 07.10.2025 | AAE&S issued on 22.01.2025 | Revised model RFP Document received from NMCG on 06.05.2025, RFP sent to NMCG on 23.05.2025 for approval | Financial bids opened on 07.01.2026. CBER sent to NMCG on 03.02.2026 for approval | Approval of CBER received from NMCG on 20.02.2026 and communicated by CE(Ganga) on 23.02.2026 | M/s Enviro Infra Engineers Limited has been selected as L1 bidder | LOA issued on 25.02.2026 | Bidder vide its letter  03.03.3036 has requested to waive off the APS imposed for which guidance has been sought from HQ | Letter written to NMCG on 19.05.2026 to take decision about the APS imposed | NIT issued on 21.06.2025. Tender also published on e-Tender portal on 24.06.2025 | Bids opened on 07.10.2025. Technical evaluation in process','2026-06-17 14:56:20'),(3,3,3,3,'Pollution Abatement of Gomti River (Phase-II, Part-II ) Lucknow','NGP','HAM','2023-09-19',351.03,207.99,13.14,129.90,1,100.00,1,'2026-06-15','Concessionaire Agreement has been signed on dt. 26.08.2025. Financial closure is in progress.','2026-06-17 14:56:20'),(4,4,4,4,'Prevention of Pollution of River Ramganga at Moradabad  under zone-3 & 4 construction of Interception & Diversion (I&D) of Drains and Sewerage Treatment Plant','NMCG','HAM','2025-05-02',420.41,238.53,14.14,181.87,2,80.00,5,'2026-04-21','DPR for interception and diversion works of 5 Untapped drains of Moradabad Zone 3 & Zone 4 along with 2 STP (15 MLD & 65 MLD) works is sanctioned by NMCG New Delhi on dated 02-05-2025 | Tender document of Zone 3 & 4 has been sent to NMCG on dated 30.06.2025 | All Documents Related to tendering has been send to NMCG by email on dated 02-08-2025 | A Query was  raised by NMCG regarding BOD value of Karula drain. therefore combined sampling by U.P.J.N Team & UPPCB Team has been done on date 04-10-2025. Results are Awaited. | The Moradabad Municipal Corporation is to provide land for the construction of the STP in Zone 4, but it has not yet been purchased/made available. Continuous requests are being made to the Moradabad Municipal Corporation regarding this matter. | The reply of the queries received in the pre-bid meeting of the e-tender invited for construction of STPs in Zone-3 and Zone-4 under Namami Gange Programme were sent to NMCG by email on 03.02.2026, which have been approved by NMCG vide letter no. Pr 22012/5/2025 NMCG dated 03.03.2026. | which have been publish on e-tender portal vide letter no. 138/nivida/10 dt 06.03.2026.. The proposed last date for uploading and opening the bids of the said invited e-tender is 15.04.2026. | The said e-tender was opened in this office on 15.04.2026 at 16.00 hrs. The technical evaluation of the bids received in the e-tender is in progress.','2026-06-17 14:56:20'),(5,5,5,5,'Interception and Diversion of Drains/Nala Falling in Varuna River and STP for Bhadohi Town','NGP2-NON EAP','DBOT','2025-03-06',127.26,52.86,4.23,54.69,3,25.00,3,'2026-05-26','AAE&S issued on 06.03.2025 | draft Tender Documents sent to NMCG for approval on 10.06.2025. Approval awaited | Comments on draft documents are received from NMCG to which compliance shall be sent by 17.07.2025 | NIT issued on 31.07.2025 | Bids will be opened on 10.09.2025 | Pre Bid meeting scheduled on 18.08.2025 | Pre-bid meeting held on 18.08.2025. Reply to queries shall be sent by 24.08.2025 | Reply to query sent to CE(Ganga) on 24.08.2025 and after discussion sent to NMCG on 01.09.2025 | Bids will be opened on 09.10.2025 | Financial bids opened on 05.01.2026. CBER sent to NMCG on 03.02.2026 for approval | LOA issued on 12.05.2026 | Bids opened on 09.10.2025. technical evaluation in process','2026-06-17 14:56:20'),(6,6,6,6,'I&D and STP works for Durga Drain (Sewerage District-IV), Varanasi','NGP2-NON EAP','HAM','2025-03-06',274.31,107.70,8.61,97.50,1,60.00,1,'2026-05-26','RFP invited on 27.06.2025 and bids shall be opened on 12.08.2025 | Pre bid meeting held on 15.07.2025 | Pre-bid reply sent to NMCG on 18.08.2025 after discussion with CE(Ganga) and SMCG | Bid submission date extended upto 27.08.2025 | Bid submission extended upto 12.09.2025 | Bids will be opened on 07.10.2025 | Bids opened on 07.10.2025. technical evaluation in process | Financial bids opened on 07.01.2026. CBER sent to NMCG on 03.02.2026 for approval | Approval of CBER received from NMCG on 18.02.2026 and communicated by CE(Ganga) on 20.02.2026 | M/s Enviro Infra Engineers Limited has been selected as L1 bidder | AAE&S issued on 06.03.2025 | Revised Draft RFP Document received from NMCG on 06.05.2025, RFP shall be sent to NMCG by 29.05.2025 for approval | Daft RFP documents were sent to NMCG on which comments were received on 18.06.2025. Compliance/clarifications sent on 19.06.2025 | Final approved RFP documents received from NMCG on 23.06.2025. RFP shall be floated by 27.06.2025 | Bidder vide its letter  03.03.3036 has requested to waive off the APS imposed for which guidance has been sought from HQ | Letter written to NMCG on 19.05.2026 to take decision about the APS imposed','2026-06-17 14:56:20');
/*!40000 ALTER TABLE `audit_undertendering_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:02
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:02
CREATE DATABASE  IF NOT EXISTS `weekly_progress_of_namami_gange_drp_projects` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `weekly_progress_of_namami_gange_drp_projects`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: weekly_progress_of_namami_gange_drp_projects
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
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `district_id` int NOT NULL,
  `city_name` varchar(255) NOT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `uk_city` (`district_id`,`city_name`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1901 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1896,1896,'nan'),(1897,1897,'nan'),(1898,1898,'nan'),(1899,1899,'nan'),(1900,1900,'nan');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `district_id` int NOT NULL AUTO_INCREMENT,
  `district_name` varchar(255) NOT NULL,
  PRIMARY KEY (`district_id`),
  UNIQUE KEY `district_name` (`district_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1901 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1896,'Ambedkar AAAAAAAAAAA Nagar'),(1897,'Gorakhpur'),(1898,'Lucknow'),(1899,'PrayagRaj'),(1900,'Varanasi');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drp_projects`
--

DROP TABLE IF EXISTS `drp_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drp_projects` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `sr_no` int DEFAULT NULL,
  `district_id` int DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `project_name` longtext,
  `stp_count` int DEFAULT NULL,
  `stp_capacity` decimal(12,2) DEFAULT NULL,
  `drain_count` int DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `remarks` longtext,
  `scrape_time` datetime DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  KEY `district_id` (`district_id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `drp_projects_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`),
  CONSTRAINT `drp_projects_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2661 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drp_projects`
--

LOCK TABLES `drp_projects` WRITE;
/*!40000 ALTER TABLE `drp_projects` DISABLE KEYS */;
INSERT INTO `drp_projects` VALUES (2654,1,1896,1896,'STP and I&D Work in Tanda nagar palika parishad ambedkarnagar',1,15.00,0,'2024-08-14','I&D of drains and STP DPR amount Rs. 207.12 Cr. has been send to NMCG for approval on dt. 18.08.2023. DPR is pending for approval at NMCG','2026-06-17 13:49:50'),(2655,2,1897,1897,'I & D and Treatment for 8 Drains out of 9 Drains Falling in Rapti River',1,44.00,8,'2025-10-08','Presently 6 Land has been identified for DSTP and STP .No Government land had been available written by District Administration vide Letter No-4392/-24 dt 16/01/2024. | Presently land has been identified and proposal for purchasing land by Nagar Nigam has been under process with the help of District Magistrate and Commissioner Sir. | Due to non-availability of land for the STP plant, the process of purchasing land is under process with District Magistrate vide letter no.-2548/M-8/56 dated 03/10/2025','2026-06-17 13:49:50'),(2656,3,1898,1898,'Pollution Abatement of Gomti River (Phase-IV), Lucknow',1,145.00,0,'2026-06-15','Revised DPR of 145 MLD Basantkunj STP had been sent to NMCG vide APD, SMCG-UP letter no. 775/369/SMCG-UP/01 dt. 02.12.2025 with incorporating the comments raised by NMCG. | A meeting to discuss the DPR for 145 MLD Basantkunj STP held virtually on dt. 29.01.2026 under the chairmanship of D.G., NMCG.','2026-06-17 13:49:50'),(2657,4,1899,1899,'I&D of Kashipur drain and Augmentation of Kodra STP by 35 MLD (Sewerage District - E) at Prayagraj',1,35.00,1,'2026-06-09','DPR is prepared and sent to NMCG vide letter no. 1213/0786-T/SMCG-UP/01 on dated 16.10.2023  for review and approval. | Observation has been raised by NMCG, New Delhi on dated 14.05.2024. In continuation of the same DPR is being revised and submitted to HQ, UPJN on 12.08.2024 | Compliance Report of the observation and revised DPR has been submitted by UPJN to SMCG, Lucknow. SMCG, Lucknow has been examined and send to NMCG, Delhi on dated 10.10.2024 | Comprehensive plan  of Nagar Nigam,  Prayagraj is being prepared. | Revised DPR has been sent to HQ, UPJN (R), Lucknow | Revised DPR send to NMCG vide SMCG, Lucknow letter no. 941/032/SMCG-UP/12 Dated 30.12.2025 | Observation raised by NMCG, New Delhi on Kodra STP DPR has been complied and submitted to SMCG, Lucknow','2026-06-17 13:49:50'),(2658,5,1899,1899,'Interception and Diversion of Additional flow from Sasurkhaderi Drain and Augmentation of Numayadahi STP (57 MLD) in Sewerage District-B, Prayagraj',1,57.00,0,'2026-06-09','DPR has been submitted to SMCG, Lucknow | DPR has been submitted to NMCG, New Delhi  on dated 02.05.2025 | Comprehensive plan  of Nagar Nigam,  Prayagraj is being prepared. | Revised DPR has been sent to HQ, UPJN (R), Lucknow | Revised DPR send to NMCG vide SMCG, Lucknow letter no. 940/032/SMCG-UP/11 Dated 30.12.2025 | Observations has been raise by NMCG, New Delhi on Numayadahi DPR which are under review.','2026-06-17 13:49:50'),(2659,6,1900,1900,'DPR for tapping of newly Identified Drains falling in River Varuna in Varanasi',0,0.00,0,'2026-06-09','DPR submitted to NMCG in January 2026 | TPA visit conducted on 15.03.2026 | EC held on 15.05.2026','2026-06-17 13:49:50'),(2660,7,1900,1900,'Upgradation and Capacity Augmentation of Existing 80 MLD STP Dinapur in Varanasi',1,250.00,0,'2026-05-26','IIT Roorkee has been appointed as TPA by NMCG | In accordance to the new drains identified in Varuna River the capacity shall now be enhance to 250 MLD. revised DPR shall be submitted by 31.12.2025 | As per PFR sent to NMCG on 04.08.2025, capacity is now proposed to be 250 MLD | TPA visit held on 15.03.3036 | EC held on 15.05.2026 | DPR sent by CE(Vns Zone) to CE(Ganga) vide letter no.  838/W-14/52 dt 01.07.2024 | DPR was sent to NMCG by SMCG on 10.07.2024. | DPR for capacity Enhancement of Existing 80 MLD STP Dinapur to 250 MLD STP in VAranasi city sent by CE (Vns Zone) to CE(Ganga) vide letter no. 1392/W-14/189 dt 01.12.2025 | DPR forwarded by SMCG to NMCG on 10.12.2025 | NMCG has returned the DPR on 24.07.2024 stating \" Comprehensive action plan for entire Varuna stretch is to be submitted\"','2026-06-17 13:49:50');
/*!40000 ALTER TABLE `drp_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:02
CREATE DATABASE  IF NOT EXISTS `weekly_progress_of_namami_gange_ongoingprojects` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `weekly_progress_of_namami_gange_ongoingprojects`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: weekly_progress_of_namami_gange_ongoingprojects
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
-- Table structure for table `agencies`
--

DROP TABLE IF EXISTS `agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agencies` (
  `agency_id` int NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(500) NOT NULL,
  PRIMARY KEY (`agency_id`),
  UNIQUE KEY `agency_name` (`agency_name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencies`
--

LOCK TABLES `agencies` WRITE;
/*!40000 ALTER TABLE `agencies` DISABLE KEYS */;
INSERT INTO `agencies` VALUES (9,'M/s 21st Century Enviro Engineers Pvt. Ltd. -M/s Sattva Engineering Const. Ltd. JV'),(3,'M/s Aastha Enviro Engineers Pvt Ltd'),(1,'M/s AWWMPL  Pvt Ltd'),(21,'M/s EIEL Mathura Infra Engineers Private Limited'),(16,'M/s Enviro Infra Engineers Ltd, Bhugan Infracon Pvt. Ltd. & Micro Transmission System, JV'),(18,'M/s HNB Private ltd. - M/s Tirupati Cements Products (JV)'),(20,'M/s JWIL-SSG (Joint Venture)'),(13,'M/s Neercare India pvt KLtd JV M/s EMIT Group India Pvt Ltd JV EMS Ltd'),(7,'M/s R K Engineers Sales Ltd'),(10,'M/s R.K. Engineers Sales Ltd.-M/s Anand Constrwell Pvt. Ldt. (JV)'),(22,'M/s R.K. Engineers- Khilari Infrastructure (JV)'),(2,'M/s Shailesh Kumar J.V.'),(6,'M/s SIMA -G D- N.P. (JV)'),(5,'M/s SKC Technocrat Pvt. Ltd (Formerly M/s Satish Kumar & Co.) & M/s Malvika Technical Services (JV)'),(12,'M/s SKC Technocrat Pvt. Ltd (Formerly M/s Satish Kumar & Co.) & M/s. Geo Miller & Co. Pvt. Ltd. (JV)'),(17,'M/s Technocraft Ventures Limited'),(19,'M/s Triveni Engineering and Industries'),(15,'M/s. Meerut STP Pvt. Ltd.');
/*!40000 ALTER TABLE `agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `district_id` int NOT NULL,
  `city_name` varchar(255) NOT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `uk_city` (`district_id`,`city_name`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,1,'Agra'),(2,3,'Chhata'),(10,3,'Kosi Kalan'),(16,3,'Mathura'),(3,3,'Vrindavan'),(4,8,'Banat'),(5,8,'Bantikhera Banat'),(6,8,'Shamli'),(7,8,'Thanabhawan'),(12,10,'Saharanpur'),(8,13,'Hapur'),(9,14,'Hathras'),(11,16,'Meerut'),(13,19,'Prayagraj'),(17,23,'Lucknow');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `district_id` int NOT NULL AUTO_INCREMENT,
  `district_name` varchar(255) NOT NULL,
  PRIMARY KEY (`district_id`),
  UNIQUE KEY `district_name` (`district_name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'Agra'),(6,'Bulandshahr'),(13,'Hapur'),(14,'Hathras'),(18,'Kanpur Nagar'),(23,'Lucknow'),(3,'Mathura'),(16,'Meerut'),(5,'Pratapgarh'),(19,'PrayagRaj'),(4,'Rae Bareli'),(10,'Saharanpur'),(8,'Shamli');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
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
  `component_count` int DEFAULT NULL,
  `capacity_length_no` varchar(100) DEFAULT NULL,
  `physical_progress` decimal(10,2) DEFAULT NULL,
  `photos` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`component_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `project_components_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `sewerage_projects` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_components`
--

LOCK TABLES `project_components` WRITE;
/*!40000 ALTER TABLE `project_components` DISABLE KEYS */;
INSERT INTO `project_components` VALUES (1,1,'Effluent Disposal Line (km.)',2,'2.01',92.50,'12'),(2,1,'Intercepting Sewer (km)',3,'1.94',82.00,'4'),(3,1,'Interception And Diversion',1,'22.00',0.00,'0'),(4,1,'MPS (MLD)',3,'373.50',82.67,'45'),(5,1,'Rising main (mtr.)',3,'8970.00',76.67,'26'),(6,1,'STP (MLD)',13,'177.60',26.25,'88'),(7,2,'Interception And Diversion',1,'40.00',0.00,'0'),(8,3,'Ancilliary works(Admin building,staff quarter ,roa',1,'1.00',22.30,'4'),(9,3,'I/C Sewer line (Mtr.)',1,'2170.00',27.00,'0'),(10,3,'Interception And Diversion',1,'11.00',0.00,'0'),(11,3,'MPS (MLD)',1,'6.00',40.00,'14'),(12,3,'Rising Main (Meter)',1,'5500.00',0.00,'0'),(13,3,'STP (MLD)',1,'6.00',15.50,'8'),(14,4,'FSTP(KLD)',1,'8.00',3.90,'4'),(15,5,'Admin Building',1,'1.00',0.00,'0'),(16,5,'Boundary wall, staff quarter',1,'1.00',0.00,'0'),(17,5,'Cesspool Vehicle',1,'3.00',0.00,'0'),(18,5,'FSTP(KLD)',1,'15.00',28.00,'4'),(19,5,'Solar Power (kw)',1,'35.00',0.00,'0'),(20,6,'Boundary wall',1,'286.00',10.00,'0'),(21,6,'Interception And Diversion',1,'1.00',0.00,'0'),(22,6,'MPS (MLD)',1,'15.00',0.00,'0'),(23,6,'Others',1,'1.00',0.00,'0'),(24,6,'STP (MLD)',1,'10.00',3.00,'0'),(25,7,'Ancilliary works(Admin building,staff quarter ,roa',1,'1.00',96.00,'11'),(26,7,'Interception And Diversion',1,'2.00',97.00,'0'),(27,7,'MPS (MLD)',1,'6.00',88.00,'8'),(28,7,'Online Monitoring/LCS/MCS for proposed STPs and Ex',1,'1.00',0.00,'0'),(29,7,'Rising main (mtr.)',1,'3700.00',99.00,'0'),(30,7,'STP (MLD)',1,'13.00',98.00,'33'),(31,7,'Treated water sump and associated works',1,'1.00',99.00,'0'),(32,7,'Upgradation of MPS',1,'1.00',62.00,'0'),(33,8,'Co-treatment Unit for Fecal Sludge (KLD)',1,'5.00',3.00,'0'),(34,8,'Effluent Disposal Line (km.)',1,'0.60',65.00,'0'),(35,8,'Interception And Diversion',1,'2.00',55.00,'0'),(36,8,'MPS (MLD)',1,'6.00',85.90,'8'),(37,8,'Power Connection',1,'1.00',0.00,'0'),(38,8,'Rising main (mtr.)',1,'50.00',0.00,'0'),(39,8,'Sewer Line (km.)',1,'0.60',65.00,'0'),(40,8,'STP (MLD)',1,'5.00',61.20,'24'),(41,9,'Co-treatment Unit for Fecal Sludge (KLD)',1,'5.00',3.00,'0'),(42,9,'Effluent Disposal Line (km.)',1,'0.40',0.00,'0'),(43,9,'Interception And Diversion',1,'4.00',0.00,'0'),(44,9,'MPS (MLD)',1,'6.00',0.00,'0'),(45,9,'Power Connection',1,'1.00',0.00,'0'),(46,9,'Rising main (mtr.)',1,'50.00',0.00,'0'),(47,9,'Sewer Line (km.)',1,'2.00',0.00,'0'),(48,9,'STP (MLD)',1,'5.00',24.00,'13'),(49,10,'MPS (MLD)',1,'28.00',0.00,'0'),(50,10,'Power Connection',1,'1.00',0.00,'0'),(51,10,'Rising main (mtr.)',1,'50.00',0.00,'0'),(52,10,'Sewer Line (km.)',1,'3.83',0.00,'0'),(53,10,'STP (MLD)',1,'20.00',0.00,'4'),(54,11,'Co-treatment Unit for Fecal Sludge (KLD)',1,'20.00',3.00,'0'),(55,11,'Effluent Disposal Line (km.)',1,'0.10',0.00,'0'),(56,11,'Interception And Diversion',1,'1.00',95.00,'9'),(57,11,'MPS (MLD)',1,'48.00',60.90,'8'),(58,11,'Power Connection',1,'1.00',0.00,'0'),(59,11,'Rising main (mtr.)',1,'100.00',0.00,'7'),(60,11,'Sewer Line (km.)',1,'0.10',0.00,'0'),(61,11,'STP (MLD)',1,'40.00',68.92,'21'),(62,12,'Co-treatment Unit for Fecal Sludge (KLD)',1,'10.00',3.00,'0'),(63,12,'Interception And Diversion',1,'3.00',35.00,'4'),(64,12,'MPS (MLD)',1,'13.00',44.70,'4'),(65,12,'Power Connection',1,'1.00',0.00,'0'),(66,12,'Rising main (mtr.)',1,'60.00',0.00,'0'),(67,12,'Sewer Line (km.)',1,'5.60',7.00,'0'),(68,12,'STP (MLD)',1,'10.00',54.90,'18'),(69,13,'Drains',1,'1.00',5.00,'0'),(70,13,'MPS (MLD)',1,'8.00',60.00,'12'),(71,13,'Others',1,'1.00',30.00,'8'),(72,13,'STP (MLD)',1,'6.00',50.00,'12'),(73,14,'Admin Building',1,'1.00',45.00,'4'),(74,14,'Boundary wall (mtr.)',1,'800.00',0.00,'0'),(75,14,'Intercepting Sewer (km)',1,'5.67',33.10,'4'),(76,14,'MPS (MLD)',1,'54.00',77.00,'8'),(77,14,'Nala Tapping Arrangement ( No.)',1,'8.00',0.00,'0'),(78,14,'Rising main (mtr.)',1,'0.13',36.50,'0'),(79,14,'Staff Quarter type 2',1,'1.00',0.00,'0'),(80,14,'STP (MLD)',1,'24.00',72.00,'16'),(81,15,'Ancilliary works(Admin building,staff quarter ,roa',1,'1.00',31.05,'7'),(82,15,'Intercepting Sewer (km)',1,'0.03',0.00,'0'),(83,15,'MPS (MLD)',1,'12.00',37.05,'4'),(84,15,'Nala Tapping Arrangement ( No.)',1,'1.00',0.00,'0'),(85,15,'Rising main (mtr.)',1,'100.00',0.00,'0'),(86,15,'STP (MLD)',1,'12.00',51.95,'16'),(87,16,'Interception And Diversion',1,'2.00',50.70,'0'),(88,16,'MPS',1,'1.00',80.60,'6'),(89,16,'Power Connection',1,'1.00',0.00,'0'),(90,16,'Rising main (mtr.)',1,'100.00',0.00,'0'),(91,16,'Sewer Line (km.)',1,'5.60',10.00,'0'),(92,16,'STP (MLD)',1,'220.00',55.70,'47'),(93,17,'Effluent Disposal Line (km.)',1,'0.10',4.00,'0'),(94,17,'Interception And Diversion',1,'61.00',4.00,'0'),(95,17,'MPS (MLD)',1,'172.30',4.00,'0'),(96,17,'Power Connection',1,'1.00',4.00,'0'),(97,17,'Rising main (mtr.)',1,'50.00',4.00,'0'),(98,17,'Sewer Line (km.)',1,'16.00',4.00,'4'),(99,17,'STP (MLD)',1,'135.00',33.60,'0'),(100,18,'Construction of SPS and Lift Station (Nos)',1,'7.00',0.00,'0'),(101,18,'Interception and Diversion Work of Drains (Nos)',1,'14.00',0.00,'0'),(102,18,'Laying of Diversion Sewer (meter)',1,'2515.00',0.00,'0'),(103,18,'Laying of Rising main (meter)',1,'11253.00',6.56,'0'),(104,18,'Miscellaneous Works',1,'1.00',0.00,'0'),(105,19,'Effluent Disposal Line (km.)',1,'0.30',85.00,'16'),(106,19,'Effluent Pumping Station (MLD)',1,'43.00',100.00,'28'),(107,19,'Interception And Diversion',1,'13.00',70.00,'8'),(108,19,'IPS (MLD)',1,'2.20',68.00,'21'),(109,19,'MPS (MLD)',1,'32.00',72.00,'16'),(110,19,'Rehabilitation of Sewer Line',1,'3.30',0.00,'0'),(111,19,'Rising main (mtr.)',1,'4070.00',94.00,'20'),(112,19,'Sewer Line (km.)',1,'2.16',94.00,'8'),(113,19,'STP (MLD)',1,'43.00',99.00,'105'),(114,20,'Effluent Disposal Line (km.)',1,'0.30',73.00,'8'),(115,20,'Effluent Pumping Station (MLD)',1,'90.00',73.00,'4'),(116,20,'Interception And Diversion',1,'7.00',80.00,'42'),(117,20,'MPS (MLD)',2,'95.00',71.50,'103'),(118,20,'Rehabilitation of Bund and Bund Road',1,'1.00',37.00,'0'),(119,20,'Rising main (mtr.)',1,'3450.00',88.00,'9'),(120,20,'Sewer Line (km.)',1,'4.20',88.00,'23'),(121,20,'STP (MLD)',1,'90.00',81.00,'114'),(122,21,'Co-treatment Unit for Fecal Sludge (KLD)',1,'20.00',0.00,'0'),(123,21,'Interception And Diversion',1,'2.00',84.00,'24'),(124,21,'IPS (MLD)',1,'2.90',67.50,'85'),(125,21,'Rising main (mtr.)',1,'100.00',25.00,'0'),(126,21,'Sewer Line (km.)',1,'0.06',86.00,'0'),(127,21,'STP (MLD)',1,'50.00',68.00,'211'),(128,22,'I/C Sewer line (Mtr.)',1,'1970.00',97.06,'4'),(129,22,'Interception And Diversion',1,'4.00',68.15,'4'),(130,22,'IPS (MLD)',2,'47.00',69.13,'13'),(131,22,'MPS (MLD)',1,'60.00',100.00,'8'),(132,22,'Rising main (mtr.)',1,'9290.00',97.44,'8'),(133,22,'STP (MLD)',1,'60.00',81.84,'14'),(134,23,'Interception And Diversion',1,'1.00',3.00,'0'),(135,23,'MPS',1,'3.50',46.50,'0'),(136,23,'STP (MLD)',2,'42.50',87.85,'59'),(137,23,'Uppgradation of SPS',3,'3.00',100.00,'0'),(138,24,'Interception And Diversion',1,'3.00',14.58,'0'),(139,24,'Rising main (mtr.)',1,'3500.00',57.12,'0'),(140,24,'SPS (MLD)',1,'22.60',3.69,'0'),(141,24,'STP (MLD)',1,'50.00',22.57,'41');
/*!40000 ALTER TABLE `project_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sewerage_projects`
--

DROP TABLE IF EXISTS `sewerage_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sewerage_projects` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `sr_no` int DEFAULT NULL,
  `district_id` int NOT NULL,
  `city_id` int DEFAULT NULL,
  `agency_id` int DEFAULT NULL,
  `project_name` varchar(1000) NOT NULL,
  `scheme_type` varchar(100) DEFAULT NULL,
  `project_mode` varchar(100) DEFAULT NULL,
  `sanction_date` date DEFAULT NULL,
  `sanction_cost` decimal(15,2) DEFAULT NULL,
  `work_cost` decimal(15,2) DEFAULT NULL,
  `centage` decimal(15,2) DEFAULT NULL,
  `om_cost` decimal(15,2) DEFAULT NULL,
  `stp_count` int DEFAULT NULL,
  `stp_capacity` decimal(15,2) DEFAULT NULL,
  `drain_count` int DEFAULT NULL,
  `agreement_cost` decimal(15,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `agreement_completion_date` date DEFAULT NULL,
  `revised_date` varchar(255) DEFAULT NULL,
  `physical_progress` varchar(100) DEFAULT NULL,
  `financial_progress` varchar(100) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `remarks` longtext,
  `reason_for_delay` longtext,
  `action_taken` longtext,
  `tentative_inauguration_date` date DEFAULT NULL,
  `tentative_zero_discharge_date` date DEFAULT NULL,
  `scrape_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_id`),
  KEY `district_id` (`district_id`),
  KEY `city_id` (`city_id`),
  KEY `agency_id` (`agency_id`),
  CONSTRAINT `sewerage_projects_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`),
  CONSTRAINT `sewerage_projects_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`),
  CONSTRAINT `sewerage_projects_ibfk_3` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sewerage_projects`
--

LOCK TABLES `sewerage_projects` WRITE;
/*!40000 ALTER TABLE `sewerage_projects` DISABLE KEYS */;
INSERT INTO `sewerage_projects` VALUES (1,1,1,1,1,'Agra Sewerage Scheme( Interception & diversion and STP works)','NGP2-EAP','HAM','2020-05-06',842.25,371.29,25.40,445.56,13,177.60,26,582.84,'2023-04-05','2025-04-04','04-Apr-2025 31-Dec-2025','+0.00 83.01','+0.00 336.24','2026-06-08','Component wise progress of Agra (HAM) 100 MLD STP- 68%, WIP 35 MLD STP- 76.2, WIP 31 MLD STP- 76.48%, WIP MPS 03 Nos.- 73%, WIP Rising Main 9.55 Km- 55%%, WIP Gravity Sewer 2.55 Km- 80%, WIP DSTP 10 Nos.- 5%, WIP Note- 1st Stage permission is granted for 07 Nos. DSTP Forest Land and 2nd stage permission is under process As per pervious meeting discussion, In order to complete the remaining works of 31 MLD and 35 MLD STP and make them operational as per the prescribed timeline, Direction  has been given to firm to complete the works as early as possible by increasing manpower. As per pervious meeting discussion, In order to 07 Nos. DSTP forest clearance , Land Gazette notification meeting has been conducted on 02.05.2025 and soon gazette notification will be published and after that stage 2 permission will be applied','NOC of land for 7 Nos DSTP, Road cutting permission for laying of rising main ,','1st Stage Permission was granted from forest department and 2nd stage permission is under process. A request was made by District Magistrate proposal sent to Revenue  department UP Lucknow for 1 No. DSTP Indira Memorial.  In current laying of rising main and intercepting sewer line permission was granted by district administration and work is under progress. MPS Nagla Buri public hindrance was resolved work is under progress.','2026-11-01','2026-09-01','2026-06-16 07:39:10'),(2,2,1,NULL,NULL,'Balance Darins Tapping and Augmentation of SPSs at Agra City','NGP','DBOT','2025-06-11',126.41,86.37,6.90,34.01,0,0.00,0,66.86,'2026-04-02','2027-10-01','','+0.00 0.00','+0.00 0.00',NULL,'','','','2027-11-01','2027-10-31','2026-06-16 07:39:10'),(3,3,3,2,2,'Chhata Town Sewerage Scheme (I&D and STP works), District Mathura','NGP','DBOT','2022-10-25',56.15,34.52,2.23,19.40,1,6.00,14,48.97,'2024-11-12','2026-08-11','','+0.32 17.58','+0.00 2.69','2026-06-08','STP site is flooded due to overflow from Bahrauli branch drain, (situated near to the site) from 1 month. The current water level at STP site is higher to the HFL, provided by irrigation department. At this situation all works are heavily affected. Not only in present this kind of situation during monsoon will affect the operation and maintenance services in later too.\n            Due to the current scenario of site, we have sent a letter to SDM, Chhata, requesting a new land for \n           construction of STP in this project with all requisite details of the scenario of original project site. Construction of HTS and staff quarter building is in progress at MPS. Project is slightly delayed due to problem of water logging at STP Site as PWD, Mathura was constructing a culvert on Kosi Drain and due to diversion of drain the water of kosi drain got obstructed. The STP site is located near to the branch drain of kosi drain at upstream side which got over flowed and leading to water logging at STP Site.This hindrance cleared in march 2025 after that work was resumed. Date of Start 12.11.2024 has been given to the firm. Survey and soil investigation has completed by firm. BEP of STP has been approved. Boundary wall construction work is going on at site.','Project is slightly delayed due to problem of water logging at STP Site as PWD, Mathura was constructing a culvert on Kosi Drain and due to diversion of drain the water of kosi drain got obstructed. The STP site is located near to the branch drain of kosi drain at upstream side which got over flowed and leading to water logging at STP Site.','Communication has been done to PWD and Irrigation Department for the problem of water logging at site. Additionally firm has been instructed to take preventive measures and initiate the work. Now the Piling and associated work has been commenced at site for SBR basin.','2026-08-12','2026-08-12','2026-06-16 07:39:10'),(4,4,4,NULL,3,'DPR OF 08 KLD Fecal Sludge Treatment Plant At Dalmau Raibareli','NMCG','DBOT','2024-08-28',4.40,3.01,0.18,1.21,0,0.00,0,3.00,'2026-02-06','2026-11-05','','+0.15 3.90','+0.00 0.00','2026-06-09','Technical Bid open on dt. 22.08.2025. LOA issued to Firm M/s Aastha Enviro Engineers Pvt. Ltd. on dt. 30.12.2025. NOC received from NMCG  of FBER on dt. 19.12.2025 TBER sent to NMCG for review and approval. NOC received from NMCG on dt. 03.10.2025. Financial bid open on dt. 10.10.2025. Financial Evaluation work is in progress. FBER sent to NMCG for review and approval on dt. 01.12.2025. Date of start  given to Firm M/s Aastha Enviro Engineers Pvt. Ltd. on dt. 06.02.2026. Bid Document uploaded at e-tender portal on dt. 27.06.2025. Pre-bid Meeting dt. 04.07.2025 at 12:00 PM. Pre-bid reply sent to NMCG for review and approval on dt. 07.07.2025. Soil testing and Survey completed. Design & Drawing work is in progress. Boundary wall work is in progress. NMCG sent final pre-bid replies on dt. 05.08.2025. Final pre-bid replies uploaded on e-tender portal on dt. 07.08.2025 Bid Submission date 22.08.2025.','','','2026-12-05','2026-12-05','2026-06-16 07:39:10'),(5,5,5,NULL,3,'Faecal Sludge Management for Pollution abatement of river Ganga at Manikpur, Pratapgarh','Non EAP','DBOT','2025-01-22',8.56,5.73,0.19,1.90,0,0.00,0,4.62,'2026-02-05','2026-11-04','','+16.00 28.00','+0.00 0.00','2026-06-08','NMCG New Delhi has given approval for issuance of LOA to the L1 Firm  M/s Aastha LOA has been issued to firm on dated 23.12.2025 Date of start has been issued to firm on dated 04.02.2026. Date of start 05.02.2026 and Date of Completion 04.11.2026 Soil test has been done, Survey and site cleaning work is under progress. Construction of Boundary wall is under progress. Excavation and PCC work is under progress for various unit. Vetting of BEP, Design & Drawing is completed. Construction of staff quarter, admin building cum lab are under progress.','','','2026-11-04','2026-11-04','2026-06-16 07:39:10'),(6,6,6,NULL,5,'Gulaothi I&D works','NMCG','DBOT','2024-08-28',50.98,17.13,1.37,13.20,1,10.00,1,51.19,'2025-12-01','2027-05-31','','+0.00 9.00','+0.00 2.09','2026-06-09','AA&ES issued on Dt 28.08.2024 NIT issued by SE, Meerut vide letter no. 257/731/15 Dt 08.11.2024 LOA & Date of start is given on 26.11.2025.  Date of  start is 01.12.2025 & Date of completion of work is 31.05.2027 issued to M/s SKC Technocrat Private Limited- M/s Malvika Technical Services (JV), B-29, RDC, Raj Nagar, Ghaziabad- 201002 Soil Testing Complete. Boundary Wall work is in progress. BEP submitted by the firm on Dated 03.02.2026. Some Observation were found in the examination of BEP, after which BEP was returned to the firm on 08.02.2026. The land purchase proposal has been Sanctioned and GO issued. The funds Released to ULB Gulaothi. Land Registry work is completed. ULB handed over the land to U.P. Jal Nigam for work on Dated 20.12.2025. Mobilization Amount of Rs. 1.04 Crore claimed by firm. Revised BEP submitted by the firm.  BEP send to IIT BHU for vetting After checking it.','','-','2027-05-31','2027-05-31','2026-06-16 07:39:10'),(7,7,3,3,6,'I&D and 13 MLD STP works at Vrindavan City','NGP','DBOT','2022-10-25',77.70,39.90,2.56,35.24,1,13.00,2,65.86,'2024-06-11','2026-03-10','','+0.05 92.93','+0.00 35.24','2026-06-08','Kalideh MPS rising main works has been done. STP site is water logged from 10.08.2025, work is affected due to this STP site had been water logged from 10.08.2025 to 18.09.2025, due to the high flood of Yamuna. After receding of water construction work is in progress along with corrective works due to the damage by flood at site. Work is going in SBR basin,  CCT, Admin building, Pannel room, SHU and in MPS  units. LOA issued to firm on dated 15.03.2024. Effective Date of start for the work is 11.06.2024.Work is in progress.','Initially preliminary work at Site got hindered due to start of monsoon just after the date of start of the project. Firm has started the work after the monsoon  and currently the work is being going on almost on all fronts by the firm. The progress is being regularly expedited by firm to complete the work on scheduled date.','-','2026-03-11','2026-03-11','2026-06-16 07:39:10'),(8,8,8,4,7,'I&D and STP Work in Banat, Shamli','NGP','DBOT','2023-05-25',48.71,24.93,1.58,22.20,1,5.00,3,37.92,'2024-10-14','2026-04-13','','+0.05 73.20','+0.00 14.70','2026-06-08','Contract Agreement is signed on 08.10.2024 and Date of Start 14-10-2024 & Date of Completion 13-01-2026 Survey and Soil investigation work completed BEP, Layout and HFD approved for 05 MLD STP. Gate Schedule approved GAD, Structural design and drawing of CCT with Tonner Room & HT Substation approved GAD, Structural Design and Dwg. for SBR and Boundary wall approved. Approach Road and boundary wall work in progress GAD for Sludge Handling Unit Submitted, which are clear for Vetting & Structural Design. Project is 4 months behind schedule. Delay in design/drawing submission by Contractor. Contractor need to increase expedite the progress of work and submission of design/drawings. GAD, Structural Design and Dwg. for SHU approved GAD, Structural design and drawing of I&D Structure approved GAD and Data Sheet of Diffuser and decanter approved BEP, P&ID of MPS approved GAD, Structural design and drawing of PTU Structure approved GAD, Structural design and drawing of CCT, HT Substation Building and MPS which are clear for Vetting. Structural Design and Dwg. for MPS approved Data Sheet, QAP, Curves etc. of Turbo Blower, Centrifuge approved','Firm delayed submission of Design and drawing','Liquidity Damage (L.D.) imposed on firm for delay.','2026-04-24','2026-04-14','2026-06-16 07:39:10'),(9,9,8,5,7,'I&D and STP Work in Bantikhera and Babri village, Shamli','NGP','DBOT','2023-05-25',55.47,29.41,1.84,24.22,1,5.00,1,41.91,'2024-10-14','2026-04-13','','+0.05 15.55','+0.00 3.62','2026-06-08','GAD of SBR is Clear for Vetting and Structural design Date Sheet, QAP, Curves etc. of Turbo Blower, Centrifuge approved Gate Schedule approved GAD, Structural design & Dwg. of PTU approved Contract Agreement is signed on 08.10.2024 and Date of Start 14-10-2024 & Date of Completion 13-01-2026 Survey and Soil investigation work completed BEP, Layout and HFD approved for 05 MLD STP. Work halted due to unresolved land dispute. Project is 7 months behind schedule.','Due to land dispute','Letters has been written to the District Administration requesting their intervention to resolve the dispute with the nearby farmers.','2026-04-24','2026-04-14','2026-06-16 07:39:10'),(10,10,10,NULL,9,'I&D and STP Work in Deobandh','NGP','DBOT','2024-07-25',134.71,67.42,4.46,62.83,1,20.00,4,95.25,'2026-02-09','2027-07-08','','+0.00 0.00','+0.00 0.00','2026-06-08','Approval on Technical bid from NMCG recieved on 29.07.2025 Letter to lowest bidder regarding power consumption written on dated 14.08.2025 last date for reply is 20.08.2025 Reply received on dated 20.08.2025 NOC on pre- Bid Documents recieved 0n 18.12.2024 Technical Bid opened on 25.01.2025 Technical bid evaluation sheet and document send to NMCG on 28.04.2025 LOA issued to M/s 21st Century Enviro Engineers Pvt. Ltd. -M/s Sattva Engineering Const. Ltd. JV.  on dt. 14.11.2025 Financial bid send to NMCG on dated 04.09.2025 Approval recieved on 16.09.2025 AA&ES recieved on 25.07.2024. Construction activity has been stopped in compliance with the directions issued by the Superintending Engineer, Circle Office, Uttar Pradesh Jal Nigam (Rural), Saharanpur, vide letter no. 168/122 (Namami Gange)/44 dated 20.02.2026, due to an increase in drain discharge from 13.8 MLD to 20.36 MLD, with instructions to the firm not to commence construction activities. Draft pre-bid reply send to NMCG 24.11.2024 Pre-bid meeting held on 07.11.2024 Financial bid opened on 07-08-2025 and financial evaluation under process. Draft bid document and NIT sent to NMCG on 05.08.2024 for approval. Comments on draft Bid Documents recieved on 17.10.2024 NIT published on 24-10-2024','-','-','2027-11-08','2027-11-08','2026-06-16 07:39:10'),(11,11,8,6,10,'I&D and STP Work in Shamli','NGP','DBOT','2023-05-25',206.02,103.19,6.66,96.17,1,40.00,1,120.92,'2024-10-14','2026-04-13','','+0.05 77.95','+0.00 41.81','2026-06-08','Primary Clariflocculator GAD Submitted, which clear for Vetting & Structural Design. CCT GAD Submitted which clear for Vetting & Structural Design. BEP, P&ID, HFD of MPS approved Data Sheet, QAP, Curves etc. of Turbo Blower, Centrifuge approved Gate Schedule & Electrical load list approved GAD, Structural Design and Dwg. of CCT/Toner Room & Fiber Disk Filter approved GAD, Structural Design and Dwg. for MPS approved Contract Agreement is signed on 08.10.2024 and Date of Start 14-10-2024 & Date of Completion 13-01-2026 Approach Road and Boundary wall work in progress BEP, Layout and HFD approved for 40 MLD STP. GAD, Structural Design and Dwg. for SBR and Boundary wall approved. GAD for Admin Building and Sludge Handling and Dewatering Building Submitted, which clear for Vetting & Structural Design. CCT and I&D GAD Submitted, which clear for Vetting & Structural Design. Project is 4 months behind schedule. Delay in design/drawing submission by Contractor. Contractor need to increase expedite the progress of work and submission of design/drawings. GAD, Structural Design and Dwg. for SHU  approved GAD, Structural Design and Dwg. of I&D Structure approved GAD and Data sheet of Decanter and diffuser approved GAD, Structural Design and Dwg. for Admin. Building & Lab approved GAD, Structural Design and Dwg. of Staff Quarter approved','Firm delayed submission of\nDesign and drawing','Liquidity Damage (L.D.) imposed on firm for delay.','2026-04-24','2026-04-14','2026-06-16 07:39:10'),(12,12,8,7,7,'I&D and STP Work in Thanabhawan, Shamli','NGP','DBOT','2023-05-25',97.19,55.63,3.50,38.06,1,10.00,5,63.72,'2024-10-14','2026-04-13','','+0.05 68.15','+0.00 19.11','2026-06-08','GAD, Structural Design and Dwg. for SBR and Boundary wall approved. GAD for Sludge Handling Unit Submitted, which are clear for Vetting & Structural Design. CCT GAD were Submitted, which clear for Vetting & Structural Design. Boundary Wall work in progress Project is 4 months behind schedule. Delay in design/drawing submission by Contractor. Contractor need to increase expedite the progress of work and submission of design/drawings. GAD, Structural Design and Dwg. for SHU approved GAD and Data Sheet of Diffuser and decanter approved BEP, P&ID of MPS approved GAD of MPS submitted which is clear for vetting GAD, Structural Design and Dwg. for PTU and CCT  Submitted which are clear for Vetting Structural Design and Dwg. for MPS submitted which is clear for Vetting GAD of Fiber Disk filter submitted which is clear for vetting Data Sheet, QAP, Curves etc. of Turbo Blower, Centrifuge approved Gate Schedule & Electrical load list approved Structural Design and Dwg. of PTU, Fiber Disk Filter, I&D and Sewer Network approved Structural Design and Dwg. for MPS approved Structural Design and Dwg. for CCT with Tonner Room approved Contract Agreement is signed on 08.10.2024 and Date of Start 14-10-2024 & Date of Completion 13-01-2026 Survey and Soil investigation work completed Approach Road work in progress BEP, Layout and HFD approved for 10 MLD STP.','Firm delayed submission of Design and drawing','Liquidity Damage (L.D.) imposed on firm for delay.','2026-04-24','2026-04-14','2026-06-16 07:39:10'),(13,13,13,8,12,'I&D and STP works at District-Hapur','NGP','DBOT','2023-09-19',49.06,22.85,1.42,24.79,1,6.00,1,39.28,'2024-11-08','2026-02-07','','+0.00 48.00','+0.00 6.97','2026-06-09','Revised vetted BEP Civil/Mechanical GA & R/F of MPS, SHU and SBR has been submitted by the firm on Dt 25.10.2025 and approved by the Department except  Civil GA and R/F of SBR. SBR Civil work Completed, MPS & STP work is in progress. Date of start is given on 08.11.24. Date of completion of work is 05.02.2026 to M/s SKC Technocrat Pvt. Ltd (Formerly M/s Satish Kumar & Co.) & M/s. Geo Miller & Co. Pvt. Ltd. (JV), Reg. Office B-29, IIIrd Floor, RDC Rajnagar, Ghaziabad - 201013. AGREEMENT cost of project is Rs. 39,28,13,617.00. Land Issue Resolved in March 2025. The amount of mobilization advance has been claimed by the firm. BEP and GAD sent for vetting to IIT BHU VARANASI on 19.06.25 LD of Rs. 32.00 Lac has been imposed on firm for delay of work, as per contract agreement.','Firm delayed submission of Design and drawing.','LD has been imposed vide letter no- 422/790/33 Dt 22.09.2025 due to delay in approval of Design/Drawing.','2026-02-07','2026-06-07','2026-06-16 07:39:10'),(14,14,14,9,13,'I&D and STP works at Hathras Town','NGP','DBOT','2023-01-30',128.91,70.48,4.55,53.88,1,24.00,10,119.05,'2024-09-06','2026-06-05','','+2.79 52.00','+0.00 20.69','2026-06-08','Survey and soil investigation has been completed by firm Project was delayed as the land for STP was handed over in March 2025 by Nagar Palika Parishad Hathras. After that BEP is approved and structural drawings of SBR also vetted by IIT and at present excavation for SBR is in progress Date of start is 06.09.2024 and date of completion is 05.06.2024. Survey work is going on.','Land issued by NPP','Project Manager personally contacted the District Magistrate and requested to remove the potato crop, on which the District Magistrate talked to the Executive Officer over telephone and directed to remove the potato crop within 7 working days. As per the instructions of the District Magistrate, the construction work of STP could be started in the month of March 2025 after removing the potato crop from the land provided by the Executive Officer Municipal Council Hathras','2026-11-30','2026-06-05','2026-06-16 07:39:10'),(15,15,3,10,7,'I&D and STP works at Kosi Kalan Town, District Mathura','NGP','DBOT','2022-10-25',66.59,31.24,2.03,33.32,1,12.00,1,53.60,'2024-10-16','2026-07-15','','+0.31 46.26','+0.00 13.52','2026-06-08','Continous instruction has been given to firm for expediting the work. BEP of STP has been approved. Boundary wall construction work is going on at site. Preparation for PCC work of SBR basin is in progress, hindered due to rain at site. LOA has been issued on date 18.06.2024 and Date of start has been given 16.10.2024 to the firm. Survey work is going on Survey and soil investigation has been done by firm. Ground improvement work of SBR basin is completed, PCC work  is in progress.','Firm has taken additional time in initial document submission and ULB\'s continuous waste disposal at project site also hindered the work.','Letter had been written to ULB to stop waste disposal at site. It was stopped and site was cleared for the work. Additionally notices/letters has been written to the firm for expediting the progress. Now the firm has been expedited the work and SBR basin work is in progress.','2026-07-16','2026-07-16','2026-06-16 07:39:10'),(16,16,16,11,15,'I&D and STP works at Meerut','NGP2-EAP','HAM','2020-05-06',690.71,363.78,26.31,280.19,1,220.00,2,369.74,'2024-11-11','2026-11-10','','+0.58 56.84','+0.00 191.82','2026-06-08','QAP, Date Sheet and GAD of Decanter, Diffuser, Vortex Grit Chamber, Turbo Air Blower, Fine & Coarse Screens, Chlorination System & Leak Absorption System, RAS SAS, RSTP Pumps, Belt Filter Press, Gravity Belt Thickener, Screw Pumps approved. QAP, Date Sheet and GAD of Gas Flare System, under re-submission., RCC drawing & design Calculations of Odean Nala I&D under re-submission. GAD, Blower & Panel Building, SBR piping, HT panel & workshop, Security HT Panel-2  Metering Room, Electrical BEP, pending with Concessionaire. GAD of Odean Nala & Abu Nala-2 I&Ds under review with IIT Roorkee., RCC of Compound walls approved. . Payment for1st and 2nd MS have been released BEP, Layout and HFD approved for 220 MLD STP, 2 I&D’s & MPS, BEP of Treated Effluent Pipeline from Lohia Nagar STP to Outfall pending with Concessionaire, BEP of EPS and Pipeline pending with Concessionaire. \nGAD, Structural Design and Dwg. for Admin Building, SBR, CCT, Tonner Room approved\nQAP, Date Sheet and GAD of Decanter, Diffuser approved, QAP, Date Sheet and GAD of Air Blowers under review.,  Vortex Grit Remover approved by PE.\nGAD of Primary Clarifier approved by UPJN. , QAP, Date Sheet and GAD of Chlorination System pending with Concessionaire.\nQAP of Filter Belt Press pending with Concessionaire., Revised QAP of Pumps to be submitted by Concessionaire. Revised GAD of MPS pending with Concessionaire. Work in progress at only 1 front of STP, Concessionaire need to open multiple working fronts.\nInadequate Manpower deployment at site, Manpower deployment to be increased. ESIA/ ESMP under review with World Bank BEP of EPS and Pipeline works has been recommended by PE.','The 3rd and 4th milestones are delayed as the design and drawings have not been submitted by the firm. Due to this work not having started on different fronts.','','2027-02-21','2027-02-11','2026-06-16 07:39:10'),(17,17,10,12,16,'I&D and STP works at Saharanpur','NGP2-EAP','HAM','2022-06-16',577.23,266.34,20.55,290.34,1,135.00,61,343.88,'2025-11-01','2027-10-31','','+0.15 25.65','+0.00 46.62','2026-06-08','LOA issue on dt. 26.07.2024. CA signed on dated 27.09.2024. Financial Closure documents submitted in NMCG, is under scrutiny. About 6.0 m level differnces as given in tender document and actual site level. as discussed NMCG meeting held on 07.01.2025. In the review meeting on 25.04.25 at NMCG, UPJN-R/PE were asked to work out on the possible alternatives options like retaining wall option, backfilling option or others etc. Post which UPJN-R and PE had to work on optimization of the solution and comeback with all possible solution.\nAccordingly, additional cost implication worth Rs. 81 crore for STP due to level difference sent to NMCG on 21.04.25 Out of various feasible technical solutions to counter the implication arose due to mis-match of site data, option no. 4 has been approved in-principle by NMCG and communicated vide letter no. Pr-13011/1/2022 – O/o PS NMCG dated 03.10.2025. Concessionaire have to submit the detailed estimate with in one month. Effective date of start  01.11.2025  given to concessionaire vide Lt. 1077/122(Namami Gange)132 dt. 31.10.2025','','','2027-11-01','2027-11-01','2026-06-16 07:39:10'),(18,18,18,NULL,17,'Interception & Diversion Of 14 Untapped Drains Of Kanpur City (Along with Supplementary Works)','NGP2-NON EAP','DBOT','2025-05-02',138.11,97.17,7.77,2.03,0,0.00,14,79.39,'2026-01-09','2027-09-08','','+0.00 2.47','+0.00 0.00','2026-06-08','','','','2027-09-08','2027-07-08','2026-06-16 07:39:10'),(19,19,19,13,18,'Interception, Diversion of Balance 13 drains and Augmentation of Salori STP capacity by 43 MLD (Sewerage District-C) at Prayagraj Uttar Pradesh under DBOT mode','NGP','DBOT','2023-03-14',331.75,180.27,11.22,140.27,1,43.00,13,204.40,'2024-03-19','2025-08-18','','+0.04 94.82','+18.03 99.95','2026-06-08','Casting of 10th  Lift of Wall at AB Culvert SPS has been completed.Compound wall & Sinking  work is under progress 2670 m laying of Rising main completed. Balance Laying is under progress. Sitaram Ghat SPS- RCC work for wet well is under progress. 1600 m laying of gravity intercepter line has been completed. Manhole construction work is under progress. RCC work for I&D is under progress. 43 MLD Salori STP partially commissioned on dated 31.12.2025. RCC work for PTU, SBR Basin, CCT Unit, MCC Room ,Chlorination room, Air Blower, Sludge Dewatering Unit  & TEPS is completed. RCC work for chlorine tonner yard is under Progress. Tiles, putti, painting and other finishing work for all unit of STP is under Progress. RCC work completed  for Admin Building and Staff quarter, Brick work & Plaster is under progress.','Progress was hampered due to site submergence in 2024,  Construction of River front road, Mahakumbh-2025 and site submergence in 2025 during monsoon.','','2026-04-30','2026-04-30','2026-06-16 07:39:10'),(20,20,19,13,19,'Interception, Diversion of Balance 7 drains and Augmentation of Rajapur STP capacity by 90 MLD (Sewerage District-D) at Prayagraj Uttar Pradesh under DBOT mode','NGP','DBOT','2023-01-27',475.98,242.85,15.24,217.89,1,90.00,7,309.74,'2024-08-24','2026-02-23','','+0.81 80.34','+52.88 115.28','2026-06-08','Plinth Beam Casting is Completed for PTU, Column Casting is under Progress. RCC work &  Hydro test of SBR Basin 1,3& 4 is completed. Walkway & channel work is under progress RCC work & Hydro test of CCT  is completed. RCC work of TEPH  is completed. Mechanical work is in progress. RCC work of  workshop Building,sub station Building is completed, Finishing work is under progress. RCC work for Air Blower Building is completed . Finishing work is under progress. Admin Building &  BFP building - RCC work is under Progress. RCC work is under progress for  Rajapur 56 mld MPS. RCC work is under progress for Mumfordganj 39 mld MPS. Shifting of Existing Rising main inside Mumfordganj SPS Campus work is completed. 2950 m laying of Rising main completed. Balance Laying is under progress. 1272 m laying of Gravity main (Sadar Bazar) & 2342 m laying of Gravity main (Sankar Ghat) completed Balance Laying is under progress RCC work completed for 5 Nos I&D , work is under progress for 1 Nos. I&D. Work was hampered due to Vehical restriction and overcrowding during Mahakumbh -2025, River Front road construction and Flood in 2024 & 2025.','Work was hampered due to Vehical restriction and overcrowding during Mahakumbh -2025, River Front road construction and Flood in 2024 &2025.','','2026-02-23','2026-02-23','2026-06-16 07:39:10'),(21,21,19,13,20,'Interception, Diversion of Balance discharge of 02 drains and 50 MLD STP to Augment existing Treatment Capacity (80 MLD) Naini STP for Sewerage District-A at Prayagraj Uttar Pradesh under DBOT mode','NGP','DBOT','2023-09-05',186.47,83.71,5.44,97.32,1,50.00,2,95.57,'2025-03-04','2026-07-03','','+0.38 68.33','+28.87 37.35','2026-06-08','Gates and screen installation work in PTU is under progress Gas engine Building Excavation work started at site Concreting work of Grid Slab of SBR basin-1, 2 3 &4  is completed and shuttering, reinforcement and concreting work of basin wall - 1 2  3 & 4 upto 100% height is completed. Walkway work also completed . Gravel padding, PCC and Reinforcement of CCT raft  Wall  & Walkway is completed Excavation, Reinforcement and Concreting work upto slab level is completed in PTU Walkway work is completed. Piling work of I&D Structure is completed. Wet Well of SPS is completed. Casting of columns of claritubesettler is completed and shuttering work of beam and grade slab is completed. Staff quarter upto ground floor column is completed and Shuttering and reinforcement work for Ground Floor beam and slab is completed. Gravel padding, PCC and raft of Admin Building is completed and reinforcement & shuttering work of plinth beam is completed. Finishing work of Security Cabin is completed. Workshop Building Footing work is completed column work is in progress. Dewatering Building foundation completed Column work is also completed. Decenter Blower clorination system Gate Screen, Screw Press Screen and diffuser  is receieved at site. Approach bridge Pilling work in completed. BEP of 50 MLD STP has been approved. Structure design & drawing of SBR, Claritube settler, Staff quarter, CCT, PTU, Admin Building cum Blower Room and Workshop Building has been approved. Excavation, PCC of work shop building is completed Column work is under progress. Soil testing of STP & SPS site has been completed. BEP and Structure design and drawing has been Approved for 2.90 MLD Bargad Ghat SPS. Survey, Design and Drawing work of remaining structure is in progress.','Site submergence during flood period. \nFirm has requested for technology change and the same was rejected by NMCG, New Delhi on dated 27.05.2025','Notice regarding LD has been issued to the firm for delay','2026-07-03','2026-07-03','2026-06-16 07:39:10'),(22,22,3,16,21,'Mathura sewerage scheme (I&D and STP Works for balance drain)','NGP2-NON EAP','HAM','2022-09-07',292.56,149.85,9.61,133.10,1,60.00,4,240.01,'2024-11-30','2026-11-29','','+0.83 84.27','+0.00 155.37','2026-06-08','LOA issued to L1 Bidder on on 27.09.2023. CA signed on 12.12.2023. Effective date of start shall be to concessionaire after financial closure. Effective date of start has been given to concessionaire as 30.11.2024. IPS Kala Patthar civil work and its Rising main has been completed SBR basin and MPS construction work is in progress in STP premises. Dairy farm IPS rising main laying work is in progress.','No Delay','-','2026-11-30','2026-11-30','2026-06-16 07:39:10'),(23,23,23,NULL,22,'Pollution Abatement Of Gomti River (Phase 1 Part 1) Lucknow','NGP','DBOT','2024-07-29',240.93,123.45,6.97,110.51,2,42.50,2,187.90,'2024-09-07','2026-06-06','','+0.02 92.56','+0.00 128.44','2026-06-09','39 MLD STP Daulatganj Operation & Maintenance started on dt. 05.11.2024. SBR Basin -Hydro testing work completed.  CCT -  Hydro testing work completed.  MPS - Sump wall 7th lift and coarse screen chamber wall 3rd lift reinforcement & shuttering work is in progress. PTU - Wall reinforcement, shuttering and casting work is in progress. HT Building - Plaster work is in progress. Admin Building - Ist floor roof slab shuttering work is in progress.  SHU - Column above Plinth beam work is in progress. Transformer yard - Casting work is completed. DG Platform - Casting work is completed. Supply of Decanter & Defuser completed. Supply of PLC Panel, Motor of MPS, RAS, SAS Pump  & Blower completed. Decanter installation work is in progress.','Slow progress by firm.','L.D. imposed Rs. 66,74,000.00 on firm','2026-06-06','2026-07-06','2026-06-16 07:39:10'),(24,24,23,17,22,'Pollution Abatement of Gomti River (Phase-II, Part-I) Lucknow','NGP','DBOT','2023-01-30',264.67,137.55,8.53,118.60,1,50.00,3,187.74,'2024-06-14','2026-03-13','','+0.44 22.70','+0.00 24.12','2026-06-09','Design & Drawing work is in progress. SBR Basin  4 - Common wall 3rd lift reinforcement, shuttering and casting work is in progress. SBR Basin 3- Decanter wall 3rd lift and selector zone wall 3rd lift reinforcement shuttering & casting work is in progress. SBR Basin 2 - Selector zone  outer wall 3rd lift reinforcement, shuttering and casting work is in progress. SBR Basin 1 -Excavation work is in progress. IPS - Wall 1st lift reinforcement & shuttering  work is in progress. Faizullaganj (U/S) I&D - Approach drain excavation, PCC, reinforcement, shuttering and casting work is in progress.','Slow progress by firm.','L.D. imposed Rs. 64,13,000.00 on firm','2026-04-13','2026-04-13','2026-06-16 07:39:10');
/*!40000 ALTER TABLE `sewerage_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:02
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:03
CREATE DATABASE  IF NOT EXISTS `weekly_progress_of_namami_gange_completed_projects` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `weekly_progress_of_namami_gange_completed_projects`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: weekly_progress_of_namami_gange_completed_projects
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
-- Table structure for table `agencies`
--

DROP TABLE IF EXISTS `agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agencies` (
  `agency_id` int NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`agency_id`),
  UNIQUE KEY `agency_name` (`agency_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencies`
--

LOCK TABLES `agencies` WRITE;
/*!40000 ALTER TABLE `agencies` DISABLE KEYS */;
INSERT INTO `agencies` VALUES (10377,'M/s Anandi Lal Lalpuriya JV M/s Krishna  Contractors JV M/s Khilari  SS'),(10382,'M/S C.S. ENTERPRISES'),(10368,'M/s Eco Protection Engineer Pvt Ltd'),(10370,'M/s EIEPL Bareilly Infra Engineers Ltd'),(10396,'M/s EIEPL- ABI(JV)'),(10386,'M/S Elefo Biotech Pvt Limited'),(10372,'M/s EMS India Pvt Limited JV with M/s UEM India Pvt Ltd'),(10398,'M/s Enviro Infra Engineers limited MTS JV'),(10380,'M/S G.S.J. Envo Limited'),(10385,'M/s Hindustan Engineering, Lucknow'),(10374,'M/S HNB Engineers Private Ltd.'),(10369,'M/s ICPL-OASIS-LNA (JV)'),(10381,'M/s Kanpur River Management Pvt. Ltd.'),(10397,'M/s KRMPL Kanpur'),(10393,'M/s L&T Construction, WSW & C-IC, Network Project'),(10388,'M/s Larsen & Toubro Limited'),(10371,'M/s Laxmi Construction & Co JV M/s Backcone Enterprises JV M/s Oasis OPC Solution'),(10376,'M/s Mirzapur Ghazipur STPs Private Limited'),(10389,'M/S Muzaffarnagar STP Pvt Ltd'),(10384,'M/s MWMPL Pvt Ltd'),(10394,'M/s Passavant Energy & Environment'),(10391,'M/s Prayagraj Water Private Limited'),(10392,'M/s Ramky Infrastructure Ltd.'),(10367,'M/S Satish kumar &co.'),(10375,'M/s Shree- Tech Construction'),(10383,'M/S Shrishti Sam Lain Yogi JV'),(10395,'M/s SIPL RKC JV'),(10399,'M/s SNET- N&S –RISPL JV'),(10378,'M/s SPML- PPPL JV'),(10379,'M/S Surendra Singh'),(10390,'M/s UEM India Pvt Ltd'),(10401,'M/s Varanasi STP Project Pvt. Ltd'),(10373,'M/s VVIP-BCPL Joint Venture'),(10387,'Moradabad STP Pvt Ltd'),(10400,'Pkg-1- M/s EMS Infracon Pvt. Ltd, Pkg-2- M/s UEM India Pvt. Ltd, Pkg-3- M/s Va Tech Wabag Ltd, Pkg-4- M/s Sriram EPC Ltd and Pkg-5- M/s Kirloskar Brothers Ltd');
/*!40000 ALTER TABLE `agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `district_id` int NOT NULL,
  `city_name` varchar(255) NOT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `uk_city` (`district_id`,`city_name`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (9184,6529,'Ayodhya'),(9185,6529,'Faizabad'),(9186,6530,'Baghpat'),(9187,6531,'Bareilly'),(9188,6532,'Anupshehar'),(9189,6532,'Narora'),(9190,6533,'Etawah'),(9191,6534,'Farrukhabad-Fatehgarh'),(9192,6535,'Firozabad'),(9193,6536,'Ghazipur'),(9194,6537,'Garmukteshwar'),(9195,6538,'Jaunpur'),(9196,6539,'Kannauj'),(9198,6540,'Bithoor'),(9197,6540,'Kanpur Nagar'),(9199,6541,'Kasganj'),(9200,6542,'Mathura'),(9201,6542,'Vrindavan'),(9202,6543,'Chunar'),(9203,6543,'Mirzapur'),(9204,6544,'Moradabad'),(9205,6545,'Budhana'),(9206,6545,'Muzzaffarnagar'),(9208,6546,'Naini, Jhunsi, Phaphamau'),(9207,6546,'Prayagraj'),(9209,6547,'Kairana'),(9210,6548,'Sultanpur'),(9211,6549,'Shuklaganj'),(9212,6549,'Unnao'),(9214,6550,'Ramnagar'),(9213,6550,'Varanasi');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `district_id` int NOT NULL AUTO_INCREMENT,
  `district_name` varchar(255) NOT NULL,
  PRIMARY KEY (`district_id`),
  UNIQUE KEY `district_name` (`district_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6551 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (6529,'Ayodhya'),(6530,'Baghpat'),(6531,'Bareilly'),(6532,'Bulandshahr'),(6533,'Etawah'),(6534,'Farrukhabad'),(6535,'Firozabad'),(6536,'Ghazipur'),(6537,'Hapur'),(6538,'Jaunpur'),(6539,'Kannauj'),(6540,'Kanpur Nagar'),(6541,'Kasganj'),(6542,'Mathura'),(6543,'Mirzapur'),(6544,'Moradabad'),(6545,'Muzaffarnagar'),(6546,'PrayagRaj'),(6547,'Shamli'),(6548,'Sultanpur'),(6549,'Unnao'),(6550,'Varanasi');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sewerage_projects`
--

DROP TABLE IF EXISTS `sewerage_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sewerage_projects` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `sr_no` int DEFAULT NULL,
  `district_id` int NOT NULL,
  `city_id` int DEFAULT NULL,
  `agency_id` int DEFAULT NULL,
  `project_name` varchar(1000) NOT NULL,
  `scheme_type` varchar(100) DEFAULT NULL,
  `project_mode` varchar(100) DEFAULT NULL,
  `sanction_date` date DEFAULT NULL,
  `sanction_cost` decimal(15,2) DEFAULT NULL,
  `work_cost` decimal(15,2) DEFAULT NULL,
  `centage` decimal(15,2) DEFAULT NULL,
  `om_cost` decimal(15,2) DEFAULT NULL,
  `stp_count` int DEFAULT NULL,
  `stp_capacity` decimal(15,2) DEFAULT NULL,
  `drain_count` int DEFAULT NULL,
  `agreement_cost` decimal(15,2) DEFAULT NULL,
  `remarks` longtext,
  `scrape_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_id`),
  KEY `district_id` (`district_id`),
  KEY `city_id` (`city_id`),
  KEY `agency_id` (`agency_id`),
  CONSTRAINT `sewerage_projects_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`),
  CONSTRAINT `sewerage_projects_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`),
  CONSTRAINT `sewerage_projects_ibfk_3` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13069 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sewerage_projects`
--

LOCK TABLES `sewerage_projects` WRITE;
/*!40000 ALTER TABLE `sewerage_projects` DISABLE KEYS */;
INSERT INTO `sewerage_projects` VALUES (13025,1,6529,9184,10367,'I&D of Drains at Ayodhya-Ayodhya. DBOT, NGP','NGP','DBOT','2018-06-11',37.67,16.26,1.10,20.31,0,0.00,5,29.03,NULL,'2026-06-16 09:27:59'),(13026,2,6529,9185,10368,'Pollution Abatement Works for River Saryu/Ghaghara at Faizabad town, District-Ayodhya (Interception & Diversion of Drains with 33 MLD STP)','NGP','HAM','2021-05-06',221.66,109.03,7.62,105.01,1,33.00,15,149.47,'Completed','2026-06-16 09:27:59'),(13027,3,6530,9186,10369,'I&D and STP works at Bagpat','NGP','DBOT','2019-02-19',77.36,38.72,2.66,35.98,1,14.00,4,65.49,NULL,'2026-06-16 09:27:59'),(13028,4,6531,9187,10370,'Development of Sewage Treatment Plant at Bareilly','NGP','HAM','2019-01-03',271.39,139.44,10.70,121.25,3,63.00,15,233.72,NULL,'2026-06-16 09:27:59'),(13029,5,6532,9188,10371,'Anupshahar Sewerage Scheme','EAP','DBOT','2014-05-19',75.79,67.12,5.27,3.40,2,2.50,2,69.30,'Scheme Handed over to Local Bodies on dated 30.06.2024. After the said date, the operation and maintenance of the scheme is being done by Local Bodies.','2026-06-16 09:27:59'),(13030,6,6532,9189,10372,'Narora Sewerage Scheme','EAP','DBOT','2014-03-04',48.45,39.73,2.26,6.46,1,4.00,1,37.73,'Scheme Handed over to Local Bodies. The operation and maintenance of the scheme is being done by Local Bodies from 01.08.2025.','2026-06-16 09:27:59'),(13031,7,6533,9190,10373,'Etawah Sewerage Scheme ( Interception & Diversion Works) DIstt- Etawah','NGP1-NON EAP','DBOT','2019-02-28',140.60,56.85,3.90,79.85,1,21.00,2,119.93,'work completed. O&M in progress','2026-06-16 09:27:59'),(13032,8,6534,9191,10374,'I&D and STP works at Farrukhabad-Fatehgarh','NGP','HAM','2021-02-09',261.12,188.71,6.98,72.41,2,47.70,8,252.41,'Work Completed. Operation and Maintenance works under progress by M/S HNB Eng. Pvt. Ltd. Pune.','2026-06-16 09:27:59'),(13033,9,6535,9192,10375,'Firozabad Sewerage Scheme ( Interception & Diversion Works)  Distt Firozabad','NGP1-NON EAP','DBOT','2019-03-01',51.08,23.92,1.63,25.53,0,0.00,4,42.43,'work completed. O&M in progress','2026-06-16 09:27:59'),(13034,10,6536,9193,10376,'Sewerage, Sewage Treatment & Disposal for Ghazipur, U.P.','NGP','HAM','2020-05-06',152.83,50.96,4.08,96.17,1,21.00,23,140.94,'STP has been commissioned. Proposal of Additional cost implication approved by NMCG in EC meeting dt 13.02.2024. Work of TEPS and retaining wall is in progress. Works as per original agreement completed. Additional Work in progress','2026-06-16 09:27:59'),(13035,11,6537,9194,10377,'Garhmukteshwar Sewerage Scheme.','Non EAP','DBOT','2011-02-24',46.51,40.68,3.25,2.58,2,9.00,2,32.71,'Work completed. O&M in progress','2026-06-16 09:27:59'),(13036,12,6538,9195,10378,'Interception & Diversion  (I&D)  of Drains and Sewerage Treatment Plant at Jaunpur , U.P.','NGP','DBOT','2019-02-12',206.05,119.01,9.25,63.91,1,30.00,14,164.00,'Project under O&M by UPJN(Rural)','2026-06-16 09:27:59'),(13037,13,6539,9196,10379,'Kannauj Sewerage Scheme Phase II','Non EAP','DBOT','2011-02-24',43.66,37.77,3.63,2.26,0,0.00,0,39.65,'O&M works are being done by NPP, Kannauj.','2026-06-16 09:27:59'),(13038,14,6540,9197,10380,'I and D  of Sisamau and 5 other drains','NGP','DBOT','2016-10-03',63.80,57.63,4.61,1.55,0,0.00,3,57.12,'O&M work is in progress by M/s KRMPL under One city One operator.','2026-06-16 09:27:59'),(13039,15,6540,9197,10381,'I&D and STP works at Kanpur-Pankha','NGP','HAM','2018-03-12',967.23,248.39,31.05,718.84,1,30.00,3,708.70,'30 MLD STP Panka commissioned on dated 24.06.2023 and renovation work of 130 MLD STP Jajmau has been completed & COD issued on 17.10.2025. O&M work is in progress by M/s KRMPL under One city One operator.','2026-06-16 09:27:59'),(13040,16,6540,9198,10382,'Interception Diversion and Treatment works at Bithoor Town Kanpur','NGP','DBOT','2017-10-16',13.40,10.75,0.70,2.45,1,1.30,6,9.99,'Operation & Maintenance work under progress by M/S CS Enterprises','2026-06-16 09:27:59'),(13041,17,6540,9197,10383,'Sewerage Works in Sewerage Dist 1 Kanpur','NGP','DBOT','2016-10-18',430.49,392.82,23.81,12.86,0,0.00,3,418.31,'Operation & Maintenance work under progress by M/s Shristi Sam lain Yogi (JV)','2026-06-16 09:27:59'),(13042,18,6541,9199,10373,'Interception & Diversion (I&D) of drains and Sewerage Treatment Plant at Kasganj','NGP1-NON EAP','DBOT','2018-12-24',76.73,36.60,2.49,37.64,1,15.00,2,67.56,'* work completed. \n* O&M in progress','2026-06-16 09:27:59'),(13043,19,6542,9200,10384,'Rehabilation / Upgradation of Mathura Sewerage Scheme','NGP1-NON EAP','HAM','2017-12-13',460.45,264.39,8.78,187.28,1,30.00,19,437.95,'Work completed O&M in progress','2026-06-16 09:27:59'),(13044,20,6542,9201,10385,'Rehabilitation of Sewerage Infrastructure and Augmentation/upgradation of STP at Vrindavan','NGP1-NON EAP','DBOT','2017-03-29',42.82,14.76,1.18,26.88,1,4.00,3,33.50,'O&M  is Running','2026-06-16 09:27:59'),(13045,21,6543,9202,10386,'Faecal Sludge Management for abatement of pollution in River Ganga at Chunar, Mirzapur, U.P.','NGP','DBOT','2019-03-07',2.70,1.93,0.29,0.48,0,0.00,14,2.05,'Project under O&M by UPJN(Rural)','2026-06-16 09:27:59'),(13046,22,6543,9203,10376,'Interception & Diversion and STP at Mirzapur, U.P.','NGP','HAM','2020-05-28',129.08,50.50,4.04,73.06,2,17.00,18,151.58,'Temporary arrangement for discharge of treated effluent into existing channel completed. Permission for discharge of treated effluent yet to be obtained. DGC denied recommendation for discharge in irrigation canal. Now location for discharge is identified 02 KM downstream of canal into Khajuri River for which draft variation proposal was sent to NMCG. In meeting dt 07.06.2024 under chairmanship of ED(P) NMCG it is directed to send the variation proposal through UPJN(HQ)/SMCG for approval which is submitted to CE(Ganga) on 14.06.2024 Works completed. Balance work shall be completed after approval of variation','2026-06-16 09:27:59'),(13047,23,6544,9204,10387,'Interception & Diversion (I&D) of Drains and Sewerage Treatment Plant at Moradabad zone 2','NGP','HAM','2018-07-23',118.69,53.53,3.52,61.64,1,25.00,5,113.85,'STP under O&M','2026-06-16 09:27:59'),(13048,24,6544,9204,10388,'Prevention of Pollution of River Ramganga at Moradabad','Non EAP','DBOT','2011-02-24',330.03,278.85,19.03,32.17,1,58.00,14,244.00,'Under O&M','2026-06-16 09:27:59'),(13049,25,6545,9205,10389,'I&D and STP Work in Budhana Town','Non EAP','HAM','2019-02-18',48.76,25.10,1.70,21.96,1,10.00,3,41.28,'Commercial Operation Date declared, Plant under O&M since 01.04.2024.','2026-06-16 09:27:59'),(13050,26,6545,9206,10389,'I&D and STP Work in Muzaffarnagar','NGP','HAM','2020-01-13',234.03,108.32,7.33,118.36,2,54.50,5,205.09,'22 MLD STP Sahawali: Commercial Operation Date declared, Plant under O&M since 01.04.2024. 32.5 MLD Kidwai Nagar:Commercial Operation Date declared, Plant under O&M since 01.07.2024.','2026-06-16 09:27:59'),(13051,27,6546,9207,10390,'14 MLD Capacity STP at Salori Allahabad','NGRBA EAP','DBOT','2020-07-09',39.36,24.25,1.90,13.21,1,14.00,0,53.39,'In O&M under UPJN (Urban)','2026-06-16 09:27:59'),(13052,28,6546,9208,10391,'I&D and STP works for Naini (District-G) and Jhunsi works),  Phaphamau (District-F)','NGP','HAM','2019-05-19',767.59,280.14,21.66,465.79,3,72.00,18,350.60,'Under O&M','2026-06-16 09:27:59'),(13053,29,6546,9207,10391,'Rehabilitation and Operation & Maintenance of existing Sewage Treatment Infrastructure at Allahabad Uttar Pradesh under Hybrid Annuity based PPP Mode','NGP','HAM','2018-03-09',904.00,58.15,0.00,845.85,0,0.00,16,557.60,'Under O&M Rehabilitation of 3 no of STP of Capacity 29,60 and 60 MLD STP and associated MPS/SPS','2026-06-16 09:27:59'),(13054,30,6546,9207,10372,'Sewer Network in District E of Allahabad Part-II','NGRBA EAP','DBOT','2016-09-28',52.78,48.90,3.88,0.00,0,0.00,0,46.69,NULL,'2026-06-16 09:27:59'),(13055,31,6546,9207,10374,'Sewerage and Non Sewerage Schemes for Pollution abatement of River Ganga at Allahabad District B&EU.P','Non EAP','DBOT','2010-05-06',207.39,187.53,19.86,0.00,3,85.00,0,118.20,NULL,'2026-06-16 09:27:59'),(13056,32,6546,9207,10392,'Sewerage and Non Sewerage Schemes for Pollution abatement of River Ganga at Allahabad U.P District A','EAP','DBOT','2010-05-06',97.95,97.95,0.00,0.00,1,20.00,0,97.95,NULL,'2026-06-16 09:27:59'),(13057,33,6546,9207,10393,'Sewerage Scheme for District A','NGRBA EAP','DBOT','2019-11-11',299.39,269.10,19.75,10.54,0,0.00,0,292.29,'Under O&M','2026-06-16 09:27:59'),(13058,34,6546,9207,10372,'Sewerage Scheme for District B','NGRBA EAP','DBOT','2019-11-11',300.84,278.28,18.81,3.75,0,0.00,0,280.86,'Under O&M','2026-06-16 09:27:59'),(13059,35,6546,9207,10394,'Sewerage Scheme for District C','NGRBA EAP','DBOT','2019-09-13',170.95,154.01,9.87,7.07,0,0.00,0,165.41,'Under O&M','2026-06-16 09:27:59'),(13060,36,6546,9207,10390,'Sewerage work in Sewerage District E of Allahabad','NGRBA EAP','DBOT','2011-02-22',142.00,126.70,6.57,8.73,0,0.00,0,123.05,NULL,'2026-06-16 09:27:59'),(13061,37,6547,9209,10395,'I&D and STP Work in Kairana','CGF','DBOT','2020-12-07',78.42,37.28,2.63,38.51,1,15.00,1,59.19,'Commercial Operation Date declared, Plant under O&M since 01.03.2025.','2026-06-16 09:27:59'),(13062,38,6548,9210,10396,'I&D of Drains and Sewerage Treatment Plant works with 15 Years O&M at Sultanpur','NGP','DBOT','2018-12-24',70.18,40.83,2.59,26.76,3,17.00,6,67.59,'10 MLD Oxidation Pond upgradation completed. SCADA works under progress. 2 MLD STP work completed. SCADA wortks in progress 5MLD STP work completed. SCADA works under progress.','2026-06-16 09:27:59'),(13063,39,6549,9211,10397,'I&D of Drains and STP works in Shuklaganj (05MLD)','NGP','HAM','2017-07-28',65.18,25.93,1.90,37.35,1,5.00,5,38.87,'Total 7 drains are discharging into River Ganga in NPP Shuklaganj out of which 5 drains of discharge 4.66 MLD has to be Intercepted & Diverted to under Construction 5 MLD STP Shuklaganj and rest of the 02 drains of discharge 7.3 MLD has to be tapped & treated by U.P. J.N. (Urban) under SBM 2 programme. The work of tapping domestic sewage outflow through I&D was completed on 30.12.2025 by tapping 04 drains namely Indira Nagar, Manohar Nagar-1, Manohar Nagar-2 and Railway Bridge and trial run of the scheme has been started. The trial run of the scheme is to be done for 03 months, after which the operation of STP will start at full capacity. The work of cleaning 1.96 km drain and construction of Connecting Drain of 50 meters to bring 01 drain Ganga Vishnu Drain to I&D is to be done by M/s KRMPL','2026-06-16 09:27:59'),(13064,40,6549,9212,10397,'I&D of Drains and STP works in Unnao (15MLD)','NGP','HAM','2017-07-28',102.20,43.73,3.22,55.25,1,15.00,1,68.68,'The overall progress of the project is 99%. All works (Civil/Electrical & Mechanical) of the STP has been completed. Due to the rise in groundwater levels resulting from floods in the Ganga River and rainfall, the construction of the remaining 01 number of Manhole near the STP premises and the Dewatering work remained disrupted from August 2025 to January 2026. Against the Dewatering and dewatering works in 1200 mm RCC Pipe are in progress and dewatering work is being done in a length of 50 meters ahead of MH 37, which will be completed by the concessionaire M/s Kanpur River Management Pvt. Ltd., Kanpur by 15 June 2026','2026-06-16 09:27:59'),(13065,41,6550,9213,10398,'I&D and Treatment works for Assi-BHU Area (Phase-II), Varanasi','NGP','DBOT','2022-10-19',308.09,97.62,7.81,172.94,1,55.00,2,151.55,'55 MLD STP has been  commissioned with the  flow of 8 MLD STP Bhagwanpur STP and IPS are commissioned Finishing works are in progress Power connection of MPS done. MPS shall be commissioned on 18.02.2026 STP under trial-run','2026-06-16 09:27:59'),(13066,42,6550,9214,10399,'Interception, Diversion of Drains & Sewage Treatment Works at Ramnagar, Dist. Varanasi','NGP','DBOT','2017-07-28',71.26,21.89,1.75,45.91,1,10.00,5,69.42,'Project under O&M by UPJN(Rural)','2026-06-16 09:27:59'),(13067,43,6550,9213,10400,'JICA Assisted Ganga Action Plan (GAP) Phase-II, Varanasi','NGP','DBOT','2010-07-14',659.62,629.16,26.21,0.00,1,140.00,5,488.80,'SPS, MPS, 140 MLD STP Dinapur is under O&M by UPJN(Urban)','2026-06-16 09:27:59'),(13068,44,6550,9213,10401,'Sewerage Treatment Plant for Assi-BHU Sewerage District at Ramana, Varanasi','NGP','HAM','2017-09-21',161.31,102.00,8.16,26.11,1,50.00,1,153.15,'Project under O&M by UPJN(Rural)','2026-06-16 09:27:59');
/*!40000 ALTER TABLE `sewerage_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:03
CREATE DATABASE  IF NOT EXISTS `jjm_completed_projects` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jjm_completed_projects`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jjm_completed_projects
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
-- Table structure for table `agencies`
--

DROP TABLE IF EXISTS `agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agencies` (
  `agency_id` int NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(255) NOT NULL,
  PRIMARY KEY (`agency_id`),
  UNIQUE KEY `agency_name` (`agency_name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencies`
--

LOCK TABLES `agencies` WRITE;
/*!40000 ALTER TABLE `agencies` DISABLE KEYS */;
INSERT INTO `agencies` VALUES (11,'M/s Anandi Lal Lalpuriya JV M/s Krishna  Contractors JV M/s Khilari  SS'),(16,'M/S C.S. ENTERPRISES'),(2,'M/s Eco Protection Engineer Pvt Ltd'),(4,'M/s EIEPL Bareilly Infra Engineers Ltd'),(30,'M/s EIEPL- ABI(JV)'),(20,'M/S Elefo Biotech Pvt Limited'),(6,'M/s EMS India Pvt Limited JV with M/s UEM India Pvt Ltd'),(32,'M/s Enviro Infra Engineers limited MTS JV'),(14,'M/S G.S.J. Envo Limited'),(19,'M/s Hindustan Engineering, Lucknow'),(8,'M/S HNB Engineers Private Ltd.'),(3,'M/s ICPL-OASIS-LNA (JV)'),(15,'M/s Kanpur River Management Pvt. Ltd.'),(31,'M/s KRMPL Kanpur'),(27,'M/s L&T Construction, WSW & C-IC, Network Project'),(22,'M/s Larsen & Toubro Limited'),(5,'M/s Laxmi Construction & Co JV M/s Backcone Enterprises JV M/s Oasis OPC Solution'),(10,'M/s Mirzapur Ghazipur STPs Private Limited'),(23,'M/S Muzaffarnagar STP Pvt Ltd'),(18,'M/s MWMPL Pvt Ltd'),(28,'M/s Passavant Energy & Environment'),(25,'M/s Prayagraj Water Private Limited'),(26,'M/s Ramky Infrastructure Ltd.'),(1,'M/S Satish kumar &co.'),(9,'M/s Shree- Tech Construction'),(17,'M/S Shrishti Sam Lain Yogi JV'),(29,'M/s SIPL RKC JV'),(33,'M/s SNET- N&S –RISPL JV'),(12,'M/s SPML- PPPL JV'),(13,'M/S Surendra Singh'),(24,'M/s UEM India Pvt Ltd'),(35,'M/s Varanasi STP Project Pvt. Ltd'),(7,'M/s VVIP-BCPL Joint Venture'),(21,'Moradabad STP Pvt Ltd'),(34,'Pkg-1- M/s EMS Infracon Pvt. Ltd, Pkg-2- M/s UEM India Pvt. Ltd, Pkg-3- M/s Va Tech Wabag Ltd, Pkg-4- M/s Sriram EPC Ltd and Pkg-5- M/s Kirloskar Brothers Ltd');
/*!40000 ALTER TABLE `agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `district_id` int NOT NULL,
  `city_name` varchar(255) NOT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `uk_city` (`district_id`,`city_name`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,1,'Ayodhya'),(2,2,'Faizabad'),(3,3,'Baghpat'),(4,4,'Bareilly'),(5,5,'Anupshehar'),(6,5,'Narora'),(7,6,'Etawah'),(8,7,'Farrukhabad-Fatehgarh'),(9,8,'Firozabad'),(10,9,'Ghazipur'),(11,10,'Garmukteshwar'),(12,11,'Jaunpur'),(13,12,'Kannauj'),(15,13,'Bithoor'),(14,13,'Kanpur Nagar'),(16,14,'Kasganj'),(17,15,'Mathura'),(18,15,'Vrindavan'),(19,16,'Chunar'),(20,16,'Mirzapur'),(21,17,'Moradabad'),(22,18,'Budhana'),(23,18,'Muzzaffarnagar'),(25,19,'Naini, Jhunsi, Phaphamau'),(24,19,'Prayagraj'),(26,20,'Kairana'),(27,21,'Sultanpur'),(28,22,'Shuklaganj'),(29,22,'Unnao'),(31,23,'Ramnagar'),(30,23,'Varanasi');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `district_id` int NOT NULL AUTO_INCREMENT,
  `district_name` varchar(255) NOT NULL,
  PRIMARY KEY (`district_id`),
  UNIQUE KEY `district_name` (`district_name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (2,'Ayodhya'),(1,'Ayodhya UUUUU'),(3,'Baghpat'),(4,'Bareilly'),(5,'Bulandshahr'),(6,'Etawah'),(7,'Farrukhabad'),(8,'Firozabad'),(9,'Ghazipur'),(10,'Hapur'),(11,'Jaunpur'),(12,'Kannauj'),(13,'Kanpur Nagar'),(14,'Kasganj'),(15,'Mathura'),(16,'Mirzapur'),(17,'Moradabad'),(18,'Muzaffarnagar'),(19,'PrayagRaj'),(20,'Shamli'),(21,'Sultanpur'),(22,'Unnao'),(23,'Varanasi');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sewerage_projects`
--

DROP TABLE IF EXISTS `sewerage_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sewerage_projects` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `sr_no` int DEFAULT NULL,
  `district_id` int DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `agency_id` int DEFAULT NULL,
  `project_name` text,
  `scheme_type` varchar(255) DEFAULT NULL,
  `project_mode` varchar(255) DEFAULT NULL,
  `sanction_date` date DEFAULT NULL,
  `sanction_cost` decimal(15,2) DEFAULT NULL,
  `work_cost` decimal(15,2) DEFAULT NULL,
  `centage` decimal(15,2) DEFAULT NULL,
  `om_cost` decimal(15,2) DEFAULT NULL,
  `stp_count` int DEFAULT NULL,
  `stp_capacity` decimal(15,2) DEFAULT NULL,
  `drain_count` int DEFAULT NULL,
  `agreement_cost` decimal(15,2) DEFAULT NULL,
  `remarks` text,
  `scrape_time` datetime DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  KEY `district_id` (`district_id`),
  KEY `city_id` (`city_id`),
  KEY `agency_id` (`agency_id`),
  KEY `idx_sr` (`sr_no`),
  CONSTRAINT `sewerage_projects_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`),
  CONSTRAINT `sewerage_projects_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`),
  CONSTRAINT `sewerage_projects_ibfk_3` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sewerage_projects`
--

LOCK TABLES `sewerage_projects` WRITE;
/*!40000 ALTER TABLE `sewerage_projects` DISABLE KEYS */;
INSERT INTO `sewerage_projects` VALUES (1,1,1,1,1,'I&D of Drains at Ayodhya-Ayodhya. DBOT, NGP','NGP','DBOT','2018-06-11',37.67,16.26,1.10,20.31,0,0.00,5,29.03,NULL,'2026-06-17 15:03:11'),(2,2,2,2,2,'Pollution Abatement Works for River Saryu/Ghaghara at Faizabad town, District-Ayodhya (Interception & Diversion of Drains with 33 MLD STP)','NGP','HAM','2021-05-06',221.66,109.03,7.62,105.01,1,33.00,15,149.47,'Completed','2026-06-17 15:03:11'),(3,3,3,3,3,'I&D and STP works at Bagpat','NGP','DBOT','2019-02-19',77.36,38.72,2.66,35.98,1,14.00,4,65.49,NULL,'2026-06-17 15:03:11'),(4,4,4,4,4,'Development of Sewage Treatment Plant at Bareilly','NGP','HAM','2019-01-03',271.39,139.44,10.70,121.25,3,63.00,15,233.72,NULL,'2026-06-17 15:03:11'),(5,5,5,5,5,'Anupshahar Sewerage Scheme','EAP','DBOT','2014-05-19',75.79,67.12,5.27,3.40,2,2.50,2,69.30,'Scheme Handed over to Local Bodies on dated 30.06.2024. After the said date, the operation and maintenance of the scheme is being done by Local Bodies.','2026-06-17 15:03:11'),(6,6,5,6,6,'Narora Sewerage Scheme','EAP','DBOT','2014-03-04',48.45,39.73,2.26,6.46,1,4.00,1,37.73,'Scheme Handed over to Local Bodies. The operation and maintenance of the scheme is being done by Local Bodies from 01.08.2025.','2026-06-17 15:03:11'),(7,7,6,7,7,'Etawah Sewerage Scheme ( Interception & Diversion Works) DIstt- Etawah','NGP1-NON EAP','DBOT','2019-02-28',140.60,56.85,3.90,79.85,1,21.00,2,119.93,'work completed. O&M in progress','2026-06-17 15:03:11'),(8,8,7,8,8,'I&D and STP works at Farrukhabad-Fatehgarh','NGP','HAM','2021-02-09',261.12,188.71,6.98,72.41,2,47.70,8,252.41,'Work Completed. Operation and Maintenance works under progress by M/S HNB Eng. Pvt. Ltd. Pune.','2026-06-17 15:03:11'),(9,9,8,9,9,'Firozabad Sewerage Scheme ( Interception & Diversion Works)  Distt Firozabad','NGP1-NON EAP','DBOT','2019-03-01',51.08,23.92,1.63,25.53,0,0.00,4,42.43,'work completed. O&M in progress','2026-06-17 15:03:11'),(10,10,9,10,10,'Sewerage, Sewage Treatment & Disposal for Ghazipur, U.P.','NGP','HAM','2020-05-06',152.83,50.96,4.08,96.17,1,21.00,23,140.94,'STP has been commissioned. Proposal of Additional cost implication approved by NMCG in EC meeting dt 13.02.2024. Work of TEPS and retaining wall is in progress. Works as per original agreement completed. Additional Work in progress','2026-06-17 15:03:11'),(11,11,10,11,11,'Garhmukteshwar Sewerage Scheme.','Non EAP','DBOT','2011-02-24',46.51,40.68,3.25,2.58,2,9.00,2,32.71,'Work completed. O&M in progress','2026-06-17 15:03:11'),(12,12,11,12,12,'Interception & Diversion  (I&D)  of Drains and Sewerage Treatment Plant at Jaunpur , U.P.','NGP','DBOT','2019-02-12',206.05,119.01,9.25,63.91,1,30.00,14,164.00,'Project under O&M by UPJN(Rural)','2026-06-17 15:03:11'),(13,13,12,13,13,'Kannauj Sewerage Scheme Phase II','Non EAP','DBOT','2011-02-24',43.66,37.77,3.63,2.26,0,0.00,0,39.65,'O&M works are being done by NPP, Kannauj.','2026-06-17 15:03:11'),(14,14,13,14,14,'I and D  of Sisamau and 5 other drains','NGP','DBOT','2016-10-03',63.80,57.63,4.61,1.55,0,0.00,3,57.12,'O&M work is in progress by M/s KRMPL under One city One operator.','2026-06-17 15:03:11'),(15,15,13,14,15,'I&D and STP works at Kanpur-Pankha','NGP','HAM','2018-03-12',967.23,248.39,31.05,718.84,1,30.00,3,708.70,'30 MLD STP Panka commissioned on dated 24.06.2023 and renovation work of 130 MLD STP Jajmau has been completed & COD issued on 17.10.2025. O&M work is in progress by M/s KRMPL under One city One operator.','2026-06-17 15:03:11'),(16,16,13,15,16,'Interception Diversion and Treatment works at Bithoor Town Kanpur','NGP','DBOT','2017-10-16',13.40,10.75,0.70,2.45,1,1.30,6,9.99,'Operation & Maintenance work under progress by M/S CS Enterprises','2026-06-17 15:03:11'),(17,17,13,14,17,'Sewerage Works in Sewerage Dist 1 Kanpur','NGP','DBOT','2016-10-18',430.49,392.82,23.81,12.86,0,0.00,3,418.31,'Operation & Maintenance work under progress by M/s Shristi Sam lain Yogi (JV)','2026-06-17 15:03:11'),(18,18,14,16,7,'Interception & Diversion (I&D) of drains and Sewerage Treatment Plant at Kasganj','NGP1-NON EAP','DBOT','2018-12-24',76.73,36.60,2.49,37.64,1,15.00,2,67.56,'* work completed. \n* O&M in progress','2026-06-17 15:03:11'),(19,19,15,17,18,'Rehabilation / Upgradation of Mathura Sewerage Scheme','NGP1-NON EAP','HAM','2017-12-13',460.45,264.39,8.78,187.28,1,30.00,19,437.95,'Work completed O&M in progress','2026-06-17 15:03:11'),(20,20,15,18,19,'Rehabilitation of Sewerage Infrastructure and Augmentation/upgradation of STP at Vrindavan','NGP1-NON EAP','DBOT','2017-03-29',42.82,14.76,1.18,26.88,1,4.00,3,33.50,'O&M  is Running','2026-06-17 15:03:11'),(21,21,16,19,20,'Faecal Sludge Management for abatement of pollution in River Ganga at Chunar, Mirzapur, U.P.','NGP','DBOT','2019-03-07',2.70,1.93,0.29,0.48,0,0.00,14,2.05,'Project under O&M by UPJN(Rural)','2026-06-17 15:03:11'),(22,22,16,20,10,'Interception & Diversion and STP at Mirzapur, U.P.','NGP','HAM','2020-05-28',129.08,50.50,4.04,73.06,2,17.00,18,151.58,'Temporary arrangement for discharge of treated effluent into existing channel completed. Permission for discharge of treated effluent yet to be obtained. DGC denied recommendation for discharge in irrigation canal. Now location for discharge is identified 02 KM downstream of canal into Khajuri River for which draft variation proposal was sent to NMCG. In meeting dt 07.06.2024 under chairmanship of ED(P) NMCG it is directed to send the variation proposal through UPJN(HQ)/SMCG for approval which is submitted to CE(Ganga) on 14.06.2024 Works completed. Balance work shall be completed after approval of variation','2026-06-17 15:03:11'),(23,23,17,21,21,'Interception & Diversion (I&D) of Drains and Sewerage Treatment Plant at Moradabad zone 2','NGP','HAM','2018-07-23',118.69,53.53,3.52,61.64,1,25.00,5,113.85,'STP under O&M','2026-06-17 15:03:11'),(24,24,17,21,22,'Prevention of Pollution of River Ramganga at Moradabad','Non EAP','DBOT','2011-02-24',330.03,278.85,19.03,32.17,1,58.00,14,244.00,'Under O&M','2026-06-17 15:03:11'),(25,25,18,22,23,'I&D and STP Work in Budhana Town','Non EAP','HAM','2019-02-18',48.76,25.10,1.70,21.96,1,10.00,3,41.28,'Commercial Operation Date declared, Plant under O&M since 01.04.2024.','2026-06-17 15:03:11'),(26,26,18,23,23,'I&D and STP Work in Muzaffarnagar','NGP','HAM','2020-01-13',234.03,108.32,7.33,118.36,2,54.50,5,205.09,'22 MLD STP Sahawali: Commercial Operation Date declared, Plant under O&M since 01.04.2024. 32.5 MLD Kidwai Nagar:Commercial Operation Date declared, Plant under O&M since 01.07.2024.','2026-06-17 15:03:11'),(27,27,19,24,24,'14 MLD Capacity STP at Salori Allahabad','NGRBA EAP','DBOT','2020-07-09',39.36,24.25,1.90,13.21,1,14.00,0,53.39,'In O&M under UPJN (Urban)','2026-06-17 15:03:11'),(28,28,19,25,25,'I&D and STP works for Naini (District-G) and Jhunsi works),  Phaphamau (District-F)','NGP','HAM','2019-05-19',767.59,280.14,21.66,465.79,3,72.00,18,350.60,'Under O&M','2026-06-17 15:03:11'),(29,29,19,24,25,'Rehabilitation and Operation & Maintenance of existing Sewage Treatment Infrastructure at Allahabad Uttar Pradesh under Hybrid Annuity based PPP Mode','NGP','HAM','2018-03-09',904.00,58.15,0.00,845.85,0,0.00,16,557.60,'Under O&M Rehabilitation of 3 no of STP of Capacity 29,60 and 60 MLD STP and associated MPS/SPS','2026-06-17 15:03:11'),(30,30,19,24,6,'Sewer Network in District E of Allahabad Part-II','NGRBA EAP','DBOT','2016-09-28',52.78,48.90,3.88,0.00,0,0.00,0,46.69,NULL,'2026-06-17 15:03:11'),(31,31,19,24,8,'Sewerage and Non Sewerage Schemes for Pollution abatement of River Ganga at Allahabad District B&EU.P','Non EAP','DBOT','2010-05-06',207.39,187.53,19.86,0.00,3,85.00,0,118.20,NULL,'2026-06-17 15:03:11'),(32,32,19,24,26,'Sewerage and Non Sewerage Schemes for Pollution abatement of River Ganga at Allahabad U.P District A','EAP','DBOT','2010-05-06',97.95,97.95,0.00,0.00,1,20.00,0,97.95,NULL,'2026-06-17 15:03:11'),(33,33,19,24,27,'Sewerage Scheme for District A','NGRBA EAP','DBOT','2019-11-11',299.39,269.10,19.75,10.54,0,0.00,0,292.29,'Under O&M','2026-06-17 15:03:11'),(34,34,19,24,6,'Sewerage Scheme for District B','NGRBA EAP','DBOT','2019-11-11',300.84,278.28,18.81,3.75,0,0.00,0,280.86,'Under O&M','2026-06-17 15:03:11'),(35,35,19,24,28,'Sewerage Scheme for District C','NGRBA EAP','DBOT','2019-09-13',170.95,154.01,9.87,7.07,0,0.00,0,165.41,'Under O&M','2026-06-17 15:03:11'),(36,36,19,24,24,'Sewerage work in Sewerage District E of Allahabad','NGRBA EAP','DBOT','2011-02-22',142.00,126.70,6.57,8.73,0,0.00,0,123.05,NULL,'2026-06-17 15:03:11'),(37,37,20,26,29,'I&D and STP Work in Kairana','CGF','DBOT','2020-12-07',78.42,37.28,2.63,38.51,1,15.00,1,59.19,'Commercial Operation Date declared, Plant under O&M since 01.03.2025.','2026-06-17 15:03:11'),(38,38,21,27,30,'I&D of Drains and Sewerage Treatment Plant works with 15 Years O&M at Sultanpur','NGP','DBOT','2018-12-24',70.18,40.83,2.59,26.76,3,17.00,6,67.59,'10 MLD Oxidation Pond upgradation completed. SCADA works under progress. 2 MLD STP work completed. SCADA wortks in progress 5MLD STP work completed. SCADA works under progress.','2026-06-17 15:03:11'),(39,39,22,28,31,'I&D of Drains and STP works in Shuklaganj (05MLD)','NGP','HAM','2017-07-28',65.18,25.93,1.90,37.35,1,5.00,5,38.87,'Total 7 drains are discharging into River Ganga in NPP Shuklaganj out of which 5 drains of discharge 4.66 MLD has to be Intercepted & Diverted to under Construction 5 MLD STP Shuklaganj and rest of the 02 drains of discharge 7.3 MLD has to be tapped & treated by U.P. J.N. (Urban) under SBM 2 programme. The work of tapping domestic sewage outflow through I&D was completed on 30.12.2025 by tapping 04 drains namely Indira Nagar, Manohar Nagar-1, Manohar Nagar-2 and Railway Bridge and trial run of the scheme has been started. The trial run of the scheme is to be done for 03 months, after which the operation of STP will start at full capacity. The work of cleaning 1.96 km drain and construction of Connecting Drain of 50 meters to bring 01 drain Ganga Vishnu Drain to I&D is to be done by M/s KRMPL','2026-06-17 15:03:11'),(40,40,22,29,31,'I&D of Drains and STP works in Unnao (15MLD)','NGP','HAM','2017-07-28',102.20,43.73,3.22,55.25,1,15.00,1,68.68,'The overall progress of the project is 99%. All works (Civil/Electrical & Mechanical) of the STP has been completed. Due to the rise in groundwater levels resulting from floods in the Ganga River and rainfall, the construction of the remaining 01 number of Manhole near the STP premises and the Dewatering work remained disrupted from August 2025 to January 2026. Against the Dewatering and dewatering works in 1200 mm RCC Pipe are in progress and dewatering work is being done in a length of 50 meters ahead of MH 37, which will be completed by the concessionaire M/s Kanpur River Management Pvt. Ltd., Kanpur by 15 June 2026','2026-06-17 15:03:11'),(41,41,23,30,32,'I&D and Treatment works for Assi-BHU Area (Phase-II), Varanasi','NGP','DBOT','2022-10-19',308.09,97.62,7.81,172.94,1,55.00,2,151.55,'55 MLD STP has been  commissioned with the  flow of 8 MLD STP Bhagwanpur STP and IPS are commissioned Finishing works are in progress Power connection of MPS done. MPS shall be commissioned on 18.02.2026 STP under trial-run','2026-06-17 15:03:11'),(42,42,23,31,33,'Interception, Diversion of Drains & Sewage Treatment Works at Ramnagar, Dist. Varanasi','NGP','DBOT','2017-07-28',71.26,21.89,1.75,45.91,1,10.00,5,69.42,'Project under O&M by UPJN(Rural)','2026-06-17 15:03:11'),(43,43,23,30,34,'JICA Assisted Ganga Action Plan (GAP) Phase-II, Varanasi','NGP','DBOT','2010-07-14',659.62,629.16,26.21,0.00,1,140.00,5,488.80,'SPS, MPS, 140 MLD STP Dinapur is under O&M by UPJN(Urban)','2026-06-17 15:03:11'),(44,44,23,30,35,'Sewerage Treatment Plant for Assi-BHU Sewerage District at Ramana, Varanasi','NGP','HAM','2017-09-21',161.31,102.00,8.16,26.11,1,50.00,1,153.15,'Project under O&M by UPJN(Rural)','2026-06-17 15:03:11');
/*!40000 ALTER TABLE `sewerage_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:03
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:03
CREATE DATABASE  IF NOT EXISTS `jjm_undertendering_projects` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jjm_undertendering_projects`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jjm_undertendering_projects
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
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `district_id` int NOT NULL,
  `city_name` varchar(255) NOT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `uk_city` (`district_id`,`city_name`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,1,'Aligarh'),(2,2,'(Unknown)'),(3,3,'Lucknow'),(4,4,'(Unknown)'),(5,5,'Bhadohi'),(6,6,'(Unknown)');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `district_id` int NOT NULL AUTO_INCREMENT,
  `district_name` varchar(255) NOT NULL,
  PRIMARY KEY (`district_id`),
  UNIQUE KEY `district_name` (`district_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'Aligar'),(2,'Chandauli'),(3,'Lucknow'),(4,'Moradabad'),(5,'Sant Ravidas Nagar'),(6,'Varanasi');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `undertendering_projects`
--

DROP TABLE IF EXISTS `undertendering_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `undertendering_projects` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `sr_no` int DEFAULT NULL,
  `district_id` int DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `project_name` text,
  `scheme_type` varchar(255) DEFAULT NULL,
  `project_mode` varchar(255) DEFAULT NULL,
  `sanction_date` date DEFAULT NULL,
  `sanction_cost` decimal(15,2) DEFAULT NULL,
  `work_cost` decimal(15,2) DEFAULT NULL,
  `centage` decimal(15,2) DEFAULT NULL,
  `om_cost` decimal(15,2) DEFAULT NULL,
  `stp_count` int DEFAULT NULL,
  `stp_capacity` decimal(15,2) DEFAULT NULL,
  `drain_count` int DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `remarks` text,
  `scrape_time` datetime DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  KEY `district_id` (`district_id`),
  KEY `city_id` (`city_id`),
  KEY `idx_sr` (`sr_no`),
  CONSTRAINT `undertendering_projects_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`),
  CONSTRAINT `undertendering_projects_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `undertendering_projects`
--

LOCK TABLES `undertendering_projects` WRITE;
/*!40000 ALTER TABLE `undertendering_projects` DISABLE KEYS */;
INSERT INTO `undertendering_projects` VALUES (1,1,1,1,'Aligarh Sewerage Scheme (I&D And STP Works)','NGP2-NON EAP','HAM','2024-10-21',496.02,240.02,15.12,240.88,2,113.00,2,'2026-06-16','NOC has been received from NMCG regarding retendering on dt. 21.01.2026 | Draft Tender document has been sent to NMCG for review on dt. 11.02.2026 | Approval on the Draft Tender document has been received from to NMCG on dt. 10.04.2026 | NIT has been published on E-Tender portal on dt. 10.04.2026 | Last date of bid submission is 25.05.2026 | Prebid meeting has been done on 20.04.2026. | prebid query reply has been sent to NMCG on dt 18-05-2026, which is under review. | Last date for bid submission has been extended upto 24-06-2026,as per NMCG instructions. | Approved prebid-reply uploaded on e-tender portal on dated 09-06-2026','2026-06-17 15:03:34'),(2,2,2,2,'I&D and STP works at Pt Deen Dayal Upadhyay Nagar Chandauli','NGP2-NON EAP','HAM','2025-01-22',262.78,95.00,7.60,129.67,1,45.00,2,'2026-05-26','Pre-bid reply sent to NMCG for approval on 14.08.2025 after approval from CE(Ganga) and SMCG | Pre-bid meeting held on 09.07.2025 | Bids will be opened on 19.08.2025 | Draft Pre-bid reply sent to CE(Ganga) on 04.08.2025 | Approved RFP Documents received from NMCG on 18.06.2025. NIT Shall be issued on 21.06.2025 | Date for bid opening extended upto 04.09.2025 | Date of bid opening is 07.10.2025 | AAE&S issued on 22.01.2025 | Revised model RFP Document received from NMCG on 06.05.2025, RFP sent to NMCG on 23.05.2025 for approval | Financial bids opened on 07.01.2026. CBER sent to NMCG on 03.02.2026 for approval | Approval of CBER received from NMCG on 20.02.2026 and communicated by CE(Ganga) on 23.02.2026 | M/s Enviro Infra Engineers Limited has been selected as L1 bidder | LOA issued on 25.02.2026 | Bidder vide its letter  03.03.3036 has requested to waive off the APS imposed for which guidance has been sought from HQ | Letter written to NMCG on 19.05.2026 to take decision about the APS imposed | NIT issued on 21.06.2025. Tender also published on e-Tender portal on 24.06.2025 | Bids opened on 07.10.2025. Technical evaluation in process','2026-06-17 15:03:34'),(3,3,3,3,'Pollution Abatement of Gomti River (Phase-II, Part-II ) Lucknow','NGP','HAM','2023-09-19',351.03,207.99,13.14,129.90,1,100.00,1,'2026-06-15','Concessionaire Agreement has been signed on dt. 26.08.2025. Financial closure is in progress.','2026-06-17 15:03:34'),(4,4,4,4,'Prevention of Pollution of River Ramganga at Moradabad  under zone-3 & 4 construction of Interception & Diversion (I&D) of Drains and Sewerage Treatment Plant','NMCG','HAM','2025-05-02',420.41,238.53,14.14,181.87,2,80.00,5,'2026-04-21','DPR for interception and diversion works of 5 Untapped drains of Moradabad Zone 3 & Zone 4 along with 2 STP (15 MLD & 65 MLD) works is sanctioned by NMCG New Delhi on dated 02-05-2025 | Tender document of Zone 3 & 4 has been sent to NMCG on dated 30.06.2025 | All Documents Related to tendering has been send to NMCG by email on dated 02-08-2025 | A Query was  raised by NMCG regarding BOD value of Karula drain. therefore combined sampling by U.P.J.N Team & UPPCB Team has been done on date 04-10-2025. Results are Awaited. | The Moradabad Municipal Corporation is to provide land for the construction of the STP in Zone 4, but it has not yet been purchased/made available. Continuous requests are being made to the Moradabad Municipal Corporation regarding this matter. | The reply of the queries received in the pre-bid meeting of the e-tender invited for construction of STPs in Zone-3 and Zone-4 under Namami Gange Programme were sent to NMCG by email on 03.02.2026, which have been approved by NMCG vide letter no. Pr 22012/5/2025 NMCG dated 03.03.2026. | which have been publish on e-tender portal vide letter no. 138/nivida/10 dt 06.03.2026.. The proposed last date for uploading and opening the bids of the said invited e-tender is 15.04.2026. | The said e-tender was opened in this office on 15.04.2026 at 16.00 hrs. The technical evaluation of the bids received in the e-tender is in progress.','2026-06-17 15:03:34'),(5,5,5,5,'Interception and Diversion of Drains/Nala Falling in Varuna River and STP for Bhadohi Town','NGP2-NON EAP','DBOT','2025-03-06',127.26,52.86,4.23,54.69,3,25.00,3,'2026-05-26','AAE&S issued on 06.03.2025 | draft Tender Documents sent to NMCG for approval on 10.06.2025. Approval awaited | Comments on draft documents are received from NMCG to which compliance shall be sent by 17.07.2025 | NIT issued on 31.07.2025 | Bids will be opened on 10.09.2025 | Pre Bid meeting scheduled on 18.08.2025 | Pre-bid meeting held on 18.08.2025. Reply to queries shall be sent by 24.08.2025 | Reply to query sent to CE(Ganga) on 24.08.2025 and after discussion sent to NMCG on 01.09.2025 | Bids will be opened on 09.10.2025 | Financial bids opened on 05.01.2026. CBER sent to NMCG on 03.02.2026 for approval | LOA issued on 12.05.2026 | Bids opened on 09.10.2025. technical evaluation in process','2026-06-17 15:03:34'),(6,6,6,6,'I&D and STP works for Durga Drain (Sewerage District-IV), Varanasi','NGP2-NON EAP','HAM','2025-03-06',274.31,107.70,8.61,97.50,1,60.00,1,'2026-05-26','RFP invited on 27.06.2025 and bids shall be opened on 12.08.2025 | Pre bid meeting held on 15.07.2025 | Pre-bid reply sent to NMCG on 18.08.2025 after discussion with CE(Ganga) and SMCG | Bid submission date extended upto 27.08.2025 | Bid submission extended upto 12.09.2025 | Bids will be opened on 07.10.2025 | Bids opened on 07.10.2025. technical evaluation in process | Financial bids opened on 07.01.2026. CBER sent to NMCG on 03.02.2026 for approval | Approval of CBER received from NMCG on 18.02.2026 and communicated by CE(Ganga) on 20.02.2026 | M/s Enviro Infra Engineers Limited has been selected as L1 bidder | AAE&S issued on 06.03.2025 | Revised Draft RFP Document received from NMCG on 06.05.2025, RFP shall be sent to NMCG by 29.05.2025 for approval | Daft RFP documents were sent to NMCG on which comments were received on 18.06.2025. Compliance/clarifications sent on 19.06.2025 | Final approved RFP documents received from NMCG on 23.06.2025. RFP shall be floated by 27.06.2025 | Bidder vide its letter  03.03.3036 has requested to waive off the APS imposed for which guidance has been sought from HQ | Letter written to NMCG on 19.05.2026 to take decision about the APS imposed','2026-06-17 15:03:34');
/*!40000 ALTER TABLE `undertendering_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:03
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:37:03
