/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : store

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2019-12-21 13:52:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `uid` int(11) NOT NULL,
  `username` varchar(255) collate utf8_bin default NULL,
  `password` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` varchar(32) NOT NULL,
  `cname` varchar(20) default NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '文学作品');
INSERT INTO `category` VALUES ('1BF71C94D0EB4BB4B1886EA4D9605007', '人文主义');
INSERT INTO `category` VALUES ('2', '科幻小说');
INSERT INTO `category` VALUES ('3', '工具用书');
INSERT INTO `category` VALUES ('4', '儿童读物');

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `cid` varchar(32) character set utf8 NOT NULL,
  `uid` varchar(32) character set utf8 NOT NULL,
  `pid` varchar(32) character set utf8 NOT NULL,
  PRIMARY KEY  (`cid`),
  KEY `yar` (`uid`),
  KEY `wa` (`pid`),
  CONSTRAINT `wa` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`),
  CONSTRAINT `yar` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('02D36E9CC80E40A09E5F4427C42CCA78', 'A47B7701E8E34E9EB997A65FC15B417F', '39');
INSERT INTO `collection` VALUES ('0A833A79467F4C9CB0B236076E0AD264', 'F4984DB59DFB4AFB81626A418D55D716', '31');
INSERT INTO `collection` VALUES ('11', '373eb242933b4f5ca3bd43503c34668b', '10');
INSERT INTO `collection` VALUES ('1113', '373eb242933b4f5ca3bd43503c34668b', '3');
INSERT INTO `collection` VALUES ('123', '373eb242933b4f5ca3bd43503c34668b', '1');
INSERT INTO `collection` VALUES ('123123', '373eb242933b4f5ca3bd43503c34668b', '12');
INSERT INTO `collection` VALUES ('3F0D34F08990414192A5C7CF757BA77A', 'A47B7701E8E34E9EB997A65FC15B417F', '52675F3AFDA94E1D9F5C83162660A8E3');
INSERT INTO `collection` VALUES ('632C8CA1890C420FA85B15B02D4D7915', 'A47B7701E8E34E9EB997A65FC15B417F', '60');
INSERT INTO `collection` VALUES ('a123', '373eb242933b4f5ca3bd43503c34668b', '6');
INSERT INTO `collection` VALUES ('ABD55FF0C07C4083BD77024B16E2FD8E', 'A47B7701E8E34E9EB997A65FC15B417F', '6639507CCDE4459F88B6C0530C30B460');
INSERT INTO `collection` VALUES ('D66737ADB4C34CDFA8502C0A5B0C3A08', 'B894739B58E342E2A38D9B33B57377B0', '29');
INSERT INTO `collection` VALUES ('DCDFF6C86CA0496A86203C97E21DFCE3', '452B97A90F9840DC89610E84CAF75CC6', '6639507CCDE4459F88B6C0530C30B460');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `itemid` varchar(32) NOT NULL,
  `count` int(11) default NULL,
  `subtotal` double default NULL,
  `pid` varchar(32) default NULL,
  `oid` varchar(32) default NULL,
  PRIMARY KEY  (`itemid`),
  KEY `fk_0001` (`pid`),
  KEY `fk_0002` (`oid`),
  CONSTRAINT `fk_0001` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`),
  CONSTRAINT `fk_0002` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('00F3F98BBA624F14B26CE6780D041F96', '1', '998', '52675F3AFDA94E1D9F5C83162660A8E3', '91AB5387531D436A851736AD72CF09A2');
INSERT INTO `orderitem` VALUES ('023320DEFE7F4248BB5CB4F4AFB185AF', '1', '40.8', '29', '0ABD4011F8B343CE8CD90CA155F62F49');
INSERT INTO `orderitem` VALUES ('0A938B965993471DAFFF61027249BD79', '12', '489.6', '29', '631B7548096D480E9FEF3461DFE5C456');
INSERT INTO `orderitem` VALUES ('100F26881CAD4E3496A87566009E19EA', '1', '24', '44', 'A95A19B6BDF644FEB9E63AD5A4F8C39E');
INSERT INTO `orderitem` VALUES ('1249E89CB4084E0380E49028C2148FDA', '13', '591.5', '31', '631B7548096D480E9FEF3461DFE5C456');
INSERT INTO `orderitem` VALUES ('18BA5084D7214E9589C354BD9A66F653', '1', '24', '44', 'C6269EE6B21C4DCF9813164856CD1456');
INSERT INTO `orderitem` VALUES ('2AACF0DCBC4644FAA22270B79DD13451', '1', '25', '36', 'DC94E327E26C4B16BCE98D06504BB935');
INSERT INTO `orderitem` VALUES ('364BAB484BBC4DC5B7B2D91678E23D92', '2', '90', '46E5AA8AFEAF47C9A7C4BFE9AADF8FFD', 'D7D8371453724194ACC8CA27CC85FE02');
INSERT INTO `orderitem` VALUES ('466E917D22984265AB16766F05AF0C0D', '1', '25.46', '37', '80D80D242B814D7698C89ACACC36FD3D');
INSERT INTO `orderitem` VALUES ('4DD34EBD5F0442C1812CAC4AF1F48950', '2', '47.1', '32', 'DC94E327E26C4B16BCE98D06504BB935');
INSERT INTO `orderitem` VALUES ('5005F0D72CB346E489F434FEF501FA8D', '1', '40.8', '29', '811D732AB86347B7AA6B21937D859A58');
INSERT INTO `orderitem` VALUES ('52A7503E2360426C9F2CEE644BA5DBAF', '12', '288', '44', '811D732AB86347B7AA6B21937D859A58');
INSERT INTO `orderitem` VALUES ('5B2B8124EB1740EAA663BD8CB5EDBEB8', '1', '61.3', '26', '9A09F83CF63246DF8B9D1B49C0D553B3');
INSERT INTO `orderitem` VALUES ('658155F6D2BA4377994CA6C41AD28766', '1', '998', '46E5AA8AFEAF47C9A7C4BFE9AADF8FFD', '80D80D242B814D7698C89ACACC36FD3D');
INSERT INTO `orderitem` VALUES ('69078D5F0D254AD4A244226524B49863', '1', '987', '6639507CCDE4459F88B6C0530C30B460', 'C44DD3626AA2424E97AC2BF8CAEA190B');
INSERT INTO `orderitem` VALUES ('7682D9836E3F40D0846D8B2D830424C1', '26', '1170', '46E5AA8AFEAF47C9A7C4BFE9AADF8FFD', '10F91F6B876A451BA9C2D811D8C9BCCB');
INSERT INTO `orderitem` VALUES ('7FDA96422D3F413BA20A9B5D08EC4947', '18', '432', '44', 'DE49C9F3C5394869AD38E7F65980174B');
INSERT INTO `orderitem` VALUES ('839B6ED7AD4648BC96B3CC2AFA04376F', '1', '23.3', '1', '61689426A5974AB0A142C7EE5BE5D38B');
INSERT INTO `orderitem` VALUES ('845B138F51FA45A6A27A0EAA9535AF10', '12', '204', '43', '58A8386B2108419086C1196B2DE449B9');
INSERT INTO `orderitem` VALUES ('8480AB7D8D064AD0BD26C33A075F9825', '12', '489.6', '29', '12592B28C0744628857C3AC5ABC34408');
INSERT INTO `orderitem` VALUES ('96445E7E8AC644B2BF409E9E5C3E96FD', '12', '344.4', '4', '8134E8CE27CB4E719E27DDDA0A2CE566');
INSERT INTO `orderitem` VALUES ('9FD7F13C7D8C4F1AAFAFE3806069563C', '1', '24', '44', 'A9E2F7E0FDEC46D4B30D54A9D5D458B5');
INSERT INTO `orderitem` VALUES ('A17CFA60058F4E018440DF1D6CD9EE0B', '2', '91', '31', '10F91F6B876A451BA9C2D811D8C9BCCB');
INSERT INTO `orderitem` VALUES ('A3B18EC18E8E4BDF891CA4FB966205F2', '1', '24.9', '8', 'AFC5D9409AD446609DBB4FC9B1C3B04C');
INSERT INTO `orderitem` VALUES ('A6A9C9ADDBB74EF58C1717EE7E9C4C73', '10', '240', '44', '631B7548096D480E9FEF3461DFE5C456');
INSERT INTO `orderitem` VALUES ('AB33A293E19249DABFC81773EFE37B79', '1', '21', '30', '37F3F141748D40A5B38CD21D5EA9761B');
INSERT INTO `orderitem` VALUES ('ACBB67776DA949E192594A10A9FE619B', '1', '61.3', '26', '61689426A5974AB0A142C7EE5BE5D38B');
INSERT INTO `orderitem` VALUES ('AEC00B6A6DC841A0B3AC087AA6E2E207', '123', '5018.4', '29', '9C8CE7D2BBFA4056B420B8F24F37A168');
INSERT INTO `orderitem` VALUES ('B0F695AEF70942999EF26830FC192464', '12', '570', '16', 'DE49C9F3C5394869AD38E7F65980174B');
INSERT INTO `orderitem` VALUES ('B6584FF2D99246DD90405927A3114063', '189', '4536', '44', '9C8CE7D2BBFA4056B420B8F24F37A168');
INSERT INTO `orderitem` VALUES ('B7D77D066A3F451C86E035A6EDF9A5B8', '1', '24', '44', 'AFC5D9409AD446609DBB4FC9B1C3B04C');
INSERT INTO `orderitem` VALUES ('B858665AEABC43FDAA248C6D9A30B0FA', '122', '3501.4', '4', '9C8CE7D2BBFA4056B420B8F24F37A168');
INSERT INTO `orderitem` VALUES ('B9408CDB291649769F80C78EABE4BEB5', '1', '61.3', '26', 'A95A19B6BDF644FEB9E63AD5A4F8C39E');
INSERT INTO `orderitem` VALUES ('B9E005F7CCCA45DD8422F4B73D11F791', '1', '23.3', '1', 'AFC5D9409AD446609DBB4FC9B1C3B04C');
INSERT INTO `orderitem` VALUES ('BA31310C2AD94545A1FABC543EE91DD8', '1', '45.5', '31', '371B1A9C3A10465E9DAAD6C94F04271F');
INSERT INTO `orderitem` VALUES ('C796A7C4395A4C0FB757F686330361B6', '1', '45', '46E5AA8AFEAF47C9A7C4BFE9AADF8FFD', '9583506DF0CC4995B2D3D4A129C3F6A5');
INSERT INTO `orderitem` VALUES ('C8B67E5A8AEB4D809C4FB2216863AFCF', '1', '61.3', '26', '10F91F6B876A451BA9C2D811D8C9BCCB');
INSERT INTO `orderitem` VALUES ('CD40A258030A47128DC3C321B75432D7', '1', '61.3', '26', '12592B28C0744628857C3AC5ABC34408');
INSERT INTO `orderitem` VALUES ('CFCF4474EFBA4D80B8F11F0F8FCA1337', '1', '30.4', '25', '80D80D242B814D7698C89ACACC36FD3D');
INSERT INTO `orderitem` VALUES ('E2B35888E5F745239537798F27D8CD9F', '12', '570', '16', 'A95A19B6BDF644FEB9E63AD5A4F8C39E');
INSERT INTO `orderitem` VALUES ('E6DD1BEF9F8A4DDFA50ADC545AF3F4B0', '123', '5596.5', '31', '8134E8CE27CB4E719E27DDDA0A2CE566');
INSERT INTO `orderitem` VALUES ('F683BEFBA1E44DF6A91091B423FE8CD5', '1', '24.9', '8', '811D732AB86347B7AA6B21937D859A58');
INSERT INTO `orderitem` VALUES ('FB6D701BBAA74AC3B32FC253571644A5', '2', '91', '31', '1D748D89C3994C388F63577A1315AC03');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` varchar(32) NOT NULL,
  `ordertime` datetime default NULL,
  `total` double default NULL,
  `state` int(11) default NULL,
  `address` varchar(30) default NULL,
  `name` varchar(20) default NULL,
  `telephone` varchar(20) default NULL,
  `uid` varchar(32) default NULL,
  PRIMARY KEY  (`oid`),
  KEY `usre` (`uid`),
  CONSTRAINT `usre` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('0ABD4011F8B343CE8CD90CA155F62F49', '2019-12-14 11:04:06', '40.8', '5', '搭档', '12', '123', 'A47B7701E8E34E9EB997A65FC15B417F');
INSERT INTO `orders` VALUES ('10F91F6B876A451BA9C2D811D8C9BCCB', '2019-12-20 00:56:46', '1322.3', '0', null, null, null, 'A47B7701E8E34E9EB997A65FC15B417F');
INSERT INTO `orders` VALUES ('12592B28C0744628857C3AC5ABC34408', '2019-12-14 10:39:22', '550.9', '3', '上海', '张三', '123456789', 'A47B7701E8E34E9EB997A65FC15B417F');
INSERT INTO `orders` VALUES ('1D748D89C3994C388F63577A1315AC03', '2019-12-20 00:34:58', '91', '5', '我家', '你家', '123456', 'A47B7701E8E34E9EB997A65FC15B417F');
INSERT INTO `orders` VALUES ('371B1A9C3A10465E9DAAD6C94F04271F', '2019-12-15 20:08:19', '45.5', '1', '123', '123', '123', '373eb242933b4f5ca3bd43503c34668b');
INSERT INTO `orders` VALUES ('37F3F141748D40A5B38CD21D5EA9761B', '2019-12-20 16:07:02', '21', '3', '我家', '你家', '123456789', 'F4984DB59DFB4AFB81626A418D55D716');
INSERT INTO `orders` VALUES ('58A8386B2108419086C1196B2DE449B9', '2019-12-11 21:31:19', '204', '5', '太阳', '月亮', '123456', 'f55b7d3a352a4f0782c910b2c70f1ea4');
INSERT INTO `orders` VALUES ('61689426A5974AB0A142C7EE5BE5D38B', '2019-12-14 02:37:15', '84.6', '3', '张三', '低调的', '12315546', '84CF10DA91CA42429E20FF57E02E94EA');
INSERT INTO `orders` VALUES ('631B7548096D480E9FEF3461DFE5C456', '2019-12-14 10:42:00', '1321.1', '5', '我家', '老师', '9999999999', 'A47B7701E8E34E9EB997A65FC15B417F');
INSERT INTO `orders` VALUES ('80D80D242B814D7698C89ACACC36FD3D', '2019-12-11 21:29:38', '1053.86', '5', '我家', '他家', '189', 'f55b7d3a352a4f0782c910b2c70f1ea4');
INSERT INTO `orders` VALUES ('811D732AB86347B7AA6B21937D859A58', '2019-12-14 02:20:40', '353.7', '5', '我家', '阿斯', '123321', '84CF10DA91CA42429E20FF57E02E94EA');
INSERT INTO `orders` VALUES ('8134E8CE27CB4E719E27DDDA0A2CE566', '2019-12-13 12:42:55', '5940.9', '2', '我话', '张三', '1894894', 'f55b7d3a352a4f0782c910b2c70f1ea4');
INSERT INTO `orders` VALUES ('91AB5387531D436A851736AD72CF09A2', '2019-12-13 12:33:13', '998', '0', null, null, null, 'f55b7d3a352a4f0782c910b2c70f1ea4');
INSERT INTO `orders` VALUES ('9583506DF0CC4995B2D3D4A129C3F6A5', '2019-12-20 17:02:25', '45', '5', '的撒奥德赛', '问问', '12312', 'B894739B58E342E2A38D9B33B57377B0');
INSERT INTO `orders` VALUES ('9A09F83CF63246DF8B9D1B49C0D553B3', '2019-12-18 23:30:01', '61.3', '0', null, null, null, 'A47B7701E8E34E9EB997A65FC15B417F');
INSERT INTO `orders` VALUES ('9C8CE7D2BBFA4056B420B8F24F37A168', '2019-12-11 21:32:19', '13055.8', '1', '月球', '我家', '123456789', 'f55b7d3a352a4f0782c910b2c70f1ea4');
INSERT INTO `orders` VALUES ('A95A19B6BDF644FEB9E63AD5A4F8C39E', '2019-12-13 17:38:32', '655.3', '4', '11', '1', '1', '84CF10DA91CA42429E20FF57E02E94EA');
INSERT INTO `orders` VALUES ('A9E2F7E0FDEC46D4B30D54A9D5D458B5', '2019-12-14 01:42:45', '24', '5', '123', '123', '123', '84CF10DA91CA42429E20FF57E02E94EA');
INSERT INTO `orders` VALUES ('AFC5D9409AD446609DBB4FC9B1C3B04C', '2019-12-14 02:07:52', '72.2', '3', 'SAS', 'RENOA', '123456', '84CF10DA91CA42429E20FF57E02E94EA');
INSERT INTO `orders` VALUES ('C44DD3626AA2424E97AC2BF8CAEA190B', '2019-12-14 11:15:31', '987', '0', null, null, null, 'A47B7701E8E34E9EB997A65FC15B417F');
INSERT INTO `orders` VALUES ('C6269EE6B21C4DCF9813164856CD1456', '2019-12-14 10:43:42', '24', '4', '1', '1', '1', 'A47B7701E8E34E9EB997A65FC15B417F');
INSERT INTO `orders` VALUES ('D7D8371453724194ACC8CA27CC85FE02', '2019-12-20 16:06:23', '90', '0', null, null, null, 'F4984DB59DFB4AFB81626A418D55D716');
INSERT INTO `orders` VALUES ('DC94E327E26C4B16BCE98D06504BB935', '2019-12-13 23:50:06', '72.1', '2', '123', '123', '123', '84CF10DA91CA42429E20FF57E02E94EA');
INSERT INTO `orders` VALUES ('DE49C9F3C5394869AD38E7F65980174B', '2019-12-11 21:30:22', '1002', '2', '地球', '我家', '123', 'f55b7d3a352a4f0782c910b2c70f1ea4');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` varchar(32) NOT NULL,
  `pname` varchar(50) default NULL,
  `market_price` double default NULL,
  `shop_price` double default NULL,
  `pimage` varchar(200) default NULL,
  `pdate` date default NULL,
  `is_hot` int(11) default NULL,
  `pdesc` varchar(255) default NULL,
  `pflag` int(11) default NULL,
  `cid` varchar(32) default NULL,
  PRIMARY KEY  (`pid`),
  KEY `sfk_0001` (`cid`),
  CONSTRAINT `sfk_0001` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '《瓦尔登湖》', '35', '23.3', 'products/1/c_0001.jpg', '2015-11-02', '1', '朗读者推荐书目！畅销全国七年，历经11次修订。美国自然文学的典范，读完它，你会获得心灵的纯净，精神的升华。清华大学校长送给新生的见面礼。', '0', '1');
INSERT INTO `product` VALUES ('10', '《被仰望与被遗忘的》', '65', '47.1', 'products/1/c_0018.jpg', '2015-11-02', '0', '[美] 盖伊·特立斯（GayTalese）著范晓彬 著', '0', '1');
INSERT INTO `product` VALUES ('11', '《黑骏马》', '32.8', '31.2', 'products/1/c_0020.jpg', '2015-11-02', '1', '双语译林：黑骏马（附英文原版1本）', '0', '1');
INSERT INTO `product` VALUES ('12', '《嫌疑人X的现身》', '35', '25.2', 'products/1/c_0002.jpg', '2015-11-05', '1', '包邮正版 东野圭吾：嫌疑人X的献身（2014版精装）王凯 福山雅治主演同名电影（双版）IP原著 畅销', '1', '1');
INSERT INTO `product` VALUES ('13', '《我的牧羊日记》', '49.8', '32.4', 'products/1/c_0019.jpg', '2015-11-02', '0', ' 现货 我的牧羊日记 艾克瑟 林登 著 马学燕 译 作者比尔·波特鼎力推荐 畅销文学 国外文学书籍', '0', '1');
INSERT INTO `product` VALUES ('14', '《红星照耀中国》', '43', '32.5', 'products/1/c_0021.jpg', '2015-11-02', '0', '暑假读好书！ 红星照耀中国（畅销300万册 教育部指定版本）', '0', '1');
INSERT INTO `product` VALUES ('15', '《灿若黎明》', '45', '29.3', 'products/1/c_0022.jpg', '2015-11-02', '1', '【赠精美书签！官方直营】灿若黎明 海外畅销百万册《华尔街日报》《纽约时报》一致年度荐书！感动荐读', '0', '1');
INSERT INTO `product` VALUES ('16', '《尼伯龙根之歌》', '78', '47.5', 'products/1/c_0023.jpg', '2015-11-09', '1', '正版尼伯龙根之歌 德国民间史诗 欧洲历史典故 王家的不睦与纷争 曹乃云译 德国英雄传说史诗集畅销书', '1', '1');
INSERT INTO `product` VALUES ('17', '《浓情巧克力》', '49', '46.6', 'products/1/c_0024.jpg', '2015-11-02', '1', '先锋经典文库：浓情巧克力 [CHOCOLAT]', '0', '1');
INSERT INTO `product` VALUES ('18', '《偷书贼》', '34.6', '34.6', 'products/1/c_0025.jpg', '2015-11-02', '0', '偷书贼 马库斯苏萨克著 陶泽惠译 外国文学小说畅销 追风筝的人 解忧杂货店 可以战胜孤独和恐惧 外国', '0', '1');
INSERT INTO `product` VALUES ('19', '《拉普拉斯的魔女》', '39.8', '19.8', 'products/1/c_0026.jpg', '2015-11-02', '0', '拉普拉斯的魔女 东野圭吾 继解忧杂货店/白夜行之后回归推理之作 外国日本侦探/悬疑小说 新华书店畅销', '1', '1');
INSERT INTO `product` VALUES ('2', '《二手时间》', '55', '55', 'products/1/c_0010.jpg', '2015-11-02', '1', '诺贝尔文学奖得主阿列克谢耶维奇全新力作，豆瓣2016年度高分图书榜榜首，新浪好书榜十大好书，单向街·书店文学奖年度图书，《人民日报》《第一时间》《锵锵三人行》推荐，再现转型时代普通人带血的历史。', '0', '1');
INSERT INTO `product` VALUES ('20', '《追风筝的人》', '36', '21.6', 'products/1/c_0027.jpg', '2015-11-02', '0', '正版追风筝的人 胡塞尼著 上海人民出版社 两千万读者口耳相传外国文学畅销排行力荐情感读物文艺女性', '0', '1');
INSERT INTO `product` VALUES ('21', '《噪音》', '52', '37.9', 'products/1/c_0028.jpg', '2015-11-02', '0', '噪音---音乐的政治经济学 人文科学译丛 贾克·阿达利 著 音乐理论与研究畅销书', '0', '1');
INSERT INTO `product` VALUES ('22', '《不能说的名字》', '42', '12', 'products/1/c_0029.jpg', '2015-11-02', '0', '【附赠精美书签!官方直营】不能说的名字 海外畅销百万册,美国年度畅销书,数百万读者巨大震撼《燃烧弹》', '0', '1');
INSERT INTO `product` VALUES ('23', '《你当像鸟飞往你的山》', '59', '41.5', 'products/1/c_0003.jpg', '2015-11-02', '0', '17岁前从未上过学的女孩，如何成为剑桥大学博士？教育不是被规训，而是勇敢定义自己的人生！《纽约时报》《时代周刊》《卫报》等数十家媒体一致公推“年度图书”', '0', '1');
INSERT INTO `product` VALUES ('24', '《芒果街上的小屋》', '27.5', '18.8', 'products/1/c_0030.jpg', '2015-11-02', '0', '芒果街上的小屋中文版+英文版 原版中英双语精装中文英文无删减芒果街的小屋芒果树上的小屋畅销书', '1', '1');
INSERT INTO `product` VALUES ('25', '《三体》', '32', '30.4', 'products/1/c_0031.jpg', '2019-12-09', '1', '中国科幻基石丛书：三体（2）黑暗森林', '0', '2');
INSERT INTO `product` VALUES ('26', '《2001太空漫游》', '62', '61.3', 'products/1/c_0032.jpg', '2019-12-09', '0', '2001：太空漫游（刘慈欣说：我所有作品都是对《2001：太空漫游》的拙劣模仿！）', '0', '2');
INSERT INTO `product` VALUES ('27', '《时空逃亡》', '32', '21.58', 'products/1/c_0033.jpg', '2019-12-09', '0', '时空逃亡(遗忘三部曲)/世界畅销书大系', '1', '2');
INSERT INTO `product` VALUES ('29', '《仿生人会梦见电子羊吗》', '40.8', '40.8', 'products/1/c_0035.jpg', '2019-12-09', '1', '正版 仿生人会梦见电子羊吗 ·迪克 正版 银翼杀手2049原著科幻小说畅销书籍高堡奇人流吧我的眼泪', '0', '1');
INSERT INTO `product` VALUES ('3', '《一千零一夜》', '38', '29.5', 'products/1/c_0014.jpg', '2015-11-02', '1', '又名《天方夜谭》，阿拉伯民间故事集。', '0', '1');
INSERT INTO `product` VALUES ('30', '《神的九十亿个名字》', '42', '21', 'products/1/c_0036.jpg', '2019-12-09', '0', '神的九十亿个名字 刘慈欣偶像 阿瑟克拉克 伟大的太空预言家 科幻三巨头 科幻小说畅销书 新华书店正版', '0', '2');
INSERT INTO `product` VALUES ('31', '《阿西莫夫：机器人短篇全集》', '46', '45.5', 'products/1/c_0037.jpg', '2019-12-09', '1', '[美] 艾萨克·阿西莫夫 著，叶李华 译', '0', '1');
INSERT INTO `product` VALUES ('32', '《银河帝国（12）》', '46', '23.55', 'products/1/c_0038.jpg', '2019-12-09', '1', '银河帝国（12）：机器人与帝国 江苏文艺出版社 科幻小说', '0', '2');
INSERT INTO `product` VALUES ('33', '《流浪地球》', '35', '32.8', 'products/1/c_0039.jpg', '2019-12-09', '1', '流浪地球 刘慈欣中国科幻 收录流浪地球全集人和吞噬者大刘王晋康何夕现代文学书籍畅销书排行榜 电影原著', '1', '2');
INSERT INTO `product` VALUES ('34', '《水星播种》', '90', '48', 'products/1/c_0040.jpg', '2019-12-09', '0', '正版 现货 科幻小说系列2册 水星播种+太空游民 小说 科幻畅销书籍 刘慈欣等著', '0', '2');
INSERT INTO `product` VALUES ('35', '《时光之轮》', '88', '62', 'products/1/c_0041.jpg', '2019-12-09', '0', '《时光之轮》纽约时报冠军作品，轰动21国、畅销全球超20000000册，获美国“年轻人爱读', '0', '1');
INSERT INTO `product` VALUES ('36', '《亚特兰蒂斯. 2》', '39.8', '25', 'products/1/c_0042.jpg', '2019-12-09', '0', '亚特兰蒂斯. 2. 末日病毒 刘慈欣诚意推荐 美国畅销百万册的科幻悬疑巨作，人种(末日病毒)2', '0', '2');
INSERT INTO `product` VALUES ('37', '《星际战争》', '38', '25.46', 'products/1/c_0043.jpg', '2019-12-09', '1', '星际战争 刘慈欣 中国短篇科幻小说银河护卫队星际战争宇宙往事流浪地球赡养人类超新星纪元畅销书籍', '1', '3');
INSERT INTO `product` VALUES ('39', '《时间深渊》', '39.8', '25.9', 'products/1/c_0045.jpg', '2019-12-09', '1', '时间深渊 傅强科幻小说 密室杀人暴风雪山庄推理小说学前沿科技星云奖夏笳作序推荐畅销书籍那不勒斯的九月', '0', '1');
INSERT INTO `product` VALUES ('4', '《荷马史诗·奥德赛》', '37', '28.7', 'products/1/c_0013.jpg', '2015-11-02', '0', '', '0', '1');
INSERT INTO `product` VALUES ('40', '《人类之子》', '49.9', '30', 'products/1/c_0046.jpg', '2019-12-09', '0', '人类之子 詹姆斯的反乌托邦力作 电影原著小说 长篇科幻悬疑推理侦探 畅销小说 正版科幻小说书籍', '0', '2');
INSERT INTO `product` VALUES ('41', '《父与子》', '90', '49.5', 'products/1/c_0036.jpg', '2019-12-09', '0', '父与子全集6册扫码看动漫注音版彩图绘本儿童故事书 正版小学生畅销书籍拼音版1-2-3-4-5-6', '0', '3');
INSERT INTO `product` VALUES ('41D42CCDB13E4E3E9BBE983F474FFBE1', '《父与子III》', '889', '998', 'products/1/c_0036.jpg', '2019-12-21', '1', '好', '0', '1');
INSERT INTO `product` VALUES ('42', '《四大名著》', '55', '24', 'products/1/c_0048.jpg', '2019-12-09', '0', '四大名著 红楼梦 三国演义 水浒传 西游记 小学生必读名著新课标同步课外阅读 彩图注音（共4册）99元10本书', '1', '1');
INSERT INTO `product` VALUES ('43', '《朝花夕拾》', '22', '17', 'products/1/c_0049.jpg', '2019-12-09', '0', '朝花夕拾 人教版名著阅读课程化丛书 教育部统编语文指定推荐必读书目 七年级上册', '0', '4');
INSERT INTO `product` VALUES ('44', '《2019中考满分作文特辑》', '32', '24', 'products/1/c_0050.jpg', '2019-12-09', '0', '2019中考满分作文特辑 备战2020年中考 随书赠中学生时事热点素材 赠品在书内 请仔细查找', '0', '1');
INSERT INTO `product` VALUES ('46E5AA8AFEAF47C9A7C4BFE9AADF8FFD', '《朝花夕拾II》', '32', '45', 'products/1/c_0041.jpg', '2019-12-15', '1', '朝花夕拾 人教版名著阅读课程化丛书 教育部统编语文指定推荐必读书目 七年级上册', '0', '1');
INSERT INTO `product` VALUES ('5', '《圣经故事II》', '98', '68', 'products/1/c_0012.jpg', '2015-11-02', '1', '圣经故事 新约篇+旧约篇大全 多雷插图版 的故事 宗教文化书籍 世界文学名著 宗教知识读物类畅销书', '0', '1');
INSERT INTO `product` VALUES ('52675F3AFDA94E1D9F5C83162660A8E3', '《圣经故事》', '98', '88', 'products/1/c_0012.jpg', '2019-12-15', '1', '圣经故事 新约篇+旧约篇大全 多雷插图版 的故事 宗教文化书籍 世界文学名著 宗教知识读物类畅销书', '0', '1');
INSERT INTO `product` VALUES ('6', '《 艾米·利普特罗特》', '45', '32', 'products/1/c_0011.jpg', '2015-11-02', '0', '[英] 艾米·利普特罗特 著', '0', '1');
INSERT INTO `product` VALUES ('60', '《东京塔》', '20', '9', 'products/1/c_0017.jpg', '2015-11-02', '1', '正版现货空之境界+未来福音黑金版共4册奈须蘑菇著 日本文化厅推荐畅销日本轻小说书二次元动漫书', '0', '1');
INSERT INTO `product` VALUES ('6639507CCDE4459F88B6C0530C30B460', '《一九0六：英伦手记II》', '78', '98', 'products/1/c_0015.jpg', '2019-12-15', '1', '一九0六：英伦乡野手记（山杯书系·写生簿） [The Country Diary of an Edwardian Lady]', '0', '1');
INSERT INTO `product` VALUES ('7', '《一九0六：英伦乡野手记》', '89', '78', 'products/1/c_0015.jpg', '2015-11-02', '1', '一九0六：英伦乡野手记（山杯书系·写生簿） [The Country Diary of an Edwardian Lady]', '0', '1');
INSERT INTO `product` VALUES ('8', '《岛屿之书II》', '39.8', '24.9', 'products/1/c_0016.jpg', '2015-11-03', '0', '[英] 艾米·利普特罗特 著', '0', '1');
INSERT INTO `product` VALUES ('9E8403E1BB53420DACF32E13F6261569', '《岛屿之书》', '12', '32', 'products/1/c_0016.jpg', '2019-12-15', '0', '打发斯蒂芬', '0', '1');
INSERT INTO `product` VALUES ('E0B81D5187434E4BAA4D3BFA73D2F913', '《空之境界》', '77', '98', 'products/1/c_0017.jpg', '2019-12-15', '1', '打发斯蒂芬', '0', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(32) NOT NULL,
  `username` varchar(20) default NULL,
  `password` varchar(20) default NULL,
  `name` varchar(20) default NULL,
  `email` varchar(30) default NULL,
  `telephone` varchar(20) default NULL,
  `birthday` date default NULL,
  `sex` varchar(10) default NULL,
  `state` int(11) default NULL,
  `code` varchar(64) default NULL,
  PRIMARY KEY  (`uid`),
  UNIQUE KEY `user` USING BTREE (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('373eb242933b4f5ca3bd43503c34668b', 'ccc', 'ccc', 'aaa', 'bbb@store.com', '15723689921', '2015-11-04', '男', '1', '');
INSERT INTO `user` VALUES ('3ca76a75e4f64db2bacd0974acc7c897', 'bb', 'bb', '张三', 'bbb@store.com', '15723689921', '1990-02-01', '男', '0', '1258e96181a9457987928954825189000bae305094a042d6bd9d2d35674684e6');
INSERT INTO `user` VALUES ('452B97A90F9840DC89610E84CAF75CC6', 'study2', '123', '朱小三', '1154627822@qq.com', null, '2019-12-13', '女', '1', null);
INSERT INTO `user` VALUES ('45E5BDC01FEF4EA8901DF968BA94D525', 'zxc', '456', '水电费覆盖个', '1154627822@qq.com', null, '2019-01-01', '男', '0', 'DE56259AA91140E99C2BC4E89A55A96A');
INSERT INTO `user` VALUES ('62145f6e66ea4f5cbe7b6f6b954917d3', 'cc', 'cc', '张三', 'bbb@store.com', '15723689921', '2015-11-03', '男', '0', '19f100aa81184c03951c4b840a725b6a98097aa1106a4a38ba1c29f1a496c231');
INSERT INTO `user` VALUES ('84CF10DA91CA42429E20FF57E02E94EA', '1', '1', '哥哥', '1154627822@qq.com', null, '2019-12-13', '男', '1', null);
INSERT INTO `user` VALUES ('9580C210D33F41A38985C815151728D0', '哇哦', '123', '隔壁老王', '123456@qq.com', null, '2010-11-12', '男', null, null);
INSERT INTO `user` VALUES ('A47B7701E8E34E9EB997A65FC15B417F', 'user', '123', '姐姐', '1154627822@qq.com', null, '2019-12-07', '女', '1', null);
INSERT INTO `user` VALUES ('B894739B58E342E2A38D9B33B57377B0', 'aaa', '123', '朱大袋', '1154627822@qq.com', null, '2019-12-13', '女', '1', null);
INSERT INTO `user` VALUES ('BED554A133684517A7516DDA105FFA9C', '你好', '12345', '各级', '1154627822@qq.com', null, '2019-12-04', '男', '1', null);
INSERT INTO `user` VALUES ('D64234CDAA564C4CAF988BC233329BDC', 'zxc', '456', '水电费覆盖个', '1154627822@qq.com', null, '2019-01-01', '男', '1', null);
INSERT INTO `user` VALUES ('E6F484FC077F4BEC8385D423E8BE2F86', '你好', '12345', '各级', '1154627822@qq.com', null, '2019-12-04', '男', '0', 'F80FB11A5A514C9DA97594624FE5DCC7');
INSERT INTO `user` VALUES ('F4984DB59DFB4AFB81626A418D55D716', 'qer', '123', '张哥', '1154627822@qq.com', null, '2019-12-05', '男', '1', null);
INSERT INTO `user` VALUES ('f55b7d3a352a4f0782c910b2c70f1ea4', 'aaa', 'aaa', '小王', 'aaa@store.com', '15712344823', '2000-02-01', '男', '1', null);
