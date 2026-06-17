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

--
-- Dumping events for database 'audit_weekly_progress_of_namami_gange_undertendering_projects'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:50:57
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

--
-- Dumping events for database 'weekly_progress_of_namami_gange_undertendering_projects'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:50:57
