-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: localhost    Database: electronicvoting
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `elections`
--

DROP TABLE IF EXISTS `elections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elections` (
  `election_id` int(11) NOT NULL AUTO_INCREMENT,
  `election_name` varchar(45) DEFAULT NULL,
  `election_choice1` varchar(45) DEFAULT NULL,
  `election_choice2` varchar(45) DEFAULT NULL,
  `election_votes1` int(11) DEFAULT '0',
  `election_votes2` int(11) DEFAULT '0',
  `election_totalvotes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`election_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elections`
--

LOCK TABLES `elections` WRITE;
/*!40000 ALTER TABLE `elections` DISABLE KEYS */;
INSERT INTO `elections` VALUES (5,'Election 1','Choice 1/1','Choice 1/2',1,1,2),(6,'Election 2','Choice 2/1','Choice 2/2',2,0,2),(7,'Election 3','Choice 3/1','Choice 3/2',2,0,2);
/*!40000 ALTER TABLE `elections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elections_votes`
--

DROP TABLE IF EXISTS `elections_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elections_votes` (
  `voteid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `election_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`voteid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elections_votes`
--

LOCK TABLES `elections_votes` WRITE;
/*!40000 ALTER TABLE `elections_votes` DISABLE KEYS */;
INSERT INTO `elections_votes` VALUES (10,15,5,'2015-04-14 21:08:18'),(11,16,5,'2015-04-14 21:08:25'),(12,15,6,'2015-04-14 21:08:59'),(13,16,6,'2015-04-14 21:08:59'),(14,15,7,'2015-04-14 21:09:06'),(15,16,7,'2015-04-14 21:09:08');
/*!40000 ALTER TABLE `elections_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_roles_id` int(11) NOT NULL AUTO_INCREMENT,
  `authority` varchar(45) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_roles_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (2,'ROLE_ADMIN',15),(4,'ROLE_USER',NULL),(5,'ROLE_USER',16);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (15,'p@p.com','$2a$10$XVlenITs7HwOqsGodJKFK.M9xoFRwvNaTKXoi3HfJ7R5gIADzUyie',1),(16,'p2@p2.com','$2a$10$.6TCzDx/3VsZhlGjybTZpewOQ45p81Qo6CC3/WjDCXAhem44vPEMO',1);
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

-- Dump completed on 2015-04-15 14:56:12
