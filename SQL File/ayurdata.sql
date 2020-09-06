-- MySQL dump 10.13  Distrib 8.0.0-dmr, for Win64 (x86_64)
--
-- Host: localhost    Database: ayurdata
-- ------------------------------------------------------
-- Server version	8.0.0-dmr-log

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
-- Table structure for table `bank_detail`
--

DROP TABLE IF EXISTS `bank_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_detail` (
  `Email` varchar(15) NOT NULL,
  `Name` char(10) DEFAULT NULL,
  `IFSC_code` varchar(11) DEFAULT NULL,
  `Account_no` int(15) DEFAULT NULL,
  PRIMARY KEY (`Email`),
  CONSTRAINT `Email` FOREIGN KEY (`Email`) REFERENCES `companyreg` (`Email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_detail`
--

LOCK TABLES `bank_detail` WRITE;
/*!40000 ALTER TABLE `bank_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companyreg`
--

DROP TABLE IF EXISTS `companyreg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companyreg` (
  `Company_Name` varchar(45) DEFAULT NULL,
  `Contact_no` int(10) DEFAULT NULL,
  `Email_id` varchar(20) NOT NULL,
  `Street` varchar(50) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `State` varchar(15) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `PIN_no` int(6) unsigned DEFAULT NULL,
  `Companyreg_no` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Email_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyreg`
--

LOCK TABLES `companyreg` WRITE;
/*!40000 ALTER TABLE `companyreg` DISABLE KEYS */;
INSERT INTO `companyreg` VALUES ('a',78,'a@b.c','we','as','seess','erthj',123,'a'),('b',123,'b@c.d','12a','jj','jj','jk',12,'b'),('Raj Comp',1234567890,'raj@gmail.com','Harni','Vadodara','Gujarat','India',390022,'012345a678u');
/*!40000 ALTER TABLE `companyreg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmerreg`
--

DROP TABLE IF EXISTS `farmerreg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmerreg` (
  `Farmer_id` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Contact_no` int(10) unsigned NOT NULL,
  `DOB` varchar(45) NOT NULL,
  `Street` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  `Country` varchar(45) NOT NULL,
  `PIN` int(6) unsigned NOT NULL,
  PRIMARY KEY (`Farmer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmerreg`
--

LOCK TABLES `farmerreg` WRITE;
/*!40000 ALTER TABLE `farmerreg` DISABLE KEYS */;
INSERT INTO `farmerreg` VALUES ('raju','Raju Singh',1234,'2020-01-02','kjsabd','kjb','kkjj','bk',12334);
/*!40000 ALTER TABLE `farmerreg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `id_linker`
--

DROP TABLE IF EXISTS `id_linker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `id_linker` (
  `Order_id` varchar(45) NOT NULL,
  `Email_id` varchar(45) NOT NULL,
  `Farmer_id` varchar(45) NOT NULL,
  KEY `Order_id` (`Order_id`),
  KEY `Farmer_id` (`Farmer_id`),
  KEY `GST_no` (`Email_id`) USING BTREE,
  CONSTRAINT `Email_id` FOREIGN KEY (`Email_id`) REFERENCES `companyreg` (`Email_id`),
  CONSTRAINT `Farmer_id` FOREIGN KEY (`Farmer_id`) REFERENCES `farmerreg` (`Farmer_id`),
  CONSTRAINT `Order_id` FOREIGN KEY (`Order_id`) REFERENCES `order_details` (`Order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `id_linker`
--

LOCK TABLES `id_linker` WRITE;
/*!40000 ALTER TABLE `id_linker` DISABLE KEYS */;
/*!40000 ALTER TABLE `id_linker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logins`
--

DROP TABLE IF EXISTS `logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logins` (
  `uname` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `user_type` varchar(2) NOT NULL,
  PRIMARY KEY (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logins`
--

LOCK TABLES `logins` WRITE;
/*!40000 ALTER TABLE `logins` DISABLE KEYS */;
INSERT INTO `logins` VALUES ('a@b.c','a','c'),('b@c.d','b','c'),('raj@gmail.com','raj123','c'),('raju','raju123','f');
/*!40000 ALTER TABLE `logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `Order_id` varchar(45) NOT NULL,
  `GST_no` varchar(45) NOT NULL,
  `Date` varchar(45) NOT NULL,
  `Plant_id` varchar(45) NOT NULL,
  `Quantity` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_plants`
--

DROP TABLE IF EXISTS `ordered_plants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordered_plants` (
  `Order_id` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Plant_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_plants`
--

LOCK TABLES `ordered_plants` WRITE;
/*!40000 ALTER TABLE `ordered_plants` DISABLE KEYS */;
INSERT INTO `ordered_plants` VALUES (1,'Aloe Vera','2020-05-01 00:00:00',200,1);
/*!40000 ALTER TABLE `ordered_plants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plant_detail`
--

DROP TABLE IF EXISTS `plant_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plant_detail` (
  `Plant_id` varchar(15) NOT NULL,
  `Name` char(10) DEFAULT NULL,
  `Rate` float DEFAULT NULL,
  `Quantity` int(10) unsigned NOT NULL,
  `Image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Plant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plant_detail`
--

LOCK TABLES `plant_detail` WRITE;
/*!40000 ALTER TABLE `plant_detail` DISABLE KEYS */;
INSERT INTO `plant_detail` VALUES ('1','Aloe Vera',100,100,'aloe-vera.jpg'),('2','Amla',200,130,'amla.jpg'),('3','Basil',400,200,'basil.png'),('4','Giloy',300,230,'giloy.png');
/*!40000 ALTER TABLE `plant_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requested_plants`
--

DROP TABLE IF EXISTS `requested_plants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requested_plants` (
  `request_id` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Plant_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requested_plants`
--

LOCK TABLES `requested_plants` WRITE;
/*!40000 ALTER TABLE `requested_plants` DISABLE KEYS */;
INSERT INTO `requested_plants` VALUES (1,'Aloe vera',200,1);
/*!40000 ALTER TABLE `requested_plants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-06 19:34:03
