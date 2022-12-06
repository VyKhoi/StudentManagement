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
INSERT INTO `news` VALUES (1,'CÔNG NGHỆ SINH HỌC CHUYÊN NGÀNH CÔNG NGHỆ THỰC PHẨM','1️. Sống thì phải có kế hoạch, mục tiêu rõ ràng. Đừng ậm ờ thế nào cũng được.','11/12/2022','https://images.pexels.com/photos/753626/pexels-photo-753626.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2','1',1),(2,'Thông báo về việc tuyển sinh trình độ đại học hình thức đào tạo từ xa (Đợt 6 năm 2022)','Không chỉ riêng Đại bàng mới có cơ chế này, quả mắt không tròng này còn xuất hiện ở Cá, loài Lưỡng cư, bò sát, Mèo, Gấu Bắc Cực, Hải ly, Lạc đà...Thậm chí xuất hiện trên cả các loài Linh trưởng như Vượn cáo.','01/01/2022','https://images.pexels.com/photos/206359/pexels-photo-206359.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2','1',2),(3,'Không chỉ riêng Đại bàng mới có cơ chế này, quả mắt không tròng ','Chuyến thăm diễn ra trong bối cảnh quan hệ giữa Việt Nam với Australia và New Zealand đang phát triển thuận lợi và đạt hiệu quả. Chuyến thăm có ý nghĩa quan trọng, là chuyến thăm chính thức Australia và New Zealand đầu tiên của đồng chí Vương Đình Huệ trên cương vị Chủ tịch Quốc hội. Đây cũng là chuyến thăm đầu tiên của lãnh đạo cấp cao ','02/05/2021','https://images.pexels.com/photos/737586/pexels-photo-737586.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2','1',3),(4,'Cần xem xét vị trí đất khi đền bù, giải tỏa của dự án Vành đai 3','Chuyến thăm diễn ra trong bối cảnh quan hệ giữa Việt Nam với Australia và New Zealand đang phát triển thuận lợi và đạt hiệu quả. Chuyến thăm có ý nghĩa quan trọng, là chuyến thăm chính thức Australia và New Zealand đầu tiên của đồng chí Vương Đình Huệ trên cương vị Chủ tịch Quốc hội. Đây cũng là chuyến thăm đầu tiên của lãnh đạo cấp cao ','05/06/2022','https://images.pexels.com/photos/753626/pexels-photo-753626.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2','1',4),(5,'Lấy tư tưởng “dân là gốc” làm nền tảng cốt lõi cho cán bộ làm công tác Mặt trận các cấp','1️. Sống thì phải có kế hoạch, mục tiêu rõ ràng. Đừng ậm ờ thế nào cũng được.','11/12/2022','https://images.pexels.com/photos/753626/pexels-photo-753626.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=3','1',5),(6,'Thông báo về việc tuyển sinh trình độ đại học hình thức đào tạo từ xa (Đợt 6 năm 2022)','Không chỉ riêng Đại bàng mới có cơ chế này, quả mắt không tròng này còn xuất hiện ở Cá, loài Lưỡng cư, bò sát, Mèo, Gấu Bắc Cực, Hải ly, Lạc đà...Thậm chí xuất hiện trên cả các loài Linh trưởng như Vượn cáo.','01/01/2022','https://images.pexels.com/photos/206359/pexels-photo-206359.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=3','2',2),(7,'Lấy tư tưởng “dân là gốc” làm nền tảng cốt lõi cho cán bộ làm công tác Mặt trận các cấp','Chuyến thăm diễn ra trong bối cảnh quan hệ giữa Việt Nam với Australia và New Zealand đang phát triển thuận lợi và đạt hiệu quả. Chuyến thăm có ý nghĩa quan trọng, là chuyến thăm chính thức Australia và New Zealand đầu tiên của đồng chí Vương Đình Huệ trên cương vị Chủ tịch Quốc hội. Đây cũng là chuyến thăm đầu tiên của lãnh đạo cấp cao ','02/05/2021','https://images.pexels.com/photos/737586/pexels-photo-737586.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=3','2',3),(8,'Bộ sưu tập NFT CR7 hiện đã được chính thức ra mắt. Độc quyền trên thị trường Binance NFT.','Chuyến thăm diễn ra trong bối cảnh quan hệ giữa Việt Nam với Australia và New Zealand đang phát triển thuận lợi và đạt hiệu quả. Chuyến thăm có ý nghĩa quan trọng, là chuyến thăm chính thức Australia và New Zealand đầu tiên của đồng chí Vương Đình Huệ trên cương vị Chủ tịch Quốc hội. Đây cũng là chuyến thăm đầu tiên của lãnh đạo cấp cao ','05/06/2022','https://images.pexels.com/photos/753626/pexels-photo-753626.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=3','2',1),(9,'CÔNG NGHỆ SINH HỌC CHUYÊN NGÀNH CÔNG NGHỆ THỰC PHẨM','1️. Sống thì phải có kế hoạch, mục tiêu rõ ràng. Đừng ậm ờ thế nào cũng được.','11/12/2022','https://images.pexels.com/photos/753626/pexels-photo-753626.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=4','2',5),(10,'Thông báo về việc tuyển sinh trình độ đại học hình thức đào tạo từ xa (Đợt 6 năm 2022)','Không chỉ riêng Đại bàng mới có cơ chế này, quả mắt không tròng này còn xuất hiện ở Cá, loài Lưỡng cư, bò sát, Mèo, Gấu Bắc Cực, Hải ly, Lạc đà...Thậm chí xuất hiện trên cả các loài Linh trưởng như Vượn cáo.','01/01/2022','https://images.pexels.com/photos/206359/pexels-photo-206359.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=4','2',1);
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
INSERT INTO `permission` VALUES (1,'thay đổi điểm số học sinh'),(2,'tạo lớp'),(3,'quản lý học sinh trong lớp'),(4,'đăng bài viết'),(5,'gán lớp giảng dạy'),(6,'thay đổi thông tin học sinh'),(7,'thay đổi quy định, quy tắc nhà trường'),(8,'đăng ký người dùng hệ thống'),(9,'sử dụng trang quảng trị hệ cơ sở dữ liệu');
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
INSERT INTO `student` VALUES (1,'Đặng Văn Trường An',0,'100000','An Giang','08/09/2002','09000231','2051052001An@ou.edu.vn','none'),(2,'Lương Viết Anh',0,'100001','Bạc Liêu','13/05/2002','09000232','2051052003Anh@ou.edu.vn','none'),(3,'Phạm Tuấn Anh',0,'100002','Bến Tre','07/07/2002','09000233','2051052004Anh@ou.edu.vn','none'),(4,'Nguyễn Chu Phước Ân',0,'100003','Cà Mau','14/04/2002','09000234','2051052006An@ou.edu.vn','none'),(5,'Trần Nguyễn Hồng Ân',1,'100004','Cần Thơ','15/02/2002','09000235','2051052007An@ou.edu.vn','none'),(6,'Lê Bằng',0,'100005','Đồng Tháp','05/03/2002','09000236','2051052009Bang@ou.edu.vn','none'),(7,'Trần Văn Cương',0,'100006','Hậu Giang','16/01/2002','09000237','2051052013Cuong@ou.edu.vn','none'),(8,'Nguyễn Tấn Cường',0,'100007','Kiên Giang','03/11/2002','09000238','2051052016Cuong@ou.edu.vn','none'),(9,'Lê Văn Chiến',0,'100008','Long An','07/03/2002','09000239','2051052011Chien@ou.edu.vn','none'),(10,'Đặng Phạm Đình Chương',0,'100009','Sóc Trăng','05/09/2002','09000240','2051052012Chuong@ou.edu.vn','none'),(11,'Nguyễn Tuấn Dũ',0,'100010','Tiền Giang','31/12/2002','09000241','2051052022Du@ou.edu.vn','none'),(12,'Bùi Xuân Dũng',0,'100011','Trà Vinh','01/08/2002','09000242','2051052023Dung@ou.edu.vn','none'),(13,'Trần Công Duy',0,'100012','Vĩnh Long','25/07/2002','09000243','2051052021Duy@ou.edu.vn','none'),(14,'Lê Quang Đạt',0,'100013','An Giang','10/07/2002','09000244','2051052026Dat@ou.edu.vn','none'),(15,'Phan Hoàng Đạt',0,'100014','Bạc Liêu','12/02/2002','09000245','2051052027Dat@ou.edu.vn','none'),(16,'Nguyễn Sư Đức',0,'100015','Bến Tre','10/07/2002','09000246','2051052030Duc@ou.edu.vn','none'),(17,'Phạm Hữu Đức',0,'100016','Cà Mau','10/12/2002','09000247','2051052031Duc@ou.edu.vn','none'),(18,'Đào Trường Giang',0,'100017','Cần Thơ','27/01/2002','09000248','2051052032Giang@ou.edu.vn','none'),(19,'Nguyễn Thanh Hải',0,'100018','Đồng Tháp','05/05/2002','09000249','2051052034Hai@ou.edu.vn','none'),(20,'Nguyễn Văn Hậu',0,'100019','Hậu Giang','11/11/2002','09000250','2051052036Hau@ou.edu.vn','none'),(21,'Đinh Minh Hiếu',0,'100020','Kiên Giang','05/09/2002','09000251','2051052040Hieu@ou.edu.vn','none'),(22,'Phạm Xuân Công Hiếu',0,'100021','Long An','11/09/2002','09000252','2051052041Hieu@ou.edu.vn','none'),(23,'Nguyễn Thị Hòa',0,'100022','Sóc Trăng','01/01/2002','09000253','2051052044Hoa@ou.edu.vn','none'),(24,'Lê Tâm Hòa',1,'100023','Tiền Giang','23/01/2002','09000254','2051052050Hoa@ou.edu.vn','none'),(25,'Phạm Tấn Hoàng',0,'100024','Trà Vinh','03/02/2002','09000255','2051052048Hoang@ou.edu.vn','none'),(26,'Phùng Long Hoàng',0,'100025','Vĩnh Long','17/08/2002','09000256','2051052049Hoang@ou.edu.vn','none'),(27,'Nguyễn Tấn Hợp',0,'100026','An Giang','13/05/2002','09000257','2051052052Hop@ou.edu.vn','none'),(28,'Đậu Xuân Hoàng Hùng',0,'100027','Bạc Liêu','28/12/2002','09000258','2051052059Hung@ou.edu.vn','none'),(29,'Phạm Hùng',0,'100028','Bến Tre','02/02/2002','09000259','2051052060Hung@ou.edu.vn','none'),(30,'Hàng Đức Huy',0,'100029','An Giang','27/09/2001','09000260','2051052056Huy@ou.edu.vn','none'),(31,'Mai Khánh Huy',0,'100030','Bạc Liêu','12/04/2002','09000261','2051052057Huy@ou.edu.vn','none'),(32,'Nguyễn Quốc Huy',0,'100031','Bến Tre','03/01/2002','09000262','2051052058Huy@ou.edu.vn','none'),(33,'Nguyễn Quốc Kỳ',0,'100032','Cà Mau','13/02/2002','09000263','2051052070Ky@ou.edu.vn','none'),(34,'Đặng Vỹ Khôi',0,'100033','Cần Thơ','18/12/2002','09000264','2051052066Khoi@ou.edu.vn','none'),(35,'Nguyễn Đình Luân',0,'100034','Đồng Tháp','02/02/2002','09000265','2051050251Luan@ou.edu.vn','none'),(36,'Nguyễn Ngọc Luân',0,'100035','An Giang','02/03/2002','09000266','2051052077Luan@ou.edu.vn','none'),(37,'Trịnh Huỳnh My',0,'100036','Bạc Liêu','07/02/2001','09000267','2051052082My@ou.edu.vn','none'),(38,'Hoàng Văn 0',0,'100037','Bến Tre','27/07/2002','09000268','20510520840@ou.edu.vn','none'),(39,'Nguyễn Phương 0',0,'100038','Cà Mau','03/09/2002','09000269','20510520850@ou.edu.vn','none'),(40,'Nguyễn Lê Trúc Ngân',0,'100039','Cần Thơ','11/04/2002','09000270','2051052088Ngan@ou.edu.vn','none'),(41,'Võ Hữu Nghĩa',1,'100040','Đồng Tháp','19/06/2002','09000271','2051052090Nghia@ou.edu.vn','none'),(42,'Nguyễn Thị Hồng Nhung',0,'100041','Hậu Giang','06/09/2002','09000272','2051052093Nhung@ou.edu.vn','none'),(43,'Vũ Hoàng Phan',0,'100042','Kiên Giang','31/12/2001','09000273','2051052095Phan@ou.edu.vn','none'),(44,'Đoàn Trung Phong',0,'100043','Long An','04/10/2002','09000274','2051052098Phong@ou.edu.vn','none'),(45,'Nguyễn Hoàng Gia Phú',0,'100044','Sóc Trăng','08/09/2002','09000275','2051052100Phu@ou.edu.vn','none'),(46,'Nguyễn Hồng Phúc',0,'100045','Tiền Giang','14/04/2002','09000276','2051052103Phuc@ou.edu.vn','none'),(47,'Lê Anh Quang',0,'100046','Trà Vinh','04/12/1997','09000277','2051052108Quang@ou.edu.vn','none'),(48,'Nguyễn Anh Quốc',0,'100047','Vĩnh Long','24/12/2002','09000278','2051052111Quoc@ou.edu.vn','none'),(49,'Võ Thành Tính',0,'100048','An Giang','16/07/2002','09000279','2051052139Tinh@ou.edu.vn','none'),(50,'Nguyễn Quốc Tuấn Tú',0,'100049','An Giang','02/03/2002','09000280','2051052148Tu@ou.edu.vn','none'),(51,'Sú Lê Lâm Thanh',0,'100050','Bạc Liêu','10/01/2002','09000281','2051052121Thanh@ou.edu.vn','none'),(52,'Võ Xuân Thành Thắng',0,'100051','Bến Tre','02/10/2002','09000282','2051052129Thang@ou.edu.vn','none'),(53,'Lê Minh Thiện',0,'100052','Cà Mau','11/11/2002','09000283','2051052130Thien@ou.edu.vn','none'),(54,'Mã Quang Thiện',0,'100053','Cần Thơ','13/01/2002','09000284','2051052131Thien@ou.edu.vn','none'),(55,'Đinh Hoàng Thanh Trúc',0,'100054','Đồng Tháp','17/09/2002','09000285','2055012088Truc@ou.edu.vn','none'),(56,'Nguyễn Anh Trung',0,'100055','Hậu Giang','21/04/2002','09000286','2051012122Trung@ou.edu.vn','none'),(57,'Lê Hiển Vinh',0,'100056','Kiên Giang','01/04/2002','09000287','2051052152Vinh@ou.edu.vn','none'),(58,'Võ Xuân Vũ',0,'100057','Long An','07/04/2002','09000288','2051052155Vu@ou.edu.vn','none'),(59,'Dương Thị Kiều Vy',1,'100058','Sóc Trăng','04/09/2002','09000289','2051052157Vy@ou.edu.vn','none'),(60,'Dương Thị Mỹ Trinh',0,'100059','Tiền Giang','08/09/2002','09000290','2051052001An@ou.edu.vn','none'),(61,'Phan Y Tịnh',0,'100060','Trà Vinh','13/05/2002','09000291','2051052003Anh@ou.edu.vn','none'),(62,'Trương Thanh Vi',0,'100061','Vĩnh Long','07/07/2002','09000292','2051052004Anh@ou.edu.vn','none'),(63,'Hồ Bảo An',0,'100062','An Giang','14/04/2002','09000293','2051052006An@ou.edu.vn','none'),(64,'Trần Minh Đăng Khoa',1,'100063','Bạc Liêu','15/02/2002','09000294','2051052007An@ou.edu.vn','none'),(65,'Phạm Thị Kiều Mi',0,'100064','Bến Tre','05/03/2002','09000295','2051052009Bang@ou.edu.vn','none'),(66,'Đỗ Nhật Tâm',0,'100065','An Giang','16/01/2002','09000296','2051052013Cuong@ou.edu.vn','none'),(67,'Đỗ Hiếu Thành',0,'100066','Bạc Liêu','03/11/2002','09000297','2051052016Cuong@ou.edu.vn','none'),(68,'Lê Thị Minh Trang',0,'100067','Bến Tre','07/03/2002','09000298','2051052011Chien@ou.edu.vn','none'),(69,'Trần Phạm Cẩm Tú',0,'100068','Cà Mau','05/09/2002','09000299','2051052012Chuong@ou.edu.vn','none'),(70,'Tô Vĩnh Tường',0,'100069','Cần Thơ','31/12/2002','09000300','2051052022Du@ou.edu.vn','none'),(71,'Nguyễn Cẩm Vy',0,'100070','Đồng Tháp','01/08/2002','09000301','2051052023Dung@ou.edu.vn','none'),(72,'Lê Trương Thị Huyền Diệu',0,'100071','An Giang','25/07/2002','09000302','2051052021Duy@ou.edu.vn','none'),(73,'Vũ Đình Hải Đăng',0,'100072','Bạc Liêu','10/07/2002','09000303','2051052026Dat@ou.edu.vn','none'),(74,'Mai Chấn Hoàng',0,'100073','Bến Tre','12/02/2002','09000304','2051052027Dat@ou.edu.vn','none'),(75,'Phan Tấn Đạt',0,'100074','Cà Mau','10/07/2002','09000305','2051052030Duc@ou.edu.vn','none'),(76,'Đỗ Huy Hoàng',0,'100075','Cần Thơ','10/12/2002','09000306','2051052031Duc@ou.edu.vn','none'),(77,'Trần Mỹ Kim',0,'100076','Đồng Tháp','27/01/2002','09000307','2051052032Giang@ou.edu.vn','none'),(78,'Huỳnh Thị Cẩm Lang',0,'100077','Hậu Giang','05/05/2002','09000308','2051052034Hai@ou.edu.vn','none'),(79,'Trịnh Thị Mỹ Linh',0,'100078','Kiên Giang','11/11/2002','09000309','2051052036Hau@ou.edu.vn','none'),(80,'Lâm Hữu Nghĩa',0,'100079','Long An','05/09/2002','09000310','2051052040Hieu@ou.edu.vn','none'),(81,'Nguyễn Trần Hiếu Nghĩa',0,'100080','Sóc Trăng','11/09/2002','09000311','2051052041Hieu@ou.edu.vn','none'),(82,'Dương Thị Thảo Như',0,'100081','Tiền Giang','01/01/2002','09000312','2051052044Hoa@ou.edu.vn','none'),(83,'Châu Nhật Phúc',1,'100082','Trà Vinh','23/01/2002','09000313','2051052050Hoa@ou.edu.vn','none'),(84,'Nguyễn Văn Tân',0,'100083','Vĩnh Long','03/02/2002','09000314','2051052048Hoang@ou.edu.vn','none'),(85,'Cao Minh Thiện',0,'100084','An Giang','17/08/2002','09000315','2051052049Hoang@ou.edu.vn','none'),(86,'Nguyễn Ngọc Thanh Thùy',0,'100085','An Giang','13/05/2002','09000316','2051052052Hop@ou.edu.vn','none'),(87,'Đỗ Thị Minh Thư',0,'100086','Bạc Liêu','28/12/2002','09000317','2051052059Hung@ou.edu.vn','none'),(88,'Trần Thị Hoài Thương',0,'100087','Bến Tre','02/02/2002','09000318','2051052060Hung@ou.edu.vn','none'),(89,'Huỳnh Nguyễn Thanh Vân',0,'100088','Cà Mau','27/09/2001','09000319','2051052056Huy@ou.edu.vn','none'),(90,'Trần Đăng Thảo Vy',0,'100089','Cần Thơ','12/04/2002','09000320','2051052057Huy@ou.edu.vn','none'),(91,'Trần Ngọc Thúy An',0,'100090','Đồng Tháp','03/01/2002','09000321','2051052058Huy@ou.edu.vn','none'),(92,'Nguyễn Quang Vinh',0,'100091','Hậu Giang','13/02/2002','09000322','2051052070Ky@ou.edu.vn','none'),(93,'Trịnh Ngọc Xuân Ly',0,'100092','Kiên Giang','18/12/2002','09000323','2051052066Khoi@ou.edu.vn','none'),(94,'Khổng Minh Triết',0,'100093','Long An','02/02/2002','09000324','2051050251Luan@ou.edu.vn','none'),(95,'Cao Nhật Hào',0,'100094','Sóc Trăng','02/03/2002','09000325','2051052077Luan@ou.edu.vn','none'),(96,'Nguyễn Quốc Toàn',0,'100095','Tiền Giang','07/02/2001','09000326','2051052082My@ou.edu.vn','none'),(97,'Trần Thị Tâm Cơ',0,'100096','Trà Vinh','27/07/2002','09000327','20510520840@ou.edu.vn','none'),(98,'Đỗ Thanh Danh',0,'100097','Vĩnh Long','03/09/2002','09000328','20510520850@ou.edu.vn','none'),(99,'Nguyễn Văn Hiếu',0,'100098','An Giang','11/04/2002','09000329','2051052088Ngan@ou.edu.vn','none'),(100,'Ngô Thanh Hoàng',1,'100099','Bạc Liêu','19/06/2002','09000330','2051052090Nghia@ou.edu.vn','none'),(101,'Trần Văn Hoàng',0,'100100','Bến Tre','06/09/2002','09000331','2051052093Nhung@ou.edu.vn','none'),(102,'Lê Gia Huy',0,'100101','An Giang','31/12/2001','09000332','2051052095Phan@ou.edu.vn','none'),(103,'Nguyễn Mai Ngọc Khải',0,'100102','Bạc Liêu','04/10/2002','09000333','2051052098Phong@ou.edu.vn','none'),(104,'Nguyễn Minh Kiên',0,'100103','Bến Tre','08/09/2002','09000334','2051052100Phu@ou.edu.vn','none'),(105,'Lý Khải Kiệt',0,'100104','Cà Mau','14/04/2002','09000335','2051052103Phuc@ou.edu.vn','none'),(106,'Võ Công Kỳ',0,'100105','Cần Thơ','04/12/1997','09000336','2051052108Quang@ou.edu.vn','none'),(107,'Lê Võ Huyền Linh',0,'100106','Đồng Tháp','24/12/2002','09000337','2051052111Quoc@ou.edu.vn','none'),(108,'Võ Nhật Minh',0,'100107','An Giang','16/07/2002','09000338','2051052139Tinh@ou.edu.vn','none'),(109,'Trương Thị Thúy My',0,'100108','Bạc Liêu','02/03/2002','09000339','2051052148Tu@ou.edu.vn','none'),(110,'Tô Thanh Nhã',0,'100109','Bến Tre','10/01/2002','09000340','2051052121Thanh@ou.edu.vn','none'),(111,'Đặng Ngọc Nhân',0,'100110','Cà Mau','02/10/2002','09000341','2051052129Thang@ou.edu.vn','none'),(112,'Hoàng Minh Nhật',0,'100111','Cần Thơ','11/11/2002','09000342','2051052130Thien@ou.edu.vn','none'),(113,'Lê Tâm Nhi',0,'100112','Đồng Tháp','13/01/2002','09000343','2051052131Thien@ou.edu.vn','none'),(114,'Tôn 1 Uyển Nhi',0,'100113','Hậu Giang','17/09/2002','09000344','2055012088Truc@ou.edu.vn','none'),(115,'Nguyễn Thảo Quyên',0,'100114','Kiên Giang','21/04/2002','09000345','2051012122Trung@ou.edu.vn','none'),(116,'Nguyễn Quyết Tâm',0,'100115','Long An','01/04/2002','09000346','2051052152Vinh@ou.edu.vn','none'),(117,'Lý Đức Thịnh',0,'100116','Sóc Trăng','07/04/2002','09000347','2051052155Vu@ou.edu.vn','none'),(118,'Ngô Đức Thịnh',0,'100117','Tiền Giang','04/09/2002','09000348','2051052157Vy@ou.edu.vn','none'),(119,'Đặng Hoài Thương',1,'100118','Trà Vinh','08/09/2002','09000349','2051052001An@ou.edu.vn','none'),(120,'Lê Trần Mai Trâm',0,'100119','Vĩnh Long','13/05/2002','09000350','2051052003Anh@ou.edu.vn','none'),(121,'Võ Minh Trí',0,'100120','An Giang','07/07/2002','09000351','2051052004Anh@ou.edu.vn','none'),(122,'Lê Mỹ Uyên',0,'100121','An Giang','14/04/2002','09000352','2051052006An@ou.edu.vn','none'),(123,'Nguyễn Hoài Phương Yến',0,'100122','Bạc Liêu','15/02/2002','09000353','2051052007An@ou.edu.vn','none'),(124,'Phạm Lê Hoài Xinh',0,'100123','Bến Tre','05/03/2002','09000354','2051052009Bang@ou.edu.vn','none'),(125,'Phạm Lưu Quỳnh Như',0,'100124','Cà Mau','16/01/2002','09000355','2051052013Cuong@ou.edu.vn','none'),(126,'Phan Hoàng Phú',0,'100125','Cần Thơ','03/11/2002','09000356','2051052016Cuong@ou.edu.vn','none'),(127,'Lê Hồ Thiên Bảo',0,'100126','Đồng Tháp','07/03/2002','09000357','2051052011Chien@ou.edu.vn','none'),(128,'Nguyễn Thị Mỹ Duyên',0,'100127','Hậu Giang','05/09/2002','09000358','2051052012Chuong@ou.edu.vn','none'),(129,'Nguyễn Hoàng Hạc',0,'100128','Kiên Giang','31/12/2002','09000359','2051052022Du@ou.edu.vn','none'),(130,'Lê Minh Hậu',0,'100129','Long An','01/08/2002','09000360','2051052023Dung@ou.edu.vn','none'),(131,'Nguyễn Nhật Huy',0,'100130','Sóc Trăng','25/07/2002','09000361','2051052021Duy@ou.edu.vn','none'),(132,'Nguyễn Ngọc Thảo Ngân',0,'100131','Tiền Giang','10/07/2002','09000362','2051052026Dat@ou.edu.vn','none'),(133,'Lê Tấn Phát',0,'100132','Trà Vinh','12/02/2002','09000363','2051052027Dat@ou.edu.vn','none'),(134,'Trần Thanh Hoàng Phúc',0,'100133','Vĩnh Long','10/07/2002','09000364','2051052030Duc@ou.edu.vn','none'),(135,'Lê Thị Phương Quyên',0,'100134','An Giang','10/12/2002','09000365','2051052031Duc@ou.edu.vn','none'),(136,'Lê Thị Tuyết Trinh',0,'100135','Bạc Liêu','27/01/2002','09000366','2051052032Giang@ou.edu.vn','none'),(137,'Khương Tuấn Kiệt',0,'100136','Bến Tre','05/05/2002','09000367','2051052034Hai@ou.edu.vn','none'),(138,'Vũ Thành Đạt',1,'100137','An Giang','11/11/2002','09000368','2051052036Hau@ou.edu.vn','none'),(139,'Trần Nguyễn Ngọc Hà',0,'100138','Bạc Liêu','05/09/2002','09000369','2051052040Hieu@ou.edu.vn','none'),(140,'Nguyễn Thanh Phong',0,'100139','Bến Tre','11/09/2002','09000370','2051052041Hieu@ou.edu.vn','none'),(141,'Nguyễn Thị Như Phượng',0,'100140','Cà Mau','01/01/2002','09000371','2051052044Hoa@ou.edu.vn','none'),(142,'Hà Võ Hoàng Vũ',0,'100141','Cần Thơ','23/01/2002','09000372','2051052050Hoa@ou.edu.vn','none'),(143,'Đỗ Mạnh Tiến',0,'100142','Đồng Tháp','03/02/2002','09000373','2051052048Hoang@ou.edu.vn','none'),(144,'Hồ Nguyễn Phương Anh',0,'100143','An Giang','17/08/2002','09000374','2051052049Hoang@ou.edu.vn','none'),(145,'Trương Nguyễn Quốc Anh',0,'100144','Bạc Liêu','13/05/2002','09000375','2051052052Hop@ou.edu.vn','none'),(146,'Nguyễn Đỗ Thành Công',0,'100145','Bến Tre','28/12/2002','09000376','2051052059Hung@ou.edu.vn','none'),(147,'Hoàng Trọng Hậu',0,'100146','Cà Mau','02/02/2002','09000377','2051052060Hung@ou.edu.vn','none'),(148,'Phan Hoàng Huy',0,'100147','Cần Thơ','27/09/2001','09000378','2051052056Huy@ou.edu.vn','none'),(149,'Quách Phạm Tuấn Kiệt',0,'100148','Đồng Tháp','12/04/2002','09000379','2051052057Huy@ou.edu.vn','none'),(150,'Đinh Lý Yến Linh',0,'100149','Hậu Giang','03/01/2002','09000380','2051052058Huy@ou.edu.vn','none'),(151,'Đặng Nguyễn Hoài ',0,'100150','Kiên Giang','13/02/2002','09000381','2051052070Ky@ou.edu.vn','none'),(152,'Võ Thị Mộng Nghi',0,'100151','Long An','18/12/2002','09000382','2051052066Khoi@ou.edu.vn','none'),(153,'Lê Thị Thanh Nhàn',0,'100152','Sóc Trăng','02/02/2002','09000383','2051050251Luan@ou.edu.vn','none'),(154,'Lê An Nhiên',0,'100153','Tiền Giang','02/03/2002','09000384','2051052077Luan@ou.edu.vn','none'),(155,'Nguyễn Văn Hoàng Pháy',1,'100154','Trà Vinh','07/02/2001','09000385','2051052082My@ou.edu.vn','none'),(156,'Nguyễn Tân Phúc',0,'100155','Vĩnh Long','27/07/2002','09000386','20510520840@ou.edu.vn','none'),(157,'Nguyễn Thị Diễm Quỳnh',0,'100156','An Giang','03/09/2002','09000387','20510520850@ou.edu.vn','none'),(158,'Nguyễn Ngô Thái Vy',0,'100157','An Giang','11/04/2002','09000388','2051052088Ngan@ou.edu.vn','none'),(159,'Phạm Đoàn Khánh Vy',0,'100158','Bạc Liêu','19/06/2002','09000389','2051052090Nghia@ou.edu.vn','none'),(160,'Châu Gia Huy',0,'100159','Bến Tre','06/09/2002','09000390','2051052093Nhung@ou.edu.vn','none'),(161,'Trương Vĩ Khang',0,'100160','Cà Mau','31/12/2001','09000391','2051052095Phan@ou.edu.vn','none'),(162,'Lê Hoàn Mỹ',0,'100161','Cần Thơ','04/10/2002','09000392','2051052098Phong@ou.edu.vn','none'),(163,'Nguyễn Huỳnh Yến Nhi',0,'100162','Đồng Tháp','08/09/2002','09000393','2051052100Phu@ou.edu.vn','none'),(164,'Lê Thị Quỳnh Như',0,'100163','Hậu Giang','14/04/2002','09000394','2051052103Phuc@ou.edu.vn','none'),(165,'Đặng Thanh Toàn',0,'100164','Kiên Giang','04/12/1997','09000395','2051052108Quang@ou.edu.vn','none'),(166,'Diệp Yến Vy',0,'100165','Long An','24/12/2002','09000396','2051052111Quoc@ou.edu.vn','none'),(167,'Châu Mai Xuân',0,'100166','Sóc Trăng','16/07/2002','09000397','2051052139Tinh@ou.edu.vn','none'),(168,'Lê Ngọc Hiếu',0,'100167','Tiền Giang','02/03/2002','09000398','2051052148Tu@ou.edu.vn','none'),(169,'Nguyễn Ngọc Huy',0,'100168','Trà Vinh','10/01/2002','09000399','2051052121Thanh@ou.edu.vn','none'),(170,'Bùi Thị Diễm Hương',0,'100169','Vĩnh Long','02/10/2002','09000400','2051052129Thang@ou.edu.vn','none'),(171,'Phạm Hoàng Khang',0,'100170','An Giang','11/11/2002','09000401','2051052130Thien@ou.edu.vn','none'),(172,'Đinh Thị Thu Ngân',0,'100171','Bạc Liêu','13/01/2002','09000402','2051052131Thien@ou.edu.vn','none'),(173,'Lâm Dân Phúc',0,'100172','Bến Tre','17/09/2002','09000403','2055012088Truc@ou.edu.vn','none'),(174,'Lê Hoàng Phúc',0,'100173','An Giang','21/04/2002','09000404','2051012122Trung@ou.edu.vn','none'),(175,'Lê Quang Phước',0,'100174','Bạc Liêu','01/04/2002','09000405','2051052152Vinh@ou.edu.vn','none'),(176,'Phạm Hồ Hoàng Quí',0,'100175','Bến Tre','07/04/2002','09000406','2051052155Vu@ou.edu.vn','none'),(177,'Dương Hoàng Nhật Tân',0,'100176','Cà Mau','04/09/2002','09000407','2051052157Vy@ou.edu.vn','none');
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
INSERT INTO `subjects` VALUES (1,'sinh 10'),(2,'sinh 11'),(3,'sinh 12'),(4,'sử 10'),(5,'sử 11'),(6,'sử 12'),(7,'địa 10'),(8,'địa 11'),(9,'địa 12'),(10,'toán 10 '),(11,'toán 11'),(12,'toán 12'),(13,'lý 10'),(14,'lý 11'),(15,'lý 12'),(16,'hóa 10'),(17,'hóa 11'),(18,'hóa 12'),(19,'giáo dục công dân 10'),(20,'giáo dục công dân 11'),(21,'giáo dục công dân 12'),(22,'tin học 10'),(23,'tin học 11'),(24,'tin học 12'),(25,'tiếng anh 10'),(26,'tiếng anh 11'),(27,'tiếng anh 12');
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
INSERT INTO `user` VALUES (1,'Nguyễn Hoàng Hạc',0,'100128','Kiên Giang','31/12/2002','9000359','2051052022Du@ou.edu.vn','user:1','202cb962ac59075b964b07152d234b70','https://images.unsplash.com/photo-1505159940484-eb2b9f2588e2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','1'),(2,'Lê Minh Hậu',0,'100129','Long An','01/08/2002','9000360','2051052023Dung@ou.edu.vn','user:2','202cb962ac59075b964b07152d234b70','https://images.unsplash.com/photo-1503424886307-b090341d25d1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80','1'),(3,'Nguyễn Nhật Huy',0,'100130','Sóc Trăng','25/07/2002','9000361','2051052021Duy@ou.edu.vn','user:3','202cb962ac59075b964b07152d234b70','https://images.unsplash.com/photo-1515825838458-f2a94b20105a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80','1'),(4,'Nguyễn Ngọc Thảo Ngân',0,'100131','Tiền Giang','10/07/2002','9000362','2051052026Dat@ou.edu.vn','user:4','202cb962ac59075b964b07152d234b70','https://images.unsplash.com/photo-1461301214746-1e109215d6d3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','1'),(5,'Lê Tấn Phát',0,'100132','Trà Vinh','12/02/2002','9000363','2051052027Dat@ou.edu.vn','user:5','202cb962ac59075b964b07152d234b70','https://images.unsplash.com/photo-1505159940484-eb2b9f2588e2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=81','1'),(6,'Trần Thanh Hoàng Phúc',0,'100133','Vĩnh Long','10/07/2002','9000364','2051052030Duc@ou.edu.vn','user:6','202cb962ac59075b964b07152d234b70','https://images.unsplash.com/photo-1503424886307-b090341d25d1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=81','1'),(7,'Lê Thị Phương Quyên',0,'100134','An Giang','10/12/2002','9000365','2051052031Duc@ou.edu.vn','user:7','202cb962ac59075b964b07152d234b70','https://images.unsplash.com/photo-1515825838458-f2a94b20105a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=81','1'),(8,'Đặng Vỹ Khôi',0,'100135','Long An','18/12/2002','999999','khoi@gmail.com','user:8','202cb962ac59075b964b07152d234b70','https://images.unsplash.com/photo-1461301214746-1e109215d6d3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','1'),(9,'Võ Hữu Nghĩa',0,'100136','Gia Lai','10/07/2002','999999','nghia@gmail.com','qưe','202cb962ac59075b964b07152d234b70','https://images.unsplash.com/photo-1461301214746-1e109215d6d3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','1'),(10,'Nguyễn Quốc Kỳ',0,'100137','Bình ĐỊnh','1/1/2002','12345363','ky@gmail.com','qư','202cb962ac59075b964b07152d234b70','https://images.unsplash.com/photo-1503424886307-b090341d25d1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=81','1'),(28,'Đặng Vỹ Khôi',1,'1234','Long An','2022-12-07','0937793157','2051062066khoi@ou.edu.vn','DangVyKhoi','202cb962ac59075b964b07152d234b70','co hinh anh','1'),(49,'Đặng Vỹ Khôi',1,'142543321','Long An','2022-12-23','0937793157','2051062066khoi@ou.edu.vn','khoi12','c20ad4d76fe97759aa27a0c99bff6710','https://res.cloudinary.com/dendeb697/image/upload/v1670087902/qrfzcatnocbm6a7jp4hc.png','1'),(50,'Vy VY',1,'9999','Long An','2022-12-29','0937793157','2051062066khoi@ou.edu.vn','vyvy','202cb962ac59075b964b07152d234b70','https://res.cloudinary.com/dendeb697/image/upload/v1670096999/xksfq2uudy2nmfgcvsev.jpg','1');
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
