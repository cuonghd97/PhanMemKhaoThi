-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add lop hoc',6,'add_lophoc'),(22,'Can change lop hoc',6,'change_lophoc'),(23,'Can delete lop hoc',6,'delete_lophoc'),(24,'Can view lop hoc',6,'view_lophoc'),(25,'Can add chi tiet khoa',7,'add_chitietkhoa'),(26,'Can change chi tiet khoa',7,'change_chitietkhoa'),(27,'Can delete chi tiet khoa',7,'delete_chitietkhoa'),(28,'Can view chi tiet khoa',7,'view_chitietkhoa'),(29,'Can add don vi',8,'add_donvi'),(30,'Can change don vi',8,'change_donvi'),(31,'Can delete don vi',8,'delete_donvi'),(32,'Can view don vi',8,'view_donvi'),(33,'Can add khoa hoc',9,'add_khoahoc'),(34,'Can change khoa hoc',9,'change_khoahoc'),(35,'Can delete khoa hoc',9,'delete_khoahoc'),(36,'Can view khoa hoc',9,'view_khoahoc'),(37,'Can add phong thi',10,'add_phongthi'),(38,'Can change phong thi',10,'change_phongthi'),(39,'Can delete phong thi',10,'delete_phongthi'),(40,'Can view phong thi',10,'view_phongthi'),(41,'Can add chi tiet lop',11,'add_chitietlop'),(42,'Can change chi tiet lop',11,'change_chitietlop'),(43,'Can delete chi tiet lop',11,'delete_chitietlop'),(44,'Can view chi tiet lop',11,'view_chitietlop'),(45,'Can add sinh vien',12,'add_sinhvien'),(46,'Can change sinh vien',12,'change_sinhvien'),(47,'Can delete sinh vien',12,'delete_sinhvien'),(48,'Can view sinh vien',12,'view_sinhvien'),(49,'Can add can bo',13,'add_canbo'),(50,'Can change can bo',13,'change_canbo'),(51,'Can delete can bo',13,'delete_canbo'),(52,'Can view can bo',13,'view_canbo'),(53,'Can add cham thi',14,'add_chamthi'),(54,'Can change cham thi',14,'change_chamthi'),(55,'Can delete cham thi',14,'delete_chamthi'),(56,'Can view cham thi',14,'view_chamthi'),(57,'Can add ky thi',15,'add_kythi'),(58,'Can change ky thi',15,'change_kythi'),(59,'Can delete ky thi',15,'delete_kythi'),(60,'Can view ky thi',15,'view_kythi'),(61,'Can add mon',16,'add_mon'),(62,'Can change mon',16,'change_mon'),(63,'Can delete mon',16,'delete_mon'),(64,'Can view mon',16,'view_mon'),(65,'Can add dap an',17,'add_dapan'),(66,'Can change dap an',17,'change_dapan'),(67,'Can delete dap an',17,'delete_dapan'),(68,'Can view dap an',17,'view_dapan'),(69,'Can add bai thi',18,'add_baithi'),(70,'Can change bai thi',18,'change_baithi'),(71,'Can delete bai thi',18,'delete_baithi'),(72,'Can view bai thi',18,'view_baithi');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bai_thi`
--

DROP TABLE IF EXISTS `bai_thi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bai_thi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baiLam` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `maDe` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bai_thi`
--

LOCK TABLES `bai_thi` WRITE;
/*!40000 ALTER TABLE `bai_thi` DISABLE KEYS */;
INSERT INTO `bai_thi` VALUES (1,'BaiLam/IMG.JPG',NULL),(2,'BaiLam/IMG_jOCMVkz.JPG',NULL),(3,'BaiLam/IMG_EvZXUPy.JPG',NULL),(4,'BaiLam/IMG_T9uFtUX.JPG',NULL),(5,'BaiLam/IMG_jfc4PHK.JPG',NULL),(6,'BaiLam/IMG_qsG4dYm.JPG',NULL),(7,'BaiLam/IMG_TE3hHmW.JPG',NULL),(8,'BaiLam/IMG_Sjz9M4v.JPG',NULL),(9,'BaiLam/IMG_rdjQSUr.JPG',NULL),(10,'BaiLam/IMG_ExpA93f.JPG',NULL),(11,'BaiLam/IMG_m9PuHlr.JPG',NULL),(12,'BaiLam/IMG_EaNIbTP.JPG',NULL),(13,'BaiLam/IMG_3njNQZf.JPG',NULL),(14,'BaiLam/IMG_FxlEFFo.JPG',NULL),(15,'BaiLam/IMG_S58xdZm.JPG',NULL),(16,'BaiLam/IMG_5yQ0eGH.JPG',NULL),(17,'BaiLam/IMG_PMeGp5i.JPG',NULL),(18,'BaiLam/IMG_VvVPYSC.JPG',NULL),(19,'BaiLam/IMG_FyibpWw.JPG',NULL),(20,'BaiLam/IMG_Jnomo8g.JPG',NULL),(21,'BaiLam/IMG_H2XUeRZ.JPG',NULL),(22,'BaiLam/IMG_eDVeXs7.JPG',NULL),(23,'BaiLam/IMG_lKvCKrS.JPG',NULL),(24,'BaiLam/IMG_MvCwEOV.JPG',NULL),(25,'BaiLam/IMG_FZAp98j.JPG',NULL),(26,'BaiLam/IMG_iJYq0r2.JPG',NULL),(27,'BaiLam/IMG_W5eKRhw.JPG',NULL),(28,'BaiLam/IMG_bbWj2Sq.JPG',NULL),(29,'BaiLam/IMG_rfAU4Te.JPG',NULL),(30,'BaiLam/IMG_ux8oXv2.JPG',NULL),(31,'BaiLam/IMG_w2ScIoL.JPG',NULL);
/*!40000 ALTER TABLE `bai_thi` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `can_bo`
--

LOCK TABLES `can_bo` WRITE;
/*!40000 ALTER TABLE `can_bo` DISABLE KEYS */;
INSERT INTO `can_bo` VALUES (1,'pbkdf2_sha256$120000$JgAoBmqaL2hk$ifOlsbUL4omFdlGJy3bZ9gMTDPQavZbgYmx12/+2IlE=','2019-01-07 04:29:59.080556',1,'admin','','','admin@admin.com',1,1,'2018-12-27 04:08:42.483175','admin','1','Đại úy',0,1),(2,'pbkdf2_sha256$120000$JprtM3IYqfdp$5CyiNCBRW27YLaGKN4fmDl+rpDjTSSWpZD2pwIFSX3o=','2019-01-07 01:20:18.580962',1,'coithi','','','coithi@coithi.com',1,1,'2018-12-27 04:09:05.180199','cuong 12','2','Đại úy',1,1),(3,'pbkdf2_sha256$120000$LeHegbT6di8l$fYLkZMxECXb/aW5m9U0rS1K8HzDcWnYi0+vU492OeXI=','2018-12-28 08:49:36.474240',1,'chamthi','','','chamthi@chamthi.com',1,1,'2018-12-27 04:09:18.292253','cham','3','Đại úy',1,1),(6,'pbkdf2_sha256$120000$05vk9iv7TvJl$6ICm8YxtpUj7k4tVgbcu/0oHg0fWzsA9bjcq091wuJ4=','2019-01-07 04:29:40.835221',0,'hieulm','','','hieule@gmail.com',0,1,'2019-01-07 04:28:35.705236','Minh Hieu','MH02','Đại tá',1,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cham_thi`
--

LOCK TABLES `cham_thi` WRITE;
/*!40000 ALTER TABLE `cham_thi` DISABLE KEYS */;
INSERT INTO `cham_thi` VALUES (2,'2018-12-27',2,3,2),(5,'2018-12-28',1,2,6);
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
  `diem` int(11) NOT NULL,
  `trangThai` longtext COLLATE utf8_unicode_ci,
  `lyDo` longtext COLLATE utf8_unicode_ci,
  `ghiChu` longtext COLLATE utf8_unicode_ci,
  `maLop_id` int(11) DEFAULT NULL,
  `maSinhVien_id` int(11) DEFAULT NULL,
  `soBaoDanh` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chi_tiet_lop_maLop_id_8fb7de37_fk_lop_hoc_id` (`maLop_id`),
  KEY `chi_tiet_lop_maSinhVien_id_4e762dfa_fk_sinh_vien_id` (`maSinhVien_id`),
  CONSTRAINT `chi_tiet_lop_maLop_id_8fb7de37_fk_lop_hoc_id` FOREIGN KEY (`maLop_id`) REFERENCES `lop_hoc` (`id`),
  CONSTRAINT `chi_tiet_lop_maSinhVien_id_4e762dfa_fk_sinh_vien_id` FOREIGN KEY (`maSinhVien_id`) REFERENCES `sinh_vien` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_lop`
--

LOCK TABLES `chi_tiet_lop` WRITE;
/*!40000 ALTER TABLE `chi_tiet_lop` DISABLE KEYS */;
INSERT INTO `chi_tiet_lop` VALUES (1,9,'Hoãn thi','nguasasdasd','hihi',1,1,NULL),(2,2,'Hoãn thi','aaasdsad','asd',1,2,NULL),(3,10,'Vi phạm','ngu','aa',1,3,NULL),(4,6,'','sdf','fdsdf',2,3,NULL);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dap_an`
--

LOCK TABLES `dap_an` WRITE;
/*!40000 ALTER TABLE `dap_an` DISABLE KEYS */;
INSERT INTO `dap_an` VALUES (1,'de','DapAn/testpython.xlsx'),(2,'de','DapAn/testpython_uyy6fv3.xlsx'),(3,'de','DapAn/testpython_XCYjB6c.xlsx'),(4,'de','DapAn/testpython_Y3qOS4d.xlsx'),(5,'de','DapAn/testpython_v8gHF7D.xlsx'),(6,'de','DapAn/testpython_KzHyoMq.xlsx'),(7,'de','DapAn/testpython_Xpktp4w.xlsx'),(8,'de','DapAn/testpython_V1LKRhL.xlsx'),(9,'de','DapAn/testpython_ZGUCZBu.xlsx'),(10,'de','DapAn/testpython_aTxV50c.xlsx'),(11,'de','DapAn/testpython_ObF4Ebd.xlsx'),(12,'de','DapAn/testpython_3p4cZ8Q.xlsx'),(13,'de','DapAn/testpython_BNDN71Z.xlsx'),(14,'de','DapAn/testpython_PMHUPgo.xlsx'),(15,'de','DapAn/testpython_yLfNc1R.xlsx'),(16,'de','DapAn/testpython_56m7Kby.xlsx'),(17,'de','DapAn/testpython_PIzUcSQ.xlsx'),(18,'de','DapAn/testpython_JCIqvYC.xlsx'),(19,'de','DapAn/testpython_gMjR5qU.xlsx'),(20,'de','DapAn/testpython_DGAufnz.xlsx'),(21,'de','DapAn/testpython_Tf7mPnZ.xlsx'),(22,'de','DapAn/testpython_7OaUgky.xlsx'),(23,'de','DapAn/testpython_AuhEmC8.xlsx'),(24,'de','DapAn/testpython_YkAr4TI.xlsx'),(25,'de','DapAn/testpython_R3Rzb9k.xlsx'),(26,'de','DapAn/testpython_za8oA9M.xlsx'),(27,'de','DapAn/testpython_QgBRCdh.xlsx'),(28,'de','DapAn/testpython_Kuf6gh9.xlsx'),(29,'de','DapAn/testpython_xW0AovL.xlsx'),(30,'de','DapAn/testpython_qG15Kje.xlsx'),(31,'de','DapAn/testpython_5o3kkfy.xlsx'),(32,'de','DapAn/testpython_PW2iYri.xlsx'),(33,'de','DapAn/testpython_fs56TWT.xlsx'),(34,'de','DapAn/testpython_rch75tl.xlsx'),(35,'de','DapAn/testpython_5nDnp21.xlsx'),(36,'de','DapAn/testpython_Lb93q2g.xlsx'),(37,'de','DapAn/testpython_kHwm24S.xlsx'),(38,'de','DapAn/testpython_EdkKskM.xlsx'),(39,'de','DapAn/testpython_jUGCf2v.xlsx'),(40,'de','DapAn/testpython_m1IHiKM.xlsx'),(41,'de','DapAn/testpython_SU3dojK.xlsx'),(42,'de','DapAn/testpython_HUtUnVU.xlsx'),(43,'de','DapAn/testpython_MB8cHuw.xlsx'),(44,'de','DapAn/testpython_ylifs2c.xlsx'),(45,'de','DapAn/testpython_SQWg4dX.xlsx'),(46,'de','DapAn/testpython_pElaTPa.xlsx'),(47,'de','DapAn/testpython_lHOSdmm.xlsx'),(48,'de','DapAn/testpython_HWNbF4A.xlsx'),(49,'de','DapAn/testpython_ba8yqPD.xlsx'),(50,'de','DapAn/testpython_Xy8BroF.xlsx'),(51,'de','DapAn/testpython_xQiihys.xlsx'),(52,'de','DapAn/testpython_Uy6dAF2.xlsx'),(53,'de','DapAn/testpython_uu2chg4.xlsx'),(54,'de','DapAn/testpython_aoC7HyZ.xlsx'),(55,'de','DapAn/testpython_lpvB5H5.xlsx'),(56,'de','DapAn/testpython_3uFuULA.xlsx'),(57,'de','DapAn/testpython_Azt7zlp.xlsx'),(58,'de','DapAn/testpython_mWwJkHN.xlsx'),(59,'de','DapAn/testpython_RpxQNaL.xlsx'),(60,'de','DapAn/testpython_Y8EkW2j.xlsx'),(61,'de','DapAn/testpython_ZaxHC2l.xlsx'),(62,'de','DapAn/testpython_xvxBoue.xlsx');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(18,'CoiThi','baithi'),(13,'CoiThi','canbo'),(14,'CoiThi','chamthi'),(7,'CoiThi','chitietkhoa'),(11,'CoiThi','chitietlop'),(17,'CoiThi','dapan'),(8,'CoiThi','donvi'),(9,'CoiThi','khoahoc'),(15,'CoiThi','kythi'),(6,'CoiThi','lophoc'),(16,'CoiThi','mon'),(10,'CoiThi','phongthi'),(12,'CoiThi','sinhvien'),(4,'contenttypes','contenttype'),(5,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-12-27 04:02:33.784430'),(2,'contenttypes','0002_remove_content_type_name','2018-12-27 04:02:43.495981'),(3,'auth','0001_initial','2018-12-27 04:02:54.593569'),(4,'auth','0002_alter_permission_name_max_length','2018-12-27 04:03:04.061876'),(5,'auth','0003_alter_user_email_max_length','2018-12-27 04:03:04.131807'),(6,'auth','0004_alter_user_username_opts','2018-12-27 04:03:04.191071'),(7,'auth','0005_alter_user_last_login_null','2018-12-27 04:03:04.269461'),(8,'auth','0006_require_contenttypes_0002','2018-12-27 04:03:04.310167'),(9,'auth','0007_alter_validators_add_error_messages','2018-12-27 04:03:04.364497'),(10,'auth','0008_alter_user_username_max_length','2018-12-27 04:03:04.412278'),(11,'auth','0009_alter_user_last_name_max_length','2018-12-27 04:03:04.463659'),(12,'CoiThi','0001_initial','2018-12-27 04:05:33.027422'),(13,'CoiThi','0002_auto_20181226_0932','2018-12-27 04:05:33.607178'),(14,'CoiThi','0003_auto_20181226_0950','2018-12-27 04:05:51.368445'),(15,'CoiThi','0004_auto_20181226_0953','2018-12-27 04:06:11.354654'),(16,'CoiThi','0005_auto_20181226_1343','2018-12-27 04:06:19.915010'),(17,'CoiThi','0006_lophoc_hinhthucthi','2018-12-27 04:06:20.232259'),(18,'admin','0001_initial','2018-12-27 04:06:35.341745'),(19,'admin','0002_logentry_remove_auto_add','2018-12-27 04:06:35.417194'),(20,'admin','0003_logentry_add_action_flag_choices','2018-12-27 04:06:35.493885'),(21,'sessions','0001_initial','2018-12-27 04:06:36.256086'),(22,'CoiThi','0007_remove_khoahoc_makhoahoc','2018-12-27 04:15:22.394165'),(23,'CoiThi','0008_auto_20181227_1420','2018-12-27 07:20:36.861213'),(24,'CoiThi','0009_auto_20190104_1521','2019-01-04 08:22:32.442599'),(25,'CoiThi','0010_auto_20190107_0933','2019-01-07 02:34:07.112062'),(26,'CoiThi','0011_dapan','2019-01-07 04:02:37.075434'),(27,'CoiThi','0012_baithi','2019-01-07 05:02:35.586241'),(28,'CoiThi','0013_baithi_made','2019-01-07 06:48:55.449521');
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
INSERT INTO `django_session` VALUES ('0gegkh5dhfycyr9etl6uormqeo2bqcsb','OWIyODZhNTNkYTg1YmU3MDJjM2RjZWY5N2ZiZWRhMjlhM2RkZDMwYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzRiM2U2Y2U1MDhmZWEyZmQ2N2YxNjg5M2ExMTliYmE4MTBhMTY0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2019-01-17 07:44:11.440962'),('77vge2brd6751jfvmv9ou3n83ivnaitr','NmJhZTdjMDkzNmZkYzBiZjM3YmY1YTZkY2JiZmViMGQwOGM3NGZhYjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMjIxYWE3YjlkOTY5MWIyMzM5OWQyMzE2ZTY3Njg0NTIyNzQwOWEzIn0=','2019-01-18 03:17:28.041852'),('8f0iz70ogavzb6om9prteu2pbd7genyr','ZDJhN2IyMGZmNjUzNTRlOGIwYmZhOTk3ZmFjN2E4NmFjNTRjNDljMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiIzNGIzZTZjZTUwOGZlYTJmZDY3ZjE2ODkzYTExOWJiYTgxMGExNjQxIn0=','2019-01-10 07:01:46.358437'),('8lzluclq7i656ltui7ivrgt7v15zmax6','Y2VkYzRjYmRmYjAxMWFkMGEwMGY1ZTU0MWE4MWZhMDgyMzE0MjAzYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM0YjNlNmNlNTA4ZmVhMmZkNjdmMTY4OTNhMTE5YmJhODEwYTE2NDEiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2019-01-20 05:07:37.852909'),('9ingrr60sxs4gx6tiethc2o89z8hqf5y','ZjY5NzkzOTI1NjYzOTg1MmM0ZWFjZDlhMzliNTE1ZWI3NDU4ODNhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzg5NDc1YjYxZmE1MTE0NDEwNDk4ODgxODYxMzIxOTAzYzAxMzNiZiIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-01-11 02:11:47.143929'),('9qyadrisbw2knc8081ft29tjx78xeudk','Y2VkYzRjYmRmYjAxMWFkMGEwMGY1ZTU0MWE4MWZhMDgyMzE0MjAzYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM0YjNlNmNlNTA4ZmVhMmZkNjdmMTY4OTNhMTE5YmJhODEwYTE2NDEiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2019-01-11 08:51:32.364370'),('dmjgzvd889hnf6w89kv8r06hgir12rem','NDA2NzdmN2NiYmIxZWI0MjJiMGExMzkyNWQ0MTFiZjkzNzg3MzUwMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNGIzZTZjZTUwOGZlYTJmZDY3ZjE2ODkzYTExOWJiYTgxMGExNjQxIn0=','2019-01-21 04:29:59.110800'),('ilbu522t7maepgpiuecke3py37wdjrg2','ZmJlNWM4MzhkZGMxN2ZhOTE1N2RlZTZhMDE1Yzc3ZDVlMTZlMDc4ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzRiM2U2Y2U1MDhmZWEyZmQ2N2YxNjg5M2ExMTliYmE4MTBhMTY0MSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-01-11 01:19:09.470578'),('n5d9h4oli6eswpvu10s66z983euh8682','OTkwNzAyZDM2MWU0ZWEwZmE4ZDVmOTRlMWE4MDIwODZmYzJhZTdmZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZTc4NDMxNjAwNTg4MGNmMjlhMjBjNjcxYmMxYjNmYjI0YTYzYWUyIn0=','2019-01-21 01:20:18.615989'),('qmrkhr5c479cpp02p0rmk7pflx0ji0bk','ZjY5NzkzOTI1NjYzOTg1MmM0ZWFjZDlhMzliNTE1ZWI3NDU4ODNhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzg5NDc1YjYxZmE1MTE0NDEwNDk4ODgxODYxMzIxOTAzYzAxMzNiZiIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-01-10 04:52:46.628453'),('r92vhfkqc3ju6sli4f67m87hz242ypa9','ZjY5NzkzOTI1NjYzOTg1MmM0ZWFjZDlhMzliNTE1ZWI3NDU4ODNhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzg5NDc1YjYxZmE1MTE0NDEwNDk4ODgxODYxMzIxOTAzYzAxMzNiZiIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-01-18 03:12:19.591072');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `don_vi`
--

LOCK TABLES `don_vi` WRITE;
/*!40000 ALTER TABLE `don_vi` DISABLE KEYS */;
INSERT INTO `don_vi` VALUES (1,'Lính Thủy','LT1'),(2,'Tăng Thiết Giáp','LT2'),(6,'Hậu cần','HC1');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khoa_hoc`
--

LOCK TABLES `khoa_hoc` WRITE;
/*!40000 ALTER TABLE `khoa_hoc` DISABLE KEYS */;
INSERT INTO `khoa_hoc` VALUES (1,'Khóa 1','K1'),(2,'Khóa 2','K2'),(3,'Khóa 3','DH');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ky_thi`
--

LOCK TABLES `ky_thi` WRITE;
/*!40000 ALTER TABLE `ky_thi` DISABLE KEYS */;
INSERT INTO `ky_thi` VALUES (1,'Kì thi cuối năm','2018-12-27','2019-01-29'),(3,'HSG','2019-01-01','2019-01-29');
/*!40000 ALTER TABLE `ky_thi` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lop_hoc`
--

LOCK TABLES `lop_hoc` WRITE;
/*!40000 ALTER TABLE `lop_hoc` DISABLE KEYS */;
INSERT INTO `lop_hoc` VALUES (1,NULL,'Lớp 10A1',1,1),(2,NULL,'Lớp 10A2',1,2),(4,NULL,'Lớp 10A3',3,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mon`
--

LOCK TABLES `mon` WRITE;
/*!40000 ALTER TABLE `mon` DISABLE KEYS */;
INSERT INTO `mon` VALUES (1,'M1','Toán'),(2,'V2','Văn'),(3,'M3','Vật Lý'),(4,'M4','Hóa Học');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phong_thi`
--

LOCK TABLES `phong_thi` WRITE;
/*!40000 ALTER TABLE `phong_thi` DISABLE KEYS */;
INSERT INTO `phong_thi` VALUES (2,'Phong 1','A11','2019-01-06','10:00:00.000000',2,2,1,2,0,1000,'TN'),(6,'Phòng 101','A3','2018-12-28','15:30:00.000000',2,3,3,1,1,60,'Tự luận');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinh_vien`
--

LOCK TABLES `sinh_vien` WRITE;
/*!40000 ALTER TABLE `sinh_vien` DISABLE KEYS */;
INSERT INTO `sinh_vien` VALUES (1,'MD05','Trần Quốc Hoàn',1,'1997-01-04'),(2,'MS02','Nguyễn Phong Sắc',2,'2000-12-04'),(3,'MS01','Kim Mã',1,'1990-01-04'),(4,'MS05','Trần Tiến Dũng@',6,'2006-01-04');
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

-- Dump completed on 2019-01-07 14:57:58
