-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: utility
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

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
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dept` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_Employee`
--

DROP TABLE IF EXISTS `tb_Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_Employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empName` varchar(45) DEFAULT NULL,
  `empDept` varchar(45) DEFAULT NULL,
  `empMobile` varchar(45) DEFAULT NULL,
  `empEmail` varchar(45) DEFAULT NULL,
  `empSalary` varchar(45) DEFAULT NULL,
  `empDOB` date DEFAULT NULL,
  `empDOJ` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_Employee`
--

LOCK TABLES `tb_Employee` WRITE;
/*!40000 ALTER TABLE `tb_Employee` DISABLE KEYS */;
INSERT INTO `tb_Employee` VALUES (1,'nilesh kumar','Engineering','9457240028','nileshsingh067@gmail.com','2000','2018-10-08','2018-10-08'),(2,'nilesh kumar','Engineering','9457240028','nileshsingh067@gmail.com','2000','2018-10-08','2018-10-08'),(3,'nilesh kumar','Engineering','9457240028','nileshsingh067@gmail.com','2000','2018-10-08','2018-10-08'),(4,'Naman Bhatt','Engineering','86576678','nilesh@abc.com','5000.0','2018-10-08','2018-10-08'),(5,'Karuna Nidhan Upadhyay','Engineering','9458785733','nidhan@iiib.org','9898998.0','2018-10-08','2018-10-08'),(6,'Naman Bhatt','Engineering','86576678','nilesh@abc.com','5000.0','2018-10-08','2018-10-08'),(7,'anirudh','engg','836877887','ahfskhj@gmail.com','87364.0','2018-10-09','2018-10-09'),(8,'Prashant','Engineering','98798798797','naman@gmail.com','876876.0','2018-10-09','2018-10-09'),(9,'Pankaj Chaurasia','Engineering','9935386831','pankaj@abc.com','5000.0','2018-10-26','2018-10-26');
/*!40000 ALTER TABLE `tb_Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_Student`
--

DROP TABLE IF EXISTS `tb_Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_Student` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(45) NOT NULL,
  `s_roll` varchar(45) NOT NULL,
  `s_course` varchar(45) NOT NULL,
  `s_pmarks` double NOT NULL,
  `s_cmarks` double NOT NULL,
  `s_mmarks` double NOT NULL,
  `s_dob` datetime NOT NULL,
  `s_imgpath` varchar(45) NOT NULL,
  PRIMARY KEY (`s_id`),
  UNIQUE KEY `s_roll_UNIQUE` (`s_roll`),
  UNIQUE KEY `s_imgpath_UNIQUE` (`s_imgpath`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_Student`
--

LOCK TABLES `tb_Student` WRITE;
/*!40000 ALTER TABLE `tb_Student` DISABLE KEYS */;
INSERT INTO `tb_Student` VALUES (1,'Nilesh Kumar Singh','MT2018069','M.Tech(ECE)',90,90,90,'2018-11-04 02:08:50','../img/Nilesh_1.jpg'),(2,'Naman Bhatt','MT2018067','iM.Tech',90,91,90,'2018-11-04 02:24:53','../img/naman.jpg'),(4,'Karuna Nidhan Upadhya','MT2018051','M.Tech(CSE)',89,89,98,'2018-11-04 02:26:34','../img/nidhan.jpg'),(5,'Saurab kandapaka','MT20180115','M.Tech(CSE)',10,10,10,'2018-11-04 02:28:00','../img/saurab.jpg'),(6,'Rahul Kumar Rai','MT2018089','M.Tech(CSE)',90,90,90,'2018-11-05 20:53:09','../img/20181104_022250.jpg'),(7,'Surya Kant','MT2017123','M.Tech(IT)',95,90,85,'2018-11-06 15:51:10','../img/20181104_022003.jpg');
/*!40000 ALTER TABLE `tb_Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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

-- Dump completed on 2018-11-09 18:56:18
