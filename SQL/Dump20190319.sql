-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: 192.168.40.228    Database: PhanMemKhaoThi
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add lop hoc',6,'add_lophoc'),(22,'Can change lop hoc',6,'change_lophoc'),(23,'Can delete lop hoc',6,'delete_lophoc'),(24,'Can view lop hoc',6,'view_lophoc'),(25,'Can add chi tiet khoa',7,'add_chitietkhoa'),(26,'Can change chi tiet khoa',7,'change_chitietkhoa'),(27,'Can delete chi tiet khoa',7,'delete_chitietkhoa'),(28,'Can view chi tiet khoa',7,'view_chitietkhoa'),(29,'Can add don vi',8,'add_donvi'),(30,'Can change don vi',8,'change_donvi'),(31,'Can delete don vi',8,'delete_donvi'),(32,'Can view don vi',8,'view_donvi'),(33,'Can add khoa hoc',9,'add_khoahoc'),(34,'Can change khoa hoc',9,'change_khoahoc'),(35,'Can delete khoa hoc',9,'delete_khoahoc'),(36,'Can view khoa hoc',9,'view_khoahoc'),(37,'Can add phong thi',10,'add_phongthi'),(38,'Can change phong thi',10,'change_phongthi'),(39,'Can delete phong thi',10,'delete_phongthi'),(40,'Can view phong thi',10,'view_phongthi'),(41,'Can add chi tiet lop',11,'add_chitietlop'),(42,'Can change chi tiet lop',11,'change_chitietlop'),(43,'Can delete chi tiet lop',11,'delete_chitietlop'),(44,'Can view chi tiet lop',11,'view_chitietlop'),(45,'Can add sinh vien',12,'add_sinhvien'),(46,'Can change sinh vien',12,'change_sinhvien'),(47,'Can delete sinh vien',12,'delete_sinhvien'),(48,'Can view sinh vien',12,'view_sinhvien'),(49,'Can add can bo',13,'add_canbo'),(50,'Can change can bo',13,'change_canbo'),(51,'Can delete can bo',13,'delete_canbo'),(52,'Can view can bo',13,'view_canbo'),(53,'Can add cham thi',14,'add_chamthi'),(54,'Can change cham thi',14,'change_chamthi'),(55,'Can delete cham thi',14,'delete_chamthi'),(56,'Can view cham thi',14,'view_chamthi'),(57,'Can add ky thi',15,'add_kythi'),(58,'Can change ky thi',15,'change_kythi'),(59,'Can delete ky thi',15,'delete_kythi'),(60,'Can view ky thi',15,'view_kythi'),(61,'Can add mon',16,'add_mon'),(62,'Can change mon',16,'change_mon'),(63,'Can delete mon',16,'delete_mon'),(64,'Can view mon',16,'view_mon'),(65,'Can add dap an',17,'add_dapan'),(66,'Can change dap an',17,'change_dapan'),(67,'Can delete dap an',17,'delete_dapan'),(68,'Can view dap an',17,'view_dapan'),(69,'Can add bai thi',18,'add_baithi'),(70,'Can change bai thi',18,'change_baithi'),(71,'Can delete bai thi',18,'delete_baithi'),(72,'Can view bai thi',18,'view_baithi'),(73,'Can add log_diem',19,'add_log_diem'),(74,'Can change log_diem',19,'change_log_diem'),(75,'Can delete log_diem',19,'delete_log_diem'),(76,'Can view log_diem',19,'view_log_diem');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `can_bo`
--

DROP TABLE IF EXISTS `can_bo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `can_bo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `tenCanBo` longtext COLLATE utf8_unicode_ci,
  `maCanBo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quanHam` longtext COLLATE utf8_unicode_ci,
  `position` int(11) NOT NULL,
  `maDonVi_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `can_bo_maDonVi_id_e10ce6ba_fk_don_vi_id` (`maDonVi_id`),
  CONSTRAINT `can_bo_maDonVi_id_e10ce6ba_fk_don_vi_id` FOREIGN KEY (`maDonVi_id`) REFERENCES `don_vi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `can_bo`
--

LOCK TABLES `can_bo` WRITE;
/*!40000 ALTER TABLE `can_bo` DISABLE KEYS */;
INSERT INTO `can_bo` VALUES (1,'pbkdf2_sha256$120000$RNW6oidP6aZ7$hbkZC95gmdQwZ50RqzRzZ0pXl/KqLb6OtYWJL+X7fxA=','2019-03-19 01:38:02.221928',1,'admin','','','admin@admin.com',1,1,'2018-12-27 04:08:42.483175','Minh Hiếu','1','Đại úy',0,1),(2,'pbkdf2_sha256$120000$JprtM3IYqfdp$5CyiNCBRW27YLaGKN4fmDl+rpDjTSSWpZD2pwIFSX3o=','2019-03-19 01:37:39.630578',1,'coithi','','','coithi@coithi.com',1,1,'2018-12-27 04:09:05.180199','cuong 12','2','Đại úy',1,1),(3,'pbkdf2_sha256$120000$LeHegbT6di8l$fYLkZMxECXb/aW5m9U0rS1K8HzDcWnYi0+vU492OeXI=','2018-12-28 08:49:36.474240',1,'chamthi','','','chamthi@chamthi.com',1,1,'2018-12-27 04:09:18.292253','cham','3','Đại úy',1,1),(6,'pbkdf2_sha256$120000$05vk9iv7TvJl$6ICm8YxtpUj7k4tVgbcu/0oHg0fWzsA9bjcq091wuJ4=','2019-01-07 04:29:40.835221',0,'hieulm','','','hieule@gmail.com',0,1,'2019-01-07 04:28:35.705236','Minh Hieu','MH02','Đại tá',1,2),(8,'pbkdf2_sha256$120000$HTAYBsUqNB32$v5LlKy2UmnOIK2pOiabcqmWjAjbc8SgNzdhdG5Ny4m4=',NULL,0,'dung','','','dung@gmail.com',0,1,'2019-01-07 09:59:10.185172','Dungvv','MS1','Thượng úy',1,2),(12,'pbkdf2_sha256$120000$4S1Iu6rajwYG$owHcV1NFmnmCApqmpg1HZ3q+muXldFVGPTd0WF+yI80=',NULL,0,'phongtt','','','phongtt@gmail.com',0,1,'2019-01-10 10:18:57.825631','Tong thi phong','CB2','thuong uy',1,2),(13,'pbkdf2_sha256$120000$wiBgNIrBKPfr$uCsqyFosDe8iaV62yPog7oejUEkfbKBlqn/PQmgavmw=',NULL,0,'khongtn','','','khongtn@gmail.com',0,1,'2019-01-10 10:18:58.142972','Ton Ngo Khong','CB3','thuong uy',1,2),(14,'pbkdf2_sha256$120000$AKixQSSHgm72$0Om6VN6Xp/cLFwOCfK7J1Gq2ZJ44XxVjXkQcsmdBb1M=',NULL,0,'gioitb','','','gioitb@gmail.com',0,1,'2019-01-10 10:18:58.443513','Tru bat gioi','CB4','thuong uy',1,2);
/*!40000 ALTER TABLE `can_bo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `can_bo_groups`
--

DROP TABLE IF EXISTS `can_bo_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `can_bo_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canbo_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `can_bo_groups_canbo_id_group_id_41768dd3_uniq` (`canbo_id`,`group_id`),
  KEY `can_bo_groups_group_id_2f7f20d9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `can_bo_groups_canbo_id_0e3641b4_fk_can_bo_id` FOREIGN KEY (`canbo_id`) REFERENCES `can_bo` (`id`),
  CONSTRAINT `can_bo_groups_group_id_2f7f20d9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `can_bo_groups`
--

LOCK TABLES `can_bo_groups` WRITE;
/*!40000 ALTER TABLE `can_bo_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `can_bo_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `can_bo_user_permissions`
--

DROP TABLE IF EXISTS `can_bo_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `can_bo_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canbo_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `can_bo_user_permissions_canbo_id_permission_id_38603075_uniq` (`canbo_id`,`permission_id`),
  KEY `can_bo_user_permissi_permission_id_77343a7c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `can_bo_user_permissi_permission_id_77343a7c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `can_bo_user_permissions_canbo_id_a75953c6_fk_can_bo_id` FOREIGN KEY (`canbo_id`) REFERENCES `can_bo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `can_bo_user_permissions`
--

LOCK TABLES `can_bo_user_permissions` WRITE;
/*!40000 ALTER TABLE `can_bo_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `can_bo_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cham_thi`
--

DROP TABLE IF EXISTS `cham_thi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cham_thi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ngayCham` date NOT NULL,
  `canBoCham1_id` int(11) DEFAULT NULL,
  `canBoCham2_id` int(11) DEFAULT NULL,
  `maPhong_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cham_thi_canBoCham1_id_bc33a93a_fk_can_bo_id` (`canBoCham1_id`),
  KEY `cham_thi_canBoCham2_id_ed20c67f_fk_can_bo_id` (`canBoCham2_id`),
  KEY `cham_thi_maPhong_id_bd708b71_fk_phong_thi_id` (`maPhong_id`),
  CONSTRAINT `cham_thi_canBoCham1_id_bc33a93a_fk_can_bo_id` FOREIGN KEY (`canBoCham1_id`) REFERENCES `can_bo` (`id`),
  CONSTRAINT `cham_thi_canBoCham2_id_ed20c67f_fk_can_bo_id` FOREIGN KEY (`canBoCham2_id`) REFERENCES `can_bo` (`id`),
  CONSTRAINT `cham_thi_maPhong_id_bd708b71_fk_phong_thi_id` FOREIGN KEY (`maPhong_id`) REFERENCES `phong_thi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cham_thi`
--

LOCK TABLES `cham_thi` WRITE;
/*!40000 ALTER TABLE `cham_thi` DISABLE KEYS */;
INSERT INTO `cham_thi` VALUES (2,'2018-12-27',2,3,2),(5,'2018-12-28',1,2,6),(7,'2019-01-10',3,2,7);
/*!40000 ALTER TABLE `cham_thi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chi_tiet_khoa`
--

DROP TABLE IF EXISTS `chi_tiet_khoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chi_tiet_khoa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maKhoa_id` int(11) DEFAULT NULL,
  `maLop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chi_tiet_khoa_maKhoa_id_4a73cbc0_fk_khoa_hoc_id` (`maKhoa_id`),
  KEY `chi_tiet_khoa_maLop_id_fb690d20_fk_lop_hoc_id` (`maLop_id`),
  CONSTRAINT `chi_tiet_khoa_maKhoa_id_4a73cbc0_fk_khoa_hoc_id` FOREIGN KEY (`maKhoa_id`) REFERENCES `khoa_hoc` (`id`),
  CONSTRAINT `chi_tiet_khoa_maLop_id_fb690d20_fk_lop_hoc_id` FOREIGN KEY (`maLop_id`) REFERENCES `lop_hoc` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_khoa`
--

LOCK TABLES `chi_tiet_khoa` WRITE;
/*!40000 ALTER TABLE `chi_tiet_khoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `chi_tiet_khoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chi_tiet_lop`
--

DROP TABLE IF EXISTS `chi_tiet_lop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chi_tiet_lop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diem` double NOT NULL,
  `trangThai` longtext COLLATE utf8_unicode_ci,
  `lyDo` longtext COLLATE utf8_unicode_ci,
  `ghiChu` longtext COLLATE utf8_unicode_ci,
  `maLop_id` int(11) DEFAULT NULL,
  `maSinhVien_id` int(11) DEFAULT NULL,
  `soBaoDanh` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baiLam` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `maDe` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `maPhach` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chi_tiet_lop_maLop_id_8fb7de37_fk_lop_hoc_id` (`maLop_id`),
  KEY `chi_tiet_lop_maSinhVien_id_4e762dfa_fk_sinh_vien_id` (`maSinhVien_id`),
  CONSTRAINT `chi_tiet_lop_maLop_id_8fb7de37_fk_lop_hoc_id` FOREIGN KEY (`maLop_id`) REFERENCES `lop_hoc` (`id`),
  CONSTRAINT `chi_tiet_lop_maSinhVien_id_4e762dfa_fk_sinh_vien_id` FOREIGN KEY (`maSinhVien_id`) REFERENCES `sinh_vien` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_lop`
--

LOCK TABLES `chi_tiet_lop` WRITE;
/*!40000 ALTER TABLE `chi_tiet_lop` DISABLE KEYS */;
INSERT INTO `chi_tiet_lop` VALUES (1,4.25,'Hoãn thi','nguasasdasd','hihi',1,1,NULL,'BaiLam/SV3_O7JT1Lw.jpg',NULL,'ms1'),(2,0,'Hoãn thi','aaasdsad','asd',1,2,NULL,'BaiLam/SV1_0LjRJG0.jpg',NULL,'ms2'),(3,5,'Vi phạm','ngu','aa',1,3,NULL,'BaiLam/SV1_vero6iO.jpg',NULL,'ms3'),(4,9,'Hoãn thi','sngu','fdsdf',2,3,NULL,NULL,NULL,NULL),(7,0,NULL,NULL,NULL,7,5,NULL,NULL,NULL,NULL),(8,0,NULL,NULL,NULL,7,12,NULL,NULL,NULL,NULL),(9,0,NULL,NULL,NULL,7,14,NULL,NULL,NULL,NULL),(10,0,NULL,NULL,NULL,7,13,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `chi_tiet_lop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dap_an`
--

DROP TABLE IF EXISTS `dap_an`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dap_an` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maDe` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dapAn` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `makithi_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dap_an_makithi_id_c36ce096_fk_ky_thi_id` (`makithi_id`),
  CONSTRAINT `dap_an_makithi_id_c36ce096_fk_ky_thi_id` FOREIGN KEY (`makithi_id`) REFERENCES `ky_thi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dap_an`
--

LOCK TABLES `dap_an` WRITE;
/*!40000 ALTER TABLE `dap_an` DISABLE KEYS */;
INSERT INTO `dap_an` VALUES (1,'111','DapAn/testpython.xlsx',3),(63,'454','DapAn/testpython_3WoPFsG.xlsx',3),(64,'432','DapAn/testpython_Fr9p1IM.xlsx',3);
/*!40000 ALTER TABLE `dap_an` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_can_bo_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_can_bo_id` FOREIGN KEY (`user_id`) REFERENCES `can_bo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(18,'CoiThi','baithi'),(13,'CoiThi','canbo'),(14,'CoiThi','chamthi'),(7,'CoiThi','chitietkhoa'),(11,'CoiThi','chitietlop'),(17,'CoiThi','dapan'),(8,'CoiThi','donvi'),(9,'CoiThi','khoahoc'),(15,'CoiThi','kythi'),(19,'CoiThi','log_diem'),(6,'CoiThi','lophoc'),(16,'CoiThi','mon'),(10,'CoiThi','phongthi'),(12,'CoiThi','sinhvien'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-12-27 04:02:33.784430'),(2,'contenttypes','0002_remove_content_type_name','2018-12-27 04:02:43.495981'),(3,'auth','0001_initial','2018-12-27 04:02:54.593569'),(4,'auth','0002_alter_permission_name_max_length','2018-12-27 04:03:04.061876'),(5,'auth','0003_alter_user_email_max_length','2018-12-27 04:03:04.131807'),(6,'auth','0004_alter_user_username_opts','2018-12-27 04:03:04.191071'),(7,'auth','0005_alter_user_last_login_null','2018-12-27 04:03:04.269461'),(8,'auth','0006_require_contenttypes_0002','2018-12-27 04:03:04.310167'),(9,'auth','0007_alter_validators_add_error_messages','2018-12-27 04:03:04.364497'),(10,'auth','0008_alter_user_username_max_length','2018-12-27 04:03:04.412278'),(11,'auth','0009_alter_user_last_name_max_length','2018-12-27 04:03:04.463659'),(12,'CoiThi','0001_initial','2018-12-27 04:05:33.027422'),(13,'CoiThi','0002_auto_20181226_0932','2018-12-27 04:05:33.607178'),(14,'CoiThi','0003_auto_20181226_0950','2018-12-27 04:05:51.368445'),(15,'CoiThi','0004_auto_20181226_0953','2018-12-27 04:06:11.354654'),(16,'CoiThi','0005_auto_20181226_1343','2018-12-27 04:06:19.915010'),(17,'CoiThi','0006_lophoc_hinhthucthi','2018-12-27 04:06:20.232259'),(18,'admin','0001_initial','2018-12-27 04:06:35.341745'),(19,'admin','0002_logentry_remove_auto_add','2018-12-27 04:06:35.417194'),(20,'admin','0003_logentry_add_action_flag_choices','2018-12-27 04:06:35.493885'),(21,'sessions','0001_initial','2018-12-27 04:06:36.256086'),(22,'CoiThi','0007_remove_khoahoc_makhoahoc','2018-12-27 04:15:22.394165'),(23,'CoiThi','0008_auto_20181227_1420','2018-12-27 07:20:36.861213'),(24,'CoiThi','0009_auto_20190104_1521','2019-01-04 08:22:32.442599'),(25,'CoiThi','0010_auto_20190107_0933','2019-01-07 02:34:07.112062'),(26,'CoiThi','0011_dapan','2019-01-07 04:02:37.075434'),(27,'CoiThi','0012_baithi','2019-01-07 05:02:35.586241'),(28,'CoiThi','0013_baithi_made','2019-01-07 06:48:55.449521'),(29,'CoiThi','0014_auto_20190310_1449','2019-03-11 01:16:14.520685'),(30,'CoiThi','0015_auto_20190311_2242','2019-03-11 15:43:12.151386'),(31,'CoiThi','0016_auto_20190317_1416','2019-03-17 07:16:49.075027'),(32,'CoiThi','0017_auto_20190319_0836','2019-03-19 01:37:05.065139'),(33,'CoiThi','0018_auto_20190319_0839','2019-03-19 01:39:25.515506');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0gegkh5dhfycyr9etl6uormqeo2bqcsb','OWIyODZhNTNkYTg1YmU3MDJjM2RjZWY5N2ZiZWRhMjlhM2RkZDMwYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzRiM2U2Y2U1MDhmZWEyZmQ2N2YxNjg5M2ExMTliYmE4MTBhMTY0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2019-01-17 07:44:11.440962'),('40spahnere2ybp7s90973dxfka9gkgkr','YWUwMWIwNzkzZDhmNzQ1NGRmMmVhY2FmMWNjZmZjNWViZGE3N2IzYzp7Il9hdXRoX3VzZXJfaGFzaCI6ImNlNzg0MzE2MDA1ODgwY2YyOWEyMGM2NzFiYzFiM2ZiMjRhNjNhZTIiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2019-01-22 01:23:23.086945'),('4v1dnm4iheygba9r5skym5feru2bjbtz','OTkwNzAyZDM2MWU0ZWEwZmE4ZDVmOTRlMWE4MDIwODZmYzJhZTdmZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZTc4NDMxNjAwNTg4MGNmMjlhMjBjNjcxYmMxYjNmYjI0YTYzYWUyIn0=','2019-03-25 15:03:14.122846'),('77vge2brd6751jfvmv9ou3n83ivnaitr','NmJhZTdjMDkzNmZkYzBiZjM3YmY1YTZkY2JiZmViMGQwOGM3NGZhYjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMjIxYWE3YjlkOTY5MWIyMzM5OWQyMzE2ZTY3Njg0NTIyNzQwOWEzIn0=','2019-01-18 03:17:28.041852'),('7saecb6i7hs8v50u12p3uf4y985k16u6','ZDk1MTJiNTY3ZTUxYTFlZDY4ZDgxNTU3YTY3ZGU5ZGY1ZGU1OGQwODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwY2EwN2IwZTdhNWQ1NWUyZjNhYmY1YTQyODc3YmY4N2FiMzUxNTk0In0=','2019-01-24 10:13:59.436750'),('8f0iz70ogavzb6om9prteu2pbd7genyr','ZDJhN2IyMGZmNjUzNTRlOGIwYmZhOTk3ZmFjN2E4NmFjNTRjNDljMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiIzNGIzZTZjZTUwOGZlYTJmZDY3ZjE2ODkzYTExOWJiYTgxMGExNjQxIn0=','2019-01-10 07:01:46.358437'),('8lzluclq7i656ltui7ivrgt7v15zmax6','Y2VkYzRjYmRmYjAxMWFkMGEwMGY1ZTU0MWE4MWZhMDgyMzE0MjAzYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM0YjNlNmNlNTA4ZmVhMmZkNjdmMTY4OTNhMTE5YmJhODEwYTE2NDEiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2019-01-20 05:07:37.852909'),('8w615wx60ttjou66u8tmbcv8kphfvt4l','ZDk1MTJiNTY3ZTUxYTFlZDY4ZDgxNTU3YTY3ZGU5ZGY1ZGU1OGQwODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwY2EwN2IwZTdhNWQ1NWUyZjNhYmY1YTQyODc3YmY4N2FiMzUxNTk0In0=','2019-03-19 04:21:36.583249'),('9ingrr60sxs4gx6tiethc2o89z8hqf5y','ZjY5NzkzOTI1NjYzOTg1MmM0ZWFjZDlhMzliNTE1ZWI3NDU4ODNhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzg5NDc1YjYxZmE1MTE0NDEwNDk4ODgxODYxMzIxOTAzYzAxMzNiZiIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-01-11 02:11:47.143929'),('9qyadrisbw2knc8081ft29tjx78xeudk','Y2VkYzRjYmRmYjAxMWFkMGEwMGY1ZTU0MWE4MWZhMDgyMzE0MjAzYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM0YjNlNmNlNTA4ZmVhMmZkNjdmMTY4OTNhMTE5YmJhODEwYTE2NDEiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2019-01-11 08:51:32.364370'),('b3x5wj44rf7ypda90yqmfim3yn2dwvsq','ZDk1MTJiNTY3ZTUxYTFlZDY4ZDgxNTU3YTY3ZGU5ZGY1ZGU1OGQwODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwY2EwN2IwZTdhNWQ1NWUyZjNhYmY1YTQyODc3YmY4N2FiMzUxNTk0In0=','2019-04-02 01:38:05.957753'),('ceu6zblnz5ev57l8t6ut7i4vls8jkuld','ZDk1MTJiNTY3ZTUxYTFlZDY4ZDgxNTU3YTY3ZGU5ZGY1ZGU1OGQwODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwY2EwN2IwZTdhNWQ1NWUyZjNhYmY1YTQyODc3YmY4N2FiMzUxNTk0In0=','2019-03-28 06:37:54.904818'),('cliy66mtqltn6alu2v6mn35h6slfckok','OTkwNzAyZDM2MWU0ZWEwZmE4ZDVmOTRlMWE4MDIwODZmYzJhZTdmZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZTc4NDMxNjAwNTg4MGNmMjlhMjBjNjcxYmMxYjNmYjI0YTYzYWUyIn0=','2019-03-28 11:19:11.850487'),('el5z9u2vf8o7k8qoy16qwibboodtinnu','ZDk1MTJiNTY3ZTUxYTFlZDY4ZDgxNTU3YTY3ZGU5ZGY1ZGU1OGQwODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwY2EwN2IwZTdhNWQ1NWUyZjNhYmY1YTQyODc3YmY4N2FiMzUxNTk0In0=','2019-03-31 09:05:04.678264'),('ethvrq3y6t10s4df98i5yahz1u6wqry7','ZDk1MTJiNTY3ZTUxYTFlZDY4ZDgxNTU3YTY3ZGU5ZGY1ZGU1OGQwODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwY2EwN2IwZTdhNWQ1NWUyZjNhYmY1YTQyODc3YmY4N2FiMzUxNTk0In0=','2019-03-19 02:56:08.923859'),('fd22bzpez9m0755rx7il9bro9g1sjtyz','Y2VkYzRjYmRmYjAxMWFkMGEwMGY1ZTU0MWE4MWZhMDgyMzE0MjAzYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM0YjNlNmNlNTA4ZmVhMmZkNjdmMTY4OTNhMTE5YmJhODEwYTE2NDEiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2019-01-21 14:31:03.592542'),('g3my205l78amgp52te4f8tu3h07g9rtv','OTkwNzAyZDM2MWU0ZWEwZmE4ZDVmOTRlMWE4MDIwODZmYzJhZTdmZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZTc4NDMxNjAwNTg4MGNmMjlhMjBjNjcxYmMxYjNmYjI0YTYzYWUyIn0=','2019-03-27 13:52:04.897812'),('gu45a3b89y4pnrzxcx2a86dbfwfb2f0h','ZDk1MTJiNTY3ZTUxYTFlZDY4ZDgxNTU3YTY3ZGU5ZGY1ZGU1OGQwODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwY2EwN2IwZTdhNWQ1NWUyZjNhYmY1YTQyODc3YmY4N2FiMzUxNTk0In0=','2019-03-19 04:15:24.189830'),('ilbu522t7maepgpiuecke3py37wdjrg2','ZmJlNWM4MzhkZGMxN2ZhOTE1N2RlZTZhMDE1Yzc3ZDVlMTZlMDc4ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzRiM2U2Y2U1MDhmZWEyZmQ2N2YxNjg5M2ExMTliYmE4MTBhMTY0MSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-01-11 01:19:09.470578'),('mvrwe9wfouqeisdx2h5h8sla840gl2oo','OTkwNzAyZDM2MWU0ZWEwZmE4ZDVmOTRlMWE4MDIwODZmYzJhZTdmZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZTc4NDMxNjAwNTg4MGNmMjlhMjBjNjcxYmMxYjNmYjI0YTYzYWUyIn0=','2019-03-01 10:09:17.522322'),('n5d9h4oli6eswpvu10s66z983euh8682','OTkwNzAyZDM2MWU0ZWEwZmE4ZDVmOTRlMWE4MDIwODZmYzJhZTdmZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZTc4NDMxNjAwNTg4MGNmMjlhMjBjNjcxYmMxYjNmYjI0YTYzYWUyIn0=','2019-01-21 01:20:18.615989'),('qmrkhr5c479cpp02p0rmk7pflx0ji0bk','ZjY5NzkzOTI1NjYzOTg1MmM0ZWFjZDlhMzliNTE1ZWI3NDU4ODNhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzg5NDc1YjYxZmE1MTE0NDEwNDk4ODgxODYxMzIxOTAzYzAxMzNiZiIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-01-10 04:52:46.628453'),('r92vhfkqc3ju6sli4f67m87hz242ypa9','ZjY5NzkzOTI1NjYzOTg1MmM0ZWFjZDlhMzliNTE1ZWI3NDU4ODNhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzg5NDc1YjYxZmE1MTE0NDEwNDk4ODgxODYxMzIxOTAzYzAxMzNiZiIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-01-18 03:12:19.591072'),('xdf7nz08x5lb8u1nzzdysq2gx5bp3vwm','OTkwNzAyZDM2MWU0ZWEwZmE4ZDVmOTRlMWE4MDIwODZmYzJhZTdmZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZTc4NDMxNjAwNTg4MGNmMjlhMjBjNjcxYmMxYjNmYjI0YTYzYWUyIn0=','2019-03-25 01:12:28.379475'),('ygfkp559tzd1bdftm3iv4a8v1koubkm0','ZDk1MTJiNTY3ZTUxYTFlZDY4ZDgxNTU3YTY3ZGU5ZGY1ZGU1OGQwODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwY2EwN2IwZTdhNWQ1NWUyZjNhYmY1YTQyODc3YmY4N2FiMzUxNTk0In0=','2019-03-19 04:41:14.924983');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `don_vi`
--

DROP TABLE IF EXISTS `don_vi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `don_vi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenDonVi` longtext COLLATE utf8_unicode_ci,
  `maDonVi` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `don_vi`
--

LOCK TABLES `don_vi` WRITE;
/*!40000 ALTER TABLE `don_vi` DISABLE KEYS */;
INSERT INTO `don_vi` VALUES (1,'Lính Thủy','LT1'),(2,'Tăng Thiết Giáp','LT2'),(6,'Hậu cần','HC1'),(7,'Hải Quân','HD1');
/*!40000 ALTER TABLE `don_vi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khoa_hoc`
--

DROP TABLE IF EXISTS `khoa_hoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `khoa_hoc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenKhoaHoc` longtext COLLATE utf8_unicode_ci,
  `he` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khoa_hoc`
--

LOCK TABLES `khoa_hoc` WRITE;
/*!40000 ALTER TABLE `khoa_hoc` DISABLE KEYS */;
INSERT INTO `khoa_hoc` VALUES (1,'Khóa 1','K1'),(2,'Khóa 2','K2'),(3,'Khóa 3','DH'),(4,'Khóa 4','ĐH');
/*!40000 ALTER TABLE `khoa_hoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ky_thi`
--

DROP TABLE IF EXISTS `ky_thi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ky_thi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenKyThi` longtext COLLATE utf8_unicode_ci,
  `ngayBatDau` date NOT NULL,
  `ngayKetThuc` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ky_thi`
--

LOCK TABLES `ky_thi` WRITE;
/*!40000 ALTER TABLE `ky_thi` DISABLE KEYS */;
INSERT INTO `ky_thi` VALUES (1,'Kì thi cuối năm','2018-12-27','2019-01-29'),(3,'HSG','2019-01-01','2019-03-29');
/*!40000 ALTER TABLE `ky_thi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_diem`
--

DROP TABLE IF EXISTS `log_diem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_diem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diemCu` double NOT NULL,
  `diemMoi` double NOT NULL,
  `ngaySua` date NOT NULL,
  `lyDoSua` longtext COLLATE utf8_unicode_ci,
  `nguoiSua_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `log_diem_nguoiSua_id_b7341b3c_fk_can_bo_id` (`nguoiSua_id`),
  CONSTRAINT `log_diem_nguoiSua_id_b7341b3c_fk_can_bo_id` FOREIGN KEY (`nguoiSua_id`) REFERENCES `can_bo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_diem`
--

LOCK TABLES `log_diem` WRITE;
/*!40000 ALTER TABLE `log_diem` DISABLE KEYS */;
INSERT INTO `log_diem` VALUES (1,2,2,'2019-03-17',NULL,2),(2,2,9,'2019-03-17',NULL,2),(3,2,4,'2019-03-17',NULL,2),(4,2,3,'2019-03-18',NULL,2),(5,9,4,'2019-03-18',NULL,2),(6,4,5,'2019-03-18',NULL,2);
/*!40000 ALTER TABLE `log_diem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_sua_diem`
--

DROP TABLE IF EXISTS `log_sua_diem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_sua_diem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chitietlop_id` int(11) NOT NULL,
  `log_diem_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `log_sua_diem_chitietlop_id_log_diem_id_1501b77f_uniq` (`chitietlop_id`,`log_diem_id`),
  KEY `log_sua_diem_log_diem_id_17bf376c_fk_log_diem_id` (`log_diem_id`),
  CONSTRAINT `log_sua_diem_chitietlop_id_a115fa18_fk_chi_tiet_lop_id` FOREIGN KEY (`chitietlop_id`) REFERENCES `chi_tiet_lop` (`id`),
  CONSTRAINT `log_sua_diem_log_diem_id_17bf376c_fk_log_diem_id` FOREIGN KEY (`log_diem_id`) REFERENCES `log_diem` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_sua_diem`
--

LOCK TABLES `log_sua_diem` WRITE;
/*!40000 ALTER TABLE `log_sua_diem` DISABLE KEYS */;
INSERT INTO `log_sua_diem` VALUES (1,1,1),(4,1,4),(2,2,2),(5,2,5),(3,3,3),(6,3,6);
/*!40000 ALTER TABLE `log_sua_diem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lop_hoc`
--

DROP TABLE IF EXISTS `lop_hoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lop_hoc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maLop` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenLop` longtext COLLATE utf8_unicode_ci,
  `maKhoa_id` int(11) DEFAULT NULL,
  `maMon_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lop_hoc_maKhoa_id_59e5c60d_fk_khoa_hoc_id` (`maKhoa_id`),
  KEY `lop_hoc_maMon_id_b4cdfa83_fk_mon_id` (`maMon_id`),
  CONSTRAINT `lop_hoc_maKhoa_id_59e5c60d_fk_khoa_hoc_id` FOREIGN KEY (`maKhoa_id`) REFERENCES `khoa_hoc` (`id`),
  CONSTRAINT `lop_hoc_maMon_id_b4cdfa83_fk_mon_id` FOREIGN KEY (`maMon_id`) REFERENCES `mon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lop_hoc`
--

LOCK TABLES `lop_hoc` WRITE;
/*!40000 ALTER TABLE `lop_hoc` DISABLE KEYS */;
INSERT INTO `lop_hoc` VALUES (1,NULL,'Lớp 10A1',1,1),(2,NULL,'Lớp 10A2',1,2),(4,NULL,'Lớp 10A3',3,4),(7,NULL,'Lớp 11A1',4,1);
/*!40000 ALTER TABLE `lop_hoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mon`
--

DROP TABLE IF EXISTS `mon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maMon` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenMon` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `maMon` (`maMon`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mon`
--

LOCK TABLES `mon` WRITE;
/*!40000 ALTER TABLE `mon` DISABLE KEYS */;
INSERT INTO `mon` VALUES (1,'M1','Toán'),(2,'V2','Văn'),(3,'M3','Vật Lý'),(4,'M4','Hóa Học'),(5,'L1','Lịch sử 1');
/*!40000 ALTER TABLE `mon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phong_thi`
--

DROP TABLE IF EXISTS `phong_thi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phong_thi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenPhong` longtext COLLATE utf8_unicode_ci,
  `viTri` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ngayThi` date NOT NULL,
  `gio` time(6) NOT NULL,
  `canBoCoi1_id` int(11) DEFAULT NULL,
  `canBoCoi2_id` int(11) DEFAULT NULL,
  `maKyThi_id` int(11) DEFAULT NULL,
  `maLop_id` int(11) DEFAULT NULL,
  `role` int(11) NOT NULL,
  `thoiGianThi` int(11) NOT NULL,
  `hinhThucThi` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `phong_thi_canBoCoi1_id_479056ea_fk_can_bo_id` (`canBoCoi1_id`),
  KEY `phong_thi_canBoCoi2_id_9d8540d4_fk_can_bo_id` (`canBoCoi2_id`),
  KEY `phong_thi_maKyThi_id_37e899b1_fk_ky_thi_id` (`maKyThi_id`),
  KEY `phong_thi_maLop_id_3e02409e_fk_lop_hoc_id` (`maLop_id`),
  CONSTRAINT `phong_thi_canBoCoi1_id_479056ea_fk_can_bo_id` FOREIGN KEY (`canBoCoi1_id`) REFERENCES `can_bo` (`id`),
  CONSTRAINT `phong_thi_canBoCoi2_id_9d8540d4_fk_can_bo_id` FOREIGN KEY (`canBoCoi2_id`) REFERENCES `can_bo` (`id`),
  CONSTRAINT `phong_thi_maKyThi_id_37e899b1_fk_ky_thi_id` FOREIGN KEY (`maKyThi_id`) REFERENCES `ky_thi` (`id`),
  CONSTRAINT `phong_thi_maLop_id_3e02409e_fk_lop_hoc_id` FOREIGN KEY (`maLop_id`) REFERENCES `lop_hoc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phong_thi`
--

LOCK TABLES `phong_thi` WRITE;
/*!40000 ALTER TABLE `phong_thi` DISABLE KEYS */;
INSERT INTO `phong_thi` VALUES (2,'Phong 1','A11','2019-01-07','10:00:00.000000',2,2,1,2,0,1000,'TN'),(6,'Phòng 101','A3','2018-12-28','15:30:00.000000',2,3,3,1,0,60,'Tự luận'),(7,'Phòng 405','A8','2019-01-10','16:30:00.000000',8,6,1,7,1,60,'Trắc nghiệm');
/*!40000 ALTER TABLE `phong_thi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sinh_vien`
--

DROP TABLE IF EXISTS `sinh_vien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sinh_vien` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maSinhVien` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenSinhVien` longtext COLLATE utf8_unicode_ci,
  `maDonVi_id` int(11) DEFAULT NULL,
  `ngaySinh` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sinh_vien_maDonVi_id_fb580e4f_fk_don_vi_id` (`maDonVi_id`),
  CONSTRAINT `sinh_vien_maDonVi_id_fb580e4f_fk_don_vi_id` FOREIGN KEY (`maDonVi_id`) REFERENCES `don_vi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinh_vien`
--

LOCK TABLES `sinh_vien` WRITE;
/*!40000 ALTER TABLE `sinh_vien` DISABLE KEYS */;
INSERT INTO `sinh_vien` VALUES (1,'MD05','Trần Quốc Hoàn',1,'1997-01-04'),(2,'MS02','Nguyễn Phong Sắc',2,'2000-12-04'),(3,'MS01','Kim Mã',1,'1990-01-04'),(4,'MS05','Trần Tiến Dũng@',6,'2006-01-04'),(5,'1041360163','Lê Minh Hiếu',2,'1997-01-01'),(9,'SV1','nguyen van a',2,'1997-09-12'),(10,'SV2','tran van b',2,'1997-06-11'),(11,'SV3','luu thi c',2,'1997-03-21'),(12,'103156','Nguyễn Văn A ',2,'1997-11-25'),(13,'103157','Hoàng Văn B',2,'1997-11-26'),(14,'103158','Trần Văn B',2,'1997-11-27');
/*!40000 ALTER TABLE `sinh_vien` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-19 16:34:56
