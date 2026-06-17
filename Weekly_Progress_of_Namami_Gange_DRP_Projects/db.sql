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

--
-- Dumping events for database 'weekly_progress_of_namami_gange_drp_projects_audit'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:49:54
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

--
-- Dumping events for database 'weekly_progress_of_namami_gange_drp_projects'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 15:49:54
