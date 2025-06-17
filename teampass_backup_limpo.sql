-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: teampass
-- ------------------------------------------------------
-- Server version	11.5.2-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `teampass_api`
--

DROP TABLE IF EXISTS `teampass_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_api` (
  `increment_id` int(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `timestamp` varchar(50) NOT NULL,
  `user_id` int(13) DEFAULT NULL,
  `allowed_folders` text DEFAULT NULL,
  `enabled` int(1) NOT NULL DEFAULT 0,
  `allowed_to_create` int(1) NOT NULL DEFAULT 0,
  `allowed_to_read` int(1) NOT NULL DEFAULT 1,
  `allowed_to_update` int(1) NOT NULL DEFAULT 0,
  `allowed_to_delete` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`increment_id`),
  KEY `USER` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_api`
--

LOCK TABLES `teampass_api` WRITE;
/*!40000 ALTER TABLE `teampass_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_automatic_del`
--

DROP TABLE IF EXISTS `teampass_automatic_del`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_automatic_del` (
  `item_id` int(11) NOT NULL,
  `del_enabled` tinyint(1) NOT NULL,
  `del_type` tinyint(1) NOT NULL,
  `del_value` varchar(35) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_automatic_del`
--

LOCK TABLES `teampass_automatic_del` WRITE;
/*!40000 ALTER TABLE `teampass_automatic_del` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_automatic_del` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_background_subtasks`
--

DROP TABLE IF EXISTS `teampass_background_subtasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_background_subtasks` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `task_id` int(12) NOT NULL,
  `created_at` varchar(50) NOT NULL,
  `updated_at` varchar(50) DEFAULT NULL,
  `finished_at` varchar(50) DEFAULT NULL,
  `task` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`task`)),
  `process_id` varchar(100) DEFAULT NULL,
  `is_in_progress` tinyint(1) NOT NULL DEFAULT 0,
  `sub_task_in_progress` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`increment_id`),
  KEY `task_id_idx` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_background_subtasks`
--

LOCK TABLES `teampass_background_subtasks` WRITE;
/*!40000 ALTER TABLE `teampass_background_subtasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_background_subtasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_background_tasks`
--

DROP TABLE IF EXISTS `teampass_background_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_background_tasks` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `created_at` varchar(50) NOT NULL,
  `started_at` varchar(50) DEFAULT NULL,
  `updated_at` varchar(50) DEFAULT NULL,
  `finished_at` varchar(50) DEFAULT NULL,
  `process_id` int(12) DEFAULT NULL,
  `process_type` varchar(100) NOT NULL,
  `output` text DEFAULT NULL,
  `arguments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`arguments`)),
  `is_in_progress` tinyint(1) NOT NULL DEFAULT 0,
  `item_id` int(12) DEFAULT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_background_tasks`
--

LOCK TABLES `teampass_background_tasks` WRITE;
/*!40000 ALTER TABLE `teampass_background_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_background_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_background_tasks_logs`
--

DROP TABLE IF EXISTS `teampass_background_tasks_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_background_tasks_logs` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `created_at` int(11) NOT NULL,
  `job` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `finished_at` int(11) DEFAULT NULL,
  `treated_objects` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`increment_id`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_background_tasks_logs`
--

LOCK TABLES `teampass_background_tasks_logs` WRITE;
/*!40000 ALTER TABLE `teampass_background_tasks_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_background_tasks_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_cache`
--

DROP TABLE IF EXISTS `teampass_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_cache` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `id` int(12) NOT NULL,
  `label` varchar(500) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `id_tree` int(12) NOT NULL,
  `perso` tinyint(1) NOT NULL,
  `restricted_to` varchar(200) DEFAULT NULL,
  `login` text DEFAULT NULL,
  `folder` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `renewal_period` tinyint(4) NOT NULL DEFAULT 0,
  `timestamp` varchar(50) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `encryption_type` varchar(50) DEFAULT '0',
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_cache`
--

LOCK TABLES `teampass_cache` WRITE;
/*!40000 ALTER TABLE `teampass_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_cache_tree`
--

DROP TABLE IF EXISTS `teampass_cache_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_cache_tree` (
  `increment_id` smallint(32) NOT NULL AUTO_INCREMENT,
  `data` longtext DEFAULT NULL CHECK (json_valid(`data`)),
  `visible_folders` longtext NOT NULL,
  `timestamp` varchar(50) NOT NULL,
  `user_id` int(12) NOT NULL,
  `folders` longtext DEFAULT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_cache_tree`
--

LOCK TABLES `teampass_cache_tree` WRITE;
/*!40000 ALTER TABLE `teampass_cache_tree` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_cache_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_categories`
--

DROP TABLE IF EXISTS `teampass_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_categories` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `parent_id` int(12) NOT NULL,
  `title` varchar(255) NOT NULL,
  `level` int(2) NOT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(50) DEFAULT '',
  `masked` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(12) NOT NULL DEFAULT 0,
  `encrypted_data` tinyint(1) NOT NULL DEFAULT 1,
  `role_visibility` varchar(255) NOT NULL DEFAULT 'all',
  `is_mandatory` tinyint(1) NOT NULL DEFAULT 0,
  `regex` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_categories`
--

LOCK TABLES `teampass_categories` WRITE;
/*!40000 ALTER TABLE `teampass_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_categories_folders`
--

DROP TABLE IF EXISTS `teampass_categories_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_categories_folders` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `id_category` int(12) NOT NULL,
  `id_folder` int(12) NOT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_categories_folders`
--

LOCK TABLES `teampass_categories_folders` WRITE;
/*!40000 ALTER TABLE `teampass_categories_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_categories_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_categories_items`
--

DROP TABLE IF EXISTS `teampass_categories_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_categories_items` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `data` text NOT NULL,
  `data_iv` text NOT NULL,
  `encryption_type` varchar(20) NOT NULL DEFAULT 'not_set',
  `is_mandatory` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_categories_items`
--

LOCK TABLES `teampass_categories_items` WRITE;
/*!40000 ALTER TABLE `teampass_categories_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_categories_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_defuse_passwords`
--

DROP TABLE IF EXISTS `teampass_defuse_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_defuse_passwords` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `object_id` int(12) NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_defuse_passwords`
--

LOCK TABLES `teampass_defuse_passwords` WRITE;
/*!40000 ALTER TABLE `teampass_defuse_passwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_defuse_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_emails`
--

DROP TABLE IF EXISTS `teampass_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_emails` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `timestamp` int(30) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `receivers` text NOT NULL,
  `status` varchar(30) NOT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_emails`
--

LOCK TABLES `teampass_emails` WRITE;
/*!40000 ALTER TABLE `teampass_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_export`
--

DROP TABLE IF EXISTS `teampass_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_export` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `export_tag` varchar(20) NOT NULL,
  `item_id` int(12) NOT NULL,
  `label` varchar(500) NOT NULL,
  `login` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `pw` text NOT NULL,
  `path` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL DEFAULT 'none',
  `url` varchar(500) NOT NULL DEFAULT 'none',
  `kbs` varchar(500) NOT NULL DEFAULT 'none',
  `tags` varchar(500) NOT NULL DEFAULT 'none',
  `folder_id` varchar(10) NOT NULL,
  `perso` tinyint(1) NOT NULL DEFAULT 0,
  `restricted_to` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_export`
--

LOCK TABLES `teampass_export` WRITE;
/*!40000 ALTER TABLE `teampass_export` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_files`
--

DROP TABLE IF EXISTS `teampass_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item` int(11) NOT NULL,
  `name` text NOT NULL,
  `size` int(10) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `type` varchar(255) NOT NULL,
  `file` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT '0',
  `content` longblob DEFAULT NULL,
  `confirmed` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_files`
--

LOCK TABLES `teampass_files` WRITE;
/*!40000 ALTER TABLE `teampass_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_items`
--

DROP TABLE IF EXISTS `teampass_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_items` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `label` varchar(500) NOT NULL,
  `description` text DEFAULT NULL,
  `pw` text DEFAULT NULL,
  `pw_iv` text DEFAULT NULL,
  `pw_len` int(5) NOT NULL DEFAULT 0,
  `url` text DEFAULT NULL,
  `id_tree` varchar(10) DEFAULT NULL,
  `perso` tinyint(1) NOT NULL DEFAULT 0,
  `login` varchar(200) DEFAULT NULL,
  `inactif` tinyint(1) NOT NULL DEFAULT 0,
  `restricted_to` varchar(200) DEFAULT NULL,
  `anyone_can_modify` tinyint(1) NOT NULL DEFAULT 0,
  `email` varchar(100) DEFAULT NULL,
  `notification` varchar(250) DEFAULT NULL,
  `viewed_no` int(12) NOT NULL DEFAULT 0,
  `complexity_level` varchar(3) NOT NULL DEFAULT '-1',
  `auto_update_pwd_frequency` tinyint(2) NOT NULL DEFAULT 0,
  `auto_update_pwd_next_date` varchar(100) NOT NULL DEFAULT '0',
  `encryption_type` varchar(20) NOT NULL DEFAULT 'not_set',
  `fa_icon` varchar(100) DEFAULT NULL,
  `item_key` varchar(500) NOT NULL DEFAULT '-1',
  `created_at` varchar(30) DEFAULT NULL,
  `updated_at` varchar(30) DEFAULT NULL,
  `deleted_at` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `restricted_inactif_idx` (`restricted_to`,`inactif`),
  KEY `items_perso_id_idx` (`perso`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_items`
--

LOCK TABLES `teampass_items` WRITE;
/*!40000 ALTER TABLE `teampass_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_items_change`
--

DROP TABLE IF EXISTS `teampass_items_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_items_change` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `item_id` int(12) NOT NULL,
  `label` varchar(255) NOT NULL DEFAULT 'none',
  `pw` text NOT NULL,
  `login` varchar(255) NOT NULL DEFAULT 'none',
  `email` varchar(255) NOT NULL DEFAULT 'none',
  `url` varchar(255) NOT NULL DEFAULT 'none',
  `description` text NOT NULL,
  `comment` text NOT NULL,
  `folder_id` tinyint(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `timestamp` varchar(50) NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_items_change`
--

LOCK TABLES `teampass_items_change` WRITE;
/*!40000 ALTER TABLE `teampass_items_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_items_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_items_edition`
--

DROP TABLE IF EXISTS `teampass_items_edition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_items_edition` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `user_id` int(12) NOT NULL,
  `timestamp` varchar(50) NOT NULL,
  PRIMARY KEY (`increment_id`),
  KEY `item_id_idx` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_items_edition`
--

LOCK TABLES `teampass_items_edition` WRITE;
/*!40000 ALTER TABLE `teampass_items_edition` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_items_edition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_items_otp`
--

DROP TABLE IF EXISTS `teampass_items_otp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_items_otp` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `item_id` int(12) NOT NULL,
  `secret` text NOT NULL,
  `timestamp` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `phone_number` varchar(25) NOT NULL,
  PRIMARY KEY (`increment_id`),
  KEY `ITEM` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_items_otp`
--

LOCK TABLES `teampass_items_otp` WRITE;
/*!40000 ALTER TABLE `teampass_items_otp` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_items_otp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_kb`
--

DROP TABLE IF EXISTS `teampass_kb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_kb` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `category_id` int(12) NOT NULL,
  `label` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `author_id` int(12) NOT NULL,
  `anyone_can_modify` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_kb`
--

LOCK TABLES `teampass_kb` WRITE;
/*!40000 ALTER TABLE `teampass_kb` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_kb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_kb_categories`
--

DROP TABLE IF EXISTS `teampass_kb_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_kb_categories` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_kb_categories`
--

LOCK TABLES `teampass_kb_categories` WRITE;
/*!40000 ALTER TABLE `teampass_kb_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_kb_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_kb_items`
--

DROP TABLE IF EXISTS `teampass_kb_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_kb_items` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `kb_id` int(12) NOT NULL,
  `item_id` int(12) NOT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_kb_items`
--

LOCK TABLES `teampass_kb_items` WRITE;
/*!40000 ALTER TABLE `teampass_kb_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_kb_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_languages`
--

DROP TABLE IF EXISTS `teampass_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_languages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `flag` varchar(50) NOT NULL,
  `code_poeditor` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_languages`
--

LOCK TABLES `teampass_languages` WRITE;
/*!40000 ALTER TABLE `teampass_languages` DISABLE KEYS */;
INSERT INTO `teampass_languages` VALUES (1,'french','French','fr','fr.png','fr'),(2,'english','English','us','us.png','en'),(3,'spanish','Spanish','es','es.png','es'),(4,'german','German','de','de.png','de'),(5,'czech','Czech','cs','cz.png','cs'),(6,'italian','Italian','it','it.png','it'),(7,'russian','Russian','ru','ru.png','ru'),(8,'turkish','Turkish','tr','tr.png','tr'),(9,'norwegian','Norwegian','no','no.png','no'),(10,'japanese','Japanese','ja','ja.png','ja'),(11,'portuguese','Portuguese','pr','pr.png','pt'),(12,'portuguese_br','Portuguese (Brazil)','pr-bt','pr-bt.png','pt-br'),(13,'chinese','Chinese','zh-Hans','cn.png','zh-Hans'),(14,'swedish','Swedish','se','se.png','sv'),(15,'dutch','Dutch','nl','nl.png','nl'),(16,'catalan','Catalan','ca','ct.png','ca'),(17,'bulgarian','Bulgarian','bg','bg.png','bg'),(18,'greek','Greek','gr','gr.png','el'),(19,'hungarian','Hungarian','hu','hu.png','hu'),(20,'polish','Polish','pl','pl.png','pl'),(21,'romanian','Romanian','ro','ro.png','ro'),(22,'ukrainian','Ukrainian','ua','ua.png','uk'),(23,'vietnamese','Vietnamese','vi','vi.png','vi'),(24,'estonian','Estonian','et','ee.png','et');
/*!40000 ALTER TABLE `teampass_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_ldap_groups_roles`
--

DROP TABLE IF EXISTS `teampass_ldap_groups_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_ldap_groups_roles` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `role_id` int(12) NOT NULL,
  `ldap_group_id` varchar(500) NOT NULL,
  `ldap_group_label` varchar(255) NOT NULL,
  PRIMARY KEY (`increment_id`),
  KEY `ROLE` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_ldap_groups_roles`
--

LOCK TABLES `teampass_ldap_groups_roles` WRITE;
/*!40000 ALTER TABLE `teampass_ldap_groups_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_ldap_groups_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_log_items`
--

DROP TABLE IF EXISTS `teampass_log_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_log_items` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `id_item` int(8) NOT NULL,
  `date` varchar(50) NOT NULL,
  `id_user` int(8) NOT NULL,
  `action` varchar(250) DEFAULT NULL,
  `raison` text DEFAULT NULL,
  `old_value` mediumtext DEFAULT NULL,
  `encryption_type` varchar(20) NOT NULL DEFAULT 'not_set',
  PRIMARY KEY (`increment_id`),
  KEY `log_items_item_action_user_idx` (`id_item`,`action`,`id_user`),
  KEY `teampass_log_items_id_item_IDX` (`id_item`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_log_items`
--

LOCK TABLES `teampass_log_items` WRITE;
/*!40000 ALTER TABLE `teampass_log_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_log_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_log_system`
--

DROP TABLE IF EXISTS `teampass_log_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_log_system` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `date` varchar(30) NOT NULL,
  `label` text NOT NULL,
  `qui` varchar(255) NOT NULL,
  `field_1` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_log_system`
--

LOCK TABLES `teampass_log_system` WRITE;
/*!40000 ALTER TABLE `teampass_log_system` DISABLE KEYS */;
INSERT INTO `teampass_log_system` VALUES (1,'user_connection','1730256348','connection','1',''),(2,'user_connection','1730396617','connection','1',''),(3,'user_connection','1730400918','connection','1',''),(4,'user_connection','1730405510','connection','1',''),(5,'user_connection','1730407444','connection','1',''),(6,'user_connection','1730408348','connection','1',''),(7,'user_connection','1730429145','connection','1',''),(8,'user_connection','1730429257','connection','1',''),(9,'user_connection','1730429988','connection','1','');
/*!40000 ALTER TABLE `teampass_log_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_misc`
--

DROP TABLE IF EXISTS `teampass_misc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_misc` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `intitule` varchar(100) NOT NULL,
  `valeur` varchar(500) NOT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `is_encrypted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_misc`
--

LOCK TABLES `teampass_misc` WRITE;
/*!40000 ALTER TABLE `teampass_misc` DISABLE KEYS */;
INSERT INTO `teampass_misc` VALUES (1,'admin','max_latest_items','10','max_latest_items',NULL,0),(2,'admin','enable_favourites','1','enable_favourites',NULL,0),(3,'admin','show_last_items','1','show_last_items',NULL,0),(4,'admin','enable_pf_feature','0','enable_pf_feature',NULL,0),(5,'admin','log_connections','1','log_connections',NULL,0),(6,'admin','log_accessed','1','log_accessed',NULL,0),(7,'admin','time_format','H:i:s','time_format',NULL,0),(8,'admin','date_format','d/m/Y','date_format',NULL,0),(9,'admin','duplicate_folder','0','duplicate_folder',NULL,0),(10,'admin','item_duplicate_in_same_folder','0','item_duplicate_in_same_folder',NULL,0),(11,'admin','duplicate_item','0','duplicate_item',NULL,0),(12,'admin','number_of_used_pw','3','number_of_used_pw',NULL,0),(13,'admin','manager_edit','1','manager_edit',NULL,0),(14,'admin','cpassman_dir','/var/www/html','cpassman_dir',NULL,0),(15,'admin','cpassman_url','https://10.1.1.177','cpassman_url',NULL,0),(16,'admin','favicon','https://10.1.1.177/favicon.ico','favicon',NULL,0),(17,'admin','path_to_upload_folder','/var/www/html/upload','path_to_upload_folder',NULL,0),(18,'admin','path_to_files_folder','/var/www/html/files','path_to_files_folder',NULL,0),(19,'admin','url_to_files_folder','https://10.1.1.177/files','url_to_files_folder',NULL,0),(20,'admin','activate_expiration','0','activate_expiration',NULL,0),(21,'admin','pw_life_duration','0','pw_life_duration',NULL,0),(22,'admin','maintenance_mode','1','maintenance_mode',NULL,0),(23,'admin','enable_sts','0','enable_sts',NULL,0),(24,'admin','encryptClientServer','1','encryptClientServer',NULL,0),(25,'admin','teampass_version','3.1.2','teampass_version',NULL,0),(26,'admin','ldap_mode','0','ldap_mode',NULL,0),(27,'admin','ldap_type','0','ldap_type',NULL,0),(28,'admin','ldap_user_attribute','0','ldap_user_attribute',NULL,0),(29,'admin','ldap_ssl','0','ldap_ssl',NULL,0),(30,'admin','ldap_tls','0','ldap_tls',NULL,0),(31,'admin','ldap_port','389','ldap_port',NULL,0),(32,'admin','richtext','0','richtext',NULL,0),(33,'admin','allow_print','0','allow_print',NULL,0),(34,'admin','roles_allowed_to_print','0','roles_allowed_to_print',NULL,0),(35,'admin','show_description','1','show_description',NULL,0),(36,'admin','anyone_can_modify','0','anyone_can_modify',NULL,0),(37,'admin','anyone_can_modify_bydefault','0','anyone_can_modify_bydefault',NULL,0),(38,'admin','nb_bad_authentication','0','nb_bad_authentication',NULL,0),(39,'admin','utf8_enabled','1','utf8_enabled',NULL,0),(40,'admin','restricted_to','0','restricted_to',NULL,0),(41,'admin','restricted_to_roles','0','restricted_to_roles',NULL,0),(42,'admin','enable_send_email_on_user_login','0','enable_send_email_on_user_login',NULL,0),(43,'admin','enable_user_can_create_folders','0','enable_user_can_create_folders',NULL,0),(44,'admin','insert_manual_entry_item_history','0','insert_manual_entry_item_history',NULL,0),(45,'admin','enable_kb','0','enable_kb',NULL,0),(46,'admin','enable_email_notification_on_item_shown','0','enable_email_notification_on_item_shown',NULL,0),(47,'admin','enable_email_notification_on_user_pw_change','0','enable_email_notification_on_user_pw_change',NULL,0),(48,'admin','custom_logo','','custom_logo',NULL,0),(49,'admin','custom_login_text','','custom_login_text',NULL,0),(50,'admin','default_language','english','default_language',NULL,0),(51,'admin','send_stats','0','send_stats',NULL,0),(52,'admin','send_statistics_items','stat_country;stat_users;stat_items;stat_items_shared;stat_folders;stat_folders_shared;stat_admins;stat_managers;stat_ro;stat_mysqlversion;stat_phpversion;stat_teampassversion;stat_languages;stat_kb;stat_suggestion;stat_customfields;stat_api;stat_2fa;stat_agses;stat_duo;stat_ldap;stat_syslog;stat_stricthttps;stat_fav;stat_pf;','send_statistics_items',NULL,0),(53,'admin','send_stats_time','1727664066','send_stats_time',NULL,0),(54,'admin','get_tp_info','1','get_tp_info',NULL,0),(55,'admin','send_mail_on_user_login','0','send_mail_on_user_login',NULL,0),(56,'cron','sending_emails','0','sending_emails',NULL,0),(57,'admin','nb_items_by_query','auto','nb_items_by_query',NULL,0),(58,'admin','enable_delete_after_consultation','0','enable_delete_after_consultation',NULL,0),(59,'admin','enable_personal_saltkey_cookie','0','enable_personal_saltkey_cookie',NULL,0),(60,'admin','personal_saltkey_cookie_duration','31','personal_saltkey_cookie_duration',NULL,0),(61,'admin','email_smtp_server','','email_smtp_server',NULL,0),(62,'admin','email_smtp_auth','','email_smtp_auth',NULL,0),(63,'admin','email_auth_username','','email_auth_username',NULL,1),(64,'admin','email_auth_pwd','','email_auth_pwd',NULL,1),(65,'admin','email_port','','email_port',NULL,0),(66,'admin','email_security','','email_security',NULL,0),(67,'admin','email_server_url','','email_server_url',NULL,0),(68,'admin','email_from','','email_from',NULL,0),(69,'admin','email_from_name','','email_from_name',NULL,0),(70,'admin','pwd_maximum_length','40','pwd_maximum_length',NULL,0),(71,'admin','google_authentication','0','google_authentication',NULL,0),(72,'admin','delay_item_edition','0','delay_item_edition',NULL,0),(73,'admin','allow_import','0','allow_import',NULL,0),(74,'admin','proxy_ip','','proxy_ip',NULL,0),(75,'admin','proxy_port','','proxy_port',NULL,0),(76,'admin','upload_maxfilesize','10mb','upload_maxfilesize',NULL,0),(77,'admin','upload_docext','doc,docx,dotx,xls,xlsx,xltx,rtf,csv,txt,pdf,ppt,pptx,pot,dotx,xltx','upload_docext',NULL,0),(78,'admin','upload_imagesext','jpg,jpeg,gif,png','upload_imagesext',NULL,0),(79,'admin','upload_pkgext','7z,rar,tar,zip','upload_pkgext',NULL,0),(80,'admin','upload_otherext','sql,xml','upload_otherext',NULL,0),(81,'admin','upload_imageresize_options','1','upload_imageresize_options',NULL,0),(82,'admin','upload_imageresize_width','800','upload_imageresize_width',NULL,0),(83,'admin','upload_imageresize_height','600','upload_imageresize_height',NULL,0),(84,'admin','upload_imageresize_quality','90','upload_imageresize_quality',NULL,0),(85,'admin','use_md5_password_as_salt','0','use_md5_password_as_salt',NULL,0),(86,'admin','ga_website_name','TeamPass for ChangeMe','ga_website_name',NULL,0),(87,'admin','api','0','api',NULL,0),(88,'admin','subfolder_rights_as_parent','0','subfolder_rights_as_parent',NULL,0),(89,'admin','show_only_accessible_folders','0','show_only_accessible_folders',NULL,0),(90,'admin','enable_suggestion','0','enable_suggestion',NULL,0),(91,'admin','otv_expiration_period','7','otv_expiration_period',NULL,0),(92,'admin','default_session_expiration_time','60','default_session_expiration_time',NULL,0),(93,'admin','duo','0','duo',NULL,0),(94,'admin','enable_server_password_change','0','enable_server_password_change',NULL,0),(95,'admin','bck_script_path','/var/www/html/backups','bck_script_path',NULL,0),(96,'admin','bck_script_filename','bck_teampass','bck_script_filename',NULL,1),(97,'admin','syslog_enable','0','syslog_enable',NULL,0),(98,'admin','syslog_host','localhost','syslog_host',NULL,0),(99,'admin','syslog_port','514','syslog_port',NULL,0),(100,'admin','manager_move_item','0','manager_move_item',NULL,0),(101,'admin','create_item_without_password','0','create_item_without_password',NULL,0),(102,'admin','otv_is_enabled','0','otv_is_enabled',NULL,0),(103,'admin','agses_authentication_enabled','0','agses_authentication_enabled',NULL,0),(104,'admin','item_extra_fields','0','item_extra_fields',NULL,0),(105,'admin','saltkey_ante_2127','none','saltkey_ante_2127',NULL,0),(106,'admin','migration_to_2127','done','migration_to_2127',NULL,0),(107,'admin','files_with_defuse','done','files_with_defuse',NULL,0),(108,'admin','timezone','UTC','timezone',NULL,0),(109,'admin','enable_attachment_encryption','1','enable_attachment_encryption',NULL,0),(110,'admin','personal_saltkey_security_level','50','personal_saltkey_security_level',NULL,0),(111,'admin','ldap_new_user_is_administrated_by','0','ldap_new_user_is_administrated_by','1730429729',0),(112,'admin','disable_show_forgot_pwd_link','0','disable_show_forgot_pwd_link',NULL,0),(113,'admin','offline_key_level','0','offline_key_level',NULL,0),(114,'admin','enable_http_request_login','0','enable_http_request_login',NULL,0),(115,'admin','ldap_and_local_authentication','0','ldap_and_local_authentication',NULL,0),(116,'admin','secure_display_image','1','secure_display_image',NULL,0),(117,'admin','upload_zero_byte_file','0','upload_zero_byte_file',NULL,0),(118,'admin','upload_all_extensions_file','0','upload_all_extensions_file',NULL,0),(119,'admin','bck_script_passkey','','bck_script_passkey',NULL,1),(120,'admin','admin_2fa_required','1','admin_2fa_required',NULL,0),(121,'admin','password_overview_delay','4','password_overview_delay',NULL,0),(122,'admin','copy_to_clipboard_small_icons','1','copy_to_clipboard_small_icons',NULL,0),(123,'admin','duo_ikey','','duo_ikey',NULL,1),(124,'admin','duo_skey','','duo_skey',NULL,1),(125,'admin','duo_host','','duo_host',NULL,1),(126,'admin','duo_failmode','secure','duo_failmode',NULL,0),(127,'admin','roles_allowed_to_print_select','','roles_allowed_to_print_select',NULL,0),(128,'admin','clipboard_life_duration','30','clipboard_life_duration',NULL,0),(129,'admin','mfa_for_roles','','mfa_for_roles',NULL,0),(130,'admin','tree_counters','0','tree_counters',NULL,0),(131,'admin','settings_offline_mode','0','settings_offline_mode',NULL,0),(132,'admin','settings_tree_counters','0','settings_tree_counters',NULL,0),(133,'admin','enable_massive_move_delete','0','enable_massive_move_delete',NULL,0),(134,'admin','email_debug_level','0','email_debug_level',NULL,0),(135,'admin','ga_reset_by_user','','ga_reset_by_user',NULL,0),(136,'admin','onthefly-backup-key','','onthefly-backup-key',NULL,0),(137,'admin','onthefly-restore-key','','onthefly-restore-key',NULL,0),(138,'admin','ldap_user_dn_attribute','','ldap_user_dn_attribute',NULL,0),(139,'admin','ldap_dn_additional_user_dn','','ldap_dn_additional_user_dn',NULL,0),(140,'admin','ldap_user_object_filter','','ldap_user_object_filter',NULL,0),(141,'admin','ldap_bdn','','ldap_bdn',NULL,1),(142,'admin','ldap_hosts','','ldap_hosts',NULL,1),(143,'admin','ldap_password','','ldap_password',NULL,1),(144,'admin','ldap_username','','ldap_username',NULL,0),(145,'admin','api_token_duration','60','api_token_duration',NULL,0),(146,'timestamp','last_folder_change','','last_folder_change',NULL,0),(147,'admin','enable_tasks_manager','1','enable_tasks_manager',NULL,0),(148,'admin','task_maximum_run_time','300','task_maximum_run_time',NULL,0),(149,'admin','tasks_manager_refreshing_period','20','tasks_manager_refreshing_period',NULL,0),(150,'admin','maximum_number_of_items_to_treat','100','maximum_number_of_items_to_treat',NULL,0),(151,'admin','number_users_build_cache_tree','10','number_users_build_cache_tree',NULL,0),(152,'admin','ldap_tls_certifacte_check','LDAP_OPT_X_TLS_NEVER','ldap_tls_certifacte_check',NULL,0),(153,'admin','enable_tasks_log','0','enable_tasks_log',NULL,0),(154,'admin','upgrade_timestamp','1730256066','upgrade_timestamp',NULL,0),(155,'admin','enable_ad_users_with_ad_groups','0','enable_ad_users_with_ad_groups',NULL,0),(156,'admin','enable_ad_user_auto_creation','0','enable_ad_user_auto_creation',NULL,0),(157,'admin','ldap_guid_attibute','objectguid','ldap_guid_attibute',NULL,0),(158,'admin','sending_emails_job_frequency','2','sending_emails_job_frequency',NULL,0),(159,'admin','user_keys_job_frequency','1','user_keys_job_frequency',NULL,0),(160,'admin','items_statistics_job_frequency','5','items_statistics_job_frequency',NULL,0),(161,'admin','users_personal_folder_task','','users_personal_folder_task',NULL,0),(162,'admin','clean_orphan_objects_task','','clean_orphan_objects_task',NULL,0),(163,'admin','purge_temporary_files_task','','purge_temporary_files_task',NULL,0),(164,'admin','rebuild_config_file','','rebuild_config_file',NULL,0),(165,'admin','reload_cache_table_task','','reload_cache_table_task',NULL,0),(166,'admin','maximum_session_expiration_time','60','maximum_session_expiration_time',NULL,0),(167,'admin','items_ops_job_frequency','1','items_ops_job_frequency',NULL,0),(168,'admin','enable_refresh_task_last_execution','1','enable_refresh_task_last_execution',NULL,0),(169,'admin','ldap_group_objectclasses_attibute','top,groupofuniquenames','ldap_group_objectclasses_attibute',NULL,0),(170,'admin','pwd_default_length','14','pwd_default_length',NULL,0),(171,'admin','tasks_log_retention_delay','30','tasks_log_retention_delay',NULL,0),(172,'admin','oauth2_enabled','0','oauth2_enabled',NULL,0),(173,'admin','oauth2_client_id','','oauth2_client_id',NULL,1),(174,'admin','oauth2_client_secret','','oauth2_client_secret',NULL,1),(175,'admin','oauth2_client_endpoint','','oauth2_client_endpoint',NULL,0),(176,'admin','oauth2_client_urlResourceOwnerDetails','','oauth2_client_urlResourceOwnerDetails',NULL,0),(177,'admin','oauth2_client_token','','oauth2_client_token',NULL,1),(178,'admin','oauth2_client_scopes','openid,profile,email,User.Read,Group.Read.All','oauth2_client_scopes',NULL,0),(179,'admin','oauth2_client_appname','Login with Azure','oauth2_client_appname',NULL,0),(180,'admin','show_item_data','0','show_item_data',NULL,0),(181,'admin','oauth2_tenant_id','','oauth2_tenant_id',NULL,1),(182,'admin','limited_search_default','0','limited_search_default',NULL,0),(183,'admin','highlight_selected','0','highlight_selected',NULL,0),(184,'admin','highlight_favorites','0','highlight_favorites',NULL,0);
/*!40000 ALTER TABLE `teampass_misc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_nested_tree`
--

DROP TABLE IF EXISTS `teampass_nested_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_nested_tree` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `nleft` int(11) NOT NULL DEFAULT 0,
  `nright` int(11) NOT NULL DEFAULT 0,
  `nlevel` int(11) NOT NULL DEFAULT 0,
  `bloquer_creation` tinyint(1) NOT NULL DEFAULT 0,
  `bloquer_modification` tinyint(1) NOT NULL DEFAULT 0,
  `personal_folder` tinyint(1) NOT NULL DEFAULT 0,
  `renewal_period` int(5) NOT NULL DEFAULT 0,
  `fa_icon` varchar(100) NOT NULL DEFAULT 'fas fa-folder',
  `fa_icon_selected` varchar(100) NOT NULL DEFAULT 'fas fa-folder-open',
  `categories` longtext NOT NULL,
  `nb_items_in_folder` int(10) NOT NULL DEFAULT 0,
  `nb_subfolders` int(10) NOT NULL DEFAULT 0,
  `nb_items_in_subfolders` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `nested_tree_parent_id` (`parent_id`),
  KEY `nested_tree_nleft` (`nleft`),
  KEY `nested_tree_nright` (`nright`),
  KEY `nested_tree_nlevel` (`nlevel`),
  KEY `personal_folder_idx` (`personal_folder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_nested_tree`
--

LOCK TABLES `teampass_nested_tree` WRITE;
/*!40000 ALTER TABLE `teampass_nested_tree` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_nested_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_notification`
--

DROP TABLE IF EXISTS `teampass_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_notification` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `item_id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_notification`
--

LOCK TABLES `teampass_notification` WRITE;
/*!40000 ALTER TABLE `teampass_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_otv`
--

DROP TABLE IF EXISTS `teampass_otv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_otv` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `timestamp` text NOT NULL,
  `code` varchar(100) NOT NULL,
  `item_id` int(12) NOT NULL,
  `originator` int(12) NOT NULL,
  `encrypted` text NOT NULL,
  `views` int(10) NOT NULL DEFAULT 0,
  `max_views` int(10) DEFAULT NULL,
  `time_limit` varchar(100) DEFAULT NULL,
  `shared_globaly` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_otv`
--

LOCK TABLES `teampass_otv` WRITE;
/*!40000 ALTER TABLE `teampass_otv` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_otv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_restriction_to_roles`
--

DROP TABLE IF EXISTS `teampass_restriction_to_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_restriction_to_roles` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `role_id` int(12) NOT NULL,
  `item_id` int(12) NOT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_restriction_to_roles`
--

LOCK TABLES `teampass_restriction_to_roles` WRITE;
/*!40000 ALTER TABLE `teampass_restriction_to_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_restriction_to_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_rights`
--

DROP TABLE IF EXISTS `teampass_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_rights` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `tree_id` int(12) NOT NULL,
  `fonction_id` int(12) NOT NULL,
  `authorized` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_rights`
--

LOCK TABLES `teampass_rights` WRITE;
/*!40000 ALTER TABLE `teampass_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_roles_title`
--

DROP TABLE IF EXISTS `teampass_roles_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_roles_title` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `allow_pw_change` tinyint(1) NOT NULL DEFAULT 0,
  `complexity` int(5) NOT NULL DEFAULT 0,
  `creator_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_roles_title`
--

LOCK TABLES `teampass_roles_title` WRITE;
/*!40000 ALTER TABLE `teampass_roles_title` DISABLE KEYS */;
INSERT INTO `teampass_roles_title` VALUES (1,'Default',0,48,0),(2,'Default',0,48,0);
/*!40000 ALTER TABLE `teampass_roles_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_roles_values`
--

DROP TABLE IF EXISTS `teampass_roles_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_roles_values` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `role_id` int(12) NOT NULL,
  `folder_id` int(12) NOT NULL,
  `type` varchar(5) NOT NULL DEFAULT 'R',
  PRIMARY KEY (`increment_id`),
  KEY `role_id_idx` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_roles_values`
--

LOCK TABLES `teampass_roles_values` WRITE;
/*!40000 ALTER TABLE `teampass_roles_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_roles_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_sharekeys_fields`
--

DROP TABLE IF EXISTS `teampass_sharekeys_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_sharekeys_fields` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `object_id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `share_key` text NOT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_sharekeys_fields`
--

LOCK TABLES `teampass_sharekeys_fields` WRITE;
/*!40000 ALTER TABLE `teampass_sharekeys_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_sharekeys_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_sharekeys_files`
--

DROP TABLE IF EXISTS `teampass_sharekeys_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_sharekeys_files` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `object_id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `share_key` text NOT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_sharekeys_files`
--

LOCK TABLES `teampass_sharekeys_files` WRITE;
/*!40000 ALTER TABLE `teampass_sharekeys_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_sharekeys_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_sharekeys_items`
--

DROP TABLE IF EXISTS `teampass_sharekeys_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_sharekeys_items` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `object_id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `share_key` text NOT NULL,
  PRIMARY KEY (`increment_id`),
  KEY `idx_object_user` (`object_id`,`user_id`),
  KEY `object_id_idx` (`object_id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_sharekeys_items`
--

LOCK TABLES `teampass_sharekeys_items` WRITE;
/*!40000 ALTER TABLE `teampass_sharekeys_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_sharekeys_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_sharekeys_logs`
--

DROP TABLE IF EXISTS `teampass_sharekeys_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_sharekeys_logs` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `object_id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `share_key` text NOT NULL,
  PRIMARY KEY (`increment_id`),
  KEY `object_id_idx` (`object_id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_sharekeys_logs`
--

LOCK TABLES `teampass_sharekeys_logs` WRITE;
/*!40000 ALTER TABLE `teampass_sharekeys_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_sharekeys_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_sharekeys_suggestions`
--

DROP TABLE IF EXISTS `teampass_sharekeys_suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_sharekeys_suggestions` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `object_id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `share_key` text NOT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_sharekeys_suggestions`
--

LOCK TABLES `teampass_sharekeys_suggestions` WRITE;
/*!40000 ALTER TABLE `teampass_sharekeys_suggestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_sharekeys_suggestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_suggestion`
--

DROP TABLE IF EXISTS `teampass_suggestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_suggestion` (
  `id` tinyint(12) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `pw` text NOT NULL,
  `pw_iv` text NOT NULL,
  `pw_len` int(5) NOT NULL,
  `description` text NOT NULL,
  `author_id` int(12) NOT NULL,
  `folder_id` int(12) NOT NULL,
  `comment` text NOT NULL,
  `suggestion_type` varchar(10) NOT NULL DEFAULT 'new',
  `encryption_type` varchar(20) NOT NULL DEFAULT 'not_set',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_suggestion`
--

LOCK TABLES `teampass_suggestion` WRITE;
/*!40000 ALTER TABLE `teampass_suggestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_suggestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_tags`
--

DROP TABLE IF EXISTS `teampass_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_tags` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `tag` varchar(30) NOT NULL,
  `item_id` int(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_tags`
--

LOCK TABLES `teampass_tags` WRITE;
/*!40000 ALTER TABLE `teampass_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_templates`
--

DROP TABLE IF EXISTS `teampass_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_templates` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `item_id` int(12) NOT NULL,
  `category_id` int(12) NOT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_templates`
--

LOCK TABLES `teampass_templates` WRITE;
/*!40000 ALTER TABLE `teampass_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_tokens`
--

DROP TABLE IF EXISTS `teampass_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_tokens` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_id` int(12) NOT NULL,
  `token` varchar(255) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `creation_timestamp` varchar(50) NOT NULL,
  `end_timestamp` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_tokens`
--

LOCK TABLES `teampass_tokens` WRITE;
/*!40000 ALTER TABLE `teampass_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_users`
--

DROP TABLE IF EXISTS `teampass_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_users` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `login` varchar(500) NOT NULL,
  `pw` varchar(400) NOT NULL,
  `groupes_visibles` varchar(1000) NOT NULL,
  `derniers` text DEFAULT NULL,
  `key_tempo` varchar(100) DEFAULT NULL,
  `last_pw_change` varchar(30) DEFAULT NULL,
  `last_pw` text DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `fonction_id` varchar(1000) DEFAULT NULL,
  `groupes_interdits` varchar(1000) DEFAULT NULL,
  `last_connexion` varchar(30) DEFAULT NULL,
  `gestionnaire` int(11) NOT NULL DEFAULT 0,
  `email` varchar(300) NOT NULL DEFAULT 'none',
  `favourites` varchar(1000) DEFAULT NULL,
  `latest_items` varchar(1000) DEFAULT NULL,
  `personal_folder` int(1) NOT NULL DEFAULT 0,
  `disabled` tinyint(1) NOT NULL DEFAULT 0,
  `no_bad_attempts` tinyint(1) NOT NULL DEFAULT 0,
  `can_create_root_folder` tinyint(1) NOT NULL DEFAULT 0,
  `read_only` tinyint(1) NOT NULL DEFAULT 0,
  `timestamp` varchar(30) NOT NULL DEFAULT '0',
  `user_language` varchar(50) NOT NULL DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `session_end` varchar(30) DEFAULT NULL,
  `isAdministratedByRole` tinyint(5) NOT NULL DEFAULT 0,
  `psk` varchar(400) DEFAULT NULL,
  `ga` varchar(50) DEFAULT NULL,
  `ga_temporary_code` varchar(20) NOT NULL DEFAULT 'none',
  `avatar` varchar(1000) DEFAULT NULL,
  `avatar_thumb` varchar(1000) DEFAULT NULL,
  `upgrade_needed` tinyint(1) NOT NULL DEFAULT 0,
  `treeloadstrategy` varchar(30) NOT NULL DEFAULT 'full',
  `can_manage_all_users` tinyint(1) NOT NULL DEFAULT 0,
  `usertimezone` varchar(50) NOT NULL DEFAULT 'not_defined',
  `agses-usercardid` varchar(50) NOT NULL DEFAULT '0',
  `encrypted_psk` text DEFAULT NULL,
  `user_ip` varchar(400) NOT NULL DEFAULT 'none',
  `user_ip_lastdate` varchar(50) DEFAULT NULL,
  `yubico_user_key` varchar(100) NOT NULL DEFAULT 'none',
  `yubico_user_id` varchar(100) NOT NULL DEFAULT 'none',
  `public_key` text DEFAULT NULL,
  `private_key` text DEFAULT NULL,
  `special` varchar(250) NOT NULL DEFAULT 'none',
  `auth_type` varchar(200) NOT NULL DEFAULT 'local',
  `is_ready_for_usage` tinyint(1) NOT NULL DEFAULT 0,
  `otp_provided` tinyint(1) NOT NULL DEFAULT 0,
  `roles_from_ad_groups` varchar(1000) DEFAULT NULL,
  `ongoing_process_id` varchar(100) DEFAULT NULL,
  `mfa_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` varchar(30) DEFAULT NULL,
  `updated_at` varchar(30) DEFAULT NULL,
  `deleted_at` varchar(30) DEFAULT NULL,
  `keys_recovery_time` varchar(500) DEFAULT NULL,
  `aes_iv` text DEFAULT NULL,
  `split_view_mode` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=10000000 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_users`
--

LOCK TABLES `teampass_users` WRITE;
/*!40000 ALTER TABLE `teampass_users` DISABLE KEYS */;
INSERT INTO `teampass_users` VALUES (1,'admin','$2y$13$PtFX2kj49PzdKEcW9TLOAu2fRjddTPbxSQbm0Ce7GSIAGNdUO4uIe','0',NULL,'6n068akq4aef61sj9a0enhmmgc','1730256068',NULL,1,'',NULL,'1730429988',0,'fulano@gmail.com',NULL,NULL,0,0,0,1,0,'1730429988','0','Change me','Change me','1730433588',0,NULL,NULL,'none',NULL,NULL,0,'full',0,'not_defined','0','','10.1.1.132','1730429989','none','none','LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0NCk1JSUNJakFOQmdrcWhraUc5dzBCQVFFRkFBT0NBZzhBTUlJQ0NnS0NBZ0VBdEZJcU51U0dRYU1mQUdlMnZ4VEYNCno3SW16K3dDOWpDSy9qVTRVM01Rcm02ditvU210QmhqaUF6K1Zwd0JpY0J1RXA0WmVoMytUREx3WHRlczJuSysNCjdtd1h6OUxRd0ZlVEFTWjVvWUtLN1JiRGJLRnArYmE2ZTkvM2J5RG5Mc2JsUWMwbXNmRU40d2kzUDMyODJmK2kNCnhxMVU2Z3J1SWpLN2ZFTHN2M01xZkpKbC9RN1c4cjhtT05RcHkwMWF3RjUwNm1HMWNlaWxTOFB1K0Z3ZUQwOGcNCmxKSjAwcTl1WHVIYS84WDcxV0V4eWxGS0ptVjZtZ0JvSHVjTmMvTmUrNllsN2JTbjY4MzZRRVk5K3ZyTHBHMSsNCjI3dCtNK2dGaVpwWFBIYWNZNVBWUnBzbWU0bk9HWHJWMi9iMU1LUytDL1didlFCNTk1b2h5UFpoRStqSkExNXINCmJvMjdrM1NQVC8yRHFVVWl2V1JOdEVwMlpKZ05ybHhMS3VxNG5lRnNhSlF6RnBtWHhJZGFmZXVwK3lDQ2VUZ2wNCkFXaVduNzExdGloT2tIS0E4SkYyM2R1V1dDUWYwdzIzUHNySWdjOHhKdWVlSlYzcEpOeFlrQXdxeFNYSnVOVXgNCkF2MG9OTGhmeHVLMlhnZ3I2RUx6UnIrc2M0djlYRWlPL1NSOFlSM2NVSmRWNHlKeEw5SmNoWThHOHh2RlI5Z0wNCnVDYitFeWE5QWduL1JiYXVhZkEzZzFiWUc4d0tzK0d3bzVHUHE4M05yNExVN2NLaFh2by9MeVBMcHUyaWFCV20NCms0THNKRExiSFdCd05LbXI5QlBmZHBXbFBvaFY0L1VPTk1uR2MwVnEveVlLYTVDUjlOd25FdXhRY3UzSDZFc0sNCis4aG1yVllEajBlNU1QN3ZsTmZTNHJFQ0F3RUFBUT09DQotLS0tLUVORCBQVUJMSUMgS0VZLS0tLS0=','GhFQ6lHE0wpK9AmwyH3uUuLP42Qev1xY00XcRt7Id0uNYf/mfZvmuZdpCg5RFzuWtExPxMHFlxrqjsNmYSzC4PtD4/uOqv1Idw8xMjulKDIpZrXlCkIr12g4ZzU6VH4DEeMQG1yKDRJJrJyt5Qm9PPswedOpFDeL6OtE6vgQ8Lu9cLFfRKdNHKjI1sDSADTA/FE/sHHcioWGOJ4NGTGqcuDpvFGbHCkqziAcdgq4ju7D/wiqjt7WFLMXPtgCW0JSH5qCKmWD3cDYafrU5GlaNJ1Guweo7o3XKHZv++dz5YHxf9jaTA7efFaj34AWDczElOTZj8XGI3XG1iaGMGKvueigy5k65U/ca/8nu7D1Ik6AcnbJ1G//begk946QwJxGPceHZ2e8//few5Pf1hYPGtBMhbPDu7SFHX3OP1fRw4cB6UdLz+p36y/ewXWPR/6IkU3GHKoX3FMyvZwZSPsWH39DVJv+PfC4xid788uG0PI8RLO8m4MwUEnAaOu9tCgB4t5i0cTsv6gMQhml+9kOLr2lyQv7/VFlykefyN/97+RqCFn6Y5EhoE5HKd18x7pNy/U5Dzg2yv7fSHEgk8+5oSrFigKJeHMl5TS77pNvhf/OMBpQ+nIIQ77Gv/ATtB8Xp65OQubZzO06s7isPKzZ+pqjsn+5qzXn5f1TmACW25c3Vu8VXgqF/g3PiKR1Oe5Gpxs+gWoj8blCndjbH5/elaCy5p6C53fuQ9mooqYb5tI5+86XIk1WYXIArEBxBbd5NimplqY1HWvil+B26SCrnQmhVitEBZm4cJ+OrUAj9CwWEQpG82afpcJD/gaoqWjxwfol7V/kiZyq7NIW4z3hZrvVPZNra0qSUrdnvY9laMxSfQc5glsbl4t6O59tTpYT0qLk0GJl3Wle0p1pFyANfLqmYWAUdC3msw4EjB0d3cARIlkb7IfQ3klhKyaoVyKjwNE0OSpMXNQa7K0zDmE1b8bci7IFv4akVdQDcG8L0mXqQFFaHGuQ1S3k0Wr3lHkPAkWWU+1O9i1DVlbCRLeUP3/hsObqKgc728ZM4Cd0xHVvXzRDpEJPQ/0jX/x26Vm0GPc5NmytGxdkKmOppXxruOA0KEggbw6rWYqbSUVcGNvUpmiqigrP77fpe+n437NydPe9WoWkM5/vt5+k90aU5WSXQWPwFqZgtttfcwEv+MfUitcB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','none','local',1,1,NULL,NULL,1,'1730256068',NULL,NULL,NULL,NULL,0),(9999991,'OTV','','','','','','',1,'','','',0,'','','',0,0,0,0,0,'0','0',NULL,NULL,NULL,0,NULL,NULL,'none',NULL,NULL,0,'full',0,'not_defined','0',NULL,'none',NULL,'none','none',NULL,NULL,'none','local',0,1,NULL,NULL,1,'1730256068',NULL,NULL,NULL,NULL,0),(9999997,'TP','def502007c133ab084c0fcbae394f12d86ca48a2e7c3297273beb164e44b130ccb380ce9a41d6a6ff7b6df565be14fb01d12dd701decb86618e591399175609f421faa9ccbb276835545a18d122f1ac9f1e143be28b6431d18e8e3e97c5779e6f9f05be5d8cf162e75b55b8cbe','','','','','',1,'','','',0,'','','',0,0,0,0,0,'0','0',NULL,NULL,NULL,0,NULL,NULL,'none',NULL,NULL,0,'full',0,'not_defined','0',NULL,'none',NULL,'none','none','LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0NCk1JSUNJakFOQmdrcWhraUc5dzBCQVFFRkFBT0NBZzhBTUlJQ0NnS0NBZ0VBeVg0bVE0VG5qVWJrdThraUI3SFANCjVraUpJNEh5RHVBa3VyNHFjNXk5V2lXSjRjNXVkdUNtdWlnOTRrQ2IwSWNVSHhiUVFYU1FoRmRDUktmemEwMVUNCmhNdzBZaVROekQvdWUrYlFpVEpuNVpSL2pMRVA1eTJMbzFtNjdpUGJPZzR6RHR6b3BlTXdMM0dJbHpEVG1qYUkNCllaWDJzRnRpMTQxa3NLcEJSRlozdFBPY2JDZjRHMVlXTXhUcmVGOGNLNGpKczB4Vk5yK3cwRzB0TmQvNFdROE4NCjlZV2k1c2luYmwvUlV4ZXdrck41S0RZOGt5Y2xyQkt0cWZnRGU3L1A4Zi9SOFFJQUlhU2F1bWl2bUdMbmVBblYNCkJQcTF4MXVIbGV5N2ZuN3dUQzRSWk5GQ2Q5RHZyek9wR3krQUxlbHJoVzRWQ2srWGNaN2NJOUNaK2l4ZGxYSWsNCk9GVWZpVndKNzFNWjJNZFE2KzZiWUxwaS9sbWN1S0R6ZFVxTGtrWnlVVEFZOFk5MjdjeEo4NUZXWHhFdUxDUjUNCmU4THI4a3FaMWw1WVphNnlhN2pSUnYwQkZraGQwNUtIS2tYbUl6RFFPUDRxS3QwQUxaUVJJTzhWN3FHZGdZSWcNCmRwMlBIWENVT2FVMXdORTE5V3p4NWlML3VwQXNaamdpdmlVQXUydVN1SGFwcmczNmxIbmd5VmQ4K21EVHkrcWQNCnh5MXNXM3dKVFc1bDlNSGZkUzhDV3V0VlZxcVdtVzNNYnh5czNnM1lpdHNHK3NSZXkzcmtBOG9VSmlrT05uV2MNCmFobzlHQzF5ZDFpeGhJYXVVOThINUFJWXF6eEU1ajhGeTFoUHpGTDhGTHBBRW41Y0dLMHplUnhxdWpramFmeDYNCkVOVkdCK0dvT0dGMGFUaGFOdXNmUU4wQ0F3RUFBUT09DQotLS0tLUVORCBQVUJMSUMgS0VZLS0tLS0=','nMOzV4fKAurt9I6LfVYqzwomyeg996i1Ogl1bfPRbXKLXngfHpZKiebwSXP0P4P3VCTzn3oeWKnbBSpmbO3AJvvKooAfNwXBpTOfrxvD0N1k5pgEgGnM670Zwifa17we9uSAq8awtmAvz1g84Na4m127ZW8q7Hgk1ABI9UL6ZhI9/WMi01C2SwBDGVA+/+co3jbJPjxmskF3hrvVpXcmIfUnklOpgsPLXubL5mSZO3dTc917KYAGcr0Burh+ddFFxiEYx854ARc1SBh6pfFrCrbFrc3IXyzdUttRNzb3Z4AStP36gXnNZrr3vsIW4b4/vuaoP285gPMV4xEhldXSRGDnUn56/ov207QDaYMi23E7bFYECeL2OdAI2n2eW19Pu1yUqVZfIgOyOOBVCO9viRt+zP8q9OI2c+sKMBnaftGFtQWrqjyH0Xt/ueKLq7x6Z8nJQYYC02kHtP4gF+/pbv585yf+PmxKtgHVRfAH3zMNUfU4WJ9gK6g+RuPS3z5oImvXeu6qhN8LWZQb1dfquFXBzAZ23PEbcZBpoYflW+nVXYe3PPiJwIJ3+hBIXOQO65PEhDo/pMqL8Dai2WrV3f8GSnIwyf2J7tgKylS3QzN4MLiAaXtPMj8cpToaFaSYCecSvxqD4Qux5xZu3kenAf4SQwbdyxvJAUitDAGi8LuShtpRlkBJi89OLLTrDUiB36sWGAns0UVQ3F+yMUH3RVbWfFzz9U7ETda9VsVN5VmJmUOK5ETzCXgLXrWnAoW9ffFsRLCLq2j+ecvHJjF2I0YW2UPFyFeCu5DKDhHgZS43R7JTKDZAc+TWtg4wOZxcWIBQAjMO+euwKXaTMz1MA45r6JhdcsCu5XqcaefXMRMNxreyTCdvHakq2BYWUj224RADmcjbm32mreNxj/WkrQntWDmFLT+0AVSF/X2BIOOjbUdXbSqNKTTRVdPIc0l+RrooKqYRNB/PxhxIofj45Vxg76glXoYGufZCo8aux/mVnqo3cBaZ/wWbNHnXDq+uCOh6Y+ND0iOrvdTBJI7oh6uOsTlZI2ooxyVXypuRVN9Gn5rFjcFAWFVfM1EILYl0LVXdAqDQC9buqx1dc/oRrEsfCU8JGtJ88swhZnAjg56bXo2ZEHNnFdwhFSM66jukOomyfXQGdRycNrWvQexmaXICrkHRK0ZoF9uKo77BeuuhvHcb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','none','local',1,1,NULL,NULL,1,'1730256088',NULL,NULL,NULL,NULL,0),(9999999,'API','','','','','','',1,'','','',0,'','','',0,0,0,0,0,'0','0',NULL,NULL,NULL,0,NULL,NULL,'none',NULL,NULL,0,'full',0,'not_defined','0',NULL,'none',NULL,'none','none',NULL,NULL,'none','local',0,1,NULL,NULL,1,'1730256068',NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `teampass_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-01 14:39:52
