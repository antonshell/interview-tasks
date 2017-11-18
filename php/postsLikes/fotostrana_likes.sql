-- MySQL dump 10.16  Distrib 10.1.16-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: fotostrana_likes
-- ------------------------------------------------------
-- Server version	10.1.16-MariaDB

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Sit odit.'),(2,'Id et tempore.'),(3,'Nihil maxime.'),(4,'Id ex earum.'),(5,'Excepturi qui aut.');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like`
--

DROP TABLE IF EXISTS `like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `like` (
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`post_id`),
  KEY `fk_like_post_id_idx` (`post_id`),
  CONSTRAINT `fk_like_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_like_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
INSERT INTO `like` VALUES (1,1),(1,3),(1,4),(1,7),(1,9),(1,16),(1,17),(1,18),(1,20),(1,22),(1,24),(2,2),(2,6),(2,9),(2,14),(2,15),(2,18),(2,22),(2,23),(2,24),(2,25),(3,2),(3,5),(3,6),(3,9),(3,11),(3,15),(3,18),(3,19),(3,22),(3,25),(4,1),(4,3),(4,5),(4,7),(4,13),(4,16),(4,17),(4,19),(4,20),(4,24),(5,1),(5,3),(5,4),(5,7),(5,8),(5,11),(5,12),(5,13),(5,14),(5,21),(6,3),(6,5),(6,6),(6,8),(6,9),(6,18),(6,19),(6,20),(6,23),(6,25),(7,4),(7,10),(7,14),(7,16),(7,17),(7,18),(7,19),(7,20),(7,23),(7,25),(8,3),(8,6),(8,7),(8,14),(8,16),(8,17),(8,21),(8,22),(8,23),(8,25),(9,3),(9,6),(9,11),(9,12),(9,13),(9,15),(9,18),(9,23),(9,24),(9,25),(10,3),(10,5),(10,7),(10,11),(10,12),(10,13),(10,16),(10,17),(10,18),(10,19),(11,1),(11,5),(11,10),(11,11),(11,12),(11,16),(11,19),(11,21),(11,22),(11,25),(12,3),(12,5),(12,7),(12,10),(12,11),(12,12),(12,14),(12,15),(12,16),(12,19),(13,4),(13,6),(13,8),(13,10),(13,11),(13,12),(13,15),(13,23),(13,24),(13,25),(14,1),(14,4),(14,8),(14,10),(14,11),(14,12),(14,19),(14,22),(14,23),(14,24),(15,1),(15,3),(15,4),(15,7),(15,10),(15,12),(15,13),(15,17),(15,20),(15,24),(16,1),(16,7),(16,12),(16,13),(16,15),(16,17),(16,18),(16,22),(16,23),(16,25),(17,2),(17,4),(17,7),(17,10),(17,11),(17,12),(17,15),(17,20),(17,22),(17,25),(18,2),(18,5),(18,6),(18,10),(18,11),(18,14),(18,15),(18,16),(18,19),(18,24),(19,1),(19,4),(19,12),(19,14),(19,15),(19,16),(19,17),(19,18),(19,20),(19,24),(20,1),(20,2),(20,4),(20,8),(20,13),(20,14),(20,17),(20,18),(20,19),(20,25),(21,3),(21,5),(21,8),(21,9),(21,10),(21,15),(21,17),(21,21),(21,22),(21,25),(22,2),(22,3),(22,4),(22,6),(22,7),(22,8),(22,12),(22,20),(22,21),(22,25),(23,1),(23,5),(23,8),(23,10),(23,13),(23,17),(23,19),(23,20),(23,22),(23,23),(24,3),(24,4),(24,6),(24,8),(24,9),(24,11),(24,13),(24,17),(24,22),(24,23),(25,3),(25,7),(25,8),(25,9),(25,10),(25,11),(25,12),(25,15),(25,18),(25,21);
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1510602380),('m130524_201442_init',1510602622),('m171113_195332_insert_users',1510604210),('m171113_200930_create_categories_table',1510604210),('m171113_201031_create_posts_table',1510605074),('m171113_201921_create_likes_table',1510605233),('m171113_203419_generate_data',1510606451);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_posts_category_id` (`category_id`),
  CONSTRAINT `fk_posts_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'Eos corporis error. 1','Sed voluptatem nam doloremque fugit tempore voluptates.',5),(2,'Rerum repudiandae.','Consequatur distinctio et atque veritatis odio exercitationem omnis.',2),(3,'Aut optio culpa.','Qui et et fuga ipsum non rerum.',5),(4,'Consequatur commodi.','Eveniet porro ut accusamus nihil suscipit a nisi.',2),(5,'Autem nihil nesciunt.','Cupiditate est explicabo rerum voluptas.',2),(6,'Ut aut est.','Et incidunt voluptatem quia et.',1),(7,'Reprehenderit et maxime.','Vitae qui fugit vitae error et ut et aspernatur aut.',4),(8,'Et veritatis.','Velit quas voluptas corporis dignissimos sed dolor.',5),(9,'Dolores qui dolorem.','Ab velit minima nihil aliquam ipsa quasi voluptas.',5),(10,'Sunt veniam.','Enim dolorem nulla repellendus laudantium corrupti ut aut inventore consequatur.',5),(11,'Ea laudantium quidem.','Velit consequatur dolorum est qui aperiam similique.',2),(12,'Error maiores qui.','Nisi cupiditate expedita aut distinctio aut porro libero modi sequi.',1),(13,'Ipsa rerum eum.','Eveniet et quae aut distinctio atque nulla aut in.',3),(14,'Consequatur possimus nesciunt.','Reprehenderit placeat temporibus aut aspernatur dolorem doloribus tenetur id.',4),(15,'Et atque.','Eligendi et expedita beatae qui.',4),(16,'Alias dolores.','Nesciunt beatae omnis veritatis dolores deserunt expedita vel eos.',2),(17,'Temporibus omnis pariatur.','Corrupti velit tempore inventore quia similique ea nemo non alias.',3),(18,'Aut et.','Cum asperiores cumque labore qui quisquam.',4),(19,'Suscipit repudiandae.','Tempora et aut veritatis molestiae qui ea voluptatum dolorum reiciendis.',3),(20,'Velit repellat vel.','Facilis sed molestias sunt vitae.',5),(21,'Vero alias.','Fugit earum sint corrupti distinctio quibusdam blanditiis ut magnam aut.',2),(22,'Vero facilis.','Ipsa debitis quo numquam repellat itaque.',2),(23,'Officiis voluptatum.','Dolorum quod voluptatem ut debitis.',1),(24,'Accusamus culpa.','Animi rerum et aspernatur aut quisquam perferendis.',3),(25,'Aut eius aspernatur.','Qui ducimus est qui qui minima omnis dolores quo exercitationem.',1);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'ewisoky@ryan.net','','$2y$13$9ZrSdA7QU8XSq6N6gMVZhO.AV1qP1sORLMvViL8cbNiYw69NLtPLO',NULL,'ewisoky@ryan.net',10,1510604194,1510604194),(2,'terrance.kozey@yost.com','','$2y$13$x63Xud09/LBAAz6gEKGBcuK5Awbx8R0A4MDzCJ/UVVCWVrueB5zsG',NULL,'terrance.kozey@yost.com',10,1510604195,1510604195),(3,'wilderman.kristin@yahoo.com','','$2y$13$JHSH7BgDbZY3LHeV3CQ51uUqP8bCjbftV/EUwUfxVdqJ7HShrOcOS',NULL,'wilderman.kristin@yahoo.com',10,1510604196,1510604196),(4,'rachael87@hotmail.com','','$2y$13$BsCwj1Y7OBIYGSYj.AzmeuKAroVfx0Q4sB1DvJuaD1c0vYTWCbMJe',NULL,'rachael87@hotmail.com',10,1510604196,1510604196),(5,'aubrey.fisher@buckridge.info','','$2y$13$NTnzocEIbLQ9.Cmhz4WGsOKj6Cjp/FeV3qzQ4Am8QKLtWztZ5pvoK',NULL,'aubrey.fisher@buckridge.info',10,1510604197,1510604197),(6,'wspinka@yahoo.com','','$2y$13$h6bLyXsEAfmRjXJ3Int.guQ9gWJqkKZ.O53pnAFHOR.5VYJ.ZcySi',NULL,'wspinka@yahoo.com',10,1510604198,1510604198),(7,'onikolaus@hotmail.com','','$2y$13$I0rlovA0mqNS0KZdC9XNg./Y8mXicaT.bO5djEbiNrs577.pGiziy',NULL,'onikolaus@hotmail.com',10,1510604199,1510604199),(8,'birdie.torp@yahoo.com','','$2y$13$/LpxhebK9Q1ZS5whF.M8uuN03OwcvtcTX/8W5WB6KBk56MkWOloc.',NULL,'birdie.torp@yahoo.com',10,1510604199,1510604199),(9,'knolan@connelly.com','','$2y$13$mX3usWTDvvgGoKassKlzC.AdNAt40BMomBygAXGs96n/o4AC33RnS',NULL,'knolan@connelly.com',10,1510604200,1510604200),(10,'mccullough.reva@hotmail.com','','$2y$13$irbCee2BeH/iXnxxhl9X7O91tFYXOXvQVh/A4Pn0iCZGmX1y2o4Tm',NULL,'mccullough.reva@hotmail.com',10,1510604200,1510604200),(11,'lawrence.bauch@schmidt.com','','$2y$13$/DCXZq6M3vJCU0/QtEfqMOzp57h9YNwovpcPeXEmbYZz48RO4SlOG',NULL,'lawrence.bauch@schmidt.com',10,1510604201,1510604201),(12,'dolores.kuhn@gmail.com','','$2y$13$Odo2halBp8v71VuZLw1dye23cTQnx1JXNG0ib50qABBkXB46cD08a',NULL,'dolores.kuhn@gmail.com',10,1510604202,1510604202),(13,'uupton@gmail.com','','$2y$13$uSjAEjNU2ETe01Kx5.ulU.lHbuvykY/DKQcueP8TTVyJzFWPcHM4.',NULL,'uupton@gmail.com',10,1510604202,1510604202),(14,'rcollins@yahoo.com','','$2y$13$nU.oGQJu2ApZhJjhGNYAbunUNCThXUJGaiz9ej2oPHZ8ypxvWpUna',NULL,'rcollins@yahoo.com',10,1510604203,1510604203),(15,'vernie12@gmail.com','','$2y$13$Rrfyh7S3BYoUGa4NNvOseeZecrz2Vl8tnkn6UAek7/Jx.TDUXJI/i',NULL,'vernie12@gmail.com',10,1510604204,1510604204),(16,'lori.baumbach@ratke.com','','$2y$13$HHZGZcJ0LOFccXL8ap/FMuEBZuTbv2mJanM3dSq3f7xkRYPEB2V42',NULL,'lori.baumbach@ratke.com',10,1510604204,1510604204),(17,'kaden.waters@rohan.org','','$2y$13$DF25Qx9KAqBNMCqo.5KRouv0UYV0j0xxn.3GHSrL/5pm2b//tu9mG',NULL,'kaden.waters@rohan.org',10,1510604205,1510604205),(18,'shaley@yahoo.com','','$2y$13$0uNwUGVkrMP4IpGQZMvRbe4sRUbrApUoFd1WMK3e.FN7GqR2tyBPm',NULL,'shaley@yahoo.com',10,1510604205,1510604205),(19,'maximilian.crona@gmail.com','','$2y$13$U4Y.T.8/UI1YBdg/WaqDj.6aDASfSJRfs6uOkpbHE5NHjEPHfubj.',NULL,'maximilian.crona@gmail.com',10,1510604206,1510604206),(20,'rhilpert@larkin.com','','$2y$13$mThyWcK75EtaYsJ5ubtpu.YK4PJPpTRfomjDSiDAPETC0YcyYWmsO',NULL,'rhilpert@larkin.com',10,1510604207,1510604207),(21,'wehner.kennith@hotmail.com','','$2y$13$9TN/jhrn.DMPtb1XfwGVse/MBtPkyokw0ALRuBdcnTYxHMOZKUUUS',NULL,'wehner.kennith@hotmail.com',10,1510604207,1510604207),(22,'goodwin.coby@konopelski.biz','','$2y$13$xEf8VpBkVKtNDpgmcFeBhOi2OqYu4vf1xmK.fsGht.9KL7Vr.XGYq',NULL,'goodwin.coby@konopelski.biz',10,1510604208,1510604208),(23,'vjast@smitham.biz','','$2y$13$JKRr4MhBfkTQUzvXkeKO9uAUXK8ytT4gSVKSY.WYbONw7eRiqZ4um',NULL,'vjast@smitham.biz',10,1510604208,1510604208),(24,'vstrosin@haley.net','','$2y$13$B0QZHxafLO45ky3IiUe.2e5BmFkPPnVlMK0OyTN.24gjl8X1n40.q',NULL,'vstrosin@haley.net',10,1510604209,1510604209),(25,'camila49@gmail.com','','$2y$13$h/sbW4a9iEOtjaa/gRaNy.n0maYnattJI.lcdgSR2Q/veLX0gou1y',NULL,'camila49@gmail.com',10,1510604210,1510604210);
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

-- Dump completed on 2017-11-15 11:56:13
