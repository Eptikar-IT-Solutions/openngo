-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: openngo
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `budget` decimal(10,0) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `from` date DEFAULT NULL,
  `to` date DEFAULT NULL,
  `repeated` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_locations`
--

DROP TABLE IF EXISTS `activity_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_locations`
--

LOCK TABLES `activity_locations` WRITE;
/*!40000 ALTER TABLE `activity_locations` DISABLE KEYS */;
INSERT INTO `activity_locations` VALUES (1,2,2,'2016-01-06 09:17:41','2016-01-06 09:17:41',NULL,NULL),(2,2,3,'2016-01-06 09:17:42','2016-01-06 09:17:42',NULL,NULL);
/*!40000 ALTER TABLE `activity_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_members`
--

DROP TABLE IF EXISTS `activity_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_members`
--

LOCK TABLES `activity_members` WRITE;
/*!40000 ALTER TABLE `activity_members` DISABLE KEYS */;
INSERT INTO `activity_members` VALUES (1,2,1,NULL,'2016-01-06 09:17:42','2016-01-06 09:17:42',NULL,NULL),(2,3,2,NULL,'2016-01-06 09:17:42','2016-01-06 09:17:42',NULL,NULL);
/*!40000 ALTER TABLE `activity_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_translations`
--

DROP TABLE IF EXISTS `activity_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_activity_translations_on_activity_id` (`activity_id`) USING BTREE,
  KEY `index_activity_translations_on_locale` (`locale`) USING BTREE,
  KEY `activity_id` (`activity_id`),
  KEY `locale` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_translations`
--

LOCK TABLES `activity_translations` WRITE;
/*!40000 ALTER TABLE `activity_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `file_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_file_size` int(11) DEFAULT NULL,
  `file_updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_translations`
--

DROP TABLE IF EXISTS `branch_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_branch_translations_on_branch_id` (`branch_id`) USING BTREE,
  KEY `index_branch_translations_on_locale` (`locale`) USING BTREE,
  KEY `branch_id` (`branch_id`),
  KEY `locale` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_translations`
--

LOCK TABLES `branch_translations` WRITE;
/*!40000 ALTER TABLE `branch_translations` DISABLE KEYS */;
INSERT INTO `branch_translations` VALUES (18,17,'ar','2016-01-19 07:00:56','2016-01-21 12:19:01','كبكابية',NULL),(19,18,'ar','2016-01-19 12:58:22','2016-01-21 12:19:01','الدامر',NULL),(20,19,'ar','2016-01-19 12:58:22','2016-01-21 12:19:01','كوستى',NULL),(21,20,'ar','2016-01-19 13:22:50','2016-01-21 12:19:01','مركز المعلومات البيئي',''),(22,21,'ar','2016-01-19 13:22:56','2016-01-21 12:19:01','السوكى',NULL),(23,22,'ar','2016-01-19 13:22:57','2016-01-21 12:19:01','نيالا',''),(24,23,'ar','2016-01-19 13:23:01','2016-01-21 12:19:02','امدرمان جنوب',''),(25,24,'ar','2016-01-19 13:23:04','2016-01-21 12:19:02','الوحدة الحاج يوسف',NULL),(26,25,'ar','2016-01-19 13:23:05','2016-01-21 12:19:02','الحاج يوسف',NULL),(27,26,'ar','2016-01-19 13:23:05','2016-01-21 12:19:02','تنطدب',NULL),(28,27,'ar','2016-01-19 13:23:17','2016-01-21 12:19:02','زالنجي',''),(29,28,'ar','2016-01-19 13:23:17','2016-01-21 12:19:02','مليط',''),(30,29,'ar','2016-01-19 13:23:19','2016-01-21 12:19:02','عطبرة',NULL),(31,30,'ar','2016-01-19 13:23:24','2016-01-21 12:19:02','كوستي',NULL),(32,31,'ar','2016-01-19 13:23:24','2016-01-21 12:19:02','ام  روابة',NULL),(33,32,'ar','2016-01-19 13:23:24','2016-01-21 12:19:02','ام روابة',NULL),(34,33,'ar','2016-01-19 13:23:29','2016-01-21 12:19:02','الحاج يوسف الوحدة',NULL),(35,34,'ar','2016-01-19 13:24:11','2016-01-21 12:19:02','الدامر\n\nالدامر',NULL),(36,35,'ar','2016-01-19 13:24:14','2016-01-21 12:19:02','\nالدامر',NULL),(37,36,'ar','2016-01-19 13:24:20','2016-01-21 12:19:02','حلفاية الملوك منزل رقم 3',NULL),(38,37,'ar','2016-01-19 13:24:22','2016-01-21 12:19:02','الدامر.',NULL),(39,38,'ar','2016-01-19 13:24:25','2016-01-21 12:19:02','الجيلي',NULL),(40,39,'ar','2016-01-19 13:24:26','2016-01-21 12:19:02','الجيلى',NULL),(41,40,'ar','2016-01-19 13:24:38','2016-01-21 12:19:03','مر الخرطوم بحري',NULL),(42,41,'ar','2016-01-19 13:25:07','2016-01-21 12:19:03','الجبلى',NULL),(43,42,'ar','2016-01-19 13:25:19','2016-01-21 12:19:03','ربك',NULL),(44,43,'ar','2016-01-19 13:25:28','2016-01-21 12:19:03','حلفايا الملوك',NULL),(45,44,'ar','2016-01-19 13:25:43','2016-01-21 12:19:03','القضارف',''),(46,45,'ar','2016-01-19 13:25:43','2016-01-21 12:19:03','الرميتاب',NULL),(47,46,'ar','2016-01-19 13:25:45','2016-01-21 12:19:03','دنقلا',''),(48,47,'ar','2016-01-19 13:25:49','2016-01-21 12:19:03','تندلتي',''),(49,48,'ar','2016-01-19 13:26:08','2016-01-21 12:19:03','أبوروف',''),(50,49,'ar','2016-01-19 13:26:19','2016-01-21 12:19:03','كسلا',''),(51,50,'ar','2016-01-19 13:26:34','2016-01-21 12:19:03','الفاشر',NULL),(52,51,'ar','2016-01-19 13:27:04','2016-01-21 12:19:03','الأبيض',''),(53,52,'ar','2016-01-19 13:27:37','2016-01-21 12:19:03','بربر',''),(54,53,'ar','2016-01-19 13:27:50','2016-01-21 12:19:03','الرهد',NULL),(55,54,'ar','2016-01-19 13:28:00','2016-01-21 12:19:03','الضعين',''),(56,55,'ar','2016-01-19 13:28:43','2016-01-21 12:19:04','كيلك',NULL),(57,56,'ar','2016-01-19 13:28:55','2016-01-21 12:19:04','اركويت',NULL),(58,57,'ar','2016-01-19 13:29:01','2016-01-21 12:19:04','مرمدرسة حسونة الثانوية العمارات شارع 45',NULL),(59,58,'ar','2016-01-19 13:29:49','2016-01-21 12:19:04','نمر',NULL),(60,59,'ar','2016-01-19 13:30:44','2016-01-21 12:19:04',' مر',NULL),(61,60,'ar','2016-01-19 13:30:55','2016-01-21 12:19:04','الجريفات وام دوم',NULL),(62,61,'ar','2016-01-19 13:30:57','2016-01-21 12:19:04','العندب',NULL),(63,62,'ar','2016-01-19 13:31:04','2016-01-21 12:19:04','بورتسودان',''),(64,63,'ar','2016-01-19 13:31:08','2016-01-21 12:19:04','سبنس',NULL),(65,64,'ar','2016-01-19 13:31:42','2016-01-21 12:19:04','جامعه سنار',NULL),(66,65,'ar','2016-01-19 13:31:48','2016-01-21 12:19:04','ما روابة',NULL),(67,66,'ar','2016-01-19 13:31:55','2016-01-21 12:19:04',' مركز المعلومات البيئي',NULL),(68,67,'ar','2016-01-19 13:31:56','2016-01-21 12:19:04',' مركز المعلومات البيئى',NULL),(69,68,'ar','2016-01-19 13:31:59','2016-01-21 12:19:04','الموردة',NULL),(70,69,'ar','2016-01-19 13:32:17','2016-01-21 12:19:05','سنار',NULL),(71,70,'ar','2016-01-19 13:32:18','2016-01-21 12:19:05','بروش',NULL),(72,71,'ar','2016-01-19 13:32:18','2016-01-21 12:19:05','كرري',NULL),(73,72,'ar','2016-01-19 13:32:19','2016-01-21 12:19:05','كرري 17',NULL),(74,73,'ar','2016-01-19 13:32:19','2016-01-21 12:19:05','الطندب',NULL),(75,74,'ar','2016-01-19 13:32:29','2016-01-21 12:19:05','مدنى',NULL),(76,75,'ar','2016-01-19 13:32:32','2016-01-21 12:19:05','البطانة',NULL),(77,76,'ar','2016-01-19 13:32:38','2016-01-21 12:19:05','الفرزة',NULL),(78,77,'ar','2016-01-19 13:32:43','2016-01-21 12:19:05','الفتح',NULL),(79,78,'ar','2016-01-19 13:33:03','2016-01-21 12:19:05','الجمام',NULL),(80,79,'ar','2016-01-19 13:33:12','2016-01-21 12:19:05','واوستي',NULL),(81,80,'ar','2016-01-19 13:33:13','2016-01-21 12:19:05','واوسي',NULL),(82,81,'ar','2016-01-19 13:33:17','2016-01-21 12:19:05','شندي',NULL),(83,82,'ar','2016-01-19 13:33:22','2016-01-21 12:19:05','ابيض',NULL),(84,83,'ar','2016-01-19 13:33:41','2016-01-21 12:19:05','الفولة',NULL),(85,84,'ar','2016-01-19 13:33:58','2016-01-21 12:19:05','جريجخ',NULL),(86,85,'ar','2016-01-19 13:34:00','2016-01-21 12:19:06','كتم',NULL),(87,86,'ar','2016-01-19 13:34:51','2016-01-21 12:19:06','الدندر',NULL),(88,87,'ar','2016-01-19 13:34:52','2016-01-21 12:19:06',' الدندر',NULL),(89,88,'ar','2016-01-19 13:35:03','2016-01-21 12:19:06','الفاشرالفاشر',NULL),(90,89,'ar','2016-01-19 13:35:41','2016-01-21 12:19:06',' نيالا',NULL),(91,90,'ar','2016-01-19 13:36:13','2016-01-21 12:19:06','الجزيرة ابا',NULL),(92,91,'ar','2016-01-19 13:37:12','2016-01-21 12:19:06','السميح',NULL),(93,92,'ar','2016-01-19 13:37:22','2016-01-21 12:19:06','محافظة تلس-جنوب دارفور',NULL),(94,93,'ar','2016-01-19 13:37:23','2016-01-21 12:19:06','السلمة جنوب-بحري الكدرو',NULL),(95,94,'ar','2016-01-19 13:37:23','2016-01-21 12:19:06','الفرزه',NULL),(96,95,'ar','2016-01-19 13:37:33','2016-01-21 12:19:06','ام  سدرة',NULL),(97,96,'ar','2016-01-19 13:37:39','2016-01-21 12:19:06','  ام  سدرة',NULL),(98,97,'ar','2016-01-19 13:37:41','2016-01-21 12:19:06','قرى نهر الرهد',NULL),(99,98,'ar','2016-01-19 13:37:43','2016-01-21 12:19:06','السليم',NULL),(100,99,'ar','2016-01-19 13:37:43','2016-01-21 12:19:06','الرهد حي الصفاء',NULL),(101,100,'ar','2016-01-19 13:37:46','2016-01-21 12:19:07','كادوقلي',NULL),(102,101,'ar','2016-01-19 13:37:46','2016-01-21 12:19:07','النيل الازرق',NULL),(103,102,'ar','2016-01-19 13:37:47','2016-01-21 12:19:07','الدمازين',NULL),(104,103,'ar','2016-01-19 13:37:49','2016-01-21 12:19:07','العكر',NULL),(105,104,'ar','2016-01-19 13:37:54','2016-01-21 12:19:07','الجنينه',NULL),(106,105,'ar','2016-01-19 13:37:55','2016-01-21 12:19:07','الجنينة',''),(107,106,'ar','2016-01-19 13:38:47','2016-01-21 12:19:07','الجزيرة-الشبيلية',NULL),(108,107,'ar','2016-01-19 13:38:51','2016-01-21 12:19:07','الجزيرة الشبيلية',NULL),(109,108,'ar','2016-01-19 13:39:14','2016-01-21 12:19:07','بابنوسة',''),(110,109,'ar','2016-01-19 13:39:16','2016-01-21 12:19:07','الضغين',NULL),(111,110,'ar','2016-01-19 13:39:24','2016-01-21 12:19:07',' كيلك',NULL),(112,111,'ar','2016-01-19 13:40:01','2016-01-21 12:19:07','الضعين محلية ابو جابرة',NULL),(113,112,'ar','2016-01-19 13:40:08','2016-01-21 12:19:07','جبل مره',NULL),(114,113,'ar','2016-01-19 13:40:11','2016-01-21 12:19:07','بروشد',NULL),(115,114,'ar','2016-01-19 13:40:12','2016-01-21 12:19:07','جبل مرة',NULL),(116,115,'ar','2016-01-19 13:40:22','2016-01-21 12:19:07','البركة',NULL),(117,116,'ar','2016-01-19 13:40:42','2016-01-21 12:19:08','قري نهرالرهد',NULL),(118,117,'ar','2016-01-19 13:40:42','2016-01-21 12:19:08','قرىنهر الرهد',NULL),(119,118,'ar','2016-01-19 13:40:46','2016-01-21 12:19:08','المجلد',NULL),(120,119,'ar','2016-01-19 13:41:11','2016-01-21 12:19:08','بليل',NULL),(121,120,'ar','2016-01-19 13:41:56','2016-01-21 12:19:08','سندي',NULL),(122,121,'ar','2016-01-19 13:42:12','2016-01-21 12:19:08','البركه',NULL),(123,122,'ar','2016-01-19 13:42:13','2016-01-21 12:19:08','البركة-شرق النيل',NULL),(124,123,'ar','2016-01-19 13:42:21','2016-01-21 12:19:08','البياضة',NULL),(125,124,'ar','2016-01-19 13:42:39','2016-01-21 12:19:08','اليرموك',NULL),(126,125,'ar','2016-01-19 13:43:04','2016-01-21 12:19:08','العكد',NULL),(127,126,'ar','2016-01-19 13:43:11','2016-01-21 12:19:08','عد الفرسان',NULL),(128,127,'ar','2016-01-19 13:43:16','2016-01-21 12:19:08','زالنجي',NULL),(129,128,'ar','2016-01-19 13:43:17','2016-01-21 12:19:08',' زالنجي',NULL),(130,129,'ar','2016-01-19 13:43:34','2016-01-21 12:19:08','الدندر.',NULL),(131,130,'ar','2016-01-19 13:43:39','2016-01-21 12:19:08','الدلنج',NULL),(132,131,'ar','2016-01-19 13:43:39','2016-01-21 12:19:08','كادقلي',NULL),(133,132,'ar','2016-01-19 13:43:40','2016-01-21 12:19:09','السوكي',NULL),(134,133,'ar','2016-01-19 13:43:42','2016-01-21 12:19:09','امدرمان',NULL),(135,134,'ar','2016-01-19 13:43:42','2016-01-21 12:19:09','الخرطوم',NULL),(136,135,'ar','2016-01-19 13:43:45','2016-01-21 12:19:09','ام كريدم',NULL),(137,136,'ar','2016-01-19 13:44:17','2016-01-21 12:19:09','الرياض',NULL),(138,137,'ar','2016-01-19 13:44:19','2016-01-21 12:19:09',' الرياض',NULL),(139,138,'ar','2016-01-19 13:44:54','2016-01-21 12:19:09','ام رواية',NULL),(140,139,'ar','2016-01-19 13:45:05','2016-01-21 12:19:09','ود ربيعة- سنار',NULL),(141,140,'ar','2016-01-19 13:45:06','2016-01-21 12:19:09','الراوات',''),(142,141,'ar','2016-01-19 13:45:27','2016-01-21 12:19:09','ود ربيعة_سنار',NULL),(143,142,'ar','2016-01-19 13:45:51','2016-01-21 12:19:09','ود ربيعة',NULL),(144,143,'ar','2016-01-20 08:08:18','2016-01-21 12:19:09','Al Dammer',NULL),(145,144,'ar','2016-01-20 08:08:18','2016-01-21 12:19:09','Om Sedrah',NULL),(146,145,'ar','2016-01-20 08:08:18','2016-01-21 12:19:09','Al Dender',NULL),(147,146,'ar','2016-01-20 08:08:19','2016-01-21 12:19:09','Al Ryadh',NULL),(148,147,'ar','2016-01-20 08:08:19','2016-01-21 12:19:10','Zalnje',NULL),(149,148,'ar','2016-01-20 08:08:19','2016-01-21 12:19:10','Kelk',NULL),(150,149,'ar','2016-01-20 08:08:19','2016-01-21 12:19:10','Niala',NULL),(151,150,'ar','2016-01-20 08:08:19','2016-01-21 12:19:10','Al Barkah, East Nile',NULL),(152,151,'ar','2016-01-20 08:08:19','2016-01-21 12:19:10','Al Byaddh',NULL),(153,152,'ar','2016-01-20 08:08:19','2016-01-21 12:19:10','Al Jerefat and Om Doom',NULL),(154,153,'ar','2016-01-20 08:08:19','2016-01-21 12:19:10','Aba Island',NULL),(155,154,'ar','2016-01-20 08:08:20','2016-01-21 12:19:10','Al Shebelya Island',NULL),(156,155,'ar','2016-01-20 08:08:20','2016-01-21 12:19:10','Kebkabya',NULL),(157,156,'ar','2016-01-20 08:08:20','2016-01-21 12:19:10','Enviromental Information Centere',NULL),(158,20,'ar','2016-01-21 07:43:29','2016-01-21 07:43:29','Environmental Information Center',''),(159,20,'en','2016-01-21 07:43:29','2016-01-21 12:37:14','Environmental Information Center',''),(160,22,'en','2016-01-21 07:45:41','2016-01-21 12:37:14','Niala',''),(161,23,'en','2016-01-21 07:46:40','2016-01-21 12:37:14','South Omdurman',''),(162,27,'ar','2016-01-21 07:47:19','2016-01-21 07:50:47','zalinje',''),(163,27,'en','2016-01-21 07:47:19','2016-01-21 12:37:14','za',''),(164,28,'en','2016-01-21 07:53:22','2016-01-21 12:37:14','Maleet',''),(165,44,'en','2016-01-21 07:56:53','2016-01-21 12:37:14','Al Qadarif',''),(166,46,'en','2016-01-21 07:58:14','2016-01-21 12:37:14','Dongola',''),(167,47,'en','2016-01-21 07:59:22','2016-01-21 12:37:14','Tandalti',''),(168,49,'en','2016-01-21 08:02:55','2016-01-21 12:37:15','Kassala',''),(169,51,'en','2016-01-21 08:04:29','2016-01-21 12:37:15','Al-Ubayyid',''),(170,52,'en','2016-01-21 08:06:25','2016-01-21 12:37:15','Berber',''),(171,54,'en','2016-01-21 08:07:14','2016-01-21 12:37:15','Ad Du\'ayn',''),(172,62,'en','2016-01-21 08:08:05','2016-01-21 12:37:15','Port Sudan',''),(173,105,'en','2016-01-21 08:09:16','2016-01-21 12:37:15','Al Geneina',''),(174,108,'ar','2016-01-21 08:10:46','2016-01-21 08:11:49','Babanusa',''),(175,140,'en','2016-01-21 08:14:24','2016-01-21 12:37:15','Al Rawat',''),(176,48,'en','2016-01-21 08:17:49','2016-01-21 12:37:14','Abu Rouf',''),(177,108,'ar','2016-01-21 08:20:06','2016-01-21 08:20:06','Babanusa',''),(178,108,'en','2016-01-21 08:20:07','2016-01-21 12:37:15','Babanusa',''),(180,158,'en','2016-01-21 12:55:52','2016-01-21 12:55:52','test',NULL);
/*!40000 ALTER TABLE `branch_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `state_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (20,NULL,NULL,18,'2016-01-19 13:22:50','2016-01-21 07:43:29',NULL,1),(22,NULL,NULL,8,'2016-01-19 13:22:57','2016-01-21 07:45:41',NULL,1),(23,NULL,NULL,18,'2016-01-19 13:23:01','2016-01-21 07:46:40',NULL,1),(27,NULL,NULL,1,'2016-01-19 13:23:17','2016-01-21 07:50:47',NULL,1),(28,NULL,NULL,7,'2016-01-19 13:23:17','2016-01-21 07:53:22',NULL,1),(44,NULL,NULL,11,'2016-01-19 13:25:43','2016-01-21 07:56:53',NULL,1),(46,NULL,NULL,16,'2016-01-19 13:25:45','2016-01-21 07:58:14',NULL,1),(47,NULL,NULL,4,'2016-01-19 13:25:49','2016-01-21 07:59:22',NULL,1),(48,NULL,NULL,18,'2016-01-19 13:26:08','2016-01-21 08:18:51',NULL,1),(49,NULL,NULL,10,'2016-01-19 13:26:19','2016-01-21 08:03:41',NULL,1),(51,NULL,NULL,13,'2016-01-19 13:27:04','2016-01-21 08:04:29',NULL,1),(52,NULL,NULL,17,'2016-01-19 13:27:37','2016-01-21 08:06:25',NULL,1),(54,NULL,NULL,9,'2016-01-19 13:28:00','2016-01-21 08:07:14',NULL,1),(62,NULL,NULL,12,'2016-01-19 13:31:04','2016-01-21 08:08:05',NULL,1),(105,NULL,NULL,9,'2016-01-19 13:37:55','2016-01-21 08:09:16',NULL,1),(108,NULL,NULL,14,'2016-01-19 13:39:14','2016-01-21 08:22:29',NULL,1),(140,NULL,NULL,4,'2016-01-19 13:45:06','2016-01-21 08:14:24',NULL,1),(158,NULL,NULL,NULL,'2016-01-21 12:55:52','2016-01-21 12:55:52',NULL,NULL);
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor_translations`
--

DROP TABLE IF EXISTS `donor_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donor_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `donor_id` int(11) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_donor_translations_on_donor_id` (`donor_id`) USING BTREE,
  KEY `index_donor_translations_on_locale` (`locale`) USING BTREE,
  KEY `donor_id` (`donor_id`),
  KEY `locale` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor_translations`
--

LOCK TABLES `donor_translations` WRITE;
/*!40000 ALTER TABLE `donor_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `donor_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donors`
--

DROP TABLE IF EXISTS `donors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donors`
--

LOCK TABLES `donors` WRITE;
/*!40000 ALTER TABLE `donors` DISABLE KEYS */;
/*!40000 ALTER TABLE `donors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_translations`
--

DROP TABLE IF EXISTS `location_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_location_translations_on_locale` (`locale`) USING BTREE,
  KEY `index_location_translations_on_location_id` (`location_id`) USING BTREE,
  KEY `locale` (`locale`),
  KEY `location_id` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_translations`
--

LOCK TABLES `location_translations` WRITE;
/*!40000 ALTER TABLE `location_translations` DISABLE KEYS */;
INSERT INTO `location_translations` VALUES (1,1,'en','2016-01-06 09:17:41','2016-01-06 09:17:41','Khartoum'),(2,2,'en','2016-01-06 09:17:41','2016-01-06 09:17:41','Friendship Hal'),(3,3,'en','2016-01-06 09:17:41','2016-01-06 09:17:41','Cornithia Hotel'),(4,4,'en','2016-01-20 08:34:49','2016-01-20 08:34:49','Khartoum'),(5,5,'en','2016-01-20 08:34:49','2016-01-20 08:34:49','Portsudan'),(6,6,'en','2016-01-20 08:35:53','2016-01-20 08:35:53','Khartoum'),(7,7,'en','2016-01-20 08:35:54','2016-01-20 08:35:54','Portsudan'),(8,8,'en','2016-01-20 08:38:18','2016-01-20 08:38:18','Khartoum'),(9,9,'en','2016-01-20 08:38:18','2016-01-20 08:38:18','Portsudan');
/*!40000 ALTER TABLE `location_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,NULL,NULL,'2016-01-06 09:17:41','2016-01-06 09:17:41',NULL,NULL),(2,NULL,NULL,'2016-01-06 09:17:41','2016-01-06 09:17:41',NULL,NULL),(3,NULL,NULL,'2016-01-06 09:17:41','2016-01-06 09:17:41',NULL,NULL),(4,NULL,NULL,'2016-01-20 08:34:49','2016-01-20 08:34:49',NULL,NULL),(5,NULL,NULL,'2016-01-20 08:34:49','2016-01-20 08:34:49',NULL,NULL),(6,NULL,NULL,'2016-01-20 08:35:53','2016-01-20 08:35:53',NULL,NULL),(7,NULL,NULL,'2016-01-20 08:35:53','2016-01-20 08:35:53',NULL,NULL),(8,NULL,NULL,'2016-01-20 08:38:18','2016-01-20 08:38:18',NULL,NULL),(9,NULL,NULL,'2016-01-20 08:38:18','2016-01-20 08:38:18',NULL,NULL);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `joined_at` date DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `education` int(11) DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  `profession_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `occupation_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `specialization` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `renewal_date` date DEFAULT NULL,
  `renewal_string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31787 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (31418,'محاسن الحاج عثمان الحسن',1,'2012-11-18','hassanoo@gmail.com','911709746','امبده الحاره الرابعه',1,NULL,NULL,'2016-01-20 10:43:33','2016-01-20 15:19:03',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'وزاره الزراعه الاتحاديه','اقتصاد زراعي',NULL,NULL),(31419,'نورا على قسم السيد عبدالله مساعد',1,'2012-06-10','noor.mayas89@hotmail.com','925712638','الخرطوم العشرة م 3 منزل 6',NULL,'',0,'2016-01-20 10:43:33','2016-01-20 13:59:49',20,1,NULL,1,'african_women_by_wemokid-d56esyg.jpg','image/jpeg',81485,'2016-01-20 13:59:49',NULL,NULL,NULL,NULL,'أحياء','2015-01-01',NULL),(31420,'احمد محمد داؤد',0,'2012-11-20','daudmi@hotmail.com','918056827','الطائف مربع 53',NULL,'',0,'2016-01-20 10:43:33','2016-01-20 12:43:38',20,1,NULL,1,'Ali_Muntaser.jpg','image/jpeg',199307,'2016-01-20 12:43:31',NULL,NULL,NULL,'مدير اداري - معاش','اقتصاد',NULL,NULL),(31421,'على عبد الكريم سعيد',0,'2012-06-11','ali.alkarim@yahoo.com','918235131','ولاية الجزيرة -أم القرى المسارعه',2,NULL,NULL,'2016-01-20 10:43:34','2016-01-20 15:19:32',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'وقاية محاصيل - حشرات','2015-01-01',NULL),(31422,'ياسر عبد الله عمر سليمان الحضري',0,'2012-04-12','yassiralhadary@yahoo.com','912912780','بحري- الشعبية منزل رقم 15',1,NULL,NULL,'2016-01-20 10:43:34','2016-01-20 15:19:32',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الخرطوم السوق العربي','الحقوق',NULL,NULL),(31423,'راشد محمد على ابراهيم',0,'2012-06-13','rashidelzain@hotmail.com','926358799','برى الشريف مربع (1)',1,NULL,NULL,'2016-01-20 10:43:34','2016-01-20 15:19:32',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هندسة مدنية','2015-01-01',NULL),(31424,'ماجده حسن خير السيد',1,'2003-04-13','maghassan2003@yahoo.com','912763670','امدرمان ابوسعد مربع 9',2,NULL,NULL,'2016-01-20 10:43:34','2016-01-20 15:19:32',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الجمعية السودانية لحماية اللبيئة','دراسات بيئية','2015-01-01',NULL),(31425,'هند عادل تاج الاصفياء',1,'2011-01-01','hindioia2004@hotmail.com','918172580','الخرطوم المعموره مربع 79',1,NULL,NULL,'2016-01-20 10:43:34','2016-01-20 15:19:32',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الجمعية السودانية لحماية البيئة','زراعة','2015-01-01',NULL),(31426,'عائشة عبد الماجد مجزوب',1,'2005-01-01','shainda33@yahoo.com','127793003','السجانة',1,NULL,NULL,'2016-01-20 10:43:34','2016-01-20 15:19:32',23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الجمعية السودانية لحماية البيئة','ادارة المخلفات','2015-01-01',NULL),(31427,'اسماء هيم هيم عز الدين ابراهيم',1,'2013-05-02','soma ibrahim85@yahoo.com','92272229','امدرمان المهندسين',5,NULL,NULL,'2016-01-20 10:43:34','2016-01-20 14:38:41',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-01',NULL),(31428,'احمد عوض عبد الله حمدان',0,'2001-12-29','AHMW_2012@HOTMAIL .COM','900901320','الخرطوم ابو ادم  منزل 229',1,NULL,NULL,'2016-01-20 10:43:34','2016-01-20 15:19:32',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'موظف','علوم زراعية',NULL,NULL),(31429,'مجاهد محجوب محمد الأمين البشير',0,'3013-02-10','mogahed.007@hotmail','912186214','بحرى شبمات الجنوبية م 2/2',1,NULL,NULL,'2016-01-20 10:43:35','2016-01-20 15:19:32',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'طالب','إدارة بيئية','2015-01-01',NULL),(31430,'سالي الهميم العقيق',1,'2012-04-28','sahar66654@hotmail.com','926779082','جبره مربع 15',1,NULL,NULL,'2016-01-20 10:43:35','2016-01-20 15:19:32',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'دراسات بيئيه',NULL,NULL),(31431,'رشا عبدالله فضل عبدالله',1,NULL,'rasha_fne@xahoo.com','121175370','الهيئةالقومية للغابات',1,NULL,NULL,'2016-01-20 10:43:35','2016-01-20 15:19:33',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الهيئة القومية للغابات','مهندس زراعي',NULL,NULL),(31432,'عمار محمد عثمان عبد المجيد عبيد',0,'2013-09-05','ammarosman@yahoo.com','912299995','الخروم- الطايف- مربع53 منزل رقم 1',1,NULL,NULL,'2016-01-20 10:43:35','2016-01-20 15:19:33',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'المجلس الاعلي للبيئة والترقية الحضرية','هندسة كيميائية',NULL,NULL),(31433,'معتصم طه محمد الياس',0,'2013-05-01','eliasmutasim@yahoo.com','918022476','الخرطوم الأزهرى م 2- منزل 385',NULL,NULL,NULL,'2016-01-20 10:43:35','2016-01-20 10:43:35',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هندسة مدنية','2015-01-01',NULL),(31434,'فاطمة محمدعثمان ادريس',1,'2013-02-05','fatma mohammed@xa.com','922156811','ام درمان السبيل',5,NULL,NULL,'2016-01-20 10:43:35','2016-01-20 15:19:33',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31435,'حسيب يونس محمد حسيب',0,'2012-01-12','Hasib2006@hotmail.com','112008290','الخرطوم - الجيلي',1,NULL,NULL,'2016-01-20 10:43:35','2016-01-20 15:19:33',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'شركة مصفاة الخرطوم المحدودة','علوم كيمياء',NULL,NULL),(31436,'اخلاص محمد الحسن',1,'2012-07-02','magilosnoraco@yahoo.com','915137082','اركويت مربع 48',1,NULL,NULL,'2016-01-20 10:43:35','2016-01-20 15:19:33',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علم اجتماع',NULL,NULL),(31437,'جمال الدين محمد الحسن  الحسين ناصر',0,NULL,'gelhussein@gmail.com','122087396','بحري شمبات',4,NULL,NULL,'2016-01-20 10:43:36','2016-01-20 11:37:09',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة زالنجي كلية الزراعة','زراعة بساتين',NULL,NULL),(31438,'رابعة أحمد الامين صالح',1,'2011-06-19','rerebaqz@yahoo.com','911504675','امدرمان بانت غرب',1,NULL,NULL,'2016-01-20 10:43:36','2016-01-20 15:19:33',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'إعلام','2015-01-01',NULL),(31439,'روان الصادق حاج علي',1,'2011-05-10','Rawanelsadig188@hotmail.com','918702464','بحري- كافوري',1,NULL,NULL,'2016-01-20 10:43:36','2016-01-20 15:19:33',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'دراسات بيئية واجتماعية',NULL,NULL),(31440,'بنان الفاتح الهادي ابراهيم',1,'2012-07-18','banan.elfetih@yahoo.com','915604112','ام القري جنوب',2,NULL,NULL,'2016-01-20 10:43:36','2016-01-20 15:19:33',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'تقانه بيئه',NULL,NULL),(31441,'سعاد حاتم محمد ابو زيد',1,'2011-05-10','moosaa@hotmail.com','919889992','الخرطوم- بري',1,NULL,NULL,'2016-01-20 10:43:36','2016-01-20 15:19:33',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'دراسات اجتماعية وبيئية',NULL,NULL),(31442,'مروة طه الحاج ادم  عبد الرحيم',0,'2012-11-30','marwataha88@yahoo.com','918909760','الحاج يوسف المايقوما منزل رقم 5 مربع 5',1,NULL,NULL,'2016-01-20 10:43:36','2016-01-20 15:19:33',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'طب بيطرى / علوم اسماك وحياة برية','2015-01-01',NULL),(31443,'احمد بريمه تيراب ابراهيم',0,'2012-05-03','malika20658@yahoo.com','918284205','زالنجي',2,NULL,NULL,'2016-01-20 10:43:36','2016-01-20 15:19:33',27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعه زالنجي','وراثه وتربيه حيوان',NULL,NULL),(31444,'بحر الدين هارون يحيي هلال',0,'2011-04-07','bhy.helal@yahoo.com','121569210','الجنينة غرب دارفور',1,NULL,NULL,'2016-01-20 10:43:36','2016-01-20 15:19:33',28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الجنينة غرب دارفور','بكلاريوس',NULL,NULL),(31445,'عبد الله ادم محمد عجيب',0,'2011-04-07','Abdala.adam@yahoo.com','122562588','مليط شمال دارفور حي عمار جديد',1,NULL,NULL,'2016-01-20 10:43:37','2016-01-20 15:19:33',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'مليط شمال دارفور','بكلاريوس',NULL,NULL),(31446,'لينا محمد يوسف عبيد',1,'2013-05-06','linaobid-2013@hotmail.com','900313979','المنشيه مربع 25',1,NULL,NULL,'2016-01-20 10:43:37','2016-01-20 15:19:33',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'المنشيه','علم نفس ورياض اطفال',NULL,NULL),(31447,'سلمى قرشى نصر الدين عبد الرحمن',1,'2013-05-02','semoqueen@hotmail.com','900527616','ام درمان الحتانة جنوب',5,NULL,NULL,'2016-01-20 10:43:37','2016-01-20 15:19:33',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-01',NULL),(31448,'مروة كمال الدين  الامين محمد سعد',1,NULL,'marwa.saad85@gmail.com','916112321','الخرطوم -العمارات -شارع 5',1,NULL,NULL,'2016-01-20 10:43:37','2016-01-20 15:19:33',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم احياءنبات بيئة وتصنيف',NULL,NULL),(31449,'شهد فضل ابراهيم',1,'2013-05-02','shasho88ss@yahoo.com','995358816','امدرمان العرضة',5,NULL,NULL,'2016-01-20 10:43:37','2016-01-20 15:19:34',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-01',NULL),(31450,'مهند بخيت مساعد',0,'2013-03-25','mohaned.mussad@gmail.com','917233643','الحاج يوسف/ الفيحاء مربع 2',1,NULL,NULL,'2016-01-20 10:43:37','2016-01-20 15:19:34',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم بيئيه- تقانه بيئه',NULL,NULL),(31451,'سهير ابراهيم الامين',1,'2013-06-18','suHIERHADR@HOTMAIL.COM','912882251','شمبات',1,NULL,NULL,'2016-01-20 10:43:37','2016-01-20 15:19:34',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'موظفة','جغرافيا',NULL,NULL),(31452,'رندا محمد الحسن حسن',1,'2013-05-02','randa-223@hotmail.com','928530872','امدرمان الثورة الحارة (8)',NULL,NULL,NULL,'2016-01-20 10:43:37','2016-01-20 11:30:31',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-01',NULL),(31453,'زينة عبد الكريم احمد عبد الكريم',1,NULL,'zuzu_15@hotmail.com','916908687',' الخرطوم بحري -كافوري مربع 9',1,NULL,NULL,'2016-01-20 10:43:38','2016-01-20 15:19:34',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم احياء-جيولجيا-بترول-منظمات غير حكومية',NULL,NULL),(31454,'نزار تاج السر الخير',0,NULL,'nizartag2003@yahoo.com','912669918','الخرطوم',2,NULL,NULL,'2016-01-20 10:43:38','2016-01-20 15:19:34',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'امين مكتبة','MBA',NULL,NULL),(31455,'مجتبى مالك ادم الحاج',0,'2013-02-07','chiboea@hotmail.com','924354477','امدرمان الثورة الحاره(59)',1,NULL,NULL,'2016-01-20 10:43:38','2016-01-20 15:19:34',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'دراسات بيئية','2015-01-01',NULL),(31456,'صفوة عبد العظيم أحمد الدغور',1,'2012-09-11','safwaazim@hotmail.com','912121469','الخرطوم الرياض',2,NULL,NULL,'2016-01-20 10:43:38','2016-01-20 15:19:34',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم بيئية','2015-01-01',NULL),(31457,'فوزية ابراهيم حامد محمد',1,'2011-10-03','fofo9512@hotmail.com','915477829','الخرطوم - جبرة- مربع 24',1,NULL,NULL,'2016-01-20 10:43:38','2016-01-20 15:19:34',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'تنمية ريفية',NULL,NULL),(31458,'محمد مدثر سليمان محمد علي',0,NULL,'drmhamed200@gmail.com','914512670','الحلفايا الخرطوم بحري منزل 26',1,NULL,NULL,'2016-01-20 10:43:38','2016-01-20 15:19:34',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الخرطوم بحري','هندسة بيئية',NULL,NULL),(31459,'محمد سعد ادم عمر',0,'2011-10-03','saad.omer73@yahoo.com','915400061','الخرطوم - جبرة مربع 24',1,NULL,NULL,'2016-01-20 10:43:38','2016-01-20 15:19:34',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'شركة سنان العالمية للاستثار  المحدودة','ارشاد زراعي وتنمية ريفية',NULL,NULL),(31460,'سحر حسن عوض ابراهيم',1,'2012-09-10','sbronob07@hotmail.com','915205900','حى السوق المحلى',1,NULL,NULL,'2016-01-20 10:43:39','2016-01-20 15:19:34',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'معهد ابحاث البيئة','علوم بيئية','2015-01-01',NULL),(31461,'ساره سعد عوض محمد احمد',1,'2012-09-27','sara-awad77@hotmail','912600677','الرياض مربع 11',1,NULL,NULL,'2016-01-20 10:43:39','2016-01-20 15:19:35',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هندسه كيميائيه','2015-02-16',NULL),(31462,'فايزة حسين عبد الله عثمان',1,'1980-01-01','Drfaigahussen@yahoo.com','912808457','بحري - شمبات',4,NULL,NULL,'2016-01-20 10:43:39','2016-01-20 11:37:09',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'مركز العلوم والتكنولوجيا - جامعة الاحفاد','علوم الحيوان والبيئة',NULL,NULL),(31463,'ولاء عبد الحليم احمد الزبير',1,'2013-05-09','LELLY@HOT MAIL.COM','912758982','الخرطوم امتداد ناصر - شارع اومالك - منزل مربع 523',1,NULL,NULL,'2016-01-20 10:43:39','2016-01-20 15:19:35',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'المجلس الاعلي للبيئة والترقية الحضرية','هندسة بيئية',NULL,NULL),(31464,'اميره الطيب عطا الله',1,'2013-04-07','amira.e.ataalla@hotmail.com','911126270','الخرطوم جنوب مربع 1',1,NULL,NULL,'2016-01-20 10:43:39','2016-01-20 15:19:35',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'تصميم داخلي',NULL,NULL),(31465,'اشراقه شمام الشيخ مصطفى',1,'2013-02-27','shoshmam@hotmail.com','912992713','بحرى - شمبات',1,NULL,NULL,'2016-01-20 10:43:39','2016-01-20 15:19:35',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'وزارة الصحة ولاية الخرطوم / إدارة صحة البيئة','الصحة العامه وصحة البيئة','2015-01-01',NULL),(31466,'ريم عبد القيوم عمر كريم الدين',1,'2013-06-14','reemabdalgium@yahoo.com','918334697','امدرمان الثورة الحارة 11',1,NULL,NULL,'2016-01-20 10:43:39','2016-01-20 15:19:35',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم جيولوجيا',NULL,NULL),(31467,'سندس كمال يوسف عتباني',1,'2013-04-07','sandy.designer@hotmail.com','913511432','بحري حله حمد مربع 7',1,NULL,NULL,'2016-01-20 10:43:39','2016-01-20 15:19:35',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'تصميم داخلي',NULL,NULL),(31468,'فاطمه ابراهيم محمد الامين',1,'2012-09-13','fatimaalkazim@yahoo.com','919977272','المعموره',1,NULL,NULL,'2016-01-20 10:43:40','2016-01-20 15:19:35',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعه الخرطوم','علوم نبات - بيئه',NULL,NULL),(31469,'امين علي الخليفة الحسن',0,'2011-08-15','AminaliALHKalifa@yahoo.com','912844700','الخرطوم بحري حلة كوكو مربع 14 منزل 86',1,NULL,NULL,'2016-01-20 10:43:40','2016-01-20 15:19:35',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'حلة كوكو','اقتصادوعلوم سياسية',NULL,NULL),(31470,'ريان مدني نوح محمد احمد',1,'2012-08-03','rayanb90@yahoo.co','903368974','بحري - شرق النيل- الفيحاء منزل رقم 68',1,NULL,NULL,'2016-01-20 10:43:40','2016-01-20 15:19:35',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم حيوان',NULL,NULL),(31471,'عبد الفتاح تبن عبدالله ادم',1,'2011-06-19','abdelftahoo@yahoo.com','920040541','حى التضامن',1,NULL,NULL,'2016-01-20 10:43:40','2016-01-20 15:19:35',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'منسق مشروعات رعاية الأيتام ومكتب الجندر  CDA','هندسة الاكترونية','2015-01-01',NULL),(31472,'سامي محمد احمد عبد الرحمن',0,'2012-05-10','Sami_alnjomi@hotmail .com','919933588','الخرطوم - بري',1,NULL,NULL,'2016-01-20 10:43:40','2016-01-20 15:19:35',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'كلية الدراسات الجتماعية والبيئة',NULL,NULL),(31473,'محمد الحاج محمد احمد',0,'2011-11-09','mamadoo2008@hotmail.com','912952506','ام درمان كرري خور عمر',1,NULL,NULL,'2016-01-20 10:43:40','2016-01-20 15:19:35',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ام درمان كرري','كيمياء',NULL,NULL),(31474,'رشاء عثمان محمد عثمان',1,'2012-10-01','rshsmn@yahoo.com','915893976','الدروشاب شمال مربع 2',1,NULL,NULL,'2016-01-20 10:43:40','2016-01-20 15:19:35',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'اقتصاد',NULL,NULL),(31475,'عمار مختار جمعة جابر',0,'2011-06-02','RAMMAM3T@GMIL.COM','913862658','الهيئة العامة للارصاد الجوي الازهري مربع 1 منزل رقم 67',2,NULL,NULL,'2016-01-20 10:43:40','2016-01-20 15:19:35',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الازهري مربع 10 منزل 67','ادارة اعمال',NULL,NULL),(31476,'علياء ادم عبد الحميد سليمان',1,'2012-02-09','aliaa158@hotmail.com','915801296','بحرى العزبة  مربع 18 منزل رقم 79',1,NULL,NULL,'2016-01-20 10:43:41','2016-01-20 15:19:35',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'موراد طبيعية / كيمياء حيوية','2015-01-01',NULL),(31477,'ايوب النور محجوب محمد',0,'2011-10-02','a.nager.yahoo.com','909498032','امبدة',1,NULL,NULL,'2016-01-20 10:43:41','2016-01-20 15:19:35',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'مساعد صيدلي مركز صحي','علوم كيمياء علم الحيوان',NULL,NULL),(31478,'زحل محمد الامين',1,'0200-01-03','zu_elamin@hotmail.com','912105472','المنشيه',4,NULL,NULL,'2016-01-20 10:43:41','2016-01-20 11:37:09',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعه الزعيم الازهري','قانون',NULL,NULL),(31479,'هاديه محمد صالح يعقوب',1,'2012-01-15','hadiasalih@hotmail .com','914128075','امدرمان - امبده حمد النيل',1,NULL,NULL,'2016-01-20 10:43:41','2016-01-20 15:19:36',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'اداره صحه مجتمع',NULL,NULL),(31480,'محمد ابراهيم ادم عمر',0,'2011-04-19','mi_86@w.cn','922334409','الامتداد الدرجة الثالثة',1,NULL,NULL,'2016-01-20 10:43:41','2016-01-20 15:19:36',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الكترونيات الطيران',NULL,NULL),(31481,'محمد عبد الواحد محمد علي',0,'2011-03-02','mohamst2006@hotmail.com','912327858','الجريف شرق منزل 49 م 3 محطة 2شرق',1,NULL,NULL,'2016-01-20 10:43:41','2016-01-20 15:19:36',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الجريف شرق منزل 49','ماجستير الصحة العامة',NULL,NULL),(31482,'عزة التجانى ابراهيم حمد',1,'2012-03-25','azzalovely_86@hotmail.com','915003059','امدرمان  حى ابو روف سوق الشجرة',1,NULL,NULL,'2016-01-20 10:43:41','2016-01-20 15:19:36',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم صحية','2015-01-01',NULL),(31483,'هويدا عثمان محمد احمد',1,'2011-01-26','howydh@yahoo.com','915087786','الخرطوم غرب مربع 79',1,NULL,NULL,'2016-01-20 10:43:41','2016-01-20 15:19:36',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الجريف غرب','زراعة انتاج حيواني',NULL,NULL),(31484,'هبه محجوب محمد صالح',1,'2012-03-15','hiba.mahjoub@yahoo.com','912638589','الرياض شارع المشتل',1,NULL,NULL,'2016-01-20 10:43:42','2016-01-20 15:19:36',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ترجمه','2015-01-01',NULL),(31485,'ناصر محمد سليمان الصافي',0,'2010-11-29','bigdashNaser@yahoo.com','123858444','شارع الجامعة - توتي',1,NULL,NULL,'2016-01-20 10:43:42','2016-01-20 15:19:36',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'صحيفة الاهرام','الاعلام',NULL,NULL),(31486,'سماح الحسن محمد احمد مكاوي',1,'2011-06-09','samah.science@gmail.com','913645069','بحرى الحاج يوسف مربع 1 منزل 335',1,NULL,NULL,'2016-01-20 10:43:42','2016-01-20 15:19:36',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم احياء / قسم علو م الحيوان','2015-01-01',NULL),(31487,'مختار محمد محمود حسن',0,'2012-01-30','mok87bigman@gmail.com','924660776','بحري- الحلفايه مربع 7',1,NULL,NULL,'2016-01-20 10:43:42','2016-01-20 15:19:36',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'مساعد تدريس متعاون جامعه الخرطوم','علم حيوان',NULL,NULL),(31488,'ريهام محمد سر الختم احمد',1,'2011-02-20','Rehamjaksa@hotmail.com','926067257','الخرطوم- الفردوس شمال',1,NULL,NULL,'2016-01-20 10:43:42','2016-01-20 15:19:36',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'مخنبرات طبية',NULL,NULL),(31489,'اسراء عبد الرازق الفكي العاقب',1,'2012-01-30','remma94@gmail.com','924456483','شرق النيل - ام ضوابان',NULL,NULL,NULL,'2016-01-20 10:43:42','2016-01-20 10:43:42',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31490,'اسراء عبد الرازق الفكي العاقب',1,'2012-01-30','remmaa4@gmail.com','924456483','شرق النيل - ام ضوابان',1,NULL,NULL,'2016-01-20 10:43:42','2016-01-20 15:19:36',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'متاون جامعه الخرطوم','علم حيوان',NULL,NULL),(31491,'حاتم الطيب عبد الرحمن ادم رجال',0,'2011-06-14','hatim.eltayeb@ymail.com','129317263','ام درمان الثورة 23حي القاضي',1,NULL,NULL,'2016-01-20 10:43:42','2016-01-20 15:19:36',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ام درمان الثورة','علوم غابات',NULL,NULL),(31492,'وئام عوض سعيد سعدون',1,'2011-05-09','weamawad@yahoo.com','922811275','امبده السبيل',1,NULL,NULL,'2016-01-20 10:43:43','2016-01-20 15:19:36',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'طب وجراحه',NULL,NULL),(31493,'امير موسي محمد',0,'2011-05-09','amir-musoooo@yahoo.com','928771001','امدرمان - صالحه',1,NULL,NULL,'2016-01-20 10:43:43','2016-01-20 15:19:36',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'محاسبه',NULL,NULL),(31494,'نصر الدين الدومة ادم الدومة',0,'2011-07-03','nusrdesudan@yahoo.com','912299426','الدروشاب م 6 منزل رقم 206',3,NULL,NULL,'2016-01-20 10:43:43','2016-01-20 15:19:36',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'قصر الشباب والاطفال','رسم تكوين فلكلور',NULL,NULL),(31495,'فارس عبد المجيد ادريس محمد',0,'2012-01-29','faresaljoker@hotmail.com','929064625','الخرطوم جبرة مربع 15',1,NULL,NULL,'2016-01-20 10:43:43','2016-01-20 15:19:37',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الخرطوم','محاسبة',NULL,NULL),(31496,'هاجر ابراهيم حسن ادريس',1,'2011-02-21','hajer-2000@hotmail','122507048','اركويت مربع 68',1,NULL,NULL,'2016-01-20 10:43:43','2016-01-20 15:19:37',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'تقنية المعلومات',NULL,NULL),(31497,'اسلام الهادي يوسف الهادي',1,NULL,'BOTanist88@hotmail.com','999198891','الطائف مربع 53 منزل 204',1,NULL,NULL,'2016-01-20 10:43:44','2016-01-20 15:19:37',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الطائف','الكيمياءالحيويةوليولوجي',NULL,NULL),(31498,'علاء الدين محمد سيد',0,'2011-05-18','alinasr4@yahoo.com','923339356','اركويت مربع - 48',1,NULL,NULL,'2016-01-20 10:43:44','2016-01-20 15:19:37',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامكعه السودان كليه الغابات سوبا','غابات',NULL,NULL),(31499,'الترابي مختار احمد  عيد شين',0,'2011-09-06','abdushane@gmail.com','912915425','الخرطوم - بري',1,NULL,NULL,'2016-01-20 10:43:44','2016-01-20 15:19:37',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'محام السوق العربي عمارة السلام- محاضر جامعي','قانون',NULL,NULL),(31500,'فاطمة صلاح الدين محمد على',1,'2011-06-09','fatti_evectoi@hotmail.com','922182094','امدرمان - المربعات',1,NULL,NULL,'2016-01-20 10:43:44','2016-01-20 15:19:37',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم بيئية / قسم النبات','2015-01-01',NULL),(31501,'بابكر ادم القاسم علي',0,'2012-09-01','babekiradam5@yahoo.com','122892401','الخرطوم بحري طيبة',1,NULL,NULL,'2016-01-20 10:43:44','2016-01-20 15:19:37',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الخرطوم','جغرافيا اعلام',NULL,NULL),(31502,'محمد تاج السر ناصر',0,'2011-06-26','moh.tag81@hotmail.com','129002827','الخرطوم بحري الكدرو',2,NULL,NULL,'2016-01-20 10:43:44','2016-01-20 15:19:37',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'بحري','ادارة',NULL,NULL),(31503,'صالح عبدالله العريفى',0,'2011-06-09','nadia4ever@hotmail.com','18322754','الخرطوم -الرياض مربع 16-منزل 74',4,NULL,NULL,'2016-01-20 10:43:45','2016-01-20 11:37:09',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'محضر -جامعة الاحفاد للبنات','تخطيط إقليم / دراسات بيئية','2015-01-01',NULL),(31504,'إنعام احمد محمد صالح',1,'2011-06-16','inaamahmed_999@live.co.uk','912901054','الخرطوم',2,NULL,NULL,'2016-01-20 10:43:45','2016-01-20 15:19:37',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'دراسات بيئية','2015-01-01',NULL),(31505,'محمد حمد عبد الله الشيخ',0,'2011-10-19','moH.Hydo@yahoo.com','122174236','شرق النيل حي الهدى مربع 4',1,NULL,NULL,'2016-01-20 10:43:45','2016-01-20 15:19:37',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'شرق النيل','هندسة موارد مياة',NULL,NULL),(31506,'سيف الدولة محمد هارون محمد',0,'2011-06-27','kondl2381@yahoo.com','911236542','ابو سعد مربع 14 منزل 1314',1,NULL,NULL,'2016-01-20 10:43:45','2016-01-20 15:19:37',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'إدارة اعمال','2015-01-01',NULL),(31507,'بيان عوض عمر ابراهيم',1,'2013-10-02','BayaN','924884507','ام درمان ود البخيت المحطة',1,NULL,NULL,'2016-01-20 10:43:45','2016-01-20 15:19:37',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ام درمان','علوم بيئية',NULL,NULL),(31508,'اسمهان سومي زيدان عطية',1,'2013-11-20','Aymin-76@hotmail.com','923551384','اركويت م 64',2,NULL,NULL,'2016-01-20 10:43:45','2016-01-20 15:19:37',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'مهندس زراعى','تكنلوجيا البيئة','2015-01-01',NULL),(31509,'احمد فياض امام',0,'2013-10-02','ofi47@hotmail.com','20992963','ام درمان امبدة',1,NULL,NULL,'2016-01-20 10:43:45','2016-01-20 15:19:37',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ام درمان','علومة بيئية',NULL,NULL),(31510,'ريم الزمزمي احمد عثمان',1,'2012-12-26','reem.zam@live.com','917336162','الطائف مربع 22',1,NULL,NULL,'2016-01-20 10:43:45','2016-01-20 15:19:38',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الطائف','تصميم داخلي',NULL,NULL),(31511,'هناء شرف الدين العوض المهدى',1,'2012-09-05','zola124@live.com','111549441','شرق النيل / الجريف شرق',1,NULL,NULL,'2016-01-20 10:43:46','2016-01-20 15:19:38',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم/ أحياء تطبيقية','2015-01-01',NULL),(31512,'نعمة الشيخ محمد احمد',1,'2012-12-17','ni3ma.1@hotmail.com','910190235','الازهري مربع 13',1,NULL,NULL,'2016-01-20 10:43:46','2016-01-20 15:19:38',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الازهري','علوم غابات',NULL,NULL),(31513,'مجاهد احمد سليمان محمد',0,'2012-11-26','jojo31lom@hotmail.com','911457968','امدرمان- صالحه',1,NULL,NULL,'2016-01-20 10:43:46','2016-01-20 15:19:38',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعه الخرطوم','علوم احياء قسم النباتات',NULL,NULL),(31514,'نعمة الله محمد المهدى محمد كامل',1,'2012-08-30','nemashawki@hotmail.com','913507706','ام درمان شارع العرضة منزل رقم2782 م 4/3',1,NULL,NULL,'2016-01-20 10:43:46','2016-01-20 15:19:38',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'برنامج الامم المتحدة للبيئة','غابات','2015-01-01',NULL),(31515,'ريم قاسم عمر فضل السيد',1,'2012-11-26','sparrow900@live.com','991475307','امدرمان - العرضه جنوب',1,NULL,NULL,'2016-01-20 10:43:46','2016-01-20 15:19:38',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعه الخرطوم','علوم حيوان',NULL,NULL),(31516,'رزان معتصم بشير نمر',1,'2012-11-26','razannimir@gmail.com','916554031','الخرطوم - الجريف غرب مربع 84',1,NULL,NULL,'2016-01-20 10:43:46','2016-01-20 15:19:38',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعه الخرطوم','علوم حيوان / بيئيه',NULL,NULL),(31517,'فاطمه محمد الخير الصديق',1,'2001-06-15','psy767@hotmail.com','559132','امدرمان حي العمده',1,NULL,NULL,'2016-01-20 10:43:46','2016-01-20 15:19:38',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'صحيفه الخرطوم','علم نفس',NULL,NULL),(31518,'مناهل محمد سعيد الحسن',1,'2013-04-08','manahil.alhassan@gmail.com','917561222','اركويت مربع (50) منزل رقم 160',2,NULL,NULL,'2016-01-20 10:43:46','2016-01-20 15:19:38',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MBA','2015-01-01',NULL),(31519,'هويدا حسن محمد عبدالله',1,'2013-03-26','hidi-72010@hotmail.com','912472010','امدرمان ودنوباوى شمال',1,NULL,NULL,'2016-01-20 10:43:46','2016-01-20 15:19:38',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'حياة برية','2015-01-01',NULL),(31520,'ابوبكر عبد رحمن ابو سنة',0,'2013-01-17','bsitta@yahoo.com','918038156','الرياض مربع (7) منزل رقم 5',1,NULL,NULL,'2016-01-20 10:43:47','2016-01-20 15:19:38',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'مهندس مدنى','2015-01-01',NULL),(31521,'سعاد الرضى حامد آدم',1,'2011-11-20','hamidsuaad@hotmail.com','919321988','اركويت مربع 64',4,NULL,NULL,'2016-01-20 10:43:47','2016-01-20 11:37:09',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'تلوث البيئة وتأثيرها على النبات','2015-01-01',NULL),(31522,'محمد يوسف محمد يوسف',0,'2011-10-30','myuosif2010@yahoo.com','925356280',NULL,1,NULL,NULL,'2016-01-20 10:43:47','2016-01-20 15:19:38',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'لغة انجليزية','2015-01-01',NULL),(31523,'بدر الدين محمد ادم عبد الله',0,'2011-09-03','BadrEldin122@ yahoo.com','911221567','بحري ام القري جنوب مربع 4',1,NULL,NULL,'2016-01-20 10:43:47','2016-01-20 15:19:38',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الدراسات البيئية',NULL,NULL),(31524,'امين علي الخليفة الحسن',0,'2011-08-15','aminali.Alhkarlifa@yahoo.com','912844700','الخرطوم بحري حلة كوكو مربع 14 منزل 86',NULL,NULL,NULL,'2016-01-20 10:43:47','2016-01-20 10:43:47',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31525,'شيماء محمد يوسف عبد الرحيم',1,'2011-12-13','mamo88@live.com','922836487','الكلاكلة القلعة جنوب مربع 2 منزل رقم 355',1,NULL,NULL,'2016-01-20 10:43:47','2016-01-20 15:19:38',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'درء الكوارث - إدارة منظمات','2015-01-01',NULL),(31526,'خالد ميرغني عثمان مرحوم',0,'2011-04-15','Khalidmirghami129@hotmail','912960085','المهندسين',1,NULL,NULL,'2016-01-20 10:43:47','2016-01-20 15:19:38',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'استاذ','جغرافيا- تاريخ',NULL,NULL),(31527,'حامد عقب محمد عقب',0,'2012-03-01','hamidagab1@hotmail.com','122033589','الحتانة',1,NULL,NULL,'2016-01-20 10:43:48','2016-01-20 15:19:38',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة السودان للعلوم والتكنلوجيا - إنتاج حيوانى','علو الحياة البرية','2015-01-01',NULL),(31528,'صلاح احمد ابراهيم احمد',0,'2012-01-09','salah@yahoo.com','121049049','شرق النيل - ام دوم',1,NULL,NULL,'2016-01-20 10:43:48','2016-01-20 15:19:39',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'شركه لاند الهندسيه','محاسبه',NULL,NULL),(31529,'مناهل عمر صالح موسى',1,NULL,'manahilomer@yahoo.com','916464815','ام درمان بيت المال منزل 1-3-770',NULL,NULL,NULL,'2016-01-20 10:43:48','2016-01-20 10:43:48',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31530,'عبير عبد الحليم  حسن احمد',1,'2012-03-18','abeerabdalhleem@yahoo.com','912661450','امدرمان بانت شرق منزل رقم 794',2,NULL,NULL,'2016-01-20 10:43:48','2016-01-20 15:19:39',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم اسماك والحياة البرية','2015-01-01',NULL),(31531,'انشراح ادم دكم محمد',1,'2012-10-17','inshrahaaam@gmail.com','910155391','جبره جنوب مربع 14',2,NULL,NULL,'2016-01-20 10:43:48','2016-01-20 15:19:39',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'اداره بيئه',NULL,NULL),(31532,'مناهل عمر صالح موسى',1,NULL,'manahilomer@yahoo.com','916464815','ام درمان بيت المال',1,NULL,NULL,'2016-01-20 10:43:48','2016-01-20 15:19:39',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ام درمان بيت المال','تخطيط تنمويام',NULL,NULL),(31533,'تقوي حمد محمد علي الفضل',1,'2011-12-04','tagwahmd@yahoo.com','923822966','الجريف شرق دار السلام المغاربه مربع 3',1,NULL,NULL,'2016-01-20 10:43:48','2016-01-20 15:19:39',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'صحه عامه',NULL,NULL),(31534,'كوكب السر بابكر احمد',1,'2012-07-08','e.kawkab@yahoo.com','910005355','الديوم الغربية',1,NULL,NULL,'2016-01-20 10:43:48','2016-01-20 15:19:39',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هيئة البحوث الزراعية - مركز بحوث الغابات- وحدة التغيرات المناخية','زراعة',NULL,NULL),(31535,'لبني محمد عبد الله',1,'2011-02-13','lobnamoh2010@yahoo.com','912840550','كرري الحاره 39 الشنقيطي',2,NULL,NULL,'2016-01-20 10:43:49','2016-01-20 15:19:39',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هيئه ابحاث الثروه الحيوانيه','علوم حياه بريه',NULL,NULL),(31536,'ثريا محمد الانور محمد احمد',1,'2012-01-01','thoria.alonwer@hotmail.com','902196794','الكلاكة الوحدة',2,NULL,NULL,'2016-01-20 10:43:49','2016-01-20 15:19:39',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم بيئية',NULL,NULL),(31537,'عبد الله عوض محمد بشير',0,'2012-05-17','Shareefawad1978@hotmail.com','912201471','بحري - حي الهدي',2,NULL,NULL,'2016-01-20 10:43:49','2016-01-20 15:19:39',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'المجلس الاعلي للبيئة','علوم زراعية',NULL,NULL),(31538,'ايمان محمد عبد الرافع احمد',1,'2012-01-01','elhab61@yahoo.com','910544204','الخرطوم- الطائف- مربع 22',3,NULL,NULL,'2016-01-20 10:43:49','2016-01-20 15:19:39',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'مفتش بيئي','علوم بيئية',NULL,NULL),(31539,'دلال الطيب نور الدائم',1,'2011-12-07','dalal_eltahayer@hotmail.com','912858818','الخرطوم بري اللاماب مربع 6',2,NULL,NULL,'2016-01-20 10:43:49','2016-01-20 15:19:39',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هندسة زراعية',NULL,NULL),(31540,'هويدا حسن محمد عبد الله',1,'2012-07-05','Hidi-72010@hotmail.com','912472010','ام درمان -ود نوباوي- شمال',2,NULL,NULL,'2016-01-20 10:43:49','2016-01-20 15:19:39',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علةم بيئية',NULL,NULL),(31541,'سلمي عبد الغفار حسن الامين',1,'2011-02-23','Salma@hotmail.com','912831589','سوبا غرب',2,NULL,NULL,'2016-01-20 10:43:49','2016-01-20 15:19:39',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'مجمع بحوث الغابات السكني','علوم بيئية',NULL,NULL),(31542,'فاطمة الراهيم محمد يس',1,'2011-06-20','fatima_amins@hotmail.com','913510210','الطائف مربع 51/منزل 228',1,NULL,NULL,'2016-01-20 10:43:50','2016-01-20 15:19:39',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هندسة كيميائية / مصادر الطاقه','2015-01-01',NULL),(31543,'الامين ابراهيم مصطفي احمد',0,'2012-05-26','amiamin24@yahoo.com','121102401','امبده الحاره 7',1,NULL,NULL,'2016-01-20 10:43:50','2016-01-20 15:19:39',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'مدرسه خالد بن الوليد الحاره 16','تربيه',NULL,NULL),(31544,'اناهيد ميرغني علي خليفة',1,NULL,'anahed133@hotmail.com','912971756','الكلاكلة الوحدة مربع 6',1,NULL,NULL,'2016-01-20 10:43:50','2016-01-20 15:19:40',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الكلاكلة الوحدة','علومة بيئة',NULL,NULL),(31545,'فاطمة ابراهيم محمد الامين',1,'2011-06-20','fatimaalkazim@yahoo.com','919977272','الطائف - المعمورة',1,NULL,NULL,'2016-01-20 10:43:50','2016-01-20 15:19:40',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم','2015-01-01',NULL),(31546,'ولاء نقد الله اورسد',1,'2011-05-29','wallanogdalla@yahoo.com','926656340','امدرمان - الحتانه',2,NULL,NULL,'2016-01-20 10:43:50','2016-01-20 15:19:40',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'التنميه المستدامه',NULL,NULL),(31547,'عمر المبارك تاج احمد الامين',0,'2011-08-05','amr2819@hotmail.com','926314344','الخرطوم- امتداد ناصر',1,NULL,NULL,'2016-01-20 10:43:50','2016-01-20 15:19:40',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ادارة المنظمات',NULL,NULL),(31548,'رؤى حمد النيل كودى أنجلو',1,'2011-06-19','habibo1989@hotmail.com','916155552','امدرمان ابوروف - سوق الشجرة',1,NULL,NULL,'2016-01-20 10:43:50','2016-01-20 15:19:40',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'تمريض','2015-01-01',NULL),(31549,'سحر عباس بدوي',1,'2001-06-02','saharabbas@hotmail.com','532428','امدرمان - الثوره',1,NULL,NULL,'2016-01-20 10:43:51','2016-01-20 15:19:40',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم كيمياء',NULL,NULL),(31550,'نصر الدين حسين',0,'2001-03-25','amingussenscorpion@hotmail.com','12358335','الخرطوم اركويت شمال',1,NULL,NULL,'2016-01-20 10:43:51','2016-01-20 15:19:40',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم تربة',NULL,NULL),(31551,'خالد خضر محمد الفكي',0,'2011-01-24','khalidAlhor@yahoo.com','912969969','الخرطوم- الكلاكلة',1,NULL,NULL,'2016-01-20 10:43:51','2016-01-20 15:19:40',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ادارة الكوارث واللجئين',NULL,NULL),(31552,'ولاء احمد نور الدائم',1,'2011-01-24','walaa7med@yahoo.com','912556438','الخرطوم - الشجرة - مربع 2',1,NULL,NULL,'2016-01-20 10:43:51','2016-01-20 15:19:40',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'كيمياء',NULL,NULL),(31553,'صلاح محمد خاطر',0,'2011-06-09','salahkhater@hotmail.com','122997793','بحرى الحاج يوسف / شارع !',1,NULL,NULL,'2016-01-20 10:43:51','2016-01-20 15:19:40',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'صحيفة إيلاف','إقتصاد','2015-01-01',NULL),(31554,'تسابيح فيصل نصر احمد صديق',1,'2011-06-13','tasabehff@hotmail.com','913910252','الخرطوم - برى المحس',1,NULL,NULL,'2016-01-20 10:43:51','2016-01-20 15:19:40',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'صحة بيئة','2015-01-01',NULL),(31555,'نهي عبد القادر محمد محمد علي',1,'2001-10-28','nohafadlabi@hotmail.com','306545','بحري - شمبات',1,NULL,NULL,'2016-01-20 10:43:52','2016-01-20 15:19:40',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'كمياء حيويه وعلوم اغزيه',NULL,NULL),(31556,'الشازلي عبد الله سليمان',0,'2001-10-21','\\','317148','شمبات الاراضي',1,NULL,NULL,'2016-01-20 10:43:52','2016-01-20 15:19:40',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هندسه مدنيه',NULL,NULL),(31557,'نادر محمد بويسف علي',0,'2006-04-20','Nader2PAC77@hotmail.com','12466330','ام درمان ابروف',1,NULL,NULL,'2016-01-20 10:43:52','2016-01-20 15:19:40',48,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم حاسوب',NULL,NULL),(31558,'يعقوب محمد بابكر محمد ندورا',0,'2004-12-18','nadwra@hotmail.com','918010817','مجمع الوسط داخليات الجامعة',1,NULL,NULL,'2016-01-20 10:43:52','2016-01-20 15:19:41',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة الخرطوم','الاجتماع والانثربولوجية',NULL,NULL),(31559,'منى محمد هاشم الليثى',1,'2004-12-14','ellaithi_mona@yahoo.com','422393','جبلرة مربع 4',2,NULL,NULL,'2016-01-20 10:43:52','2016-01-20 15:19:41',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة افريقيا','مختبرات طبية',NULL,NULL),(31560,'فريدة حمدان الشيخ عبد القادر',1,'2004-12-15','fereedaefsheikh@hotmail.com','912361680','بورسودان',2,NULL,NULL,'2016-01-20 10:43:52','2016-01-20 15:19:41',62,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة البحر الاحمر بورسودان','البيئة البحرية',NULL,NULL),(31561,'عمر ابراهيم عبيد',0,'2004-06-09','Omer_eid@hotmail.com','912962441','الخرطوم',1,NULL,NULL,'2016-01-20 10:43:52','2016-01-20 15:19:41',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'كلية البيان للعلوم والتكنولوجيا','علوم',NULL,NULL),(31562,'موسى محمد يوسف البدري',0,'2004-05-06','musumyousif@yahoo.com','912815258','الصالحة',1,NULL,NULL,'2016-01-20 10:43:53','2016-01-20 15:19:41',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الوكالة الاسلامي للاغاثة','اعلام وصحافة',NULL,NULL),(31563,'عمر محمد الحسن جبريل',0,'2004-04-26','omerelhassan@hotmail.com','912627129','الثورة 10',1,NULL,NULL,'2016-01-20 10:43:53','2016-01-20 15:19:41',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'اداب لغة انجليزية',NULL,NULL),(31564,'هديل مصطفى عثمان كليب',1,'2004-03-15','haddool21@hotmail.com','912256588','الخرطوم',1,NULL,NULL,'2016-01-20 10:43:53','2016-01-20 15:19:41',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'شركة test للاستشارات الهندسية','هندسة معمارية',NULL,NULL),(31565,'ضياء الدين تاج الدين حماد الشيخ',0,'2004-03-07','dawamoon@maktoob.com','198070212','الخرطوم سوبا غرب م 61',1,NULL,NULL,'2016-01-20 10:43:53','2016-01-20 15:19:41',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم كيمياء',NULL,NULL),(31566,'سارة محمد بريمة',1,'2004-04-07','sara-env@yahoo.com','912997292','الخرطوم الثورة ح 11',1,NULL,NULL,'2016-01-20 10:43:53','2016-01-20 15:19:41',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم بيئية',NULL,NULL),(31567,'محمود احمد زاكي الدين',0,'2004-09-19','bluewall83@hotmail.com','912230069','الخرطوم بحري الدناقلة ش',1,NULL,NULL,'2016-01-20 10:43:53','2016-01-20 15:19:41',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'زراعة',NULL,NULL),(31568,'ماجدة مصطفى حلمى عابدين',1,'2004-04-14','magdahilmi@hotmail.com','912203812','كوبر م 3',2,NULL,NULL,'2016-01-20 10:43:53','2016-01-20 15:19:41',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'احياء دقيقة',NULL,NULL),(31569,'هدي جلال الدين يوسف',1,'2005-12-21','khalifahuda@hotmail.com','912148801','امدرمان-الشهداء',3,NULL,NULL,'2016-01-20 10:43:53','2016-01-20 15:19:41',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'وزارة العدل-ادارة العلاقات والاتفاقيات الدولية','قانون',NULL,NULL),(31570,'احلام ابراهيم عبدالحي احمد',1,'2005-12-18','ahlaamibrahim@hotmail.com','912230717','الحلفايا م 7',1,NULL,NULL,'2016-01-20 10:43:54','2016-01-20 15:19:41',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'شركة ميج موتورز للسيارات','هندسة ميكانيكية',NULL,NULL),(31571,'محمد فاروق نقد الله مكي',0,'2006-05-27','mohammedfaroog@hotmail.com','912599462','الخرطوم بحري - الصافيه',1,NULL,NULL,'2016-01-20 10:43:54','2016-01-20 15:19:41',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'اداره اعمال',NULL,NULL),(31572,'ابراهيم خليفه ادريس',0,'2006-05-13','heem-77@hotmial.com','911352537','الخرطوم - العشره',1,NULL,NULL,'2016-01-20 10:43:54','2016-01-20 15:19:41',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'صناعات كيميائيه',NULL,NULL),(31573,'عمر محمد  عبد الله عبد الهادي',0,'2007-03-15','Abusingli@yahoo.com','122532030','الابيض -',2,NULL,NULL,'2016-01-20 10:43:54','2016-01-20 15:19:42',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة كردفان','الانتاج الحيواني','2015-01-01',NULL),(31574,'مبارك احمد موسي',0,'2007-03-17','Mubavak122','911285395','الابيض - الرديف شرق',1,NULL,NULL,'2016-01-20 10:43:54','2016-01-20 15:19:42',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ادارة الزراعة والثروة الحيوانية والبيئة الابيض','اقتصاد زراعي','2015-01-01',NULL),(31575,'كمال محمد سليمان المكي',0,'2007-03-17','Kamal333333@hotmail.com','121089238','الابيض -',1,NULL,NULL,'2016-01-20 10:43:55','2016-01-20 15:19:42',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة كردفان كلية الموارد  الطبيعية','علوم التربة والمياة','2015-01-01',NULL),(31576,'عبد الله الطيب محمد زين',0,'2007-03-15','abdallazain@hotmail.com','122130508','الابيض -',2,NULL,NULL,'2016-01-20 10:43:55','2016-01-20 15:19:42',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة كردفان كلية الموارد الطبيعة','علوم الحشائش','2015-01-01',NULL),(31577,'زينب محمد حمادادم',1,'2007-03-16','bzeinab@yahoo.com','918219025','الابيض - القلعة ش',2,NULL,NULL,'2016-01-20 10:43:55','2016-01-20 15:19:42',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة كردفان كلية الموارد الطبيعية','غابات','2015-01-01',NULL),(31578,'وائل  محمد هارون احمد',0,'2007-03-15','wailharoon@yahoo.com','912658710','الابيض -القبةغ',1,NULL,NULL,'2016-01-20 10:43:55','2016-01-20 15:19:42',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة كردفان كلية الموارد الطبيعية','وقاية المحاصيل','2015-01-01',NULL),(31579,'الجودة محمد احمد محمد',0,'2007-03-15','Godak1239','912477024','الابيض',1,NULL,NULL,'2016-01-20 10:43:55','2016-01-20 15:19:42',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة كردفان كلية الموارد الطبيعية','علوم التربة  والمياة','2015-01-01',NULL),(31580,'عبد الرحمن احمد محمد',0,'2007-03-15','abuabda75@yahoo.com','912254789','الابيض',2,NULL,NULL,'2016-01-20 10:43:56','2016-01-20 15:19:42',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة كردفان كلية الموارد الطبيعية','احياء دقيقة','2015-01-01',NULL),(31581,'محمود علي عمسيب محمد',0,'2007-03-19','MadAmassaim@yahoo.com','122374955','الابيض',2,NULL,NULL,'2016-01-20 10:43:56','2016-01-20 15:19:43',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة كردفان كلية الموارد الطبيعية','اقتصاد زراعي','2015-01-01',NULL),(31582,'مجدي احمد محمد الجابري',0,'2007-03-19','meelgabri@yahoo.com','122298784','الابيض',2,NULL,NULL,'2016-01-20 10:43:56','2016-01-20 15:19:43',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'البحوث الزراعية الابيض','بساتين','2015-01-01',NULL),(31583,'حاتم عبد الله محمد الخضؤ',0,'2007-03-18','guzaia22@yahoo.com','912821153',' الابيض حي النصر',2,NULL,NULL,'2016-01-20 10:43:56','2016-01-20 15:19:43',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'البحوث الزراعية الابيض','غابات','2015-01-01',NULL),(31584,'احمد حنفي عبد الماجد',0,'2007-03-18','ahanati2001@yahoo.com','912161978','الاببيض',2,NULL,NULL,'2016-01-20 10:43:56','2016-01-20 15:19:43',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'برنامج ادارة الموارد غرب السودان','زراعية','2015-01-01',NULL),(31585,'محمد التوم الهجا ابو الحسن الهجا',0,'2007-03-18','elhaja75','122046109','الابيض',2,NULL,NULL,'2016-01-20 10:43:56','2016-01-20 15:19:43',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة كردفان كلية الموارد الطبيعية','علوم التربة والمياة','2015-01-01',NULL),(31586,'عثمان السيد عدلان عبد الكريم',0,'2007-12-03','Osmanraasta','918218363','الابيض',2,NULL,NULL,'2016-01-20 10:43:56','2016-01-20 15:19:43',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة كردفان كلية الموارد الطبيعية','تكنولوجيا اخشاب','2015-01-01',NULL),(31587,'محمد اليسع ابو القاسم ابراهيم',0,'2003-08-23','mdyasa@yahoo.com','912383037','الخرطوم',1,NULL,NULL,'2016-01-20 10:43:57','2016-01-20 15:19:43',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'وزارة الصحة الاتحادية-ادارة التخطيط','طب وجراحة',NULL,NULL),(31588,'عبدالله محمد احمد الشريف',0,'2003-08-23','alshareef5@hotmail.com','912985064','بحري-الميرغنية',1,NULL,NULL,'2016-01-20 10:43:57','2016-01-20 15:19:43',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'وزارة الصحة الاتحادية-ادارة البحوث','طب وجراحة',NULL,NULL),(31589,'عمر عبدالرحمن اسماعيل كبيدة',0,'2004-01-24','omerkibeda@hotmail.com','912971386','المهندسين م 30',1,NULL,NULL,'2016-01-20 10:43:57','2016-01-20 15:19:43',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'طب بيطري',NULL,NULL),(31590,'اسراء يوسف محمد عبدالله',1,'2004-12-01','tosha880@hotmail.com','912295507','جزيرة توتى',1,NULL,NULL,'2016-01-20 10:43:57','2016-01-20 15:19:43',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم بيئية',NULL,NULL),(31591,'عوض الله بلال دفع الله بلال',0,'2008-04-27','awodallah2000@hotmail.com','129462663',' الصحافة غرب م25الخرطوم',1,NULL,NULL,'2016-01-20 10:43:57','2016-01-20 15:19:43',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'وقاية محاصيل',NULL,NULL),(31592,'ازهري الحاج دفع الله',0,'2007-01-21','azharielkag@hotmail.com','912185893','الكلاكلة اللفة',2,NULL,NULL,'2016-01-20 10:43:57','2016-01-20 15:19:43',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'زراعة-اعلام',NULL,NULL),(31593,'محمد طه القدال',0,'2007-09-18','gadal55@hotmail.com','912350505','امبده الحاره الاولي',1,NULL,NULL,'2016-01-20 10:43:57','2016-01-20 15:19:43',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الاداره',NULL,NULL),(31594,'اسامة محمد احمد الشيخ ادريس',0,'2007-01-22','algass.sd88@hotmail.com','122889482','العيلفون م 7',1,NULL,NULL,'2016-01-20 10:43:58','2016-01-20 15:19:43',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'مجلة الحياة العلمية-الطائف-الشرقي','صحافة وعلاقات عامة',NULL,NULL),(31595,'خالد بشير محمد ادريس',0,'2008-04-20','khalidbasheir@yahoo.com','918279998','الخرطوم امبدة الحارة 4',2,NULL,NULL,'2016-01-20 10:43:58','2016-01-20 15:19:44',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم بيئة',NULL,NULL),(31596,'اميمه عبد العزيز حمتو محمد',1,'2007-10-03','omimahamedto@yahoo.com','914282782','امدرمان - بيت المال',2,NULL,NULL,'2016-01-20 10:43:58','2016-01-20 15:19:44',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم زراعيه',NULL,NULL),(31597,'شمس الدين عبد الرسول عبد الله محمد',0,'2007-09-26','shomos-1@yahoo.com','122531030','امبده الحاره 15',1,NULL,NULL,'2016-01-20 10:43:58','2016-01-20 15:19:44',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم غابات',NULL,NULL),(31598,'محمد الحافظ المكاشفي',0,'2007-05-05','melmukashfi@yahoo.com','155127437','بحري-الحاج يوسف',1,NULL,NULL,'2016-01-20 10:43:58','2016-01-20 15:19:44',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'احياء',NULL,NULL),(31599,'سامية محمد ابراهيم احمد',1,'2011-08-19','ssamiajokie@yahoo.com','912961080','القضارف',2,NULL,NULL,'2016-01-20 10:43:58','2016-01-20 15:19:44',44,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'اقتصاد زراعي','2015-01-01',NULL),(31600,'اقوم رين مبنج ادوت',1,'2004-09-18','agumrin@yahoo.com','912632556','جبرة مربع 15',1,NULL,NULL,'2016-01-20 10:43:58','2016-01-20 15:19:44',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة اعالى النيل مركز الخرطوم','علاقات عامة واعلام',NULL,NULL),(31601,'رفعت كباشي حسونة بابكر',0,'2004-09-13','rifaatka@yahoo.com','912869321','الخرطوم  بيت المال',4,NULL,NULL,'2016-01-20 10:43:58','2016-01-20 11:37:09',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هيئة الطاقة الزرية السودانية','كيمياء اشعاعية',NULL,NULL),(31602,'عبدالله بشري عمر نبق',0,'2004-08-15','abdallahnabag@hotmail.com','912374178','بري',1,NULL,NULL,'2016-01-20 10:43:59','2016-01-20 15:19:44',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'محاسبة',NULL,NULL),(31603,'عبد الرحيم احمد محمد علي',0,'2003-10-12','Abonaeof@hotmail.com','12883420',' الخرطوم الحاج يوسف',1,NULL,NULL,'2016-01-20 10:43:59','2016-01-20 15:19:44',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'انتاج حيواني',NULL,NULL),(31604,'تماضر صالح سعيد',1,'2004-06-09','tomoder_saeed@hotmail.com','912912699','الخرطوم 3',1,NULL,NULL,'2016-01-20 10:43:59','2016-01-20 15:19:44',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'كلية البيان للعلوم  والتكنولوجيا','فيزياء',NULL,NULL),(31605,'اجلال محي الدين ياسين',1,'2004-08-19','EglalMohildin@yahoo.com','912380000','الخرطوم',2,NULL,NULL,'2016-01-20 10:43:59','2016-01-20 15:19:44',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة الاحفاد','تغذية الانسان',NULL,NULL),(31606,'ماريا عزالدين صديق عزالدين',1,'2009-04-23','mariaezoo@yahoo.com','912964704','تندلتى',1,NULL,NULL,'2016-01-20 10:43:59','2016-01-20 15:19:44',47,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'مكتب وقاية النباتات','زراعة-وقاية نباتات','2015-01-01',NULL),(31607,'ندي صديق النعيم محمد نور',1,'2004-04-27','nadasidig@yahoo.com','912235705','داخلية جامعة الخرطوم',2,NULL,NULL,'2016-01-20 10:43:59','2016-01-20 15:19:44',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'اقتصاد زراعي',NULL,NULL),(31608,'نادر عثمان مصطفي عبدالله',0,'2004-10-04','nas-098@maktoob.com','912284389','جبرة م 9',1,NULL,NULL,'2016-01-20 10:43:59','2016-01-20 15:19:44',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'شركة افراس للطرق والحفريات','هندسة زراعية',NULL,NULL),(31609,'العز فضل الله الحاج',0,'2003-08-25','fadlalla_alaiz@hotmail.com','1312124480','بحري-المزاد',1,NULL,NULL,'2016-01-20 10:44:00','2016-01-20 15:19:44',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الادارة',NULL,NULL),(31610,'فاطمة الزهراء عمر مصطفي',1,'2003-08-27','fezome@yahoo.com','912383037','الخرطوم',1,NULL,NULL,'2016-01-20 10:44:00','2016-01-20 15:19:44',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'وزارة الصحة الاتحادية-ادارة البحوث','طب وجراحة',NULL,NULL),(31611,'افاق محمد صادق محمد',1,'2003-08-21','afarish14@hotmail.com','912245376','الكلاكلة-القلعة',2,NULL,NULL,'2016-01-20 10:44:00','2016-01-20 15:19:44',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة جوبا-كلية الاقتصاد','اقتصاد وعلوم سياسية',NULL,NULL),(31612,'هند الزين مكي المنا',1,'2003-08-21','hindelmana@hotmail.com','912281381','شمبات',2,NULL,NULL,'2016-01-20 10:44:00','2016-01-20 15:19:45',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هيئة الثقافة الحيوية والهندسة الوراثية-المركز القومب للبحوث','زراعة انسجة نباتية',NULL,NULL),(31613,'موريس اوبوانا لاتنسيو لوفول',0,'2003-08-21','abwona2001@yahoo.com','912990171','الحاج يوسف-الردمية م 12',1,NULL,NULL,'2016-01-20 10:44:00','2016-01-20 15:19:45',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'لجنة الانقاذ الدولية','الدراسات البيئية',NULL,NULL),(31614,'محمد منصور محمد حسن سعد',0,'2003-02-19','munsphone@hotmail.com','912141570','حي الصفا',2,NULL,NULL,'2016-01-20 10:44:00','2016-01-20 15:19:45',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'التخطيط العمراني',NULL,NULL),(31615,'نازك التجاني ابراهيم حمد',1,'2006-11-29','nazik7777@hotmail.com','912237059','الخرطوم بيت المال شمال',1,NULL,NULL,'2016-01-20 10:44:00','2016-01-20 15:19:45',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'نظم معلومات تجارية',NULL,NULL),(31616,'رشا مصطفي محمد علي',0,'2006-09-17','Wdaha39@hotmail.com','914086459','الخرطوم الثورة ح 19',1,NULL,NULL,'2016-01-20 10:44:00','2016-01-20 15:19:45',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'تنمية ريفية',NULL,NULL),(31617,'ابراهيم الصديق الشيخ',0,'2004-05-01','ibrahimbadur57@hotmail.com','912275446','بحري-الدروشاب',1,NULL,NULL,'2016-01-20 10:44:01','2016-01-20 15:19:45',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'وزارة الصحة الاتحادية-التثقيف الصحي','تثقيف صحي',NULL,NULL),(31618,'شمس الدين عبد الرسول',0,'2006-12-11','shams111deen@yahoo.com','122531030','الخرطوم ام بدة ح15',1,NULL,NULL,'2016-01-20 10:44:01','2016-01-20 15:19:45',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'غابات',NULL,NULL),(31619,'دارالسلام عبدالملك عبدالله',1,'2006-08-26','dur2006@hotmail.com','922768340',NULL,1,NULL,NULL,'2016-01-20 10:44:01','2016-01-20 15:19:45',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'قانون',NULL,NULL),(31620,'ابوبكر ابراهيم محمد حسين',0,'2006-08-27','abubakahussein@hotmail.com','912133391','امدرمان',4,NULL,NULL,'2016-01-20 10:44:01','2016-01-20 11:37:09',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة الخرطوم-كلية الزراعة','اقتصاد زراعي',NULL,NULL),(31621,'عبدالحميد عبدالله ابراهيم',0,'2006-08-28','hamedsad@hotmail.com','122070524','ودالبنا',0,NULL,NULL,'2016-01-20 10:44:01','2016-01-20 15:19:45',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31622,'عبد المنعم  عبد الله بحيري عدني',0,'2005-09-04','Abdo.2.22@hotmail.com','918261550','الخرطوم الثورة الحارة 4',3,NULL,NULL,'2016-01-20 10:44:01','2016-01-20 15:19:45',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'مصارف',NULL,NULL),(31623,'عثمان جلال الدين حامد عثمان',0,'2005-10-04','osmangalal@hotmail.com','183238655','الخرطوم اركويت البلابل م61',1,NULL,NULL,'2016-01-20 10:44:01','2016-01-20 15:19:45',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'زراعة',NULL,NULL),(31624,'راضي علي امين محمد',0,'2007-05-01','radie@yahoo.com','912527122','غرب دارفور-زالنجي',2,NULL,NULL,'2016-01-20 10:44:02','2016-01-20 15:19:45',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الادارة العامة للنشاط الطلابي','هندسة زراعية',NULL,NULL),(31625,'نسرين عمر احمد نيل',1,'2008-09-06','Senina.neil@yahoo.com','922852154','الخرطوم',2,NULL,NULL,'2016-01-20 10:44:02','2016-01-20 15:19:45',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ادارة اعمال',NULL,NULL),(31626,'رامي يوسف العركي',0,'2007-03-20','rraammiss@hotmail.com','912792020','الكلاكلة صنقعت',1,NULL,NULL,'2016-01-20 10:44:02','2016-01-20 15:19:45',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'اقتصاد وتنمية ريفية',NULL,NULL),(31627,'نهلة البدوي محمد سليمان',1,'2007-03-15','nahla12@maktoob.com','912989954','الحاج يوسف-المايقوما',1,NULL,NULL,'2016-01-20 10:44:02','2016-01-20 15:19:45',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'لغة انجليزية',NULL,NULL),(31628,'ميسون حمد النيل عثمان بخيت',1,'2007-10-20','noonomarabi80@hltmail.com','912971150','الثوره الحاره 20',1,NULL,NULL,'2016-01-20 10:44:02','2016-01-20 15:19:45',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم كيمياء',NULL,NULL),(31629,'فيصل محمد ابراهيم شبو',0,'2007-10-03','ags-shibo@yahoo.com','918068917','ابو سعد مربع 17',1,NULL,NULL,'2016-01-20 10:44:02','2016-01-20 15:19:46',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'اداره اعمال',NULL,NULL),(31630,'هدي جلال الدين يوسف',1,'2007-02-14','khalifahuda@hotmail.com','913855631','امدرمان-الشهداء',3,NULL,NULL,'2016-01-20 10:44:02','2016-01-20 15:19:46',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'وزارة العدل-ادارة المشاريع','قانون',NULL,NULL),(31631,'عاصم علي محمد ابا الزين',0,'2007-05-29','asomi7@hotmail.com','122102098','ابوسعد م 15',1,NULL,NULL,'2016-01-20 10:44:02','2016-01-20 15:19:46',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'لغة انجليزية',NULL,NULL),(31632,'الهام سيد محجوب السيد',1,'2007-09-05','ilhamsayed@yahoo.com','913540870','اركويت مربع 45',4,NULL,NULL,'2016-01-20 10:44:02','2016-01-20 11:37:09',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعه السودان كليه الهندسه - قسم الميكانيكا','هندسه بيئيه',NULL,NULL),(31633,'حرم عثمان احمد الشيخ',1,'2007-05-28','haramosman@yahoo.com','915182691',NULL,2,NULL,NULL,'2016-01-20 10:44:03','2016-01-20 15:19:46',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الخرطوم-عمارة النخيل مكتب رقم 9','محاماة',NULL,NULL),(31634,'موسي محمد موسي محمود',0,'2008-02-13','moas-1000@yahoo.com','912185805','الخرطوم الازهري 14',1,NULL,NULL,'2016-01-20 10:44:03','2016-01-20 15:19:46',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الفيزياء - رياضيات',NULL,NULL),(31635,'رزان ابوالقاسم حسن احمد الجرافي',1,'2007-05-30','rzngasim@hotmail.com','91261932','الجريف غرب ح 5',1,NULL,NULL,'2016-01-20 10:44:03','2016-01-20 15:19:46',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم كيمياء',NULL,NULL),(31636,'محمود عبدالمنعم محمد',0,'2004-03-17','noksh88@hotmail.com','912827375','الثورة 13',1,NULL,NULL,'2016-01-20 10:44:03','2016-01-20 15:19:46',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جغارفيا',NULL,NULL),(31637,'نادر عوض احمد محمد',0,'2004-03-24','nido544@hotmail.com','912617475','الصحافة شرق',1,NULL,NULL,'2016-01-20 10:44:03','2016-01-20 15:19:46',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة افريقيا العالمية','مختبرات طبية',NULL,NULL),(31638,'ريم الصادق ابو زيد الخليفة',1,'2003-06-23','emalyremon783@hotmail.com','912247021','الطائف م 22',1,NULL,NULL,'2016-01-20 10:44:04','2016-01-20 15:19:46',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ادارة اعمال',NULL,NULL),(31639,'اسامة عبد الهادي عبد الرحمن عبد الله',0,'2003-07-28','Jokbar@hotmail.com','12252859','الخرطوم بانت',1,NULL,NULL,'2016-01-20 10:44:04','2016-01-20 15:19:46',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هندسة مدنية',NULL,NULL),(31640,'احمد محمد محمد هاشمي',0,'2009-02-03','ba14everrr@hotmail.com','916530909','الحاج يوسف مربع 5',1,NULL,NULL,'2016-01-20 10:44:04','2016-01-20 15:19:46',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'قانون',NULL,NULL),(31641,'ايثار عبدالقادر احمد عبدالقادر',1,'2009-12-02','etharahmed77@yahoo.com','922763078','امدرمان-الجرافة',1,NULL,NULL,'2016-01-20 10:44:04','2016-01-20 15:19:46',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم بيئية','2015-01-01',NULL),(31642,'زرياب ابراهيم خضر احمد',0,'2009-11-13','ziryab@live.com','922763087','امدرمان-ابوروف',3,NULL,NULL,'2016-01-20 10:44:04','2016-01-20 15:19:46',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هندسة الكترونيات','2015-01-01',NULL),(31643,'سارة جعفر محمد الحسن',1,'2009-01-11','saror2006@hotmail.com','912931528','المجاهدين',1,NULL,NULL,'2016-01-20 10:44:04','2016-01-20 15:19:46',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة الخرطوم الطبية','احياء','2015-01-01',NULL),(31644,'حسام الدين محمد طالب الله',0,'2006-08-23','ealballa@yahoo.com','912560340','المهندسين',1,NULL,NULL,'2016-01-20 10:44:04','2016-01-20 15:19:46',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'معهد ابحاث البيئة والموارد الطبيعية','هندسة كيميائية',NULL,NULL),(31645,'احمد ادم ابراهيم محمد',0,'2006-08-15','ahmeday97@hotmail.com','912836740','بانت غرب م 4',1,NULL,NULL,'2016-01-20 10:44:04','2016-01-20 15:19:47',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هندسة نفط',NULL,NULL),(31646,'عمر سعيد محمد عثمان',0,'2006-08-15','omersaeedggg@yahoo.com','922516028','بانت غرب م 4',1,NULL,NULL,'2016-01-20 10:44:05','2016-01-20 15:19:47',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'التقانة الحيوية',NULL,NULL),(31647,'عبدالباسط محمد الفكي بكر',0,'2006-08-15','abdelbased3@hotmail.com','122099495',NULL,1,NULL,NULL,'2016-01-20 10:44:05','2016-01-20 15:19:47',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'وزارة الطاقة-ابوسعد','هندسة كهرباء',NULL,NULL),(31648,'زكريا حمزة محمد صديق',0,'2006-04-01','zsiddig@hotmail.com','912301638','الدوحة-الخرطوم م 12',1,NULL,NULL,'2016-01-20 10:44:05','2016-01-20 15:19:47',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'شركة النيل الكبري للبترول','محاسبة ادارة مالية',NULL,NULL),(31649,'احمد حسن محمد احمد حامد',0,'2006-07-18','ahmed-hassan57@hotmail.com','922069714','الفتيحاب',1,NULL,NULL,'2016-01-20 10:44:05','2016-01-20 15:19:47',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'تربيه',NULL,NULL),(31650,'وضاح حسب الرسول عبد المتعال سيد احمد',0,'2008-10-11','faresttlra11@hotmail.com','121695553','الخرطوم شمبات ش م15',1,NULL,NULL,'2016-01-20 10:44:05','2016-01-20 15:19:47',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم غابات',NULL,NULL),(31651,'معتصم مكي محمود الرشيد',0,'2005-12-21','mutasimmekki@yahoo.com','918089615','الشعبية جنوب',4,NULL,NULL,'2016-01-20 10:44:05','2016-01-20 11:37:09',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة اعالي النيل-كلية الزراعة','اقتصاد زراعي',NULL,NULL),(31652,'محمد المنتصر احمد',0,'2009-05-24','ahmed@iit.edu.','912164200','الخرطوم',4,NULL,NULL,'2016-01-20 10:44:06','2016-01-20 11:37:09',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعه الخرطوم','هندسه مدنيه',NULL,NULL),(31653,'رفيدة احمد عبد السلام عطا المنان',1,'2008-11-08','Rufaidaa','912652431','الخرطوم شمبات الاراضي م 4',1,NULL,NULL,'2016-01-20 10:44:06','2016-01-20 15:19:47',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم غابات',NULL,NULL),(31654,'مكارم معتصم محمد مصطفي',1,'2005-11-30','makarimas@yahoo.com','912979066',NULL,2,NULL,NULL,'2016-01-20 10:44:06','2016-01-20 15:19:47',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة اعالي النيل-العمارات ش 53','الكيمياء الحيوية',NULL,NULL),(31655,'سوزان عبدالله محي الدين',1,'2005-11-29','nazso103@yahoo.com','912131497','الطائف جنوب',1,NULL,NULL,'2016-01-20 10:44:06','2016-01-20 15:19:47',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'عقاقير طبية',NULL,NULL),(31656,'محمد بركة محمد',0,'2005-09-22','kurambe@hotmail.com','918261895','امبدة الحارة 6',1,NULL,NULL,'2016-01-20 10:44:06','2016-01-20 15:19:47',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'شريعة وقانون',NULL,NULL),(31657,'احمد الطيب احمد المصطفي بدر',0,'2006-01-10','besteom2@hotmail.com','912303923','الخرطوم الرياض م 7',2,NULL,NULL,'2016-01-20 10:44:06','2016-01-20 15:19:47',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'زراعة',NULL,NULL),(31658,'محمد احمد عبد العزيز عبد الله',0,'2006-08-10','habooshi1ramrar@yahoo.com','122145736','الخرطوم الثورة ح 6',1,NULL,NULL,'2016-01-20 10:44:07','2016-01-20 15:19:47',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31659,'محمد عثمان عيسي محمد عثمان',0,'2004-11-01','alhagmo@yahoo.com','912988167','الكلاكلة-القبة',2,NULL,NULL,'2016-01-20 10:44:07','2016-01-20 15:19:47',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة امدرمان الاسلامية-كلية الزراعة','انتاج حيواني-انتاج البان',NULL,NULL),(31660,'مجاهد عوض السيد قسم السيد علي',0,'2006-07-26','elseed2005@yahoo.com','912101145','الثورة ح 14',1,NULL,NULL,'2016-01-20 10:44:07','2016-01-20 15:19:47',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'اعلام سياسي',NULL,NULL),(31661,'وليد محمد حسن احمد',0,'2006-07-26','welywely80@yahoo.com','151624410','المقرن غرب',1,NULL,NULL,'2016-01-20 10:44:07','2016-01-20 15:19:47',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'صحافة واعلام',NULL,NULL),(31662,'خالد علي محمد الامام',0,'2008-05-11','Elimamkhalid@hotmail.com','923200342',' الخرطوم',2,NULL,NULL,'2016-01-20 10:44:07','2016-01-20 15:19:48',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ادارة اعمال',NULL,NULL),(31663,'ندي مصدر مصدر محمد',1,'2006-07-17','nada204@hotmail.com','915059423','امدرمان - الدوحه',1,NULL,NULL,'2016-01-20 10:44:07','2016-01-20 15:19:48',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'اداب لغه فرنسيه',NULL,NULL),(31664,'عثمان عبدالفتاح حمد',0,'2005-08-12','osman@almohager.biz','918104342','الرياض ش 117',3,NULL,NULL,'2016-01-20 10:44:07','2016-01-20 15:19:48',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم كمبيوتر',NULL,NULL),(31665,'يامن محمد علي',1,'2005-08-12','yamin-alshaikh@hotmail.com','912189431','الرياض',1,NULL,NULL,'2016-01-20 10:44:07','2016-01-20 15:19:48',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'لغة انجليزية',NULL,NULL),(31666,'هجومحمد عبدالماجد',0,'2005-11-28','hagomagid@hotmail.com','912811780','شمبات',4,NULL,NULL,'2016-01-20 10:44:08','2016-01-20 11:37:09',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'كلية الزراعة-جامعة الخرطوم','علوم التربة والبيئية',NULL,NULL),(31667,'وليد احمد المبارك',0,'2005-08-29','weleymobark@yahoo.com','922809834','ودنوباوي',1,NULL,NULL,'2016-01-20 10:44:08','2016-01-20 15:19:48',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'انتاج حيواني',NULL,NULL),(31668,'خضر عبدالله كوال دينق',0,'2008-12-11','khidir14332@yahoo.com','911314332','الخرطوم الكلاكلة القبة غرب',1,NULL,NULL,'2016-01-20 10:44:08','2016-01-20 15:19:48',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'دراسات بيئية',NULL,NULL),(31669,'همام علي عبدالرحمن',0,'2006-05-08','hammam124@hotmail.com','912566850','الحاج يوسف-الفتيحاب م 2',1,NULL,NULL,'2016-01-20 10:44:08','2016-01-20 15:19:48',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'اداب انجليزي',NULL,NULL),(31670,'ساره عبد القادر محمد ابراهيم',1,'2006-01-21','sara78889@hotmail.com','912478889','العمارات شارع 59',1,NULL,NULL,'2016-01-20 10:44:08','2016-01-20 15:19:48',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعه الخرطوم  - كليه العلوم قسم الكيمياء','علوم كيمياء',NULL,NULL),(31671,'يعقوب محمد بابكر محمد',0,'2006-04-08','nadwra@hotmail.com','918010817','الفتيحاب مربع 14',1,NULL,NULL,'2016-01-20 10:44:08','2016-01-20 15:19:49',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علم اجتماع',NULL,NULL),(31672,'هند احمد عيسي خلف الله',1,'2006-04-08','hind-eisa55@yahoo.com','922670839','الخرطوم - جبره',1,NULL,NULL,'2016-01-20 10:44:08','2016-01-20 15:19:49',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم فيزياء',NULL,NULL),(31673,'عبدالمنعم عبدالرحيم عبدالهادي عمر',0,'2005-11-23','moon3m-100@hotmail.com','912290671','ابوكدوك-امدرمان',1,NULL,NULL,'2016-01-20 10:44:08','2016-01-20 15:19:49',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'فنون تشكيل-بنوك وتجارة خارجية',NULL,NULL),(31674,'هجو محمد عبد الماجد',0,'2006-03-19','hagomagid@hotmail.com','912811780','الخرطوم',4,NULL,NULL,'2016-01-20 10:44:09','2016-01-20 11:37:09',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعه الخرطوم كليه الزراعه','علوم التربه',NULL,NULL),(31675,'فاطمة عبدالفتاح عبدالحليم محمد',1,'2005-08-14','teeena3@hotmail.com','912686991','بحري-حلة حمد',1,NULL,NULL,'2016-01-20 10:44:09','2016-01-20 15:19:49',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'فيزياء-رياضيات',NULL,NULL),(31676,'وصال احمد عبد الهادي عثمان',1,'2006-03-19','wisal-king@yahoo.com','911389380','امبده الحاره 6',2,NULL,NULL,'2016-01-20 10:44:09','2016-01-20 15:19:49',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'اقتصاد زراعي',NULL,NULL),(31677,'هارون محمد ادم اسحق',0,'2005-10-23','harown2001@hotmail.com','911113404','الجريف شرق',1,NULL,NULL,'2016-01-20 10:44:09','2016-01-20 15:19:49',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'صحافة',NULL,NULL),(31678,'ميسم مصلح محمد الامين',1,'2006-02-21','maysam69@hotmail.com','922230487','الخرطوم 3',2,NULL,NULL,'2016-01-20 10:44:09','2016-01-20 15:19:49',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'زراعه',NULL,NULL),(31679,'مزمل الباقر محمد احمد العاقب',0,'2000-11-16','m.alaagib4@yahoo.com','918058510','الخرطوم حي العرب ق',1,NULL,NULL,'2016-01-20 10:44:09','2016-01-20 15:19:49',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'زراعة',NULL,NULL),(31680,'سحر عبدالرحمن دفع الله',1,'2005-05-10','saharad369@yahoo.com','912919263','المهندسين م 30',1,NULL,NULL,'2016-01-20 10:44:09','2016-01-20 15:19:49',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'طب',NULL,NULL),(31681,'مي محمد علي ميرغني',1,'2005-06-15','mie-mohamed@hotmail.com','912951838','المهندسين مربع 30',2,NULL,NULL,'2016-01-20 10:44:09','2016-01-20 15:19:49',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'المركز القومي للبحوث','معلومات ومكتبات',NULL,NULL),(31682,'احمد محمد الهادي محمد كدودة',0,'2007-03-15','ahmedkadoda@hotmail.com','912876000','المنشية م 25',1,NULL,NULL,'2016-01-20 10:44:10','2016-01-20 15:19:49',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم جيولوجيا',NULL,NULL),(31683,'رتيبه عبد القادر حاج ابو بكر',1,'2008-02-07','ratiebahaj@yahoo.com','912951942','الخرطوم الصحافة م32',4,NULL,NULL,'2016-01-20 10:44:10','2016-01-20 11:37:09',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'معهد ابحاث الطاقة بري','تخطيط تنموي وتدريب',NULL,NULL),(31684,'حسن محمد حماد',0,'2007-02-22','hasan400@yahoo.com','912141542','المعمورة م 71',4,NULL,NULL,'2016-01-20 10:44:10','2016-01-20 11:37:10',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'قانون دولي',NULL,NULL),(31685,'امير صلاح محمد حمد',0,'2008-06-29','ameer_Salah82@hotmail.com','912200839','الخرطوم الصحافة م31',1,NULL,NULL,'2016-01-20 10:44:10','2016-01-20 15:19:49',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هندسة تعدين',NULL,NULL),(31686,'وفاء محمد عبدالله علي',1,'2007-02-13','wafaali22@yahoo.com','912116481','الثورة ح 9',1,NULL,NULL,'2016-01-20 10:44:10','2016-01-20 15:19:49',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'اداب-انجليزي',NULL,NULL),(31687,'شول ديفيد قاتويج نيال',0,'2008-06-24','chol.David@yahoo.com','912440181','الحاج يوسف',1,NULL,NULL,'2016-01-20 10:44:10','2016-01-20 15:19:50',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ضابط اداري','ادارة عامة',NULL,NULL),(31688,'محمد المعز مالك',0,'2007-11-28','moi3malik@hotmail.com','924632040','الخرطوم',4,NULL,NULL,'2016-01-20 10:44:10','2016-01-20 11:37:10',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'اداره',NULL,NULL),(31689,'عبد الحميد الدرديري محمد احمد نقد',0,'2008-02-15','hameednugud@hotmail.com','924768870','الخرطوم',4,NULL,NULL,'2016-01-20 10:44:10','2016-01-20 11:37:10',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'المعمل القومي الصحي','مختبرات طبية',NULL,NULL),(31690,'الطيب سليمان القرشي علي',0,'2005-03-15','tayebgorashi@hotmail.com','912378810',NULL,2,NULL,NULL,'2016-01-20 10:44:11','2016-01-20 15:19:50',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'شركة دال للخدمات الزراعية-الخرطوم','زراعة انسجة نباتية',NULL,NULL),(31691,'رزان معتصم بشير نمر',1,'2007-12-15','razona4444@hotmail.com','911113934','اركويت مربع 61',1,NULL,NULL,'2016-01-20 10:44:11','2016-01-20 15:19:50',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعه الخرطوم','علوم احياء',NULL,NULL),(31692,'هالة محمد البكري الزين',1,'2007-02-12','halaleena@yahoo.com','912645594','الخرطوم المهندسين',2,NULL,NULL,'2016-01-20 10:44:11','2016-01-20 15:19:50',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ادارة التدريب  الجمارك العمارات شارع 11','دراسات بيئية',NULL,NULL),(31693,'محمد ابراهيم عبدة مصطفي(كبج)',0,'2008-10-27','RABAJ4@GMAIL.COM','912257111','ام درمان الحي الاكاديمي',1,NULL,NULL,'2016-01-20 10:44:11','2016-01-20 15:19:50',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31694,'عبد الرحيم الامين عبد الله الفكي',0,'2008-02-12','ABDOWATER@HOTMAIL.COM','911704773','الخرطوم',1,NULL,NULL,'2016-01-20 10:44:11','2016-01-20 15:19:50',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هندسة مياة وبيئة',NULL,NULL),(31695,'محمد الفاتح حسن',0,'2005-08-10','elfatih4f@yahoo.com','912575821','الجريف غرب',1,NULL,NULL,'2016-01-20 10:44:11','2016-01-20 15:19:50',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ادارة اعمال',NULL,NULL),(31696,'مجدي عبد الرحمن محمد رحمة',0,'2005-08-01','mr-magDey@hotmail.com','12902175','الخرطوم اركويت م 61',1,NULL,NULL,'2016-01-20 10:44:11','2016-01-20 15:19:50',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'مختبرات طبية',NULL,NULL),(31697,'عمر عبدالكريم الوسيلة',0,'2005-10-11','oamer_wesila@yahoo.com','918196751','الثورة ح 21',1,NULL,NULL,'2016-01-20 10:44:12','2016-01-20 15:19:50',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'الهيئة القومية للغابات','غابات وتخطيط وتنمية اقليمية',NULL,NULL),(31698,'حسن احمد الحاج بابا',0,'2005-10-15','hassan@zinanet.net','912275028','امتداد ناصر م 2',1,NULL,NULL,'2016-01-20 10:44:12','2016-01-20 15:19:50',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'وزارة الخارجية-قسم المعلومات','فيزياء-رياضيات',NULL,NULL),(31699,'عامر محمد الامين مختار حامد',0,'2005-10-19','aamiramin73@hotmail.com','912275028','امدرمان',1,NULL,NULL,'2016-01-20 10:44:12','2016-01-20 15:19:50',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'احصاء-حاسوب',NULL,NULL),(31700,'عمر ادم خاطر',0,'2004-02-05','Kadro1@hotmail.com','912519668','الخرطوم',1,NULL,NULL,'2016-01-20 10:44:12','2016-01-20 15:19:50',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هندسة مدنية',NULL,NULL),(31701,'فؤاد الياس فؤاد قرنفلي',0,'2005-09-13','fouad1@posmaster.co.vk','912491176','الخرطوم 2',1,NULL,NULL,'2016-01-20 10:44:12','2016-01-20 15:19:50',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'منظمة جوهانيز-العمارات ش 33','مختبرات طبية',NULL,NULL),(31702,'عبدالرحمن حامد عبدالرحمن هاشم',0,'2005-12-09','dahamy2002@yahoo.com','918119857','الصحافة م 30',2,NULL,NULL,'2016-01-20 10:44:12','2016-01-20 15:19:50',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'مشروع سوبا الزراعي','وقاية محاصيل',NULL,NULL),(31703,'ازهريه عبد الباقي البشري علي',1,'2006-07-31','azharia2000@yahoo.com','912271291','الخرطوم',2,NULL,NULL,'2016-01-20 10:44:12','2016-01-20 15:19:50',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعه جوبا كليه المورد','اقتصاد زراعي',NULL,NULL),(31704,'محمد خليفة محمد الصلحي',0,'2006-02-19','samokh2000@yahoo.com','922751017','الرياض م 17',1,NULL,NULL,'2016-01-20 10:44:12','2016-01-20 15:19:51',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم بيطرية',NULL,NULL),(31705,'خنساء احمد علي بشير',1,'2008-11-24','sukareena@yahoo.com','918048699',' الخرطوم الحلفايا م4',1,NULL,NULL,'2016-01-20 10:44:13','2016-01-20 15:19:51',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'قانون',NULL,NULL),(31706,'شريف حسن فتح الرحمن حسن',0,'2005-06-30','shosh11@hotmail.com','912989117','الطائف م 23',1,NULL,NULL,'2016-01-20 10:44:13','2016-01-20 15:19:51',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هندسة كمبيوتر',NULL,NULL),(31707,'هاشم ابراهيم البدوي',0,'2005-05-29','kandaka@hotmail.com','912560757','بحري الخوجلاب',1,NULL,NULL,'2016-01-20 10:44:13','2016-01-20 15:19:51',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'مخرج وممثل مسرحي','دراما',NULL,NULL),(31708,'سلمي عمر عوض الله',1,'2005-06-19','sawaadalla@yahoo.com','912953465','العمارات م 11',2,NULL,NULL,'2016-01-20 10:44:13','2016-01-20 15:19:51',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم بيئية',NULL,NULL),(31709,'شهاب ابراهيم الطيب سعيد',0,'2007-02-14','bagan788@yahoo.com','122907609','الجريف شرق',1,NULL,NULL,'2016-01-20 10:44:13','2016-01-20 15:19:51',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'تربية-كيمياء',NULL,NULL),(31710,'رياض عبدالمنعم عبدالرحمن محمد',0,'2007-12-03','ryadelostaz@yahoo.com','923720718','المسعودية',1,NULL,NULL,'2016-01-20 10:44:13','2016-01-20 15:19:51',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هندسة تعدين',NULL,NULL),(31711,'عائشة عثمان سعيد عثمان',1,'2008-03-07','lavandrred@yahoo.com','16626724',' الرطوم الجريف شرق',1,NULL,NULL,'2016-01-20 10:44:13','2016-01-20 15:19:51',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'معمار',NULL,NULL),(31712,'ميسون عبدالمنعم مصطفي الامين',1,'2007-03-14','mamdmin@yahoo.com','923019092','الرياض',1,NULL,NULL,'2016-01-20 10:44:13','2016-01-20 15:19:51',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31713,'عمر  خالد الحسن صلاح',0,'2008-07-13','civillows@yahoo.com','912107221','الخرطوم السكن الفاخر 551',1,NULL,NULL,'2016-01-20 10:44:14','2016-01-20 15:19:51',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'قانون - هندسة مدنية',NULL,NULL),(31714,'ولاء نقد الله اورسد نقد الله',1,'2008-03-06','walanogdalla@yahoo.com','922292477','الخرطوم الحتانة ش م 8',1,NULL,NULL,'2016-01-20 10:44:14','2016-01-20 15:19:51',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'تنمية وارشاد ريفي',NULL,NULL),(31715,'رشا ادم محمد شمين',1,'2007-02-22','rasha-80@hotmail.com','183770701',NULL,2,NULL,NULL,'2016-01-20 10:44:14','2016-01-20 15:19:51',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'المركزالقومي للبحوث-مركز ابحاث التقانة','علوم فيزياء',NULL,NULL),(31716,'سامية ابراهيم عبد الماجد',1,'2008-01-07','Samia_lbrahim2005@yahoo.com','912350030','الخرطوم',2,NULL,NULL,'2016-01-20 10:44:14','2016-01-20 15:19:51',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'معهد ابحاث الطاقة بري','بيئة',NULL,NULL),(31717,'عبدالله علي الامين ابراهيم',0,'2011-06-30','abdall.alamin27@gmail.com','915328849','القضارف',1,NULL,NULL,'2016-01-20 10:44:14','2016-01-20 15:19:51',44,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'وزارة الثروة الحيوانية والسمكية','انتاج البان','2015-01-01',NULL),(31718,'خديجة احمد عبد الله سعيد',1,'2006-11-25','mana-nour@yahoo.com','918144934','كسلا',1,NULL,NULL,'2016-01-20 10:44:14','2016-01-20 15:19:51',49,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'اعلام وعلاقات عامة','2015-01-01',NULL),(31719,'مني حسن محمد احمد حيمورة',1,'2007-02-25','muna-Haimura@yahoo.com','12246214','كسلا',1,NULL,NULL,'2016-01-20 10:44:14','2016-01-20 15:19:52',49,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'تكنولوجيا الاغذية','2015-01-01',NULL),(31720,'فريدة خليفة السيد محمد',1,'2008-03-22','faks3@hotmail.com','912674179','بربر',2,NULL,NULL,'2016-01-20 10:44:15','2016-01-20 15:19:52',52,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'وزارة الزراعة-ادارة صيانة البيئة','دراسات التصحر','2015-01-01',NULL),(31721,'جده موسي عبدالله محمد',1,'2012-01-31','jadamusa222@yahoo.com','911372123','الجنينة',1,NULL,NULL,'2016-01-20 10:44:15','2016-01-20 15:19:52',105,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'وزارة المالية','التنمية الريفية',NULL,NULL),(31722,'يوسف عبدالباقي ابراهيم شاويش',0,'2012-01-31','shawishaj@yahoo.com','912434233','الجنينة',1,NULL,NULL,'2016-01-20 10:44:15','2016-01-20 15:19:52',105,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'وزارة الصحة','صحة عامة',NULL,NULL),(31723,'قمرالدين ابكر ابو الخيرات يونس',0,'2012-01-02','gamarbuosh@yahoo.com','913828101','الجنينة',1,NULL,NULL,'2016-01-20 10:44:15','2016-01-20 15:19:52',105,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'وزارة الصحة','الصحة العامة وصحة البيئة',NULL,NULL),(31724,'موسي محمود احمد محمد',0,'2012-07-02','mussantl@yahoo.com','911274116','الجنينة',1,NULL,NULL,'2016-01-20 10:44:15','2016-01-20 15:19:52',105,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'صحة عامة',NULL,NULL),(31725,'مهدي عبدالرحمن احمد محمد',0,'2008-08-06','mahdiaa2003@yahoo.com','918200606','دنقلا',2,NULL,NULL,'2016-01-20 10:44:15','2016-01-20 15:19:52',46,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هيئة البحوث الزراعية','زراعة','2015-01-01',NULL),(31726,'حامد ابكر بلال اسماعيل',0,'2008-02-14','data.showx@yahoo.com','121087921','زالنجى',2,NULL,NULL,'2016-01-20 10:44:15','2016-01-20 15:19:52',27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة زالنجي','علوم حاسوب','2015-01-01',NULL),(31727,'ثابت احمد حسن',0,'2008-02-01','thabitkiter@yahoo.com','915532151','زالنجى',4,NULL,NULL,'2016-01-20 10:44:15','2016-01-20 11:37:10',27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة زانجي-كلية الزراعة','اقتصاد زراعي','2015-01-01',NULL),(31728,'عبدالحكم عبدالهادي احمد العجب',0,'2008-02-20','hakam-alajab@yahoo.com','122097013','زالنجى',4,NULL,NULL,'2016-01-20 10:44:16','2016-01-20 11:37:10',27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة زالنجي-كلية التربية','السنة وعلوم الحديث','2015-01-01',NULL),(31729,'اسحق ابراهيم هادي يعقوب',0,'2008-02-20','ishag-hadi@yahoo.com','912633107','زالنجى',4,NULL,NULL,'2016-01-20 10:44:16','2016-01-20 11:37:10',27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة زالنجي-كلية التربية','جغرافيا','2015-01-01',NULL),(31730,'عبدالقادر ادم محمد اسحق',0,'2007-06-11','beriedo@yahoo.com','912199470','زالنجى',2,NULL,NULL,'2016-01-20 10:44:16','2016-01-20 15:19:52',27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'كلية الزراعة-جامعة زالنجي','انتاج حيواني','2015-01-01',NULL),(31731,'هناء ابراهيم احمد عثمان',1,'2007-01-08','hanoia-15@hotmail.com','915910216','كسلا',1,NULL,NULL,'2016-01-20 10:44:16','2016-01-20 15:19:52',49,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'التنمية والارشاد الريفي','2015-01-01',NULL),(31732,'عبد الواحد ايوب محمد حمد النيل',0,'2005-08-03','abdelwahid@yahoo.com','911202666','كسلا',2,NULL,NULL,'2016-01-20 10:44:16','2016-01-20 15:19:52',49,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'لغة انجليزية','2015-01-01',NULL),(31733,'الرشيد عبدالله فقير احمد',0,'2008-08-06','rashadfageeri@yahoo.com','912614319','دنقلا',2,NULL,NULL,'2016-01-20 10:44:16','2016-01-20 15:19:52',46,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هيئة البحوث الزراعية','اقتصاد زراعي','2015-01-01',NULL),(31734,'عزالدين التجاني صالح هارون',0,'2008-03-02','ezotijani@yahoo.com','121038572','زالنجى',1,NULL,NULL,'2016-01-20 10:44:17','2016-01-20 15:19:52',27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'انجليزي-تاريخ','2015-01-01',NULL),(31735,'عبدالمحسن رزق الله خير السيد',0,'2007-06-11','rizgalla2006@yahoo.com','121040166','زالنجى',4,NULL,NULL,'2016-01-20 10:44:17','2016-01-20 11:37:10',27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'مركز البيئة والتنمية-جامعة زالنجي','علوم التربة','2015-01-01',NULL),(31736,'جديد محمود محمد الضوي',0,'2008-07-08','jadeed200@yahoo.com','910735904','بابنوسة',1,NULL,NULL,'2016-01-20 10:44:20','2016-01-20 15:19:52',108,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'حاسوب','2015-01-01',NULL),(31737,'يوسف ادم عبدالله احمد',0,'2009-07-08','mromro90@gmail.com','912546610','بابنوسة',1,NULL,NULL,'2016-01-20 10:44:20','2016-01-20 15:19:53',108,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'مستشفي بابنوسة','طب','2015-01-01',NULL),(31738,'عبدالحميد محمد رحمة الله',0,'2000-01-05','sceuksd@hotmail.com','912306872','الضعين',2,NULL,NULL,'2016-01-20 10:44:20','2016-01-20 15:19:53',54,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'منظمة رعاية الطفولة البريطانية-الخرطوم','ارشاد زراعي','2015-01-01',NULL),(31739,'يسن الطيب البشير احمد',0,'2012-01-30','yaseeneltayeb@yahoo.com','915366532','الجنينة',1,NULL,NULL,'2016-01-20 10:44:20','2016-01-20 15:19:53',105,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'وزارة الصحة-الصحة المدرسية','صحة البيئة',NULL,NULL),(31740,'احمد عجيب عبد الرحمن عباس',0,'2009-07-28','manjelsha@yahoo.com','912262233','بمدة السبيل م9',1,NULL,NULL,'2016-01-20 10:44:21','2016-01-20 15:19:53',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'وزارة الصحة ولاية الخرطوم','علم النفس العلاجي',NULL,NULL),(31741,'مأمونميرغني بابكر محمد',0,'2009-02-08','moonbab2000@yahoo.vom','912200176','الخرطوم - توتي',2,NULL,NULL,'2016-01-20 10:44:21','2016-01-20 15:19:53',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'المدرسة الفرنسية - الخرطوم','العلوم البيئية',NULL,NULL),(31742,'وصال احمد عبد الهادي',1,'2009-03-08','wisal_king@yshoo.com','911389380','ام درمان الحارة 6',2,NULL,NULL,'2016-01-20 10:44:21','2016-01-20 15:19:53',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'اقتصاد زراعي- اقتصاد بيئي',NULL,NULL),(31743,'دلال الحاج ابراهيم محمد',1,'2009-07-29','dalal7999@hotmail.com','915096536',NULL,1,NULL,NULL,'2016-01-20 10:44:21','2016-01-20 15:19:53',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'المجلس الاعلي للبيئه - مساعد باحث','دراسات بيئيه',NULL,NULL),(31744,'فتح الرحمن حسن ادريس',0,'2009-05-27','Ajloon666@yahoo.com','918378666','مدينة النصر (مايو)',1,NULL,NULL,'2016-01-20 10:44:21','2016-01-20 15:19:54',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم الغابات',NULL,NULL),(31745,'محمد عبد القادر محمد الحسن',0,'2009-05-04','OEG77@g mail.com','916079378','امتداد الدرجة الثالثة م13',3,NULL,NULL,'2016-01-20 10:44:21','2016-01-20 15:19:54',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'محاسبة مالية',NULL,NULL),(31746,'صفاء محمد ابراهيم',1,'2009-07-04','safaashomma@yahoo.com','916892147',' المقرن م3',1,NULL,NULL,'2016-01-20 10:44:21','2016-01-20 15:19:54',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم الاحياء',NULL,NULL),(31747,'احسان صالح محمد احمد',1,'2009-06-04','Sanal-89-2@hotmail.com','916165688','اركويت شمال م66',1,NULL,NULL,'2016-01-20 10:44:22','2016-01-20 15:19:54',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ادارة اعمال',NULL,NULL),(31748,'ولاء صلاح الدين الحاج وقيع الله',1,'2009-03-30','walaslah@hotmail.com','912212557','الثورة ح10',1,NULL,NULL,'2016-01-20 10:44:22','2016-01-20 15:19:54',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم',NULL,NULL),(31749,'ابو بكر عثمان قمر الانبياء',0,'2009-03-16','abubakargamar@hotmail.com','121933460',' المهندسين م29',2,NULL,NULL,'2016-01-20 10:44:22','2016-01-20 15:19:54',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هندسة ميكانيكا',NULL,NULL),(31750,'هند التجاني علي بركة',1,'2009-03-15','n.e.baraka@gmail.com','912336825','حي الزهور',2,NULL,NULL,'2016-01-20 10:44:22','2016-01-20 15:19:54',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'رياضيات',NULL,NULL),(31751,'حلا احمد حامد معلا',1,'2009-02-16','mallawia@hotmail.com','912622217','الفتيحاب م 10',2,NULL,NULL,'2016-01-20 10:44:22','2016-01-20 15:19:54',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'كلية الصحة جامعة الخرطوم - الوبائيات','الصحة العامة',NULL,NULL),(31752,'انور هاشم انور مصطفي',0,'2009-09-02','noury-200@yahoo.com','926396610','العباسية',1,NULL,NULL,'2016-01-20 10:44:22','2016-01-20 15:19:54',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هندسة',NULL,NULL),(31753,'قصي هاشم الصادق يوسف',0,'2009-08-17','QUSai-RH-187@hotmail.com','915174674','الخرطوم',1,NULL,NULL,'2016-01-20 10:44:22','2016-01-20 15:19:54',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هندسة ميكانيكا',NULL,NULL),(31754,'ياسر حسين محمد الامين',0,'2009-01-26','kasinger1974@yahoo.com','122324421',' الحاج يوسف',1,NULL,NULL,'2016-01-20 10:44:22','2016-01-20 15:19:54',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هندسة زراعية',NULL,NULL),(31755,'هند الامين مصطفي علي',1,'2009-11-01','hid-kemair@hotmail.com','912939977','الخرطوم العزوزاب',2,NULL,NULL,'2016-01-20 10:44:23','2016-01-20 15:19:54',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هندسة نسيج',NULL,NULL),(31756,'محمد السر محمد خير عبد الله',0,'2009-01-24','Morris-law7@hotmail.com','912592622','بحري',1,NULL,NULL,'2016-01-20 10:44:23','2016-01-20 15:19:55',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هندسة مدنية',NULL,NULL),(31757,'ليلة يحي علي يحي',1,'2010-08-17','lolo-sweet@yahoo.com','915302999','بحري/الشعبية شمال',1,NULL,NULL,'2016-01-20 10:44:23','2016-01-20 15:19:55',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'دبلوم تشييد',NULL,NULL),(31758,'محمد علي محمد خير',0,'2005-10-04','malikhairhotmail.com','912125113','جبرة م 2',2,NULL,NULL,'2016-01-20 10:44:23','2016-01-20 15:19:55',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'اعلام',NULL,NULL),(31759,'اريج محمد يسن عثمان',1,'2010-05-17','nano-areej@hotmail','924809197','بحري-المزاد',1,NULL,NULL,'2016-01-20 10:44:23','2016-01-20 15:19:55',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم احياء','2015-01-01',NULL),(31760,'توفيق  عبدالمنعم علي',0,'2010-05-17','tawfig.ali@gmail.com','927706128','امدرمان',1,NULL,NULL,'2016-01-20 10:44:23','2016-01-20 15:19:55',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم احياء','2015-01-01',NULL),(31761,'مالك علي الخليفة ا لحسن',0,'2010-01-20','malik21-zaza@hotmail.com','923062116','حلة كوكو م 14',1,NULL,NULL,'2016-01-20 10:44:24','2016-01-20 15:19:55',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ادارة اعمال','2015-01-01',NULL),(31762,'شموس الامين الشريف الصديق',1,'2010-02-25','shimos98@hotmail.com','912615351','بري-الخرطوم',2,NULL,NULL,'2016-01-20 10:44:24','2016-01-20 15:19:55',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'مختبرات طبية','2015-01-01',NULL),(31763,'مصطفي ادم محمد مصطفي',1,'2010-11-05','fox6v@hotmail.com','122225582','الخرطوم',NULL,NULL,NULL,'2016-01-20 10:44:24','2016-01-20 10:44:24',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-01',NULL),(31764,'ياسر حسين عبد القادر',0,'2009-07-13','yassirha@hotmail.com','912467413','جبرة م9',2,NULL,NULL,'2016-01-20 10:44:24','2016-01-20 15:19:55',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'منظمة فورز مان الخيرية','التنمية الاقتصادية والتخطيط الاستراتيجي',NULL,NULL),(31765,'درية النزير القوني',1,'2009-07-13','Duria_goni@hotmail.com','912248097','الخرطوم',2,NULL,NULL,'2016-01-20 10:44:24','2016-01-20 15:19:55',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة ام درمان الاهلية','ادارة عامة - اجتماع',NULL,NULL),(31766,'اشرف احمد بشير',0,'2009-09-07','ashad29@hotmail.com','155400263','ام درمان',1,NULL,NULL,'2016-01-20 10:44:24','2016-01-20 15:19:55',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم كمبيوتر',NULL,NULL),(31767,'رندا مصطفي عوض الله عوض ا لكريم',1,'2009-09-06','ronidaco@yahoo.com','918104624','الكلاكلة القعلة',1,NULL,NULL,'2016-01-20 10:44:24','2016-01-20 15:19:55',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'استشعار عن بعد ونظم المعلومات الجغرافية',NULL,NULL),(31768,'عبد الباقي عمر محمد',1,'2009-05-13','Soils_star39@yahoo.com','912988021','امتداد بيت المال جنوب',1,NULL,NULL,'2016-01-20 10:44:24','2016-01-20 15:19:55',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم التربة والبيئة',NULL,NULL),(31769,'زين العابدين ابراهيم ممد احمد',0,'2010-01-18','alzainn.alhori@yahoo.com','916337172','ام دوم',1,NULL,NULL,'2016-01-20 10:44:25','2016-01-20 15:19:55',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هندسة كيمياء',NULL,NULL),(31770,'نهي عمر محمد عثمان',1,'2009-04-30','nahoria_mak86@hotmail.com','925289900','جبرة م18',1,NULL,NULL,'2016-01-20 10:44:25','2016-01-20 15:19:55',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هندسة المياة والبيئة',NULL,NULL),(31771,'رجاء بابكر  الامين عبد القادر',1,'2009-04-15','ragaa-6@hotmail.com','923683387','شمبات م 94',1,NULL,NULL,'2016-01-20 10:44:25','2016-01-20 15:19:55',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'اداب',NULL,NULL),(31772,'عمر ابراهيم علي جاد الله',0,'2009-08-24','moural222@yahoo.com','912833065','الثورة ح73',1,NULL,NULL,'2016-01-20 10:44:25','2016-01-20 15:19:56',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' دبلوم',NULL,NULL),(31773,'وجدان بلة محمد',1,'2010-01-17','gogo.bala@yahoo.com','915727929','جبل اولياء',1,NULL,NULL,'2016-01-20 10:44:25','2016-01-20 15:19:56',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'صحة عامة وبيئة','2015-01-01',NULL),(31774,'علا  الياس احمد محمد',1,'2009-01-15','Olaelias2003@yahoo.com','912223680',NULL,2,NULL,NULL,'2016-01-20 10:44:25','2016-01-20 15:19:56',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'معهد ابحاث التصحر','اقتصاد زراعي',NULL,NULL),(31775,'محمد الباقر صالح محمد زين',0,'2010-03-14','mbagher@live.com','918809025','امدرمان الثورة ح 9',1,NULL,NULL,'2016-01-20 10:44:25','2016-01-20 15:19:56',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم رياضية وحاسوب','2015-01-01',NULL),(31776,'اماني عبدالله بريمة محمد',1,'2010-03-16','amanibraima@yahoo.com','912444453','امدرمان حي البقعة م 34',1,NULL,NULL,'2016-01-20 10:44:26','2016-01-20 15:19:56',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ادارة اعمال','2015-01-01',NULL),(31777,'عباس عبد الله حميده عبد الرحيم',0,'2009-08-03','alrys - 35@yahoo.com','915013134','اركويت مربع 46',1,NULL,NULL,'2016-01-20 10:44:26','2016-01-20 15:19:56',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'مختبرات طبيه',NULL,NULL),(31778,'عبد الباقي النور الامام الحسن',0,'2012-07-02','bogahsn@yahoo.com','919191347','الراوات',1,NULL,NULL,'2016-01-20 10:44:26','2016-01-20 15:19:56',140,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'قانون','2015-01-01',NULL),(31779,'بشير النور الامام الحسن',0,'2012-06-02','bashir.eln83@yahoo.com','915972552','الراوات',1,NULL,NULL,'2016-01-20 10:44:26','2016-01-20 15:19:56',140,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'اقتصاد','2015-01-01',NULL),(31780,'ناصر احمد الزومة عبدالله',0,'2005-04-06','monsor3@hotmail.com','912494107','امدرمان-المهندسين',1,NULL,NULL,'2016-01-20 10:44:26','2016-01-20 15:19:56',22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'جامعة امدرمان الاسلامية','احصاء','2015-01-01',NULL),(31781,'سليمان جمعة ابراهيم ادريس',0,'2005-08-24','suliman gumaa@yahoo.com','912792467','نيالا',3,NULL,NULL,'2016-01-20 10:44:26','2016-01-20 15:19:56',22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'علوم ارصاد','2015-01-01',NULL),(31782,'انس محمد ادم محمد',0,'2008-03-23','anassnyala@yahoo.com','924962010','نيالا',2,NULL,NULL,'2016-01-20 10:44:26','2016-01-20 15:19:56',22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'دواجن','2015-01-01',NULL),(31783,'حسب الله حسب النبي عيسي داؤود',0,'2006-12-16','elrays313@yahoo.com','912512795','نيالا',1,NULL,NULL,'2016-01-20 10:44:26','2016-01-20 15:19:56',22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'منظممة شبكة نساء القرن الافريقي','تامين','2015-01-01',NULL),(31784,'نصرالدين التجاني شريف قمر',0,'2006-11-16','m-alshareef@yahoo.com','912658020','نيالا',1,NULL,NULL,'2016-01-20 10:44:27','2016-01-20 15:19:56',22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' محاسبة','2015-01-01',NULL),(31785,'مبارك عبدالله محمد علي حماد',0,'2008-08-06','alimoubarak15@yahoo.com','912582465','نيالا',1,NULL,NULL,'2016-01-20 10:44:27','2016-01-20 15:19:56',22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'طب بيطري','2015-01-01',NULL),(31786,'علي جبر الدار محمد علي',0,'2001-10-02','ali1991@hotmail.com','91317749','الراوات',1,NULL,NULL,'2016-01-20 10:44:27','2016-01-20 15:19:56',140,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'هندسة حاسوب','2015-01-01',NULL);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_translations`
--

DROP TABLE IF EXISTS `organization_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_organization_translations_on_locale` (`locale`) USING BTREE,
  KEY `index_organization_translations_on_organization_id` (`organization_id`) USING BTREE,
  KEY `locale` (`locale`),
  KEY `organization_id` (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_translations`
--

LOCK TABLES `organization_translations` WRITE;
/*!40000 ALTER TABLE `organization_translations` DISABLE KEYS */;
INSERT INTO `organization_translations` VALUES (1,1,'en','2016-01-06 09:17:39','2016-01-06 09:17:39','United Nations Convention To Combat Desertification','The Convention’s 195 parties work together to improve the living conditions for people in drylands, to maintain and restore land and soil productivity, and to mitigate the effects of drought. The UNCCD is particularly committed to a bottom-up approach, encouraging the participation of local people in combating desertification and land degradation. The UNCCD secretariat facilitates cooperation between developed and developing countries, particularly around knowledge and technology transfer for sustainable land management.'),(2,2,'en','2016-01-06 09:17:39','2016-01-06 09:17:39','The Crop Trust','The mission of the Crop Trust is to ensure the conservation and availability of plant diversity essential for food and agriculture, forever'),(3,1,'ar','2016-01-13 11:37:28','2016-01-13 11:37:28','','');
/*!40000 ALTER TABLE `organization_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subdomain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `logo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_file_size` int(11) DEFAULT NULL,
  `logo_updated_at` datetime DEFAULT NULL,
  `trello_member_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
INSERT INTO `organizations` VALUES (1,NULL,'www.unccd.int','unccd','info@unccd.int','+49-228815-2800','+249912412801','0+49-228815-289899','UNCCDPlatz der Vereinten Nationen 1, D-53113 Bonn, Germany',NULL,1,'2016-01-06 09:17:39','2016-01-16 20:45:00',NULL,1,NULL,NULL,NULL,NULL,'bbc9a429b6deb77f62e356ad364513974685cd2659376ebf8effbfe459af1ec6'),(2,NULL,'www.croptrust.org','','info@croptrust.org','+49 (0) 228 85427 122','','','The Crop Trust Platz Der Vereinten Nationen 7 53113 Bonn, Germany',NULL,1,'2016-01-06 09:17:39','2016-01-06 09:17:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profession_translations`
--

DROP TABLE IF EXISTS `profession_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profession_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profession_id` int(11) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_profession_translations_on_locale` (`locale`) USING BTREE,
  KEY `index_profession_translations_on_profession_id` (`profession_id`) USING BTREE,
  KEY `locale` (`locale`),
  KEY `profession_id` (`profession_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profession_translations`
--

LOCK TABLES `profession_translations` WRITE;
/*!40000 ALTER TABLE `profession_translations` DISABLE KEYS */;
INSERT INTO `profession_translations` VALUES (1,1,'en','2016-01-06 08:28:25','2016-01-06 08:28:25','Other'),(4,4,'en','2016-01-06 12:36:08','2016-01-06 12:36:08','other'),(5,5,'en','2016-01-06 12:37:37','2016-01-06 12:37:37','something');
/*!40000 ALTER TABLE `profession_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professions`
--

DROP TABLE IF EXISTS `professions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professions`
--

LOCK TABLES `professions` WRITE;
/*!40000 ALTER TABLE `professions` DISABLE KEYS */;
INSERT INTO `professions` VALUES (1,NULL,'2016-01-06 08:28:25','2016-01-06 08:28:25'),(4,NULL,'2016-01-06 12:36:08','2016-01-06 12:36:08'),(5,NULL,'2016-01-06 12:37:37','2016-01-06 12:37:37');
/*!40000 ALTER TABLE `professions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_attachments`
--

DROP TABLE IF EXISTS `project_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attachment_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `attachment_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_file_size` int(11) DEFAULT NULL,
  `attachment_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_attachments`
--

LOCK TABLES `project_attachments` WRITE;
/*!40000 ALTER TABLE `project_attachments` DISABLE KEYS */;
INSERT INTO `project_attachments` VALUES (3,NULL,4,'2016-01-06 13:40:27','2016-01-06 13:40:27','peace_dividends.pdf','application/pdf',1534548,'2016-01-06 13:40:23'),(4,NULL,5,'2016-01-07 08:31:06','2016-01-07 08:31:06','peace_dividends.pdf','application/pdf',1534548,'2016-01-07 08:30:58'),(5,NULL,5,'2016-01-07 08:31:06','2016-01-07 08:31:06','PBSO_UNEP_NRM_Peacebuilding_newsletter.pdf','application/pdf',1758110,'2016-01-07 08:31:02');
/*!40000 ALTER TABLE `project_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_donors`
--

DROP TABLE IF EXISTS `project_donors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_donors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `donor_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_donors`
--

LOCK TABLES `project_donors` WRITE;
/*!40000 ALTER TABLE `project_donors` DISABLE KEYS */;
INSERT INTO `project_donors` VALUES (1,2,1,'2016-01-06 09:17:41','2016-01-06 09:17:41',NULL,NULL);
/*!40000 ALTER TABLE `project_donors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_locations`
--

DROP TABLE IF EXISTS `project_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_locations`
--

LOCK TABLES `project_locations` WRITE;
/*!40000 ALTER TABLE `project_locations` DISABLE KEYS */;
INSERT INTO `project_locations` VALUES (1,2,1,'2016-01-06 09:17:42','2016-01-06 09:17:42',NULL,NULL);
/*!40000 ALTER TABLE `project_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_members`
--

DROP TABLE IF EXISTS `project_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_members`
--

LOCK TABLES `project_members` WRITE;
/*!40000 ALTER TABLE `project_members` DISABLE KEYS */;
INSERT INTO `project_members` VALUES (1,2,1,NULL,'2016-01-06 09:17:41','2016-01-06 09:17:41',NULL,NULL),(2,2,2,NULL,'2016-01-06 09:17:41','2016-01-06 09:17:41',NULL,NULL);
/*!40000 ALTER TABLE `project_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_milestone_translations`
--

DROP TABLE IF EXISTS `project_milestone_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_milestone_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_milestone_id` int(11) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_project_milestone_translations_on_locale` (`locale`) USING BTREE,
  KEY `index_project_milestone_translations_on_project_milestone_id` (`project_milestone_id`) USING BTREE,
  KEY `locale` (`locale`),
  KEY `project_milestone_id` (`project_milestone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_milestone_translations`
--

LOCK TABLES `project_milestone_translations` WRITE;
/*!40000 ALTER TABLE `project_milestone_translations` DISABLE KEYS */;
INSERT INTO `project_milestone_translations` VALUES (1,1,'en','2016-01-06 09:17:41','2016-01-06 09:17:41','Crowd Fund The Hope Link OrphanageProject ','Hope Link Development Project is raising funds to organize their community in the field of sustainable agriculture, which benefits the community through recycling systems and sustainable land management, promoting food security and sustainable development.');
/*!40000 ALTER TABLE `project_milestone_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_milestones`
--

DROP TABLE IF EXISTS `project_milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_milestones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `expences` decimal(12,2) DEFAULT '0.00',
  `project_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_milestones`
--

LOCK TABLES `project_milestones` WRITE;
/*!40000 ALTER TABLE `project_milestones` DISABLE KEYS */;
INSERT INTO `project_milestones` VALUES (1,NULL,NULL,8000.00,2,'2016-01-06 09:17:41','2016-01-06 09:17:41');
/*!40000 ALTER TABLE `project_milestones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_partners`
--

DROP TABLE IF EXISTS `project_partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_partners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_partners`
--

LOCK TABLES `project_partners` WRITE;
/*!40000 ALTER TABLE `project_partners` DISABLE KEYS */;
INSERT INTO `project_partners` VALUES (1,2,2,'2016-01-06 09:17:42','2016-01-06 09:17:42',NULL,NULL);
/*!40000 ALTER TABLE `project_partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_roles`
--

DROP TABLE IF EXISTS `project_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_roles`
--

LOCK TABLES `project_roles` WRITE;
/*!40000 ALTER TABLE `project_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_translations`
--

DROP TABLE IF EXISTS `project_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_project_translations_on_locale` (`locale`) USING BTREE,
  KEY `index_project_translations_on_project_id` (`project_id`) USING BTREE,
  KEY `locale` (`locale`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_translations`
--

LOCK TABLES `project_translations` WRITE;
/*!40000 ALTER TABLE `project_translations` DISABLE KEYS */;
INSERT INTO `project_translations` VALUES (156,85,'en','2016-01-14 10:01:05','2016-01-14 10:01:05','SECS-DED Development Program',NULL),(174,98,'en','2016-01-20 08:37:12','2016-01-20 08:37:12','Eco Neighbouehoods Project',NULL),(175,99,'en','2016-01-20 08:38:19','2016-01-20 08:38:19','Spreading Human and Environmental Rights',NULL),(176,100,'en','2016-01-20 08:38:19','2016-01-20 08:38:19','Water and Sanitation Promotion Project',NULL),(177,101,'en','2016-01-20 08:38:19','2016-01-20 08:38:19','Eco peace & Natural Resources Management',NULL),(178,102,'en','2016-01-20 08:38:19','2016-01-20 08:38:19','Community Environmental Governance Initiative (CEGI)  ',NULL),(179,103,'en','2016-01-20 08:38:20','2016-01-20 08:38:20','Eco peace project',NULL),(180,104,'en','2016-01-20 08:38:20','2016-01-20 08:38:20','Natural resource management and Environmental Recovery  ',NULL),(181,105,'en','2016-01-20 08:38:20','2016-01-20 08:38:20','Environmental Forum',NULL),(182,106,'en','2016-01-20 08:38:20','2016-01-20 08:38:20','SECS-FES Environmental Program',NULL),(183,107,'en','2016-01-20 08:38:20','2016-01-20 08:38:20','SECS-DED Development Program',NULL);
/*!40000 ALTER TABLE `project_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `budget` decimal(12,2) DEFAULT '0.00',
  `from` date DEFAULT NULL,
  `to` date DEFAULT NULL,
  `goal` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `overall_expences` decimal(12,2) DEFAULT '0.00',
  `required_document_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `required_document_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `required_document_file_size` int(11) DEFAULT NULL,
  `required_document_updated_at` datetime DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `trello_board_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (98,NULL,1908547.75,'2010-01-01','2013-01-01','To improve environmental management and reduce poverty in the state of Khartoum to contribute towards achieving the Millennium Development Goals (MDGs)',NULL,NULL,'2016-01-20 08:37:12','2016-01-20 08:37:12',NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(99,NULL,252605.93,'2007-01-01','2010-01-01','To spread human and environmental rights culture among sudanese communities',NULL,NULL,'2016-01-20 08:38:19','2016-01-20 08:38:19',NULL,NULL,0.00,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL),(100,NULL,980479.00,'2011-01-01','2011-12-01','Provision of potable drinking water for the estimated 27,000 in two localities (Babnousa and Elsalam,South Kordofan) state  ',NULL,NULL,'2016-01-20 08:38:19','2016-01-20 08:38:19',NULL,NULL,0.00,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL),(101,NULL,360.00,'2009-01-01','2010-01-01','Promotion of Eco peace (proactive) culture, advocates for environmental right to have access to land and to attain rational use of natural resources and to ensure sustainable livelihoods. ',NULL,NULL,'2016-01-20 08:38:19','2016-01-20 08:38:19',NULL,NULL,0.00,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL),(102,NULL,124.81,'2012-01-01','2012-12-01','To strengthen community cohesion, ecological resilience and traditional forms of governance. ',NULL,NULL,'2016-01-20 08:38:19','2016-01-20 08:38:19',NULL,NULL,0.00,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL),(103,NULL,449.46,'2008-01-01','2011-01-01','The Eco peace program aims at promoting eco peace (proactive) culture and advocate for environmental rights to attain equitable accessibility of the natural resources and ensure sustainable livelihoods.',NULL,NULL,'2016-01-20 08:38:20','2016-01-20 08:38:20',NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(104,NULL,790.00,'2013-01-01','2013-12-01','To sustain rational resource management for sustainable peace building in the state.',NULL,NULL,'2016-01-20 08:38:20','2016-01-20 08:38:20',NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(105,NULL,70.00,'2004-01-01','2004-12-01','Discuss top priority environmental issues with decision makers',NULL,NULL,'2016-01-20 08:38:20','2016-01-20 08:38:20',NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(106,NULL,1056.89,'2004-01-01','2004-12-01','Raise environmental awareness of different stakeholders',NULL,NULL,'2016-01-20 08:38:20','2016-01-20 08:38:20',NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(107,NULL,1484.00,'2004-01-01','2004-12-01','Building of SECS branches capacity',NULL,NULL,'2016-01-20 08:38:20','2016-01-20 08:38:20',NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_activities`
--

DROP TABLE IF EXISTS `public_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trackable_id` int(11) DEFAULT NULL,
  `trackable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `owner_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8_unicode_ci,
  `recipient_id` int(11) DEFAULT NULL,
  `recipient_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_public_activities_on_owner_id_and_owner_type` (`owner_id`,`owner_type`) USING BTREE,
  KEY `index_public_activities_on_recipient_id_and_recipient_type` (`recipient_id`,`recipient_type`) USING BTREE,
  KEY `index_public_activities_on_trackable_id_and_trackable_type` (`trackable_id`,`trackable_type`) USING BTREE,
  KEY `owner_id` (`owner_id`,`owner_type`),
  KEY `recipient_id` (`recipient_id`,`recipient_type`),
  KEY `trackable_id` (`trackable_id`,`trackable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_activities`
--

LOCK TABLES `public_activities` WRITE;
/*!40000 ALTER TABLE `public_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `public_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_translations`
--

DROP TABLE IF EXISTS `role_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_role_translations_on_locale` (`locale`) USING BTREE,
  KEY `index_role_translations_on_role_id` (`role_id`) USING BTREE,
  KEY `locale` (`locale`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_translations`
--

LOCK TABLES `role_translations` WRITE;
/*!40000 ALTER TABLE `role_translations` DISABLE KEYS */;
INSERT INTO `role_translations` VALUES (1,1,'en','2016-01-06 08:14:18','2016-01-06 08:14:18','Guest'),(2,2,'en','2016-01-06 08:14:18','2016-01-06 08:14:18','Admin'),(3,3,'en','2016-01-06 08:14:18','2016-01-06 08:14:18','Program Coordinator'),(4,4,'en','2016-01-06 08:14:18','2016-01-06 08:14:18','Treasury Secretary'),(5,5,'en','2016-01-06 08:28:21','2016-01-06 08:28:21','Guest'),(6,6,'en','2016-01-06 08:28:21','2016-01-06 08:28:21','Admin'),(7,7,'en','2016-01-06 08:28:21','2016-01-06 08:28:21','Program Coordinator'),(8,8,'en','2016-01-06 08:28:21','2016-01-06 08:28:21','Treasury Secretary'),(9,9,'en','2016-01-06 09:17:35','2016-01-06 09:17:35','Guest'),(10,10,'en','2016-01-06 09:17:36','2016-01-06 09:17:36','Admin'),(11,11,'en','2016-01-06 09:17:36','2016-01-06 09:17:36','Program Coordinator'),(12,12,'en','2016-01-06 09:17:36','2016-01-06 09:17:36','Treasury Secretary'),(13,13,'ar','2016-01-06 09:39:57','2016-01-06 09:39:57','متطوع'),(14,13,'en','2016-01-06 09:39:57','2016-01-06 09:39:57','volunteer'),(15,14,'en','2016-01-14 10:00:53','2016-01-14 10:00:53','Guest'),(16,15,'en','2016-01-14 10:00:53','2016-01-14 10:00:53','Admin'),(17,16,'en','2016-01-20 08:08:16','2016-01-20 08:08:16','Guest'),(18,17,'en','2016-01-20 08:08:16','2016-01-20 08:08:16','Admin'),(19,18,'en','2016-01-20 08:11:43','2016-01-20 08:11:43','Guest'),(20,19,'en','2016-01-20 08:11:43','2016-01-20 08:11:43','Admin'),(21,20,'en','2016-01-20 08:29:16','2016-01-20 08:29:16','Guest'),(22,21,'en','2016-01-20 08:29:16','2016-01-20 08:29:16','Admin'),(23,22,'en','2016-01-20 08:33:38','2016-01-20 08:33:38','Guest'),(24,23,'en','2016-01-20 08:33:38','2016-01-20 08:33:38','Admin'),(25,24,'en','2016-01-20 08:34:45','2016-01-20 08:34:45','Guest'),(26,25,'en','2016-01-20 08:34:45','2016-01-20 08:34:45','Admin'),(27,26,'en','2016-01-20 08:35:50','2016-01-20 08:35:50','Guest'),(28,27,'en','2016-01-20 08:35:50','2016-01-20 08:35:50','Admin'),(29,28,'en','2016-01-20 08:38:15','2016-01-20 08:38:15','Guest'),(30,29,'en','2016-01-20 08:38:15','2016-01-20 08:38:15','Admin'),(31,30,'en','2016-01-20 11:32:54','2016-01-20 11:32:54','Guest'),(32,31,'en','2016-01-20 11:32:54','2016-01-20 11:32:54','Admin'),(33,32,'en','2016-01-20 11:33:36','2016-01-20 11:33:36','Guest'),(34,33,'en','2016-01-20 11:33:36','2016-01-20 11:33:36','Admin'),(35,34,'en','2016-01-20 11:37:25','2016-01-20 11:37:26','Guest'),(36,35,'en','2016-01-20 11:37:26','2016-01-20 11:37:26','Admin'),(37,36,'en','2016-01-20 11:39:05','2016-01-20 11:39:05','Guest'),(38,37,'en','2016-01-20 11:39:05','2016-01-20 11:39:05','Admin'),(39,38,'en','2016-01-20 11:41:49','2016-01-20 11:41:49','Guest'),(40,39,'en','2016-01-20 11:41:49','2016-01-20 11:41:49','Admin'),(41,40,'en','2016-01-20 11:42:44','2016-01-20 11:42:44','Guest'),(42,41,'en','2016-01-20 11:42:44','2016-01-20 11:42:44','Admin'),(43,42,'en','2016-01-20 11:49:49','2016-01-20 11:49:49','Guest'),(44,43,'en','2016-01-20 11:49:49','2016-01-20 11:49:49','Admin'),(45,44,'en','2016-01-20 11:53:10','2016-01-20 11:53:10','Guest'),(46,45,'en','2016-01-20 11:53:10','2016-01-20 11:53:10','Admin'),(47,46,'en','2016-01-20 11:53:56','2016-01-20 11:53:56','Guest'),(48,47,'en','2016-01-20 11:53:56','2016-01-20 11:53:56','Admin');
/*!40000 ALTER TABLE `role_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,NULL,'2016-01-06 08:14:18','2016-01-06 08:14:18',NULL,NULL,'---\n:all: false\n'),(2,NULL,'2016-01-06 08:14:18','2016-01-06 08:14:18',NULL,NULL,'---\n:all: true\n'),(3,NULL,'2016-01-06 08:14:18','2016-01-06 08:14:18',NULL,NULL,NULL),(4,NULL,'2016-01-06 08:14:18','2016-01-06 08:14:18',NULL,NULL,NULL),(5,NULL,'2016-01-06 08:28:21','2016-01-06 08:28:21',NULL,NULL,'---\n:all: false\n'),(6,NULL,'2016-01-06 08:28:21','2016-01-06 08:28:21',NULL,NULL,'---\n:all: true\n'),(7,NULL,'2016-01-06 08:28:21','2016-01-06 08:28:21',NULL,NULL,NULL),(8,NULL,'2016-01-06 08:28:21','2016-01-06 08:28:21',NULL,NULL,NULL),(9,NULL,'2016-01-06 09:17:35','2016-01-06 09:17:35',NULL,NULL,'---\n:all: false\n'),(10,NULL,'2016-01-06 09:17:36','2016-01-06 09:17:36',NULL,NULL,'---\n:all: true\n'),(11,NULL,'2016-01-06 09:17:36','2016-01-06 09:17:36',NULL,NULL,NULL),(12,NULL,'2016-01-06 09:17:36','2016-01-06 09:17:36',NULL,NULL,NULL),(13,NULL,'2016-01-06 09:39:57','2016-01-06 09:39:57',1,1,'--- !ruby/hash:ActionController::Parameters\nprojects: !ruby/hash:ActionController::Parameters\n  manage: \'true\'\n  read: \'true\'\n  create: \'true\'\n  update: \'true\'\n  delete: \'true\'\n'),(14,NULL,'2016-01-14 10:00:53','2016-01-14 10:00:53',NULL,NULL,'---\n:all: false\n'),(15,NULL,'2016-01-14 10:00:53','2016-01-14 10:00:53',NULL,NULL,'---\n:all: true\n'),(16,NULL,'2016-01-20 08:08:16','2016-01-20 08:08:16',NULL,NULL,'---\n:all: false\n'),(17,NULL,'2016-01-20 08:08:16','2016-01-20 08:08:16',NULL,NULL,'---\n:all: true\n'),(18,NULL,'2016-01-20 08:11:43','2016-01-20 08:11:43',NULL,NULL,'---\n:all: false\n'),(19,NULL,'2016-01-20 08:11:43','2016-01-20 08:11:43',NULL,NULL,'---\n:all: true\n'),(20,NULL,'2016-01-20 08:29:16','2016-01-20 08:29:16',NULL,NULL,'---\n:all: false\n'),(21,NULL,'2016-01-20 08:29:16','2016-01-20 08:29:16',NULL,NULL,'---\n:all: true\n'),(22,NULL,'2016-01-20 08:33:38','2016-01-20 08:33:38',NULL,NULL,'---\n:all: false\n'),(23,NULL,'2016-01-20 08:33:38','2016-01-20 08:33:38',NULL,NULL,'---\n:all: true\n'),(24,NULL,'2016-01-20 08:34:45','2016-01-20 08:34:45',NULL,NULL,'---\n:all: false\n'),(25,NULL,'2016-01-20 08:34:45','2016-01-20 08:34:45',NULL,NULL,'---\n:all: true\n'),(26,NULL,'2016-01-20 08:35:50','2016-01-20 08:35:50',NULL,NULL,'---\n:all: false\n'),(27,NULL,'2016-01-20 08:35:50','2016-01-20 08:35:50',NULL,NULL,'---\n:all: true\n'),(28,NULL,'2016-01-20 08:38:15','2016-01-20 08:38:15',NULL,NULL,'---\n:all: false\n'),(29,NULL,'2016-01-20 08:38:15','2016-01-20 08:38:15',NULL,NULL,'---\n:all: true\n'),(30,NULL,'2016-01-20 11:32:54','2016-01-20 11:32:54',NULL,NULL,'---\n:all: false\n'),(31,NULL,'2016-01-20 11:32:54','2016-01-20 11:32:54',NULL,NULL,'---\n:all: true\n'),(32,NULL,'2016-01-20 11:33:36','2016-01-20 11:33:36',NULL,NULL,'---\n:all: false\n'),(33,NULL,'2016-01-20 11:33:36','2016-01-20 11:33:36',NULL,NULL,'---\n:all: true\n'),(34,NULL,'2016-01-20 11:37:25','2016-01-20 11:37:25',NULL,NULL,'---\n:all: false\n'),(35,NULL,'2016-01-20 11:37:26','2016-01-20 11:37:26',NULL,NULL,'---\n:all: true\n'),(36,NULL,'2016-01-20 11:39:05','2016-01-20 11:39:05',NULL,NULL,'---\n:all: false\n'),(37,NULL,'2016-01-20 11:39:05','2016-01-20 11:39:05',NULL,NULL,'---\n:all: true\n'),(38,NULL,'2016-01-20 11:41:49','2016-01-20 11:41:49',NULL,NULL,'---\n:all: false\n'),(39,NULL,'2016-01-20 11:41:49','2016-01-20 11:41:49',NULL,NULL,'---\n:all: true\n'),(40,NULL,'2016-01-20 11:42:44','2016-01-20 11:42:44',NULL,NULL,'---\n:all: false\n'),(41,NULL,'2016-01-20 11:42:44','2016-01-20 11:42:44',NULL,NULL,'---\n:all: true\n'),(42,NULL,'2016-01-20 11:49:49','2016-01-20 11:49:49',NULL,NULL,'---\n:all: false\n'),(43,NULL,'2016-01-20 11:49:49','2016-01-20 11:49:49',NULL,NULL,'---\n:all: true\n'),(44,NULL,'2016-01-20 11:53:10','2016-01-20 11:53:10',NULL,NULL,'---\n:all: false\n'),(45,NULL,'2016-01-20 11:53:10','2016-01-20 11:53:10',NULL,NULL,'---\n:all: true\n'),(46,NULL,'2016-01-20 11:53:56','2016-01-20 11:53:56',NULL,NULL,'---\n:all: false\n'),(47,NULL,'2016-01-20 11:53:56','2016-01-20 11:53:56',NULL,NULL,'---\n:all: true\n');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20151121112422'),('20151121115342'),('20151121115349'),('20151121115356'),('20151121115401'),('20151121115405'),('20151121115411'),('20151121115415'),('20151121115441'),('20151121115445'),('20151121115451'),('20151121115457'),('20151121115501'),('20151121115513'),('20151121115521'),('20151122143216'),('20151122150824'),('20151123090801'),('20151123104359'),('20151125073920'),('20151125090703'),('20151125121010'),('20151126124435'),('20151126125311'),('20151201083734'),('20151201104105'),('20151201115100'),('20151201115338'),('20151201133605'),('20151203065639'),('20151203094435'),('20151203115708'),('20151206112714'),('20151209123136'),('20151210110738'),('20151213043926'),('20151215070653'),('20151215120728'),('20151220123442'),('20151222082801'),('20151222114437'),('20151228094935'),('20151228100205'),('20160103063546'),('20160103113858'),('20160107103243'),('20160107105008'),('20160110060214'),('20160110073804'),('20160110081506'),('20160112143242'),('20160113081856'),('20160113095751'),('20160118091140'),('20160118091404'),('20160118121215'),('20160118125045'),('20160119063742'),('20160119071231'),('20160119102857'),('20160120145122');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_translations`
--

DROP TABLE IF EXISTS `state_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_id` int(11) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_state_translations_on_locale` (`locale`) USING BTREE,
  KEY `index_state_translations_on_state_id` (`state_id`) USING BTREE,
  KEY `locale` (`locale`),
  KEY `state_id` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_translations`
--

LOCK TABLES `state_translations` WRITE;
/*!40000 ALTER TABLE `state_translations` DISABLE KEYS */;
INSERT INTO `state_translations` VALUES (1,1,'en','2016-01-06 08:14:18','2016-01-06 08:14:18','Al Jazirah'),(2,2,'en','2016-01-06 08:14:18','2016-01-06 08:14:18','Blue Nile '),(3,3,'en','2016-01-06 08:14:18','2016-01-06 08:14:18','Sennar'),(4,4,'en','2016-01-06 08:14:18','2016-01-06 08:14:18','White Nile'),(5,5,'en','2016-01-06 08:14:18','2016-01-06 08:14:18','Central Darfur'),(6,6,'en','2016-01-06 08:14:19','2016-01-06 08:14:19','East Darfur '),(7,7,'en','2016-01-06 08:14:19','2016-01-06 08:14:19','North Darfur '),(8,8,'en','2016-01-06 08:14:19','2016-01-06 08:14:19','South Darfur '),(9,9,'en','2016-01-06 08:14:19','2016-01-06 08:14:19','West Darfur'),(10,10,'en','2016-01-06 08:14:19','2016-01-06 08:14:19','Kassala'),(11,11,'en','2016-01-06 08:14:19','2016-01-06 08:14:19','Al Qadarif'),(12,12,'en','2016-01-06 08:14:19','2016-01-06 08:14:19','Red Sea'),(13,13,'en','2016-01-06 08:14:19','2016-01-06 08:14:19','North Kurdufan '),(14,14,'en','2016-01-06 08:14:19','2016-01-06 08:14:19','South Kurdufan'),(15,15,'en','2016-01-06 08:14:19','2016-01-06 08:14:19','West Kurdufan'),(16,16,'en','2016-01-06 08:14:19','2016-01-06 08:14:19','Northern'),(17,17,'en','2016-01-06 08:14:19','2016-01-06 08:14:19','River Nile'),(18,18,'en','2016-01-06 08:14:19','2016-01-06 08:14:19','Khartoum'),(19,19,'en','2016-01-21 13:15:45','2016-01-21 13:15:45','Al Jazirah'),(20,20,'en','2016-01-21 13:15:46','2016-01-21 13:15:46','Blue Nile '),(21,21,'en','2016-01-21 13:15:46','2016-01-21 13:15:46','Sennar'),(22,22,'en','2016-01-21 13:15:46','2016-01-21 13:15:46','White Nile'),(23,23,'en','2016-01-21 13:15:46','2016-01-21 13:15:46','Central Darfur'),(24,24,'en','2016-01-21 13:15:46','2016-01-21 13:15:46','East Darfur '),(25,25,'en','2016-01-21 13:15:46','2016-01-21 13:15:46','North Darfur '),(26,26,'en','2016-01-21 13:15:46','2016-01-21 13:15:46','South Darfur '),(27,27,'en','2016-01-21 13:15:47','2016-01-21 13:15:47','West Darfur'),(28,28,'en','2016-01-21 13:15:47','2016-01-21 13:15:47','Kassala'),(29,29,'en','2016-01-21 13:15:47','2016-01-21 13:15:47','Al Qadarif'),(30,30,'en','2016-01-21 13:15:47','2016-01-21 13:15:47','Red Sea'),(31,31,'en','2016-01-21 13:15:47','2016-01-21 13:15:47','North Kurdufan '),(32,32,'en','2016-01-21 13:15:47','2016-01-21 13:15:47','South Kurdufan'),(33,33,'en','2016-01-21 13:15:47','2016-01-21 13:15:47','West Kurdufan'),(34,34,'en','2016-01-21 13:15:47','2016-01-21 13:15:48','Northern'),(35,35,'en','2016-01-21 13:15:48','2016-01-21 13:15:48','River Nile'),(36,36,'en','2016-01-21 13:15:48','2016-01-21 13:15:48','Khartoum'),(37,19,'ar','2016-01-21 13:26:39','2016-01-21 13:26:39','الجزيرة'),(38,37,'en','2016-01-21 13:27:13','2016-01-21 13:27:13','Al Jazirah'),(39,38,'en','2016-01-21 13:27:13','2016-01-21 13:27:13','Blue Nile '),(40,39,'en','2016-01-21 13:27:13','2016-01-21 13:27:13','Sennar'),(41,40,'en','2016-01-21 13:27:13','2016-01-21 13:27:13','White Nile'),(42,41,'en','2016-01-21 13:27:13','2016-01-21 13:27:13','Central Darfur'),(43,42,'en','2016-01-21 13:27:13','2016-01-21 13:27:13','East Darfur '),(44,43,'en','2016-01-21 13:27:14','2016-01-21 13:27:14','North Darfur '),(45,44,'en','2016-01-21 13:27:14','2016-01-21 13:27:14','South Darfur '),(46,45,'en','2016-01-21 13:27:14','2016-01-21 13:27:14','West Darfur'),(47,46,'en','2016-01-21 13:27:14','2016-01-21 13:27:14','Kassala'),(48,47,'en','2016-01-21 13:27:14','2016-01-21 13:27:14','Al Qadarif'),(49,48,'en','2016-01-21 13:27:14','2016-01-21 13:27:14','Red Sea'),(50,49,'en','2016-01-21 13:27:14','2016-01-21 13:27:14','North Kurdufan '),(51,50,'en','2016-01-21 13:27:15','2016-01-21 13:27:15','South Kurdufan'),(52,51,'en','2016-01-21 13:27:15','2016-01-21 13:27:15','West Kurdufan'),(53,52,'en','2016-01-21 13:27:15','2016-01-21 13:27:15','Northern'),(54,53,'en','2016-01-21 13:27:15','2016-01-21 13:27:15','River Nile'),(55,54,'en','2016-01-21 13:27:15','2016-01-21 13:27:15','Khartoum'),(56,37,'ar','2016-01-21 13:27:15','2016-01-21 13:27:15','الجزيرة'),(57,38,'ar','2016-01-21 13:27:15','2016-01-21 13:27:15','النيل الأزرق'),(58,39,'ar','2016-01-21 13:27:15','2016-01-21 13:27:15','سنار'),(59,40,'ar','2016-01-21 13:27:16','2016-01-21 13:27:16','النيلالأبيض'),(60,41,'ar','2016-01-21 13:27:16','2016-01-21 13:27:16','وسط دارفور'),(61,42,'ar','2016-01-21 13:27:16','2016-01-21 13:27:16','شرق دارفور'),(62,43,'ar','2016-01-21 13:27:16','2016-01-21 13:27:16','شمال دارفور'),(63,44,'ar','2016-01-21 13:27:16','2016-01-21 13:27:16','جنوب دارفور'),(64,45,'ar','2016-01-21 13:27:16','2016-01-21 13:27:16','غرب دارفور'),(65,46,'ar','2016-01-21 13:27:16','2016-01-21 13:27:16','كسلا'),(66,47,'ar','2016-01-21 13:27:16','2016-01-21 13:27:16','القضارف'),(67,48,'ar','2016-01-21 13:27:16','2016-01-21 13:27:16','البحر الأحمر'),(68,49,'ar','2016-01-21 13:27:16','2016-01-21 13:27:16','شمال كردفان'),(69,50,'ar','2016-01-21 13:27:16','2016-01-21 13:27:16','جنوب كردفان'),(70,51,'ar','2016-01-21 13:27:16','2016-01-21 13:27:16','غرب كردفان'),(71,52,'ar','2016-01-21 13:27:16','2016-01-21 13:27:16','الشمالية'),(72,53,'ar','2016-01-21 13:27:17','2016-01-21 13:27:17','نهر النيل'),(73,55,'en','2016-01-21 13:29:57','2016-01-21 13:29:57','Al Jazirah'),(74,56,'en','2016-01-21 13:33:46','2016-01-21 13:33:46','Blue Nile '),(75,57,'en','2016-01-21 13:33:46','2016-01-21 13:33:46','Sennar'),(76,58,'en','2016-01-21 13:33:46','2016-01-21 13:33:46','White Nile'),(77,59,'en','2016-01-21 13:33:47','2016-01-21 13:33:47','Central Darfur'),(78,60,'en','2016-01-21 13:33:47','2016-01-21 13:33:47','East Darfur '),(79,61,'en','2016-01-21 13:33:47','2016-01-21 13:33:47','North Darfur '),(80,62,'en','2016-01-21 13:33:47','2016-01-21 13:33:47','South Darfur '),(81,63,'en','2016-01-21 13:33:47','2016-01-21 13:33:47','West Darfur'),(82,64,'en','2016-01-21 13:33:47','2016-01-21 13:33:47','Kassala'),(83,65,'en','2016-01-21 13:33:47','2016-01-21 13:33:47','Al Qadarif'),(84,66,'en','2016-01-21 13:33:47','2016-01-21 13:33:47','Red Sea'),(85,67,'en','2016-01-21 13:33:47','2016-01-21 13:33:47','North Kurdufan '),(86,68,'en','2016-01-21 13:33:48','2016-01-21 13:33:48','South Kurdufan'),(87,69,'en','2016-01-21 13:33:48','2016-01-21 13:33:48','West Kurdufan'),(88,70,'en','2016-01-21 13:33:48','2016-01-21 13:33:48','Northern'),(89,71,'en','2016-01-21 13:33:48','2016-01-21 13:33:48','River Nile'),(90,72,'en','2016-01-21 13:33:48','2016-01-21 13:33:48','Khartoum'),(91,55,'ar','2016-01-21 13:36:28','2016-01-21 13:36:28','الجزيرة'),(92,73,'en','2016-01-22 18:04:38','2016-01-22 18:04:38','Al Jazirah'),(93,73,'ar','2016-01-22 18:04:38','2016-01-22 18:04:38','الجزيرة'),(94,74,'en','2016-01-22 18:04:38','2016-01-22 18:04:38','Blue Nile '),(95,74,'ar','2016-01-22 18:04:39','2016-01-22 18:04:39','النيل الأزرق'),(96,75,'en','2016-01-22 18:04:39','2016-01-22 18:04:39','Sennar'),(97,75,'ar','2016-01-22 18:04:39','2016-01-22 18:04:39','سنار'),(98,76,'en','2016-01-22 18:04:39','2016-01-22 18:04:39','White Nile'),(99,76,'ar','2016-01-22 18:04:39','2016-01-22 18:04:39','النيلالأبيض'),(100,77,'en','2016-01-22 18:04:39','2016-01-22 18:04:39','Central Darfur'),(101,77,'ar','2016-01-22 18:04:39','2016-01-22 18:04:39','وسط دارفور'),(102,78,'en','2016-01-22 18:04:39','2016-01-22 18:04:39','East Darfur'),(103,78,'ar','2016-01-22 18:04:39','2016-01-22 18:04:39','شرق دارفور'),(104,79,'en','2016-01-22 18:04:39','2016-01-22 18:04:39','North Darfur'),(105,79,'ar','2016-01-22 18:04:39','2016-01-22 18:04:39','شمال دارفور'),(106,80,'en','2016-01-22 18:04:39','2016-01-22 18:04:39','South Darfur'),(107,80,'ar','2016-01-22 18:04:39','2016-01-22 18:04:39','جنوب دارفور'),(108,81,'en','2016-01-22 18:04:40','2016-01-22 18:04:40','West Darfur'),(109,81,'ar','2016-01-22 18:04:40','2016-01-22 18:04:40','غرب دارفور'),(110,82,'en','2016-01-22 18:04:40','2016-01-22 18:04:40','Kassala'),(111,82,'ar','2016-01-22 18:04:40','2016-01-22 18:04:40','كسلا'),(112,83,'en','2016-01-22 18:04:40','2016-01-22 18:04:40','Al Qadarif'),(113,83,'ar','2016-01-22 18:04:40','2016-01-22 18:04:40','القضارف'),(114,84,'en','2016-01-22 18:04:40','2016-01-22 18:04:40','Red Sea'),(115,84,'ar','2016-01-22 18:04:40','2016-01-22 18:04:40','البحر الأحمر'),(116,85,'en','2016-01-22 18:04:40','2016-01-22 18:04:40','North Kurdufan'),(117,85,'ar','2016-01-22 18:04:40','2016-01-22 18:04:40','شمال كردفان'),(118,86,'en','2016-01-22 18:04:40','2016-01-22 18:04:40','South Kurdufan'),(119,86,'ar','2016-01-22 18:04:41','2016-01-22 18:04:41','جنوب كردفان'),(120,87,'en','2016-01-22 18:04:41','2016-01-22 18:04:41','West Kurdufan'),(121,87,'ar','2016-01-22 18:04:41','2016-01-22 18:04:41','غرب كردفان'),(122,88,'en','2016-01-22 18:04:41','2016-01-22 18:04:41','Northern'),(123,88,'ar','2016-01-22 18:04:41','2016-01-22 18:04:41','الشمالية'),(124,89,'en','2016-01-22 18:04:41','2016-01-22 18:04:41','River Nile'),(125,89,'ar','2016-01-22 18:04:41','2016-01-22 18:04:41','نهر النيل'),(126,90,'en','2016-01-22 18:04:41','2016-01-22 18:04:41','Khartoum'),(127,90,'ar','2016-01-22 18:04:41','2016-01-22 18:04:41','الخرطوم');
/*!40000 ALTER TABLE `state_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (73,NULL,'2016-01-22 18:04:38','2016-01-22 18:04:38',NULL,NULL),(74,NULL,'2016-01-22 18:04:38','2016-01-22 18:04:38',NULL,NULL),(75,NULL,'2016-01-22 18:04:39','2016-01-22 18:04:39',NULL,NULL),(76,NULL,'2016-01-22 18:04:39','2016-01-22 18:04:39',NULL,NULL),(77,NULL,'2016-01-22 18:04:39','2016-01-22 18:04:39',NULL,NULL),(78,NULL,'2016-01-22 18:04:39','2016-01-22 18:04:39',NULL,NULL),(79,NULL,'2016-01-22 18:04:39','2016-01-22 18:04:39',NULL,NULL),(80,NULL,'2016-01-22 18:04:39','2016-01-22 18:04:39',NULL,NULL),(81,NULL,'2016-01-22 18:04:40','2016-01-22 18:04:40',NULL,NULL),(82,NULL,'2016-01-22 18:04:40','2016-01-22 18:04:40',NULL,NULL),(83,NULL,'2016-01-22 18:04:40','2016-01-22 18:04:40',NULL,NULL),(84,NULL,'2016-01-22 18:04:40','2016-01-22 18:04:40',NULL,NULL),(85,NULL,'2016-01-22 18:04:40','2016-01-22 18:04:40',NULL,NULL),(86,NULL,'2016-01-22 18:04:40','2016-01-22 18:04:40',NULL,NULL),(87,NULL,'2016-01-22 18:04:41','2016-01-22 18:04:41',NULL,NULL),(88,NULL,'2016-01-22 18:04:41','2016-01-22 18:04:41',NULL,NULL),(89,NULL,'2016-01-22 18:04:41','2016-01-22 18:04:41',NULL,NULL),(90,NULL,'2016-01-22 18:04:41','2016-01-22 18:04:41',NULL,NULL);
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `taggable_id` int(11) DEFAULT NULL,
  `taggable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_taggings_on_tag_id` (`tag_id`),
  KEY `index_taggings_on_taggable_type_and_taggable_id` (`taggable_type`,`taggable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34023 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
INSERT INTO `taggings` VALUES (33654,426,31418,'Member','2016-01-20 15:39:04','2016-01-20 15:39:04'),(33655,NULL,31419,'Member','2016-01-20 15:39:04','2016-01-20 15:39:04'),(33656,NULL,31420,'Member','2016-01-20 15:39:04','2016-01-20 15:39:04'),(33657,427,31421,'Member','2016-01-20 15:39:04','2016-01-20 15:39:04'),(33658,426,31422,'Member','2016-01-20 15:39:04','2016-01-20 15:39:04'),(33659,426,31423,'Member','2016-01-20 15:39:04','2016-01-20 15:39:04'),(33660,427,31424,'Member','2016-01-20 15:39:04','2016-01-20 15:39:04'),(33661,426,31425,'Member','2016-01-20 15:39:04','2016-01-20 15:39:04'),(33662,426,31426,'Member','2016-01-20 15:39:05','2016-01-20 15:39:05'),(33663,428,31427,'Member','2016-01-20 15:39:05','2016-01-20 15:39:05'),(33664,426,31428,'Member','2016-01-20 15:39:05','2016-01-20 15:39:05'),(33665,426,31429,'Member','2016-01-20 15:39:05','2016-01-20 15:39:05'),(33666,426,31430,'Member','2016-01-20 15:39:05','2016-01-20 15:39:05'),(33667,426,31431,'Member','2016-01-20 15:39:05','2016-01-20 15:39:05'),(33668,426,31432,'Member','2016-01-20 15:39:05','2016-01-20 15:39:05'),(33669,NULL,31433,'Member','2016-01-20 15:39:05','2016-01-20 15:39:05'),(33670,428,31434,'Member','2016-01-20 15:39:05','2016-01-20 15:39:05'),(33671,426,31435,'Member','2016-01-20 15:39:05','2016-01-20 15:39:05'),(33672,426,31436,'Member','2016-01-20 15:39:05','2016-01-20 15:39:05'),(33673,429,31437,'Member','2016-01-20 15:39:05','2016-01-20 15:39:05'),(33674,426,31438,'Member','2016-01-20 15:39:05','2016-01-20 15:39:05'),(33675,426,31439,'Member','2016-01-20 15:39:05','2016-01-20 15:39:05'),(33676,427,31440,'Member','2016-01-20 15:39:05','2016-01-20 15:39:05'),(33677,426,31441,'Member','2016-01-20 15:39:06','2016-01-20 15:39:06'),(33678,426,31442,'Member','2016-01-20 15:39:06','2016-01-20 15:39:06'),(33679,427,31443,'Member','2016-01-20 15:39:06','2016-01-20 15:39:06'),(33680,426,31444,'Member','2016-01-20 15:39:06','2016-01-20 15:39:06'),(33681,426,31445,'Member','2016-01-20 15:39:06','2016-01-20 15:39:06'),(33682,426,31446,'Member','2016-01-20 15:39:06','2016-01-20 15:39:06'),(33683,428,31447,'Member','2016-01-20 15:39:06','2016-01-20 15:39:06'),(33684,426,31448,'Member','2016-01-20 15:39:06','2016-01-20 15:39:06'),(33685,428,31449,'Member','2016-01-20 15:39:06','2016-01-20 15:39:06'),(33686,426,31450,'Member','2016-01-20 15:39:06','2016-01-20 15:39:06'),(33687,426,31451,'Member','2016-01-20 15:39:06','2016-01-20 15:39:06'),(33688,NULL,31452,'Member','2016-01-20 15:39:06','2016-01-20 15:39:06'),(33689,426,31453,'Member','2016-01-20 15:39:06','2016-01-20 15:39:06'),(33690,427,31454,'Member','2016-01-20 15:39:06','2016-01-20 15:39:06'),(33691,426,31455,'Member','2016-01-20 15:39:06','2016-01-20 15:39:06'),(33692,427,31456,'Member','2016-01-20 15:39:07','2016-01-20 15:39:07'),(33693,426,31457,'Member','2016-01-20 15:39:07','2016-01-20 15:39:07'),(33694,426,31458,'Member','2016-01-20 15:39:07','2016-01-20 15:39:07'),(33695,426,31459,'Member','2016-01-20 15:39:07','2016-01-20 15:39:07'),(33696,426,31460,'Member','2016-01-20 15:39:07','2016-01-20 15:39:07'),(33697,426,31461,'Member','2016-01-20 15:39:07','2016-01-20 15:39:07'),(33698,429,31462,'Member','2016-01-20 15:39:07','2016-01-20 15:39:07'),(33699,426,31463,'Member','2016-01-20 15:39:07','2016-01-20 15:39:07'),(33700,426,31464,'Member','2016-01-20 15:39:07','2016-01-20 15:39:07'),(33701,426,31465,'Member','2016-01-20 15:39:07','2016-01-20 15:39:07'),(33702,426,31466,'Member','2016-01-20 15:39:07','2016-01-20 15:39:07'),(33703,426,31467,'Member','2016-01-20 15:39:07','2016-01-20 15:39:07'),(33704,426,31468,'Member','2016-01-20 15:39:07','2016-01-20 15:39:07'),(33705,426,31469,'Member','2016-01-20 15:39:07','2016-01-20 15:39:07'),(33706,426,31470,'Member','2016-01-20 15:39:07','2016-01-20 15:39:07'),(33707,426,31471,'Member','2016-01-20 15:39:07','2016-01-20 15:39:07'),(33708,426,31472,'Member','2016-01-20 15:39:07','2016-01-20 15:39:07'),(33709,426,31473,'Member','2016-01-20 15:39:08','2016-01-20 15:39:08'),(33710,426,31474,'Member','2016-01-20 15:39:08','2016-01-20 15:39:08'),(33711,427,31475,'Member','2016-01-20 15:39:08','2016-01-20 15:39:08'),(33712,426,31476,'Member','2016-01-20 15:39:08','2016-01-20 15:39:08'),(33713,426,31477,'Member','2016-01-20 15:39:08','2016-01-20 15:39:08'),(33714,429,31478,'Member','2016-01-20 15:39:08','2016-01-20 15:39:08'),(33715,426,31479,'Member','2016-01-20 15:39:08','2016-01-20 15:39:08'),(33716,426,31480,'Member','2016-01-20 15:39:08','2016-01-20 15:39:08'),(33717,426,31481,'Member','2016-01-20 15:39:08','2016-01-20 15:39:08'),(33718,426,31482,'Member','2016-01-20 15:39:08','2016-01-20 15:39:08'),(33719,426,31483,'Member','2016-01-20 15:39:08','2016-01-20 15:39:08'),(33720,426,31484,'Member','2016-01-20 15:39:08','2016-01-20 15:39:08'),(33721,426,31485,'Member','2016-01-20 15:39:08','2016-01-20 15:39:08'),(33722,426,31486,'Member','2016-01-20 15:39:08','2016-01-20 15:39:08'),(33723,426,31487,'Member','2016-01-20 15:39:08','2016-01-20 15:39:08'),(33724,426,31488,'Member','2016-01-20 15:39:08','2016-01-20 15:39:08'),(33725,NULL,31489,'Member','2016-01-20 15:39:09','2016-01-20 15:39:09'),(33726,426,31490,'Member','2016-01-20 15:39:09','2016-01-20 15:39:09'),(33727,426,31491,'Member','2016-01-20 15:39:09','2016-01-20 15:39:09'),(33728,426,31492,'Member','2016-01-20 15:39:09','2016-01-20 15:39:09'),(33729,426,31493,'Member','2016-01-20 15:39:09','2016-01-20 15:39:09'),(33730,430,31494,'Member','2016-01-20 15:39:09','2016-01-20 15:39:09'),(33731,426,31495,'Member','2016-01-20 15:39:09','2016-01-20 15:39:09'),(33732,426,31496,'Member','2016-01-20 15:39:09','2016-01-20 15:39:09'),(33733,426,31497,'Member','2016-01-20 15:39:09','2016-01-20 15:39:09'),(33734,426,31498,'Member','2016-01-20 15:39:09','2016-01-20 15:39:09'),(33735,426,31499,'Member','2016-01-20 15:39:09','2016-01-20 15:39:09'),(33736,426,31500,'Member','2016-01-20 15:39:09','2016-01-20 15:39:09'),(33737,426,31501,'Member','2016-01-20 15:39:09','2016-01-20 15:39:09'),(33738,427,31502,'Member','2016-01-20 15:39:09','2016-01-20 15:39:09'),(33739,429,31503,'Member','2016-01-20 15:39:09','2016-01-20 15:39:09'),(33740,427,31504,'Member','2016-01-20 15:39:10','2016-01-20 15:39:10'),(33741,426,31505,'Member','2016-01-20 15:39:10','2016-01-20 15:39:10'),(33742,426,31506,'Member','2016-01-20 15:39:10','2016-01-20 15:39:10'),(33743,426,31507,'Member','2016-01-20 15:39:10','2016-01-20 15:39:10'),(33744,427,31508,'Member','2016-01-20 15:39:10','2016-01-20 15:39:10'),(33745,426,31509,'Member','2016-01-20 15:39:10','2016-01-20 15:39:10'),(33746,426,31510,'Member','2016-01-20 15:39:10','2016-01-20 15:39:10'),(33747,426,31511,'Member','2016-01-20 15:39:10','2016-01-20 15:39:10'),(33748,426,31512,'Member','2016-01-20 15:39:10','2016-01-20 15:39:10'),(33749,426,31513,'Member','2016-01-20 15:39:10','2016-01-20 15:39:10'),(33750,426,31514,'Member','2016-01-20 15:39:10','2016-01-20 15:39:10'),(33751,426,31515,'Member','2016-01-20 15:39:10','2016-01-20 15:39:10'),(33752,426,31516,'Member','2016-01-20 15:39:10','2016-01-20 15:39:10'),(33753,426,31517,'Member','2016-01-20 15:39:10','2016-01-20 15:39:10'),(33754,427,31518,'Member','2016-01-20 15:39:10','2016-01-20 15:39:10'),(33755,426,31519,'Member','2016-01-20 15:39:10','2016-01-20 15:39:10'),(33756,426,31520,'Member','2016-01-20 15:39:11','2016-01-20 15:39:11'),(33757,429,31521,'Member','2016-01-20 15:39:11','2016-01-20 15:39:11'),(33758,426,31522,'Member','2016-01-20 15:39:11','2016-01-20 15:39:11'),(33759,426,31523,'Member','2016-01-20 15:39:11','2016-01-20 15:39:11'),(33760,NULL,31524,'Member','2016-01-20 15:39:11','2016-01-20 15:39:11'),(33761,426,31525,'Member','2016-01-20 15:39:11','2016-01-20 15:39:11'),(33762,426,31526,'Member','2016-01-20 15:39:11','2016-01-20 15:39:11'),(33763,426,31527,'Member','2016-01-20 15:39:11','2016-01-20 15:39:11'),(33764,426,31528,'Member','2016-01-20 15:39:11','2016-01-20 15:39:11'),(33765,NULL,31529,'Member','2016-01-20 15:39:11','2016-01-20 15:39:11'),(33766,427,31530,'Member','2016-01-20 15:39:11','2016-01-20 15:39:11'),(33767,427,31531,'Member','2016-01-20 15:39:11','2016-01-20 15:39:11'),(33768,426,31532,'Member','2016-01-20 15:39:11','2016-01-20 15:39:11'),(33769,426,31533,'Member','2016-01-20 15:39:11','2016-01-20 15:39:11'),(33770,426,31534,'Member','2016-01-20 15:39:11','2016-01-20 15:39:11'),(33771,427,31535,'Member','2016-01-20 15:39:12','2016-01-20 15:39:12'),(33772,427,31536,'Member','2016-01-20 15:39:12','2016-01-20 15:39:12'),(33773,427,31537,'Member','2016-01-20 15:39:12','2016-01-20 15:39:12'),(33774,430,31538,'Member','2016-01-20 15:39:12','2016-01-20 15:39:12'),(33775,427,31539,'Member','2016-01-20 15:39:12','2016-01-20 15:39:12'),(33776,427,31540,'Member','2016-01-20 15:39:12','2016-01-20 15:39:12'),(33777,427,31541,'Member','2016-01-20 15:39:12','2016-01-20 15:39:12'),(33778,426,31542,'Member','2016-01-20 15:39:12','2016-01-20 15:39:12'),(33779,426,31543,'Member','2016-01-20 15:39:12','2016-01-20 15:39:12'),(33780,426,31544,'Member','2016-01-20 15:39:12','2016-01-20 15:39:12'),(33781,426,31545,'Member','2016-01-20 15:39:12','2016-01-20 15:39:12'),(33782,427,31546,'Member','2016-01-20 15:39:12','2016-01-20 15:39:12'),(33783,426,31547,'Member','2016-01-20 15:39:12','2016-01-20 15:39:12'),(33784,426,31548,'Member','2016-01-20 15:39:12','2016-01-20 15:39:12'),(33785,426,31549,'Member','2016-01-20 15:39:12','2016-01-20 15:39:12'),(33786,426,31550,'Member','2016-01-20 15:39:13','2016-01-20 15:39:13'),(33787,426,31551,'Member','2016-01-20 15:39:13','2016-01-20 15:39:13'),(33788,426,31552,'Member','2016-01-20 15:39:13','2016-01-20 15:39:13'),(33789,426,31553,'Member','2016-01-20 15:39:13','2016-01-20 15:39:13'),(33790,426,31554,'Member','2016-01-20 15:39:13','2016-01-20 15:39:13'),(33791,426,31555,'Member','2016-01-20 15:39:13','2016-01-20 15:39:13'),(33792,426,31556,'Member','2016-01-20 15:39:13','2016-01-20 15:39:13'),(33793,426,31557,'Member','2016-01-20 15:39:13','2016-01-20 15:39:13'),(33794,426,31558,'Member','2016-01-20 15:39:13','2016-01-20 15:39:13'),(33795,427,31559,'Member','2016-01-20 15:39:13','2016-01-20 15:39:13'),(33796,427,31560,'Member','2016-01-20 15:39:13','2016-01-20 15:39:13'),(33797,426,31561,'Member','2016-01-20 15:39:13','2016-01-20 15:39:13'),(33798,426,31562,'Member','2016-01-20 15:39:13','2016-01-20 15:39:13'),(33799,426,31563,'Member','2016-01-20 15:39:14','2016-01-20 15:39:14'),(33800,426,31564,'Member','2016-01-20 15:39:14','2016-01-20 15:39:14'),(33801,426,31565,'Member','2016-01-20 15:39:14','2016-01-20 15:39:14'),(33802,426,31566,'Member','2016-01-20 15:39:14','2016-01-20 15:39:14'),(33803,426,31567,'Member','2016-01-20 15:39:14','2016-01-20 15:39:14'),(33804,427,31568,'Member','2016-01-20 15:39:14','2016-01-20 15:39:14'),(33805,430,31569,'Member','2016-01-20 15:39:14','2016-01-20 15:39:14'),(33806,426,31570,'Member','2016-01-20 15:39:14','2016-01-20 15:39:14'),(33807,426,31571,'Member','2016-01-20 15:39:15','2016-01-20 15:39:15'),(33808,426,31572,'Member','2016-01-20 15:39:15','2016-01-20 15:39:15'),(33809,427,31573,'Member','2016-01-20 15:39:15','2016-01-20 15:39:15'),(33810,426,31574,'Member','2016-01-20 15:39:15','2016-01-20 15:39:15'),(33811,426,31575,'Member','2016-01-20 15:39:15','2016-01-20 15:39:15'),(33812,427,31576,'Member','2016-01-20 15:39:15','2016-01-20 15:39:15'),(33813,427,31577,'Member','2016-01-20 15:39:15','2016-01-20 15:39:15'),(33814,426,31578,'Member','2016-01-20 15:39:15','2016-01-20 15:39:15'),(33815,426,31579,'Member','2016-01-20 15:39:15','2016-01-20 15:39:15'),(33816,427,31580,'Member','2016-01-20 15:39:15','2016-01-20 15:39:15'),(33817,427,31581,'Member','2016-01-20 15:39:15','2016-01-20 15:39:15'),(33818,427,31582,'Member','2016-01-20 15:39:15','2016-01-20 15:39:15'),(33819,427,31583,'Member','2016-01-20 15:39:15','2016-01-20 15:39:15'),(33820,427,31584,'Member','2016-01-20 15:39:15','2016-01-20 15:39:15'),(33821,427,31585,'Member','2016-01-20 15:39:16','2016-01-20 15:39:16'),(33822,427,31586,'Member','2016-01-20 15:39:16','2016-01-20 15:39:16'),(33823,426,31587,'Member','2016-01-20 15:39:16','2016-01-20 15:39:16'),(33824,426,31588,'Member','2016-01-20 15:39:16','2016-01-20 15:39:16'),(33825,426,31589,'Member','2016-01-20 15:39:16','2016-01-20 15:39:16'),(33826,426,31590,'Member','2016-01-20 15:39:16','2016-01-20 15:39:16'),(33827,426,31591,'Member','2016-01-20 15:39:16','2016-01-20 15:39:16'),(33828,427,31592,'Member','2016-01-20 15:39:16','2016-01-20 15:39:16'),(33829,426,31593,'Member','2016-01-20 15:39:16','2016-01-20 15:39:16'),(33830,426,31594,'Member','2016-01-20 15:39:16','2016-01-20 15:39:16'),(33831,427,31595,'Member','2016-01-20 15:39:16','2016-01-20 15:39:16'),(33832,427,31596,'Member','2016-01-20 15:39:16','2016-01-20 15:39:16'),(33833,426,31597,'Member','2016-01-20 15:39:16','2016-01-20 15:39:16'),(33834,426,31598,'Member','2016-01-20 15:39:16','2016-01-20 15:39:16'),(33835,427,31599,'Member','2016-01-20 15:39:16','2016-01-20 15:39:16'),(33836,426,31600,'Member','2016-01-20 15:39:16','2016-01-20 15:39:16'),(33837,429,31601,'Member','2016-01-20 15:39:17','2016-01-20 15:39:17'),(33838,426,31602,'Member','2016-01-20 15:39:17','2016-01-20 15:39:17'),(33839,426,31603,'Member','2016-01-20 15:39:17','2016-01-20 15:39:17'),(33840,426,31604,'Member','2016-01-20 15:39:17','2016-01-20 15:39:17'),(33841,427,31605,'Member','2016-01-20 15:39:17','2016-01-20 15:39:17'),(33842,426,31606,'Member','2016-01-20 15:39:17','2016-01-20 15:39:17'),(33843,427,31607,'Member','2016-01-20 15:39:17','2016-01-20 15:39:17'),(33844,426,31608,'Member','2016-01-20 15:39:17','2016-01-20 15:39:17'),(33845,426,31609,'Member','2016-01-20 15:39:17','2016-01-20 15:39:17'),(33846,426,31610,'Member','2016-01-20 15:39:17','2016-01-20 15:39:17'),(33847,427,31611,'Member','2016-01-20 15:39:17','2016-01-20 15:39:17'),(33848,427,31612,'Member','2016-01-20 15:39:17','2016-01-20 15:39:17'),(33849,426,31613,'Member','2016-01-20 15:39:17','2016-01-20 15:39:17'),(33850,427,31614,'Member','2016-01-20 15:39:17','2016-01-20 15:39:17'),(33851,426,31615,'Member','2016-01-20 15:39:17','2016-01-20 15:39:17'),(33852,426,31616,'Member','2016-01-20 15:39:17','2016-01-20 15:39:17'),(33853,426,31617,'Member','2016-01-20 15:39:18','2016-01-20 15:39:18'),(33854,426,31618,'Member','2016-01-20 15:39:18','2016-01-20 15:39:18'),(33855,426,31619,'Member','2016-01-20 15:39:18','2016-01-20 15:39:18'),(33856,429,31620,'Member','2016-01-20 15:39:18','2016-01-20 15:39:18'),(33857,431,31621,'Member','2016-01-20 15:39:18','2016-01-20 15:39:18'),(33858,430,31622,'Member','2016-01-20 15:39:18','2016-01-20 15:39:18'),(33859,426,31623,'Member','2016-01-20 15:39:18','2016-01-20 15:39:18'),(33860,427,31624,'Member','2016-01-20 15:39:18','2016-01-20 15:39:18'),(33861,427,31625,'Member','2016-01-20 15:39:18','2016-01-20 15:39:18'),(33862,426,31626,'Member','2016-01-20 15:39:18','2016-01-20 15:39:18'),(33863,426,31627,'Member','2016-01-20 15:39:18','2016-01-20 15:39:18'),(33864,426,31628,'Member','2016-01-20 15:39:18','2016-01-20 15:39:18'),(33865,426,31629,'Member','2016-01-20 15:39:18','2016-01-20 15:39:18'),(33866,430,31630,'Member','2016-01-20 15:39:18','2016-01-20 15:39:18'),(33867,426,31631,'Member','2016-01-20 15:39:18','2016-01-20 15:39:18'),(33868,429,31632,'Member','2016-01-20 15:39:19','2016-01-20 15:39:19'),(33869,427,31633,'Member','2016-01-20 15:39:19','2016-01-20 15:39:19'),(33870,426,31634,'Member','2016-01-20 15:39:19','2016-01-20 15:39:19'),(33871,426,31635,'Member','2016-01-20 15:39:19','2016-01-20 15:39:19'),(33872,426,31636,'Member','2016-01-20 15:39:19','2016-01-20 15:39:19'),(33873,426,31637,'Member','2016-01-20 15:39:19','2016-01-20 15:39:19'),(33874,426,31638,'Member','2016-01-20 15:39:19','2016-01-20 15:39:19'),(33875,426,31639,'Member','2016-01-20 15:39:19','2016-01-20 15:39:19'),(33876,426,31640,'Member','2016-01-20 15:39:19','2016-01-20 15:39:19'),(33877,426,31641,'Member','2016-01-20 15:39:19','2016-01-20 15:39:19'),(33878,430,31642,'Member','2016-01-20 15:39:19','2016-01-20 15:39:19'),(33879,426,31643,'Member','2016-01-20 15:39:19','2016-01-20 15:39:19'),(33880,426,31644,'Member','2016-01-20 15:39:19','2016-01-20 15:39:19'),(33881,426,31645,'Member','2016-01-20 15:39:19','2016-01-20 15:39:19'),(33882,426,31646,'Member','2016-01-20 15:39:19','2016-01-20 15:39:19'),(33883,426,31647,'Member','2016-01-20 15:39:19','2016-01-20 15:39:19'),(33884,426,31648,'Member','2016-01-20 15:39:19','2016-01-20 15:39:19'),(33885,426,31649,'Member','2016-01-20 15:39:20','2016-01-20 15:39:20'),(33886,426,31650,'Member','2016-01-20 15:39:20','2016-01-20 15:39:20'),(33887,429,31651,'Member','2016-01-20 15:39:20','2016-01-20 15:39:20'),(33888,429,31652,'Member','2016-01-20 15:39:20','2016-01-20 15:39:20'),(33889,426,31653,'Member','2016-01-20 15:39:20','2016-01-20 15:39:20'),(33890,427,31654,'Member','2016-01-20 15:39:20','2016-01-20 15:39:20'),(33891,426,31655,'Member','2016-01-20 15:39:20','2016-01-20 15:39:20'),(33892,426,31656,'Member','2016-01-20 15:39:20','2016-01-20 15:39:20'),(33893,427,31657,'Member','2016-01-20 15:39:20','2016-01-20 15:39:20'),(33894,426,31658,'Member','2016-01-20 15:39:20','2016-01-20 15:39:20'),(33895,427,31659,'Member','2016-01-20 15:39:20','2016-01-20 15:39:20'),(33896,426,31660,'Member','2016-01-20 15:39:20','2016-01-20 15:39:20'),(33897,426,31661,'Member','2016-01-20 15:39:20','2016-01-20 15:39:20'),(33898,427,31662,'Member','2016-01-20 15:39:20','2016-01-20 15:39:20'),(33899,426,31663,'Member','2016-01-20 15:39:21','2016-01-20 15:39:21'),(33900,430,31664,'Member','2016-01-20 15:39:21','2016-01-20 15:39:21'),(33901,426,31665,'Member','2016-01-20 15:39:21','2016-01-20 15:39:21'),(33902,429,31666,'Member','2016-01-20 15:39:21','2016-01-20 15:39:21'),(33903,426,31667,'Member','2016-01-20 15:39:21','2016-01-20 15:39:21'),(33904,426,31668,'Member','2016-01-20 15:39:21','2016-01-20 15:39:21'),(33905,426,31669,'Member','2016-01-20 15:39:21','2016-01-20 15:39:21'),(33906,426,31670,'Member','2016-01-20 15:39:21','2016-01-20 15:39:21'),(33907,426,31671,'Member','2016-01-20 15:39:21','2016-01-20 15:39:21'),(33908,426,31672,'Member','2016-01-20 15:39:21','2016-01-20 15:39:21'),(33909,426,31673,'Member','2016-01-20 15:39:21','2016-01-20 15:39:21'),(33910,429,31674,'Member','2016-01-20 15:39:21','2016-01-20 15:39:21'),(33911,426,31675,'Member','2016-01-20 15:39:21','2016-01-20 15:39:21'),(33912,427,31676,'Member','2016-01-20 15:39:21','2016-01-20 15:39:21'),(33913,426,31677,'Member','2016-01-20 15:39:21','2016-01-20 15:39:21'),(33914,427,31678,'Member','2016-01-20 15:39:22','2016-01-20 15:39:22'),(33915,426,31679,'Member','2016-01-20 15:39:22','2016-01-20 15:39:22'),(33916,426,31680,'Member','2016-01-20 15:39:22','2016-01-20 15:39:22'),(33917,427,31681,'Member','2016-01-20 15:39:22','2016-01-20 15:39:22'),(33918,426,31682,'Member','2016-01-20 15:39:22','2016-01-20 15:39:22'),(33919,429,31683,'Member','2016-01-20 15:39:22','2016-01-20 15:39:22'),(33920,429,31684,'Member','2016-01-20 15:39:22','2016-01-20 15:39:22'),(33921,426,31685,'Member','2016-01-20 15:39:22','2016-01-20 15:39:22'),(33922,426,31686,'Member','2016-01-20 15:39:22','2016-01-20 15:39:22'),(33923,426,31687,'Member','2016-01-20 15:39:22','2016-01-20 15:39:22'),(33924,429,31688,'Member','2016-01-20 15:39:22','2016-01-20 15:39:22'),(33925,429,31689,'Member','2016-01-20 15:39:22','2016-01-20 15:39:22'),(33926,427,31690,'Member','2016-01-20 15:39:22','2016-01-20 15:39:22'),(33927,426,31691,'Member','2016-01-20 15:39:22','2016-01-20 15:39:22'),(33928,427,31692,'Member','2016-01-20 15:39:22','2016-01-20 15:39:22'),(33929,426,31693,'Member','2016-01-20 15:39:22','2016-01-20 15:39:22'),(33930,426,31694,'Member','2016-01-20 15:39:22','2016-01-20 15:39:22'),(33931,426,31695,'Member','2016-01-20 15:39:23','2016-01-20 15:39:23'),(33932,426,31696,'Member','2016-01-20 15:39:23','2016-01-20 15:39:23'),(33933,426,31697,'Member','2016-01-20 15:39:23','2016-01-20 15:39:23'),(33934,426,31698,'Member','2016-01-20 15:39:23','2016-01-20 15:39:23'),(33935,426,31699,'Member','2016-01-20 15:39:23','2016-01-20 15:39:23'),(33936,426,31700,'Member','2016-01-20 15:39:23','2016-01-20 15:39:23'),(33937,426,31701,'Member','2016-01-20 15:39:23','2016-01-20 15:39:23'),(33938,427,31702,'Member','2016-01-20 15:39:23','2016-01-20 15:39:23'),(33939,427,31703,'Member','2016-01-20 15:39:23','2016-01-20 15:39:23'),(33940,426,31704,'Member','2016-01-20 15:39:23','2016-01-20 15:39:23'),(33941,426,31705,'Member','2016-01-20 15:39:23','2016-01-20 15:39:23'),(33942,426,31706,'Member','2016-01-20 15:39:23','2016-01-20 15:39:23'),(33943,426,31707,'Member','2016-01-20 15:39:23','2016-01-20 15:39:23'),(33944,427,31708,'Member','2016-01-20 15:39:23','2016-01-20 15:39:23'),(33945,426,31709,'Member','2016-01-20 15:39:23','2016-01-20 15:39:23'),(33946,426,31710,'Member','2016-01-20 15:39:24','2016-01-20 15:39:24'),(33947,426,31711,'Member','2016-01-20 15:39:24','2016-01-20 15:39:24'),(33948,426,31712,'Member','2016-01-20 15:39:24','2016-01-20 15:39:24'),(33949,426,31713,'Member','2016-01-20 15:39:24','2016-01-20 15:39:24'),(33950,426,31714,'Member','2016-01-20 15:39:24','2016-01-20 15:39:24'),(33951,427,31715,'Member','2016-01-20 15:39:24','2016-01-20 15:39:24'),(33952,427,31716,'Member','2016-01-20 15:39:24','2016-01-20 15:39:24'),(33953,426,31717,'Member','2016-01-20 15:39:24','2016-01-20 15:39:24'),(33954,426,31718,'Member','2016-01-20 15:39:24','2016-01-20 15:39:24'),(33955,426,31719,'Member','2016-01-20 15:39:24','2016-01-20 15:39:24'),(33956,427,31720,'Member','2016-01-20 15:39:24','2016-01-20 15:39:24'),(33957,426,31721,'Member','2016-01-20 15:39:24','2016-01-20 15:39:24'),(33958,426,31722,'Member','2016-01-20 15:39:24','2016-01-20 15:39:24'),(33959,426,31723,'Member','2016-01-20 15:39:24','2016-01-20 15:39:24'),(33960,426,31724,'Member','2016-01-20 15:39:24','2016-01-20 15:39:24'),(33961,427,31725,'Member','2016-01-20 15:39:25','2016-01-20 15:39:25'),(33962,427,31726,'Member','2016-01-20 15:39:25','2016-01-20 15:39:25'),(33963,429,31727,'Member','2016-01-20 15:39:25','2016-01-20 15:39:25'),(33964,429,31728,'Member','2016-01-20 15:39:25','2016-01-20 15:39:25'),(33965,429,31729,'Member','2016-01-20 15:39:25','2016-01-20 15:39:25'),(33966,427,31730,'Member','2016-01-20 15:39:25','2016-01-20 15:39:25'),(33967,426,31731,'Member','2016-01-20 15:39:25','2016-01-20 15:39:25'),(33968,427,31732,'Member','2016-01-20 15:39:26','2016-01-20 15:39:26'),(33969,427,31733,'Member','2016-01-20 15:39:26','2016-01-20 15:39:26'),(33970,426,31734,'Member','2016-01-20 15:39:26','2016-01-20 15:39:26'),(33971,429,31735,'Member','2016-01-20 15:39:26','2016-01-20 15:39:26'),(33972,426,31736,'Member','2016-01-20 15:39:26','2016-01-20 15:39:26'),(33973,426,31737,'Member','2016-01-20 15:39:26','2016-01-20 15:39:26'),(33974,427,31738,'Member','2016-01-20 15:39:26','2016-01-20 15:39:26'),(33975,426,31739,'Member','2016-01-20 15:39:26','2016-01-20 15:39:26'),(33976,426,31740,'Member','2016-01-20 15:39:26','2016-01-20 15:39:26'),(33977,427,31741,'Member','2016-01-20 15:39:26','2016-01-20 15:39:26'),(33978,427,31742,'Member','2016-01-20 15:39:26','2016-01-20 15:39:26'),(33979,426,31743,'Member','2016-01-20 15:39:26','2016-01-20 15:39:26'),(33980,426,31744,'Member','2016-01-20 15:39:26','2016-01-20 15:39:26'),(33981,430,31745,'Member','2016-01-20 15:39:26','2016-01-20 15:39:26'),(33982,426,31746,'Member','2016-01-20 15:39:26','2016-01-20 15:39:26'),(33983,426,31747,'Member','2016-01-20 15:39:26','2016-01-20 15:39:26'),(33984,426,31748,'Member','2016-01-20 15:39:27','2016-01-20 15:39:27'),(33985,427,31749,'Member','2016-01-20 15:39:27','2016-01-20 15:39:27'),(33986,427,31750,'Member','2016-01-20 15:39:27','2016-01-20 15:39:27'),(33987,427,31751,'Member','2016-01-20 15:39:27','2016-01-20 15:39:27'),(33988,426,31752,'Member','2016-01-20 15:39:27','2016-01-20 15:39:27'),(33989,426,31753,'Member','2016-01-20 15:39:27','2016-01-20 15:39:27'),(33990,426,31754,'Member','2016-01-20 15:39:27','2016-01-20 15:39:27'),(33991,427,31755,'Member','2016-01-20 15:39:27','2016-01-20 15:39:27'),(33992,426,31756,'Member','2016-01-20 15:39:27','2016-01-20 15:39:27'),(33993,426,31757,'Member','2016-01-20 15:39:27','2016-01-20 15:39:27'),(33994,427,31758,'Member','2016-01-20 15:39:27','2016-01-20 15:39:27'),(33995,426,31759,'Member','2016-01-20 15:39:27','2016-01-20 15:39:27'),(33996,426,31760,'Member','2016-01-20 15:39:27','2016-01-20 15:39:27'),(33997,426,31761,'Member','2016-01-20 15:39:27','2016-01-20 15:39:27'),(33998,427,31762,'Member','2016-01-20 15:39:27','2016-01-20 15:39:27'),(33999,NULL,31763,'Member','2016-01-20 15:39:28','2016-01-20 15:39:28'),(34000,427,31764,'Member','2016-01-20 15:39:28','2016-01-20 15:39:28'),(34001,427,31765,'Member','2016-01-20 15:39:28','2016-01-20 15:39:28'),(34002,426,31766,'Member','2016-01-20 15:39:28','2016-01-20 15:39:28'),(34003,426,31767,'Member','2016-01-20 15:39:28','2016-01-20 15:39:28'),(34004,426,31768,'Member','2016-01-20 15:39:28','2016-01-20 15:39:28'),(34005,426,31769,'Member','2016-01-20 15:39:28','2016-01-20 15:39:28'),(34006,426,31770,'Member','2016-01-20 15:39:28','2016-01-20 15:39:28'),(34007,426,31771,'Member','2016-01-20 15:39:28','2016-01-20 15:39:28'),(34008,426,31772,'Member','2016-01-20 15:39:28','2016-01-20 15:39:28'),(34009,426,31773,'Member','2016-01-20 15:39:28','2016-01-20 15:39:28'),(34010,427,31774,'Member','2016-01-20 15:39:28','2016-01-20 15:39:28'),(34011,426,31775,'Member','2016-01-20 15:39:28','2016-01-20 15:39:28'),(34012,426,31776,'Member','2016-01-20 15:39:28','2016-01-20 15:39:28'),(34013,426,31777,'Member','2016-01-20 15:39:28','2016-01-20 15:39:28'),(34014,426,31778,'Member','2016-01-20 15:39:28','2016-01-20 15:39:28'),(34015,426,31779,'Member','2016-01-20 15:39:29','2016-01-20 15:39:29'),(34016,426,31780,'Member','2016-01-20 15:39:29','2016-01-20 15:39:29'),(34017,430,31781,'Member','2016-01-20 15:39:29','2016-01-20 15:39:29'),(34018,427,31782,'Member','2016-01-20 15:39:29','2016-01-20 15:39:29'),(34019,426,31783,'Member','2016-01-20 15:39:29','2016-01-20 15:39:29'),(34020,426,31784,'Member','2016-01-20 15:39:29','2016-01-20 15:39:29'),(34021,426,31785,'Member','2016-01-20 15:39:29','2016-01-20 15:39:29'),(34022,426,31786,'Member','2016-01-20 15:39:29','2016-01-20 15:39:29');
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT '#5bc0de',
  `projects_count` int(11) DEFAULT NULL,
  `members_count` int(11) DEFAULT NULL,
  `importers_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=432 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (426,'Bachelor','#5bc0de',NULL,249,NULL),(427,'Master','#5bc0de',NULL,78,NULL),(428,'Undergraduate','#5bc0de',NULL,4,NULL),(429,'Doctorate','#5bc0de',NULL,20,NULL),(430,'Diploma','#5bc0de',NULL,9,NULL),(431,'Secondary','#5bc0de',NULL,1,NULL);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_translations`
--

DROP TABLE IF EXISTS `user_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_translations_on_locale` (`locale`) USING BTREE,
  KEY `index_user_translations_on_user_id` (`user_id`) USING BTREE,
  KEY `locale` (`locale`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_translations`
--

LOCK TABLES `user_translations` WRITE;
/*!40000 ALTER TABLE `user_translations` DISABLE KEYS */;
INSERT INTO `user_translations` VALUES (1,1,'en','2016-01-06 08:14:18','2016-01-06 08:14:18','Administrator'),(2,1,'ar','2016-01-06 08:23:34','2016-01-06 08:23:34',NULL),(3,3,'en','2016-01-06 08:28:47','2016-01-06 08:42:18','Reem Gasim'),(4,4,'en','2016-01-06 08:32:02','2016-01-07 10:35:30',''),(5,3,'ar','2016-01-06 08:42:18','2016-01-06 08:42:18','ريم قاسم'),(6,4,'ar','2016-01-07 10:35:30','2016-01-07 10:35:30',''),(7,5,'en','2016-01-07 10:40:28','2016-01-07 10:40:28',''),(8,5,'ar','2016-01-07 10:40:28','2016-01-07 10:40:28',''),(9,6,'en','2016-01-07 11:07:22','2016-01-07 11:07:22',NULL),(10,7,'en','2016-01-07 11:11:15','2016-01-07 11:11:15',NULL),(11,7,'ar','2016-01-07 11:11:58','2016-01-07 11:11:58',NULL),(12,8,'en','2016-01-07 11:12:59','2016-01-07 11:12:59',NULL),(13,9,'en','2016-01-07 11:15:04','2016-01-07 11:15:04',NULL),(14,10,'en','2016-01-07 11:17:33','2016-01-07 11:17:33',NULL),(15,10,'ar','2016-01-10 06:44:23','2016-01-10 06:44:23',NULL);
/*!40000 ALTER TABLE `user_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password_digest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(11) DEFAULT '1',
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`) USING BTREE,
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`) USING BTREE,
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin',NULL,NULL,'info@example.com',NULL,1,'2016-01-06 08:14:18','2016-01-24 09:41:45',NULL,NULL,'$2a$10$gFbtgqjs.RpoelH9dJnRuuK2PgO87tQHcc7ckREcPbkp/TQViDHOK',NULL,NULL,NULL,13,'2016-01-21 10:35:23','2016-01-16 20:43:46','127.0.0.1','127.0.0.1',NULL,NULL,'en',2,NULL,'2016-01-06 08:14:18',NULL,NULL),(3,'ريم ',NULL,'','reemgasim@gmail.com',NULL,0,'2016-01-06 08:28:40','2016-01-07 10:37:03',NULL,1,'$2a$10$82Wxrsm06552gOpzttlO2.HN92KAjin0ijpL1g7/arxXiSN6Hpl06',NULL,NULL,NULL,1,'2016-01-06 08:36:09','2016-01-06 08:36:09','127.0.0.1','127.0.0.1',NULL,NULL,NULL,2,'z4Fu9QWabS9xg9Xzpt-f','2016-01-06 08:36:09','2016-01-06 08:28:40',NULL),(4,'Ahmed',NULL,'','reemabdalgium@yahoo.com',NULL,0,'2016-01-06 08:31:54','2016-01-07 10:39:28',NULL,1,'$2a$10$5EJb5MD5NxDDH9tlX1Qp/uSioAfF1gSVH7RflP9hQHcvPzJqIRyYG',NULL,NULL,NULL,2,'2016-01-06 08:37:05','2016-01-06 08:34:09','127.0.0.1','127.0.0.1',NULL,NULL,NULL,3,'yqGi3xfzs2kxxxbxphLf','2016-01-06 08:34:09','2016-01-06 08:31:54',NULL),(10,NULL,NULL,NULL,'arwa.tayeb@eptikar.com',NULL,NULL,'2016-01-07 11:17:31','2016-01-10 08:22:40',NULL,NULL,'',NULL,NULL,NULL,1,'2016-01-07 11:17:54','2016-01-07 11:17:54','127.0.0.1','127.0.0.1',NULL,NULL,'en',2,'x2R4b7srkAmjx3v6sFzw','2016-01-07 11:17:54','2016-01-07 11:17:31',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-24 12:42:31
# Converted with pg2mysql-1.9
# Converted on Sun, 24 Jan 2016 04:04:42 -0500
# Lightbox Technologies Inc. http://www.lightbox.ca

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone="+00:00";

CREATE TABLE activities (
    id int(11) NOT NULL,
    name varchar(255),
    project_id int(11),
    branch_id int(11),
    budget numeric(10,0),
    description text,
    `from` date,
    `to` date,
    repeated int(11),
    created_at timestamp,
    updated_at timestamp,
    created_by int(11),
    updated_by int(11),
    location_id int(11)
) ENGINE=MyISAM;

CREATE TABLE activity_locations (
    id int(11) NOT NULL,
    activity_id int(11),
    location_id int(11),
    created_at timestamp,
    updated_at timestamp,
    created_by int(11),
    updated_by int(11)
) ENGINE=MyISAM;

CREATE TABLE activity_members (
    id int(11) NOT NULL,
    activity_id int(11),
    member_id int(11),
    role_id int(11),
    created_at timestamp,
    updated_at timestamp,
    created_by int(11),
    updated_by int(11)
) ENGINE=MyISAM;

CREATE TABLE activity_translations (
    id int(11) NOT NULL,
    activity_id int(11) NOT NULL,
    locale varchar(255) NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    name varchar(255),
    description text
) ENGINE=MyISAM;

CREATE TABLE attachments (
    id int(11) NOT NULL,
    name varchar(255),
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    file_file_name varchar(255),
    file_content_type varchar(255),
    file_file_size int(11),
    file_updated_at timestamp
) ENGINE=MyISAM;

CREATE TABLE branch_translations (
    id int(11) NOT NULL,
    branch_id int(11) NOT NULL,
    locale varchar(255) NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    name varchar(255),
    description text
) ENGINE=MyISAM;

CREATE TABLE branches (
    id int(11) NOT NULL,
    name varchar(255),
    description text,
    state_id int(11),
    created_at timestamp,
    updated_at timestamp,
    created_by int(11),
    updated_by int(11)
) ENGINE=MyISAM;

CREATE TABLE donor_translations (
    id int(11) NOT NULL,
    donor_id int(11) NOT NULL,
    locale varchar(255) NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    name varchar(255),
    description text
) ENGINE=MyISAM;

CREATE TABLE donors (
    id int(11) NOT NULL,
    name varchar(255),
    email varchar(255),
    phone1 varchar(255),
    phone2 varchar(255),
    fax varchar(255),
    description text,
    created_at timestamp,
    updated_at timestamp,
    created_by int(11),
    updated_by int(11)
) ENGINE=MyISAM;

CREATE TABLE location_translations (
    id int(11) NOT NULL,
    location_id int(11) NOT NULL,
    locale varchar(255) NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    name varchar(255)
) ENGINE=MyISAM;

CREATE TABLE locations (
    id int(11) NOT NULL,
    state_id int(11),
    name varchar(255),
    created_at timestamp,
    updated_at timestamp,
    created_by int(11),
    updated_by int(11)
) ENGINE=MyISAM;

CREATE TABLE members (
    id int(11) NOT NULL,
    name varchar(255),
    gender int(11),
    joined_at date,
    email varchar(255),
    mobile varchar(255),
    address varchar(255),
    education varchar(255),
    bio text,
    active bool,
    created_at timestamp,
    updated_at timestamp,
    branch_id int(11),
    role_id int(11),
    created_by int(11),
    updated_by int(11),
    avatar_file_name varchar(255),
    avatar_content_type varchar(255),
    avatar_file_size int(11),
    avatar_updated_at timestamp,
    profession_id int(11),
    organization_id int(11),
    user_id int(11)
) ENGINE=MyISAM;

CREATE TABLE organization_translations (
    id int(11) NOT NULL,
    organization_id int(11) NOT NULL,
    locale varchar(255) NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    name varchar(255),
    description text
) ENGINE=MyISAM;

CREATE TABLE organizations (
    id int(11) NOT NULL,
    name varchar(255),
    website varchar(255),
    subdomain varchar(255),
    email varchar(255),
    phone1 varchar(255),
    phone2 varchar(255),
    fax varchar(255),
    address varchar(255),
    description text,
    active bool,
    created_at timestamp,
    updated_at timestamp,
    created_by int(11),
    updated_by int(11),
    logo_file_name varchar(255),
    logo_content_type varchar(255),
    logo_file_size int(11),
    logo_updated_at timestamp,
    trello_member_token varchar(255)
) ENGINE=MyISAM;

CREATE TABLE profession_translations (
    id int(11) NOT NULL,
    profession_id int(11) NOT NULL,
    locale varchar(255) NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    name varchar(255)
) ENGINE=MyISAM;

CREATE TABLE professions (
    id int(11) NOT NULL,
    name varchar(255),
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL
) ENGINE=MyISAM;

CREATE TABLE project_attachments (
    id int(11) NOT NULL,
    attachment_id int(11),
    project_id int(11),
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    attachment_file_name varchar(255),
    attachment_content_type varchar(255),
    attachment_file_size int(11),
    attachment_updated_at timestamp
) ENGINE=MyISAM;

CREATE TABLE project_donors (
    id int(11) NOT NULL,
    project_id int(11),
    donor_id int(11),
    created_at timestamp,
    updated_at timestamp,
    created_by int(11),
    updated_by int(11)
) ENGINE=MyISAM;

CREATE TABLE project_locations (
    id int(11) NOT NULL,
    project_id int(11),
    location_id int(11),
    created_at timestamp,
    updated_at timestamp,
    created_by int(11),
    updated_by int(11)
) ENGINE=MyISAM;

CREATE TABLE project_members (
    id int(11) NOT NULL,
    project_id int(11),
    member_id int(11),
    role_id int(11),
    created_at timestamp,
    updated_at timestamp,
    created_by int(11),
    updated_by int(11)
) ENGINE=MyISAM;

CREATE TABLE project_milestone_translations (
    id int(11) NOT NULL,
    project_milestone_id int(11) NOT NULL,
    locale varchar(255) NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    name varchar(255),
    description text
) ENGINE=MyISAM;

CREATE TABLE project_milestones (
    id int(11) NOT NULL,
    name varchar(255),
    description text,
    expences numeric(12,2) DEFAULT 0.0,
    project_id int(11),
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL
) ENGINE=MyISAM;

CREATE TABLE project_partners (
    id int(11) NOT NULL,
    project_id int(11),
    organization_id int(11),
    created_at timestamp,
    updated_at timestamp,
    created_by int(11),
    updated_by int(11)
) ENGINE=MyISAM;

CREATE TABLE project_roles (
    id int(11) NOT NULL,
    role_id int(11),
    project_id int(11),
    member_id int(11),
    description text,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL
) ENGINE=MyISAM;

CREATE TABLE project_translations (
    id int(11) NOT NULL,
    project_id int(11) NOT NULL,
    locale varchar(255) NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    name varchar(255),
    description text
) ENGINE=MyISAM;

CREATE TABLE projects (
    id int(11) NOT NULL,
    name varchar(255),
    budget numeric(12,2) DEFAULT 0.0,
    `from` date,
    `to` date,
    goal text,
    description text,
    branch_id int(11),
    created_at timestamp,
    updated_at timestamp,
    created_by int(11),
    updated_by int(11),
    overall_expences numeric(12,2) DEFAULT 0.0,
    required_document_file_name varchar(255),
    required_document_content_type varchar(255),
    required_document_file_size int(11),
    required_document_updated_at timestamp,
    location_id int(11),
    trello_board_id varchar(255),
    organization_id int(11)
) ENGINE=MyISAM;

CREATE TABLE public_activities (
    id int(11) NOT NULL,
    trackable_id int(11),
    trackable_type varchar(255),
    owner_id int(11),
    owner_type varchar(255),
    key varchar(255),
    parameters text,
    recipient_id int(11),
    recipient_type varchar(255),
    created_at timestamp,
    updated_at timestamp
) ENGINE=MyISAM;

CREATE TABLE role_translations (
    id int(11) NOT NULL,
    role_id int(11) NOT NULL,
    locale varchar(255) NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    name varchar(255)
) ENGINE=MyISAM;

CREATE TABLE roles (
    id int(11) NOT NULL,
    name varchar(255),
    created_at timestamp,
    updated_at timestamp,
    created_by int(11),
    updated_by int(11),
    permissions text
) ENGINE=MyISAM;

CREATE TABLE schema_migrations (
    version varchar(255) NOT NULL
) ENGINE=MyISAM;

CREATE TABLE state_translations (
    id int(11) NOT NULL,
    state_id int(11) NOT NULL,
    locale varchar(255) NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    name varchar(255)
) ENGINE=MyISAM;

CREATE TABLE states (
    id int(11) NOT NULL,
    name varchar(255),
    created_at timestamp,
    updated_at timestamp,
    created_by int(11),
    updated_by int(11)
) ENGINE=MyISAM;

CREATE TABLE user_translations (
    id int(11) NOT NULL,
    user_id int(11) NOT NULL,
    locale varchar(255) NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    full_name varchar(255)
) ENGINE=MyISAM;

CREATE TABLE users (
    id int(11) NOT NULL,
    name varchar(255),
    full_name varchar(255),
    mobile varchar(255),
    email varchar(255) DEFAULT '',
    password_digest varchar(255),
    active bool,
    created_at timestamp,
    updated_at timestamp,
    created_by int(11),
    updated_by int(11),
    encrypted_password varchar(255) DEFAULT '',
    reset_password_token varchar(255),
    reset_password_sent_at timestamp,
    remember_created_at timestamp,
    sign_in_count int(11) DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp,
    last_sign_in_at timestamp,
    current_sign_in_ip varchar(255),
    last_sign_in_ip varchar(255),
    provider varchar(255),
    uid varchar(255),
    language varchar(255),
    role_id int(11) DEFAULT 1,
    confirmation_token varchar(255),
    confirmed_at timestamp,
    confirmation_sent_at timestamp,
    unconfirmed_email varchar(255)
) ENGINE=MyISAM;

ALTER TABLE activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);
ALTER TABLE activity_locations
    ADD CONSTRAINT activity_locations_pkey PRIMARY KEY (id);
ALTER TABLE activity_members
    ADD CONSTRAINT activity_members_pkey PRIMARY KEY (id);
ALTER TABLE activity_translations
    ADD CONSTRAINT activity_translations_pkey PRIMARY KEY (id);
ALTER TABLE attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);
ALTER TABLE branch_translations
    ADD CONSTRAINT branch_translations_pkey PRIMARY KEY (id);
ALTER TABLE branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (id);
ALTER TABLE donor_translations
    ADD CONSTRAINT donor_translations_pkey PRIMARY KEY (id);
ALTER TABLE donors
    ADD CONSTRAINT donors_pkey PRIMARY KEY (id);
ALTER TABLE location_translations
    ADD CONSTRAINT location_translations_pkey PRIMARY KEY (id);
ALTER TABLE locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);
ALTER TABLE members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);
ALTER TABLE organization_translations
    ADD CONSTRAINT organization_translations_pkey PRIMARY KEY (id);
ALTER TABLE organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);
ALTER TABLE profession_translations
    ADD CONSTRAINT profession_translations_pkey PRIMARY KEY (id);
ALTER TABLE professions
    ADD CONSTRAINT professions_pkey PRIMARY KEY (id);
ALTER TABLE project_attachments
    ADD CONSTRAINT project_attachments_pkey PRIMARY KEY (id);
ALTER TABLE project_donors
    ADD CONSTRAINT project_donors_pkey PRIMARY KEY (id);
ALTER TABLE project_locations
    ADD CONSTRAINT project_locations_pkey PRIMARY KEY (id);
ALTER TABLE project_members
    ADD CONSTRAINT project_members_pkey PRIMARY KEY (id);
ALTER TABLE project_milestone_translations
    ADD CONSTRAINT project_milestone_translations_pkey PRIMARY KEY (id);
ALTER TABLE project_milestones
    ADD CONSTRAINT project_milestones_pkey PRIMARY KEY (id);
ALTER TABLE project_partners
    ADD CONSTRAINT project_partners_pkey PRIMARY KEY (id);
ALTER TABLE project_roles
    ADD CONSTRAINT project_roles_pkey PRIMARY KEY (id);
ALTER TABLE project_translations
    ADD CONSTRAINT project_translations_pkey PRIMARY KEY (id);
ALTER TABLE projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);
ALTER TABLE public_activities
    ADD CONSTRAINT public_activities_pkey PRIMARY KEY (id);
ALTER TABLE role_translations
    ADD CONSTRAINT role_translations_pkey PRIMARY KEY (id);
ALTER TABLE roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
ALTER TABLE state_translations
    ADD CONSTRAINT state_translations_pkey PRIMARY KEY (id);
ALTER TABLE states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);
ALTER TABLE user_translations
    ADD CONSTRAINT user_translations_pkey PRIMARY KEY (id);
ALTER TABLE users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
ALTER TABLE `activity_translations` ADD INDEX ( activity_id ) ;
ALTER TABLE `activity_translations` ADD INDEX ( locale ) ;
ALTER TABLE `branch_translations` ADD INDEX ( branch_id ) ;
ALTER TABLE `branch_translations` ADD INDEX ( locale ) ;
ALTER TABLE `donor_translations` ADD INDEX ( donor_id ) ;
ALTER TABLE `donor_translations` ADD INDEX ( locale ) ;
ALTER TABLE `location_translations` ADD INDEX ( locale ) ;
ALTER TABLE `location_translations` ADD INDEX ( location_id ) ;
ALTER TABLE `organization_translations` ADD INDEX ( locale ) ;
ALTER TABLE `organization_translations` ADD INDEX ( organization_id ) ;
ALTER TABLE `profession_translations` ADD INDEX ( locale ) ;
ALTER TABLE `profession_translations` ADD INDEX ( profession_id ) ;
ALTER TABLE `project_milestone_translations` ADD INDEX ( locale ) ;
ALTER TABLE `project_milestone_translations` ADD INDEX ( project_milestone_id ) ;
ALTER TABLE `project_translations` ADD INDEX ( locale ) ;
ALTER TABLE `project_translations` ADD INDEX ( project_id ) ;
ALTER TABLE `public_activities` ADD INDEX ( owner_id, owner_type ) ;
ALTER TABLE `public_activities` ADD INDEX ( recipient_id, recipient_type ) ;
ALTER TABLE `public_activities` ADD INDEX ( trackable_id, trackable_type ) ;
ALTER TABLE `role_translations` ADD INDEX ( locale ) ;
ALTER TABLE `role_translations` ADD INDEX ( role_id ) ;
ALTER TABLE `state_translations` ADD INDEX ( locale ) ;
ALTER TABLE `state_translations` ADD INDEX ( state_id ) ;
ALTER TABLE `user_translations` ADD INDEX ( locale ) ;
ALTER TABLE `user_translations` ADD INDEX ( user_id ) ;
