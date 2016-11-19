-- MySQL dump 10.13  Distrib 5.5.50, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: recruit_stu_production
-- ------------------------------------------------------
-- Server version	5.5.50-0ubuntu0.14.04.1

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
-- Table structure for table `admission_records`
--

DROP TABLE IF EXISTS `admission_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admission_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL COMMENT '学生ID',
  `interview_score_id` int(11) DEFAULT NULL COMMENT '学生面试',
  `written_score_id` int(11) DEFAULT NULL COMMENT '学生笔试',
  `status` int(11) DEFAULT NULL COMMENT '学生录取状态',
  `comment` text COMMENT '描述',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admission_records`
--

LOCK TABLES `admission_records` WRITE;
/*!40000 ALTER TABLE `admission_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `admission_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apply_sets`
--

DROP TABLE IF EXISTS `apply_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apply_sets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_class_id` int(11) DEFAULT NULL COMMENT '学生班级ID',
  `apply_at` datetime DEFAULT NULL COMMENT '预约时间',
  `place_where` varchar(255) DEFAULT NULL COMMENT '预约地点',
  `comment` text COMMENT '描述',
  `limit_menber` int(11) DEFAULT NULL COMMENT '学生人数限制',
  `status` int(11) DEFAULT NULL COMMENT '设置状态',
  `show_at` datetime DEFAULT NULL COMMENT '开放时间',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `end_apply_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apply_sets`
--

LOCK TABLES `apply_sets` WRITE;
/*!40000 ALTER TABLE `apply_sets` DISABLE KEYS */;
INSERT INTO `apply_sets` VALUES (1,NULL,'2016-10-29 00:00:00','','2016-11-26  8:30-17:30 国发院',40,1,'2016-10-29 00:00:00','2016-10-28 17:42:56','2016-11-19 13:48:19','2016-11-25 00:00:00'),(2,NULL,'2016-10-29 00:00:00','国发院','2016-11-24 8:30-17:30 国发院',40,1,'2016-11-19 00:00:00','2016-10-29 09:36:28','2016-11-19 13:48:07','2016-11-23 00:00:00'),(3,NULL,'2016-11-19 00:00:00','','2016-12-3 8:30-17:30 国发院',40,1,'2016-11-19 00:00:00','2016-11-19 13:48:46','2016-11-19 13:48:46','2016-12-02 00:00:00'),(4,NULL,'2016-11-19 00:00:00','','2016-12-4 8:30-17:30 国发院',40,1,'2016-11-19 00:00:00','2016-11-19 13:49:14','2016-11-19 13:49:14','2016-12-03 00:00:00');
/*!40000 ALTER TABLE `apply_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','production','2016-10-28 16:02:45','2016-10-28 16:02:45');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) DEFAULT NULL COMMENT '附件文件名',
  `name` varchar(255) DEFAULT NULL COMMENT '附件原文件名',
  `file_size` varchar(255) DEFAULT NULL COMMENT '附件大小',
  `content_type` varchar(255) DEFAULT NULL COMMENT '附件后缀名',
  `attachment_type` varchar(255) DEFAULT NULL COMMENT '关联模块',
  `attachment_id` int(11) DEFAULT NULL COMMENT '关联模块ID',
  `upload_by` int(11) DEFAULT NULL COMMENT '上传人',
  `column_name` varchar(255) DEFAULT NULL COMMENT '拓展字断',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interview_scores`
--

DROP TABLE IF EXISTS `interview_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interview_scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL COMMENT '学生ID',
  `student_class_id` int(11) DEFAULT NULL COMMENT '学生班级ID',
  `score` float DEFAULT NULL COMMENT '学生面试成绩',
  `score_order` int(11) DEFAULT NULL COMMENT '学生面试成绩排名',
  `interview_at` datetime DEFAULT NULL COMMENT '学生面试时间',
  `show_at` datetime DEFAULT NULL COMMENT '学生面试成绩公布时间',
  `status` int(11) DEFAULT NULL COMMENT '学生面试状态',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview_scores`
--

LOCK TABLES `interview_scores` WRITE;
/*!40000 ALTER TABLE `interview_scores` DISABLE KEYS */;
INSERT INTO `interview_scores` VALUES (1,1,NULL,78.33,1,NULL,NULL,1,'2016-10-29 09:25:17','2016-10-29 09:25:17'),(2,3,NULL,78.33,NULL,NULL,NULL,1,'2016-10-29 09:43:42','2016-10-29 09:43:42'),(3,4,NULL,78.34,NULL,NULL,NULL,1,'2016-10-29 09:43:42','2016-10-29 09:43:42'),(4,5,NULL,78.35,NULL,NULL,NULL,1,'2016-10-29 09:43:42','2016-10-29 09:43:42'),(5,6,NULL,78.32,NULL,NULL,NULL,1,'2016-10-29 09:43:42','2016-10-29 09:43:42'),(6,7,NULL,78.36,NULL,NULL,NULL,1,'2016-10-29 09:43:42','2016-10-29 09:43:42'),(7,8,NULL,78.36,NULL,NULL,NULL,1,'2016-10-29 09:43:42','2016-10-29 09:43:42'),(8,9,NULL,78.37,NULL,NULL,NULL,1,'2016-10-29 09:43:42','2016-10-29 09:43:42'),(9,10,NULL,78.38,NULL,NULL,NULL,1,'2016-10-29 09:43:42','2016-10-29 09:43:42'),(10,11,NULL,78.39,NULL,NULL,NULL,1,'2016-10-29 09:43:42','2016-10-29 09:43:42'),(11,12,NULL,78.39,NULL,NULL,NULL,1,'2016-10-29 09:43:42','2016-10-29 09:43:42'),(12,13,NULL,78.4,NULL,NULL,NULL,1,'2016-10-29 09:43:42','2016-10-29 09:43:42'),(13,14,NULL,78.4,NULL,NULL,NULL,1,'2016-10-29 09:43:42','2016-10-29 09:43:42'),(14,15,NULL,78.41,NULL,NULL,NULL,1,'2016-10-29 09:43:43','2016-10-29 09:43:43'),(15,16,NULL,78.42,NULL,NULL,NULL,1,'2016-10-29 09:43:43','2016-10-29 09:43:43'),(16,17,NULL,78.43,NULL,NULL,NULL,1,'2016-10-29 09:43:43','2016-10-29 09:43:43'),(17,18,NULL,78.43,NULL,NULL,NULL,1,'2016-10-29 09:43:43','2016-10-29 09:43:43'),(18,19,NULL,78.44,NULL,NULL,NULL,1,'2016-10-29 09:43:43','2016-10-29 09:43:43'),(19,20,NULL,78.44,NULL,NULL,NULL,1,'2016-10-29 09:43:43','2016-10-29 09:43:43'),(20,21,NULL,78.45,NULL,NULL,NULL,1,'2016-10-29 09:43:43','2016-10-29 09:43:43'),(21,22,NULL,78.46,NULL,NULL,NULL,1,'2016-10-29 09:43:43','2016-10-29 09:43:43');
/*!40000 ALTER TABLE `interview_scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `action_tag` varchar(255) DEFAULT NULL,
  `function_tag` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_roles`
--

DROP TABLE IF EXISTS `permissions_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_permissions_roles_on_permission_id` (`permission_id`),
  KEY `index_permissions_roles_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_roles`
--

LOCK TABLES `permissions_roles` WRITE;
/*!40000 ALTER TABLE `permissions_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_roles_users_on_role_id` (`role_id`),
  KEY `index_roles_users_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20161024033503'),('20161024033616'),('20161024033848'),('20161024034058'),('20161024034251'),('20161024034343'),('20161024034558'),('20161024034643'),('20161024034748'),('20161024035150'),('20161024050854'),('20161024051120'),('20161024055745'),('20161026150554'),('20161028114335');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_classes`
--

DROP TABLE IF EXISTS `student_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL COMMENT '年级：2016',
  `obj_type` varchar(255) DEFAULT NULL COMMENT '年级类型：EMBA',
  `short_name` varchar(255) DEFAULT NULL COMMENT '简称：E16',
  `status` int(11) DEFAULT NULL COMMENT '班级状态',
  `score_line` float DEFAULT NULL COMMENT '分数线',
  `comment` text COMMENT '描述',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_classes`
--

LOCK TABLES `student_classes` WRITE;
/*!40000 ALTER TABLE `student_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `mobile` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `student_no` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '学生状态',
  `apply_status` int(11) DEFAULT NULL COMMENT '学生预约状态',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'student',NULL,NULL,'student@bimba.com','13401188533',NULL,NULL,1,NULL,'2016-10-28 16:12:23','2016-10-28 16:12:23'),(2,'姓名','姓名拼音','证件号码','安全邮箱','手机号',NULL,'报名号',1,NULL,'2016-10-29 09:39:23','2016-10-29 09:39:23'),(3,'方懿','fangyi','110105197212045441','eve.fang@live.com','13701078414',NULL,NULL,1,NULL,'2016-10-29 09:39:23','2016-11-19 13:46:35'),(4,'高伟','gaowei','131002197809194212','1369593573@qq.com','13911572072',NULL,NULL,1,NULL,'2016-10-29 09:39:23','2016-11-19 13:46:36'),(5,'宫刊','gongkan','130181198411238558','gongkan@aliyun.com','13818134427',NULL,NULL,1,NULL,'2016-10-29 09:39:23','2016-11-19 13:46:36'),(6,'王雷','wanglei','320822198003076012','814444828@qq.com','13601505905',NULL,'110195041',1,NULL,'2016-10-29 09:39:23','2016-10-29 09:39:23'),(7,'邓志友','dengzhiyou','422128197306170832','13701319130@163.com','13701319130',NULL,NULL,1,NULL,'2016-10-29 09:39:24','2016-11-19 13:46:35'),(8,'娄晓音','louxiaoyin','110104197810010429','1046890837@qq.com','18610546426',NULL,NULL,1,NULL,'2016-10-29 09:39:24','2016-11-19 13:46:43'),(9,'张钧-大专','zhangjun','410103197208263735','zsll2000@126.com','13703821268',NULL,NULL,1,NULL,'2016-10-29 09:39:24','2016-11-19 13:46:52'),(10,'周厦','zhouxia','320311198512274619','zx2299@foxmail.com','18652211034',NULL,'110194303',1,NULL,'2016-10-29 09:39:24','2016-10-29 09:39:24'),(11,'贾玲','jialing','620502198112060449','jialing@139.com','13911711788',NULL,NULL,1,NULL,'2016-10-29 09:39:24','2016-11-19 13:46:38'),(12,'陈宝国','chenbaoguo','520221196911270098','chenbaoguo@ppmoney.com','13316083959',NULL,NULL,1,NULL,'2016-10-29 09:39:24','2016-11-19 11:07:53'),(13,'周延','zhouyan','210103196507191514','amygroup@outlook.com','18640345111',NULL,NULL,1,NULL,'2016-10-29 09:39:25','2016-11-19 13:46:53'),(14,'郭炳泽','guobingze','370103196806255535','business@qdslhx.com','13906489390',NULL,NULL,1,NULL,'2016-10-29 09:39:25','2016-11-19 13:46:36'),(15,'王林','wanglin','130637198305150933','13911702369@163.com','13911702369',NULL,NULL,1,NULL,'2016-10-29 09:39:25','2016-11-19 13:46:48'),(16,'郑欢','zhenghuan','110108197910191437','blade004@126.com','13911011935',NULL,NULL,1,NULL,'2016-10-29 09:39:25','2016-11-19 13:46:53'),(17,'董珂','dongke','410105197812271611','18600860096@163.com','18600860096',NULL,NULL,1,NULL,'2016-10-29 09:39:25','2016-11-19 13:46:35'),(18,'张建新','zhangjianxin','511024197402160212','13501391585@163.com','13501391585',NULL,'110194198',1,NULL,'2016-10-29 09:39:25','2016-10-29 09:39:25'),(19,'赵伶捷','zhaolinjie','320106198309271218','77279609@qq.com','18066051088',NULL,NULL,1,NULL,'2016-10-29 09:39:25','2016-11-19 13:46:53'),(20,'吕小彬','lvxiaobin','640102197108100011','13323502166@189.cn','13323502166',NULL,NULL,1,NULL,'2016-10-29 09:39:26','2016-11-19 13:46:43'),(21,'王培','wwangpei','642124197908070017','13911180069@163.com','18101197598',NULL,NULL,1,NULL,'2016-10-29 09:39:26','2016-11-19 13:46:48'),(22,'杨占勇','yangzhanyong','110225196907290079','yzy1969@263.net','18901121969',NULL,NULL,1,NULL,'2016-10-29 09:39:26','2016-11-19 13:46:50'),(23,'包一民','baoyimin','330106197711060432','baobyeye@126.com','13805731980',NULL,NULL,1,NULL,'2016-11-19 11:07:53','2016-11-19 11:07:53'),(24,'曹迪','caodi','371327198409010018','401978901@qq.com','18910193558',NULL,NULL,1,NULL,'2016-11-19 11:07:53','2016-11-19 11:07:53'),(25,'陈春光','chenchunguang','420983197610019578','chencg@qianbaoplus.com','13910003822',NULL,NULL,1,NULL,'2016-11-19 11:07:53','2016-11-19 11:07:53'),(26,'陈大明','chendaming','429004198103054051','chendaming@listentech.com.cn','18916666020',NULL,NULL,1,NULL,'2016-11-19 11:07:53','2016-11-19 11:07:53'),(27,'陈航','chenhang','340104196806011531','chenhang@bosssoft.com.cn','13905008909',NULL,NULL,1,NULL,'2016-11-19 11:07:54','2016-11-19 11:07:54'),(28,'陈华东','chenhuadong','420704197208240876','chenhuadong.km@founder.com','13669762732',NULL,NULL,1,NULL,'2016-11-19 11:07:54','2016-11-19 11:07:54'),(29,'陈全斌','chenquanbin','510226197104224399','chenken1971@163.com','13996368999',NULL,NULL,1,NULL,'2016-11-19 11:07:54','2016-11-19 11:07:54'),(30,'程刚涛','chenggangtao','379014197402115612','waterman74@163.com','13609047695',NULL,NULL,1,NULL,'2016-11-19 13:46:34','2016-11-19 13:46:34'),(31,'崔洪霞','cuihongxia','210905197805231028','286463349@qq.com','18618180829',NULL,NULL,1,NULL,'2016-11-19 13:46:35','2016-11-19 13:46:35'),(32,'代丽丽','dailili','371321198401157949','p2593@126.com','15901161620',NULL,NULL,1,NULL,'2016-11-19 13:46:35','2016-11-19 13:46:35'),(33,'戴虹','daihong','650105197009102725','dhong@sec1999.com','13910064270',NULL,NULL,1,NULL,'2016-11-19 13:46:35','2016-11-19 13:46:35'),(34,'邓露','denglu','51112819820621002X','1740294@qq.com','18612666060',NULL,NULL,1,NULL,'2016-11-19 13:46:35','2016-11-19 13:46:35'),(35,'丁刚','dinggang','230506197303020413','dinggang@fengbaoheng.com','13911228018',NULL,NULL,1,NULL,'2016-11-19 13:46:35','2016-11-19 13:46:35'),(36,'樊亚静','fanyajing','610102198212043167','Joyce.fan@daigj.com','13811086379',NULL,NULL,1,NULL,'2016-11-19 13:46:35','2016-11-19 13:46:35'),(37,'冯超','fengchao','360102198311196319','neo1119@163.com','13911698580',NULL,NULL,1,NULL,'2016-11-19 13:46:35','2016-11-19 13:46:35'),(38,'高立','gaoli','110101197612192517','gaoli123@sina.com','13901016697',NULL,NULL,1,NULL,'2016-11-19 13:46:36','2016-11-19 13:46:36'),(39,'高瑞','gaorui','152524198210150015','1098860669@qq.com','18601222433',NULL,NULL,1,NULL,'2016-11-19 13:46:36','2016-11-19 13:46:36'),(40,'顾燏鲁','guyulu','510213197603150513','147732025@qq.com','13910187259',NULL,NULL,1,NULL,'2016-11-19 13:46:36','2016-11-19 13:46:36'),(41,'郭冰','guobing','370602198408131019','bing.guo@obsidia.com','18620373877',NULL,NULL,1,NULL,'2016-11-19 13:46:36','2016-11-19 13:46:36'),(42,'郭苏扬','guosuyang','230106198607213217','109199813@qq.com','13811631312',NULL,NULL,1,NULL,'2016-11-19 13:46:36','2016-11-19 13:46:36'),(43,'韩震','hanzhen','140302197608080910','forgetselfs@sina.com','13691559622',NULL,NULL,1,NULL,'2016-11-19 13:46:37','2016-11-19 13:46:37'),(44,'郝君','haojun','370705198707223540','haoyifei@hydfkj.com','13811622395',NULL,NULL,1,NULL,'2016-11-19 13:46:37','2016-11-19 13:46:37'),(45,'何宏文','hehongwen','130681198305263829','hehongwen1983@163.com','13811630905',NULL,NULL,1,NULL,'2016-11-19 13:46:37','2016-11-19 13:46:37'),(46,'贺涛','hetao','230104197207232331','hetao.zy@founder.com','18610183959',NULL,NULL,1,NULL,'2016-11-19 13:46:37','2016-11-19 13:46:37'),(47,'赫言','heyan','210624197501150010','18600017600@qq.com','18600017600',NULL,NULL,1,NULL,'2016-11-19 13:46:37','2016-11-19 13:46:37'),(48,'胡捷','hujie','130802198105081444','302875246@qq.com','18611397259',NULL,NULL,1,NULL,'2016-11-19 13:46:37','2016-11-19 13:46:37'),(49,'黄彬','huangbin','120104198308315119','yanbianbank@126.com','18622606258',NULL,NULL,1,NULL,'2016-11-19 13:46:37','2016-11-19 13:46:37'),(50,'黄翀','huangchong','230103197304255512','huangchong@wodecheche.com','13701369166',NULL,NULL,1,NULL,'2016-11-19 13:46:38','2016-11-19 13:46:38'),(51,'黄海燕','huanghaiyan','330104196810111701','455180887@qq.com','13606610555',NULL,NULL,1,NULL,'2016-11-19 13:46:38','2016-11-19 13:46:38'),(52,'黄立才','huanglicai','362101198110101032','hlc8668@163.com','18610357818',NULL,NULL,1,NULL,'2016-11-19 13:46:38','2016-11-19 13:46:38'),(53,'黄其伟','huangqiwei','320321198402181836','110422208@qq.com','15335187999',NULL,NULL,1,NULL,'2016-11-19 13:46:38','2016-11-19 13:46:38'),(54,'贾世光','jiashiguang','371121197802124210','jiashiguang@bonc.com.cn','18623396080',NULL,NULL,1,NULL,'2016-11-19 13:46:38','2016-11-19 13:46:38'),(55,'江冠华','jiangguanhua','360312198105172010','bonejiang@126.com','13812688004',NULL,NULL,1,NULL,'2016-11-19 13:46:38','2016-11-19 13:46:38'),(56,'亢迪','kangdi','410305198410300550','18610122033@163.com','18610122033',NULL,NULL,1,NULL,'2016-11-19 13:46:39','2016-11-19 13:46:39'),(57,'孔令博','konglingbo','372502197610072771','konglb@acewill.cn','18911882688',NULL,NULL,1,NULL,'2016-11-19 13:46:39','2016-11-19 13:46:39'),(58,'郎丽娜','langlina','130102197710142142','langlina@bjcsqq.com','13810288095',NULL,NULL,1,NULL,'2016-11-19 13:46:39','2016-11-19 13:46:39'),(59,'冷雨璇','lengyuxuan','510106197611291827','jewelleng@aliyun.com','18801295528',NULL,NULL,1,NULL,'2016-11-19 13:46:39','2016-11-19 13:46:39'),(60,'李辰','lichen','512922197309188699','lichencn@163.com','13884452855',NULL,NULL,1,NULL,'2016-11-19 13:46:39','2016-11-19 13:46:39'),(61,'李冲','lichong','410105197012118459','sunref@126.com','13716877877',NULL,NULL,1,NULL,'2016-11-19 13:46:39','2016-11-19 13:46:39'),(62,'李浩然','lihaoran','110108198705302235','lihaoran@csc.com.cn','13901182439',NULL,NULL,1,NULL,'2016-11-19 13:46:40','2016-11-19 13:46:40'),(63,'李红星','lihongxing','342101197403072230','lihongxingchina@163.com','13866109907',NULL,NULL,1,NULL,'2016-11-19 13:46:40','2016-11-19 13:46:40'),(64,'李继伟','lijiwei','610104198003286114','164100558@qq.com','18611764949',NULL,NULL,1,NULL,'2016-11-19 13:46:40','2016-11-19 13:46:40'),(65,'李文婷','liwenting','23010219871228322X','15710078128@163.com','13381177777',NULL,NULL,1,NULL,'2016-11-19 13:46:40','2016-11-19 13:46:40'),(66,'李文贤','liwenxian','142329197803221928','68383306@qq.com','13910658871',NULL,NULL,1,NULL,'2016-11-19 13:46:40','2016-11-19 13:46:40'),(67,'李欣','lixin','330106197705150423','lixin@zj.icbc.com.cn','13858072267',NULL,NULL,1,NULL,'2016-11-19 13:46:41','2016-11-19 13:46:41'),(68,'李信翔','lixinxiang','310113198205192111','alienxxl@hotmail.com','13512199920',NULL,NULL,1,NULL,'2016-11-19 13:46:41','2016-11-19 13:46:41'),(69,'李延国','liyanguo','370721197507223277','lyg@pkuxrs.org','13501067089',NULL,NULL,1,NULL,'2016-11-19 13:46:41','2016-11-19 13:46:41'),(70,'李燕','liyan','120107197606277821','liyan@lenovo.com','13801002176',NULL,NULL,1,NULL,'2016-11-19 13:46:41','2016-11-19 13:46:41'),(71,'李钟伟','lizhongwei','310230197106207215','lee@shopex.cn','13901698602',NULL,NULL,1,NULL,'2016-11-19 13:46:41','2016-11-19 13:46:41'),(72,'林莉萍','linliping','110105197703065826','llin@hanguangbaihuo.com','13701273252',NULL,NULL,1,NULL,'2016-11-19 13:46:41','2016-11-19 13:46:41'),(73,'林文','linwen','441581198109190317','linwen@p2phx.com','13692209618',NULL,NULL,1,NULL,'2016-11-19 13:46:41','2016-11-19 13:46:41'),(74,'刘畅','liuchang','110106197802194814','citibank1001@sina.com','13911512165',NULL,NULL,1,NULL,'2016-11-19 13:46:42','2016-11-19 13:46:42'),(75,'刘海军','liuhaijun','231024197810160011','alex@ruica.com','13910012991',NULL,NULL,1,NULL,'2016-11-19 13:46:42','2016-11-19 13:46:42'),(76,'刘思强','liusiqiang','370282198001053215','1410695665@qq.com','13361591160',NULL,NULL,1,NULL,'2016-11-19 13:46:42','2016-11-19 13:46:42'),(77,'刘娓娜','liuweina','622224198408010022','lawyerwinnie@126.com','13810279909',NULL,NULL,1,NULL,'2016-11-19 13:46:42','2016-11-19 13:46:42'),(78,'刘扬','liuyang','410102197408302544','syy7408@163.com','13910090615',NULL,NULL,1,NULL,'2016-11-19 13:46:42','2016-11-19 13:46:42'),(79,'刘洋','liuyang','320322197801288632','18801888986@163.com','18801188986',NULL,NULL,1,NULL,'2016-11-19 13:46:42','2016-11-19 13:46:42'),(80,'刘志彬','liuzhibin','61252519740822131X','Erwin@cein.cc','18688705719',NULL,NULL,1,NULL,'2016-11-19 13:46:43','2016-11-19 13:46:43'),(81,'刘梓航','liuzihang','110102197906260091','liu.zihang@outlook.com','13801389394',NULL,NULL,1,NULL,'2016-11-19 13:46:43','2016-11-19 13:46:43'),(82,'陆大昕','ludaxin','320102197206222819','eric.lu@app-hk.com','13801962767',NULL,NULL,1,NULL,'2016-11-19 13:46:43','2016-11-19 13:46:43'),(83,'陆元铸(陆凯）','luyuanzhu','3702811982060  30000','lk777@139.com','13911137773',NULL,NULL,1,NULL,'2016-11-19 13:46:43','2016-11-19 13:46:43'),(84,'吕罡','lvgang','520103198105203211','polarlv@163.com','18601690520',NULL,NULL,1,NULL,'2016-11-19 13:46:43','2016-11-19 13:46:43'),(85,'马必中','mabizhong','430103197211091077','bz6543@126.com','18611717510',NULL,NULL,1,NULL,'2016-11-19 13:46:43','2016-11-19 13:46:43'),(86,'马莉','mali','44040019640930452X','13326633699@163.com','13326633699',NULL,NULL,1,NULL,'2016-11-19 13:46:44','2016-11-19 13:46:44'),(87,'孟雪','mengxue','372301198301070067','mengxue@zhongzhi.com.cn','15811262705',NULL,NULL,1,NULL,'2016-11-19 13:46:44','2016-11-19 13:46:44'),(88,'慕雷','mulei','230105197303100538','alexking521@sina.cn','13601120835',NULL,NULL,1,NULL,'2016-11-19 13:46:44','2016-11-19 13:46:44'),(89,'宁阳春','ningyangchun','220104198402191822','ningyangchun@edu-gee.com','13681035378',NULL,NULL,1,NULL,'2016-11-19 13:46:44','2016-11-19 13:46:44'),(90,'潘艺琼','panyiqiong','420107197802080023','52749290@qq.com','13910510270',NULL,NULL,1,NULL,'2016-11-19 13:46:45','2016-11-19 13:46:45'),(91,'戚震男','qizhengnan','440104197507204710','qizhennan@cfldcn.com','18022880589',NULL,NULL,1,NULL,'2016-11-19 13:46:45','2016-11-19 13:46:45'),(92,'钱嗣维','qiansiwei','320922198305079011','qsw@airmed.cn','13689266999',NULL,NULL,1,NULL,'2016-11-19 13:46:45','2016-11-19 13:46:45'),(93,'乔华','qiaohua','21092119790217001X','qiaohua2008@sina.com','13661094909',NULL,NULL,1,NULL,'2016-11-19 13:46:45','2016-11-19 13:46:45'),(94,'秦锴','qinkai','140402198301110839','75809220@qq.com','15835155342',NULL,NULL,1,NULL,'2016-11-19 13:46:45','2016-11-19 13:46:45'),(95,'屈鹏涛','qupengtao','411223196904257539','tonyqu@megas.net.cn','13901234439',NULL,NULL,1,NULL,'2016-11-19 13:46:45','2016-11-19 13:46:45'),(96,'饶海清','raohaiqing','440222197404082237','406872346@qq.com','13825551580',NULL,NULL,1,NULL,'2016-11-19 13:46:45','2016-11-19 13:46:45'),(97,'佘桥','sheqiao','42230119821030001X','sheqiao@hotmail.com','18611385764',NULL,NULL,1,NULL,'2016-11-19 13:46:46','2016-11-19 13:46:46'),(98,'盛晓波','shengxiaobo','320421197808122917','470909@qq.com','13701758868',NULL,NULL,1,NULL,'2016-11-19 13:46:46','2016-11-19 13:46:46'),(99,'盛雪玲','shengxueling','622225198405021822','shengxl@yonyou.com','13720028490',NULL,NULL,1,NULL,'2016-11-19 13:46:46','2016-11-19 13:46:46'),(100,'史立斌','shilibin','32042219670803011X','slb0803@163.com','13809029999',NULL,NULL,1,NULL,'2016-11-19 13:46:46','2016-11-19 13:46:46'),(101,'舒青','shuqing','420400197602173884','992432013@qq.com','18612718886',NULL,NULL,1,NULL,'2016-11-19 13:46:46','2016-11-19 13:46:46'),(102,'孙延国','sunyanguo','23070419700906101X','sunyanguo2009@163.com','13241442868',NULL,NULL,1,NULL,'2016-11-19 13:46:46','2016-11-19 13:46:46'),(103,'孙振华','sunzhenghua','230505198412310071','410768888@qq.com','18606313333',NULL,NULL,1,NULL,'2016-11-19 13:46:47','2016-11-19 13:46:47'),(104,'滕军勇','tengjunyong','370685198001316012','tjyong2005@163.com','13520487531',NULL,NULL,1,NULL,'2016-11-19 13:46:47','2016-11-19 13:46:47'),(105,'田卫国','tianweiguo','410322197301082832','weiguo.tian@nature-cn.com','13928242101',NULL,NULL,1,NULL,'2016-11-19 13:46:47','2016-11-19 13:46:47'),(106,'万理','wangli','420300197601122510','904171227@qq.com','18613886222',NULL,NULL,1,NULL,'2016-11-19 13:46:47','2016-11-19 13:46:47'),(107,'汪兰英','wanglanying','330182197705280048','duubwly@163.com','13910910387',NULL,NULL,1,NULL,'2016-11-19 13:46:47','2016-11-19 13:46:47'),(108,'王怀州','wanghuazhou','150204198004250011','guru@live.cn','13269523456',NULL,NULL,1,NULL,'2016-11-19 13:46:47','2016-11-19 13:46:47'),(109,'王克越','wangkeyue','370624197901070030','wky332@126.com','13811790300',NULL,NULL,1,NULL,'2016-11-19 13:46:47','2016-11-19 13:46:47'),(110,'王露影','wangluying','133022197501310026','lu13901388736@126.com','13901388736',NULL,NULL,1,NULL,'2016-11-19 13:46:48','2016-11-19 13:46:48'),(111,'王明利','wangmingli','230108198310151011','wmlmingtian@126.com','13910295821',NULL,NULL,1,NULL,'2016-11-19 13:46:48','2016-11-19 13:46:48'),(112,'王平','wangping','130202198309150015','wangtic@163.com','13810086470',NULL,NULL,1,NULL,'2016-11-19 13:46:48','2016-11-19 13:46:48'),(113,'王少华','wangshaohua','620105197112111026','9978683@qq.com','13901192305',NULL,NULL,1,NULL,'2016-11-19 13:46:48','2016-11-19 13:46:48'),(114,'王文强','wangwenqiang','130425198406121019','13601182831@126.com','13601182831',NULL,NULL,1,NULL,'2016-11-19 13:46:48','2016-11-19 13:46:48'),(115,'王西彪','wangxibiao','372924197409204816','13953101499@163.com','13953101499',NULL,NULL,1,NULL,'2016-11-19 13:46:49','2016-11-19 13:46:49'),(116,'王延春','wangyanchun','610602197001080024','yanchunwang@caijing.com.cn','18910151176',NULL,NULL,1,NULL,'2016-11-19 13:46:49','2016-11-19 13:46:49'),(117,'王勇','wangrong','622223197609120016','wangyong@longfor.com','18866652223',NULL,NULL,1,NULL,'2016-11-19 13:46:49','2016-11-19 13:46:49'),(118,'王宇新','wangyuxin','130802197504100812','wangyx1975@vip.sina.com','13911884992',NULL,NULL,1,NULL,'2016-11-19 13:46:49','2016-11-19 13:46:49'),(119,'王悦梅','wangyuemei','519004197112133920','18601145677@163.com','18601145677',NULL,NULL,1,NULL,'2016-11-19 13:46:49','2016-11-19 13:46:49'),(120,'魏思宇','weisiyu','110105198402174177','191802338@qq.com','13488709390',NULL,NULL,1,NULL,'2016-11-19 13:46:49','2016-11-19 13:46:49'),(121,'吴鹏翎','wupengling','350322197208072553','wupengling@jiuqi.com.cn','13810503142',NULL,NULL,1,NULL,'2016-11-19 13:46:50','2016-11-19 13:46:50'),(122,'吴晓武','wuxiaowu','36010319760831001X','william_w01@hotmail.com','15903110808',NULL,NULL,1,NULL,'2016-11-19 13:46:50','2016-11-19 13:46:50'),(123,'谢贵全','xieguiquan','510231196801151718','xgq_8888@163.com','13908367316',NULL,NULL,1,NULL,'2016-11-19 13:46:50','2016-11-19 13:46:50'),(124,'闫硕','yanshuo','110105198603150016','373177930@qq.com','13811413103',NULL,NULL,1,NULL,'2016-11-19 13:46:50','2016-11-19 13:46:50'),(125,'杨浚治','yangjunzhi','620502197902032050','danieluibe@126.com','18801089885',NULL,NULL,1,NULL,'2016-11-19 13:46:50','2016-11-19 13:46:50'),(126,'杨照','yangzhao','370611197212131537','ytyangzhao@126.com','13611092266',NULL,NULL,1,NULL,'2016-11-19 13:46:50','2016-11-19 13:46:50'),(127,'姚智宇','yaozhiyu','510231197401065436','aaronyao@mentholatum.com.cn','13501216262',NULL,NULL,1,NULL,'2016-11-19 13:46:51','2016-11-19 13:46:51'),(128,'伊明','yiming','110108197812300716','yiming1@chinaunicom.cn','15611029100',NULL,NULL,1,NULL,'2016-11-19 13:46:51','2016-11-19 13:46:51'),(129,'于福栋','yufudong','232330197103020014','aolidaYU@163.com','18645585555',NULL,NULL,1,NULL,'2016-11-19 13:46:51','2016-11-19 13:46:51'),(130,'余斌','yubin','510214197705050413','142982@qq.com','18684697755',NULL,NULL,1,NULL,'2016-11-19 13:46:51','2016-11-19 13:46:51'),(131,'张春梅','zhangchunmei','372431097806070045','zhangchunmei2@cmbc.com.cn','13521377717',NULL,NULL,1,NULL,'2016-11-19 13:46:51','2016-11-19 13:46:51'),(132,'张虎成','zhanghucheng','420323198112140012','36446332@qq.com','13717881418',NULL,NULL,1,NULL,'2016-11-19 13:46:51','2016-11-19 13:46:51'),(133,'张海霞','zhanghaixia','130133198202012447','zhanghaixia@ee-design.com.cn','15801544805',NULL,NULL,1,NULL,'2016-11-19 13:46:51','2016-11-19 13:46:51'),(134,'张嘹原','zhangliaoyuan','410423197105092058','1678095648@qq.com','13241888007',NULL,NULL,1,NULL,'2016-11-19 13:46:52','2016-11-19 13:46:52'),(135,'张琦','zhangqi','330102197407150913','sqz5259@163.com','18602563535',NULL,NULL,1,NULL,'2016-11-19 13:46:52','2016-11-19 13:46:52'),(136,'张啸','zhangxiao','110101197804051014','zhangxiao7845@hotmail.com','13701137958',NULL,NULL,1,NULL,'2016-11-19 13:46:52','2016-11-19 13:46:52'),(137,'张应旺','zhangyingwang','350783198112024011','768685521@qq.com','18650377577',NULL,NULL,1,NULL,'2016-11-19 13:46:52','2016-11-19 13:46:52'),(138,'张勇','zhangyong','210702197904011215','1051967456@qq.com','13718224455',NULL,NULL,1,NULL,'2016-11-19 13:46:52','2016-11-19 13:46:52'),(139,'赵海男','zhaohainan','130703196901250976','zhaohn@safewall.com.cn','13601366727',NULL,NULL,1,NULL,'2016-11-19 13:46:52','2016-11-19 13:46:52'),(140,'赵霖','zhaolin','370102197604182516','285819981@qq.com','13911532516',NULL,NULL,1,NULL,'2016-11-19 13:46:53','2016-11-19 13:46:53'),(141,'赵苏娅','zhaosuya','140402198003151624','zsy29@sina.com','13811457195',NULL,NULL,1,NULL,'2016-11-19 13:46:53','2016-11-19 13:46:53'),(142,'周厦','zhouxia','320311198512274619','zx2299@foxmil.com','18652211034',NULL,NULL,1,NULL,'2016-11-19 13:46:53','2016-11-19 13:46:53'),(143,'周有','zhouyou','130103196402072113','zhouyou5000@sina.com','13911086468',NULL,NULL,1,NULL,'2016-11-19 13:46:53','2016-11-19 13:46:53'),(144,'周洲','zhouzhou','340204197604240328','zhou.zhou@yeepay.com','13911778006',NULL,NULL,1,NULL,'2016-11-19 13:46:53','2016-11-19 13:46:53'),(145,'朱文勇','zhuwenyong','420621198202012712','13811770772@139.com','13811770772',NULL,NULL,1,NULL,'2016-11-19 13:46:54','2016-11-19 13:46:54'),(146,'宗玉杰','zongyujie','372925198005010741','zongyujie@stateunion.net','13910525881',NULL,NULL,1,NULL,'2016-11-19 13:46:54','2016-11-19 13:46:54'),(147,'邹优锐','zouyourui','450103198410220511','13152501181@163.com','13152501181',NULL,NULL,1,NULL,'2016-11-19 13:46:54','2016-11-19 13:46:54');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `mobile` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `is_valid` tinyint(1) DEFAULT '1',
  `status` int(11) DEFAULT NULL COMMENT '用户状态',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'student',NULL,NULL,'student@bimba.com','13401188533',NULL,'$2a$10$EAcU9a5a5HIx3GNLfmuF/.4JvTDv5JPqZk/ol1afZTSXQ2ko3vGJW',NULL,NULL,NULL,20,'2016-10-31 01:38:00','2016-10-30 13:44:33','162.105.169.187','110.96.32.163',1,1,'2016-10-28 16:06:56','2016-10-31 01:38:00',1),(2,'worker',NULL,NULL,'worker@bimba.com','13401188355','','$2a$10$JbxbqzNE6XKLFUe.WSSP3u5/9Hbj6mb5YKzsAI.A18yEHXCqp..mW',NULL,NULL,'2016-11-19 13:44:38',21,'2016-11-19 13:45:56','2016-11-19 13:44:38','118.212.237.29','118.212.237.29',1,1,'2016-10-28 16:07:38','2016-11-19 13:45:56',2),(3,'方懿','fangyi','110105197212045441','eve.fang@live.com','13701078414',NULL,'$2a$10$grzRSAhuSbFwDb/hndPHIObXx0hEmhxzjEb/8KF25g96pKmJRwlHq',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-10-29 09:39:23','2016-10-29 09:39:23',1),(4,'高伟','gaowei','131002197809194212','1369593573@qq.com','13911572072',NULL,'$2a$10$vMDebq.Irat0LG5Yk0LuG.O.rY4tYih97LHAsvGWts4Vbrw7klduO',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-10-29 09:39:23','2016-10-29 09:39:23',1),(5,'宫刊','gongkan','130181198411238558','gongkan@aliyun.com','13818134427',NULL,'$2a$10$X2Ykh7AwMG5E9bjWUoZ5fe9rVWYJP3hQ9RjxzrVSMNCSzBC836PPe',NULL,NULL,NULL,1,'2016-11-01 01:13:34','2016-11-01 01:13:34','162.105.169.95','162.105.169.95',1,1,'2016-10-29 09:39:23','2016-11-01 01:13:34',1),(6,'王雷','wanglei','320822198003076012','814444828@qq.com','13601505905',NULL,'$2a$10$9BIWPRfPQDkzm11Q0pQXvOf8P4DRW.BRdz8DgpUzjF.yonljRkPGu',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-10-29 09:39:24','2016-10-29 09:39:24',1),(7,'邓志友','dengzhiyou','422128197306170832','13701319130@163.com','13701319130',NULL,'$2a$10$kI7BlcHjUfDlWFMYBg70MejJtcxE6qv2zeIIgpGKtxkLg79kpDtVq',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-10-29 09:39:24','2016-10-29 09:39:24',1),(8,'娄晓音','louxiaoyin','110104197810010429','1046890837@qq.com','18610546426',NULL,'$2a$10$4/.zzIpVCiy3aB5erGLI8.L186BiACqZko5JrIvWxz.TbnasObiGu',NULL,NULL,NULL,1,'2016-11-16 06:52:28','2016-11-16 06:52:28','162.105.169.47','162.105.169.47',1,1,'2016-10-29 09:39:24','2016-11-16 06:52:28',1),(9,'张钧-大专','zhangjun','410103197208263735','zsll2000@126.com','13703821268',NULL,'$2a$10$K8Fz0TtByefqCz/aaZRvE.2DKBIFEFM7lABf.8RTAHc2taMvW/FA.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-10-29 09:39:24','2016-11-19 13:46:52',1),(10,'周厦','zhouxia','320311198512274619','zx2299@foxmail.com','18652211034',NULL,'$2a$10$qT.sdU6fRtU7SseeYm/1puKGRFF0cs3ZooFc.J0ECiEZG5Fx6a.jC',NULL,NULL,NULL,1,'2016-10-30 13:04:25','2016-10-30 13:04:25','114.245.184.200','114.245.184.200',1,1,'2016-10-29 09:39:24','2016-10-30 13:04:25',1),(11,'贾玲','jialing','620502198112060449','jialing@139.com','13911711788',NULL,'$2a$10$WK0DtOnN9dyCAk4t7ttkMOrYIIcH9E9cre8oiAbNDCVA1W9Ngy9QG',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-10-29 09:39:24','2016-10-29 09:39:24',1),(12,'陈宝国','chenbaoguo','520221196911270098','chenbaoguo@ppmoney.com','13316083959',NULL,'$2a$10$LI7pZsnS6YcRes0uHz1QfeSkAJXDsCGE.nn.DLYu9Wbnr3CJqZD2i',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-10-29 09:39:25','2016-10-29 09:39:25',1),(13,'周延','zhouyan','210103196507191514','amygroup@outlook.com','18640345111',NULL,'$2a$10$OuT2bHIgNo3rM0aR2.JiPOh6rywKuQ7e2PM54nURQQT0cWNYiXV.a',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-10-29 09:39:25','2016-10-29 09:39:25',1),(14,'郭炳泽','guobingze','370103196806255535','business@qdslhx.com','13906489390',NULL,'$2a$10$yFtpShpNpHEsp/0.kk367eceRGLYDzhOE4UG.fO9lbVuDOKNI5IqS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-10-29 09:39:25','2016-10-29 09:39:25',1),(15,'王林','wanglin','130637198305150933','13911702369@163.com','13911702369',NULL,'$2a$10$OIrIVeIn9Hufj1ILtkOymOSQ3HspczFA8XyAzik0yxg9c7FsASPRK',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-10-29 09:39:25','2016-10-29 09:39:25',1),(16,'郑欢','zhenghuan','110108197910191437','blade004@126.com','13911011935',NULL,'$2a$10$NBlPJuHWJf/eOqXZWLIiJef3Zoq1dP.j8xVm1h2QggECnSNGQF5im',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-10-29 09:39:25','2016-10-29 09:39:25',1),(17,'董珂','dongke','410105197812271611','18600860096@163.com','18600860096',NULL,'$2a$10$mdmFd9YmRG7n6On5t0hAn.H43CKV5cNgF9eYv/lSLwUarHBOosB.m',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-10-29 09:39:25','2016-10-29 09:39:25',1),(18,'张建新','zhangjianxin','511024197402160212','13501391585@163.com','13501391585',NULL,'$2a$10$vvqFAi8WKOPWKCpa.7K5Auh78pnILNNbKstSfUvkConiz6ffQSSB.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-10-29 09:39:25','2016-10-29 09:39:25',1),(19,'赵伶捷','zhaolinjie','320106198309271218','77279609@qq.com','18066051088',NULL,'$2a$10$uIZuJ0IpjYUC1oAWAaeReOh2/anCl37tmGM0GGduDejrSre1Mfqve',NULL,NULL,NULL,1,'2016-10-30 12:45:04','2016-10-30 12:45:04','162.105.169.42','162.105.169.42',1,1,'2016-10-29 09:39:26','2016-11-19 13:46:53',1),(20,'吕小彬','lvxiaobin','640102197108100011','13323502166@189.cn','13323502166',NULL,'$2a$10$dx1qzUTTwLjDpzb96ujVY.mbb1zs6eHN/QLFSe2Y8PyFy/qRF8KKG',NULL,NULL,NULL,1,'2016-10-29 09:47:26','2016-10-29 09:47:26','114.245.184.200','114.245.184.200',1,1,'2016-10-29 09:39:26','2016-10-29 09:47:26',1),(21,'王培','wwangpei','642124197908070017','13911180069@163.com','18101197598',NULL,'$2a$10$G2ULJib8AXuR4ipPRp2LTOwKUAP0jRTDIjD6Z79eijzU95FeDBb8y',NULL,NULL,NULL,1,'2016-10-29 09:46:42','2016-10-29 09:46:42','114.245.184.200','114.245.184.200',1,1,'2016-10-29 09:39:26','2016-11-19 13:46:48',1),(22,'杨占勇','yangzhanyong','110225196907290079','yzy1969@263.net','18901121969',NULL,'$2a$10$KDYWefiTKKeGSgff8.JoF.0XMVjTD9KNxqvkJzvR5EP.UKQgt9E7W',NULL,NULL,NULL,3,'2016-10-30 13:12:40','2016-10-29 09:45:56','114.245.184.200','114.245.184.200',1,1,'2016-10-29 09:39:26','2016-10-30 13:12:40',1),(23,'emba',NULL,NULL,'emba@bimba.pku.edu.cn','13388888888','','$2a$10$Y73GRqKoiwV2fW/3VCxbsuVaKPSErMLtoYEsegmooRIep0GKUItO6',NULL,NULL,NULL,10,'2016-11-19 11:20:44','2016-11-19 11:12:48','114.245.198.97','114.245.198.97',1,1,'2016-10-30 12:38:44','2016-11-19 11:20:44',2),(24,'包一民','baoyimin','330106197711060432','baobyeye@126.com','13805731980',NULL,'$2a$10$Amv.oBA9Cd58qmZDSVLCGOrAnPaGIZkfHn6bFF3fPUyrU0L/OWGGi',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 11:07:53','2016-11-19 11:07:53',1),(25,'曹迪','caodi','371327198409010018','401978901@qq.com','18910193558',NULL,'$2a$10$IypTRjz3q3txcBw94luejuJGRMZ1JGxNAE91JoRz6FT4.WzLJIJOe',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 11:07:53','2016-11-19 11:07:53',1),(26,'陈春光','chenchunguang','420983197610019578','chencg@qianbaoplus.com','13910003822',NULL,'$2a$10$CFllysxqimLKTlS5Hi4q1.3y06NxeCZXN8Ked5EOvwtoEDeJMCEn6',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 11:07:53','2016-11-19 11:07:53',1),(27,'陈大明','chendaming','429004198103054051','chendaming@listentech.com.cn','18916666020',NULL,'$2a$10$NZpPVh020MSGIdJwe0hEt.wouPnWX9PiRXREz7FbNrVh2lch.5g6e',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 11:07:54','2016-11-19 11:07:54',1),(28,'陈航','chenhang','340104196806011531','chenhang@bosssoft.com.cn','13905008909',NULL,'$2a$10$07vB7KdlcIN1dwAb6cRlYOZ7KrX6FDWnPZCqt6OWQcMIUxlcL8spm',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 11:07:54','2016-11-19 11:07:54',1),(29,'陈华东','chenhuadong','420704197208240876','chenhuadong.km@founder.com','13669762732',NULL,'$2a$10$Q.igD3i/oz9InsT166eyrexpk8T9lPLj/m6HMmyXeS35yykYU/xNm',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 11:07:54','2016-11-19 11:07:54',1),(30,'陈全斌','chenquanbin','510226197104224399','chenken1971@163.com','13996368999',NULL,'$2a$10$M7TZS60oqDLNDpF1/AICBOMLsaT9uUJDWO4BOBRVPhwywZ4othz8.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 11:07:54','2016-11-19 11:07:54',1),(31,'程刚涛','chenggangtao','379014197402115612','waterman74@163.com','13609047695',NULL,'$2a$10$.2LCvSbBlnkrLwNhXooz4.HQRfUBABKq8IPOanGeH616VnI4mSnRK',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:34','2016-11-19 13:46:34',1),(32,'崔洪霞','cuihongxia','210905197805231028','286463349@qq.com','18618180829',NULL,'$2a$10$yn23ZBztbWYpqPUS9mOHbOBNhzeIiWi4NcCffz1WUNqZDR9.iRZne',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:35','2016-11-19 13:46:35',1),(33,'代丽丽','dailili','371321198401157949','p2593@126.com','15901161620',NULL,'$2a$10$QrT1TJoGSnPEPAJTsFceGu1rwf3eIaAjpMH.PFEg/.u5IVYfU58Oy',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:35','2016-11-19 13:46:35',1),(34,'戴虹','daihong','650105197009102725','dhong@sec1999.com','13910064270',NULL,'$2a$10$aOu/rwy9ahOqpVZ.0kE7/e0mlGKkrf/dPQoQXVTkR3It1DF2nKrt.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:35','2016-11-19 13:46:35',1),(35,'邓露','denglu','51112819820621002X','1740294@qq.com','18612666060',NULL,'$2a$10$chakNKmjyeKRFuXVDRlLa.XlIl.uTcjfopL4LIcgc25q9lYrGfiwS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:35','2016-11-19 13:46:35',1),(36,'丁刚','dinggang','230506197303020413','dinggang@fengbaoheng.com','13911228018',NULL,'$2a$10$5Zk5Zr8/2LkfpCjxMd.cjucu8K27jDEycxl6oD56RaexZHI45sAWy',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:35','2016-11-19 13:46:35',1),(37,'樊亚静','fanyajing','610102198212043167','Joyce.fan@daigj.com','13811086379',NULL,'$2a$10$s6pKrnM5oqWAKp2YCjGigux7T0z2BMj/q0JfcWT1Ov0NgDZdaTdc2',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:35','2016-11-19 13:46:35',1),(38,'冯超','fengchao','360102198311196319','neo1119@163.com','13911698580',NULL,'$2a$10$eulEMran88GJ6GkDvHJlhOwQe4w1k.46dmppYMdaZAUxfoarN54lC',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:36','2016-11-19 13:46:36',1),(39,'高立','gaoli','110101197612192517','gaoli123@sina.com','13901016697',NULL,'$2a$10$MyFjuENT2Y6pOlm6Pv7BjuaMtHZofWP.xxlH2XL1cUWl7fJ5NSR5.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:36','2016-11-19 13:46:36',1),(40,'高瑞','gaorui','152524198210150015','1098860669@qq.com','18601222433',NULL,'$2a$10$kJckhQ11gAd2nsU8ASGYEeWY43ffbFww7Grui71DmlW/dXw/RVdk6',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:36','2016-11-19 13:46:36',1),(41,'顾燏鲁','guyulu','510213197603150513','147732025@qq.com','13910187259',NULL,'$2a$10$3gcWiWUA0HNsW.h5XKX4IOKSINlGG2086PHegnw0lsnhTHD.BW6By',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:36','2016-11-19 13:46:36',1),(42,'郭冰','guobing','370602198408131019','bing.guo@obsidia.com','18620373877',NULL,'$2a$10$f1ao.Zha1M6DboIsXTiKGu5J7hFe9hiNe3wgO8X2y6cX4yC0qww1O',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:36','2016-11-19 13:46:36',1),(43,'郭苏扬','guosuyang','230106198607213217','109199813@qq.com','13811631312',NULL,'$2a$10$3tvdQ7AVTO3BCwE9kTxFJehBhQHtC6.N1KWA5N2T0Zb/o62XUTrR6',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:37','2016-11-19 13:46:37',1),(44,'韩震','hanzhen','140302197608080910','forgetselfs@sina.com','13691559622',NULL,'$2a$10$3A8BU//nL1b8Eho.iIcOk.unI7YqDV0qxbp1SCto8J7Hhp2lHGLuy',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:37','2016-11-19 13:46:37',1),(45,'郝君','haojun','370705198707223540','haoyifei@hydfkj.com','13811622395',NULL,'$2a$10$YJ7cFe78Q2JGtF.JVLjU/.g.GmsjWxJMGZU9TO4fhvncTK8ftzjw6',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:37','2016-11-19 13:46:37',1),(46,'何宏文','hehongwen','130681198305263829','hehongwen1983@163.com','13811630905',NULL,'$2a$10$g7qK1ucqNEbJH24b4EAnNOwP2TxF4GeQFuLrQ2RoP.Jf3qv34zxs6',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:37','2016-11-19 13:46:37',1),(47,'贺涛','hetao','230104197207232331','hetao.zy@founder.com','18610183959',NULL,'$2a$10$POtxkZi.Tmkli/B3VfEO8ugyde8NIktZglCZWlQcMJ0pP6eXrS.ou',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:37','2016-11-19 13:46:37',1),(48,'赫言','heyan','210624197501150010','18600017600@qq.com','18600017600',NULL,'$2a$10$IHd6qf6ITLeUmyT9MLQmaOKcHXLrPah3pTDeMK95jeQDiMP9xCqCG',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:37','2016-11-19 13:46:37',1),(49,'胡捷','hujie','130802198105081444','302875246@qq.com','18611397259',NULL,'$2a$10$jEevIwt4z0fIG/cODSt2hOfVYFOYTfnu9pz9jzoqwJpcS3X254.em',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:37','2016-11-19 13:46:37',1),(50,'黄彬','huangbin','120104198308315119','yanbianbank@126.com','18622606258',NULL,'$2a$10$HiDulS0CbaSUVItuK2KvEeYeclEsa48pps3xPuM9zOPOgcO56PQfq',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:38','2016-11-19 13:46:38',1),(51,'黄翀','huangchong','230103197304255512','huangchong@wodecheche.com','13701369166',NULL,'$2a$10$iDrtkk4J6QLdqWQ3MA5h2OqERTdzR5P5WIOenX1MGQXyskRdsuBcS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:38','2016-11-19 13:46:38',1),(52,'黄海燕','huanghaiyan','330104196810111701','455180887@qq.com','13606610555',NULL,'$2a$10$p2WVuA6iqRh3oSps.WDuJu47XtNntYr0B1Eo/3cZ3dF4/BiQgyMJy',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:38','2016-11-19 13:46:38',1),(53,'黄立才','huanglicai','362101198110101032','hlc8668@163.com','18610357818',NULL,'$2a$10$.NdWP5vGYjLVWgFNLMhhUuOj7uF4x1J8MYxAX3jEJ.9iNmI4vq2AC',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:38','2016-11-19 13:46:38',1),(54,'黄其伟','huangqiwei','320321198402181836','110422208@qq.com','15335187999',NULL,'$2a$10$6hCV68ilACR9FhhWC/xf9OyVlQPPzt1cg7Zpl0sZ5DLh8NdY16uw6',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:38','2016-11-19 13:46:38',1),(55,'贾世光','jiashiguang','371121197802124210','jiashiguang@bonc.com.cn','18623396080',NULL,'$2a$10$aEGhff5tjFyO/lWHRlluP.yiAB7bWHyC5y1s9PM12vmno4XsoJr3q',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:38','2016-11-19 13:46:38',1),(56,'江冠华','jiangguanhua','360312198105172010','bonejiang@126.com','13812688004',NULL,'$2a$10$Uw29CeQiXiREFnasknXe5.35h5Fw5p5GxWU8WvUfgsDMKz.Fuo2hi',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:39','2016-11-19 13:46:39',1),(57,'亢迪','kangdi','410305198410300550','18610122033@163.com','18610122033',NULL,'$2a$10$rsIt3adgPD.fLubeRiyrcueugHTyP7kja8LLCKPwMPMrLA85hFvnK',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:39','2016-11-19 13:46:39',1),(58,'孔令博','konglingbo','372502197610072771','konglb@acewill.cn','18911882688',NULL,'$2a$10$lSyRjIDLxA4FbvGyWiT9Reo0auyH3hp2e32xsysfaQ9h0O0pbS9tO',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:39','2016-11-19 13:46:39',1),(59,'郎丽娜','langlina','130102197710142142','langlina@bjcsqq.com','13810288095',NULL,'$2a$10$rclmnuAHHUQbonSzIuiIzuCV5v9toOvUO7jcKYFgBaONkw3vG281i',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:39','2016-11-19 13:46:39',1),(60,'冷雨璇','lengyuxuan','510106197611291827','jewelleng@aliyun.com','18801295528',NULL,'$2a$10$6JNonDK854RjhBPm5ng.aOkqxaqgK6hsxWH9PuLYZjKIMt1chtoT2',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:39','2016-11-19 13:46:39',1),(61,'李辰','lichen','512922197309188699','lichencn@163.com','13884452855',NULL,'$2a$10$v2FEN8B33DtBGiwFJe2/COEdqZQANgHruUNn2VPUwKsbskVN6XtbG',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:39','2016-11-19 13:46:39',1),(62,'李冲','lichong','410105197012118459','sunref@126.com','13716877877',NULL,'$2a$10$BQsw.q.Hqh3F29cfxqE6fOEHnjpdJY4ULECOwfn166ns6mWewu9P.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:40','2016-11-19 13:46:40',1),(63,'李浩然','lihaoran','110108198705302235','lihaoran@csc.com.cn','13901182439',NULL,'$2a$10$r6l.8T3ElZhluoIU3FMmv.4L9Vf1zKtlrqUICRh4/vJW5dB8Zn8QK',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:40','2016-11-19 13:46:40',1),(64,'李红星','lihongxing','342101197403072230','lihongxingchina@163.com','13866109907',NULL,'$2a$10$73lydA57qGeQwse3l4hvae4ffVqWYZlMVXutSDO34pFZkDJcySj4.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:40','2016-11-19 13:46:40',1),(65,'李继伟','lijiwei','610104198003286114','164100558@qq.com','18611764949',NULL,'$2a$10$BLRpfCuHPVCmnzx0DcIM5eLsfR2/q566W5X3jINuyNuSOmBTCGhaC',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:40','2016-11-19 13:46:40',1),(66,'李文婷','liwenting','23010219871228322X','15710078128@163.com','13381177777',NULL,'$2a$10$PB55VDrhkZwoKXNmKzvya.CJ2S.RzH0iG6188v48YYdVUZf4Igos2',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:40','2016-11-19 13:46:40',1),(67,'李文贤','liwenxian','142329197803221928','68383306@qq.com','13910658871',NULL,'$2a$10$s0sEpE./t68uage2YuSeIuHXK62bhr3OZd8NMHWA1ilEFf7.27eqm',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:40','2016-11-19 13:46:40',1),(68,'李欣','lixin','330106197705150423','lixin@zj.icbc.com.cn','13858072267',NULL,'$2a$10$KuXuKNLA73Zr3BZOzZtqLOtCBlGluK4ZnOw8Jjgt2PxNro.wJz1dG',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:41','2016-11-19 13:46:41',1),(69,'李信翔','lixinxiang','310113198205192111','alienxxl@hotmail.com','13512199920',NULL,'$2a$10$I07t4ZYCkv0VbVzcbsvvl.CkmahTS/wMeUNpXcxyrBqHkvPzMasv6',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:41','2016-11-19 13:46:41',1),(70,'李延国','liyanguo','370721197507223277','lyg@pkuxrs.org','13501067089',NULL,'$2a$10$4KNfLae4f1599iaJ8KyBJe3lUPsKOdkumt97JjVAoXvTniUsMoh/q',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:41','2016-11-19 13:46:41',1),(71,'李燕','liyan','120107197606277821','liyan@lenovo.com','13801002176',NULL,'$2a$10$LqOt2p6kDm629hPZvAi81OOAZzksN3pjd5idd9/Jo5.lkcjBt.lTS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:41','2016-11-19 13:46:41',1),(72,'李钟伟','lizhongwei','310230197106207215','lee@shopex.cn','13901698602',NULL,'$2a$10$2ak9TJe0AhpZCvxfvISTQeZTgCed9OM2XZHIWSavefZIGUKZ4Yx1S',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:41','2016-11-19 13:46:41',1),(73,'林莉萍','linliping','110105197703065826','llin@hanguangbaihuo.com','13701273252',NULL,'$2a$10$jQKhjNp91etU41SnbcGoOuAAdejk9DixS5KCEk2ZXw4Nm0zOKGvKq',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:41','2016-11-19 13:46:41',1),(74,'林文','linwen','441581198109190317','linwen@p2phx.com','13692209618',NULL,'$2a$10$mu3wh42kvUcb/RYb5I/.R.rJV8KV0xCzoFBbfKVAeBc5uqTb1Nlsu',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:42','2016-11-19 13:46:42',1),(75,'刘畅','liuchang','110106197802194814','citibank1001@sina.com','13911512165',NULL,'$2a$10$x0eMMpEvwQXMs7uS6bafFe6t88DPKQCLG7/KWF8oaafoIyBjB6NMa',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:42','2016-11-19 13:46:42',1),(76,'刘海军','liuhaijun','231024197810160011','alex@ruica.com','13910012991',NULL,'$2a$10$8rSuRcoRbEboF3HMWjAjpOGxftgX0uO3qzLujVn3gbAY6MZ14W/Je',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:42','2016-11-19 13:46:42',1),(77,'刘思强','liusiqiang','370282198001053215','1410695665@qq.com','13361591160',NULL,'$2a$10$5c3rufRvUizo2vTRMNZpTucOT1ikBEl2mF6T173xISf3p/Njpsoyu',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:42','2016-11-19 13:46:42',1),(78,'刘娓娜','liuweina','622224198408010022','lawyerwinnie@126.com','13810279909',NULL,'$2a$10$6ODkW0pDEmSB1xoiOrJybu7JQQ1O4mTHgzrGIRgmqagiObDhTG8ju',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:42','2016-11-19 13:46:42',1),(79,'刘扬','liuyang','410102197408302544','syy7408@163.com','13910090615',NULL,'$2a$10$C8zzGVSx73udGLJD4zCBOOl3EhOUsNIX.dXjPSbmTZUTgtiKOXgha',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:42','2016-11-19 13:46:42',1),(80,'刘洋','liuyang','320322197801288632','18801888986@163.com','18801188986',NULL,'$2a$10$JvzI6Mwtjipd2IKh/EpWouLqt4i60aftklPwXuUYsWwIp9q1spgne',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:43','2016-11-19 13:46:43',1),(81,'刘志彬','liuzhibin','61252519740822131X','Erwin@cein.cc','18688705719',NULL,'$2a$10$qCk8dHC8dwZDp1H8bnYEJutGOBeCb2iJVa2l5kW6HknU.60F8aQXO',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:43','2016-11-19 13:46:43',1),(82,'刘梓航','liuzihang','110102197906260091','liu.zihang@outlook.com','13801389394',NULL,'$2a$10$Rto.oUTJpoz/LZHFUu4nYOqiwcXm/qWEQNengC90RFwzxagd2B5wm',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:43','2016-11-19 13:46:43',1),(83,'陆大昕','ludaxin','320102197206222819','eric.lu@app-hk.com','13801962767',NULL,'$2a$10$FwX0EYXjP5bC3GrhmpNHrehQhq6AqpzI3VJRHM0l4.Uv7UUuh793G',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:43','2016-11-19 13:46:43',1),(84,'陆元铸(陆凯）','luyuanzhu','3702811982060  30000','lk777@139.com','13911137773',NULL,'$2a$10$kNvbpAnVnfbbDE0E07Vz0udZSmKHZ1i70itMTD0W6dnHo.ISjBc1y',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:43','2016-11-19 13:46:43',1),(85,'吕罡','lvgang','520103198105203211','polarlv@163.com','18601690520',NULL,'$2a$10$e1vp12rlw0eLqkIF/h/83u1lZF2.bwRQ8TmymcUTggXiWjLAM58w2',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:43','2016-11-19 13:46:43',1),(86,'马必中','mabizhong','430103197211091077','bz6543@126.com','18611717510',NULL,'$2a$10$oaG5qcyl8iJoudDXOK91AuH5964Bcsq3tWY6M3AOep9YrvCZGDxoG',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:44','2016-11-19 13:46:44',1),(87,'马莉','mali','44040019640930452X','13326633699@163.com','13326633699',NULL,'$2a$10$c4In2VYaVUUCSBe4azn2f.uUeGbC26lmKNnno8JhcfmU6HIdTClZC',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:44','2016-11-19 13:46:44',1),(88,'孟雪','mengxue','372301198301070067','mengxue@zhongzhi.com.cn','15811262705',NULL,'$2a$10$eQGOPE1.Rq6Y8doZikg.3uzO3ULxeEEUDKmscMAblbK0k6WRJjvHe',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:44','2016-11-19 13:46:44',1),(89,'慕雷','mulei','230105197303100538','alexking521@sina.cn','13601120835',NULL,'$2a$10$1deNe57N2nJcRK.hn4Y21.ehNPV9Bcqv.oqGutIWFnSIYe/F3odhK',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:44','2016-11-19 13:46:44',1),(90,'宁阳春','ningyangchun','220104198402191822','ningyangchun@edu-gee.com','13681035378',NULL,'$2a$10$vYF/Y5xoJl6EJY.FcCNLeuXjuHnZRdkPZXJ0WH3Tc4.OGatqLfnN.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:44','2016-11-19 13:46:44',1),(91,'潘艺琼','panyiqiong','420107197802080023','52749290@qq.com','13910510270',NULL,'$2a$10$XWpedd1Fq0YmG9Buegx6R.Ivqcbq.GHNiAg3TWYsbazAhRo8EolZq',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:45','2016-11-19 13:46:45',1),(92,'戚震男','qizhengnan','440104197507204710','qizhennan@cfldcn.com','18022880589',NULL,'$2a$10$8c1XkiIVOzo0yjQdTitLlelldjpueN5L/AYESaJiBFUnvdtQM1j02',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:45','2016-11-19 13:46:45',1),(93,'钱嗣维','qiansiwei','320922198305079011','qsw@airmed.cn','13689266999',NULL,'$2a$10$KGB181nEF3/vcsfhW7HWQufBdxcamJS8gTUJH.myTd/mbuxDqe4.u',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:45','2016-11-19 13:46:45',1),(94,'乔华','qiaohua','21092119790217001X','qiaohua2008@sina.com','13661094909',NULL,'$2a$10$zGuwt/fCyka3HqPF2L9y9OJGfxxKSUBFXTzb5TPlNLgo4vqVdUT7G',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:45','2016-11-19 13:46:45',1),(95,'秦锴','qinkai','140402198301110839','75809220@qq.com','15835155342',NULL,'$2a$10$J3peUbB3ZQjsnvE4B.KGcuUB0sj1kFJkGRiNTOe7xwZ33jwx8Kzn.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:45','2016-11-19 13:46:45',1),(96,'屈鹏涛','qupengtao','411223196904257539','tonyqu@megas.net.cn','13901234439',NULL,'$2a$10$JTpztu/GPokQ0S1QRScQvOueb5FYwyz1lyg7ZukSyuB6q7RpW5y6e',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:45','2016-11-19 13:46:45',1),(97,'饶海清','raohaiqing','440222197404082237','406872346@qq.com','13825551580',NULL,'$2a$10$GoOw8odMlMaRWendBZwZNum3LpjFZaoRn22qinFKNTY/jIgxsWoEm',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:46','2016-11-19 13:46:46',1),(98,'佘桥','sheqiao','42230119821030001X','sheqiao@hotmail.com','18611385764',NULL,'$2a$10$jifv2UEipWPJ7uFNof2M2e8IYD4xrkMEeuSMEQhIWpKd6IuRp74EK',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:46','2016-11-19 13:46:46',1),(99,'盛晓波','shengxiaobo','320421197808122917','470909@qq.com','13701758868',NULL,'$2a$10$Vh0XjUNcEK85Hgaci1/fZ.A3vdrqwzBn9N3RFIjFPKIGn4T1vJrgG',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:46','2016-11-19 13:46:46',1),(100,'盛雪玲','shengxueling','622225198405021822','shengxl@yonyou.com','13720028490',NULL,'$2a$10$ekaCpclYELgXxyZHYthWaOeKtLH/b8.Z2DKCBz19xkd/OF7V0.W5a',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:46','2016-11-19 13:46:46',1),(101,'史立斌','shilibin','32042219670803011X','slb0803@163.com','13809029999',NULL,'$2a$10$IQBD7nsQBLMzv5LXaljtueqtB8rhB5I0cYMkwrM1z6XelihIyL3n.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:46','2016-11-19 13:46:46',1),(102,'舒青','shuqing','420400197602173884','992432013@qq.com','18612718886',NULL,'$2a$10$PPrORPc/bv/KVoP0UMvaDeNmmFpzxS9dMx23ryfQZ/HUt8dl2n1aa',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:46','2016-11-19 13:46:46',1),(103,'孙延国','sunyanguo','23070419700906101X','sunyanguo2009@163.com','13241442868',NULL,'$2a$10$MN3Br2geUm.sZEAAzXIfve196gqw7Bh6ibGiwmG2my1SkmWfH2FqW',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:47','2016-11-19 13:46:47',1),(104,'孙振华','sunzhenghua','230505198412310071','410768888@qq.com','18606313333',NULL,'$2a$10$Z2R7dNTVUlM61/OZQVBVVuRzURg7xJFANWpehydEEmOuJ1mYIQqI.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:47','2016-11-19 13:46:47',1),(105,'滕军勇','tengjunyong','370685198001316012','tjyong2005@163.com','13520487531',NULL,'$2a$10$/rboP5K06q/pjTer6.XfUexALMlhkdp0C2r71shmDSkrRq/EmNPEm',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:47','2016-11-19 13:46:47',1),(106,'田卫国','tianweiguo','410322197301082832','weiguo.tian@nature-cn.com','13928242101',NULL,'$2a$10$rMuWkr/UMGZCjjFJXRL/BO4u90CxPd01EhJQ7ZorvEMElshXYfZy2',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:47','2016-11-19 13:46:47',1),(107,'万理','wangli','420300197601122510','904171227@qq.com','18613886222',NULL,'$2a$10$FocPcCPgWccYYiKpO0Ultuo0q0GSYx2jczkKABc8biiGAHiDZ8tQO',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:47','2016-11-19 13:46:47',1),(108,'汪兰英','wanglanying','330182197705280048','duubwly@163.com','13910910387',NULL,'$2a$10$fbT8sAYxzR7PdFD1NKLt5.5dAkrFYA9wQN7ASaMmG2.8V/5NzKloK',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:47','2016-11-19 13:46:47',1),(109,'王怀州','wanghuazhou','150204198004250011','guru@live.cn','13269523456',NULL,'$2a$10$nXWhbnsOacvvS1R/HrJPYeCjER0NmHeIkLc3yZkiSRYaP86if2.6u',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:47','2016-11-19 13:46:47',1),(110,'王克越','wangkeyue','370624197901070030','wky332@126.com','13811790300',NULL,'$2a$10$AzooMQ.pGLpWNf326TzTGutwevRWULGMPsprvtYv6w9YVnCxLAaYi',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:48','2016-11-19 13:46:48',1),(111,'王露影','wangluying','133022197501310026','lu13901388736@126.com','13901388736',NULL,'$2a$10$9HfZVuebPrw3FF5p6KG2S.ZNSPmDor4T/G98frCUWTP4eBkPttCby',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:48','2016-11-19 13:46:48',1),(112,'王明利','wangmingli','230108198310151011','wmlmingtian@126.com','13910295821',NULL,'$2a$10$Jzo4MDMw9btqT.3L5ORTY.gH.146RaNnbclYO1T0Ehcw8dCcBsmsq',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:48','2016-11-19 13:46:48',1),(113,'王平','wangping','130202198309150015','wangtic@163.com','13810086470',NULL,'$2a$10$8BIy.U8XLaNQ34XN/yh2F.2O6Q0xnj6SuyVv6v0MeGTWPMkUtxWai',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:48','2016-11-19 13:46:48',1),(114,'王少华','wangshaohua','620105197112111026','9978683@qq.com','13901192305',NULL,'$2a$10$abafmizvMNif6xkSaTiJp.7faFhJrqgORXSc99KAGFE5WQQL0zWoa',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:48','2016-11-19 13:46:48',1),(115,'王文强','wangwenqiang','130425198406121019','13601182831@126.com','13601182831',NULL,'$2a$10$AaZgeJ4DSvNSqdL4JikhCeST/J3AvKOviPxuih3DglLAh5CzlaTUq',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:49','2016-11-19 13:46:49',1),(116,'王西彪','wangxibiao','372924197409204816','13953101499@163.com','13953101499',NULL,'$2a$10$rnLGP4ZDWoa/TiJJ4C8EZe8jRJE.5mh.CCHzcYJF9rjTXALFW6v7y',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:49','2016-11-19 13:46:49',1),(117,'王延春','wangyanchun','610602197001080024','yanchunwang@caijing.com.cn','18910151176',NULL,'$2a$10$IkGhynuNTT5hls0BST5eaOE/Wtvz9fCZMI/uZ6HFnmcHdz.0cOety',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:49','2016-11-19 13:46:49',1),(118,'王勇','wangrong','622223197609120016','wangyong@longfor.com','18866652223',NULL,'$2a$10$CP00gkeNcKVUv9ZTTIc6ouYQ2Vh34mJLXxTB3Q0ujC9sjR78/gpcS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:49','2016-11-19 13:46:49',1),(119,'王宇新','wangyuxin','130802197504100812','wangyx1975@vip.sina.com','13911884992',NULL,'$2a$10$Lj5Sa5tdsEepgSYXKcPRzefsbE2UF6/JXk2BF81/kXskkCGPxyx3u',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:49','2016-11-19 13:46:49',1),(120,'王悦梅','wangyuemei','519004197112133920','18601145677@163.com','18601145677',NULL,'$2a$10$JYfcP6Bz2JUL/1a7SjNwueVcjZ77JHVP7u2Qmv516fIhQaWpE5br2',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:49','2016-11-19 13:46:49',1),(121,'魏思宇','weisiyu','110105198402174177','191802338@qq.com','13488709390',NULL,'$2a$10$gU8u6YcgGrcaGvKVFUQ.Au68t7SX8Lh30.1s/y5TpDG/BRlx2GbGi',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:50','2016-11-19 13:46:50',1),(122,'吴鹏翎','wupengling','350322197208072553','wupengling@jiuqi.com.cn','13810503142',NULL,'$2a$10$btP9qoQrwkr6KWyt697PDutfS4xZPOEnXtSHxFNfbqV3OHE2gMomS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:50','2016-11-19 13:46:50',1),(123,'吴晓武','wuxiaowu','36010319760831001X','william_w01@hotmail.com','15903110808',NULL,'$2a$10$Uog7FW5jWeoOgD.xcmA2Le4gKmN9nBL7DCbI1B1oJ.saiVmhIga1K',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:50','2016-11-19 13:46:50',1),(124,'谢贵全','xieguiquan','510231196801151718','xgq_8888@163.com','13908367316',NULL,'$2a$10$aUs/bMGyamtYjb.R64TWguuWqUuncACD0WEwS.NKzeyWKST2H2EUG',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:50','2016-11-19 13:46:50',1),(125,'闫硕','yanshuo','110105198603150016','373177930@qq.com','13811413103',NULL,'$2a$10$Wkz2QioXZllmHKK/e/CGyub65OxMLeZsx39YQU.2rCnJaC5nNDb7K',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:50','2016-11-19 13:46:50',1),(126,'杨浚治','yangjunzhi','620502197902032050','danieluibe@126.com','18801089885',NULL,'$2a$10$Gv47ey2ZHvK1HMy2C./wL.KjmmVwR1AiquQ0jC3yjJyO5MZmKrRE2',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:50','2016-11-19 13:46:50',1),(127,'杨照','yangzhao','370611197212131537','ytyangzhao@126.com','13611092266',NULL,'$2a$10$kssAv35iOwdp4pECZVGG6uCgGhQi1evvFVHhd3CZU7sGs6ZkHx.kC',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:50','2016-11-19 13:46:50',1),(128,'姚智宇','yaozhiyu','510231197401065436','aaronyao@mentholatum.com.cn','13501216262',NULL,'$2a$10$z1xmjEPQw5uwb0QcQXJ.n.hc8uFssDqvVGHcl6J6aL8wzc2mRxbUK',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:51','2016-11-19 13:46:51',1),(129,'伊明','yiming','110108197812300716','yiming1@chinaunicom.cn','15611029100',NULL,'$2a$10$e1dbFInserN5KJgIiUUOK.U3pS7xW/gy7dgrjEnN.RtBsKBMEkeCi',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:51','2016-11-19 13:46:51',1),(130,'于福栋','yufudong','232330197103020014','aolidaYU@163.com','18645585555',NULL,'$2a$10$DCSiDDQAqamCDxqVuSeAGOhB8xaC5iz1ka9M8CCNNz.CTjfqhXotW',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:51','2016-11-19 13:46:51',1),(131,'余斌','yubin','510214197705050413','142982@qq.com','18684697755',NULL,'$2a$10$gg.6LrjD3F2cbbEAejt/Cu3wlEuUMOsTVQRyLtugtV5IA9AIcLAf.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:51','2016-11-19 13:46:51',1),(132,'张春梅','zhangchunmei','372431097806070045','zhangchunmei2@cmbc.com.cn','13521377717',NULL,'$2a$10$X4dZNohfDJxa4tO9sVo7BuRaBQ36CNnCjK35bBQ0VEbIpE9jVecea',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:51','2016-11-19 13:46:51',1),(133,'张虎成','zhanghucheng','420323198112140012','36446332@qq.com','13717881418',NULL,'$2a$10$jK/egW8fKNqjGNHs2OkwqOJc.kklB8ejnw5GAoGEpPU/cTqD4bvNS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:51','2016-11-19 13:46:51',1),(134,'张海霞','zhanghaixia','130133198202012447','zhanghaixia@ee-design.com.cn','15801544805',NULL,'$2a$10$9zxnBx5iVCO5InqfqfweqO9WLw2Qzd0sri/YGqrBtMZ3Tobv01jzu',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:52','2016-11-19 13:46:52',1),(135,'张嘹原','zhangliaoyuan','410423197105092058','1678095648@qq.com','13241888007',NULL,'$2a$10$BY4tPvTsAjOa9TBRwyCOye03l5xZE6kCgmBNQZmCXhDpMjW7ip5jO',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:52','2016-11-19 13:46:52',1),(136,'张琦','zhangqi','330102197407150913','sqz5259@163.com','18602563535',NULL,'$2a$10$xUbVFqEnNnMZ1bOMFT6UUeyEGb6ysLgsjQv3FKrz4NtfA0hNTY0FS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:52','2016-11-19 13:46:52',1),(137,'张啸','zhangxiao','110101197804051014','zhangxiao7845@hotmail.com','13701137958',NULL,'$2a$10$s3AtHUpaHamstCsNXkznG.8vGwE/uplUy2J0wWc6MzmGe5QOp37dS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:52','2016-11-19 13:46:52',1),(138,'张应旺','zhangyingwang','350783198112024011','768685521@qq.com','18650377577',NULL,'$2a$10$WgZZfZTF1QPPO9YCUdsb5uEBROZsSMyRNPzcduvATvf8P.5TIqMi6',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:52','2016-11-19 13:46:52',1),(139,'张勇','zhangyong','210702197904011215','1051967456@qq.com','13718224455',NULL,'$2a$10$AWXYcHtNMps2n.ZXA2A6RefoS/viqeEQmXGqVW5gFzZyfuJg5R902',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:52','2016-11-19 13:46:52',1),(140,'赵海男','zhaohainan','130703196901250976','zhaohn@safewall.com.cn','13601366727',NULL,'$2a$10$w.63juQ5cRxWB884FKv8R..VO17auaXnteTO6ebu/3UmbYVTMJij6',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:53','2016-11-19 13:46:53',1),(141,'赵霖','zhaolin','370102197604182516','285819981@qq.com','13911532516',NULL,'$2a$10$P/buPSlpmFI.aMabNc90GOefpPYsAFo6QBBqIYGYSBW2xD1M7c5Hi',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:53','2016-11-19 13:46:53',1),(142,'赵苏娅','zhaosuya','140402198003151624','zsy29@sina.com','13811457195',NULL,'$2a$10$Gv0g0HgUkUNE1Y.RryC95uKSZvKt/Lx4EfTFYZ9cIyR4A7WlwwG3i',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:53','2016-11-19 13:46:53',1),(143,'周厦','zhouxia','320311198512274619','zx2299@foxmil.com','18652211034',NULL,'$2a$10$HHME8AZLtaDgHAfnvBC5SOwpJRfVCLhzreq3xqPw46ww3Q35nBKjC',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:53','2016-11-19 13:46:53',1),(144,'周有','zhouyou','130103196402072113','zhouyou5000@sina.com','13911086468',NULL,'$2a$10$AyBmqtEug3ZUPqAyKWkUYu0TNOAX7BqQD2vSFLB7jLjGKwZ8oZzrq',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:53','2016-11-19 13:46:53',1),(145,'周洲','zhouzhou','340204197604240328','zhou.zhou@yeepay.com','13911778006',NULL,'$2a$10$iWs1Q30t8bPqqQna35uAC.9zB46u93EapwmsqTa2oRE4Av9IktmUW',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:54','2016-11-19 13:46:54',1),(146,'朱文勇','zhuwenyong','420621198202012712','13811770772@139.com','13811770772',NULL,'$2a$10$npt6cyN0yKgj.srv/Ay9bu7/P0eRhu1S2SzIBFKIvkZQJUhIhHB6S',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:54','2016-11-19 13:46:54',1),(147,'宗玉杰','zongyujie','372925198005010741','zongyujie@stateunion.net','13910525881',NULL,'$2a$10$kQWeMp2dxN4UckHZMztIFe3XWDPI1eisqgl7bOMiOmQDaG3nAoJsW',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:54','2016-11-19 13:46:54',1),(148,'邹优锐','zouyourui','450103198410220511','13152501181@163.com','13152501181',NULL,'$2a$10$0TueZ0fVpdwH4BNPi70tXOXFgaA06.jlJ8cpxQ3tDUx2imbLlj07O',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'2016-11-19 13:46:54','2016-11-19 13:46:54',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `written_applies`
--

DROP TABLE IF EXISTS `written_applies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `written_applies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL COMMENT '学生ID',
  `apply_set_id` int(11) DEFAULT NULL COMMENT '申请ID',
  `name` varchar(255) DEFAULT NULL COMMENT '学生名字',
  `cat_no` varchar(255) DEFAULT NULL COMMENT '车号',
  `status` int(11) DEFAULT '0' COMMENT '学生申请状态',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `written_applies`
--

LOCK TABLES `written_applies` WRITE;
/*!40000 ALTER TABLE `written_applies` DISABLE KEYS */;
INSERT INTO `written_applies` VALUES (1,1,1,NULL,'京N55E33',0,'2016-10-29 09:26:47','2016-10-29 09:26:47'),(2,22,2,NULL,'',0,'2016-10-29 09:46:21','2016-10-29 09:46:21'),(3,21,2,NULL,'京N34E33',0,'2016-10-29 09:47:03','2016-10-29 09:47:03'),(4,19,1,NULL,'',0,'2016-10-30 12:46:18','2016-10-30 12:46:18');
/*!40000 ALTER TABLE `written_applies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `written_scores`
--

DROP TABLE IF EXISTS `written_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `written_scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL COMMENT '学生ID',
  `student_class_id` int(11) DEFAULT NULL COMMENT '学生班级ID',
  `score` float DEFAULT NULL COMMENT '学生笔试成绩',
  `score_order` int(11) DEFAULT NULL COMMENT '学生笔试成绩排名',
  `score_comment` varchar(255) DEFAULT NULL COMMENT '学生笔试相关说明',
  `interview_at` datetime DEFAULT NULL COMMENT '学生笔试时间',
  `show_at` datetime DEFAULT NULL COMMENT '学生笔试成绩公布时间',
  `status` int(11) DEFAULT NULL COMMENT '学生笔试状态',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `written_scores`
--

LOCK TABLES `written_scores` WRITE;
/*!40000 ALTER TABLE `written_scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `written_scores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-19 21:54:03
