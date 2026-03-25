-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: myapp
-- ------------------------------------------------------
-- Server version	8.0.44-0ubuntu0.24.04.2

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
-- Current Database: `myapp`
--

/*!40000 DROP DATABASE IF EXISTS `myapp`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `myapp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `myapp`;

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('new','read','archived') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_status_created` (`status`,`created_at`),
  KEY `idx_email_created` (`email`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_messages`
--

LOCK TABLES `contact_messages` WRITE;
/*!40000 ALTER TABLE `contact_messages` DISABLE KEYS */;
INSERT INTO `contact_messages` VALUES (1,'Sample Visitor','visitor@example.com','+256700000000','Project inquiry','Hello Odeo Technologies, I would like to discuss a website project. Please advise on next steps.','new','2026-03-25 17:46:44');
/*!40000 ALTER TABLE `contact_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_items`
--

DROP TABLE IF EXISTS `content_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('page','post','portfolio') COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('draft','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `featured_media_id` bigint unsigned DEFAULT NULL,
  `author_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'Odeo Technologies',
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_type_slug` (`type`,`slug`),
  KEY `idx_type_status_published` (`type`,`status`,`published_at`),
  KEY `fk_content_featured_media` (`featured_media_id`),
  CONSTRAINT `fk_content_featured_media` FOREIGN KEY (`featured_media_id`) REFERENCES `media_assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_items`
--

LOCK TABLES `content_items` WRITE;
/*!40000 ALTER TABLE `content_items` DISABLE KEYS */;
INSERT INTO `content_items` VALUES (1,'page','home','Home','Modern IT services & solutions for growing businesses in Uganda.','<h1>Odeo Technologies</h1><p>We deliver reliable software, cloud, and IT services for organizations across Uganda and beyond.</p><p><strong>What we do:</strong> Web & app development, cloud solutions, IT support, and cybersecurity.</p><p><a href=\"/contact\">Talk to us</a> to start your next project.</p>','published',1,'Odeo Technologies','2026-03-25 17:45:44','2026-03-25 17:45:44','2026-03-25 17:45:44'),(2,'page','about','About','Odeo Technologies is a Uganda-based IT services company focused on quality delivery.','<h1>About Odeo Technologies</h1><p>Odeo Technologies is an IT services company based in Uganda. We help teams build, modernize, and operate digital products with confidence.</p><h2>Our approach</h2><ul><li>Discovery-first and outcome-driven</li><li>Secure-by-default delivery</li><li>Clear communication and measurable milestones</li></ul>','published',NULL,'Odeo Technologies','2026-03-25 17:45:49','2026-03-25 17:45:49','2026-03-25 17:45:49'),(3,'page','services','Services','From custom development to IT support, we provide end-to-end technology services.','<h1>Services</h1><h2>Software & Web Development</h2><p>Build modern websites, web apps, and internal systems.</p><h2>Cloud Solutions</h2><p>Design, migrate, and manage scalable cloud infrastructure.</p><h2>IT Support & Managed Services</h2><p>Keep your systems reliable with proactive monitoring and support.</p><h2>Cybersecurity</h2><p>Security assessments, hardening, and best-practice guidance.</p>','published',NULL,'Odeo Technologies','2026-03-25 17:45:53','2026-03-25 17:45:53','2026-03-25 17:45:53'),(4,'page','portfolio','Portfolio / Case Studies','A selection of projects and outcomes delivered by our team.','<h1>Portfolio / Case Studies</h1><p>Explore recent work delivered by Odeo Technologies. Each case study highlights the problem, approach, and results.</p><p><a href=\"/portfolio\">View all case studies</a>.</p>','published',NULL,'Odeo Technologies','2026-03-25 17:45:57','2026-03-25 17:45:57','2026-03-25 17:45:57'),(5,'page','blog','Blog','Insights on software, cloud, and IT services in Uganda.','<h1>Blog</h1><p>Insights, updates, and practical guides from the Odeo Technologies team.</p>','published',NULL,'Odeo Technologies','2026-03-25 17:46:03','2026-03-25 17:46:03','2026-03-25 17:46:03'),(6,'page','contact','Contact','Get in touch with Odeo Technologies. We reply quickly.','<h1>Contact</h1><p>We would love to hear about your project.</p><h2>Physical location</h2><p>Luzira Portbell Road opposite Quality Chemicals, Uganda.</p><h2>Map</h2><p>[Embedded map placeholder]</p><p>Use the contact form to send us a message.</p>','published',NULL,'Odeo Technologies','2026-03-25 17:46:07','2026-03-25 17:46:07','2026-03-25 17:46:07'),(7,'post','getting-started-with-managed-it','Getting Started with Managed IT Services','A practical guide to choosing the right managed services partner.','<p>Managed IT services help organizations stay secure, productive, and resilient. In this post, we cover what to look for in a partner, common service components, and how to plan a smooth onboarding.</p><h2>Key takeaways</h2><ul><li>Define your goals and service scope</li><li>Prioritize security and SLAs</li><li>Start with quick wins and iterate</li></ul>','published',NULL,'Odeo Technologies','2026-03-25 17:46:16','2026-03-25 17:46:16','2026-03-25 17:46:16'),(8,'post','cloud-migration-checklist','Cloud Migration Checklist for SMBs','A lightweight checklist to reduce risk during cloud migrations.','<p>Planning a cloud migration? Use this checklist to align stakeholders, protect data, and ensure smooth cutover.</p><ol><li>Inventory systems and dependencies</li><li>Choose a target architecture</li><li>Plan security, backups, and monitoring</li><li>Test and validate cutover</li></ol>','published',NULL,'Odeo Technologies','2026-03-25 17:46:20','2026-03-25 17:46:20','2026-03-25 17:46:20'),(9,'portfolio','secure-network-hardening','Secure Network Hardening for a Local Organization','Improved security posture with practical hardening and monitoring.','<h2>Challenge</h2><p>The client needed better visibility and improved controls across endpoints and network devices.</p><h2>Solution</h2><p>We implemented baseline hardening, access controls, and monitoring with clear runbooks.</p><h2>Outcome</h2><ul><li>Reduced attack surface</li><li>Faster incident response</li><li>Improved operational clarity</li></ul>','published',NULL,'Odeo Technologies','2026-03-25 17:46:25','2026-03-25 17:46:25','2026-03-25 17:46:25'),(10,'portfolio','website-revamp-performance','Website Revamp & Performance Optimization','A modern redesign with better performance and SEO foundations.','<h2>Challenge</h2><p>The previous website was slow and difficult to update.</p><h2>Solution</h2><p>We redesigned the UI, improved information architecture, and optimized assets and caching.</p><h2>Outcome</h2><ul><li>Faster load times</li><li>Clearer navigation</li><li>Improved SEO readiness</li></ul>','published',NULL,'Odeo Technologies','2026-03-25 17:46:30','2026-03-25 17:46:30','2026-03-25 17:46:30');
/*!40000 ALTER TABLE `content_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_taxonomies`
--

DROP TABLE IF EXISTS `content_taxonomies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_taxonomies` (
  `content_id` bigint unsigned NOT NULL,
  `taxonomy_id` bigint unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`content_id`,`taxonomy_id`),
  KEY `idx_taxonomy_content` (`taxonomy_id`,`content_id`),
  CONSTRAINT `fk_ct_content` FOREIGN KEY (`content_id`) REFERENCES `content_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ct_taxonomy` FOREIGN KEY (`taxonomy_id`) REFERENCES `taxonomies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_taxonomies`
--

LOCK TABLES `content_taxonomies` WRITE;
/*!40000 ALTER TABLE `content_taxonomies` DISABLE KEYS */;
INSERT INTO `content_taxonomies` VALUES (7,2,'2026-03-25 17:46:33'),(7,3,'2026-03-25 17:46:36'),(8,2,'2026-03-25 17:46:33'),(8,3,'2026-03-25 17:46:36'),(8,4,'2026-03-25 17:46:39'),(9,5,'2026-03-25 17:46:41');
/*!40000 ALTER TABLE `content_taxonomies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_assets`
--

DROP TABLE IF EXISTS `media_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_assets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(768) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mime_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_media_url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_assets`
--

LOCK TABLES `media_assets` WRITE;
/*!40000 ALTER TABLE `media_assets` DISABLE KEYS */;
INSERT INTO `media_assets` VALUES (1,'/assets/odeo-hero.jpg','Odeo Technologies team delivering IT services','Odeo Hero','image/jpeg','2026-03-25 17:45:26');
/*!40000 ALTER TABLE `media_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxonomies`
--

DROP TABLE IF EXISTS `taxonomies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxonomies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `taxonomy` enum('category','tag') COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_taxonomy_slug` (`taxonomy`,`slug`),
  KEY `idx_taxonomy_name` (`taxonomy`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxonomies`
--

LOCK TABLES `taxonomies` WRITE;
/*!40000 ALTER TABLE `taxonomies` DISABLE KEYS */;
INSERT INTO `taxonomies` VALUES (1,'category','company-news','Company News','Updates and announcements from Odeo Technologies','2026-03-25 17:45:29'),(2,'category','it-services','IT Services','Service highlights, guides, and solutions','2026-03-25 17:45:34'),(3,'tag','uganda','Uganda',NULL,'2026-03-25 17:45:36'),(4,'tag','cloud','Cloud',NULL,'2026-03-25 17:45:38'),(5,'tag','cybersecurity','Cybersecurity',NULL,'2026-03-25 17:45:40');
/*!40000 ALTER TABLE `taxonomies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'myapp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-25 20:47:15
