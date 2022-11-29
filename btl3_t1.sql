-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: btl_3
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
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_teacher_in_charge` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_school_year` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_teacher_in_charge` (`id_teacher_in_charge`),
  KEY `id_school_year` (`id_school_year`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`id_teacher_in_charge`) REFERENCES `user` (`id`),
  CONSTRAINT `class_ibfk_2` FOREIGN KEY (`id_school_year`) REFERENCES `school_year` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES ('cl:00001','10a3','u:00001','sy:00001');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(7000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_push` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_author` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_author` (`id_author`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`id_author`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES ('n:00001','Bản tin trong ngày','Iran đã gửi đơn khiếu nại lên Ủy ban Đạo đức FIFA khi nhận thấy điều bất thường trên chiếc áo đấu tuyển Anh khi không viết hoa chữ cái đầu tên tuyển Iran.','26/11/2022','https://ou.edu.vn/wp-content/uploads/2022/11/Picture12.jpg','1','u:00001'),('n:00002','Bản tin kỷ niệm','Vào ngày 21/11, trận đấu giữa Anh và Iran tại bảng B đã diễn ra. Trong khi theo dõi trận đấu, người hâm mộ có thể thấy chữ Iran không được viết đúng, chữ I không được viết hoa, đây là hành vi sai xót nghiêm trọng. Trong các cuộc họp và giải đấu chính thức của FIFA, tên các quốc gia nên được tôn trọng\", Tiến sĩ Mohsen, đại diện Iran viết trong đơn khiếu nại.','18/12/2022','https://images.unsplash.com/photo-1431916319825-a041173af4a3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','2','u:00001'),('n:00003','Tin tuyển sinh','hương trình Đồng hành cùng Tân sinh viên năm 2022 diễn ra tại các cơ sở Trường Đại Học Mở Tp. Hồ Chí Minh với 03 đội hình bao gồm 01 đội hình Võ Văn Tần trực tại cơ sở chính 97 Võ Văn Tần, Quận 3, 01 đội hình Nguyễn Kiệm trực tại cơ sở 371 Nguyễn Kiệm Quận Gò Vấp, 01 đội hình Mai Thị Lựu trực tại cơ sở 4, 02 Mai Thị Lựu, Quân 1 với 120 tình nguyện viên đã tổ chức nhiều hoạt động thiết thực và ý nghĩa, thực hiện các công việc như: liên hệ tìm kiếm nguồn nhà trọ cho các bạn sinh viên đến từ các tỉnh theo học tại Trường, tư vấn địa điểm các cơ sở học tập của Trường, các tuyến xe buýt đi qua các cơ sở học tập, hỗ trợ tân sinh viên thi kiểm tra tiếng Anh đầu vào và hướng dẫn các quy trình làm thủ tục nhập học với tổng nguồn kinh phí thực hiện là 20.000.000 đồng.','19/1/2022','https://ou.edu.vn/wp-content/uploads/2022/11/Picture13.jpg','1','u:00001'),('n:00004','Thông tin về cuộc thi thể dục thể thao','   Qua 2 tháng diễn ra chương trình, các tình nguyện viên đã cập nhật và giới thiệu hơn 800 địa điểm nhà trọ đang còn phòng trống ở gần các cơ sở học tập của Trường. Tư vấn được cho hơn 750 tân sinh viên cần địa điểm phòng trọ, trong đó có 580 phòng trọ đã được tư vấn và nhận phòng. Các tình nguyện viên của đội hình tại các cơ sở học tập thường xuyên nhận được những phản hồi tích cực từ phía phụ huynh cũng như từ các bạn tân sinh viên khóa 2022 vì đã giúp các bạn tân sinh viên khỏi bỡ ngỡ và thích nghi nhanh chóng với môi trường mới tại TP.HCM.','27/11/2022','https://cacnuoc.vn/wp-content/uploads/2021/06/mon-the-thao-pho-bien-nhat-1024x576.jpg','2','u:00001');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES ('per:00001','quyền sửa đổi điểm số học sinh');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conduct` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_student` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_school_year` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `reviews` VALUES ('re:00001','Tốt','Quá xúc sích','s:00001','sy:00001');
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
INSERT INTO `role` VALUES ('teacher');
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
  `id_per` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `role_permission` VALUES ('teacher','per:00001');
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule`
--

DROP TABLE IF EXISTS `rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rule` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_rules_table` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `rule` VALUES ('rul:00001','số lượng học sinh','30','rul-t:00001');
/*!40000 ALTER TABLE `rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rules_table`
--

DROP TABLE IF EXISTS `rules_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rules_table` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rules_table`
--

LOCK TABLES `rules_table` WRITE;
/*!40000 ALTER TABLE `rules_table` DISABLE KEYS */;
INSERT INTO `rules_table` VALUES ('rul-t:00001','quy định phòng học');
/*!40000 ALTER TABLE `rules_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_year`
--

DROP TABLE IF EXISTS `school_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_year` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year_start` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year_end` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_year`
--

LOCK TABLES `school_year` WRITE;
/*!40000 ALTER TABLE `school_year` DISABLE KEYS */;
INSERT INTO `school_year` VALUES ('sy:00001','NK 2020 - 2021','2020','2021','hk1'),('sy:00002','NK 2020 - 2021','2020','2021','hk2');
/*!40000 ALTER TABLE `school_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `values` float NOT NULL,
  `type_score` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_subject` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_school_year` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_student` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `score` VALUES ('sc:00001',8,'15m','sub:00001','sy:00001','s:00001');
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
INSERT INTO `status` VALUES ('studying');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('s:00001','Võ Hữu Nghãi',0,'134235','Gia Lai','1/1/2002','314235','nghia@gmail.com','studying');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student__class__school_year`
--

DROP TABLE IF EXISTS `student__class__school_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student__class__school_year` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_student` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_school_year` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `student__class__school_year` VALUES ('s-cl-sy:00001','s:00001','cl:00001','sy:00001');
/*!40000 ALTER TABLE `student__class__school_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_subject` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES ('sub:00001','Sinh 10');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaching_class`
--

DROP TABLE IF EXISTS `teaching_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teaching_class` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_teacher` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_school_year` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_subject` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_teacher` (`id_teacher`),
  KEY `id_class` (`id_class`),
  KEY `id_school_year` (`id_school_year`),
  KEY `id_subject` (`id_subject`),
  CONSTRAINT `teaching_class_ibfk_1` FOREIGN KEY (`id_teacher`) REFERENCES `user` (`id`),
  CONSTRAINT `teaching_class_ibfk_2` FOREIGN KEY (`id_class`) REFERENCES `class` (`id`),
  CONSTRAINT `teaching_class_ibfk_3` FOREIGN KEY (`id_school_year`) REFERENCES `school_year` (`id`),
  CONSTRAINT `teaching_class_ibfk_4` FOREIGN KEY (`id_subject`) REFERENCES `subjects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaching_class`
--

LOCK TABLES `teaching_class` WRITE;
/*!40000 ALTER TABLE `teaching_class` DISABLE KEYS */;
INSERT INTO `teaching_class` VALUES ('t-cl:00001','u:00001','cl:00001','sy:00001','sub:00001');
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
INSERT INTO `type_score` VALUES ('15m');
/*!40000 ALTER TABLE `type_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `identity` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hometown` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('u:00001','Đặng Vỹ Khôi',0,'12345','Long An','1/1/2002','2164','khoi@gmail.com','q','q','q','1');
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
  `id_user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `user_role` VALUES ('teacher','u:00001');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_subject`
--

DROP TABLE IF EXISTS `user_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_subject` (
  `id_user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_sub` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `user_subject` VALUES ('u:00001','sub:00001');
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

-- Dump completed on 2022-11-29 15:35:59
