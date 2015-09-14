/*
Navicat MySQL Data Transfer

Source Server         : own
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : own

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2015-02-05 13:38:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cartid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `productimageaddrid` int(11) DEFAULT NULL,
  `productprice` float(10,0) DEFAULT NULL,
  `productnumber` int(4) DEFAULT '1',
  `productname` varchar(500) DEFAULT NULL,
  `productattrids` varchar(12) NOT NULL DEFAULT '-1' COMMENT '所选择商品的属性id集合，id之间用竖线"|"隔开即可',
  `skuid` int(11) NOT NULL DEFAULT '-1' COMMENT '选择的商品的skuid,如果是负数,比如-1，则代表加入购物车的商品不是sku商品',
  `shipid` int(11) DEFAULT NULL,
  `createdata` datetime NOT NULL,
  PRIMARY KEY (`cartid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('17', '1', '108', '4', '200', '1', '11111111111111111111111111111111111111', '14|59', '-1', null, '2015-01-16 16:33:01');
INSERT INTO `cart` VALUES ('18', '1', '108', '4', '200', '4', '11111111111111111111111111111111111111', '14|63', '-1', null, '2015-01-16 16:33:50');
INSERT INTO `cart` VALUES ('20', '1', '112', '5', '0', '3', '七匹狼羽绒服 男士外套 2014冬装新款 轻薄款立领羽绒衣 男装正品', '15|66', '-1', null, '2015-01-16 16:49:29');
INSERT INTO `cart` VALUES ('21', '1', '112', '6', '0', '5', '七匹狼羽绒服 男士外套 2014冬装新款 轻薄款立领羽绒衣 男装正品', '14|66', '80', null, '2015-01-16 17:04:50');
INSERT INTO `cart` VALUES ('22', '1', '112', '5', '0', '9', '七匹狼羽绒服 男士外套 2014冬装新款 轻薄款立领羽绒衣 男装正品', '16|66', '82', null, '2015-01-16 17:29:14');
