CREATE DATABASE  IF NOT EXISTS `animestreaming`;
USE `animestreaming`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: animestreaming
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `genre`
--



DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `genre` varchar(20) NOT NULL,
  `is_safe` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`genre`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES ('action',1);
INSERT INTO `genre` VALUES ('ecchi',0);
INSERT INTO `genre` VALUES ('romance',1);
INSERT INTO `genre` VALUES ('slice of life',1);
INSERT INTO `genre` VALUES ('thriller',1);
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anime`
--

DROP TABLE IF EXISTS `anime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anime` (
  `anime_name` varchar(50) NOT NULL,
  `release_date` date DEFAULT NULL,
  `genre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`anime_name`),
  KEY `genre` (`genre`),
  CONSTRAINT `anime_ibfk_1` FOREIGN KEY (`genre`) REFERENCES `genre` (`genre`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anime`
--

LOCK TABLES `anime` WRITE;
/*!40000 ALTER TABLE `anime` DISABLE KEYS */;
INSERT INTO `anime` VALUES ('Boku no Hero Academia','2016-03-17','action');
INSERT INTO `anime` VALUES ('I want to eat your Pancreas','2016-03-13','romance');
INSERT INTO `anime` VALUES ('Kanojo, Okarishimasu','2020-12-01','romance');
INSERT INTO `anime` VALUES ('Koe no Katachi','2017-05-27','romance');
INSERT INTO `anime` VALUES ('My Neighbour Totoro','2010-05-17','slice of life');
INSERT INTO `anime` VALUES ('Naruto','2020-10-01','action');
INSERT INTO `anime` VALUES ('One Piece','2020-10-01','action');
INSERT INTO `anime` VALUES ('Promised Neverland','2017-08-01','thriller');
INSERT INTO `anime` VALUES ('Seven Deadly Sins','2015-06-01','ecchi');
INSERT INTO `anime` VALUES ('Shingeki no Kyojin','2020-11-01','action');
INSERT INTO `anime` VALUES ('Weathering with You','2019-10-23','romance');
INSERT INTO `anime` VALUES ('Your Name','2017-07-23','romance');
INSERT INTO `anime` VALUES ('The Wind Rises', '2016-04-01', 'romance');
/*!40000 ALTER TABLE `anime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL,
  `text` varchar(150) DEFAULT NULL,
  `video_link` varchar(100),
  PRIMARY KEY (`id`),
  KEY `video_link` (`video_link`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`video_link`) REFERENCES `video` (`video_link`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (61715,'that was awesome x3', 'https://docs.google.com/file/d/1htF1FKbogQysfMtaMrx6q7wsFaw_zV3V/');
INSERT INTO `comment` VALUES (71871,'unbelievable, just wait until the moment were the main character *spoiler* dies!', 'https://mega.nz/folder/IGQERIwS#Em7of1oODVDXIe_jJjOCcA/file/1XBnEBrZ');
INSERT INTO `comment` VALUES (96447,'horrible dont watch', 'https://mega.nz/folder/IGQERIwS#Em7of1oODVDXIe_jJjOCcA/file/1XBnEBrZ');
INSERT INTO `comment` VALUES (98765,'be rich quick now at sus.s/661', 'rent_a_girlfriend.jpg');
INSERT INTO `comment` VALUES (514865,'first!! haha', 'https://docs.google.com/file/d/1htF1FKbogQysfMtaMrx6q7wsFaw_zV3V/');
INSERT INTO `comment` VALUES (92948, 'would watch again xD', 'https://mega.nz/folder/IGQERIwS#Em7of1oODVDXIe_jJjOCcA/file/cOAlnBwa');
INSERT INTO `comment` VALUES (92248, 'but luffy isn\'t a monkey', 'https://mega.nz/folder/IGQERIwS#Em7of1oODVDXIe_jJjOCcA/file/cOAlnBwa');
INSERT INTO `comment` VALUES (92348, 'hahha zoro so hot', 'https://mega.nz/folder/IGQERIwS#Em7of1oODVDXIe_jJjOCcA/file/cOAlnBwa');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_contains`
--

DROP TABLE IF EXISTS `comment_contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_contains` (
  `comment_id` int DEFAULT NULL,
  `subcomment_id` int NOT NULL,
  PRIMARY KEY (`subcomment_id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_contains`
--

LOCK TABLES `comment_contains` WRITE;
/*!40000 ALTER TABLE `comment_contains` DISABLE KEYS */;
INSERT INTO `comment_contains` VALUES (514865,98765);
/*!40000 ALTER TABLE `comment_contains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series` (
  `anime_name` varchar(50) NOT NULL,
  `num_eps` int DEFAULT NULL,
  PRIMARY KEY (`anime_name`),
  CONSTRAINT `series_ibfk_1` FOREIGN KEY (`anime_name`) REFERENCES `anime` (`anime_name`) ON DELETE CASCADE
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES ('Boku no Hero Academia',64);
INSERT INTO `series` VALUES ('Kanojo, Okarishimasu',12);
INSERT INTO `series` VALUES ('Naruto',225);
INSERT INTO `series` VALUES ('One Piece',999);
INSERT INTO `series` VALUES ('Shingeki no Kyojin',24);
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `server` (
  `server_link` varchar(50) NOT NULL,
  `sname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`server_link`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
INSERT INTO `server` VALUES ('ani.me','ani');
INSERT INTO `server` VALUES ('animemovies.io','animemovies');
INSERT INTO `server` VALUES ('moviehoster.com','moviehoster');
INSERT INTO `server` VALUES ('notsketchy.com','notsketchy');
INSERT INTO `server` VALUES ('streamanime.com','streamanime');
INSERT INTO `server` VALUES ('superhosty.me','superhosty');
INSERT INTO `server` VALUES ('luckyanime.io', 'luckyanime');
/*!40000 ALTER TABLE `server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subtitle_source`
--

DROP TABLE IF EXISTS `subtitle_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subtitle_source` (
  `source_name` varchar(20) NOT NULL,
  `sub_language` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`source_name`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subtitle_source`
--

LOCK TABLES `subtitle_source` WRITE;
/*!40000 ALTER TABLE `subtitle_source` DISABLE KEYS */;
INSERT INTO `subtitle_source` VALUES ('accuratesubs.net','Russian');
INSERT INTO `subtitle_source` VALUES ('moviesubtitles.io','English');
INSERT INTO `subtitle_source` VALUES ('russiansubs.net','Russian');
INSERT INTO `subtitle_source` VALUES ('superdupersub.io','English');
INSERT INTO `subtitle_source` VALUES ('topsubs.com','English');
INSERT INTO `subtitle_source` VALUES ('wowsubs.me','Spanish');
/*!40000 ALTER TABLE `subtitle_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subtitles`
--

DROP TABLE IF EXISTS `subtitles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subtitles` (
  `source_name` varchar(20) DEFAULT NULL,
  `sub_id` int NOT NULL,
  `anime_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `source_name` (`source_name`),
  KEY `anime_name` (`anime_name`),
  CONSTRAINT `subtitles_ibfk_1` FOREIGN KEY (`source_name`) REFERENCES `subtitle_source` (`source_name`),
  CONSTRAINT `subtitles_ibfk_2` FOREIGN KEY (`anime_name`) REFERENCES `anime` (`anime_name`) ON DELETE CASCADE
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subtitles`
--

LOCK TABLES `subtitles` WRITE;
/*!40000 ALTER TABLE `subtitles` DISABLE KEYS */;
INSERT INTO `subtitles` VALUES ('topsubs.com',16764,'Boku no Hero Academia');
INSERT INTO `subtitles` VALUES ('superdupersub.io',46176,'Naruto');
INSERT INTO `subtitles` VALUES ('moviesubtitles.io',53151,'Shingeki no Kyojin');
INSERT INTO `subtitles` VALUES ('wowsubs.me',65716,'Seven Deadly Sins');
INSERT INTO `subtitles` VALUES ('russiansubs.net',68641,'Naruto');
INSERT INTO `subtitles` VALUES ('russiansubs.net',86434,'One Piece');
/*!40000 ALTER TABLE `subtitles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `email` varchar(30) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `user_name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('bosslo@live.ca','password','weird_man');
INSERT INTO `user` VALUES ('felixlei@hotmail.com','felixlei','felixl');
INSERT INTO `user` VALUES ('hackerman@gmail.com','Sup%3secret99','NormalGuy');
INSERT INTO `user` VALUES ('srah99@haha.net','aiko56','sarahrofl');
INSERT INTO `user` VALUES ('tristan@simp.com','iamasimp123','simpmaster');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `video_link` varchar(100) NOT NULL,
  `length` int DEFAULT NULL,
  `server_link` varchar(50) NOT NULL,
  PRIMARY KEY (`video_link`),
  KEY `server_link` (`server_link`),
  CONSTRAINT `video_ibfk_1` FOREIGN KEY (`server_link`) REFERENCES `server` (`server_link`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES ('ani.me/6316',24,'ani.me');
INSERT INTO `video` VALUES ('animemovies.io/162koe',95,'animemovies.io');
INSERT INTO `video` VALUES ('animemovies.io/615pancreas',90,'animemovies.io');
INSERT INTO `video` VALUES ('moviehoster.com/1523',90,'moviehoster.com');
INSERT INTO `video` VALUES ('moviehoster.com/653',90,'moviehoster.com');
INSERT INTO `video` VALUES ('notksetchy.com/533',24,'notsketchy.com');
INSERT INTO `video` VALUES ('streamanime.com/134',12,'streamanime.com');
INSERT INTO `video` VALUES ('superhosty.me/163',24,'superhosty.me');
INSERT INTO `video` VALUES ('superhosty.me/209',24,'superhosty.me');
INSERT INTO `video` VALUES ('superhosty.me/361',24,'superhosty.me');
INSERT INTO `video` VALUES ('superhosty.me/456',24,'superhosty.me');
INSERT INTO `video` VALUES ('superhosty.me/789',24,'superhosty.me');
INSERT INTO `video` VALUES ('superhosty.me/totoro',90,'superhosty.me');
INSERT INTO `video` VALUES ('my_hero_academia.jpg', 45, 'luckyanime.io');
INSERT INTO `video` VALUES ('https://docs.google.com/file/d/1jaa1IsXLC6A7gOk0w5vmVoAo3nuUw0ar/', 23, 'luckyanime.io');
INSERT INTO `video` VALUES ('https://docs.google.com/file/d/191NHXux9maAozP-wTvQ6nBfjbsce9rsF/', 23, 'luckyanime.io');
INSERT INTO `video` VALUES ('https://docs.google.com/file/d/1WXLWw0kQ0sL6y89vZu8gY5XkgoyYiwvU/', 23, 'luckyanime.io');
INSERT INTO `video` VALUES ('https://docs.google.com/file/d/1dpQ0nXtEeR8Gw6WviFKF57-AzpmcfVrI/', 23, 'luckyanime.io');
INSERT INTO `video` VALUES ('https://docs.google.com/file/d/1htF1FKbogQysfMtaMrx6q7wsFaw_zV3V/', 23, 'luckyanime.io');
INSERT INTO `video` VALUES ('https://docs.google.com/file/d/1zkwVeB-8pa9SW8IQ0XBJX6NpmY8v8MwQ/', 23, 'luckyanime.io');
INSERT INTO `video` VALUES ('one_piece.jpg', 24, 'luckyanime.io');
INSERT INTO `video` VALUES ('https://mega.nz/folder/IGQERIwS#Em7of1oODVDXIe_jJjOCcA/file/seY2BYTK', 24, 'luckyanime.io');
INSERT INTO `video` VALUES ('https://mega.nz/folder/IGQERIwS#Em7of1oODVDXIe_jJjOCcA/file/cOAlnBwa', 24, 'luckyanime.io');
INSERT INTO `video` VALUES ('https://mega.nz/folder/IGQERIwS#Em7of1oODVDXIe_jJjOCcA/file/4fphWK4I', 24, 'luckyanime.io');
INSERT INTO `video` VALUES ('https://mega.nz/folder/IGQERIwS#Em7of1oODVDXIe_jJjOCcA/file/9WgSAYQR', 24, 'luckyanime.io');
INSERT INTO `video` VALUES ('https://mega.nz/folder/IGQERIwS#Em7of1oODVDXIe_jJjOCcA/file/YT4wiQZT', 24, 'luckyanime.io');
INSERT INTO `video` VALUES ('https://mega.nz/folder/IGQERIwS#Em7of1oODVDXIe_jJjOCcA/file/1XBnEBrZ', 24, 'luckyanime.io');
INSERT INTO `video` VALUES ('rent_a_girlfriend.jpg', 31, 'luckyanime.io');
INSERT INTO `video` VALUES ('naruto.jpg', 25, 'luckyanime.io');
INSERT INTO `video` VALUES ('snk.jpg', 28, 'luckyanime.io');
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `discusses_comment`
--

DROP TABLE IF EXISTS `discusses_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discusses_comment` (
  `comment_id` int NOT NULL,
  `video_link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `video_link` (`video_link`),
  CONSTRAINT `discusses_comment_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`),
  CONSTRAINT `discusses_comment_ibfk_2` FOREIGN KEY (`video_link`) REFERENCES `video` (`video_link`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discusses_comment`
--

LOCK TABLES `discusses_comment` WRITE;
/*!40000 ALTER TABLE `discusses_comment` DISABLE KEYS */;
INSERT INTO `discusses_comment` VALUES (61715,'moviehoster.com/653');
INSERT INTO `discusses_comment` VALUES (71871,'superhosty.me/163');
INSERT INTO `discusses_comment` VALUES (98765,'superhosty.me/456');
INSERT INTO `discusses_comment` VALUES (96447,'superhosty.me/789');
INSERT INTO `discusses_comment` VALUES (514865,'superhosty.me/totoro');
/*!40000 ALTER TABLE `discusses_comment` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `has_episode`
--

DROP TABLE IF EXISTS `has_episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `has_episode` (
  `number` int NOT NULL,
  `anime_name` varchar(50) NOT NULL,
  `video_link` varchar(100) NOT NULL,
  PRIMARY KEY (`number`,`anime_name`,`video_link`),
  KEY `anime_name` (`anime_name`),
  KEY `video_link` (`video_link`),
  CONSTRAINT `has_episode_ibfk_1` FOREIGN KEY (`anime_name`) REFERENCES `anime` (`anime_name`) ON DELETE CASCADE,
  CONSTRAINT `has_episode_ibfk_2` FOREIGN KEY (`video_link`) REFERENCES `video` (`video_link`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `anime_name` varchar(50) NOT NULL,
  `video_link` varchar(100) NOT NULL,
  PRIMARY KEY (`anime_name`,`video_link`),
  KEY `video_link` (`video_link`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`anime_name`) REFERENCES `anime` (`anime_name`) ON DELETE CASCADE,
  CONSTRAINT `movie_ibfk_2` FOREIGN KEY (`video_link`) REFERENCES `video` (`video_link`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES ('Koe no Katachi','animemovies.io/162koe');
INSERT INTO `movie` VALUES ('I want to eat your Pancreas','animemovies.io/615pancreas');
INSERT INTO `movie` VALUES ('Your Name','moviehoster.com/1523');
INSERT INTO `movie` VALUES ('Weathering With You','moviehoster.com/653');
INSERT INTO `movie` VALUES ('My Neighbour Totoro','superhosty.me/totoro');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Dumping data for table `has_episode`
--

LOCK TABLES `has_episode` WRITE;
/*!40000 ALTER TABLE `has_episode` DISABLE KEYS */;
INSERT INTO `has_episode` VALUES (1,'Boku no Hero Academia','https://docs.google.com/file/d/1jaa1IsXLC6A7gOk0w5vmVoAo3nuUw0ar/');
INSERT INTO `has_episode` VALUES (2,'Boku no Hero Academia','https://docs.google.com/file/d/191NHXux9maAozP-wTvQ6nBfjbsce9rsF/');
INSERT INTO `has_episode` VALUES (3,'Boku no Hero Academia','https://docs.google.com/file/d/1WXLWw0kQ0sL6y89vZu8gY5XkgoyYiwvU/');
INSERT INTO `has_episode` VALUES (4,'Boku no Hero Academia','https://docs.google.com/file/d/1dpQ0nXtEeR8Gw6WviFKF57-AzpmcfVrI/');
INSERT INTO `has_episode` VALUES (5,'Boku no Hero Academia','https://docs.google.com/file/d/1htF1FKbogQysfMtaMrx6q7wsFaw_zV3V/');
INSERT INTO `has_episode` VALUES (6,'Boku no Hero Academia','https://docs.google.com/file/d/1zkwVeB-8pa9SW8IQ0XBJX6NpmY8v8MwQ/');
INSERT INTO `has_episode` VALUES (7,'Boku no Hero Academia','my_hero_academia.jpg');
INSERT INTO `has_episode` VALUES (8,'Boku no Hero Academia','my_hero_academia.jpg');
INSERT INTO `has_episode` VALUES (9,'Boku no Hero Academia','my_hero_academia.jpg');
INSERT INTO `has_episode` VALUES (10,'Boku no Hero Academia','my_hero_academia.jpg');
INSERT INTO `has_episode` VALUES (11,'Boku no Hero Academia','my_hero_academia.jpg');
INSERT INTO `has_episode` VALUES (12,'Boku no Hero Academia','my_hero_academia.jpg');
INSERT INTO `has_episode` VALUES (13,'Boku no Hero Academia','my_hero_academia.jpg');
INSERT INTO `has_episode` VALUES (14,'Boku no Hero Academia','my_hero_academia.jpg');
INSERT INTO `has_episode` VALUES (15,'Boku no Hero Academia','my_hero_academia.jpg');
INSERT INTO `has_episode` VALUES (16,'Boku no Hero Academia','my_hero_academia.jpg');
INSERT INTO `has_episode` VALUES (17,'Boku no Hero Academia','my_hero_academia.jpg');
INSERT INTO `has_episode` VALUES (18,'Boku no Hero Academia','my_hero_academia.jpg');
INSERT INTO `has_episode` VALUES (19,'Boku no Hero Academia','my_hero_academia.jpg');
INSERT INTO `has_episode` VALUES (20,'Boku no Hero Academia','my_hero_academia.jpg');
INSERT INTO `has_episode` VALUES (21,'Boku no Hero Academia','my_hero_academia.jpg');
INSERT INTO `has_episode` VALUES (22,'Boku no Hero Academia','my_hero_academia.jpg');
INSERT INTO `has_episode` VALUES (23,'Boku no Hero Academia','my_hero_academia.jpg');
INSERT INTO `has_episode` VALUES (24,'Boku no Hero Academia','my_hero_academia.jpg');
INSERT INTO `has_episode` VALUES (25,'Boku no Hero Academia','my_hero_academia.jpg');
INSERT INTO `has_episode` VALUES (26,'Boku no Hero Academia','my_hero_academia.jpg');
INSERT INTO `has_episode` VALUES (27,'Boku no Hero Academia','my_hero_academia.jpg');
INSERT INTO `has_episode` VALUES (28,'Boku no Hero Academia','my_hero_academia.jpg');
INSERT INTO `has_episode` VALUES (29,'Boku no Hero Academia','my_hero_academia.jpg');
INSERT INTO `has_episode` VALUES (1,'Kanojo, Okarishimasu','rent_a_girlfriend.jpg');
INSERT INTO `has_episode` VALUES (2,'Kanojo, Okarishimasu','rent_a_girlfriend.jpg');
INSERT INTO `has_episode` VALUES (3,'Kanojo, Okarishimasu','rent_a_girlfriend.jpg');
INSERT INTO `has_episode` VALUES (4,'Kanojo, Okarishimasu','rent_a_girlfriend.jpg');
INSERT INTO `has_episode` VALUES (5,'Kanojo, Okarishimasu','rent_a_girlfriend.jpg');
INSERT INTO `has_episode` VALUES (6,'Kanojo, Okarishimasu','rent_a_girlfriend.jpg');
INSERT INTO `has_episode` VALUES (7,'Kanojo, Okarishimasu','rent_a_girlfriend.jpg');
INSERT INTO `has_episode` VALUES (8,'Kanojo, Okarishimasu','rent_a_girlfriend.jpg');
INSERT INTO `has_episode` VALUES (9,'Kanojo, Okarishimasu','rent_a_girlfriend.jpg');
INSERT INTO `has_episode` VALUES (10,'Kanojo, Okarishimasu','rent_a_girlfriend.jpg');
INSERT INTO `has_episode` VALUES (11,'Kanojo, Okarishimasu','rent_a_girlfriend.jpg');
INSERT INTO `has_episode` VALUES (12,'Kanojo, Okarishimasu','rent_a_girlfriend.jpg');
INSERT INTO `has_episode` VALUES (13,'Kanojo, Okarishimasu','rent_a_girlfriend.jpg');
INSERT INTO `has_episode` VALUES (1,'Naruto','naruto.jpg');
INSERT INTO `has_episode` VALUES (2,'Naruto','naruto.jpg');
INSERT INTO `has_episode` VALUES (3,'Naruto','naruto.jpg');
INSERT INTO `has_episode` VALUES (4,'Naruto','naruto.jpg');
INSERT INTO `has_episode` VALUES (5,'Naruto','naruto.jpg');
INSERT INTO `has_episode` VALUES (6,'Naruto','naruto.jpg');
INSERT INTO `has_episode` VALUES (7,'Naruto','naruto.jpg');
INSERT INTO `has_episode` VALUES (8,'Naruto','naruto.jpg');
INSERT INTO `has_episode` VALUES (9,'Naruto','naruto.jpg');
INSERT INTO `has_episode` VALUES (10,'Naruto','naruto.jpg');
INSERT INTO `has_episode` VALUES (1,'One Piece','https://mega.nz/folder/IGQERIwS#Em7of1oODVDXIe_jJjOCcA/file/seY2BYTK');
INSERT INTO `has_episode` VALUES (2,'One Piece','https://mega.nz/folder/IGQERIwS#Em7of1oODVDXIe_jJjOCcA/file/cOAlnBwa');
INSERT INTO `has_episode` VALUES (3,'One Piece','https://mega.nz/folder/IGQERIwS#Em7of1oODVDXIe_jJjOCcA/file/4fphWK4I');
INSERT INTO `has_episode` VALUES (4,'One Piece','https://mega.nz/folder/IGQERIwS#Em7of1oODVDXIe_jJjOCcA/file/9WgSAYQR');
INSERT INTO `has_episode` VALUES (5,'One Piece','https://mega.nz/folder/IGQERIwS#Em7of1oODVDXIe_jJjOCcA/file/YT4wiQZT');
INSERT INTO `has_episode` VALUES (6,'One Piece','https://mega.nz/folder/IGQERIwS#Em7of1oODVDXIe_jJjOCcA/file/1XBnEBrZ');
INSERT INTO `has_episode` VALUES (7,'One Piece','one_piece.jpg');
INSERT INTO `has_episode` VALUES (8,'One Piece','one_piece.jpg');
INSERT INTO `has_episode` VALUES (9,'One Piece','one_piece.jpg');
INSERT INTO `has_episode` VALUES (10,'One Piece','one_piece.jpg');
INSERT INTO `has_episode` VALUES (11,'One Piece','one_piece.jpg');
INSERT INTO `has_episode` VALUES (12,'One Piece','one_piece.jpg');
INSERT INTO `has_episode` VALUES (1,'Shingeki no Kyojin','snk.jpg');
INSERT INTO `has_episode` VALUES (2,'Shingeki no Kyojin','snk.jpg');
INSERT INTO `has_episode` VALUES (3,'Shingeki no Kyojin','snk.jpg');
INSERT INTO `has_episode` VALUES (4,'Shingeki no Kyojin','snk.jpg');
INSERT INTO `has_episode` VALUES (5,'Shingeki no Kyojin','snk.jpg');
INSERT INTO `has_episode` VALUES (6,'Shingeki no Kyojin','snk.jpg');
INSERT INTO `has_episode` VALUES (7,'Shingeki no Kyojin','snk.jpg');
INSERT INTO `has_episode` VALUES (8,'Shingeki no Kyojin','snk.jpg');
INSERT INTO `has_episode` VALUES (9,'Shingeki no Kyojin','snk.jpg');
INSERT INTO `has_episode` VALUES (10,'Shingeki no Kyojin','snk.jpg');
INSERT INTO `has_episode` VALUES (11,'Shingeki no Kyojin','snk.jpg');
INSERT INTO `has_episode` VALUES (12,'Shingeki no Kyojin','snk.jpg');
INSERT INTO `has_episode` VALUES (13,'Shingeki no Kyojin','snk.jpg');
INSERT INTO `has_episode` VALUES (14,'Shingeki no Kyojin','snk.jpg');
/*!40000 ALTER TABLE `has_episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watches`
--

DROP TABLE IF EXISTS `watches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watches` (
  `anime_name` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `video_link` varchar(100) NOT NULL,
  `number` int DEFAULT NULL,
  PRIMARY KEY (`anime_name`,`email`,`video_link`),
  KEY `email` (`email`),
  KEY `number` (`number`,`anime_name`,`video_link`),
  CONSTRAINT `watches_ibfk_1` FOREIGN KEY (`email`) REFERENCES `user` (`email`) ON UPDATE CASCADE,
  CONSTRAINT `watches_ibfk_2` FOREIGN KEY (`number`, `anime_name`, `video_link`) REFERENCES `has_episode` (`number`, `anime_name`, `video_link`) ON DELETE CASCADE
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watches`
--

LOCK TABLES `watches` WRITE;
/*!40000 ALTER TABLE `watches` DISABLE KEYS */;
INSERT INTO `watches` VALUES ('My Neighbour Totoro','hackerman@gmail.com','totoro.jpg',NULL);
INSERT INTO `watches` VALUES ('Boku no Hero Academia','tristan@simp.com','https://docs.google.com/file/d/1htF1FKbogQysfMtaMrx6q7wsFaw_zV3V/',5);
INSERT INTO `watches` VALUES ('Kanojo, Okarishimasu','srah99@haha.net','rent_a_girlfriend.jpg',1);
INSERT INTO `watches` VALUES ('Naruto','bosslo@live.ca','naruto.jpg',125);
INSERT INTO `watches` VALUES ('One Piece','felixlei@hotmail.com','https://mega.nz/folder/IGQERIwS#Em7of1oODVDXIe_jJjOCcA/file/4fphWK4I',3);
INSERT INTO `watches` VALUES ('Boku no Hero Academia','felixlei@hotmail.com','https://docs.google.com/file/d/1htF1FKbogQysfMtaMrx6q7wsFaw_zV3V/',5);
INSERT INTO `watches` VALUES ('Naruto','felixlei@hotmail.com','naruto.jpg',7);
INSERT INTO `watches` VALUES ('Shingeki no Kyojin','felixlei@hotmail.com','snk.jpg',3);
/*!40000 ALTER TABLE `watches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `writes_comment`
--

DROP TABLE IF EXISTS `writes_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `writes_comment` (
  `email` varchar(30) NOT NULL,
  `comment_id` int NOT NULL,
  `time_posted` datetime DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `email` (`email`),
  CONSTRAINT `writes_comment_ibfk_1` FOREIGN KEY (`email`) REFERENCES `user` (`email`) ON UPDATE CASCADE,
  CONSTRAINT `writes_comment_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `writes_comment`
--

LOCK TABLES `writes_comment` WRITE;
/*!40000 ALTER TABLE `writes_comment` DISABLE KEYS */;
INSERT INTO `writes_comment` VALUES ('tristan@simp.com',61715,'2020-01-03 13:23:05');
INSERT INTO `writes_comment` VALUES ('srah99@haha.net',71871,'2020-02-03 15:43:25');
INSERT INTO `writes_comment` VALUES ('felixlei@hotmail.com',96447,'2020-04-30 00:35:21');
INSERT INTO `writes_comment` VALUES ('bosslo@live.ca',98765,'2019-12-03 22:05:12');
INSERT INTO `writes_comment` VALUES ('hackerman@gmail.com',514865,'2020-06-01 00:00:00');
/*!40000 ALTER TABLE `writes_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `writes_review`
--

DROP TABLE IF EXISTS `writes_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `writes_review` (
  `review_id` int NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `anime_name` varchar(50) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `text` varchar(150) DEFAULT NULL,
  `time_created` datetime DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `email` (`email`),
  KEY `anime_name` (`anime_name`),
  CONSTRAINT `writes_review_ibfk_1` FOREIGN KEY (`email`) REFERENCES `user` (`email`) ON UPDATE CASCADE,
  CONSTRAINT `writes_review_ibfk_2` FOREIGN KEY (`anime_name`) REFERENCES `anime` (`anime_name`) ON DELETE CASCADE,
  CONSTRAINT `writes_review_chk_1` CHECK ((`rating` between 0 and 5))
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `writes_review`
--

LOCK TABLES `writes_review` WRITE;
/*!40000 ALTER TABLE `writes_review` DISABLE KEYS */;
INSERT INTO `writes_review` VALUES (5345,'srah99@haha.net','Kanojo, Okarishimasu',4,'mind blowin!','2019-11-03 23:05:12');
INSERT INTO `writes_review` VALUES (7115,'bosslo@live.ca','Naruto',5,'rofl so good','2020-03-03 15:31:05');
INSERT INTO `writes_review` VALUES (7245,'felixlei@hotmail.com','One Piece',3,'terrible anime','2020-04-03 15:22:25');
INSERT INTO `writes_review` VALUES (7246,'felixlei@hotmail.com','Naruto',1,'even worse than one piece','2020-04-03 15:25:25');
INSERT INTO `writes_review` VALUES (8136,'hackerman@gmail.com','My Neighbour Totoro',1,'haha kinda funny haha','2020-06-30 02:39:21');
INSERT INTO `writes_review` VALUES (8425,'tristan@simp.com','Weathering With You',2,'I learned how to make 15000 this year!! sus.s/156','2020-06-02 00:00:00');
/*!40000 ALTER TABLE `writes_review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-11 16:27:42
