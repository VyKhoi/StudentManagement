-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: btl_4
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_teacher_in_charge` int NOT NULL,
  `id_school_year` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_teacher_in_charge` (`id_teacher_in_charge`),
  KEY `id_school_year` (`id_school_year`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`id_teacher_in_charge`) REFERENCES `user` (`id`),
  CONSTRAINT `class_ibfk_2` FOREIGN KEY (`id_school_year`) REFERENCES `school_year` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'10a1',1,1),(2,'10a2',2,1),(3,'10a3',3,1),(4,'11a1',4,1),(5,'11a2',5,1),(6,'11a3',6,1),(7,'12a1',7,1),(8,'12a2',8,1),(9,'12a3',9,1);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `header` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(7000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_push` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_author` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_author` (`id_author`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`id_author`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'C??NG NGH??? SINH H???C CHUY??N NG??NH C??NG NGH??? TH???C PH???M','1???. S???ng th?? ph???i c?? k??? ho???ch, m???c ti??u r?? r??ng. ?????ng ???m ??? th??? n??o c??ng ???????c.','11/12/2022','https://images.pexels.com/photos/753626/pexels-photo-753626.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2','1',1),(2,'Th??ng b??o v??? vi???c tuy???n sinh tr??nh ????? ?????i h???c h??nh th???c ????o t???o t??? xa (?????t 6 n??m 2022)','Kh??ng ch??? ri??ng ?????i b??ng m???i c?? c?? ch??? n??y, qu??? m???t kh??ng tr??ng n??y c??n xu???t hi???n ??? C??, lo??i L?????ng c??, b?? s??t, M??o, G???u B???c C???c, H???i ly, L???c ????...Th???m ch?? xu???t hi???n tr??n c??? c??c lo??i Linh tr?????ng nh?? V?????n c??o.','01/01/2022','https://images.pexels.com/photos/206359/pexels-photo-206359.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2','1',2),(3,'Kh??ng ch??? ri??ng ?????i b??ng m???i c?? c?? ch??? n??y, qu??? m???t kh??ng tr??ng ','Chuy???n th??m di???n ra trong b???i c???nh quan h??? gi???a Vi???t Nam v???i Australia v?? New Zealand ??ang ph??t tri???n thu???n l???i v?? ?????t hi???u qu???. Chuy???n th??m c?? ?? ngh??a quan tr???ng, l?? chuy???n th??m ch??nh th???c Australia v?? New Zealand ?????u ti??n c???a ?????ng ch?? V????ng ????nh Hu??? tr??n c????ng v??? Ch??? t???ch Qu???c h???i. ????y c??ng l?? chuy???n th??m ?????u ti??n c???a l??nh ?????o c???p cao??','02/05/2021','https://images.pexels.com/photos/737586/pexels-photo-737586.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2','1',3),(4,'C???n xem x??t v??? tr?? ?????t khi ?????n b??, gi???i t???a c???a d??? ??n V??nh ??ai 3','Chuy???n th??m di???n ra trong b???i c???nh quan h??? gi???a Vi???t Nam v???i Australia v?? New Zealand ??ang ph??t tri???n thu???n l???i v?? ?????t hi???u qu???. Chuy???n th??m c?? ?? ngh??a quan tr???ng, l?? chuy???n th??m ch??nh th???c Australia v?? New Zealand ?????u ti??n c???a ?????ng ch?? V????ng ????nh Hu??? tr??n c????ng v??? Ch??? t???ch Qu???c h???i. ????y c??ng l?? chuy???n th??m ?????u ti??n c???a l??nh ?????o c???p cao??','05/06/2022','https://images.pexels.com/photos/753626/pexels-photo-753626.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2','1',4),(5,'L???y t?? t?????ng ???d??n l?? g???c??? l??m n???n t???ng c???t l??i cho c??n b??? l??m c??ng t??c M???t tr???n c??c c???p','1???. S???ng th?? ph???i c?? k??? ho???ch, m???c ti??u r?? r??ng. ?????ng ???m ??? th??? n??o c??ng ???????c.','11/12/2022','https://images.pexels.com/photos/753626/pexels-photo-753626.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=3','1',5),(6,'Th??ng b??o v??? vi???c tuy???n sinh tr??nh ????? ?????i h???c h??nh th???c ????o t???o t??? xa (?????t 6 n??m 2022)','Kh??ng ch??? ri??ng ?????i b??ng m???i c?? c?? ch??? n??y, qu??? m???t kh??ng tr??ng n??y c??n xu???t hi???n ??? C??, lo??i L?????ng c??, b?? s??t, M??o, G???u B???c C???c, H???i ly, L???c ????...Th???m ch?? xu???t hi???n tr??n c??? c??c lo??i Linh tr?????ng nh?? V?????n c??o.','01/01/2022','https://images.pexels.com/photos/206359/pexels-photo-206359.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=3','2',2),(7,'L???y t?? t?????ng ???d??n l?? g???c??? l??m n???n t???ng c???t l??i cho c??n b??? l??m c??ng t??c M???t tr???n c??c c???p','Chuy???n th??m di???n ra trong b???i c???nh quan h??? gi???a Vi???t Nam v???i Australia v?? New Zealand ??ang ph??t tri???n thu???n l???i v?? ?????t hi???u qu???. Chuy???n th??m c?? ?? ngh??a quan tr???ng, l?? chuy???n th??m ch??nh th???c Australia v?? New Zealand ?????u ti??n c???a ?????ng ch?? V????ng ????nh Hu??? tr??n c????ng v??? Ch??? t???ch Qu???c h???i. ????y c??ng l?? chuy???n th??m ?????u ti??n c???a l??nh ?????o c???p cao??','02/05/2021','https://images.pexels.com/photos/737586/pexels-photo-737586.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=3','2',3),(8,'B??? s??u t???p NFT CR7 hi???n ???? ???????c ch??nh th???c ra m???t. ?????c quy???n tr??n th??? tr?????ng Binance NFT.','Chuy???n th??m di???n ra trong b???i c???nh quan h??? gi???a Vi???t Nam v???i Australia v?? New Zealand ??ang ph??t tri???n thu???n l???i v?? ?????t hi???u qu???. Chuy???n th??m c?? ?? ngh??a quan tr???ng, l?? chuy???n th??m ch??nh th???c Australia v?? New Zealand ?????u ti??n c???a ?????ng ch?? V????ng ????nh Hu??? tr??n c????ng v??? Ch??? t???ch Qu???c h???i. ????y c??ng l?? chuy???n th??m ?????u ti??n c???a l??nh ?????o c???p cao??','05/06/2022','https://images.pexels.com/photos/753626/pexels-photo-753626.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=3','2',1),(9,'C??NG NGH??? SINH H???C CHUY??N NG??NH C??NG NGH??? TH???C PH???M','1???. S???ng th?? ph???i c?? k??? ho???ch, m???c ti??u r?? r??ng. ?????ng ???m ??? th??? n??o c??ng ???????c.','11/12/2022','https://images.pexels.com/photos/753626/pexels-photo-753626.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=4','2',5),(10,'Th??ng b??o v??? vi???c tuy???n sinh tr??nh ????? ?????i h???c h??nh th???c ????o t???o t??? xa (?????t 6 n??m 2022)','Kh??ng ch??? ri??ng ?????i b??ng m???i c?? c?? ch??? n??y, qu??? m???t kh??ng tr??ng n??y c??n xu???t hi???n ??? C??, lo??i L?????ng c??, b?? s??t, M??o, G???u B???c C???c, H???i ly, L???c ????...Th???m ch?? xu???t hi???n tr??n c??? c??c lo??i Linh tr?????ng nh?? V?????n c??o.','01/01/2022','https://images.pexels.com/photos/206359/pexels-photo-206359.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=4','2',1);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'thay ?????i ??i???m s??? h???c sinh'),(2,'t???o l???p'),(3,'qu???n l?? h???c sinh trong l???p'),(4,'????ng b??i vi???t'),(5,'g??n l???p gi???ng d???y'),(6,'thay ?????i th??ng tin h???c sinh'),(7,'thay ?????i quy ?????nh, quy t???c nh?? tr?????ng'),(8,'????ng k?? ng?????i d??ng h??? th???ng'),(9,'s??? d???ng trang qu???ng tr??? h??? c?? s??? d??? li???u');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conduct` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_student` int NOT NULL,
  `id_school_year` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_student` (`id_student`),
  KEY `id_school_year` (`id_school_year`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`id_student`) REFERENCES `student` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`id_school_year`) REFERENCES `school_year` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('academic_staff'),('admin'),('school_manager'),('teacher');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permission` (
  `role` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_per` int NOT NULL,
  PRIMARY KEY (`role`,`id_per`),
  KEY `id_per` (`id_per`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`role`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`id_per`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` VALUES ('teacher',1),('academic_staff',2),('academic_staff',3),('academic_staff',4),('academic_staff',5),('academic_staff',6),('school_manager',7),('academic_staff',8),('admin',9);
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule`
--

DROP TABLE IF EXISTS `rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_rules_table` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_rules_table` (`id_rules_table`),
  CONSTRAINT `rule_ibfk_1` FOREIGN KEY (`id_rules_table`) REFERENCES `rules_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule`
--

LOCK TABLES `rule` WRITE;
/*!40000 ALTER TABLE `rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rules_table`
--

DROP TABLE IF EXISTS `rules_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rules_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rules_table`
--

LOCK TABLES `rules_table` WRITE;
/*!40000 ALTER TABLE `rules_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `rules_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_year`
--

DROP TABLE IF EXISTS `school_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_year` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year_start` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year_end` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_year`
--

LOCK TABLES `school_year` WRITE;
/*!40000 ALTER TABLE `school_year` DISABLE KEYS */;
INSERT INTO `school_year` VALUES (1,'NK 2020 - 2021','2020','2021','HK1'),(2,'NK 2020 - 2021','2020','2021','HK2');
/*!40000 ALTER TABLE `school_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score` (
  `id` int NOT NULL AUTO_INCREMENT,
  `values` float NOT NULL,
  `type_score` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_subject` int NOT NULL,
  `id_school_year` int NOT NULL,
  `id_student` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_score` (`type_score`),
  KEY `id_subject` (`id_subject`),
  KEY `id_school_year` (`id_school_year`),
  KEY `id_student` (`id_student`),
  CONSTRAINT `score_ibfk_1` FOREIGN KEY (`type_score`) REFERENCES `type_score` (`type`),
  CONSTRAINT `score_ibfk_2` FOREIGN KEY (`id_subject`) REFERENCES `subjects` (`id`),
  CONSTRAINT `score_ibfk_3` FOREIGN KEY (`id_school_year`) REFERENCES `school_year` (`id`),
  CONSTRAINT `score_ibfk_4` FOREIGN KEY (`id_student`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `state` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES ('graduate'),('none'),('studying');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `identity` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hometown` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`status`) REFERENCES `status` (`state`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'?????ng V??n Tr?????ng An',0,'100000','An Giang','08/09/2002','09000231','2051052001An@ou.edu.vn','none'),(2,'L????ng Vi???t Anh',0,'100001','B???c Li??u','13/05/2002','09000232','2051052003Anh@ou.edu.vn','none'),(3,'Ph???m Tu???n Anh',0,'100002','B???n Tre','07/07/2002','09000233','2051052004Anh@ou.edu.vn','none'),(4,'Nguy???n Chu Ph?????c ??n',0,'100003','C?? Mau','14/04/2002','09000234','2051052006An@ou.edu.vn','none'),(5,'Tr???n Nguy???n H???ng ??n',1,'100004','C???n Th??','15/02/2002','09000235','2051052007An@ou.edu.vn','none'),(6,'L?? B???ng',0,'100005','?????ng Th??p','05/03/2002','09000236','2051052009Bang@ou.edu.vn','none'),(7,'Tr???n V??n C????ng',0,'100006','H???u Giang','16/01/2002','09000237','2051052013Cuong@ou.edu.vn','none'),(8,'Nguy???n T???n C?????ng',0,'100007','Ki??n Giang','03/11/2002','09000238','2051052016Cuong@ou.edu.vn','none'),(9,'L?? V??n Chi???n',0,'100008','Long An','07/03/2002','09000239','2051052011Chien@ou.edu.vn','none'),(10,'?????ng Ph???m ????nh Ch????ng',0,'100009','S??c Tr??ng','05/09/2002','09000240','2051052012Chuong@ou.edu.vn','none'),(11,'Nguy???n Tu???n D??',0,'100010','Ti???n Giang','31/12/2002','09000241','2051052022Du@ou.edu.vn','none'),(12,'B??i Xu??n D??ng',0,'100011','Tr?? Vinh','01/08/2002','09000242','2051052023Dung@ou.edu.vn','none'),(13,'Tr???n C??ng Duy',0,'100012','V??nh Long','25/07/2002','09000243','2051052021Duy@ou.edu.vn','none'),(14,'L?? Quang ?????t',0,'100013','An Giang','10/07/2002','09000244','2051052026Dat@ou.edu.vn','none'),(15,'Phan Ho??ng ?????t',0,'100014','B???c Li??u','12/02/2002','09000245','2051052027Dat@ou.edu.vn','none'),(16,'Nguy???n S?? ?????c',0,'100015','B???n Tre','10/07/2002','09000246','2051052030Duc@ou.edu.vn','none'),(17,'Ph???m H???u ?????c',0,'100016','C?? Mau','10/12/2002','09000247','2051052031Duc@ou.edu.vn','none'),(18,'????o Tr?????ng Giang',0,'100017','C???n Th??','27/01/2002','09000248','2051052032Giang@ou.edu.vn','none'),(19,'Nguy???n Thanh H???i',0,'100018','?????ng Th??p','05/05/2002','09000249','2051052034Hai@ou.edu.vn','none'),(20,'Nguy???n V??n H???u',0,'100019','H???u Giang','11/11/2002','09000250','2051052036Hau@ou.edu.vn','none'),(21,'??inh Minh Hi???u',0,'100020','Ki??n Giang','05/09/2002','09000251','2051052040Hieu@ou.edu.vn','none'),(22,'Ph???m Xu??n C??ng Hi???u',0,'100021','Long An','11/09/2002','09000252','2051052041Hieu@ou.edu.vn','none'),(23,'Nguy???n Th??? H??a',0,'100022','S??c Tr??ng','01/01/2002','09000253','2051052044Hoa@ou.edu.vn','none'),(24,'L?? T??m H??a',1,'100023','Ti???n Giang','23/01/2002','09000254','2051052050Hoa@ou.edu.vn','none'),(25,'Ph???m T???n Ho??ng',0,'100024','Tr?? Vinh','03/02/2002','09000255','2051052048Hoang@ou.edu.vn','none'),(26,'Ph??ng Long Ho??ng',0,'100025','V??nh Long','17/08/2002','09000256','2051052049Hoang@ou.edu.vn','none'),(27,'Nguy???n T???n H???p',0,'100026','An Giang','13/05/2002','09000257','2051052052Hop@ou.edu.vn','none'),(28,'?????u Xu??n Ho??ng H??ng',0,'100027','B???c Li??u','28/12/2002','09000258','2051052059Hung@ou.edu.vn','none'),(29,'Ph???m H??ng',0,'100028','B???n Tre','02/02/2002','09000259','2051052060Hung@ou.edu.vn','none'),(30,'H??ng ?????c Huy',0,'100029','An Giang','27/09/2001','09000260','2051052056Huy@ou.edu.vn','none'),(31,'Mai Kh??nh Huy',0,'100030','B???c Li??u','12/04/2002','09000261','2051052057Huy@ou.edu.vn','none'),(32,'Nguy???n Qu???c Huy',0,'100031','B???n Tre','03/01/2002','09000262','2051052058Huy@ou.edu.vn','none'),(33,'Nguy???n Qu???c K???',0,'100032','C?? Mau','13/02/2002','09000263','2051052070Ky@ou.edu.vn','none'),(34,'?????ng V??? Kh??i',0,'100033','C???n Th??','18/12/2002','09000264','2051052066Khoi@ou.edu.vn','none'),(35,'Nguy???n ????nh Lu??n',0,'100034','?????ng Th??p','02/02/2002','09000265','2051050251Luan@ou.edu.vn','none'),(36,'Nguy???n Ng???c Lu??n',0,'100035','An Giang','02/03/2002','09000266','2051052077Luan@ou.edu.vn','none'),(37,'Tr???nh Hu???nh My',0,'100036','B???c Li??u','07/02/2001','09000267','2051052082My@ou.edu.vn','none'),(38,'Ho??ng V??n 0',0,'100037','B???n Tre','27/07/2002','09000268','20510520840@ou.edu.vn','none'),(39,'Nguy???n Ph????ng 0',0,'100038','C?? Mau','03/09/2002','09000269','20510520850@ou.edu.vn','none'),(40,'Nguy???n L?? Tr??c Ng??n',0,'100039','C???n Th??','11/04/2002','09000270','2051052088Ngan@ou.edu.vn','none'),(41,'V?? H???u Ngh??a',1,'100040','?????ng Th??p','19/06/2002','09000271','2051052090Nghia@ou.edu.vn','none'),(42,'Nguy???n Th??? H???ng Nhung',0,'100041','H???u Giang','06/09/2002','09000272','2051052093Nhung@ou.edu.vn','none'),(43,'V?? Ho??ng Phan',0,'100042','Ki??n Giang','31/12/2001','09000273','2051052095Phan@ou.edu.vn','none'),(44,'??o??n Trung Phong',0,'100043','Long An','04/10/2002','09000274','2051052098Phong@ou.edu.vn','none'),(45,'Nguy???n Ho??ng Gia Ph??',0,'100044','S??c Tr??ng','08/09/2002','09000275','2051052100Phu@ou.edu.vn','none'),(46,'Nguy???n H???ng Ph??c',0,'100045','Ti???n Giang','14/04/2002','09000276','2051052103Phuc@ou.edu.vn','none'),(47,'L?? Anh Quang',0,'100046','Tr?? Vinh','04/12/1997','09000277','2051052108Quang@ou.edu.vn','none'),(48,'Nguy???n Anh Qu???c',0,'100047','V??nh Long','24/12/2002','09000278','2051052111Quoc@ou.edu.vn','none'),(49,'V?? Th??nh T??nh',0,'100048','An Giang','16/07/2002','09000279','2051052139Tinh@ou.edu.vn','none'),(50,'Nguy???n Qu???c Tu???n T??',0,'100049','An Giang','02/03/2002','09000280','2051052148Tu@ou.edu.vn','none'),(51,'S?? L?? L??m Thanh',0,'100050','B???c Li??u','10/01/2002','09000281','2051052121Thanh@ou.edu.vn','none'),(52,'V?? Xu??n Th??nh Th???ng',0,'100051','B???n Tre','02/10/2002','09000282','2051052129Thang@ou.edu.vn','none'),(53,'L?? Minh Thi???n',0,'100052','C?? Mau','11/11/2002','09000283','2051052130Thien@ou.edu.vn','none'),(54,'M?? Quang Thi???n',0,'100053','C???n Th??','13/01/2002','09000284','2051052131Thien@ou.edu.vn','none'),(55,'??inh Ho??ng Thanh Tr??c',0,'100054','?????ng Th??p','17/09/2002','09000285','2055012088Truc@ou.edu.vn','none'),(56,'Nguy???n Anh Trung',0,'100055','H???u Giang','21/04/2002','09000286','2051012122Trung@ou.edu.vn','none'),(57,'L?? Hi???n Vinh',0,'100056','Ki??n Giang','01/04/2002','09000287','2051052152Vinh@ou.edu.vn','none'),(58,'V?? Xu??n V??',0,'100057','Long An','07/04/2002','09000288','2051052155Vu@ou.edu.vn','none'),(59,'D????ng Th??? Ki???u Vy',1,'100058','S??c Tr??ng','04/09/2002','09000289','2051052157Vy@ou.edu.vn','none'),(60,'D????ng Th??? M??? Trinh',0,'100059','Ti???n Giang','08/09/2002','09000290','2051052001An@ou.edu.vn','none'),(61,'Phan Y T???nh',0,'100060','Tr?? Vinh','13/05/2002','09000291','2051052003Anh@ou.edu.vn','none'),(62,'Tr????ng Thanh Vi',0,'100061','V??nh Long','07/07/2002','09000292','2051052004Anh@ou.edu.vn','none'),(63,'H??? B???o An',0,'100062','An Giang','14/04/2002','09000293','2051052006An@ou.edu.vn','none'),(64,'Tr???n Minh ????ng Khoa',1,'100063','B???c Li??u','15/02/2002','09000294','2051052007An@ou.edu.vn','none'),(65,'Ph???m Th??? Ki???u Mi',0,'100064','B???n Tre','05/03/2002','09000295','2051052009Bang@ou.edu.vn','none'),(66,'????? Nh???t T??m',0,'100065','An Giang','16/01/2002','09000296','2051052013Cuong@ou.edu.vn','none'),(67,'????? Hi???u Th??nh',0,'100066','B???c Li??u','03/11/2002','09000297','2051052016Cuong@ou.edu.vn','none'),(68,'L?? Th??? Minh Trang',0,'100067','B???n Tre','07/03/2002','09000298','2051052011Chien@ou.edu.vn','none'),(69,'Tr???n Ph???m C???m T??',0,'100068','C?? Mau','05/09/2002','09000299','2051052012Chuong@ou.edu.vn','none'),(70,'T?? V??nh T?????ng',0,'100069','C???n Th??','31/12/2002','09000300','2051052022Du@ou.edu.vn','none'),(71,'Nguy???n C???m Vy',0,'100070','?????ng Th??p','01/08/2002','09000301','2051052023Dung@ou.edu.vn','none'),(72,'L?? Tr????ng Th??? Huy???n Di???u',0,'100071','An Giang','25/07/2002','09000302','2051052021Duy@ou.edu.vn','none'),(73,'V?? ????nh H???i ????ng',0,'100072','B???c Li??u','10/07/2002','09000303','2051052026Dat@ou.edu.vn','none'),(74,'Mai Ch???n Ho??ng',0,'100073','B???n Tre','12/02/2002','09000304','2051052027Dat@ou.edu.vn','none'),(75,'Phan T???n ?????t',0,'100074','C?? Mau','10/07/2002','09000305','2051052030Duc@ou.edu.vn','none'),(76,'????? Huy Ho??ng',0,'100075','C???n Th??','10/12/2002','09000306','2051052031Duc@ou.edu.vn','none'),(77,'Tr???n M??? Kim',0,'100076','?????ng Th??p','27/01/2002','09000307','2051052032Giang@ou.edu.vn','none'),(78,'Hu???nh Th??? C???m Lang',0,'100077','H???u Giang','05/05/2002','09000308','2051052034Hai@ou.edu.vn','none'),(79,'Tr???nh Th??? M??? Linh',0,'100078','Ki??n Giang','11/11/2002','09000309','2051052036Hau@ou.edu.vn','none'),(80,'L??m H???u Ngh??a',0,'100079','Long An','05/09/2002','09000310','2051052040Hieu@ou.edu.vn','none'),(81,'Nguy???n Tr???n Hi???u Ngh??a',0,'100080','S??c Tr??ng','11/09/2002','09000311','2051052041Hieu@ou.edu.vn','none'),(82,'D????ng Th??? Th???o Nh??',0,'100081','Ti???n Giang','01/01/2002','09000312','2051052044Hoa@ou.edu.vn','none'),(83,'Ch??u Nh???t Ph??c',1,'100082','Tr?? Vinh','23/01/2002','09000313','2051052050Hoa@ou.edu.vn','none'),(84,'Nguy???n V??n T??n',0,'100083','V??nh Long','03/02/2002','09000314','2051052048Hoang@ou.edu.vn','none'),(85,'Cao Minh Thi???n',0,'100084','An Giang','17/08/2002','09000315','2051052049Hoang@ou.edu.vn','none'),(86,'Nguy???n Ng???c Thanh Th??y',0,'100085','An Giang','13/05/2002','09000316','2051052052Hop@ou.edu.vn','none'),(87,'????? Th??? Minh Th??',0,'100086','B???c Li??u','28/12/2002','09000317','2051052059Hung@ou.edu.vn','none'),(88,'Tr???n Th??? Ho??i Th????ng',0,'100087','B???n Tre','02/02/2002','09000318','2051052060Hung@ou.edu.vn','none'),(89,'Hu???nh Nguy???n Thanh V??n',0,'100088','C?? Mau','27/09/2001','09000319','2051052056Huy@ou.edu.vn','none'),(90,'Tr???n ????ng Th???o Vy',0,'100089','C???n Th??','12/04/2002','09000320','2051052057Huy@ou.edu.vn','none'),(91,'Tr???n Ng???c Th??y An',0,'100090','?????ng Th??p','03/01/2002','09000321','2051052058Huy@ou.edu.vn','none'),(92,'Nguy???n Quang Vinh',0,'100091','H???u Giang','13/02/2002','09000322','2051052070Ky@ou.edu.vn','none'),(93,'Tr???nh Ng???c Xu??n Ly',0,'100092','Ki??n Giang','18/12/2002','09000323','2051052066Khoi@ou.edu.vn','none'),(94,'Kh???ng Minh Tri???t',0,'100093','Long An','02/02/2002','09000324','2051050251Luan@ou.edu.vn','none'),(95,'Cao Nh???t H??o',0,'100094','S??c Tr??ng','02/03/2002','09000325','2051052077Luan@ou.edu.vn','none'),(96,'Nguy???n Qu???c To??n',0,'100095','Ti???n Giang','07/02/2001','09000326','2051052082My@ou.edu.vn','none'),(97,'Tr???n Th??? T??m C??',0,'100096','Tr?? Vinh','27/07/2002','09000327','20510520840@ou.edu.vn','none'),(98,'????? Thanh Danh',0,'100097','V??nh Long','03/09/2002','09000328','20510520850@ou.edu.vn','none'),(99,'Nguy???n V??n Hi???u',0,'100098','An Giang','11/04/2002','09000329','2051052088Ngan@ou.edu.vn','none'),(100,'Ng?? Thanh Ho??ng',1,'100099','B???c Li??u','19/06/2002','09000330','2051052090Nghia@ou.edu.vn','none'),(101,'Tr???n V??n Ho??ng',0,'100100','B???n Tre','06/09/2002','09000331','2051052093Nhung@ou.edu.vn','none'),(102,'L?? Gia Huy',0,'100101','An Giang','31/12/2001','09000332','2051052095Phan@ou.edu.vn','none'),(103,'Nguy???n Mai Ng???c Kh???i',0,'100102','B???c Li??u','04/10/2002','09000333','2051052098Phong@ou.edu.vn','none'),(104,'Nguy???n Minh Ki??n',0,'100103','B???n Tre','08/09/2002','09000334','2051052100Phu@ou.edu.vn','none'),(105,'L?? Kh???i Ki???t',0,'100104','C?? Mau','14/04/2002','09000335','2051052103Phuc@ou.edu.vn','none'),(106,'V?? C??ng K???',0,'100105','C???n Th??','04/12/1997','09000336','2051052108Quang@ou.edu.vn','none'),(107,'L?? V?? Huy???n Linh',0,'100106','?????ng Th??p','24/12/2002','09000337','2051052111Quoc@ou.edu.vn','none'),(108,'V?? Nh???t Minh',0,'100107','An Giang','16/07/2002','09000338','2051052139Tinh@ou.edu.vn','none'),(109,'Tr????ng Th??? Th??y My',0,'100108','B???c Li??u','02/03/2002','09000339','2051052148Tu@ou.edu.vn','none'),(110,'T?? Thanh Nh??',0,'100109','B???n Tre','10/01/2002','09000340','2051052121Thanh@ou.edu.vn','none'),(111,'?????ng Ng???c Nh??n',0,'100110','C?? Mau','02/10/2002','09000341','2051052129Thang@ou.edu.vn','none'),(112,'Ho??ng Minh Nh???t',0,'100111','C???n Th??','11/11/2002','09000342','2051052130Thien@ou.edu.vn','none'),(113,'L?? T??m Nhi',0,'100112','?????ng Th??p','13/01/2002','09000343','2051052131Thien@ou.edu.vn','none'),(114,'T??n 1 Uy???n Nhi',0,'100113','H???u Giang','17/09/2002','09000344','2055012088Truc@ou.edu.vn','none'),(115,'Nguy???n Th???o Quy??n',0,'100114','Ki??n Giang','21/04/2002','09000345','2051012122Trung@ou.edu.vn','none'),(116,'Nguy???n Quy???t T??m',0,'100115','Long An','01/04/2002','09000346','2051052152Vinh@ou.edu.vn','none'),(117,'L?? ?????c Th???nh',0,'100116','S??c Tr??ng','07/04/2002','09000347','2051052155Vu@ou.edu.vn','none'),(118,'Ng?? ?????c Th???nh',0,'100117','Ti???n Giang','04/09/2002','09000348','2051052157Vy@ou.edu.vn','none'),(119,'?????ng Ho??i Th????ng',1,'100118','Tr?? Vinh','08/09/2002','09000349','2051052001An@ou.edu.vn','none'),(120,'L?? Tr???n Mai Tr??m',0,'100119','V??nh Long','13/05/2002','09000350','2051052003Anh@ou.edu.vn','none'),(121,'V?? Minh Tr??',0,'100120','An Giang','07/07/2002','09000351','2051052004Anh@ou.edu.vn','none'),(122,'L?? M??? Uy??n',0,'100121','An Giang','14/04/2002','09000352','2051052006An@ou.edu.vn','none'),(123,'Nguy???n Ho??i Ph????ng Y???n',0,'100122','B???c Li??u','15/02/2002','09000353','2051052007An@ou.edu.vn','none'),(124,'Ph???m L?? Ho??i Xinh',0,'100123','B???n Tre','05/03/2002','09000354','2051052009Bang@ou.edu.vn','none'),(125,'Ph???m L??u Qu???nh Nh??',0,'100124','C?? Mau','16/01/2002','09000355','2051052013Cuong@ou.edu.vn','none'),(126,'Phan Ho??ng Ph??',0,'100125','C???n Th??','03/11/2002','09000356','2051052016Cuong@ou.edu.vn','none'),(127,'L?? H??? Thi??n B???o',0,'100126','?????ng Th??p','07/03/2002','09000357','2051052011Chien@ou.edu.vn','none'),(128,'Nguy???n Th??? M??? Duy??n',0,'100127','H???u Giang','05/09/2002','09000358','2051052012Chuong@ou.edu.vn','none'),(129,'Nguy???n Ho??ng H???c',0,'100128','Ki??n Giang','31/12/2002','09000359','2051052022Du@ou.edu.vn','none'),(130,'L?? Minh H???u',0,'100129','Long An','01/08/2002','09000360','2051052023Dung@ou.edu.vn','none'),(131,'Nguy???n Nh???t Huy',0,'100130','S??c Tr??ng','25/07/2002','09000361','2051052021Duy@ou.edu.vn','none'),(132,'Nguy???n Ng???c Th???o Ng??n',0,'100131','Ti???n Giang','10/07/2002','09000362','2051052026Dat@ou.edu.vn','none'),(133,'L?? T???n Ph??t',0,'100132','Tr?? Vinh','12/02/2002','09000363','2051052027Dat@ou.edu.vn','none'),(134,'Tr???n Thanh Ho??ng Ph??c',0,'100133','V??nh Long','10/07/2002','09000364','2051052030Duc@ou.edu.vn','none'),(135,'L?? Th??? Ph????ng Quy??n',0,'100134','An Giang','10/12/2002','09000365','2051052031Duc@ou.edu.vn','none'),(136,'L?? Th??? Tuy???t Trinh',0,'100135','B???c Li??u','27/01/2002','09000366','2051052032Giang@ou.edu.vn','none'),(137,'Kh????ng Tu???n Ki???t',0,'100136','B???n Tre','05/05/2002','09000367','2051052034Hai@ou.edu.vn','none'),(138,'V?? Th??nh ?????t',1,'100137','An Giang','11/11/2002','09000368','2051052036Hau@ou.edu.vn','none'),(139,'Tr???n Nguy???n Ng???c H??',0,'100138','B???c Li??u','05/09/2002','09000369','2051052040Hieu@ou.edu.vn','none'),(140,'Nguy???n Thanh Phong',0,'100139','B???n Tre','11/09/2002','09000370','2051052041Hieu@ou.edu.vn','none'),(141,'Nguy???n Th??? Nh?? Ph?????ng',0,'100140','C?? Mau','01/01/2002','09000371','2051052044Hoa@ou.edu.vn','none'),(142,'H?? V?? Ho??ng V??',0,'100141','C???n Th??','23/01/2002','09000372','2051052050Hoa@ou.edu.vn','none'),(143,'????? M???nh Ti???n',0,'100142','?????ng Th??p','03/02/2002','09000373','2051052048Hoang@ou.edu.vn','none'),(144,'H??? Nguy???n Ph????ng Anh',0,'100143','An Giang','17/08/2002','09000374','2051052049Hoang@ou.edu.vn','none'),(145,'Tr????ng Nguy???n Qu???c Anh',0,'100144','B???c Li??u','13/05/2002','09000375','2051052052Hop@ou.edu.vn','none'),(146,'Nguy???n ????? Th??nh C??ng',0,'100145','B???n Tre','28/12/2002','09000376','2051052059Hung@ou.edu.vn','none'),(147,'Ho??ng Tr???ng H???u',0,'100146','C?? Mau','02/02/2002','09000377','2051052060Hung@ou.edu.vn','none'),(148,'Phan Ho??ng Huy',0,'100147','C???n Th??','27/09/2001','09000378','2051052056Huy@ou.edu.vn','none'),(149,'Qu??ch Ph???m Tu???n Ki???t',0,'100148','?????ng Th??p','12/04/2002','09000379','2051052057Huy@ou.edu.vn','none'),(150,'??inh L?? Y???n Linh',0,'100149','H???u Giang','03/01/2002','09000380','2051052058Huy@ou.edu.vn','none'),(151,'?????ng Nguy???n Ho??i ',0,'100150','Ki??n Giang','13/02/2002','09000381','2051052070Ky@ou.edu.vn','none'),(152,'V?? Th??? M???ng Nghi',0,'100151','Long An','18/12/2002','09000382','2051052066Khoi@ou.edu.vn','none'),(153,'L?? Th??? Thanh Nh??n',0,'100152','S??c Tr??ng','02/02/2002','09000383','2051050251Luan@ou.edu.vn','none'),(154,'L?? An Nhi??n',0,'100153','Ti???n Giang','02/03/2002','09000384','2051052077Luan@ou.edu.vn','none'),(155,'Nguy???n V??n Ho??ng Ph??y',1,'100154','Tr?? Vinh','07/02/2001','09000385','2051052082My@ou.edu.vn','none'),(156,'Nguy???n T??n Ph??c',0,'100155','V??nh Long','27/07/2002','09000386','20510520840@ou.edu.vn','none'),(157,'Nguy???n Th??? Di???m Qu???nh',0,'100156','An Giang','03/09/2002','09000387','20510520850@ou.edu.vn','none'),(158,'Nguy???n Ng?? Th??i Vy',0,'100157','An Giang','11/04/2002','09000388','2051052088Ngan@ou.edu.vn','none'),(159,'Ph???m ??o??n Kh??nh Vy',0,'100158','B???c Li??u','19/06/2002','09000389','2051052090Nghia@ou.edu.vn','none'),(160,'Ch??u Gia Huy',0,'100159','B???n Tre','06/09/2002','09000390','2051052093Nhung@ou.edu.vn','none'),(161,'Tr????ng V?? Khang',0,'100160','C?? Mau','31/12/2001','09000391','2051052095Phan@ou.edu.vn','none'),(162,'L?? Ho??n M???',0,'100161','C???n Th??','04/10/2002','09000392','2051052098Phong@ou.edu.vn','none'),(163,'Nguy???n Hu???nh Y???n Nhi',0,'100162','?????ng Th??p','08/09/2002','09000393','2051052100Phu@ou.edu.vn','none'),(164,'L?? Th??? Qu???nh Nh??',0,'100163','H???u Giang','14/04/2002','09000394','2051052103Phuc@ou.edu.vn','none'),(165,'?????ng Thanh To??n',0,'100164','Ki??n Giang','04/12/1997','09000395','2051052108Quang@ou.edu.vn','none'),(166,'Di???p Y???n Vy',0,'100165','Long An','24/12/2002','09000396','2051052111Quoc@ou.edu.vn','none'),(167,'Ch??u Mai Xu??n',0,'100166','S??c Tr??ng','16/07/2002','09000397','2051052139Tinh@ou.edu.vn','none'),(168,'L?? Ng???c Hi???u',0,'100167','Ti???n Giang','02/03/2002','09000398','2051052148Tu@ou.edu.vn','none'),(169,'Nguy???n Ng???c Huy',0,'100168','Tr?? Vinh','10/01/2002','09000399','2051052121Thanh@ou.edu.vn','none'),(170,'B??i Th??? Di???m H????ng',0,'100169','V??nh Long','02/10/2002','09000400','2051052129Thang@ou.edu.vn','none'),(171,'Ph???m Ho??ng Khang',0,'100170','An Giang','11/11/2002','09000401','2051052130Thien@ou.edu.vn','none'),(172,'??inh Th??? Thu Ng??n',0,'100171','B???c Li??u','13/01/2002','09000402','2051052131Thien@ou.edu.vn','none'),(173,'L??m D??n Ph??c',0,'100172','B???n Tre','17/09/2002','09000403','2055012088Truc@ou.edu.vn','none'),(174,'L?? Ho??ng Ph??c',0,'100173','An Giang','21/04/2002','09000404','2051012122Trung@ou.edu.vn','none'),(175,'L?? Quang Ph?????c',0,'100174','B???c Li??u','01/04/2002','09000405','2051052152Vinh@ou.edu.vn','none'),(176,'Ph???m H??? Ho??ng Qu??',0,'100175','B???n Tre','07/04/2002','09000406','2051052155Vu@ou.edu.vn','none'),(177,'D????ng Ho??ng Nh???t T??n',0,'100176','C?? Mau','04/09/2002','09000407','2051052157Vy@ou.edu.vn','none');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student__class__school_year`
--

DROP TABLE IF EXISTS `student__class__school_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student__class__school_year` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_student` int NOT NULL,
  `id_class` int NOT NULL,
  `id_school_year` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_student` (`id_student`),
  KEY `id_class` (`id_class`),
  KEY `id_school_year` (`id_school_year`),
  CONSTRAINT `student__class__school_year_ibfk_1` FOREIGN KEY (`id_student`) REFERENCES `student` (`id`),
  CONSTRAINT `student__class__school_year_ibfk_2` FOREIGN KEY (`id_class`) REFERENCES `class` (`id`),
  CONSTRAINT `student__class__school_year_ibfk_3` FOREIGN KEY (`id_school_year`) REFERENCES `school_year` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student__class__school_year`
--

LOCK TABLES `student__class__school_year` WRITE;
/*!40000 ALTER TABLE `student__class__school_year` DISABLE KEYS */;
/*!40000 ALTER TABLE `student__class__school_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_subject` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'sinh 10'),(2,'sinh 11'),(3,'sinh 12'),(4,'s??? 10'),(5,'s??? 11'),(6,'s??? 12'),(7,'?????a 10'),(8,'?????a 11'),(9,'?????a 12'),(10,'to??n 10 '),(11,'to??n 11'),(12,'to??n 12'),(13,'l?? 10'),(14,'l?? 11'),(15,'l?? 12'),(16,'h??a 10'),(17,'h??a 11'),(18,'h??a 12'),(19,'gi??o d???c c??ng d??n 10'),(20,'gi??o d???c c??ng d??n 11'),(21,'gi??o d???c c??ng d??n 12'),(22,'tin h???c 10'),(23,'tin h???c 11'),(24,'tin h???c 12'),(25,'ti???ng anh 10'),(26,'ti???ng anh 11'),(27,'ti???ng anh 12');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaching_class`
--

DROP TABLE IF EXISTS `teaching_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teaching_class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_teacher` int NOT NULL,
  `id_class` int NOT NULL,
  `id_school_year` int NOT NULL,
  `id_subject` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_teacher` (`id_teacher`),
  KEY `id_class` (`id_class`),
  KEY `id_school_year` (`id_school_year`),
  KEY `id_subject` (`id_subject`),
  CONSTRAINT `teaching_class_ibfk_1` FOREIGN KEY (`id_teacher`) REFERENCES `user` (`id`),
  CONSTRAINT `teaching_class_ibfk_2` FOREIGN KEY (`id_class`) REFERENCES `class` (`id`),
  CONSTRAINT `teaching_class_ibfk_3` FOREIGN KEY (`id_school_year`) REFERENCES `school_year` (`id`),
  CONSTRAINT `teaching_class_ibfk_4` FOREIGN KEY (`id_subject`) REFERENCES `subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaching_class`
--

LOCK TABLES `teaching_class` WRITE;
/*!40000 ALTER TABLE `teaching_class` DISABLE KEYS */;
INSERT INTO `teaching_class` VALUES (1,1,1,1,1),(2,2,1,1,4),(3,3,1,1,7),(4,4,1,1,10),(5,5,1,1,13),(6,6,1,1,16),(7,7,1,1,19),(8,8,1,1,22),(9,9,1,1,25),(10,1,2,1,1),(11,2,2,1,4),(12,3,2,1,7),(13,4,2,1,10),(14,5,2,1,13),(15,6,2,1,16),(16,7,2,1,19),(17,8,2,1,22),(18,9,2,1,25),(19,1,3,1,1),(20,2,3,1,4),(21,3,3,1,7),(22,4,3,1,10),(23,5,3,1,13),(24,6,3,1,16),(25,7,3,1,19),(26,8,3,1,22),(27,9,3,1,25);
/*!40000 ALTER TABLE `teaching_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_score`
--

DROP TABLE IF EXISTS `type_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_score` (
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_score`
--

LOCK TABLES `type_score` WRITE;
/*!40000 ALTER TABLE `type_score` DISABLE KEYS */;
INSERT INTO `type_score` VALUES ('15m'),('45m'),('final_test'),('mid_test'),('quick_test');
/*!40000 ALTER TABLE `type_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `identity` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hometown` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Nguy???n Ho??ng H???c',0,'100128','Ki??n Giang','31/12/2002','9000359','2051052022Du@ou.edu.vn','user:1','202cb962ac59075b964b07152d234b70','https://images.unsplash.com/photo-1505159940484-eb2b9f2588e2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','1'),(2,'L?? Minh H???u',0,'100129','Long An','01/08/2002','9000360','2051052023Dung@ou.edu.vn','user:2','202cb962ac59075b964b07152d234b70','https://images.unsplash.com/photo-1503424886307-b090341d25d1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80','1'),(3,'Nguy???n Nh???t Huy',0,'100130','S??c Tr??ng','25/07/2002','9000361','2051052021Duy@ou.edu.vn','user:3','202cb962ac59075b964b07152d234b70','https://images.unsplash.com/photo-1515825838458-f2a94b20105a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80','1'),(4,'Nguy???n Ng???c Th???o Ng??n',0,'100131','Ti???n Giang','10/07/2002','9000362','2051052026Dat@ou.edu.vn','user:4','202cb962ac59075b964b07152d234b70','https://images.unsplash.com/photo-1461301214746-1e109215d6d3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','1'),(5,'L?? T???n Ph??t',0,'100132','Tr?? Vinh','12/02/2002','9000363','2051052027Dat@ou.edu.vn','user:5','202cb962ac59075b964b07152d234b70','https://images.unsplash.com/photo-1505159940484-eb2b9f2588e2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=81','1'),(6,'Tr???n Thanh Ho??ng Ph??c',0,'100133','V??nh Long','10/07/2002','9000364','2051052030Duc@ou.edu.vn','user:6','202cb962ac59075b964b07152d234b70','https://images.unsplash.com/photo-1503424886307-b090341d25d1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=81','1'),(7,'L?? Th??? Ph????ng Quy??n',0,'100134','An Giang','10/12/2002','9000365','2051052031Duc@ou.edu.vn','user:7','202cb962ac59075b964b07152d234b70','https://images.unsplash.com/photo-1515825838458-f2a94b20105a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=81','1'),(8,'?????ng V??? Kh??i',0,'100135','Long An','18/12/2002','999999','khoi@gmail.com','user:8','202cb962ac59075b964b07152d234b70','https://images.unsplash.com/photo-1461301214746-1e109215d6d3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','1'),(9,'V?? H???u Ngh??a',0,'100136','Gia Lai','10/07/2002','999999','nghia@gmail.com','q??e','202cb962ac59075b964b07152d234b70','https://images.unsplash.com/photo-1461301214746-1e109215d6d3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','1'),(10,'Nguy???n Qu???c K???',0,'100137','B??nh ?????nh','1/1/2002','12345363','ky@gmail.com','q??','202cb962ac59075b964b07152d234b70','https://images.unsplash.com/photo-1503424886307-b090341d25d1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=81','1'),(28,'?????ng V??? Kh??i',1,'1234','Long An','2022-12-07','0937793157','2051062066khoi@ou.edu.vn','DangVyKhoi','202cb962ac59075b964b07152d234b70','co hinh anh','1'),(49,'?????ng V??? Kh??i',1,'142543321','Long An','2022-12-23','0937793157','2051062066khoi@ou.edu.vn','khoi12','c20ad4d76fe97759aa27a0c99bff6710','https://res.cloudinary.com/dendeb697/image/upload/v1670087902/qrfzcatnocbm6a7jp4hc.png','1'),(50,'Vy VY',1,'9999','Long An','2022-12-29','0937793157','2051062066khoi@ou.edu.vn','vyvy','202cb962ac59075b964b07152d234b70','https://res.cloudinary.com/dendeb697/image/upload/v1670096999/xksfq2uudy2nmfgcvsev.jpg','1');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `role` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`role`,`id_user`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`role`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES ('academic_staff',1),('teacher',1),('teacher',2),('teacher',3),('teacher',4),('teacher',5),('teacher',6),('teacher',7),('teacher',8),('teacher',9),('teacher',10),('academic_staff',28),('teacher',28),('academic_staff',49),('academic_staff',50);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_subject`
--

DROP TABLE IF EXISTS `user_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_subject` (
  `id_user` int NOT NULL,
  `id_sub` int NOT NULL,
  PRIMARY KEY (`id_user`,`id_sub`),
  KEY `id_sub` (`id_sub`),
  CONSTRAINT `user_subject_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  CONSTRAINT `user_subject_ibfk_2` FOREIGN KEY (`id_sub`) REFERENCES `subjects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_subject`
--

LOCK TABLES `user_subject` WRITE;
/*!40000 ALTER TABLE `user_subject` DISABLE KEYS */;
INSERT INTO `user_subject` VALUES (1,1),(1,2),(1,3),(2,4),(2,5),(2,6),(3,7),(3,8),(3,9),(4,10),(4,11),(4,12),(5,13),(5,14),(5,15),(6,16),(6,17),(6,18),(7,19),(7,20),(7,21),(8,22),(8,23),(8,24),(9,25),(9,26),(9,27);
/*!40000 ALTER TABLE `user_subject` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-04 20:57:27
