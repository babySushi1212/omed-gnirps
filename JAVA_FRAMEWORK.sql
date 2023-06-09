CREATE DATABASE  IF NOT EXISTS `JAVA_FRAMEWORK` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `JAVA_FRAMEWORK`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: JAVA_FRAMEWORK
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `BOOK`
--

DROP TABLE IF EXISTS `BOOK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BOOK` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '書籍編號',
  `AUTHOR` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '作者',
  `ISBN` bigint DEFAULT NULL COMMENT '書號',
  `PRODUCT_ID` int NOT NULL COMMENT '商品編號',
  PRIMARY KEY (`ID`),
  KEY `FK_BOOK_PRODUCT_ID_idx` (`PRODUCT_ID`),
  CONSTRAINT `FK_BOOK_PRODUCT_ID` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='書籍資料表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOK`
--

LOCK TABLES `BOOK` WRITE;
/*!40000 ALTER TABLE `BOOK` DISABLE KEYS */;
INSERT INTO `BOOK` VALUES (1,'林信良',9789864767854,1),(2,'朝井淳',9789574424467,2);
/*!40000 ALTER TABLE `BOOK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOMER` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '客戶編號',
  `FULL_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `FIRST_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '名字',
  `LAST_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '姓氏',
  `PHONE` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '電話',
  `ADDRESS` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `REGION` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '縣市',
  `DISTRICT` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '鄉鎮市區',
  `ZIP` int DEFAULT NULL COMMENT '郵遞區號',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='客戶資料表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
INSERT INTO `CUSTOMER` VALUES (1,'William Lee','William','Lee','0900123456','台北市大安區舟巢街10號2F','台北市','大安區',106),(2,'程式養成班',NULL,NULL,'0211223344','新北市板橋區校東路20號1F','新北市','板橋區',220);
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPT`
--

DROP TABLE IF EXISTS `DEPT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEPT` (
  `DEPTNO` int NOT NULL COMMENT '部門編號(主鍵)',
  `DNAME` varchar(14) DEFAULT NULL COMMENT '部門名稱',
  `LOC` varchar(13) DEFAULT NULL COMMENT '所在地',
  PRIMARY KEY (`DEPTNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='部門資料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT`
--

LOCK TABLES `DEPT` WRITE;
/*!40000 ALTER TABLE `DEPT` DISABLE KEYS */;
INSERT INTO `DEPT` VALUES (10,'ACCOUNTING','NEW YORK'),(20,'RESEARCH','DALLAS'),(30,'SALES','CHICAGO'),(40,'OPERATIONS','BOSTON');
/*!40000 ALTER TABLE `DEPT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMP`
--

DROP TABLE IF EXISTS `EMP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMP` (
  `EMPNO` int NOT NULL COMMENT '員工編號(主鍵)',
  `ENAME` varchar(11) DEFAULT NULL COMMENT '姓名',
  `JOB` varchar(9) DEFAULT NULL COMMENT '職稱',
  `MGR` int DEFAULT NULL COMMENT '主管員工編號(外來鍵)',
  `HIREDATE` datetime DEFAULT NULL COMMENT '到職日',
  `SAL` decimal(7,2) DEFAULT NULL COMMENT '薪資',
  `COMM` decimal(7,2) DEFAULT NULL COMMENT '獎金',
  `DEPTNO` int NOT NULL COMMENT '部門編號(外來鍵)',
  PRIMARY KEY (`EMPNO`),
  KEY `FK_EMP_DEPTNO` (`DEPTNO`),
  KEY `FK_EMP_MGR` (`MGR`),
  CONSTRAINT `FK_EMP_DEPTNO` FOREIGN KEY (`DEPTNO`) REFERENCES `DEPT` (`DEPTNO`),
  CONSTRAINT `FK_EMP_MGR` FOREIGN KEY (`MGR`) REFERENCES `EMP` (`EMPNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='員工資料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMP`
--

LOCK TABLES `EMP` WRITE;
/*!40000 ALTER TABLE `EMP` DISABLE KEYS */;
INSERT INTO `EMP` VALUES (7369,'SMITH','CLERK',7902,'1980-12-17 00:00:00',800.00,NULL,20),(7499,'ALLEN','SALESMAN',7698,'1981-02-20 00:00:00',1600.00,300.00,30),(7521,'WARD','SALESMAN',7698,'1981-02-22 00:00:00',1250.00,500.00,30),(7566,'JONES','MANAGER',7839,'1981-04-02 00:00:00',2975.00,NULL,20),(7654,'MARTIN','SALESMAN',7698,'1981-09-28 00:00:00',1250.00,1400.00,30),(7698,'BLAKE','MANAGER',7839,'1981-05-01 00:00:00',2850.00,NULL,30),(7782,'CLARK','MANAGER',7839,'1981-06-09 00:00:00',2450.00,NULL,10),(7788,'SCOTT','ANALYST',7566,'1982-12-09 00:00:00',3000.00,NULL,20),(7839,'KING','PRESIDENT',NULL,'1981-11-17 00:00:00',5000.00,NULL,10),(7844,'TURNER','SALESMAN',7698,'1981-09-08 00:00:00',1500.00,0.00,30),(7876,'ADAMS','CLERK',7788,'1983-01-12 00:00:00',1100.00,NULL,20),(7900,'JAMES','CLERK',7698,'1981-12-03 00:00:00',950.00,NULL,30),(7902,'FORD','ANALYST',7566,'1981-12-03 00:00:00',3000.00,NULL,20),(7934,'MILLER','CLERK',7782,'1982-01-23 00:00:00',1300.00,NULL,10);
/*!40000 ALTER TABLE `EMP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MEMBER`
--

DROP TABLE IF EXISTS `MEMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MEMBER` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '編號',
  `USERNAME` varchar(100) NOT NULL COMMENT '帳號',
  `PASSWORD` varchar(100) NOT NULL COMMENT '密碼',
  `NICKNAME` varchar(100) NOT NULL COMMENT '暱稱',
  `PASS` bit(1) NOT NULL DEFAULT b'0' COMMENT '帳號啟用記號',
  `ROLE_ID` int NOT NULL DEFAULT '2' COMMENT '角色編號',
  `CREATOR` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'SYSTEM' COMMENT '建立者',
  `CREATED_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期時間',
  `UPDATER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'SYSTEM' COMMENT '修改者',
  `LAST_UPDATED_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '最後修改日期時間',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDX_MEMBER_USERNAME` (`USERNAME`),
  KEY `FK_MEMBER_ROLE_ID` (`ROLE_ID`),
  CONSTRAINT `FK_MEMBER_ROLE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='會員資料表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEMBER`
--

LOCK TABLES `MEMBER` WRITE;
/*!40000 ALTER TABLE `MEMBER` DISABLE KEYS */;
INSERT INTO `MEMBER` VALUES (1,'william','12345678','William',_binary '\0',2,'SYSTEM','2021-05-02 21:31:03','SYSTEM','2021-05-02 21:31:03'),(2,'admin','P@ssw0rd','Admin',_binary '',1,'SYSTEM','2021-05-02 21:31:26','SYSTEM','2021-05-02 21:31:26');
/*!40000 ALTER TABLE `MEMBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER`
--

DROP TABLE IF EXISTS `ORDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORDER` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '訂單編號',
  `ORDER_DATE` datetime NOT NULL COMMENT '訂貨日',
  `CUSTOMER_ID` int NOT NULL COMMENT '客戶編號',
  PRIMARY KEY (`ID`),
  KEY `FK_CUSTOMER_ID_idx` (`CUSTOMER_ID`),
  CONSTRAINT `FK_CUSTOMER_ID` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `CUSTOMER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='訂單資料表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER`
--

LOCK TABLES `ORDER` WRITE;
/*!40000 ALTER TABLE `ORDER` DISABLE KEYS */;
INSERT INTO `ORDER` VALUES (1,'2020-01-01 20:47:13',2),(2,'2020-02-02 20:47:39',1);
/*!40000 ALTER TABLE `ORDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER_DETAIL`
--

DROP TABLE IF EXISTS `ORDER_DETAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORDER_DETAIL` (
  `ORDER_ID` int NOT NULL COMMENT '訂單編號',
  `PRODUCT_ID` int NOT NULL COMMENT '商品編號',
  `QUANTITY` int NOT NULL COMMENT '數量',
  `UNIT_PRICE` int NOT NULL COMMENT '單價',
  PRIMARY KEY (`ORDER_ID`,`PRODUCT_ID`),
  KEY `FK_ORDER_DETAIL_PRODUCT_ID_idx` (`PRODUCT_ID`),
  KEY `FK_ORDER_DETAIL_ORDER_ID_idx` (`ORDER_ID`),
  CONSTRAINT `FK_ORDER_DETAIL_ORDER_ID` FOREIGN KEY (`ORDER_ID`) REFERENCES `ORDER` (`ID`),
  CONSTRAINT `FK_ORDER_DETAIL_PRODUCT_ID` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='訂單明細資料表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER_DETAIL`
--

LOCK TABLES `ORDER_DETAIL` WRITE;
/*!40000 ALTER TABLE `ORDER_DETAIL` DISABLE KEYS */;
INSERT INTO `ORDER_DETAIL` VALUES (1,1,14,600),(1,2,14,550),(2,1,1,600);
/*!40000 ALTER TABLE `ORDER_DETAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT`
--

DROP TABLE IF EXISTS `PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRODUCT` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '商品編號',
  `NAME` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品名稱',
  `UNIT_PRICE` int NOT NULL COMMENT '單價',
  `STOCK` int NOT NULL DEFAULT '0' COMMENT '庫存量',
  `SUPPLIER_ID` int NOT NULL,
  `CATEGORY_ID` int NOT NULL COMMENT '商品種類編號',
  PRIMARY KEY (`ID`),
  KEY `FK_SUPPLIER_ID_idx` (`SUPPLIER_ID`),
  KEY `FK_PRODUCT_CATEGORY_ID_idx` (`CATEGORY_ID`),
  CONSTRAINT `FK_PRODUCT_CATEGORY_ID` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `PRODUCT_CATEGORY` (`ID`),
  CONSTRAINT `FK_SUPPLIER_ID` FOREIGN KEY (`SUPPLIER_ID`) REFERENCES `SUPPLIER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='商品資料表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT`
--

LOCK TABLES `PRODUCT` WRITE;
/*!40000 ALTER TABLE `PRODUCT` DISABLE KEYS */;
INSERT INTO `PRODUCT` VALUES (1,'Servlet&JSP技術手冊',600,150,1,1),(2,'SQL語法範例辭典',550,200,2,1);
/*!40000 ALTER TABLE `PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_CATEGORY`
--

DROP TABLE IF EXISTS `PRODUCT_CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRODUCT_CATEGORY` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '商品種類編號',
  `NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品種類名稱',
  `DESCRIPTION` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品種類描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='商品種類資料表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_CATEGORY`
--

LOCK TABLES `PRODUCT_CATEGORY` WRITE;
/*!40000 ALTER TABLE `PRODUCT_CATEGORY` DISABLE KEYS */;
INSERT INTO `PRODUCT_CATEGORY` VALUES (1,'書籍','程式/軟體相關技術用書');
/*!40000 ALTER TABLE `PRODUCT_CATEGORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE`
--

DROP TABLE IF EXISTS `ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '編號',
  `NAME` varchar(100) NOT NULL COMMENT '角色名稱',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE`
--

LOCK TABLES `ROLE` WRITE;
/*!40000 ALTER TABLE `ROLE` DISABLE KEYS */;
INSERT INTO `ROLE` VALUES (1,'Admin'),(2,'User');
/*!40000 ALTER TABLE `ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUPPLIER`
--

DROP TABLE IF EXISTS `SUPPLIER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SUPPLIER` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '供應商編號',
  `NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '供應商名稱',
  `PHONE` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '供應商電話',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='供應商資料表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUPPLIER`
--

LOCK TABLES `SUPPLIER` WRITE;
/*!40000 ALTER TABLE `SUPPLIER` DISABLE KEYS */;
INSERT INTO `SUPPLIER` VALUES (1,'基峯','0212345678'),(2,'旗標','0298765432');
/*!40000 ALTER TABLE `SUPPLIER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-01 15:37:43
