-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: prashant_QA
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

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
-- Table structure for table `reading_item`
--

DROP TABLE IF EXISTS `reading_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reading_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `is_read` bit(1) NOT NULL,
  `resource_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_93xit1asu8caf665svq0vqmeq` (`resource_id`),
  KEY `FK_rmxs9jrphvwn7tyg2n82p8wq0` (`user_id`),
  CONSTRAINT `FK_93xit1asu8caf665svq0vqmeq` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  CONSTRAINT `FK_rmxs9jrphvwn7tyg2n82p8wq0` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reading_item`
--

LOCK TABLES `reading_item` WRITE;
/*!40000 ALTER TABLE `reading_item` DISABLE KEYS */;
INSERT INTO `reading_item` VALUES (1,0,'',70,1),(2,0,'',79,1),(3,0,'',49,1),(4,0,'',40,2),(5,0,'',53,2),(6,0,'',97,2);
/*!40000 ALTER TABLE `reading_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `created_by_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `description` varchar(1024) NOT NULL,
  `last_updated` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `topic_id` bigint(20) NOT NULL,
  `class` varchar(255) NOT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_g246684ev6hmr47bn9x3jv37f` (`created_by_id`),
  KEY `FK_29on5nwfvvdmtimh40b7tnsw5` (`topic_id`),
  CONSTRAINT `FK_29on5nwfvvdmtimh40b7tnsw5` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`),
  CONSTRAINT `FK_g246684ev6hmr47bn9x3jv37f` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
INSERT INTO `resource` VALUES (1,1,1,'2015-03-25 09:55:43','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 1','2015-03-25 09:55:52','DummyLinkTitle1',1,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page0'),(2,1,1,'2015-03-25 09:55:43','dummyDocumentResource com.linksharing.Topic : 1','2015-03-25 09:55:53','DummyDocumentTitle1',1,'com.linksharing.DocumentResource','.txt','ABCDDocument0',NULL),(3,1,1,'2015-03-25 09:55:43','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 1','2015-03-25 09:55:53','DummyLinkTitle2',1,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page1'),(4,1,1,'2015-03-25 09:55:43','dummyDocumentResource com.linksharing.Topic : 1','2015-03-25 09:55:53','DummyDocumentTitle2',1,'com.linksharing.DocumentResource','.txt','ABCDDocument1',NULL),(5,1,1,'2015-03-25 09:55:43','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 1','2015-03-25 09:55:53','DummyLinkTitle3',1,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page2'),(6,1,1,'2015-03-25 09:55:43','dummyDocumentResource com.linksharing.Topic : 1','2015-03-25 09:55:53','DummyDocumentTitle3',1,'com.linksharing.DocumentResource','.txt','ABCDDocument2',NULL),(7,1,1,'2015-03-25 09:55:43','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 1','2015-03-25 09:55:53','DummyLinkTitle4',1,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page3'),(8,1,1,'2015-03-25 09:55:44','dummyDocumentResource com.linksharing.Topic : 1','2015-03-25 09:55:53','DummyDocumentTitle4',1,'com.linksharing.DocumentResource','.txt','ABCDDocument3',NULL),(9,1,1,'2015-03-25 09:55:44','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 1','2015-03-25 09:55:53','DummyLinkTitle5',1,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page4'),(10,1,1,'2015-03-25 09:55:44','dummyDocumentResource com.linksharing.Topic : 1','2015-03-25 09:55:54','DummyDocumentTitle5',1,'com.linksharing.DocumentResource','.txt','ABCDDocument4',NULL),(11,1,1,'2015-03-25 09:55:44','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 2','2015-03-25 09:55:54','DummyLinkTitle1',2,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page0'),(12,1,1,'2015-03-25 09:55:44','dummyDocumentResource com.linksharing.Topic : 2','2015-03-25 09:55:54','DummyDocumentTitle1',2,'com.linksharing.DocumentResource','.txt','ABCDDocument0',NULL),(13,1,1,'2015-03-25 09:55:44','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 2','2015-03-25 09:55:54','DummyLinkTitle2',2,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page1'),(14,1,1,'2015-03-25 09:55:44','dummyDocumentResource com.linksharing.Topic : 2','2015-03-25 09:55:54','DummyDocumentTitle2',2,'com.linksharing.DocumentResource','.txt','ABCDDocument1',NULL),(15,1,1,'2015-03-25 09:55:44','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 2','2015-03-25 09:55:54','DummyLinkTitle3',2,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page2'),(16,1,1,'2015-03-25 09:55:45','dummyDocumentResource com.linksharing.Topic : 2','2015-03-25 09:55:54','DummyDocumentTitle3',2,'com.linksharing.DocumentResource','.txt','ABCDDocument2',NULL),(17,1,1,'2015-03-25 09:55:45','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 2','2015-03-25 09:55:54','DummyLinkTitle4',2,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page3'),(18,1,1,'2015-03-25 09:55:45','dummyDocumentResource com.linksharing.Topic : 2','2015-03-25 09:55:55','DummyDocumentTitle4',2,'com.linksharing.DocumentResource','.txt','ABCDDocument3',NULL),(19,1,1,'2015-03-25 09:55:45','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 2','2015-03-25 09:55:55','DummyLinkTitle5',2,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page4'),(20,1,1,'2015-03-25 09:55:45','dummyDocumentResource com.linksharing.Topic : 2','2015-03-25 09:55:55','DummyDocumentTitle5',2,'com.linksharing.DocumentResource','.txt','ABCDDocument4',NULL),(21,1,1,'2015-03-25 09:55:45','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 3','2015-03-25 09:55:55','DummyLinkTitle1',3,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page0'),(22,1,1,'2015-03-25 09:55:45','dummyDocumentResource com.linksharing.Topic : 3','2015-03-25 09:55:55','DummyDocumentTitle1',3,'com.linksharing.DocumentResource','.txt','ABCDDocument0',NULL),(23,1,1,'2015-03-25 09:55:45','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 3','2015-03-25 09:55:55','DummyLinkTitle2',3,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page1'),(24,1,1,'2015-03-25 09:55:45','dummyDocumentResource com.linksharing.Topic : 3','2015-03-25 09:55:55','DummyDocumentTitle2',3,'com.linksharing.DocumentResource','.txt','ABCDDocument1',NULL),(25,1,1,'2015-03-25 09:55:45','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 3','2015-03-25 09:55:56','DummyLinkTitle3',3,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page2'),(26,1,1,'2015-03-25 09:55:45','dummyDocumentResource com.linksharing.Topic : 3','2015-03-25 09:55:56','DummyDocumentTitle3',3,'com.linksharing.DocumentResource','.txt','ABCDDocument2',NULL),(27,1,1,'2015-03-25 09:55:46','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 3','2015-03-25 09:55:56','DummyLinkTitle4',3,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page3'),(28,1,1,'2015-03-25 09:55:46','dummyDocumentResource com.linksharing.Topic : 3','2015-03-25 09:55:56','DummyDocumentTitle4',3,'com.linksharing.DocumentResource','.txt','ABCDDocument3',NULL),(29,1,1,'2015-03-25 09:55:46','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 3','2015-03-25 09:55:56','DummyLinkTitle5',3,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page4'),(30,1,1,'2015-03-25 09:55:46','dummyDocumentResource com.linksharing.Topic : 3','2015-03-25 09:55:56','DummyDocumentTitle5',3,'com.linksharing.DocumentResource','.txt','ABCDDocument4',NULL),(31,1,1,'2015-03-25 09:55:46','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 4','2015-03-25 09:55:56','DummyLinkTitle1',4,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page0'),(32,1,1,'2015-03-25 09:55:46','dummyDocumentResource com.linksharing.Topic : 4','2015-03-25 09:55:56','DummyDocumentTitle1',4,'com.linksharing.DocumentResource','.txt','ABCDDocument0',NULL),(33,1,1,'2015-03-25 09:55:46','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 4','2015-03-25 09:55:57','DummyLinkTitle2',4,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page1'),(34,1,1,'2015-03-25 09:55:46','dummyDocumentResource com.linksharing.Topic : 4','2015-03-25 09:55:57','DummyDocumentTitle2',4,'com.linksharing.DocumentResource','.txt','ABCDDocument1',NULL),(35,1,1,'2015-03-25 09:55:46','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 4','2015-03-25 09:55:57','DummyLinkTitle3',4,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page2'),(36,1,1,'2015-03-25 09:55:46','dummyDocumentResource com.linksharing.Topic : 4','2015-03-25 09:55:57','DummyDocumentTitle3',4,'com.linksharing.DocumentResource','.txt','ABCDDocument2',NULL),(37,1,1,'2015-03-25 09:55:46','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 4','2015-03-25 09:55:57','DummyLinkTitle4',4,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page3'),(38,1,1,'2015-03-25 09:55:46','dummyDocumentResource com.linksharing.Topic : 4','2015-03-25 09:55:57','DummyDocumentTitle4',4,'com.linksharing.DocumentResource','.txt','ABCDDocument3',NULL),(39,1,1,'2015-03-25 09:55:46','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 4','2015-03-25 09:55:57','DummyLinkTitle5',4,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page4'),(40,2,1,'2015-03-25 09:55:47','dummyDocumentResource com.linksharing.Topic : 4','2015-03-25 09:55:57','DummyDocumentTitle5',4,'com.linksharing.DocumentResource','.txt','ABCDDocument4',NULL),(41,1,1,'2015-03-25 09:55:47','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 5','2015-03-25 09:55:58','DummyLinkTitle1',5,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page0'),(42,1,1,'2015-03-25 09:55:47','dummyDocumentResource com.linksharing.Topic : 5','2015-03-25 09:55:59','DummyDocumentTitle1',5,'com.linksharing.DocumentResource','.txt','ABCDDocument0',NULL),(43,1,1,'2015-03-25 09:55:47','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 5','2015-03-25 09:55:59','DummyLinkTitle2',5,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page1'),(44,1,1,'2015-03-25 09:55:47','dummyDocumentResource com.linksharing.Topic : 5','2015-03-25 09:55:59','DummyDocumentTitle2',5,'com.linksharing.DocumentResource','.txt','ABCDDocument1',NULL),(45,1,1,'2015-03-25 09:55:47','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 5','2015-03-25 09:55:59','DummyLinkTitle3',5,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page2'),(46,1,1,'2015-03-25 09:55:47','dummyDocumentResource com.linksharing.Topic : 5','2015-03-25 09:55:59','DummyDocumentTitle3',5,'com.linksharing.DocumentResource','.txt','ABCDDocument2',NULL),(47,1,1,'2015-03-25 09:55:47','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 5','2015-03-25 09:55:59','DummyLinkTitle4',5,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page3'),(48,1,1,'2015-03-25 09:55:47','dummyDocumentResource com.linksharing.Topic : 5','2015-03-25 09:55:59','DummyDocumentTitle4',5,'com.linksharing.DocumentResource','.txt','ABCDDocument3',NULL),(49,2,1,'2015-03-25 09:55:47','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 5','2015-03-25 09:55:59','DummyLinkTitle5',5,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page4'),(50,1,1,'2015-03-25 09:55:47','dummyDocumentResource com.linksharing.Topic : 5','2015-03-25 09:55:59','DummyDocumentTitle5',5,'com.linksharing.DocumentResource','.txt','ABCDDocument4',NULL),(51,1,2,'2015-03-25 09:55:47','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 6','2015-03-25 09:56:00','DummyLinkTitle1',6,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page0'),(52,1,2,'2015-03-25 09:55:48','dummyDocumentResource com.linksharing.Topic : 6','2015-03-25 09:56:00','DummyDocumentTitle1',6,'com.linksharing.DocumentResource','.txt','ABCDDocument0',NULL),(53,2,2,'2015-03-25 09:55:48','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 6','2015-03-25 09:56:00','DummyLinkTitle2',6,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page1'),(54,1,2,'2015-03-25 09:55:48','dummyDocumentResource com.linksharing.Topic : 6','2015-03-25 09:56:00','DummyDocumentTitle2',6,'com.linksharing.DocumentResource','.txt','ABCDDocument1',NULL),(55,1,2,'2015-03-25 09:55:48','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 6','2015-03-25 09:56:00','DummyLinkTitle3',6,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page2'),(56,1,2,'2015-03-25 09:55:48','dummyDocumentResource com.linksharing.Topic : 6','2015-03-25 09:56:00','DummyDocumentTitle3',6,'com.linksharing.DocumentResource','.txt','ABCDDocument2',NULL),(57,1,2,'2015-03-25 09:55:48','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 6','2015-03-25 09:56:00','DummyLinkTitle4',6,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page3'),(58,1,2,'2015-03-25 09:55:48','dummyDocumentResource com.linksharing.Topic : 6','2015-03-25 09:56:00','DummyDocumentTitle4',6,'com.linksharing.DocumentResource','.txt','ABCDDocument3',NULL),(59,1,2,'2015-03-25 09:55:48','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 6','2015-03-25 09:56:01','DummyLinkTitle5',6,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page4'),(60,1,2,'2015-03-25 09:55:48','dummyDocumentResource com.linksharing.Topic : 6','2015-03-25 09:56:01','DummyDocumentTitle5',6,'com.linksharing.DocumentResource','.txt','ABCDDocument4',NULL),(61,1,2,'2015-03-25 09:55:48','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 7','2015-03-25 09:56:01','DummyLinkTitle1',7,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page0'),(62,1,2,'2015-03-25 09:55:49','dummyDocumentResource com.linksharing.Topic : 7','2015-03-25 09:56:01','DummyDocumentTitle1',7,'com.linksharing.DocumentResource','.txt','ABCDDocument0',NULL),(63,1,2,'2015-03-25 09:55:49','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 7','2015-03-25 09:56:01','DummyLinkTitle2',7,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page1'),(64,1,2,'2015-03-25 09:55:49','dummyDocumentResource com.linksharing.Topic : 7','2015-03-25 09:56:01','DummyDocumentTitle2',7,'com.linksharing.DocumentResource','.txt','ABCDDocument1',NULL),(65,1,2,'2015-03-25 09:55:49','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 7','2015-03-25 09:56:01','DummyLinkTitle3',7,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page2'),(66,1,2,'2015-03-25 09:55:49','dummyDocumentResource com.linksharing.Topic : 7','2015-03-25 09:56:01','DummyDocumentTitle3',7,'com.linksharing.DocumentResource','.txt','ABCDDocument2',NULL),(67,1,2,'2015-03-25 09:55:49','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 7','2015-03-25 09:56:02','DummyLinkTitle4',7,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page3'),(68,1,2,'2015-03-25 09:55:49','dummyDocumentResource com.linksharing.Topic : 7','2015-03-25 09:56:02','DummyDocumentTitle4',7,'com.linksharing.DocumentResource','.txt','ABCDDocument3',NULL),(69,1,2,'2015-03-25 09:55:49','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 7','2015-03-25 09:56:02','DummyLinkTitle5',7,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page4'),(70,2,2,'2015-03-25 09:55:49','dummyDocumentResource com.linksharing.Topic : 7','2015-03-25 09:56:02','DummyDocumentTitle5',7,'com.linksharing.DocumentResource','.txt','ABCDDocument4',NULL),(71,1,2,'2015-03-25 09:55:49','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 8','2015-03-25 09:56:02','DummyLinkTitle1',8,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page0'),(72,1,2,'2015-03-25 09:55:49','dummyDocumentResource com.linksharing.Topic : 8','2015-03-25 09:56:02','DummyDocumentTitle1',8,'com.linksharing.DocumentResource','.txt','ABCDDocument0',NULL),(73,1,2,'2015-03-25 09:55:49','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 8','2015-03-25 09:56:02','DummyLinkTitle2',8,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page1'),(74,1,2,'2015-03-25 09:55:49','dummyDocumentResource com.linksharing.Topic : 8','2015-03-25 09:56:02','DummyDocumentTitle2',8,'com.linksharing.DocumentResource','.txt','ABCDDocument1',NULL),(75,1,2,'2015-03-25 09:55:50','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 8','2015-03-25 09:56:02','DummyLinkTitle3',8,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page2'),(76,1,2,'2015-03-25 09:55:50','dummyDocumentResource com.linksharing.Topic : 8','2015-03-25 09:56:02','DummyDocumentTitle3',8,'com.linksharing.DocumentResource','.txt','ABCDDocument2',NULL),(77,1,2,'2015-03-25 09:55:50','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 8','2015-03-25 09:56:03','DummyLinkTitle4',8,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page3'),(78,1,2,'2015-03-25 09:55:50','dummyDocumentResource com.linksharing.Topic : 8','2015-03-25 09:56:03','DummyDocumentTitle4',8,'com.linksharing.DocumentResource','.txt','ABCDDocument3',NULL),(79,2,2,'2015-03-25 09:55:50','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 8','2015-03-25 09:56:03','DummyLinkTitle5',8,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page4'),(80,1,2,'2015-03-25 09:55:50','dummyDocumentResource com.linksharing.Topic : 8','2015-03-25 09:56:03','DummyDocumentTitle5',8,'com.linksharing.DocumentResource','.txt','ABCDDocument4',NULL),(81,1,2,'2015-03-25 09:55:50','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 9','2015-03-25 09:56:03','DummyLinkTitle1',9,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page0'),(82,1,2,'2015-03-25 09:55:50','dummyDocumentResource com.linksharing.Topic : 9','2015-03-25 09:56:03','DummyDocumentTitle1',9,'com.linksharing.DocumentResource','.txt','ABCDDocument0',NULL),(83,1,2,'2015-03-25 09:55:50','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 9','2015-03-25 09:56:03','DummyLinkTitle2',9,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page1'),(84,1,2,'2015-03-25 09:55:50','dummyDocumentResource com.linksharing.Topic : 9','2015-03-25 09:56:03','DummyDocumentTitle2',9,'com.linksharing.DocumentResource','.txt','ABCDDocument1',NULL),(85,1,2,'2015-03-25 09:55:50','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 9','2015-03-25 09:56:04','DummyLinkTitle3',9,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page2'),(86,1,2,'2015-03-25 09:55:50','dummyDocumentResource com.linksharing.Topic : 9','2015-03-25 09:56:04','DummyDocumentTitle3',9,'com.linksharing.DocumentResource','.txt','ABCDDocument2',NULL),(87,1,2,'2015-03-25 09:55:50','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 9','2015-03-25 09:56:04','DummyLinkTitle4',9,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page3'),(88,1,2,'2015-03-25 09:55:50','dummyDocumentResource com.linksharing.Topic : 9','2015-03-25 09:56:04','DummyDocumentTitle4',9,'com.linksharing.DocumentResource','.txt','ABCDDocument3',NULL),(89,1,2,'2015-03-25 09:55:51','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 9','2015-03-25 09:56:04','DummyLinkTitle5',9,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page4'),(90,1,2,'2015-03-25 09:55:51','dummyDocumentResource com.linksharing.Topic : 9','2015-03-25 09:56:04','DummyDocumentTitle5',9,'com.linksharing.DocumentResource','.txt','ABCDDocument4',NULL),(91,1,2,'2015-03-25 09:55:51','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 10','2015-03-25 09:56:04','DummyLinkTitle1',10,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page0'),(92,1,2,'2015-03-25 09:55:51','dummyDocumentResource com.linksharing.Topic : 10','2015-03-25 09:56:05','DummyDocumentTitle1',10,'com.linksharing.DocumentResource','.txt','ABCDDocument0',NULL),(93,1,2,'2015-03-25 09:55:51','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 10','2015-03-25 09:56:05','DummyLinkTitle2',10,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page1'),(94,1,2,'2015-03-25 09:55:51','dummyDocumentResource com.linksharing.Topic : 10','2015-03-25 09:56:05','DummyDocumentTitle2',10,'com.linksharing.DocumentResource','.txt','ABCDDocument1',NULL),(95,1,2,'2015-03-25 09:55:51','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 10','2015-03-25 09:56:05','DummyLinkTitle3',10,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page2'),(96,1,2,'2015-03-25 09:55:51','dummyDocumentResource com.linksharing.Topic : 10','2015-03-25 09:56:05','DummyDocumentTitle3',10,'com.linksharing.DocumentResource','.txt','ABCDDocument2',NULL),(97,2,2,'2015-03-25 09:55:51','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 10','2015-03-25 09:56:05','DummyLinkTitle4',10,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page3'),(98,1,2,'2015-03-25 09:55:51','dummyDocumentResource com.linksharing.Topic : 10','2015-03-25 09:56:06','DummyDocumentTitle4',10,'com.linksharing.DocumentResource','.txt','ABCDDocument3',NULL),(99,1,2,'2015-03-25 09:55:51','Lorem Ipsum is simply dummy text of the printing and typesetting industrycom.linksharing.Topic : 10','2015-03-25 09:56:06','DummyLinkTitle5',10,'com.linksharing.LinkResource',NULL,NULL,'http://www.grails.com/page4'),(100,1,2,'2015-03-25 09:55:51','dummyDocumentResource com.linksharing.Topic : 10','2015-03-25 09:56:06','DummyDocumentTitle5',10,'com.linksharing.DocumentResource','.txt','ABCDDocument4',NULL);
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_ratings`
--

DROP TABLE IF EXISTS `resource_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_ratings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `rating` int(11) NOT NULL,
  `resource_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5cy58jd0q1gryipq28f8n08ec` (`resource_id`),
  KEY `FK_aed02cujt1r1h6nbib21l1km6` (`user_id`),
  CONSTRAINT `FK_5cy58jd0q1gryipq28f8n08ec` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  CONSTRAINT `FK_aed02cujt1r1h6nbib21l1km6` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_ratings`
--

LOCK TABLES `resource_ratings` WRITE;
/*!40000 ALTER TABLE `resource_ratings` DISABLE KEYS */;
INSERT INTO `resource_ratings` VALUES (1,0,5,1,1),(2,0,1,2,1),(3,0,1,3,1),(4,0,2,4,2),(5,0,5,5,2),(6,0,2,6,1),(7,0,1,7,1),(8,0,5,8,2),(9,0,5,9,2),(10,0,4,10,1),(11,0,4,11,1),(12,0,4,12,2),(13,0,2,13,1),(14,0,4,14,2),(15,0,5,15,1),(16,0,1,16,1),(17,0,2,17,1),(18,0,4,18,1),(19,0,4,19,2),(20,0,3,20,2),(21,0,1,21,1),(22,0,5,22,2),(23,0,1,23,1),(24,0,3,24,1),(25,0,4,25,1),(26,0,4,26,2),(27,0,2,27,2),(28,0,4,28,2),(29,0,3,29,2),(30,0,3,30,1),(31,0,2,31,1),(32,0,4,32,1),(33,0,2,33,2),(34,0,1,34,1),(35,0,4,35,2),(36,0,4,36,2),(37,0,2,37,2),(38,0,3,38,2),(39,0,2,39,1),(40,0,3,40,2),(41,0,4,41,2),(42,0,4,42,1),(43,0,2,43,1),(44,0,2,44,1),(45,0,4,45,2),(46,0,5,46,2),(47,0,5,47,2),(48,0,3,48,2),(49,0,2,49,2),(50,0,4,50,2),(51,0,1,51,2),(52,0,1,52,1),(53,0,2,53,1),(54,0,4,54,2),(55,0,5,55,2),(56,0,5,56,1),(57,0,4,57,2),(58,0,5,58,2),(59,0,5,59,1),(60,0,3,60,2),(61,0,1,61,2),(62,0,2,62,2),(63,0,5,63,2),(64,0,4,64,1),(65,0,2,65,1),(66,0,2,66,2),(67,0,2,67,2),(68,0,5,68,1),(69,0,3,69,2),(70,0,2,70,2),(71,0,3,71,1),(72,0,4,72,1),(73,0,2,73,1),(74,0,1,74,2),(75,0,1,75,2),(76,0,4,76,2),(77,0,5,77,2),(78,0,2,78,2),(79,0,1,79,1),(80,0,3,80,2),(81,0,3,81,1),(82,0,2,82,1),(83,0,3,83,2),(84,0,4,84,2),(85,0,3,85,1),(86,0,2,86,2),(87,0,4,87,1),(88,0,5,88,2),(89,0,5,89,2),(90,0,1,90,1),(91,0,4,91,1),(92,0,3,92,1),(93,0,2,93,1),(94,0,1,94,1),(95,0,5,95,1),(96,0,3,96,1),(97,0,2,97,1),(98,0,4,98,2),(99,0,2,99,1),(100,0,4,100,2);
/*!40000 ALTER TABLE `resource_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `seriousness` varchar(255) NOT NULL,
  `topic_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_aojatoh2ykivd0ukh09f4mn11` (`topic_id`),
  KEY `FK_tq3cq3gmsss8jjyb2l5sb1o6k` (`user_id`),
  CONSTRAINT `FK_aojatoh2ykivd0ukh09f4mn11` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`),
  CONSTRAINT `FK_tq3cq3gmsss8jjyb2l5sb1o6k` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
INSERT INTO `subscription` VALUES (1,0,'2015-03-25 09:55:41','SERIOUS',1,1),(2,0,'2015-03-25 09:55:41','SERIOUS',2,1),(3,0,'2015-03-25 09:55:41','SERIOUS',3,1),(4,0,'2015-03-25 09:55:41','SERIOUS',4,1),(5,0,'2015-03-25 09:55:41','SERIOUS',5,1),(6,0,'2015-03-25 09:55:42','SERIOUS',6,2),(7,0,'2015-03-25 09:55:42','SERIOUS',7,2),(8,0,'2015-03-25 09:55:42','SERIOUS',8,2),(9,0,'2015-03-25 09:55:42','SERIOUS',9,2),(10,0,'2015-03-25 09:55:42','SERIOUS',10,2);
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `created_by_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `visibility` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`created_by_id`,`name`),
  CONSTRAINT `FK_gjh72tiq1cjg5r46kkx5jkghh` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,11,1,'2015-03-25 09:55:41','2015-03-25 09:55:44','java3','PUBLIC'),(2,11,1,'2015-03-25 09:55:41','2015-03-25 09:55:45','java2','PUBLIC'),(3,11,1,'2015-03-25 09:55:41','2015-03-25 09:55:46','java5','PRIVATE'),(4,11,1,'2015-03-25 09:55:41','2015-03-25 09:55:47','java4','PRIVATE'),(5,11,1,'2015-03-25 09:55:41','2015-03-25 09:55:47','java1','PRIVATE'),(6,11,2,'2015-03-25 09:55:42','2015-03-25 09:55:48','Grails1','PRIVATE'),(7,11,2,'2015-03-25 09:55:42','2015-03-25 09:55:49','Grails4','PRIVATE'),(8,11,2,'2015-03-25 09:55:42','2015-03-25 09:55:50','Grails5','PRIVATE'),(9,11,2,'2015-03-25 09:55:42','2015-03-25 09:55:51','Grails2','PUBLIC'),(10,11,2,'2015-03-25 09:55:42','2015-03-25 09:55:51','Grails3','PUBLIC');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `active` bit(1) NOT NULL,
  `admin` bit(1) NOT NULL,
  `date_created` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `last_updated` datetime NOT NULL,
  `password` varchar(15) NOT NULL,
  `photo` tinyblob NOT NULL,
  `user_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`),
  UNIQUE KEY `UK_lqjrcobrh9jc8wpcar64q1bfh` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,52,'','','2015-03-25 09:55:41','abcuser1@gmail.com','user1','Kashyap','2015-03-25 09:56:06','12345678','','user1'),(2,56,'','','2015-03-25 09:55:41','abcuser2@gmail.com','user2','Kashyap','2015-03-25 09:56:06','12345678','','user2');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-30 12:59:12
