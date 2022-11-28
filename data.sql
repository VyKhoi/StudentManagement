CREATE DATABASE  IF NOT EXISTS `btl` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `btl`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: btl
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
  `id_class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
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
INSERT INTO `news` VALUES ('N1','Bản tin trong ngày','Iran đã gửi đơn khiếu nại lên Ủy ban Đạo đức FIFA khi nhận thấy điều bất thường trên chiếc áo đấu tuyển Anh khi không viết hoa chữ cái đầu tên tuyển Iran.','26/11/2022','https://ou.edu.vn/wp-content/uploads/2022/11/Picture12.jpg','1','U1'),('N2','Bản tin kỷ niệm','Vào ngày 21/11, trận đấu giữa Anh và Iran tại bảng B đã diễn ra. Trong khi theo dõi trận đấu, người hâm mộ có thể thấy chữ Iran không được viết đúng, chữ I không được viết hoa, đây là hành vi sai xót nghiêm trọng. Trong các cuộc họp và giải đấu chính thức của FIFA, tên các quốc gia nên được tôn trọng\", Tiến sĩ Mohsen, đại diện Iran viết trong đơn khiếu nại.','18/12/2022','https://images.unsplash.com/photo-1431916319825-a041173af4a3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','2','U2'),('N3','Tin tuyển sinh','hương trình Đồng hành cùng Tân sinh viên năm 2022 diễn ra tại các cơ sở Trường Đại Học Mở Tp. Hồ Chí Minh với 03 đội hình bao gồm 01 đội hình Võ Văn Tần trực tại cơ sở chính 97 Võ Văn Tần, Quận 3, 01 đội hình Nguyễn Kiệm trực tại cơ sở 371 Nguyễn Kiệm Quận Gò Vấp, 01 đội hình Mai Thị Lựu trực tại cơ sở 4, 02 Mai Thị Lựu, Quân 1 với 120 tình nguyện viên đã tổ chức nhiều hoạt động thiết thực và ý nghĩa, thực hiện các công việc như: liên hệ tìm kiếm nguồn nhà trọ cho các bạn sinh viên đến từ các tỉnh theo học tại Trường, tư vấn địa điểm các cơ sở học tập của Trường, các tuyến xe buýt đi qua các cơ sở học tập, hỗ trợ tân sinh viên thi kiểm tra tiếng Anh đầu vào và hướng dẫn các quy trình làm thủ tục nhập học với tổng nguồn kinh phí thực hiện là 20.000.000 đồng.','19/1/2022','https://ou.edu.vn/wp-content/uploads/2022/11/Picture13.jpg','1','U2'),('N4','Thông tin về cuộc thi thể dục thể thao','   Qua 2 tháng diễn ra chương trình, các tình nguyện viên đã cập nhật và giới thiệu hơn 800 địa điểm nhà trọ đang còn phòng trống ở gần các cơ sở học tập của Trường. Tư vấn được cho hơn 750 tân sinh viên cần địa điểm phòng trọ, trong đó có 580 phòng trọ đã được tư vấn và nhận phòng. Các tình nguyện viên của đội hình tại các cơ sở học tập thường xuyên nhận được những phản hồi tích cực từ phía phụ huynh cũng như từ các bạn tân sinh viên khóa 2022 vì đã giúp các bạn tân sinh viên khỏi bỡ ngỡ và thích nghi nhanh chóng với môi trường mới tại TP.HCM.','27/11/2022','https://cacnuoc.vn/wp-content/uploads/2021/06/mon-the-thao-pho-bien-nhat-1024x576.jpg','2','U1'),('N5','Thong tin world cup','Qua 2 tháng diễn ra chương trình, các tình nguyện viên đã cập nhật và giới thiệu hơn 800 địa điểm nhà trọ đang còn phòng trống ở gần các cơ sở học tập của Trường. Tư vấn được cho hơn 750 tân sinh viên cần địa điểm phòng trọ, trong đó có 580 phòng trọ đã được tư vấn và nhận phòng. Các tình nguyện viên của đội hình tại các cơ sở học tập thường xuyên nhận được những phản hồi tích cực từ phía phụ huynh cũng như từ các bạn tân sinh viên khóa 2022 vì đã giúp các bạn tân sinh viên khỏi bỡ ngỡ và thích nghi nhanh chóng với môi trường mới tại TP.HCM.','12/2/2022','https://ou.edu.vn/wp-content/uploads/2022/11/Picture13.jpg','1','U1'),('N6','Thông tin về cuộc thi thể dục thể thao','hương trình Đồng hành cùng Tân sinh viên năm 2022 diễn ra tại các cơ sở Trường Đại Học Mở Tp. Hồ Chí Minh với 03 đội hình bao gồm 01 đội hình Võ Văn Tần trực tại cơ sở chính 97 Võ Văn Tần, Quận 3, 01 đội hình Nguyễn Kiệm trực tại cơ sở 371 Nguyễn Kiệm Quận Gò Vấp, 01 đội hình Mai Thị Lựu trực tại cơ sở 4, 02 Mai Thị Lựu, Quân 1 với 120 tình nguyện viên đã tổ chức nhiều hoạt động thiết thực và ý nghĩa, thực hiện các công việc như: liên hệ tìm kiếm nguồn nhà trọ cho các bạn sinh viên đến từ các tỉnh theo học tại Trường, tư vấn địa điểm các cơ sở học tập của Trường, các tuyến xe buýt đi qua các cơ sở học tập, hỗ trợ tân sinh viên thi kiểm tra tiếng Anh đầu vào và hướng dẫn các quy trình làm thủ tục nhập học với tổng nguồn kinh phí thực hiện là 20.000.000 đồng.','19/1/2022','https://images.unsplash.com/photo-1431916319825-a041173af4a3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','2','U3'),('N7','Bản tin kỷ niệm','Vào ngày 21/11, trận đấu giữa Anh và Iran tại bảng B đã diễn ra. Trong khi theo dõi trận đấu, người hâm mộ có thể thấy chữ Iran không được viết đúng, chữ I không được viết hoa, đây là hành vi sai xót nghiêm trọng. Trong các cuộc họp và giải đấu chính thức của FIFA, tên các quốc gia nên được tôn trọng\", Tiến sĩ Mohsen, đại diện Iran viết trong đơn khiếu nại.','18/12/2022','https://ou.edu.vn/wp-content/uploads/2022/11/Picture12.jpg','1','U4'),('N8','Ban tỉn nghệ thuật thể thao','Iran đã gửi đơn khiếu nại lên Ủy ban Đạo đức FIFA khi nhận thấy điều bất thường trên chiếc áo đấu tuyển Anh khi không viết hoa chữ cái đầu tên tuyển Iran.','26/11/2022','https://ou.edu.vn/wp-content/uploads/2022/11/Picture13.jpg','2','U4');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
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
  `hometown` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `graduated_highschool` tinyint(1) DEFAULT NULL,
  `conduct` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `id_subject` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id_subject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `hometown` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `hometown` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `user` VALUES ('U1',1,'Long An','18/12/2002','1324356','dangvykhoi@gmail.com','Dang Vy khoi','aaa','aaa','ccc','1'),('U2',0,'Long An','24/06/2002','2435','vyvyle@gmail.com','Le Hoang Tuong Vy','aaa','aaa','ccc','1'),('U3',1,'HCM','11/2/1998','1342536478654','nguyenquocky@gmail.com','Nguyễn Quốc Kỳ','kkkkk','kkkk','ccc','1'),('U4',1,'Gia Lai','1/1/2002','32435647','vohuunghia@gmail.com','Võ Hữu Nghĩa','nnnn','nnnn','ccc','1');
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

-- Dump completed on 2022-11-27 20:36:28
