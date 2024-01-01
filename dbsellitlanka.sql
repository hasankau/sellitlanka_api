-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.21


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema newwave2
--

CREATE DATABASE IF NOT EXISTS newwave2;
USE newwave2;

--
-- Definition of table `ad_review`
--

DROP TABLE IF EXISTS `ad_review`;
CREATE TABLE `ad_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `advert_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ad_review_user1_idx` (`user_id`),
  KEY `fk_ad_review_advert1_idx` (`advert_id`),
  CONSTRAINT `fk_ad_review_advert1` FOREIGN KEY (`advert_id`) REFERENCES `advert` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ad_review_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ad_review`
--

/*!40000 ALTER TABLE `ad_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_review` ENABLE KEYS */;


--
-- Definition of table `ad_type`
--

DROP TABLE IF EXISTS `ad_type`;
CREATE TABLE `ad_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ad_type`
--

/*!40000 ALTER TABLE `ad_type` DISABLE KEYS */;
INSERT INTO `ad_type` (`id`,`type`,`price`,`status`) VALUES 
 (1,'Classified',0,1),
 (2,'Top',500,1);
/*!40000 ALTER TABLE `ad_type` ENABLE KEYS */;


--
-- Definition of table `advert`
--

DROP TABLE IF EXISTS `advert`;
CREATE TABLE `advert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `district_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `main_catagory_id` int(11) NOT NULL,
  `ad_type_id` int(11) NOT NULL,
  `sub_catagory_id` int(11) NOT NULL,
  `views` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `phone` int(10) DEFAULT NULL,
  `paid` tinyint(1) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_advert_district1_idx` (`district_id`),
  KEY `fk_advert_user1_idx` (`user_id`),
  KEY `fk_advert_main_catagory1_idx` (`main_catagory_id`),
  KEY `fk_advert_ad_type1_idx` (`ad_type_id`),
  KEY `fk_advert_sub_catagory1_idx` (`sub_catagory_id`),
  CONSTRAINT `fk_advert_ad_type1` FOREIGN KEY (`ad_type_id`) REFERENCES `ad_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_advert_district1` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_advert_main_catagory1` FOREIGN KEY (`main_catagory_id`) REFERENCES `main_catagory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_advert_sub_catagory1` FOREIGN KEY (`sub_catagory_id`) REFERENCES `sub_catagory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_advert_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `advert`
--

/*!40000 ALTER TABLE `advert` DISABLE KEYS */;
INSERT INTO `advert` (`id`,`title`,`content`,`date`,`district_id`,`user_id`,`main_catagory_id`,`ad_type_id`,`sub_catagory_id`,`views`,`status`,`price`,`image`,`phone`,`paid`,`email`) VALUES 
 (1,'Designer T-shirts','Designer T-shirts from Canada, Latest designs from popular brands.',NULL,1,2,1,2,3,NULL,1,3000,'a1.jpg',114874541,1,'abcholdings@gmail.com'),
 (2,'Latest saree designs from India','Latest Saree designs, high quality, imported from India.',NULL,5,2,2,1,1,NULL,1,8000,'022.jpg',11456884,0,'sareehousecolombo@gmail.com'),
 (29,'Sports shoes','Latest designs in sports shoes for sale',NULL,7,2,1,2,1,NULL,1,3000,'fashion7.jpg',2484514,1,'mas@gmail.com'),
 (38,'Mens sweaters','Seasonal themed seaters for sale',NULL,5,2,1,1,3,NULL,1,6000,'fashion4.jpg',225445,0,'mas@gmail.com'),
 (39,'qwert','',NULL,1,2,1,1,1,NULL,1,1234,NULL,115,0,'mmm'),
 (40,'sqlite 1','qwert',NULL,7,2,1,1,1,NULL,1,1000,NULL,115,0,'mmm'),
 (41,'ter','ter',NULL,1,2,1,2,1,NULL,1,100,NULL,115,1,'mmm'),
 (42,'gg','fgg',NULL,1,2,1,2,1,NULL,1,100,NULL,145,1,'m'),
 (43,'tt','ttt',NULL,1,2,1,2,1,NULL,1,1000,NULL,11585,1,'mmmm'),
 (44,'gg','fg',NULL,1,2,1,2,1,NULL,0,1000,NULL,1253,0,'mm'),
 (45,'aa','aa',NULL,1,2,1,1,1,NULL,1,123,NULL,123,0,'mm'),
 (46,'aa','aa',NULL,1,2,1,1,1,NULL,1,123,NULL,123,0,'mm'),
 (47,'aa','aa',NULL,1,2,1,1,1,NULL,1,123,NULL,123,0,'mm'),
 (48,'aa','aa',NULL,5,2,1,1,1,NULL,1,123,NULL,123,0,'mm'),
 (49,'hhh','hhh',NULL,1,2,1,1,1,NULL,1,100,NULL,185,0,'mm'),
 (50,'ter','ter',NULL,1,2,1,1,1,NULL,1,123,NULL,45,0,'mm'),
 (51,'hh','hh',NULL,1,2,1,1,1,NULL,1,100,NULL,14,0,'mm'),
 (52,'jj','kk',NULL,1,2,1,1,1,NULL,1,100,NULL,154,0,'mm'),
 (53,'t','gg',NULL,1,2,1,1,1,NULL,1,122,NULL,134,0,'ee'),
 (54,'hh','j',NULL,1,2,1,1,1,NULL,1,123,NULL,258,0,'e'),
 (55,'kj','jh',NULL,1,2,1,1,1,NULL,1,2,NULL,1452,0,'e'),
 (56,'test','test',NULL,1,2,1,1,1,NULL,1,10,NULL,1656,0,'em'),
 (57,'test','test',NULL,1,2,1,1,1,NULL,1,10,NULL,1656,0,'em'),
 (58,'l','k',NULL,1,2,1,1,1,NULL,1,100,NULL,15,0,'m'),
 (59,'yy','yy',NULL,1,2,1,1,1,NULL,1,120,NULL,25,0,'m'),
 (60,'hh','g',NULL,1,2,1,1,1,NULL,1,1520,NULL,1,0,'m'),
 (61,'gn','th',NULL,1,2,1,1,1,NULL,1,23,NULL,12,0,'ge'),
 (62,'test1','test',NULL,1,2,1,1,1,NULL,1,1000,NULL,1845,0,'mm'),
 (63,'k','s',NULL,1,2,1,1,1,NULL,1,123,NULL,14256,0,'mm'),
 (64,'kk','dd',NULL,1,2,1,1,1,NULL,1,100,NULL,145,0,'mm'),
 (65,'kk','dd',NULL,1,2,1,1,1,NULL,1,100,NULL,145,0,'mm'),
 (66,'k','s',NULL,1,2,1,1,1,NULL,1,1222,NULL,456,0,'mm'),
 (67,'ks','f',NULL,1,2,1,1,1,NULL,1,1000,NULL,142536,0,'hbn'),
 (68,'jj','vv',NULL,1,2,1,1,1,NULL,1,1000,NULL,125,0,'mm'),
 (69,'h','g',NULL,1,2,1,1,1,NULL,1,23,NULL,14258,0,'ff'),
 (70,'new ad','adddd',NULL,1,2,1,1,1,NULL,1,1000,NULL,14578,0,'mm'),
 (71,'new ad','dd',NULL,1,2,1,1,1,NULL,1,1000,NULL,142586,0,'m');
/*!40000 ALTER TABLE `advert` ENABLE KEYS */;


--
-- Definition of table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_user1_idx` (`user_id`),
  CONSTRAINT `fk_cart_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;


--
-- Definition of table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items` (
  `cart_id` int(11) NOT NULL,
  `qty` double DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `ad_type_id` int(11) NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `fk_cart_has_Product_cart1_idx` (`cart_id`),
  KEY `fk_cart_items_ad_type1_idx` (`ad_type_id`),
  CONSTRAINT `fk_cart_has_Product_cart1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_items_ad_type1` FOREIGN KEY (`ad_type_id`) REFERENCES `ad_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart_items`
--

/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;


--
-- Definition of table `district`
--

DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `district` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `district`
--

/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` (`id`,`district`) VALUES 
 (1,'Ampara'),
 (2,'Anuradhpura'),
 (3,'Badulla'),
 (4,'Batticaloa'),
 (5,'Colombo'),
 (6,'Galle'),
 (7,'Gampaha'),
 (8,'Hambanthota'),
 (9,'Jaffna'),
 (10,'Kaluthara'),
 (11,'Kandy'),
 (12,'Kurunagala'),
 (13,'Mannar'),
 (14,'Matale'),
 (15,'Mathara'),
 (16,'Monaragala'),
 (17,'Mullaitivu'),
 (18,'Nuwara Eliya'),
 (19,'Polonnaruwa'),
 (20,'Puttalam'),
 (21,'Rathnapura');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;


--
-- Definition of table `interfaces`
--

DROP TABLE IF EXISTS `interfaces`;
CREATE TABLE `interfaces` (
  `id` int(11) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `interfaces`
--

/*!40000 ALTER TABLE `interfaces` DISABLE KEYS */;
/*!40000 ALTER TABLE `interfaces` ENABLE KEYS */;


--
-- Definition of table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `total` double DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_user1_idx` (`user_id`),
  CONSTRAINT `fk_invoice_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` (`id`,`date_time`,`total`,`user_id`) VALUES 
 (7,'2016-12-15 13:51:01',500,6),
 (8,'2016-12-15 15:11:52',1000,6),
 (9,'2016-12-16 10:00:52',1000,6),
 (10,'2016-12-16 16:18:43',500,6),
 (11,'2016-12-16 20:18:39',500,2),
 (12,'2016-12-17 21:41:14',500,6),
 (13,NULL,500,28);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;


--
-- Definition of table `invoice_has_advert`
--

DROP TABLE IF EXISTS `invoice_has_advert`;
CREATE TABLE `invoice_has_advert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `advert_id` int(11) NOT NULL,
  `price` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `adtype` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_has_advert_advert1_idx` (`advert_id`),
  KEY `fk_invoice_has_advert_invoice1_idx` (`invoice_id`),
  CONSTRAINT `fk_invoice_has_advert_advert1` FOREIGN KEY (`advert_id`) REFERENCES `advert` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoice_has_advert_invoice1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice_has_advert`
--

/*!40000 ALTER TABLE `invoice_has_advert` DISABLE KEYS */;
INSERT INTO `invoice_has_advert` (`id`,`invoice_id`,`advert_id`,`price`,`qty`,`adtype`) VALUES 
 (1,11,29,500,NULL,'Top'),
 (2,11,41,500,NULL,'Top'),
 (3,11,42,500,NULL,'Top'),
 (4,11,43,500,NULL,'Top');
/*!40000 ALTER TABLE `invoice_has_advert` ENABLE KEYS */;


--
-- Definition of table `login_session`
--

DROP TABLE IF EXISTS `login_session`;
CREATE TABLE `login_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_login_session_user1_idx` (`user_id`),
  CONSTRAINT `fk_login_session_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_session`
--

/*!40000 ALTER TABLE `login_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_session` ENABLE KEYS */;


--
-- Definition of table `main_catagory`
--

DROP TABLE IF EXISTS `main_catagory`;
CREATE TABLE `main_catagory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catagory` varchar(45) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `main_catagory`
--

/*!40000 ALTER TABLE `main_catagory` DISABLE KEYS */;
INSERT INTO `main_catagory` (`id`,`catagory`,`status`) VALUES 
 (1,'Fashion, Clothing and Accessories',1),
 (2,'Wedding and Functions',1),
 (8,'Vehicles',1),
 (9,'Properties',1),
 (10,'For Sale',1),
 (11,'Mobile Phones & Tablets',1),
 (12,'Electronics',1),
 (13,'Services',1),
 (14,'Classes',1),
 (15,'Machinery',1),
 (16,'Animals & Pets',1),
 (17,'Jobs',1),
 (18,'new Cate',0),
 (19,'Furniture',1),
 (20,'Agriculture & Farming',1),
 (21,'Medicine',0);
/*!40000 ALTER TABLE `main_catagory` ENABLE KEYS */;


--
-- Definition of table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(5000) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_message_user1_idx` (`user_id`),
  CONSTRAINT `fk_message_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `message`
--

/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;


--
-- Definition of table `page`
--

DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `contact_person` varchar(45) DEFAULT NULL,
  `tel` int(11) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `open_time` varchar(45) DEFAULT NULL,
  `closing_time` varchar(45) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `main_catagory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_page_user1_idx` (`user_id`),
  KEY `fk_page_main_catagory1_idx` (`main_catagory_id`),
  CONSTRAINT `fk_page_main_catagory1` FOREIGN KEY (`main_catagory_id`) REFERENCES `main_catagory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_page_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page`
--

/*!40000 ALTER TABLE `page` DISABLE KEYS */;
/*!40000 ALTER TABLE `page` ENABLE KEYS */;


--
-- Definition of table `sub_catagory`
--

DROP TABLE IF EXISTS `sub_catagory`;
CREATE TABLE `sub_catagory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catagory` varchar(45) DEFAULT NULL,
  `main_catagory_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sub_catagory_main_catagory1_idx` (`main_catagory_id`),
  CONSTRAINT `fk_sub_catagory_main_catagory1` FOREIGN KEY (`main_catagory_id`) REFERENCES `main_catagory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sub_catagory`
--

/*!40000 ALTER TABLE `sub_catagory` DISABLE KEYS */;
INSERT INTO `sub_catagory` (`id`,`catagory`,`main_catagory_id`,`status`) VALUES 
 (1,'Bridal dressing',2,1),
 (2,'Grooms Dressing',2,1),
 (3,'Mens clothing',1,1),
 (4,'Womens clothing',1,1),
 (5,'Watches',1,1),
 (6,'Higher Education',14,1),
 (7,'Overseas Education',14,1),
 (8,'Tutor',14,1),
 (9,'Counselling',14,1),
 (10,'Land',9,1),
 (11,'Car',8,1),
 (12,'Media',12,1),
 (13,'Security',17,1),
 (14,'Assistant',17,1),
 (15,'Kids Clothing',1,1),
 (16,'new sub cate',18,1),
 (17,'House Hold Items',12,1),
 (18,'Puppies',16,1),
 (19,'Kities',16,1),
 (20,'Private Tutions',14,1),
 (21,'House hold',19,1),
 (22,'Office Ware',19,1),
 (23,'Machines',20,1),
 (24,'Shoes',1,1);
/*!40000 ALTER TABLE `sub_catagory` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `security_code` varchar(5000) DEFAULT NULL,
  `user_type_id` int(11) DEFAULT NULL,
  `act_status` tinyint(1) DEFAULT NULL,
  `on_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_user_type1_idx` (`user_type_id`),
  CONSTRAINT `fk_user_user_type1` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`,`user_name`,`tel`,`password`,`email`,`security_code`,`user_type_id`,`act_status`,`on_status`) VALUES 
 (2,'kasuni','0771068220','321','kasunisithumini123@gmail.com','3fdf1db7241882ea',1,1,'0'),
 (3,'asela  perera',NULL,'123','aselaperera@gmail.com','3fc59e97f8e31fd4',3,1,NULL),
 (4,'John','0774061783','123','dcsoftzonetechnologies@gmail.com','3fb02ce9669b16b8',2,1,NULL),
 (5,'AS',NULL,'456','as@gmail.com','3fc34791e63af704',3,0,NULL),
 (6,'hasini','0714456596','654','hasini@gmail.com','3fcbafe52dd00634',3,1,NULL),
 (7,'limesha','846464666','321','limesha@gmail.com','3fe2c32ac62b8ccc',3,1,NULL),
 (8,'ashani',NULL,'123','ashani@gmail.com','3fee5b840ecff511',3,1,NULL),
 (9,'sa',NULL,'asd','sa@gmail.com',NULL,NULL,NULL,NULL),
 (10,'sa',NULL,'asd','sa',NULL,NULL,NULL,NULL),
 (11,'yogi',NULL,'asd','sa',NULL,NULL,NULL,NULL),
 (12,'yogi',NULL,'asd','sa',NULL,NULL,NULL,NULL),
 (13,'sa',NULL,'aa','sa@gmail.com',NULL,NULL,NULL,NULL),
 (14,'sa',NULL,'sa','same@gmail.com',NULL,NULL,NULL,NULL),
 (15,'sa',NULL,'sa','same@gmail.com',NULL,NULL,NULL,NULL),
 (16,'sa',NULL,'sa','same@gmail.com',NULL,NULL,NULL,NULL),
 (17,'sa',NULL,'sa','same@gmail.com',NULL,NULL,NULL,NULL),
 (18,'sa',NULL,'sa','samed@gmail.com',NULL,NULL,NULL,NULL),
 (19,'sa',NULL,'1','dsf',NULL,NULL,NULL,NULL),
 (20,'sah',NULL,'j','gg',NULL,NULL,NULL,NULL),
 (21,'some',NULL,'a','ss',NULL,NULL,NULL,NULL),
 (22,'sathya',NULL,'sa','sathyamail',NULL,NULL,NULL,NULL),
 (23,'sathyah',NULL,'sa','sathyamailj',NULL,NULL,NULL,NULL),
 (24,'dell',NULL,'as','de@gmailcom',NULL,NULL,NULL,NULL),
 (25,'dellss',NULL,'as','debut@gmailcom',NULL,NULL,NULL,NULL),
 (26,'demo',NULL,'pp','demo@gmail.com',NULL,NULL,NULL,NULL),
 (27,'lll',NULL,'123','lll',NULL,NULL,NULL,NULL),
 (28,'newuser',NULL,'123','newemail',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
CREATE TABLE `user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_type`
--

/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` (`id`,`type`,`status`) VALUES 
 (1,'Super Admin',NULL),
 (2,'Admin',NULL),
 (3,'User',NULL),
 (4,'gh',NULL);
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;


--
-- Definition of table `user_type_has_interfaces`
--

DROP TABLE IF EXISTS `user_type_has_interfaces`;
CREATE TABLE `user_type_has_interfaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) NOT NULL,
  `interfaces_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_type_has_interfaces_interfaces1_idx` (`interfaces_id`),
  KEY `fk_user_type_has_interfaces_user_type1_idx` (`user_type_id`),
  CONSTRAINT `fk_user_type_has_interfaces_interfaces1` FOREIGN KEY (`interfaces_id`) REFERENCES `interfaces` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_type_has_interfaces_user_type1` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_type_has_interfaces`
--

/*!40000 ALTER TABLE `user_type_has_interfaces` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_type_has_interfaces` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
