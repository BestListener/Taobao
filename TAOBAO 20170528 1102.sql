-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.16


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema taobao
--

CREATE DATABASE IF NOT EXISTS taobao;
USE taobao;

--
-- Definition of table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`id`,`name`,`password`) VALUES 
 (1,'admin','e10adc3949ba59abbe56e057f20f883e'),
 (2,'admin2','e10adc3949ba59abbe56e057f20f883e'),
 (3,'admin3','e10adc3949ba59abbe56e057f20f883e'),
 (4,'admin4','e10adc3949ba59abbe56e057f20f883e');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


--
-- Definition of table `p_attribute`
--

DROP TABLE IF EXISTS `p_attribute`;
CREATE TABLE `p_attribute` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(32) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `p_attribute`
--

/*!40000 ALTER TABLE `p_attribute` DISABLE KEYS */;
INSERT INTO `p_attribute` (`aid`,`aname`) VALUES 
 (1,'书名'),
 (2,'出版社名称'),
 (3,'出版时间'),
 (4,'作者'),
 (5,'开本'),
 (6,'美妆品牌'),
 (7,'规格类型'),
 (8,'月份'),
 (9,'适合肤质'),
 (10,'功效'),
 (11,'保质期'),
 (12,'产地'),
 (13,'手表品牌'),
 (14,'型号'),
 (15,'形状'),
 (16,'机芯类型'),
 (17,'风格'),
 (18,'品牌产地'),
 (19,'显示方式'),
 (20,'表带材质');
/*!40000 ALTER TABLE `p_attribute` ENABLE KEYS */;


--
-- Definition of table `p_detail_info`
--

DROP TABLE IF EXISTS `p_detail_info`;
CREATE TABLE `p_detail_info` (
  `paid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `val` varchar(80) NOT NULL,
  PRIMARY KEY (`paid`)
) ENGINE=InnoDB AUTO_INCREMENT=486 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `p_detail_info`
--

/*!40000 ALTER TABLE `p_detail_info` DISABLE KEYS */;
INSERT INTO `p_detail_info` (`paid`,`pid`,`aid`,`val`) VALUES 
 (25,5,13,'IK colouring/阿帕琦'),
 (26,5,14,'8699'),
 (27,5,15,'圆形'),
 (28,5,16,'石英机芯'),
 (29,5,17,'情侣表'),
 (30,5,18,'国内'),
 (31,5,19,'指针式'),
 (32,5,20,'合金'),
 (33,6,13,'IK colouring/阿帕琦'),
 (34,6,14,'Y421'),
 (35,6,15,'圆形'),
 (36,6,16,'机械机芯'),
 (37,6,17,'时尚潮流'),
 (38,6,18,'国内'),
 (39,6,19,'指针式'),
 (40,6,20,'精钢'),
 (41,7,13,'IK colouring/阿帕琦'),
 (42,7,14,'98226LD'),
 (43,7,15,'圆形'),
 (44,7,16,'自动机械机芯'),
 (45,7,17,'时尚潮流'),
 (46,7,18,'国内'),
 (47,7,19,'指针式'),
 (48,7,20,'不锈钢'),
 (49,8,1,'忠犬八公'),
 (50,8,2,'人民出版社'),
 (51,8,3,'2015.06.20'),
 (52,8,4,'李四'),
 (53,8,5,'4'),
 (54,9,1,'鲁宾逊漂游记'),
 (55,9,2,'人民出版社'),
 (56,9,3,'2017.03.12'),
 (57,9,4,'张三'),
 (58,9,5,'3'),
 (59,10,1,'地心游记'),
 (60,10,2,'人民出版社'),
 (61,10,3,'2016.04.20'),
 (62,10,4,'小红'),
 (63,10,5,'6'),
 (64,11,1,'海底两万里'),
 (65,11,2,'人民出版社'),
 (66,11,3,'2018.03.24'),
 (67,11,4,'小明'),
 (68,11,5,'7'),
 (69,12,6,'欧莱雅'),
 (70,12,7,'正常规格'),
 (71,12,8,'3月'),
 (72,12,9,'油性及混合性肤质'),
 (73,12,10,'深层清洁'),
 (74,12,11,'3年'),
 (75,12,12,'法国'),
 (76,13,6,'资生堂'),
 (77,13,7,'正常规格'),
 (78,13,8,'7月'),
 (79,13,9,'任何肤质'),
 (80,13,10,'补水 保湿 深层清洁'),
 (81,13,11,'3年'),
 (82,13,12,'泰国'),
 (83,14,1,'十万个为什么'),
 (84,14,2,'海豚出版社'),
 (85,14,3,'2016年9月'),
 (86,14,4,'嘉良传媒'),
 (87,14,5,'24开'),
 (88,15,1,'做诚实的自己'),
 (89,15,2,'北京教育出版社'),
 (90,15,3,'2016年5月'),
 (91,15,4,'无'),
 (92,15,5,'34开'),
 (93,16,1,'四大名著'),
 (94,16,2,'山东美术出版社'),
 (95,16,3,'2014年1月'),
 (96,16,4,'吴承恩 曹雪芹 罗贯中 施耐庵'),
 (97,16,5,'16开'),
 (98,17,1,'小王子英汉对照注释版'),
 (99,17,2,'星球地图出版社'),
 (100,17,3,'2017.03.17'),
 (101,17,4,'安东尼'),
 (102,17,5,'32开'),
 (103,18,1,'海底两万里'),
 (104,18,2,'中国文联出版社'),
 (105,18,3,'2011.08.21'),
 (106,18,4,'凡尔纳'),
 (107,18,5,'39开'),
 (108,19,1,'假如给我三天光明'),
 (109,19,2,'吉林出版集团'),
 (110,19,3,'2009年11月'),
 (111,19,4,'吉林出版集团'),
 (112,19,5,'16开'),
 (113,20,1,'你是人间的四月天'),
 (114,20,2,'江苏凤凰文艺出版社有限'),
 (115,20,3,'2015年7月'),
 (116,20,4,'林徽因'),
 (117,20,5,'48开'),
 (118,21,6,'资生堂'),
 (119,21,7,'正常规格'),
 (120,21,8,'5月'),
 (121,21,9,'任何肤质'),
 (122,21,10,'补水 保湿 提拉紧致'),
 (123,21,11,'3年'),
 (124,21,12,'日本'),
 (125,22,6,'PROYA/珀莱雅'),
 (126,22,7,'正常规格'),
 (127,22,8,'2月'),
 (128,22,9,'中性及干性肤质'),
 (129,22,10,'保湿 深层清洁 提亮肤色'),
 (130,22,11,'3年'),
 (131,22,12,'中国'),
 (132,23,6,'欧莱雅'),
 (133,23,7,'正常规格'),
 (134,23,8,'2月'),
 (135,23,9,'任何肤质'),
 (136,23,10,'补水 保湿'),
 (137,23,11,'3年'),
 (138,23,12,'中国'),
 (139,24,6,'欧莱雅'),
 (140,24,7,'正常规格'),
 (141,24,8,'9月'),
 (142,24,9,'任何肤质'),
 (143,24,10,'平衡水油 补水'),
 (144,24,11,'3年'),
 (145,24,12,'中国'),
 (146,25,6,'欧莱雅'),
 (147,25,7,'正常规格'),
 (148,25,8,'2月'),
 (149,25,9,'任何肤质'),
 (150,25,10,'保湿 收缩毛孔 提拉紧致'),
 (151,25,11,'3年'),
 (152,25,12,'中国'),
 (153,26,6,'资生堂'),
 (154,26,7,'正常规格'),
 (155,26,8,'6月'),
 (156,26,9,'油性及混合性肤质'),
 (157,26,10,'补水 保湿 控油 抗痘'),
 (158,26,11,'3年'),
 (159,26,12,'法国'),
 (160,27,6,'PROYA/珀莱雅'),
 (161,27,7,'正常规格'),
 (162,27,8,'1月'),
 (163,27,9,'任何肤质'),
 (164,27,10,'补水'),
 (165,27,11,'5年'),
 (166,27,12,'中国'),
 (167,28,6,'资生堂'),
 (168,28,7,'正常规格'),
 (169,28,8,'3月'),
 (170,28,9,'任何肤质'),
 (171,28,10,'补水 保湿 滋润'),
 (172,28,11,'3年'),
 (173,28,12,'中国'),
 (174,29,13,'BINGER/宾格'),
 (175,29,14,'888'),
 (176,29,15,'圆形'),
 (177,29,16,'石英机芯'),
 (178,29,17,'时尚潮流'),
 (179,29,18,'国内'),
 (180,29,19,'指针式'),
 (181,29,20,'真皮'),
 (182,30,13,'BINGER/宾格'),
 (183,30,14,'6754'),
 (184,30,15,'圆形'),
 (185,30,16,'石英机芯'),
 (186,30,17,'时尚潮流'),
 (187,30,18,'国内'),
 (188,30,19,'指针式'),
 (189,30,20,'帆布'),
 (190,31,13,'卡诗顿'),
 (191,31,14,'001'),
 (192,31,15,'圆形'),
 (193,31,16,'石英机芯'),
 (194,31,17,'运动'),
 (195,31,18,'国内'),
 (196,31,19,'指针式'),
 (197,31,20,'真皮'),
 (198,32,6,'PROYA/珀莱雅'),
 (199,32,7,'正常规格'),
 (200,32,8,'11月'),
 (201,32,9,'任何肤质'),
 (202,32,10,'补水 保湿'),
 (203,32,11,'3年'),
 (204,32,12,'中国'),
 (205,33,1,'小王子(精)'),
 (206,33,2,' 天津人民出版社'),
 (207,33,3,'2013年01月'),
 (208,33,4,'安托万？德？圣埃克苏佩里'),
 (209,33,5,'32开'),
 (210,34,13,'BINGER/宾格'),
 (211,34,14,'擎爱系列'),
 (212,34,15,'圆形'),
 (213,34,16,'机械机芯-自动机械机芯'),
 (214,34,17,'运动'),
 (215,34,18,'国内'),
 (216,34,19,'指针式'),
 (217,34,20,'精钢'),
 (218,35,13,'BINGER/宾格'),
 (219,35,14,' X9202'),
 (220,35,15,'圆形'),
 (221,35,16,'石英机芯'),
 (222,35,17,'时尚潮流'),
 (223,35,18,'国内'),
 (224,35,19,'指针式'),
 (225,35,20,'精钢'),
 (226,36,13,'Bestdon/邦顿'),
 (227,36,14,'mhsj528151'),
 (228,36,15,'圆形'),
 (229,36,16,'电子机芯'),
 (230,36,17,'时尚潮流'),
 (231,36,18,'国内'),
 (232,36,19,'LED灯光显示'),
 (233,36,20,'皮革'),
 (234,37,13,'Bestdon/邦顿'),
 (235,37,14,'119'),
 (236,37,15,'圆形'),
 (237,37,16,'电子机芯'),
 (238,37,17,'运动'),
 (239,37,18,'国内'),
 (240,37,19,'数字式'),
 (241,37,20,'橡胶'),
 (242,38,13,'卡诗顿'),
 (243,38,14,'K-BL008'),
 (244,38,15,'圆形'),
 (245,38,16,'石英机芯-太阳能机芯'),
 (246,38,17,'休闲'),
 (247,38,18,'国内'),
 (248,38,19,'指针式'),
 (249,38,20,'皮革'),
 (250,39,13,'卡诗顿'),
 (251,39,14,'K-903L'),
 (252,39,15,'圆形'),
 (253,39,16,'石英机芯-太阳能机芯'),
 (254,39,17,'休闲'),
 (255,39,18,'国内'),
 (256,39,19,'指针式'),
 (257,39,20,'真皮'),
 (258,40,6,'资生堂'),
 (259,40,7,'正常规格'),
 (260,40,8,'3月'),
 (261,40,9,'任何肤质'),
 (262,40,10,'补水 保湿 深层清洁'),
 (263,40,11,'3年'),
 (264,40,12,'中国'),
 (265,41,6,'资生堂'),
 (266,41,7,'正常规格'),
 (267,41,8,'2月'),
 (268,41,9,'任何肤质'),
 (269,41,10,'保湿补水 平衡水油'),
 (270,41,11,'3年'),
 (271,41,12,'中国'),
 (272,42,6,'资生堂'),
 (273,42,7,'正常规格'),
 (274,42,8,'5月'),
 (275,42,9,'任何肤质'),
 (276,42,10,'保湿补水 平衡水油,保湿'),
 (277,42,11,'30个月'),
 (278,42,12,'中国'),
 (279,43,6,'资生堂'),
 (280,43,7,'正常规格'),
 (281,43,8,'6月'),
 (282,43,9,'任何肤质'),
 (283,43,10,'保湿补水 平衡油脂、改善粉'),
 (284,43,11,'3年'),
 (285,43,12,'中国'),
 (286,44,6,'欧莱雅'),
 (287,44,7,'正常规格'),
 (288,44,8,'7月'),
 (289,44,9,'任何肤质'),
 (290,44,10,'补水 保湿 深层清洁'),
 (291,44,11,'3年'),
 (292,44,12,'中国'),
 (293,45,6,'PROYA/珀莱雅'),
 (294,45,7,'正常规格'),
 (295,45,8,'1月'),
 (296,45,9,'任何肤质'),
 (297,45,10,'补水 清洁'),
 (298,45,11,'5年'),
 (299,45,12,'日本'),
 (300,46,6,'PROYA/珀莱雅'),
 (301,46,7,'正常规格'),
 (302,46,8,'3月'),
 (303,46,9,'任何肤质'),
 (304,46,10,'补水 保湿 深层清洁'),
 (305,46,11,'3年'),
 (306,46,12,'中国'),
 (307,47,6,'欧莱雅'),
 (308,47,7,'正常规格'),
 (309,47,8,'5月'),
 (310,47,9,'任何肤质'),
 (311,47,10,'补水 保湿 深层清洁'),
 (312,47,11,'3年'),
 (313,47,12,'中国'),
 (314,48,6,'欧莱雅'),
 (315,48,7,'正常规格'),
 (316,48,8,'2月'),
 (317,48,9,'任何肤质'),
 (318,48,10,'补水 保湿'),
 (319,48,11,'3年'),
 (320,48,12,'中国'),
 (321,49,6,'欧莱雅'),
 (322,49,7,'正常规格'),
 (323,49,8,'3月'),
 (324,49,9,'任何肤质'),
 (325,49,10,'补水 保湿'),
 (326,49,11,'3年'),
 (327,49,12,'中国'),
 (328,50,6,'PROYA/珀莱雅'),
 (329,50,7,'正常规格'),
 (330,50,8,'5月'),
 (331,50,9,'任何肤质'),
 (332,50,10,'保湿 抗痘'),
 (333,50,11,'3年'),
 (334,50,12,'法国'),
 (335,51,6,'资生堂'),
 (336,51,7,'正常规格'),
 (337,51,8,'3月'),
 (338,51,9,'任何肤质'),
 (339,51,10,'深层清洁'),
 (340,51,11,'3年'),
 (341,51,12,'中国'),
 (342,52,13,'IK colouring/阿帕琦'),
 (343,52,14,'SQ3610'),
 (344,52,15,'圆形'),
 (345,52,16,'机械机芯-自动机械机芯'),
 (346,52,17,'运动'),
 (347,52,18,'国内'),
 (348,52,19,'指针式'),
 (349,52,20,'不锈钢'),
 (350,53,13,'Bestdon/邦顿'),
 (351,53,14,'海洋之星系列'),
 (352,53,15,'圆形'),
 (353,53,16,'机械机芯-自动机械机芯'),
 (354,53,17,'时尚潮流'),
 (355,53,18,'国内'),
 (356,53,19,'指针式'),
 (357,53,20,'精钢'),
 (358,54,13,'BINGER/宾格'),
 (359,54,14,'X-11罗马钢带'),
 (360,54,15,'圆形'),
 (361,54,16,'机械机芯-自动机械机芯'),
 (362,54,17,'时尚潮流'),
 (363,54,18,'国内'),
 (364,54,19,'指针式'),
 (365,54,20,'合金'),
 (366,55,13,'卡诗顿'),
 (367,55,14,'5612'),
 (368,55,15,'圆形'),
 (369,55,16,'石英机芯'),
 (370,55,17,'运动'),
 (371,55,18,'国内'),
 (372,55,19,'数字式'),
 (373,55,20,'橡胶'),
 (374,56,13,'卡诗顿'),
 (375,56,14,'8699'),
 (376,56,15,'圆形'),
 (377,56,16,'石英机芯'),
 (378,56,17,'运动'),
 (379,56,18,'国内'),
 (380,56,19,'指针式'),
 (381,56,20,'橡胶'),
 (382,57,13,'卡诗顿'),
 (383,57,14,'3099'),
 (384,57,15,'圆形'),
 (385,57,16,'石英机芯'),
 (386,57,17,'休闲'),
 (387,57,18,'国内'),
 (388,57,19,'指针式'),
 (389,57,20,'皮革'),
 (390,58,13,'BINGER/宾格'),
 (391,58,14,'1068'),
 (392,58,15,'圆形'),
 (393,58,16,'电子机芯'),
 (394,58,17,'运动'),
 (395,58,18,'国内'),
 (396,58,19,'数字式'),
 (397,58,20,'橡胶'),
 (398,59,13,'Bestdon/邦顿'),
 (399,59,14,'1206'),
 (400,59,15,'圆形'),
 (401,59,16,'电子机芯'),
 (402,59,17,'运动'),
 (403,59,18,'国内'),
 (404,59,19,'数字式'),
 (405,59,20,'橡胶'),
 (406,60,13,'BINGER/宾格'),
 (407,60,14,'Skmei1206'),
 (408,60,15,'圆形'),
 (409,60,16,'电子机芯'),
 (410,60,17,'运动'),
 (411,60,18,'国内'),
 (412,60,19,'数字式'),
 (413,60,20,'橡胶'),
 (414,61,13,'卡诗顿'),
 (415,61,14,' DZ-0827'),
 (416,61,15,'圆形'),
 (417,61,16,'石英机芯-太阳能机芯'),
 (418,61,17,'时尚潮流'),
 (419,61,18,'国内'),
 (420,61,19,'指针式'),
 (421,61,20,'皮革'),
 (422,62,13,'IK colouring/阿帕琦'),
 (423,62,14,'000'),
 (424,62,15,'圆形'),
 (425,62,16,'石英机芯-太阳能机芯'),
 (426,62,17,'时尚潮流'),
 (427,62,18,'国内'),
 (428,62,19,'指针式'),
 (429,62,20,'不锈钢'),
 (430,63,13,'IK colouring/阿帕琦'),
 (431,63,14,'A-1004'),
 (432,63,15,'圆形'),
 (433,63,16,'石英机芯'),
 (434,63,17,'运动'),
 (435,63,18,'国内'),
 (436,63,19,'指针式'),
 (437,63,20,'不锈钢'),
 (438,64,13,'BINGER/宾格'),
 (439,64,14,'1119'),
 (440,64,15,'圆形'),
 (441,64,16,'电子机芯'),
 (442,64,17,'运动'),
 (443,64,18,'国内'),
 (444,64,19,'LED数字显示'),
 (445,64,20,'橡胶'),
 (446,65,1,'从你的全世界路过'),
 (447,65,2,'湖南文艺出版社'),
 (448,65,3,'2013年11月'),
 (449,65,4,'张嘉佳'),
 (450,65,5,'32开'),
 (451,66,1,'遇见未知的自己'),
 (452,66,2,'湖南文艺出版社'),
 (453,66,3,'2016年4月'),
 (454,66,4,'张德芬'),
 (455,66,5,'32开'),
 (456,67,1,'苏菲的世界'),
 (457,67,2,'作家出版社'),
 (458,67,3,'2007年10月'),
 (459,67,4,'萧宝森'),
 (460,67,5,'32开'),
 (461,68,1,'你若安好'),
 (462,68,2,'中国经济出版社'),
 (463,68,3,' 2012年08月'),
 (464,68,4,'一路开花'),
 (465,68,5,'16开'),
 (466,69,1,'择天记'),
 (467,69,2,'吉林美术出版社'),
 (468,69,3,'2017.03.12'),
 (469,69,4,'无'),
 (470,69,5,'32开'),
 (471,70,1,'心'),
 (472,70,2,'陕西师范大学出版总社'),
 (473,70,3,'2013年8月'),
 (474,70,4,'夏目漱石'),
 (475,70,5,'24开'),
 (476,71,1,'麦田里的守望者'),
 (477,71,2,'译林出版社'),
 (478,71,3,'2014-10-01'),
 (479,71,4,'J.D.塞林格'),
 (480,71,5,'16开'),
 (481,72,1,'小王子(精)'),
 (482,72,2,'天津人民出版社'),
 (483,72,3,'2013年01月'),
 (484,72,4,'安托万？德？圣埃克苏佩里'),
 (485,72,5,'32开');
/*!40000 ALTER TABLE `p_detail_info` ENABLE KEYS */;


--
-- Definition of table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL,
  `bigImg` varchar(255) NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` float NOT NULL,
  `smallImg` varchar(255) NOT NULL,
  `infoImg` varchar(255) NOT NULL,
  `saveNum` int(11) NOT NULL,
  `salesAmount` int(11) NOT NULL DEFAULT '0',
  `goodsState` varchar(10) NOT NULL DEFAULT '正在售卖',
  `firstClass` varchar(32) NOT NULL,
  `secondClass` varchar(32) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`pid`,`sid`,`bigImg`,`name`,`price`,`smallImg`,`infoImg`,`saveNum`,`salesAmount`,`goodsState`,`firstClass`,`secondClass`) VALUES 
 (5,1,'uploadFile/product/TB2nZ8qbseJ.eBjy0FiXXXqapXa_!!16274288.jpg_400x400.jpg','蝴蝶表扣超薄手表男士防水日历钢带潮流石英',65.9,'uploadFile/product/TB2_oXkbreI.eBjSspkXXaXqVXa_!!16274288.jpg_400x400.jpg_.webp.jpg','uploadFile/product/TB2pyNkbr1K.eBjSsphXXcJOXXa_!!16274288.jpg',150,997,'正在售卖','手表','机械表'),
 (6,1,'uploadFile/product/T15MdvFSVcXXXXXXXX_!!0-item_pic.jpg_400x400.jpg','阿帕琦全自动机械表男表镂空精钢日历月份男',399,'uploadFile/product/T2bobeXgJbXXXXXXXX_!!60878056.jpg','uploadFile/product/TB2vdy1eVXXXXaKXpXXXXXXXXXX_!!60878056.jpg',100,642,'正在售卖','手表','机械表'),
 (7,1,'uploadFile/product/TB2dqyXj4dkpuFjy0FbXXaNnpXa_!!242986117.jpg_400x400.jpg','包邮阿帕奇钢带镂空全自动机械表大表盘男士',130,'uploadFile/product/TB2YKybj4XlpuFjSsphXXbJOXXa_!!242986117.jpg','uploadFile/product/T2cxIAXoBaXXXXXXXX_!!242986117.jpg',9555,6783,'正在售卖','手表','机械表'),
 (8,1,'uploadFile/product/【电悦台】Razihel & Xilent - Edge of the World (feat. Becko).jpg','忠犬八公特价',130,'uploadFile/product/0d798013632762d0bf9ba62da0ec08fa503dc614.jpg','uploadFile/product/00000.png',90,0,'正在售卖','书','文学'),
 (9,1,'uploadFile/product/QQ图片20151206165557.jpg','鲁滨逊漂游记',100,'uploadFile/product/QQ图片20151211224417.png','uploadFile/product/838ba61ea8d3fd1f61f41aed364e251f94ca5f63.jpg',45,0,'正在售卖','书','儿童文学'),
 (10,1,'uploadFile/product/QQ图片20151211225538.png','地心游记真皮封面',98,'uploadFile/product/QQ图片20151211230616.jpg','uploadFile/product/838ba61ea8d3fd1f61511aed364e251f94ca5f88.jpg',60,0,'正在售卖','书','文学'),
 (11,1,'uploadFile/product/QQ图片20151212192849.jpg','海底两万里300页完整剧情',124,'uploadFile/product/QQ图片20151211224154.jpg','uploadFile/product/QQ图片20151211233412.jpg',66,0,'正在售卖','书','畅销书'),
 (12,1,'uploadFile/product/TB2mU.GrVXXXXacXpXXXXXXXXXX_!!121794962.jpg','碧欧泉男士净肤细致洁颜膏/平衡洁面洗面奶',156,'uploadFile/product/TB2z7.zrVXXXXcmXpXXXXXXXXXX_!!121794962.jpg','uploadFile/product/TB2dnKTldFopuFjSZFHXXbSlXXa_!!121794962.jpg',49,0,'正在售卖','美妆','洁面'),
 (13,1,'uploadFile/product/TB24YrToYBkpuFjy1zkXXbSpFXa_!!2265752059.jpg','泰国正品代购BeautyBuffet Q',29.8,'uploadFile/product/TB2CEYSkXXXXXcAXXXXXXXXXXXX_!!2265752059.jpg','uploadFile/product/TB2DpwTfR8kpuFjSspeXXc7IpXa_!!2265752059.jpg',60539,0,'正在售卖','美妆','洁面'),
 (14,1,'uploadFile/product/TB1S3pFPFXXXXXjXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg','3-6岁十万个为什么幼儿版美绘注音全套',25.8,'uploadFile/product/TB2kKNDft0opuFjSZFxXXaDNVXa_!!2320163450.jpg_430x430q90.jpg','uploadFile/product/TB255yGql4lpuFjy1zjXXcAKpXa_!!2320163450.jpg',11358,24325,'正在售卖','书','儿童文学'),
 (15,1,'uploadFile/product/TB2rFIZfblmpuFjSZFlXXbdQXXa_!!376252794.png_430x430q90.jpg','做诚实的自己10册一年级小学生课外阅读书',34.8,'uploadFile/product/TB2.RupqbtlpuFjSspoXXbcDpXa_!!376252794.jpg_430x430q90.jpg','uploadFile/product/TB2UvqCod0opuFjSZFxXXaDNVXa_!!376252794.jpg',16799,0,'正在售卖','书','儿童文学'),
 (16,1,'uploadFile/product/TB1MfvIPVXXXXcBXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg','世界四大名著全套青少年版',29.8,'uploadFile/product/TB2iDBDblyN.eBjSZFIXXXbUVXa_!!2561076943.jpg_430x430q90.jpg','uploadFile/product/TB2BqGPebBmpuFjSZFuXXaG_XXa_!!2561076943.jpg',17964,0,'正在售卖','书','文学'),
 (17,1,'uploadFile/product/TB1f7gsIpXXXXbAaXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg','小王子中英文对照小说 ',19.8,'uploadFile/product/TB2KAqbhHplpuFjSspiXXcdfFXa_!!2944005848.jpg_430x430q90.jpg','uploadFile/product/TB2UE0JjhxmpuFjSZFNXXXrRXXa_!!2944005848.jpg',2067,5244,'正在售卖','书','小说'),
 (18,1,'uploadFile/product/TB1ZodePXXXXXaaXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg','海底两万里正版包邮 初中生必读',15.7,'uploadFile/product/TB2gywApG8lpuFjy0FpXXaGrpXa_!!2220483884.jpg_430x430q90.jpg','uploadFile/product/TB2sv6acl8kpuFjSspeXXc7IpXa_!!2220483884.jpg',1209,7643,'正在售卖','书','小说'),
 (19,1,'uploadFile/product/TB1bIIgRXXXXXc8aXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg','假如给我三天光明 老人与海 简爱 安妮日',27,'uploadFile/product/TB2HaAcfFXXXXXkXXXXXXXXXXXX_!!734892925.jpg_430x430q90.jpg','uploadFile/product/TB2pew7rFXXXXbcXpXXXXXXXXXX_!!1691322032.jpg',2567,4376,'正在售卖','书','小说'),
 (20,1,'uploadFile/product/TB1VCgLNXXXXXXhXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg','林徽因你是人间的四月天',36.8,'uploadFile/product/TB2ZvqVXmjz11Bjy0FnXXcnxXXa_!!1920694191.jpg_430x430q90.jpg','uploadFile/product/TB2exmVXj2C11BjSszgXXaKlpXa_!!1920694191.jpg',1189,0,'正在售卖','书','畅销书'),
 (21,1,'uploadFile/product/TB2d7XHoMxlpuFjSszbXXcSVpXa_!!75214933.jpg','资生堂洗面奶女男洗颜专科补水保湿深层清洁',35,'uploadFile/product/TB26htDl4xmpuFjSZFNXXXrRXXa_!!75214933.jpg','uploadFile/product/TB2qWfBdKtTMeFjSZFOXXaTiVXa_!!75214933.jpg',20,7318,'正在售卖','美妆','洁面'),
 (22,1,'uploadFile/product/TB2rqYJbrxmpuFjSZJiXXXauVXa_!!408485850.jpg','珀莱雅洗面奶女新柔皙洗颜霜温和泡沫洁面',31.5,'uploadFile/product/TB2bIPkaMJkpuFjSszcXXXfsFXa_!!408485850.jpg','uploadFile/product/TB2tl_3aYBnpuFjSZFGXXX51pXa_!!408485850.jpg',2488,0,'正在售卖','美妆','洁面'),
 (23,1,'uploadFile/product/T1QKpvXC8dXXXXXXXX_!!0-item_pic.jpg','正品欧莱雅八杯水系列净白淡斑面膜/美白保',65,'uploadFile/product/T2UAW.XXxbXXXXXXXX_!!351232931.jpg','uploadFile/product/T27orlXaNbXXXXXXXX_!!351232931.jpg',200,0,'正在售卖','美妆','面膜'),
 (24,1,'uploadFile/product/TB2cAeKi3JkpuFjSszcXXXfsFXa_!!103906753.jpg','欧莱雅男士炭爽净油保湿面膜',77,'uploadFile/product/TB2tJM8nAqvpuFjSZFhXXaOgXXa_!!103906753.jpg','uploadFile/product/TB25rHoiYXlpuFjy1zbXXb_qpXa_!!103906753.jpg',147,5635,'正在售卖','美妆','面膜'),
 (25,1,'uploadFile/product/TB27nK7mORnpuFjSZFCXXX2DXXa_!!68983792.jpg','俄罗斯代购新款欧莱雅面膜木炭成分粘土面膜',62,'uploadFile/product/TB2khuxmHBnpuFjSZFGXXX51pXa_!!68983792.jpg','uploadFile/product/TB1xRgsQpXXXXc7XXXXXXXXXXXX_!!0-item_pic.jpg',131,0,'正在售卖','美妆','面膜'),
 (26,1,'uploadFile/product/TB1hSmwNXXXXXXXaFXXXXXXXXXX_!!0-item_pic.jpg','米多药妆 理肤泉清痘净肤水油平衡乳液40',105,'uploadFile/product/TB25aCnoYXlpuFjy1zbXXb_qpXa_!!60541292.jpg','uploadFile/product/TB20ESPdipnpuFjSZFkXXc4ZpXa_!!60541292.jpg',144,0,'正在售卖','美妆','乳液'),
 (27,1,'uploadFile/product/TB2fsVXoFXXXXceXXXXXXXXXXXX_!!883630657.jpg','韩束芦荟修护凝胶180g男女祛痘',25,'uploadFile/product/TB2HeYldbBnpuFjSZFGXXX51pXa_!!883630657.jpg','uploadFile/product/TB2wWoOopXXXXcpXpXXXXXXXXXX_!!883630657.jpg',2967,0,'正在售卖','美妆','乳液'),
 (28,1,'uploadFile/product/TB2PI0XddBopuFjSZPcXXc9EpXa_!!54309019.jpg','安安补水霜38g 补水保湿面霜滋润乳液国',3.9,'uploadFile/product/TB2qS_icr8kpuFjy0FcXXaUhpXa_!!54309019.jpg','uploadFile/product/TB2ivdgdilnpuFjSZFgXXbi7FXa_!!54309019.jpg',30000,30254,'正在售卖','美妆','乳液'),
 (29,1,'uploadFile/product/TB2hMSNnpXXXXanXpXXXXXXXXXX_!!2348003298.jpg','男生手表男皮带时尚韩国版潮流潮男表男款中',23,'uploadFile/product/TB2nteDnpXXXXb4XpXXXXXXXXXX_!!2348003298.jpg','uploadFile/product/TB2EX7XgXXXXXazXXXXXXXXXXXX_!!2348003298.jpg',16500,14324,'正在售卖','手表','休闲表'),
 (30,3,'uploadFile/product/TB2.f06cmFmpuFjSZFrXXayOXXa_!!840786316.jpg','韩版简约潮流时尚休闲手表男女生学生情侣',17.9,'uploadFile/product/TB2TnJYcctnpuFjSZFKXXalFFXa_!!840786316.jpg','uploadFile/product/TB2f77Ki.lnpuFjSZFjXXXTaVXa_!!840786316.jpg',75345,30267,'正在售卖','手表','休闲表'),
 (31,3,'uploadFile/product/TB13DEZNVXXXXc4aXXXXXXXXXXX_!!0-item_pic.jpg','韩版男士运动时尚休闲皮带潮流机械石英表学',29.9,'uploadFile/product/TB2urT3aG9I.eBjy0FeXXXqwFXa_!!2375499162.jpg','uploadFile/product/TB2NLaJrctnpuFjSZFKXXalFFXa_!!2375499162.jpg',5729,25674,'正在售卖','手表','休闲表'),
 (32,3,'uploadFile/product/TB2kmZ.rhlmpuFjSZPfXXc9iXXa_!!2190994590.jpg','珀莱雅靓白肌密柔润洁面乳深层清洁收缩毛孔',58,'uploadFile/product/TB2TqnQcbtlpuFjSspoXXbcDpXa_!!2190994590.jpg','uploadFile/product/TB2IJran.lnpuFjSZFjXXXTaVXa_!!2190994590.jpg',485,55,'正在售卖','美妆','洁面'),
 (33,4,'uploadFile/product/TB1LnD8RXXXXXalaFXXXXXXXXXX_!!2-item_pic.png_430x430q90.jpg','【赠笔记本 马天宇推荐】小王子 精装 ',13.8,'uploadFile/product/TB2M3ZSspXXXXaTXXXXXXXXXXXX_!!859515618.jpg_430x430q90.jpg','uploadFile/product/TB26DjLlCXlpuFjy0FeXXcJbFXa_!!859515618.jpg',1214,1,'正在售卖','书','畅销书'),
 (34,5,'uploadFile/product/TB24VQdnXXXXXcmXXXXXXXXXXXX_!!776873819.jpg','BINGER宾格手表男士金色腕表全自动',398,'uploadFile/product/TB2axcXnXXXXXcWXXXXXXXXXXXX_!!776873819.jpg','uploadFile/product/TB28NPGnXXXXXajXFXXXXXXXXXX_!!776873819.jpg',119942,0,'正在售卖','手表','运动表'),
 (35,5,'uploadFile/product/TB2DtnuhpXXXXXZXXXXXXXXXXXX_!!684856831.jpg','BINGER宾格手表男正品军表运动防水',198,'uploadFile/product/TB2Mf2YaoWO.eBjSZPcXXbopVXa_!!684856831.jpg','uploadFile/product/TB2Fj.QgFXXXXbOXXXXXXXXXXXX_!!684856831.jpg',1305,0,'正在售卖','手表','运动表'),
 (36,5,'uploadFile/product/TB2T6kzaR0kpuFjSsppXXcGTXXa_!!1923177224.jpg','韩版潮女学生电子手表男智能创意',29.9,'uploadFile/product/TB2o7J2pXXXXXb_XpXXXXXXXXXX_!!1923177224.jpg','uploadFile/product/TB2pboVhSJjpuFjy0FdXXXmoFXa_!!1923177224.jpg',3564,15434,'正在售卖','手表','电子表'),
 (37,5,'uploadFile/product/TB2fdPNXR8kpuFjSspeXXc7IpXa_!!1937511145.jpg','儿童手表男孩电子表女孩防水夜光小学生手表',11.8,'uploadFile/product/TB2W6HMXR0kpuFjy1XaXXaFkVXa_!!1937511145.jpg','uploadFile/product/TB23AoedVXXXXbaXXXXXXXXXXXX_!!1937511145.jpg',23847,0,'正在售卖','手表','电子表'),
 (38,5,'uploadFile/product/TB1rcCYNpXXXXciXVXXXXXXXXXX_!!0-item_pic.jpg','卡诗顿手表男士 新款男表皮带休闲',135,'uploadFile/product/TB2VMNwqStkpuFjy0FhXXXQzFXa_!!3288560557.jpg','uploadFile/product/TB2seTIdXXXXXafXXXXXXXXXXXX_!!2027731941.jpg',270,13465,'正在售卖','手表','太阳能表'),
 (39,5,'uploadFile/product/TB1Uf9UQXXXXXbRXpXXXXXXXXXX_!!0-item_pic.jpg','卡诗顿新款男士手表休闲真皮精钢男表',98,'uploadFile/product/TB27q2tkR0kpuFjSsziXXa.oVXa_!!2597718806.jpg','uploadFile/product/TB2yC_PmJBopuFjSZPcXXc9EpXa_!!2597718806.jpg',1732,0,'正在售卖','手表','太阳能表'),
 (40,1,'uploadFile/product/TB23KuTtm8mpuFjSZFMXXaxpVXa_!!21425249.jpg','预卖 10包包邮 七子白面膜粉 软膜粉',2.6,'uploadFile/product/TB1cLThKpXXXXcAXpXXXXXXXXXX_!!0-item_pic.jpg','uploadFile/product/TB2fWaAlCxjpuFjSszeXXaeMVXa_!!21425249.jpg',95424,0,'正在售卖','美妆','面膜'),
 (41,1,'uploadFile/product/TB2x5wpb_cCL1FjSZFPXXXZgpXa_!!94298837.jpg','御泥坊水润皙颜矿物面膜套装水果面膜',79.9,'uploadFile/product/TB2tJ6jsOpnpuFjSZFkXXc4ZpXa-1072935401.jpg','uploadFile/product/TB296OqrbplpuFjSspiXXcdfFXa_!!1072935401.jpg',1263,0,'正在售卖','美妆','面膜'),
 (42,1,'uploadFile/product/TB172gfQFXXXXaVXXXXXXXXXXXX_!!0-item_pic.jpg','40片蚕丝蛋白面膜补水保湿收缩毛孔',18.8,'uploadFile/product/TB2Gpi7k98mpuFjSZFMXXaxpVXa_!!1869574636.jpg','uploadFile/product/TB2IWyQjl0lpuFjSszdXXcdxFXa_!!1869574636.jpg',123432,0,'正在售卖','美妆','面膜'),
 (43,1,'uploadFile/product/TB2vSEkaQWM.eBjSZFhXXbdWpXa_!!775451139.jpg','天然小颗粒海藻面膜550g孕妇女补水保湿',29.8,'uploadFile/product/TB2UV4_XthvOuFjSZFBXXcZgFXa_!!775451139.jpg','uploadFile/product/TB2zUZkaQWM.eBjSZFhXXbdWpXa_!!775451139.jpg',53463,0,'正在售卖','美妆','面膜'),
 (44,1,'uploadFile/product/TB2lVG4o9XlpuFjy0FeXXcJbFXa_!!1058982291.jpg','日本COSME大赏Rosette海泥洗面',45,'uploadFile/product/TB2UwWzburAQeBjSZFwXXa_RpXa_!!1058982291.jpg','uploadFile/product/TB2fqC6tFXXXXcMXpXXXXXXXXXX_!!1058982291.jpg',2374,0,'正在售卖','美妆','洁面'),
 (45,1,'uploadFile/product/TB2JDi7s.dnpuFjSZPhXXbChpXa_!!22840728.jpg','芙丽芳丝洗面奶净润洗面霜氨基酸泡沫洁面',89,'uploadFile/product/TB2UbcroFXXXXXkXpXXXXXXXXXX_!!22840728.jpg','uploadFile/product/TB2mG_2prxmpuFjSZJiXXXauVXa_!!22840728.jpg',54645,0,'正在售卖','美妆','洁面'),
 (46,1,'uploadFile/product/TB2pmn9kR0lpuFjSszdXXcdxFXa_!!1718251976.jpg','正品旁氏亮采净白系列米粹润白洁面乳',26,'uploadFile/product/TB2DRoFepXXXXcaXpXXXXXXXXXX_!!1718251976.jpg','uploadFile/product/TB2mkiye88lpuFjy0FnXXcZyXXa_!!1718251976.jpg',1460,0,'正在售卖','美妆','洁面'),
 (47,1,'uploadFile/product/TB2DdgclH0kpuFjy0FjXXcBbVXa_!!1697855927.jpg','专柜正品旁氏米粹润泽洁面乳100g',32,'uploadFile/product/TB2C7BglUhnpuFjSZFEXXX0PFXa_!!1697855927.jpg','uploadFile/product/TB2OZWrj9BjpuFjy1XdXXaooVXa_!!1697855927.jpg',4140,0,'正在售卖','美妆','洁面'),
 (48,1,'uploadFile/product/TB2n52KqNlmpuFjSZPfXXc9iXXa_!!50636054.jpg','美国CeraVe夜间亮白保湿修复敏感乳液',98,'uploadFile/product/TB2VTE2gwNlpuFjy0FfXXX3CpXa_!!50636054.jpg','uploadFile/product/TB249rKouJ8puFjy1XbXXagqVXa_!!50636054.jpg',1100,0,'正在售卖','美妆','乳液'),
 (49,1,'uploadFile/product/TB2pssAqpXXXXaeXpXXXXXXXXXX_!!50636054.jpg','包邮美国正品CeraVe全天候保湿补水润',108,'uploadFile/product/TB2PQcqcpXXXXaaXpXXXXXXXXXX_!!50636054.jpg','uploadFile/product/TB2_J0WlFXXXXX7XpXXXXXXXXXX_!!50636054.jpg',6543,0,'正在售卖','美妆','乳液'),
 (50,1,'uploadFile/product/TB2G3d9ql8lpuFjSspaXXXJKpXa_!!32578986.jpg','法国正品代购 理肤泉清痘净肤水油平衡',115,'uploadFile/product/TB20_75tFXXXXacXXXXXXXXXXXX_!!32578986.jpg','uploadFile/product/TB2uWoatFXXXXczXpXXXXXXXXXX_!!32578986.jpg',5345,0,'正在售卖','美妆','乳液'),
 (51,1,'uploadFile/product/TB2lgsJqFXXXXX1XXXXXXXXXXXX_!!1044951361.jpg','至本舒颜修护乳液100ML安抚小白瓶保湿',128,'uploadFile/product/TB251KTa71M.eBjSZFOXXc0rFXa_!!1044951361.jpg','uploadFile/product/20170527_203356_001.jpg',9555,0,'正在售卖','美妆','乳液'),
 (52,1,'uploadFile/product/TB2s9agaWe5V1BjSszeXXc3zXXa_!!2579217414.jpg','瑞士赛浪琴 手表男全自动机械表防水运动',268,'uploadFile/product/TB2o41aaWi5V1BjSspaXXbrApXa_!!2579217414.jpg','uploadFile/product/TB26zCbaWi5V1BjSszbXXb0hVXa_!!2579217414.jpg',4265,0,'正在售卖','手表','机械表'),
 (53,1,'uploadFile/product/TB2NWM3oXXXXXclXpXXXXXXXXXX_!!31725956 (1).jpg','海鸥手表816.523海洋之星Ocean',2380,'uploadFile/product/TB2Evxid04opuFjSZFLXXX8mXXa_!!31725956.jpg','uploadFile/product/TB2NWM3oXXXXXclXpXXXXXXXXXX_!!31725956.jpg',38,0,'正在售卖','手表','机械表'),
 (54,1,'uploadFile/product/TB2MMMQmHtlpuFjSspfXXXLUpXa_!!2559305528.jpg','瑞士正品全自动机械表男表镂空夜光',298,'uploadFile/product/TB28eQopbBnpuFjSZFGXXX51pXa_!!2559305528.jpg','uploadFile/product/TB2Xv.2mHFlpuFjy0FgXXbRBVXa_!!2559305528.jpg',5,0,'正在售卖','手表','机械表'),
 (55,1,'uploadFile/product/TB28ZP9spXXXXafXXXXXXXXXXXX_!!1829211190.jpg','新款电子表韩国时尚男女学生户外登山',23.8,'uploadFile/product/TB27pAdspXXXXXJXXXXXXXXXXXX_!!1829211190.jpg','uploadFile/product/TB295YgspXXXXc3XpXXXXXXXXXX_!!1829211190.jpg',25324,0,'正在售卖','手表','休闲表'),
 (56,1,'uploadFile/product/TB2DFNPo4dkpuFjy0FbXXaNnpXa_!!1923766194.jpg','天天特价情侣简约创意概念韩版时尚潮流',39,'uploadFile/product/TB21DQPX80lpuFjSszdXXcdxFXa_!!1923766194.jpg','uploadFile/product/TB2GtQRX4XlpuFjSsphXXbJOXXa_!!1923766194.jpg',12321,0,'正在售卖','手表','休闲表'),
 (57,1,'uploadFile/product/TB2ma7xXWnyQeBjSsphXXXiuVXa_!!2613118433.jpg','日韩国版时尚时装简约休闲学生手表',19.99,'uploadFile/product/TB2xeEAX8_xQeBjy0FcXXaBfXXa_!!2613118433.jpg','uploadFile/product/TB2.a7yX4vxQeBjy0FiXXXioXXa_!!2613118433.jpg',213432,0,'正在售卖','手表','休闲表'),
 (58,1,'uploadFile/product/TB2ZN5iepXXXXXZXXXXXXXXXXXX_!!771026098.jpg','时刻美时尚商务大数字多功能LED防水',30,'uploadFile/product/TB2PHxLnmJjpuFjy0FdXXXmoFXa_!!771026098.jpg','uploadFile/product/TB29MuAmipnpuFjSZFIXXXh2VXa_!!771026098.jpg',489,0,'正在售卖','手表','电子表'),
 (59,1,'uploadFile/product/TB2n63Rc.OO.eBjSZFLXXcxmXXa_!!371860138.jpg','时尚潮流电子表男学生防水夜光户外运动手表',39,'uploadFile/product/TB2jmsJtpXXXXXOXFXXXXXXXXXX_!!371860138.jpg','uploadFile/product/TB2q0oVtpXXXXcsXpXXXXXXXXXX_!!371860138.jpg_q90.jpg',1529,0,'正在售卖','手表','电子表'),
 (60,1,'uploadFile/product/TB2ykACrbJmpuFjSZFwXXaE4VXa_!!2691166376.jpg','【天天特价】韩版简约运动手表电子表夜光防',37,'uploadFile/product/TB2zGJcrrlmpuFjSZFlXXbdQXXa_!!2691166376.jpg','uploadFile/product/TB2vxILor8kpuFjy0FcXXaUhpXa_!!2691166376.jpg',106,0,'正在售卖','手表','电子表'),
 (61,1,'uploadFile/product/TB2zqZdlbJkpuFjy1zcXXa5FFXa_!!20774513.jpg','正品超薄男士手表男表皮带防水腕表',68,'uploadFile/product/TB2iv9TnxxmpuFjSZFNXXXrRXXa_!!20774513.jpg','uploadFile/product/TB2aLP2lbXlpuFjSszfXXcSGXXa_!!20774513.jpg',21524,0,'正在售卖','手表','太阳能表'),
 (62,1,'uploadFile/product/TB2DT1VoYxmpuFjSZJiXXXauVXa_!!1127359411.jpg','手表简约防水韩版时尚女表运动商务',10.3,'uploadFile/product/TB16k6YQFXXXXbqaXXXXXXXXXXX_!!0-item_pic.jpg','uploadFile/product/TB25JLZmwxlpuFjSszbXXcSVpXa_!!1127359411.jpg',3,0,'正在售卖','手表','太阳能表'),
 (63,1,'uploadFile/product/TB2NLXctpXXXXXdXFXXXXXXXXXX_!!2079668708.jpg','运动瑞士男士手表男表机械表石英表',38.8,'uploadFile/product/TB2gWoMtFXXXXbNXXXXXXXXXXXX_!!2079668708.jpg','uploadFile/product/TB22eV9tpXXXXXVXXXXXXXXXXXX_!!2079668708.jpg',7923,0,'正在售卖','手表','运动表'),
 (64,1,'uploadFile/product/TB2dSpTqbFkpuFjy1XcXXclapXa_!!767039856.jpg','休闲男女学生运动手表 50米防水',36,'uploadFile/product/TB2jpY0kVXXXXXSXXXXXXXXXXXX_!!767039856.jpg','uploadFile/product/TB2bZWZirBnpuFjSZFGXXX51pXa_!!767039856.jpg',8954,0,'正在售卖','手表','运动表'),
 (65,1,'uploadFile/product/TB1TUfPPVXXXXbCXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg','从你的全世界路过 张嘉佳 央视2014中',21,'uploadFile/product/TB2FeG8X5wd61BjSZFtXXai7XXa_!!2072556143.jpg_430x430q90.jpg','uploadFile/product/TB2exxdXqi5V1BjSsphXXaEpXXa_!!2072556143.jpg',263,0,'正在售卖','书','畅销书'),
 (66,1,'uploadFile/product/TB1Ds1rQFXXXXbvXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg','遇见未知的自己：都市身心灵修行课',18,'uploadFile/product/TB1rKyyQFXXXXcVXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg','uploadFile/product/TB2ZjlrjFXXXXb5XpXXXXXXXXXX_!!2169969258.jpg',188888,0,'正在售卖','书','畅销书'),
 (67,1,'uploadFile/product/TB2MNK4cXXXXXaFXpXXXXXXXXXX_!!2169969258.jpg_430x430q90.jpg','正版现货 苏菲的世界 畅销书作家 ',13.97,'uploadFile/product/TB1BqXcRpXXXXalXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg','uploadFile/product/TB2MNK4cXXXXXaFXpXXXXXXXXXX_!!2169969258.jpg_430x430q90.jpg',1724,0,'正在售卖','书','畅销书'),
 (68,1,'uploadFile/product/TB1xzrTPVXXXXXtXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg','爱上一座城+你若安好便是晴天+你是那人间',38,'uploadFile/product/TB2d1nfX5wd61BjSZFtXXai7XXa_!!1862800015.jpg_430x430q90.jpg','uploadFile/product/TB2p_DgXZgd61BjSZFEXXaBjVXa_!!1862800015.jpg_430x430q90.jpg',5176,0,'正在售卖','书','文学'),
 (69,1,'uploadFile/product/TB28Af_nHBmpuFjSZFAXXaQ0pXa_!!288902762.jpg_430x430q90.jpg','择天记1-4套装 网络文学大神猫腻作品',85,'uploadFile/product/TB1xdqJQFXXXXcgXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg','uploadFile/product/TB1xdqJQFXXXXcgXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg',172,0,'正在售卖','书','小说'),
 (70,1,'uploadFile/product/TB1HSTRIpXXXXbTXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg','夏目漱石经典长篇全收录 **日本文学翻译',20,'uploadFile/product/TB2pfQ_dFXXXXbBXXXXXXXXXXXX_!!859515618.jpg_430x430q90.jpg','uploadFile/product/TB2pfQ_dFXXXXbBXXXXXXXXXXXX_!!859515618.jpg_430x430q90.jpg',1024,0,'正在售卖','书','小说'),
 (71,1,'uploadFile/product/TB1qxJtQpXXXXb_aXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg','麦田里的守望者(精) 正版 塞林格 美国',35,'uploadFile/product/TB2DWxelrlmpuFjSZFlXXbdQXXa_!!859515618.jpg_430x430q90.jpg','uploadFile/product/TB2DWxelrlmpuFjSZFlXXbdQXXa_!!859515618.jpg_430x430q90.jpg',2350,0,'正在售卖','书','小说'),
 (72,5,'uploadFile/product/TB1LnD8RXXXXXalaFXXXXXXXXXX_!!2-item_pic.png_430x430q90.jpg','小王子 精装 法国圣埃克苏佩里基金会',16,'uploadFile/product/TB2QxAfspXXXXcRXpXXXXXXXXXX_!!859515618.jpg_430x430q90.jpg','uploadFile/product/TB2M3ZSspXXXXaTXXXXXXXXXXXX_!!859515618.jpg_430x430q90.jpg',802,46248,'正在售卖','书','小说');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


--
-- Definition of table `shop`
--

DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `shopname` varchar(10) NOT NULL,
  `ownername` varchar(10) NOT NULL,
  `phoneNumber` varchar(11) NOT NULL,
  `identifyImg` varchar(255) NOT NULL,
  `shopstate` varchar(10) NOT NULL DEFAULT '等待验证',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop`
--

/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` (`sid`,`uid`,`shopname`,`ownername`,`phoneNumber`,`identifyImg`,`shopstate`) VALUES 
 (1,1,'追风店铺','追风大佬','18816781250','uploadFile/shop/【电悦台】Razihel & Xilent - Edge of the World (feat. Becko).jpg','正在运营'),
 (2,2,'幻神店','幻神','15521432545','uploadFile/shop/1Q5242L8-2 (1).jpg','正在运营'),
 (3,16,'花落樱舞店','花落樱舞y','15434234244','uploadFile/shop/38761915「無人駅」「66377-いさみゅ」のイラスト[pixiv].jpg','正在运营'),
 (4,3,'万昌店铺','追梦','17543543254','uploadFile/shop/QQ图片20151212184407.jpg','正在运营'),
 (5,32,'慕蓝店铺','倾听者','17843534534','uploadFile/shop/舞穂.png','正在运营'),
 (6,19,'nnmm的店铺','nnmm','15443535353','uploadFile/shop/657.jpg','正在运营'),
 (7,20,'黄家店铺','黄三','15652342343','uploadFile/shop/1 (13).jpg','等待验证'),
 (8,18,'笨笨店铺','白白','18434543534','uploadFile/shop/1 (442).jpg','停止运营'),
 (9,27,'静静店铺','静静','18943535345','uploadFile/shop/2a2b15fc0c5b2119d9514b08118a23cf.jpg','等待验证'),
 (10,30,'德萨店铺','德萨','17834243243','uploadFile/shop/02.jpg','等待验证'),
 (11,31,'大塞弗店铺','塞弗','17777774324','uploadFile/shop/1348713436918.jpg','等待验证'),
 (12,11,'巅峰店铺','王峰','15324324234','uploadFile/shop/Left Mouse.jpg','停止运营');
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;


--
-- Definition of table `shop_order`
--

DROP TABLE IF EXISTS `shop_order`;
CREATE TABLE `shop_order` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `buyNum` int(11) NOT NULL,
  `payAmount` float NOT NULL,
  `ostate` varchar(32) NOT NULL DEFAULT '等待发货',
  `odate` varchar(20) NOT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_order`
--

/*!40000 ALTER TABLE `shop_order` DISABLE KEYS */;
INSERT INTO `shop_order` (`oid`,`uid`,`pid`,`sid`,`buyNum`,`payAmount`,`ostate`,`odate`) VALUES 
 (2,16,31,3,1,29.9,'交易成功','2017-05-23'),
 (3,16,30,3,2,35.8,'交易成功','2017-05-23'),
 (4,16,31,3,4,119.6,'交易成功','2017-05-23'),
 (5,16,31,3,3,89.7,'交易成功','2017-05-23'),
 (6,16,32,3,3,174,'交易成功','2017-05-23'),
 (7,16,32,3,6,348,'交易成功','2017-05-23'),
 (8,16,31,3,1,29.9,'交易成功','2017-05-23'),
 (9,16,30,3,4,71.6,'交易成功','2017-05-23'),
 (10,16,32,3,4,232,'交易成功','2017-05-23'),
 (11,16,32,3,4,232,'交易成功','2017-05-23'),
 (12,16,32,3,2,116,'交易成功','2017-05-23'),
 (13,16,31,3,1,29.9,'交易成功','2017-05-23'),
 (14,16,30,3,1,17.9,'交易成功','2017-05-23'),
 (15,16,32,3,3,174,'交易成功','2017-05-23'),
 (16,16,32,3,1,58,'交易成功','2017-05-24'),
 (17,16,32,3,4,232,'交易成功','2017-05-24'),
 (18,3,33,4,1,13.8,'交易成功','2017-05-24'),
 (19,3,5,1,1,65.9,'等待发货','2017-05-24');
/*!40000 ALTER TABLE `shop_order` ENABLE KEYS */;


--
-- Definition of table `shoppingcart`
--

DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart` (
  `scid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `wBuyNum` int(11) NOT NULL,
  `payAmount` float NOT NULL,
  PRIMARY KEY (`scid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shoppingcart`
--

/*!40000 ALTER TABLE `shoppingcart` DISABLE KEYS */;
INSERT INTO `shoppingcart` (`scid`,`uid`,`pid`,`sid`,`wBuyNum`,`payAmount`) VALUES 
 (1,32,18,1,1,15.7);
/*!40000 ALTER TABLE `shoppingcart` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `password` varchar(32) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `image` varchar(80) NOT NULL DEFAULT 'Images/profle.png',
  `state` varchar(10) NOT NULL DEFAULT '正常',
  `name` varchar(10) DEFAULT NULL,
  `realname` varchar(10) DEFAULT NULL,
  `sex` int(11) DEFAULT '0',
  `brithday` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`uid`,`username`,`password`,`phone`,`image`,`state`,`name`,`realname`,`sex`,`brithday`,`address`) VALUES 
 (1,'she1383','e10adc3949ba59abbe56e057f20f883e','18816781234','uploadFile/user/2.jpg','正常','追风','小红',1,'2006/12/17','北京市/朝阳区/城南长春路11栋'),
 (2,'huan_s31','e10adc3949ba59abbe56e057f20f883e','18816782321','uploadFile/user/8a941cd3tw1ep4312085fj20i20q20ww.jpg','正常','幻神','李四',0,'2000/7/19','四川省/宜宾市/城南长春街11棟702'),
 (3,'jsdf_123','e10adc3949ba59abbe56e057f20f883e','18924553452','uploadFile/user/6d324b91520347354f700deb46cc2319fa1bef1f.jpg','正常','书香','刘虹',1,'1996/2/16','福建省/厦门市/鼓浪屿11号街'),
 (4,'jkuew123','e10adc3949ba59abbe56e057f20f883e','17823493242','Images/profle.png','正常',NULL,NULL,0,NULL,NULL),
 (5,'nzfds124','e10adc3949ba59abbe56e057f20f883e','18032432543','Images/profle.png','正常',NULL,NULL,0,NULL,NULL),
 (6,'fdsa4325','e10adc3949ba59abbe56e057f20f883e','17923123123','Images/profle.png','正常',NULL,NULL,0,NULL,NULL),
 (7,'mvcx_341','e10adc3949ba59abbe56e057f20f883e','15300023432','Images/profle.png','正常',NULL,NULL,0,NULL,NULL),
 (8,'xcv432fds','e10adc3949ba59abbe56e057f20f883e','13343254352','Images/profle.png','正常',NULL,NULL,0,NULL,NULL),
 (9,'dsafs_214','e10adc3949ba59abbe56e057f20f883e','13332543253','Images/profle.png','正常',NULL,NULL,0,NULL,NULL),
 (10,'vzc123_fds','e10adc3949ba59abbe56e057f20f883e','15324553454','Images/profle.png','正常',NULL,NULL,0,NULL,NULL),
 (11,'dfasf_2313','e10adc3949ba59abbe56e057f20f883e','17712345325','Images/profle.png','正常',NULL,NULL,0,NULL,NULL),
 (12,'fsvz123','e10adc3949ba59abbe56e057f20f883e','14242352354','Images/profle.png','正常',NULL,NULL,0,NULL,NULL),
 (13,'fdsf432','e10adc3949ba59abbe56e057f20f883e','15783454325','Images/profle.png','正常',NULL,NULL,0,NULL,NULL),
 (14,'ffd12343','e10adc3949ba59abbe56e057f20f883e','15789342423','Images/profle.png','正常',NULL,NULL,0,NULL,NULL),
 (15,'fdaf3465','e10adc3949ba59abbe56e057f20f883e','18971421424','Images/profle.png','正常',NULL,NULL,0,NULL,NULL),
 (16,'she1234','e10adc3949ba59abbe56e057f20f883e','18324143143','uploadFile/user/34512986「さざなみ」「772547-loundraw」のイラスト[pixiv].jpg','正常','花落樱舞','小红',1,'1995/6/12','广东省/揭阳市/普宁流沙大道北'),
 (17,'vczfdb','e10adc3949ba59abbe56e057f20f883e','14325433424','Images/profle.png','正常',NULL,NULL,0,NULL,NULL),
 (18,'vvcx1234','e10adc3949ba59abbe56e057f20f883e','17432432432','Images/profle.png','正常',NULL,NULL,0,NULL,NULL),
 (19,'nnmmm123','e10adc3949ba59abbe56e057f20f883e','18432432423','Images/profle.png','正常',NULL,NULL,0,NULL,NULL),
 (20,'huang123','e10adc3949ba59abbe56e057f20f883e','18732343243','Images/profle.png','正常',NULL,NULL,0,NULL,NULL),
 (21,'li123v','e10adc3949ba59abbe56e057f20f883e','15512345435','Images/profle.png','正常',NULL,NULL,0,NULL,NULL),
 (22,'vcxv124','e10adc3949ba59abbe56e057f20f883e','17882143254','Images/profle.png','正常',NULL,NULL,0,NULL,NULL),
 (23,'c34253fdsa','e10adc3949ba59abbe56e057f20f883e','15445435345','Images/profle.png','正常',NULL,NULL,0,NULL,NULL),
 (24,'fdsaf123','e10adc3949ba59abbe56e057f20f883e','13754435354','Images/profle.png','停用',NULL,NULL,0,NULL,NULL),
 (25,'vcxv1234','e10adc3949ba59abbe56e057f20f883e','15435395435','Images/profle.png','正常',NULL,NULL,0,NULL,NULL),
 (26,'dfs1235','e10adc3949ba59abbe56e057f20f883e','18823123214','Images/profle.png','停用',NULL,NULL,0,NULL,NULL),
 (27,'jjjj1234','e10adc3949ba59abbe56e057f20f883e','15433213123','Images/profle.png','正常',NULL,NULL,0,NULL,NULL),
 (28,'kkkk1234','e10adc3949ba59abbe56e057f20f883e','18812343243','Images/profle.png','停用',NULL,NULL,0,NULL,NULL),
 (29,'sfds12321','e10adc3949ba59abbe56e057f20f883e','18912343254','Images/profle.png','停用',NULL,NULL,0,NULL,NULL),
 (30,'fdsf21455','e10adc3949ba59abbe56e057f20f883e','17521353254','Images/profle.png','正常',NULL,NULL,0,NULL,NULL),
 (31,'fdsf124568','e10adc3949ba59abbe56e057f20f883e','14435345435','Images/profle.png','正常',NULL,NULL,0,NULL,NULL),
 (32,'she14830','e10adc3949ba59abbe56e057f20f883e','18851242432','uploadFile/user/psb.jpg','正常','Listener丶','羽高',0,'1995/3/28','广东省/揭阳市/揭西河婆镇');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `user_order`
--

DROP TABLE IF EXISTS `user_order`;
CREATE TABLE `user_order` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `buyNum` int(11) NOT NULL,
  `payAmount` float NOT NULL,
  `ostate` varchar(32) NOT NULL DEFAULT '等待发货',
  `odate` varchar(20) NOT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_order`
--

/*!40000 ALTER TABLE `user_order` DISABLE KEYS */;
INSERT INTO `user_order` (`oid`,`uid`,`pid`,`sid`,`buyNum`,`payAmount`,`ostate`,`odate`) VALUES 
 (18,3,33,4,1,13.8,'交易成功','2017-05-24'),
 (19,3,5,1,1,65.9,'等待发货','2017-05-24');
/*!40000 ALTER TABLE `user_order` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
