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

-- Dump completed on 2026-06-17 15:47:54
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

-- Dump completed on 2026-06-17 15:47:54
