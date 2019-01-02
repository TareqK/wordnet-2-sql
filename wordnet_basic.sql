-- MySQL dump 10.16  Distrib 10.1.34-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: arabic_oneline
-- ------------------------------------------------------
-- Server version	10.1.34-MariaDB-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `LexicalEntry`
--

DROP TABLE IF EXISTS `LexicalEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LexicalEntry` (
  `id` varchar(100) NOT NULL,
  `writtenForm` varchar(100) DEFAULT NULL,
  `partOfSpeech` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LexicalEntry`
--

LOCK TABLES `LexicalEntry` WRITE;
/*!40000 ALTER TABLE `LexicalEntry` DISABLE KEYS */;
/*!40000 ALTER TABLE `LexicalEntry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sense`
--

DROP TABLE IF EXISTS `Sense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sense` (
  `LexicalEntryId` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `SynsetId` varchar(100) NOT NULL,
  KEY `Sense_LexicalEntry_FK` (`LexicalEntryId`),
  KEY `Sense_Synset_FK` (`SynsetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sense`
--

LOCK TABLES `Sense` WRITE;
/*!40000 ALTER TABLE `Sense` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Synset`
--

DROP TABLE IF EXISTS `Synset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Synset` (
  `id` varchar(100) NOT NULL,
  `baseConcept` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Synset`
--

LOCK TABLES `Synset` WRITE;
/*!40000 ALTER TABLE `Synset` DISABLE KEYS */;
/*!40000 ALTER TABLE `Synset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SynsetRelation`
--

DROP TABLE IF EXISTS `SynsetRelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SynsetRelation` (
  `sourceSynset` varchar(100) DEFAULT NULL,
  `targetSynset` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  KEY `SynsetRelation_Synset_FK` (`sourceSynset`),
  KEY `SynsetRelation_Synset_FK_2` (`targetSynset`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SynsetRelation`
--

LOCK TABLES `SynsetRelation` WRITE;
/*!40000 ALTER TABLE `SynsetRelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `SynsetRelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'arabic_oneline'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-03  0:59:12
