/*
Navicat MySQL Data Transfer

Source Server         : own
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : own

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2015-02-06 14:56:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(50) NOT NULL,
  `u_password` varchar(50) NOT NULL,
  `u_type` varchar(50) DEFAULT NULL,
  `zctime` datetime NOT NULL,
  `lasttime` datetime NOT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('1', 'admin', 'admin', 'v1', '2013-12-24 00:00:00', '2013-12-26 00:00:00');
INSERT INTO `admin_user` VALUES ('2', 'cisco', 'cisco', 'v1', '2013-12-25 21:49:01', '2013-12-25 21:49:13');
INSERT INTO `admin_user` VALUES ('3', 'my', 'my', 'v2', '2014-01-02 21:49:35', '2014-01-02 21:49:39');
INSERT INTO `admin_user` VALUES ('4', 'yours', 'yours', 'v3', '2013-12-04 21:49:52', '2013-12-06 21:49:56');
INSERT INTO `admin_user` VALUES ('5', 'lili', 'lili', 'v4', '2013-12-28 21:50:13', '2014-02-08 21:50:17');

-- ----------------------------
-- Table structure for `attribute`
-- ----------------------------
DROP TABLE IF EXISTS `attribute`;
CREATE TABLE `attribute` (
  `attr_id` int(11) NOT NULL AUTO_INCREMENT,
  `attr_name` varchar(255) DEFAULT NULL,
  `attr_other_name` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT '所属的类目id',
  `is_color_attr` tinyint(4) DEFAULT NULL,
  `input_style` tinyint(4) DEFAULT NULL,
  `is_global` tinyint(4) DEFAULT NULL,
  `is_key_attr` tinyint(4) DEFAULT NULL,
  `is_sale_attr` tinyint(4) DEFAULT NULL,
  `is_search_attr` tinyint(4) DEFAULT NULL,
  `is_multiselect` tinyint(4) DEFAULT NULL,
  `is_necessary` tinyint(4) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `attr_status` tinyint(4) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attribute
-- ----------------------------
INSERT INTO `attribute` VALUES ('2', 'size', '大小', '2', null, '2', null, null, null, '1', null, null, null, '0', '', null, '', '2014-01-18 20:02:50');
INSERT INTO `attribute` VALUES ('3', 'slajfl', '法律卷发', '3', null, '3', null, null, null, '1', null, null, null, '1', '', null, '', '2014-01-18 20:14:06');
INSERT INTO `attribute` VALUES ('4', 'size', 'size', '47', null, '1', null, null, null, '1', null, null, null, '1', '', null, '', '2014-01-18 20:33:04');
INSERT INTO `attribute` VALUES ('5', '发的发', '发的发', '4', null, '2', null, null, null, '1', null, null, null, '1', '', null, '', '2014-01-18 20:38:21');
INSERT INTO `attribute` VALUES ('6', '发的发', '发的发', '4', null, '2', null, null, null, '1', null, null, null, '1', '', null, '', '2014-01-18 20:39:16');
INSERT INTO `attribute` VALUES ('7', '萨法', '爱到疯', '4', null, '1', null, null, null, '1', null, null, null, '1', '', null, '', '2014-01-18 20:41:50');
INSERT INTO `attribute` VALUES ('8', '萨法', '爱到疯', '4', null, '1', null, null, null, '1', null, null, null, '1', '', null, '', '2014-01-18 20:50:21');
INSERT INTO `attribute` VALUES ('9', '萨法', '爱到疯', '4', null, '2', null, null, null, '1', null, null, null, '1', '', null, '', '2014-01-18 21:12:45');
INSERT INTO `attribute` VALUES ('10', 'size', '大小', '4', null, '2', null, null, null, '1', null, null, null, '1', '', null, '', '2014-01-18 21:13:44');
INSERT INTO `attribute` VALUES ('11', 'sadf', 'asdf', '46', null, '2', null, null, null, '0', null, null, null, '1', 'afsdf', null, 'adfs', '2014-01-18 22:31:51');
INSERT INTO `attribute` VALUES ('12', 'color', 'size', '2', null, '1', null, null, null, '1', null, null, null, '1', '', null, '', '2014-01-19 17:58:45');
INSERT INTO `attribute` VALUES ('13', 'color', 'size', '2', null, '2', null, null, null, '1', null, null, null, '1', '', null, '', '2014-01-19 17:59:13');
INSERT INTO `attribute` VALUES ('14', 'jlj', 'hkkh', '2', null, '3', null, null, null, '1', null, null, null, '1', '喝可乐甲基硫菌灵将了', null, '喝可乐甲基硫菌灵将了', '2014-01-19 19:44:23');
INSERT INTO `attribute` VALUES ('15', 'jjjjj', 'jjjjj', '2', null, '2', null, null, null, '1', null, null, null, '0', '', null, '', '2014-01-19 19:47:09');
INSERT INTO `attribute` VALUES ('16', 'jljlj', 'kljlkj', '4', null, '2', null, null, null, '1', null, null, null, '0', '', null, '', '2014-01-19 19:48:03');
INSERT INTO `attribute` VALUES ('17', '版本', '版本', '2', null, '1', null, null, null, '1', null, null, null, '0', '萨芬', null, '萨芬', '2014-08-12 14:13:31');
INSERT INTO `attribute` VALUES ('18', '版本', '版本', '2', null, '1', null, null, null, '1', null, null, null, '0', '萨芬', null, '萨芬', '2014-08-12 14:16:55');
INSERT INTO `attribute` VALUES ('19', '版本', '版本', '2', null, '2', null, null, null, '1', null, null, null, '0', '萨芬', null, '萨芬', '2014-08-12 14:17:22');
INSERT INTO `attribute` VALUES ('20', '臭臭', 'cc', '2', null, '2', null, null, null, '1', null, null, null, '1', '', null, '', '2014-08-12 14:20:20');
INSERT INTO `attribute` VALUES ('21', '臭臭', 'cc', '2', null, '2', null, null, null, '1', null, null, null, '1', '', null, '', '2014-08-12 16:32:55');
INSERT INTO `attribute` VALUES ('22', '臭臭', 'cc', '2', null, '2', null, null, null, '1', null, null, null, '1', '', null, '', '2014-08-12 16:35:23');
INSERT INTO `attribute` VALUES ('23', 'aa', null, '2', null, '1', '0', null, null, '1', null, null, null, '1', null, null, null, '2014-09-20 18:35:49');
INSERT INTO `attribute` VALUES ('24', 'aa', null, '2', null, '1', '0', null, null, '1', null, null, null, '1', null, null, null, '2014-09-20 18:45:16');
INSERT INTO `attribute` VALUES ('25', 'aa', null, '2', null, '2', '0', null, null, '1', null, null, null, '1', null, null, null, '2014-09-20 18:46:46');
INSERT INTO `attribute` VALUES ('26', 'aa', null, '2', null, '2', '0', null, null, '1', null, null, null, '1', null, null, null, '2014-09-20 18:49:31');
INSERT INTO `attribute` VALUES ('27', 'aa', null, '2', null, '2', '0', null, null, '1', null, null, null, '1', null, null, null, '2014-09-20 19:03:20');
INSERT INTO `attribute` VALUES ('28', 'aa', null, '2', null, '1', '0', null, null, '1', null, null, null, '1', null, null, null, '2014-09-20 19:05:58');
INSERT INTO `attribute` VALUES ('29', 'aa', null, '2', null, '2', '0', null, null, '1', null, null, null, '1', null, null, null, '2014-09-20 19:06:14');
INSERT INTO `attribute` VALUES ('30', 'bbccc发送端', null, '2', null, '2', '1', null, null, '0', null, null, null, '0', null, null, null, '2014-09-20 19:13:49');
INSERT INTO `attribute` VALUES ('31', '68686', null, '2', null, '2', '0', null, null, '1', null, null, null, '1', null, null, null, '2014-10-09 19:30:57');
INSERT INTO `attribute` VALUES ('32', 'fad', null, '2', null, '2', '0', null, null, '1', null, null, null, '1', null, null, null, '2014-10-09 22:29:22');
INSERT INTO `attribute` VALUES ('33', '9890', null, '2', null, '1', '0', null, null, '1', null, null, null, '1', null, null, null, '2014-10-10 21:10:07');
INSERT INTO `attribute` VALUES ('34', '98901', null, '2', null, '2', '0', null, null, '1', null, null, null, '1', null, null, null, '2014-10-10 21:11:27');
INSERT INTO `attribute` VALUES ('35', 'aa', null, '2', null, '1', '0', null, null, '1', null, null, null, '1', null, null, null, '2014-10-20 21:36:04');
INSERT INTO `attribute` VALUES ('36', 'xx', null, '-1', null, '2', '1', null, null, '1', null, null, null, '1', null, null, null, '2014-10-21 10:15:46');
INSERT INTO `attribute` VALUES ('37', 'xx', null, '-1', null, '1', '1', null, null, '1', null, null, null, '1', null, null, null, '2014-10-21 10:21:25');
INSERT INTO `attribute` VALUES ('38', 'xx', null, '-1', null, '1', '1', null, null, '1', null, null, null, '1', null, null, null, '2014-10-21 10:22:29');
INSERT INTO `attribute` VALUES ('39', 'xx', null, '1', null, '2', '1', null, null, '1', null, null, null, '1', null, null, null, '2014-10-21 10:23:46');
INSERT INTO `attribute` VALUES ('40', 'gg', null, '1', null, '1', '1', null, null, '1', null, null, null, '1', null, null, null, '2014-12-08 10:18:57');
INSERT INTO `attribute` VALUES ('41', '大小', null, '2', null, '2', '0', null, null, '1', null, null, null, '1', null, null, null, '2015-01-16 16:44:49');

-- ----------------------------
-- Table structure for `attributemultilanguage`
-- ----------------------------
DROP TABLE IF EXISTS `attributemultilanguage`;
CREATE TABLE `attributemultilanguage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lan_id` int(11) NOT NULL,
  `attr_id` int(11) NOT NULL,
  `foreign_name` varchar(255) DEFAULT NULL,
  `foreign_title` varchar(255) DEFAULT NULL,
  `foreign_keywords` varchar(255) DEFAULT NULL COMMENT '所属的类目id',
  `foreign_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attributemultilanguage
-- ----------------------------
INSERT INTO `attributemultilanguage` VALUES ('24', '0', '2', 'size', '大小', '2', null);
INSERT INTO `attributemultilanguage` VALUES ('25', '0', '3', 'slajfl', '法律卷发', '47', null);
INSERT INTO `attributemultilanguage` VALUES ('26', '0', '4', 'size', 'size', '47', null);
INSERT INTO `attributemultilanguage` VALUES ('27', '0', '5', '发的发', '发的发', '4', null);
INSERT INTO `attributemultilanguage` VALUES ('28', '0', '6', '发的发', '发的发', '4', null);
INSERT INTO `attributemultilanguage` VALUES ('29', '0', '7', '萨法', '爱到疯', '4', null);
INSERT INTO `attributemultilanguage` VALUES ('30', '0', '8', '萨法', '爱到疯', '4', null);
INSERT INTO `attributemultilanguage` VALUES ('31', '0', '9', '萨法', '爱到疯', '4', null);
INSERT INTO `attributemultilanguage` VALUES ('32', '0', '10', 'size', '大小', '4', null);
INSERT INTO `attributemultilanguage` VALUES ('33', '0', '11', 'sadf', 'asdf', '46', null);
INSERT INTO `attributemultilanguage` VALUES ('34', '0', '12', 'color', 'size', '2', null);
INSERT INTO `attributemultilanguage` VALUES ('35', '7', '13', 'color', 'size', '2', null);
INSERT INTO `attributemultilanguage` VALUES ('36', '0', '14', 'jlj', 'hkkh', '2', null);
INSERT INTO `attributemultilanguage` VALUES ('37', '0', '15', 'jjjjj', 'jjjjj', '2', null);
INSERT INTO `attributemultilanguage` VALUES ('38', '0', '16', 'jljlj', 'kljlkj', '4', null);
INSERT INTO `attributemultilanguage` VALUES ('39', '0', '17', '版本', '版本', '2', null);
INSERT INTO `attributemultilanguage` VALUES ('40', '0', '18', '版本', '版本', '2', null);
INSERT INTO `attributemultilanguage` VALUES ('41', '0', '19', '版本', '版本', '2', null);
INSERT INTO `attributemultilanguage` VALUES ('42', '0', '20', '臭臭', 'cc', '2', null);
INSERT INTO `attributemultilanguage` VALUES ('43', '0', '21', '臭臭', 'cc', '2', null);
INSERT INTO `attributemultilanguage` VALUES ('44', '0', '22', '臭臭', 'cc', '2', null);
INSERT INTO `attributemultilanguage` VALUES ('45', '7', '23', 'aaa1', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('46', '8', '23', 'aaa2', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('47', '7', '24', 'aaa1', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('48', '8', '24', 'aaa2', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('49', '7', '25', 'aaa1', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('50', '8', '25', 'aaa2', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('51', '7', '26', 'aaa1', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('52', '8', '26', 'aaa2', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('53', '7', '28', 'aa1', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('54', '8', '28', 'aa2', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('55', '7', '29', 'aa1', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('56', '8', '29', 'aa2', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('57', '7', '30', 'bb1', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('58', '8', '30', 'bb2', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('59', '7', '31', '一样', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('60', '8', '31', '69879', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('61', '7', '32', 'af', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('62', '8', '32', 'adf', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('63', '7', '33', '99', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('64', '8', '33', '808', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('65', '7', '34', '99', 'fads', 'fads', '');
INSERT INTO `attributemultilanguage` VALUES ('66', '8', '34', '808', 'fd', '', '');
INSERT INTO `attributemultilanguage` VALUES ('67', '7', '35', '信息', '信息', '', '');
INSERT INTO `attributemultilanguage` VALUES ('68', '8', '35', '安分', 'ASF', '', '');
INSERT INTO `attributemultilanguage` VALUES ('69', '7', '36', 'xx', 'xx', '', '');
INSERT INTO `attributemultilanguage` VALUES ('70', '8', '36', 'xx', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('71', '7', '37', 'sadfsaf', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('72', '8', '37', 'sdf', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('73', '7', '38', 'sadf', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('74', '8', '38', 'sadf', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('76', '8', '39', 'sdfasdf', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('77', '7', '39', 'fsadfsdf', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('78', '7', '40', 'asdfsaf', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('79', '8', '40', 'sadfsaf', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('80', '9', '40', 'fasd', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('81', '7', '41', 'size', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('82', '8', '41', 'sizeru', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('83', '9', '41', 'sizefr', '', '', '');

-- ----------------------------
-- Table structure for `attribute_value`
-- ----------------------------
DROP TABLE IF EXISTS `attribute_value`;
CREATE TABLE `attribute_value` (
  `attr_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `attr_value_name` varchar(255) DEFAULT NULL,
  `attr_id` int(11) DEFAULT NULL,
  `attr_status` tinyint(4) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`attr_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attribute_value
-- ----------------------------
INSERT INTO `attribute_value` VALUES ('1', '你好', '9', null, '4', null, '2014-01-18 21:12:45');
INSERT INTO `attribute_value` VALUES ('2', 'aas', '9', null, '4', null, '2014-01-18 21:12:45');
INSERT INTO `attribute_value` VALUES ('3', '我的', '3', null, '4', null, '2014-01-18 21:12:45');
INSERT INTO `attribute_value` VALUES ('4', '那里', '3', null, '4', null, '2014-01-18 21:12:45');
INSERT INTO `attribute_value` VALUES ('5', '33', '10', null, '4', null, '2014-01-18 21:13:44');
INSERT INTO `attribute_value` VALUES ('6', '34', '10', null, '4', null, '2014-01-18 21:13:44');
INSERT INTO `attribute_value` VALUES ('7', '36', '10', null, '4', null, '2014-01-18 21:13:44');
INSERT INTO `attribute_value` VALUES ('8', '37', '10', null, '4', null, '2014-01-18 21:13:44');
INSERT INTO `attribute_value` VALUES ('9', '38', '10', null, '4', null, '2014-01-18 21:13:44');
INSERT INTO `attribute_value` VALUES ('10', 'nihao ', '11', null, '46', null, '2014-01-18 22:31:51');
INSERT INTO `attribute_value` VALUES ('11', 'dajai hao ', '11', null, '46', null, '2014-01-18 22:31:51');
INSERT INTO `attribute_value` VALUES ('12', 'jafd', '11', null, '46', null, '2014-01-18 22:31:51');
INSERT INTO `attribute_value` VALUES ('13', 'faklds', '11', null, '46', null, '2014-01-18 22:31:51');
INSERT INTO `attribute_value` VALUES ('14', '红', '13', null, '2', null, '2014-01-19 17:59:13');
INSERT INTO `attribute_value` VALUES ('15', '慌', '13', null, '2', null, '2014-01-19 17:59:13');
INSERT INTO `attribute_value` VALUES ('16', '绿', '13', null, '2', null, '2014-01-19 17:59:13');
INSERT INTO `attribute_value` VALUES ('17', '蓝', '13', null, '2', null, '2014-01-19 17:59:13');
INSERT INTO `attribute_value` VALUES ('18', '清', '13', null, '2', null, '2014-01-19 17:59:13');
INSERT INTO `attribute_value` VALUES ('19', 'jjj', '15', null, '2', null, '2014-01-19 19:47:09');
INSERT INTO `attribute_value` VALUES ('20', 'jjjjkkk', '15', null, '2', null, '2014-01-19 19:47:09');
INSERT INTO `attribute_value` VALUES ('21', 'jjj', '15', null, '2', null, '2014-01-19 19:47:09');
INSERT INTO `attribute_value` VALUES ('23', 'jjjj', '15', null, '2', null, '2014-01-19 19:47:09');
INSERT INTO `attribute_value` VALUES ('24', 'lkkkljl', '16', null, '4', null, '2014-01-19 19:48:03');
INSERT INTO `attribute_value` VALUES ('25', 'kljlj', '16', null, '4', null, '2014-01-19 19:48:03');
INSERT INTO `attribute_value` VALUES ('26', 'kljlj', '16', null, '4', null, '2014-01-19 19:48:03');
INSERT INTO `attribute_value` VALUES ('27', 'jljl', '16', null, '4', null, '2014-01-19 19:48:03');
INSERT INTO `attribute_value` VALUES ('35', '臭臭', '20', null, '2', null, '2014-08-12 14:20:20');
INSERT INTO `attribute_value` VALUES ('36', '臭臭', '20', null, '2', null, '2014-08-12 14:20:20');
INSERT INTO `attribute_value` VALUES ('37', 'aaav', '25', null, '2', null, '2014-09-20 18:46:54');
INSERT INTO `attribute_value` VALUES ('38', 'aaav', '26', null, '2', null, '2014-09-20 18:49:46');
INSERT INTO `attribute_value` VALUES ('39', 'aav', '29', null, '2', null, '2014-09-20 19:06:29');
INSERT INTO `attribute_value` VALUES ('40', 'bbv', '30', null, '2', null, '2014-09-20 19:13:57');
INSERT INTO `attribute_value` VALUES ('41', '69641', '31', null, '2', null, '2014-10-09 19:30:57');
INSERT INTO `attribute_value` VALUES ('42', '6964645', '31', null, '2', null, '2014-10-09 19:30:57');
INSERT INTO `attribute_value` VALUES ('43', '69', '31', null, '2', null, '2014-10-09 19:30:57');
INSERT INTO `attribute_value` VALUES ('44', 'af', '32', null, '2', null, '2014-10-09 22:29:22');
INSERT INTO `attribute_value` VALUES ('49', '987', '33', null, '2', null, '2014-10-10 21:23:42');
INSERT INTO `attribute_value` VALUES ('53', '1456khk', '34', null, '2', null, '2014-10-10 22:47:48');
INSERT INTO `attribute_value` VALUES ('54', 'kkkhert111', '34', null, '2', null, '2014-10-10 23:26:23');
INSERT INTO `attribute_value` VALUES ('55', '试试', '35', null, '2', null, '2014-10-20 21:36:05');
INSERT INTO `attribute_value` VALUES ('56', '试试顺丰', '35', null, '2', null, '2014-10-20 21:36:05');
INSERT INTO `attribute_value` VALUES ('57', 'afds', '35', null, '2', null, '2014-10-20 21:36:05');
INSERT INTO `attribute_value` VALUES ('58', 'asfd', '36', null, '-1', null, '2014-10-21 10:15:46');
INSERT INTO `attribute_value` VALUES ('59', '391', '39', null, '1', null, '2014-10-21 10:24:24');
INSERT INTO `attribute_value` VALUES ('60', '392', '39', null, '1', null, '2014-10-21 10:24:27');
INSERT INTO `attribute_value` VALUES ('61', '393', '39', null, '1', null, '2014-10-21 10:27:11');
INSERT INTO `attribute_value` VALUES ('62', '394', '39', null, '1', null, '2014-10-21 10:29:25');
INSERT INTO `attribute_value` VALUES ('63', '395', '39', null, '1', null, '2014-10-21 10:30:39');
INSERT INTO `attribute_value` VALUES ('64', '351', '35', null, '2', null, '2014-10-21 10:31:39');
INSERT INTO `attribute_value` VALUES ('65', '396', '39', null, '1', null, '2014-10-21 10:35:27');
INSERT INTO `attribute_value` VALUES ('66', 'M', '41', null, '2', null, '2015-01-16 16:44:49');
INSERT INTO `attribute_value` VALUES ('67', 'L', '41', null, '2', null, '2015-01-16 16:44:49');
INSERT INTO `attribute_value` VALUES ('68', 'XXL', '41', null, '2', null, '2015-01-16 16:44:49');

-- ----------------------------
-- Table structure for `attribute_valuemultilanguage`
-- ----------------------------
DROP TABLE IF EXISTS `attribute_valuemultilanguage`;
CREATE TABLE `attribute_valuemultilanguage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lan_id` int(11) NOT NULL,
  `attr_value_id` int(11) NOT NULL,
  `foreign_name` varchar(255) DEFAULT NULL,
  `foreign_title` varchar(255) DEFAULT NULL,
  `foreign_keywords` varchar(255) DEFAULT NULL,
  `foreign_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attribute_valuemultilanguage
-- ----------------------------
INSERT INTO `attribute_valuemultilanguage` VALUES ('37', '0', '1', '你好', '9', null, '4');
INSERT INTO `attribute_valuemultilanguage` VALUES ('38', '0', '2', '好的', '9', null, '4');
INSERT INTO `attribute_valuemultilanguage` VALUES ('39', '0', '3', '我的', '9', null, '4');
INSERT INTO `attribute_valuemultilanguage` VALUES ('40', '0', '4', '那里', '9', null, '4');
INSERT INTO `attribute_valuemultilanguage` VALUES ('41', '0', '5', '33', '10', null, '4');
INSERT INTO `attribute_valuemultilanguage` VALUES ('42', '0', '6', '34', '10', null, '4');
INSERT INTO `attribute_valuemultilanguage` VALUES ('43', '0', '7', '36', '10', null, '4');
INSERT INTO `attribute_valuemultilanguage` VALUES ('44', '0', '8', '37', '10', null, '4');
INSERT INTO `attribute_valuemultilanguage` VALUES ('45', '0', '9', '38', '10', null, '4');
INSERT INTO `attribute_valuemultilanguage` VALUES ('46', '0', '10', 'nihao ', '11', null, '46');
INSERT INTO `attribute_valuemultilanguage` VALUES ('47', '0', '11', 'dajai hao ', '11', null, '46');
INSERT INTO `attribute_valuemultilanguage` VALUES ('48', '0', '12', 'jafd', '11', null, '46');
INSERT INTO `attribute_valuemultilanguage` VALUES ('49', '7', '13', 'faklds', '11', null, '46');
INSERT INTO `attribute_valuemultilanguage` VALUES ('50', '7', '14', '红', '13', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('51', '7', '15', '慌', '13', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('52', '7', '16', '绿', '13', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('53', '7', '17', '蓝', '13', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('54', '7', '18', '清', '13', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('55', '7', '19', 'jjj', '15', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('56', '7', '20', 'jjjjkkk', '15', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('57', '7', '21', 'jjj', '15', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('59', '7', '23', 'jjjj', '15', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('60', '7', '24', 'lkkkljl', '16', null, '4');
INSERT INTO `attribute_valuemultilanguage` VALUES ('61', '7', '25', 'kljlj', '16', null, '4');
INSERT INTO `attribute_valuemultilanguage` VALUES ('62', '7', '26', 'kljlj', '16', null, '4');
INSERT INTO `attribute_valuemultilanguage` VALUES ('63', '7', '27', 'jljl', '16', null, '4');
INSERT INTO `attribute_valuemultilanguage` VALUES ('70', '7', '35', '臭臭', '20', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('71', '7', '36', '臭臭', '20', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('72', '7', '39', 'aav1', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('73', '8', '39', 'aav2', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('74', '7', '40', 'bbv1', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('75', '8', '40', 'bbv2', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('76', '7', '41', '65847', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('77', '8', '41', '564645', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('78', '7', '42', '65847', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('79', '8', '42', '564645', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('80', '7', '43', '65847', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('81', '8', '43', '564645', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('82', '7', '44', 'af', 'af', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('83', '8', '44', 'fad', 'afd', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('92', '7', '49', '', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('93', '8', '49', '', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('100', '7', '53', '1456', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('101', '8', '53', '1456', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('102', '7', '54', '', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('103', '8', '54', '', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('104', '7', '55', '试试', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('105', '8', '55', '', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('106', '7', '56', '试试', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('107', '8', '56', '', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('108', '7', '57', '试试', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('109', '8', '57', '', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('110', '7', '58', 'asdf', 'sadf', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('111', '8', '58', 'sf', 'sdf', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('112', '7', '59', 'afaf', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('113', '8', '59', 'sadf', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('114', '7', '60', 'saf', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('115', '8', '60', 'asfd', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('116', '7', '61', 'sadf', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('117', '8', '61', 'asdf', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('118', '7', '62', 'asfd', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('119', '8', '62', 'saf', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('120', '7', '63', 'safd', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('121', '8', '63', 'asfd', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('122', '7', '64', 'xx', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('123', '8', '64', 'safd', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('124', '7', '65', 'sadf', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('125', '8', '65', 'safd', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('126', '7', '66', 'M', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('127', '8', '66', 'M', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('128', '9', '66', 'M', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('129', '7', '67', 'L', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('130', '8', '67', 'L', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('131', '9', '67', 'L', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('132', '7', '68', 'XXL', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('133', '8', '68', 'XXL', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('134', '9', '68', 'XXL', '', '', '');

-- ----------------------------
-- Table structure for `brandmultilanguage`
-- ----------------------------
DROP TABLE IF EXISTS `brandmultilanguage`;
CREATE TABLE `brandmultilanguage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lan_id` int(11) NOT NULL COMMENT '对应语言的id',
  `brand_id` int(11) NOT NULL COMMENT '外键，对应分类的某一个id',
  `foreign_name` varchar(255) NOT NULL,
  `foreign_title` varchar(255) NOT NULL,
  `foreign_keywords` varchar(255) NOT NULL,
  `foreign_description` varchar(255) NOT NULL,
  `createtime` datetime NOT NULL,
  `modifytime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brandmultilanguage
-- ----------------------------
INSERT INTO `brandmultilanguage` VALUES ('5', '7', '30', '22', '22', '22', '22', '2014-09-02 18:17:50', '2014-09-02 18:17:50');
INSERT INTO `brandmultilanguage` VALUES ('6', '7', '30', '22', '22', '22', '22', '2014-09-02 18:17:51', '2014-09-02 18:17:51');
INSERT INTO `brandmultilanguage` VALUES ('9', '7', '33', 'xx', 'xx', 'xx', 'xx', '2014-09-09 16:05:30', '2014-09-09 16:05:30');
INSERT INTO `brandmultilanguage` VALUES ('10', '8', '33', 'xx', 'xx', 'xx', 'xx', '2014-09-09 16:05:30', '2014-09-09 16:05:30');
INSERT INTO `brandmultilanguage` VALUES ('21', '7', '34', '23', '23', '3', '434', '2014-09-10 14:22:47', '2014-09-10 14:22:47');
INSERT INTO `brandmultilanguage` VALUES ('22', '8', '34', '4', '343', '43', '434', '2014-09-10 14:22:47', '2014-09-10 14:22:47');
INSERT INTO `brandmultilanguage` VALUES ('23', '7', '35', '2', '2', '2', '2', '2014-09-10 14:44:15', '2014-09-10 14:44:15');
INSERT INTO `brandmultilanguage` VALUES ('24', '8', '35', 'w', 'erw', 'wer', 'wer', '2014-09-10 14:44:15', '2014-09-10 14:44:15');
INSERT INTO `brandmultilanguage` VALUES ('25', '7', '36', '343', '34', '34', '34', '2014-09-10 14:44:31', '2014-09-10 14:44:31');
INSERT INTO `brandmultilanguage` VALUES ('26', '8', '36', 'type=text', 'type=text', 'type=text', 'type=text', '2014-09-10 14:44:31', '2014-09-10 14:44:31');
INSERT INTO `brandmultilanguage` VALUES ('27', '7', '37', '23', '23', '32', '3', '2014-09-10 15:06:20', '2014-09-10 15:06:20');
INSERT INTO `brandmultilanguage` VALUES ('28', '8', '37', '', '', '', '', '2014-09-10 15:06:20', '2014-09-10 15:06:20');
INSERT INTO `brandmultilanguage` VALUES ('29', '7', '38', '', '', '', '', '2014-09-20 19:53:51', '2014-09-20 19:53:51');
INSERT INTO `brandmultilanguage` VALUES ('30', '8', '38', '', '', '', '', '2014-09-20 19:53:51', '2014-09-20 19:53:51');
INSERT INTO `brandmultilanguage` VALUES ('31', '7', '39', '', '', '', '', '2014-09-20 19:54:38', '2014-09-20 19:54:38');
INSERT INTO `brandmultilanguage` VALUES ('32', '8', '39', '', '', '', '', '2014-09-20 19:54:38', '2014-09-20 19:54:38');
INSERT INTO `brandmultilanguage` VALUES ('33', '7', '40', 'sf', '', '', '', '2014-10-21 10:34:48', '2014-10-21 10:34:48');
INSERT INTO `brandmultilanguage` VALUES ('34', '8', '40', '', '', '', '', '2014-10-21 10:34:48', '2014-10-21 10:34:48');

-- ----------------------------
-- Table structure for `brand_series`
-- ----------------------------
DROP TABLE IF EXISTS `brand_series`;
CREATE TABLE `brand_series` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) DEFAULT NULL,
  `brand_name` varchar(255) DEFAULT NULL,
  `parent_brand_id` int(11) DEFAULT NULL COMMENT '父亲的brand _id',
  `is_parent` tinyint(4) DEFAULT NULL COMMENT '是否是父亲',
  `brand_logo` varchar(255) DEFAULT NULL,
  `brand_title` varchar(255) DEFAULT NULL,
  `brand_keywords` varchar(255) DEFAULT NULL,
  `brand_description` varchar(255) DEFAULT NULL,
  `brand_status` tinyint(4) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand_series
-- ----------------------------
INSERT INTO `brand_series` VALUES ('1', '2', 'lvlvlv', '0', '1', null, '阿斯顿发顺丰', '阿斯顿发顺丰', 'aaaaaaaaaaa', '1', '2014-01-11 14:48:05');
INSERT INTO `brand_series` VALUES ('21', '2', '啊范德萨发顺丰', '20', '0', null, '', '', '啊佛挡杀佛', null, '2014-01-14 23:31:48');
INSERT INTO `brand_series` VALUES ('23', '2', '啊佛挡杀佛', '1', '1', null, '法第三方', '', '发的说法', null, '2014-01-14 23:47:01');
INSERT INTO `brand_series` VALUES ('25', '2', 'asfsfd', '0', '0', null, '阿飞的飞', '法定分', '阿凡达', null, '2014-01-18 19:20:34');
INSERT INTO `brand_series` VALUES ('27', '4', 'sssssssss', '0', '1', null, 'ssssssss', 'ssssssss', 'ssssssss', null, '2014-01-18 22:30:46');
INSERT INTO `brand_series` VALUES ('28', '4', 'sssssssss', '0', '0', null, 'ssssssss', 'ssssssss', 'ssssssss', null, '2014-01-18 22:30:49');
INSERT INTO `brand_series` VALUES ('29', '4', 'dddddddd', '27', '0', null, 'ddd', 'dd', 'dafdasf', null, '2014-01-18 22:31:02');
INSERT INTO `brand_series` VALUES ('30', '2', '士大夫', '0', '0', null, null, null, null, '1', '2014-09-02 18:17:49');
INSERT INTO `brand_series` VALUES ('33', '55', 'xx', '0', '0', null, null, null, null, '0', '2014-09-09 16:05:30');
INSERT INTO `brand_series` VALUES ('34', '2', '12345678', '0', '0', null, null, null, null, '0', '2014-09-10 14:22:47');
INSERT INTO `brand_series` VALUES ('35', '2', '999', '0', '0', null, null, null, null, '0', '2014-09-10 14:44:15');
INSERT INTO `brand_series` VALUES ('36', '2', '789', '0', '0', null, null, null, null, '1', '2014-09-10 14:44:31');
INSERT INTO `brand_series` VALUES ('37', '2', '22', '23', '0', null, null, null, null, '1', '2014-09-10 15:06:20');
INSERT INTO `brand_series` VALUES ('38', '2', '56', '1', '0', null, null, null, null, '0', '2014-09-20 19:53:51');
INSERT INTO `brand_series` VALUES ('39', '2', 'cvcvb', '1', '0', null, null, null, null, '1', '2014-09-20 19:54:38');
INSERT INTO `brand_series` VALUES ('40', '2', 'asdf', '0', '0', null, null, null, null, '0', '2014-10-21 10:34:48');

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('20', '1', '112', '5', '0', '3', '七匹狼羽绒服 男士外套 2014冬装新款 轻薄款立领羽绒衣 男装正品', '15|66', '-1', '4', '2015-01-16 16:49:29');
INSERT INTO `cart` VALUES ('21', '1', '112', '6', '0', '5', '七匹狼羽绒服 男士外套 2014冬装新款 轻薄款立领羽绒衣 男装正品', '14|66', '80', null, '2015-01-16 17:04:50');
INSERT INTO `cart` VALUES ('22', '1', '112', '5', '0', '10', '七匹狼羽绒服 男士外套 2014冬装新款 轻薄款立领羽绒衣 男装正品', '16|66', '82', '1', '2015-01-16 17:29:14');
INSERT INTO `cart` VALUES ('23', '1', '108', '7', '200', '1', '11111111111111111111111111111111111111', '15|60', '-1', null, '2015-02-05 14:21:45');

-- ----------------------------
-- Table structure for `cartproductattr`
-- ----------------------------
DROP TABLE IF EXISTS `cartproductattr`;
CREATE TABLE `cartproductattr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cartid` int(11) NOT NULL,
  `attrid` int(11) DEFAULT NULL COMMENT '属性id',
  `attrvalueid` int(11) NOT NULL COMMENT '属性值id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cartproductattr
-- ----------------------------
INSERT INTO `cartproductattr` VALUES ('23', '17', null, '14');
INSERT INTO `cartproductattr` VALUES ('24', '17', null, '59');
INSERT INTO `cartproductattr` VALUES ('25', '18', null, '14');
INSERT INTO `cartproductattr` VALUES ('26', '18', null, '63');
INSERT INTO `cartproductattr` VALUES ('27', '19', null, '14');
INSERT INTO `cartproductattr` VALUES ('28', '19', null, '66');
INSERT INTO `cartproductattr` VALUES ('29', '20', null, '15');
INSERT INTO `cartproductattr` VALUES ('30', '20', null, '66');
INSERT INTO `cartproductattr` VALUES ('31', '21', null, '14');
INSERT INTO `cartproductattr` VALUES ('32', '21', null, '66');
INSERT INTO `cartproductattr` VALUES ('33', '22', null, '16');
INSERT INTO `cartproductattr` VALUES ('34', '22', null, '66');
INSERT INTO `cartproductattr` VALUES ('35', '23', null, '15');
INSERT INTO `cartproductattr` VALUES ('36', '23', null, '60');

-- ----------------------------
-- Table structure for `cartproductimage`
-- ----------------------------
DROP TABLE IF EXISTS `cartproductimage`;
CREATE TABLE `cartproductimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) NOT NULL,
  `productimageaddr` varchar(100) NOT NULL,
  `productimageindexcount` int(11) DEFAULT NULL COMMENT '有多少购物车在引用这个图片,当为0时需要删除此图片',
  `productattrs` varchar(100) DEFAULT '-1' COMMENT '用|分隔的所属商品的属性,默认值为-1',
  `createdata` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cartproductimage
-- ----------------------------
INSERT INTO `cartproductimage` VALUES ('5', '112', 'shopCartImage\\2015011616482299819.jpg', '3', '-1', '2015-01-16 16:48:22');
INSERT INTO `cartproductimage` VALUES ('6', '112', 'shopCartImage\\2015011617045048582.jpg', '1', '14|66', '2015-01-16 17:04:50');
INSERT INTO `cartproductimage` VALUES ('7', '108', 'shopCartImage\\2015020514214526326.jpg', '1', '-1', '2015-02-05 14:21:45');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `category_father_id` int(11) NOT NULL,
  `category_other_name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `is_father` tinyint(4) NOT NULL DEFAULT '0',
  `is_show` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否在网页中显示（包括页面中的图片）',
  `icon` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `imagesize` tinyint(4) DEFAULT '3' COMMENT '在商品页面展示的图片大小',
  `title` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '商品分类', '0', '商品类目', null, '1', '0', null, '3', '0', null, null, null, '2013-12-28 11:29:32');
INSERT INTO `category` VALUES ('2', 'aa', '1', null, '0', '1', '1', '', '', '1', null, null, null, '2014-12-12 16:37:26');
INSERT INTO `category` VALUES ('3', 'bb', '1', null, '0', '0', '0', '', '', '1', null, null, null, '2014-12-12 16:37:36');
INSERT INTO `category` VALUES ('4', 'cc', '1', null, '0', '1', '1', '', '', '1', null, null, null, '2014-12-12 16:37:47');
INSERT INTO `category` VALUES ('5', 'aa1', '2', null, '0', '1', '1', '', '', '1', null, null, null, '2014-12-12 16:38:19');
INSERT INTO `category` VALUES ('6', 'aa2', '2', null, '0', '1', '1', '', '', '1', null, null, null, '2014-12-12 16:38:27');
INSERT INTO `category` VALUES ('7', 'aa3', '5', null, '0', '0', '0', '', '', '1', null, null, null, '2014-12-12 16:46:40');
INSERT INTO `category` VALUES ('8', 'aa31', '6', null, '0', '0', '1', '', '', '1', null, null, null, '2014-12-12 16:46:56');
INSERT INTO `category` VALUES ('9', 'cc1', '4', null, '0', '0', '1', '', '', '1', null, null, null, '2014-12-12 17:22:10');

-- ----------------------------
-- Table structure for `categoryimage`
-- ----------------------------
DROP TABLE IF EXISTS `categoryimage`;
CREATE TABLE `categoryimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) NOT NULL,
  `imgsrc` varchar(255) DEFAULT NULL,
  `imghref` varchar(255) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL COMMENT '1:轮播图  2：下面小图',
  `used` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categoryimage
-- ----------------------------
INSERT INTO `categoryimage` VALUES ('1', '2', 'upload\\categoryImage\\2014111916292267852.jpg', '4323', '1', '0');
INSERT INTO `categoryimage` VALUES ('2', '2', 'upload\\categoryImage\\2014111916303910733.jpg', '4323', '1', '0');
INSERT INTO `categoryimage` VALUES ('3', '2', 'upload\\categoryImage\\2014111916590141162.jpg', null, '0', '0');
INSERT INTO `categoryimage` VALUES ('4', '2', 'upload\\categoryImage\\2014111917010874811.jpg', null, '0', '0');
INSERT INTO `categoryimage` VALUES ('5', '2', 'upload\\categoryImage\\2014111917024660175.jpg', null, '0', '0');
INSERT INTO `categoryimage` VALUES ('6', '2', 'upload\\categoryImage\\2014111917074074630.jpg', null, '1', '0');
INSERT INTO `categoryimage` VALUES ('7', '2', 'upload\\categoryImage\\2014111917083358560.jpg', null, '1', '0');
INSERT INTO `categoryimage` VALUES ('8', '2', 'upload/foregroundImage/2014112010470973447.jpg', '11111111', '1', '0');
INSERT INTO `categoryimage` VALUES ('10', '4', 'upload\\categoryImage\\2014112010512189654.jpg', '1122', '0', '0');
INSERT INTO `categoryimage` VALUES ('13', '74', 'upload\\categoryImage\\2014112814452382627.jpg', '222', '1', '0');

-- ----------------------------
-- Table structure for `categorymultilanguage`
-- ----------------------------
DROP TABLE IF EXISTS `categorymultilanguage`;
CREATE TABLE `categorymultilanguage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lan_id` int(11) NOT NULL COMMENT '对应语言的id',
  `category_id` int(11) NOT NULL COMMENT '外键，对应分类的某一个id',
  `foreign_name` varchar(255) NOT NULL,
  `foreign_title` varchar(255) NOT NULL,
  `foreign_keywords` varchar(255) NOT NULL,
  `foreign_description` varchar(255) NOT NULL,
  `createtime` datetime NOT NULL,
  `modifytime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categorymultilanguage
-- ----------------------------
INSERT INTO `categorymultilanguage` VALUES ('113', '7', '2', 'aa', '', '', '', '2014-12-12 16:37:26', '2014-12-12 16:37:26');
INSERT INTO `categorymultilanguage` VALUES ('114', '8', '2', '', '', '', '', '2014-12-12 16:37:26', '2014-12-12 16:37:26');
INSERT INTO `categorymultilanguage` VALUES ('115', '9', '2', '', '', '', '', '2014-12-12 16:37:26', '2014-12-12 16:37:26');
INSERT INTO `categorymultilanguage` VALUES ('116', '7', '3', 'bb', '', '', '', '2014-12-12 16:37:37', '2014-12-12 16:37:37');
INSERT INTO `categorymultilanguage` VALUES ('117', '8', '3', '', '', '', '', '2014-12-12 16:37:37', '2014-12-12 16:37:37');
INSERT INTO `categorymultilanguage` VALUES ('118', '9', '3', '', '', '', '', '2014-12-12 16:37:37', '2014-12-12 16:37:37');
INSERT INTO `categorymultilanguage` VALUES ('119', '7', '4', 'cc', '', '', '', '2014-12-12 16:37:47', '2014-12-12 16:37:47');
INSERT INTO `categorymultilanguage` VALUES ('120', '8', '4', '', '', '', '', '2014-12-12 16:37:47', '2014-12-12 16:37:47');
INSERT INTO `categorymultilanguage` VALUES ('121', '9', '4', '', '', '', '', '2014-12-12 16:37:47', '2014-12-12 16:37:47');
INSERT INTO `categorymultilanguage` VALUES ('122', '7', '5', 'aa1', '', '', '', '2014-12-12 16:38:19', '2014-12-12 16:38:19');
INSERT INTO `categorymultilanguage` VALUES ('123', '8', '5', '', '', '', '', '2014-12-12 16:38:19', '2014-12-12 16:38:19');
INSERT INTO `categorymultilanguage` VALUES ('124', '9', '5', '', '', '', '', '2014-12-12 16:38:19', '2014-12-12 16:38:19');
INSERT INTO `categorymultilanguage` VALUES ('125', '7', '6', 'aa2', '', '', '', '2014-12-12 16:38:27', '2014-12-12 16:38:27');
INSERT INTO `categorymultilanguage` VALUES ('126', '8', '6', '', '', '', '', '2014-12-12 16:38:27', '2014-12-12 16:38:27');
INSERT INTO `categorymultilanguage` VALUES ('127', '9', '6', '', '', '', '', '2014-12-12 16:38:27', '2014-12-12 16:38:27');
INSERT INTO `categorymultilanguage` VALUES ('128', '7', '7', 'aa3', '', '', '', '2014-12-12 16:46:40', '2014-12-12 16:46:40');
INSERT INTO `categorymultilanguage` VALUES ('129', '8', '7', '', '', '', '', '2014-12-12 16:46:41', '2014-12-12 16:46:41');
INSERT INTO `categorymultilanguage` VALUES ('130', '9', '7', '', '', '', '', '2014-12-12 16:46:41', '2014-12-12 16:46:41');
INSERT INTO `categorymultilanguage` VALUES ('131', '7', '8', 'aa31', '', '', '', '2014-12-12 16:46:56', '2014-12-12 16:46:56');
INSERT INTO `categorymultilanguage` VALUES ('132', '8', '8', '', '', '', '', '2014-12-12 16:46:56', '2014-12-12 16:46:56');
INSERT INTO `categorymultilanguage` VALUES ('133', '9', '8', '', '', '', '', '2014-12-12 16:46:56', '2014-12-12 16:46:56');
INSERT INTO `categorymultilanguage` VALUES ('134', '7', '9', 'cc1', '', '', '', '2014-12-12 17:22:10', '2014-12-12 17:22:10');
INSERT INTO `categorymultilanguage` VALUES ('135', '8', '9', '', '', '', '', '2014-12-12 17:22:10', '2014-12-12 17:22:10');
INSERT INTO `categorymultilanguage` VALUES ('136', '9', '9', '', '', '', '', '2014-12-12 17:22:10', '2014-12-12 17:22:10');
INSERT INTO `categorymultilanguage` VALUES ('137', '7', '20', 'ert', 'ert', 'ert', 'ert', '2015-01-15 13:51:44', '2015-01-15 13:51:44');
INSERT INTO `categorymultilanguage` VALUES ('138', '8', '20', 'ert', 'eer', 'ter', 'tert', '2015-01-15 13:51:44', '2015-01-15 13:51:44');
INSERT INTO `categorymultilanguage` VALUES ('139', '7', '20', 'ert', 'ert', 'ert', 'ert', '2015-01-15 13:52:54', '2015-01-15 13:52:54');
INSERT INTO `categorymultilanguage` VALUES ('140', '8', '20', 'ert', 'eer', 'ter', 'tert', '2015-01-15 13:52:54', '2015-01-15 13:52:54');
INSERT INTO `categorymultilanguage` VALUES ('141', '7', '20', 'ert', 'ert', 'ert', 'ert', '2015-01-15 13:58:16', '2015-01-15 13:58:16');
INSERT INTO `categorymultilanguage` VALUES ('142', '8', '20', 'ert', 'eer', 'ter', 'tert', '2015-01-15 13:58:16', '2015-01-15 13:58:16');

-- ----------------------------
-- Table structure for `currency`
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
  `idcurrency` int(11) NOT NULL AUTO_INCREMENT,
  `currencyname` varchar(45) DEFAULT NULL,
  `currencysymbol` varchar(45) DEFAULT NULL,
  `defaultcurrency` tinyint(4) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  `currencyrate` double DEFAULT NULL,
  PRIMARY KEY (`idcurrency`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='货币表';

-- ----------------------------
-- Records of currency
-- ----------------------------
INSERT INTO `currency` VALUES ('1', 'US', '$', '1', '1', '1');
INSERT INTO `currency` VALUES ('3', 'EUR', 'P', '0', '1', '3.2');

-- ----------------------------
-- Table structure for `foregroundimage`
-- ----------------------------
DROP TABLE IF EXISTS `foregroundimage`;
CREATE TABLE `foregroundimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgsrc` varchar(255) DEFAULT NULL,
  `imghref` varchar(255) DEFAULT NULL,
  `leftcolor` varchar(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '0:中间大图  1：右边小图',
  `used` int(11) DEFAULT NULL,
  `rightcolor` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of foregroundimage
-- ----------------------------
INSERT INTO `foregroundimage` VALUES ('2', 'upload/foregroundImage/2014120813430146304.jpg', 'http://www.baidu.com', 'wqe', '1', '1', 'qwe');
INSERT INTO `foregroundimage` VALUES ('3', 'upload/foregroundImage/2014111914252889214.png', '', '55', '1', '0', '');
INSERT INTO `foregroundimage` VALUES ('4', 'upload\\foregroundImage\\2014111915444915273.jpg', '士大夫', '', '1', '0', '');
INSERT INTO `foregroundimage` VALUES ('5', 'upload\\foregroundImage\\2014120811171199382.jpg', 'http://www.youku.com', 'rgb(232, 232, 232)', '0', '1', 'rgb(232, 232, 232)');
INSERT INTO `foregroundimage` VALUES ('6', 'upload\\foregroundImage\\2014120811175776452.jpg', 'http://www.tidebuy.com', 'rgb(232, 232, 232)', '0', '1', 'rgb(232, 232, 232)');

-- ----------------------------
-- Table structure for `jifen`
-- ----------------------------
DROP TABLE IF EXISTS `jifen`;
CREATE TABLE `jifen` (
  `jfid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `jifen` int(11) DEFAULT NULL,
  PRIMARY KEY (`jfid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jifen
-- ----------------------------

-- ----------------------------
-- Table structure for `language`
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `lan_id` int(10) NOT NULL AUTO_INCREMENT,
  `language_name` varchar(20) NOT NULL,
  `foreign_name` varchar(20) NOT NULL,
  `lan_code` varchar(20) NOT NULL COMMENT '语言代码',
  `lan_country` varchar(20) NOT NULL COMMENT '语言国家代码',
  `defaultlanuage` tinyint(10) DEFAULT '0' COMMENT '0不是默认1默认',
  `status` tinyint(10) NOT NULL COMMENT '是否在前台显示',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`lan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of language
-- ----------------------------
INSERT INTO `language` VALUES ('7', '英语', 'enligsh', 'en', 'US', '1', '0', '2014-08-22 14:10:05');
INSERT INTO `language` VALUES ('8', '俄语', 'russian', 'ru', 'RU', '0', '0', '2014-08-22 14:12:44');
INSERT INTO `language` VALUES ('9', '法语', 'f', 'f', 'f', '0', '0', '2014-09-22 11:11:11');

-- ----------------------------
-- Table structure for `liuyan`
-- ----------------------------
DROP TABLE IF EXISTS `liuyan`;
CREATE TABLE `liuyan` (
  `ly_id` int(11) NOT NULL AUTO_INCREMENT,
  `ly_state` int(11) DEFAULT NULL,
  `ly_style` int(11) DEFAULT NULL,
  `ly_name` varchar(50) DEFAULT NULL,
  `ly_email` varchar(50) DEFAULT NULL,
  `ly_tel` varchar(20) DEFAULT NULL,
  `ly_title` varchar(50) DEFAULT NULL,
  `ly_content` varchar(100) DEFAULT NULL,
  `ly_time` datetime DEFAULT NULL,
  PRIMARY KEY (`ly_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of liuyan
-- ----------------------------

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(50) NOT NULL COMMENT '订单编号',
  `userid` int(11) NOT NULL COMMENT '买家id',
  `ordercreatetime` datetime NOT NULL COMMENT '下订单的时间',
  `orderpaytime` datetime DEFAULT NULL COMMENT '订单支付的时间',
  `shippingid` int(11) DEFAULT NULL COMMENT '物流类型',
  `orderstate` tinyint(4) DEFAULT NULL COMMENT '订单状态',
  `ordertype` tinyint(4) DEFAULT NULL COMMENT '订单类型',
  `countprice` float(11,0) DEFAULT NULL COMMENT '总金额',
  `realpay` float(11,0) DEFAULT NULL COMMENT '实际付款',
  `reducefeee` float(11,0) NOT NULL DEFAULT '0' COMMENT '减免费用',
  `mailfeeornot` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有邮费0，没有邮费，1有邮费',
  `mailfee` float(11,0) DEFAULT '0' COMMENT '邮费',
  `usejifen` int(11) DEFAULT '0' COMMENT '使用积分',
  `givejifen` int(11) DEFAULT '0',
  `userip` varchar(40) DEFAULT NULL COMMENT '买家ip地址',
  `useraddressid` int(11) NOT NULL COMMENT '送货地址库id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for `ordercomment`
-- ----------------------------
DROP TABLE IF EXISTS `ordercomment`;
CREATE TABLE `ordercomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL COMMENT '评论内容',
  `creattime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ordercomment
-- ----------------------------

-- ----------------------------
-- Table structure for `orderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NOT NULL COMMENT '订单id',
  `productid` int(4) NOT NULL,
  `ordercount` int(4) NOT NULL DEFAULT '0' COMMENT '数量',
  `price` float(11,0) DEFAULT NULL COMMENT '价格，单价',
  `usermessage` varchar(500) DEFAULT NULL COMMENT '用户留言',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------

-- ----------------------------
-- Table structure for `orderdetailproductattr`
-- ----------------------------
DROP TABLE IF EXISTS `orderdetailproductattr`;
CREATE TABLE `orderdetailproductattr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderdetailid` int(11) NOT NULL,
  `attrname` varchar(50) DEFAULT NULL,
  `attrvalue` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderdetailproductattr
-- ----------------------------

-- ----------------------------
-- Table structure for `pingjia`
-- ----------------------------
DROP TABLE IF EXISTS `pingjia`;
CREATE TABLE `pingjia` (
  `pj_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `pj_title` varchar(100) DEFAULT NULL,
  `pj_content` varchar(500) NOT NULL,
  `pj_time` datetime NOT NULL,
  PRIMARY KEY (`pj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pingjia
-- ----------------------------

-- ----------------------------
-- Table structure for `productmultilanguage`
-- ----------------------------
DROP TABLE IF EXISTS `productmultilanguage`;
CREATE TABLE `productmultilanguage` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `product_id` int(20) NOT NULL COMMENT '商品所对应的id',
  `lan_id` int(20) NOT NULL COMMENT '语言所对应的id',
  `product_name` varchar(500) DEFAULT NULL COMMENT '商品名称',
  `product_detail_desc` varchar(1000) DEFAULT NULL COMMENT '商品详细信息',
  `product_desc` varchar(1000) DEFAULT NULL COMMENT '放在商品标题下面',
  `title` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL COMMENT 'seo使用',
  `createtime` datetime DEFAULT NULL,
  `modifytime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of productmultilanguage
-- ----------------------------
INSERT INTO `productmultilanguage` VALUES ('1', '11', '0', 'sjfl', null, 'sj', 'ad', null, null, '2014-08-27 14:08:59', '2014-08-27 14:08:59');
INSERT INTO `productmultilanguage` VALUES ('2', '15', '7', '2323', null, '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:14:59', '2014-08-27 14:14:59');
INSERT INTO `productmultilanguage` VALUES ('4', '17', '7', '2323', null, '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:15:56', '2014-08-27 14:15:56');
INSERT INTO `productmultilanguage` VALUES ('5', '18', '7', '2323', null, '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:15:57', '2014-08-27 14:15:57');
INSERT INTO `productmultilanguage` VALUES ('8', '20', '7', '2323', null, '<p>2323</p>', '2323', '232', '<p><strong>777</strong></p>', '2014-08-27 14:18:12', '2014-08-27 14:18:12');
INSERT INTO `productmultilanguage` VALUES ('9', '20', '8', '2323', null, '<p>2323</p>', '2323', '232', '2323j', '2014-08-27 14:18:12', '2014-08-27 14:18:12');
INSERT INTO `productmultilanguage` VALUES ('10', '21', '7', '2323', null, '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:18:13', '2014-08-27 14:18:13');
INSERT INTO `productmultilanguage` VALUES ('11', '21', '8', '2323', null, '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:18:13', '2014-08-27 14:18:13');
INSERT INTO `productmultilanguage` VALUES ('14', '23', '7', '2323', null, '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:21:27', '2014-08-27 14:21:27');
INSERT INTO `productmultilanguage` VALUES ('15', '23', '8', '2323', null, '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:21:27', '2014-08-27 14:21:27');
INSERT INTO `productmultilanguage` VALUES ('16', '24', '7', '2323', null, '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:21:27', '2014-08-27 14:21:27');
INSERT INTO `productmultilanguage` VALUES ('17', '24', '8', '2323', null, '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:21:27', '2014-08-27 14:21:27');
INSERT INTO `productmultilanguage` VALUES ('18', '25', '7', '2323', null, '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:21:28', '2014-08-27 14:21:28');
INSERT INTO `productmultilanguage` VALUES ('19', '25', '8', '2323', null, '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:21:28', '2014-08-27 14:21:28');
INSERT INTO `productmultilanguage` VALUES ('20', '26', '7', '2323', null, '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:21:28', '2014-08-27 14:21:28');
INSERT INTO `productmultilanguage` VALUES ('21', '26', '8', '2323', null, '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:21:28', '2014-08-27 14:21:28');
INSERT INTO `productmultilanguage` VALUES ('23', '28', '7', '23', null, '<p>23</p>', '23', '23', '23', '2014-08-27 14:22:59', '2014-08-27 14:22:59');
INSERT INTO `productmultilanguage` VALUES ('24', '29', '7', '23', null, '<p>23</p>', '23', '23', '23', '2014-08-27 14:23:00', '2014-08-27 14:23:00');
INSERT INTO `productmultilanguage` VALUES ('25', '30', '7', '23', null, '<p>23</p>', '23', '23', '23', '2014-08-27 14:23:01', '2014-08-27 14:23:01');
INSERT INTO `productmultilanguage` VALUES ('26', '31', '7', '23', null, '<p>23</p>', '23', '23', '23', '2014-08-27 14:24:40', '2014-08-27 14:24:40');
INSERT INTO `productmultilanguage` VALUES ('27', '32', '7', '23', null, '<p>23</p>', '23', '23', '23', '2014-08-27 14:24:41', '2014-08-27 14:24:41');
INSERT INTO `productmultilanguage` VALUES ('28', '33', '7', '23', null, '<p>23</p>', '23', '23', '23', '2014-08-27 14:24:41', '2014-08-27 14:24:41');
INSERT INTO `productmultilanguage` VALUES ('29', '34', '7', '23', null, '<p>23</p>', '23', '23', '23', '2014-08-27 14:24:41', '2014-08-27 14:24:41');
INSERT INTO `productmultilanguage` VALUES ('30', '35', '7', '23', null, '<p>23</p>', '23', '23', '23', '2014-08-27 14:25:50', '2014-08-27 14:25:50');
INSERT INTO `productmultilanguage` VALUES ('31', '35', '8', 'yu', null, '<p>rurasdfl;</p><p>rurasdfk</p><p>sasjdfasdl;fk</p><p>asjdlfjsajasdfl;k</p><p>aslfjasasf;</p><p>asjlfjaasdfk;</p><p>jflajasdfl;</p><p>adlfjasdlasdjflasjdlfjaaaaaaaaaaaaaaaaaaa</p>', 'rur', 'rur', 'rur', '2014-08-27 14:25:50', '2014-08-27 14:25:50');
INSERT INTO `productmultilanguage` VALUES ('32', '36', '7', '23', null, '<p>23</p>', '23', '23', '23', '2014-08-27 14:25:50', '2014-08-27 14:25:50');
INSERT INTO `productmultilanguage` VALUES ('33', '36', '8', 'yu', null, '<p>rurasdfl;</p><p>rurasdfk</p><p>sasjdfasdl;fk</p><p>asjdlfjsajasdfl;k</p><p>aslfjasasf;</p><p>asjlfjaasdfk;</p><p>jflajasdfl;</p><p>adlfjasdlasdjflasjdlfjaaaaaaaaaaaaaaaaaaa</p>', 'rur', 'rur', 'rur', '2014-08-27 14:25:50', '2014-08-27 14:25:50');
INSERT INTO `productmultilanguage` VALUES ('34', '37', '7', '23', null, '<p>23</p>', '23', '23', '23', '2014-08-27 14:25:50', '2014-08-27 14:25:50');
INSERT INTO `productmultilanguage` VALUES ('35', '37', '8', 'yu', null, '<p>rurasdfl;</p><p>rurasdfk</p><p>sasjdfasdl;fk</p><p>asjdlfjsajasdfl;k</p><p>aslfjasasf;</p><p>asjlfjaasdfk;</p><p>jflajasdfl;</p><p>adlfjasdlasdjflasjdlfjaaaaaaaaaaaaaaaaaaa</p>', 'rur', 'rur', 'rur', '2014-08-27 14:25:51', '2014-08-27 14:25:51');
INSERT INTO `productmultilanguage` VALUES ('36', '38', '7', '23', null, '<p>23</p>', '23', '23', '23', '2014-08-27 14:25:51', '2014-08-27 14:25:51');
INSERT INTO `productmultilanguage` VALUES ('37', '38', '8', 'yu', null, '<p>rurasdfl;</p><p>rurasdfk</p><p>sasjdfasdl;fk</p><p>asjdlfjsajasdfl;k</p><p>aslfjasasf;</p><p>asjlfjaasdfk;</p><p>jflajasdfl;</p><p>adlfjasdlasdjflasjdlfjaaaaaaaaaaaaaaaaaaa</p>', 'rur', 'rur', 'rur', '2014-08-27 14:25:51', '2014-08-27 14:25:51');
INSERT INTO `productmultilanguage` VALUES ('38', '39', '7', '23', null, '<p>23</p>', '43', '34', '343', '2014-08-27 15:07:34', '2014-08-27 15:07:34');
INSERT INTO `productmultilanguage` VALUES ('39', '39', '8', 'yyyyyyyy', null, '<p>yyyyyyyy</p>', 'yyyyyy', 'yyyyyyy', 'yyyyyyyyyy', '2014-08-27 15:07:34', '2014-08-27 15:07:34');
INSERT INTO `productmultilanguage` VALUES ('40', '40', '7', '23', null, '<p>23</p>', '43', '34', '343', '2014-08-27 15:07:36', '2014-08-27 15:07:36');
INSERT INTO `productmultilanguage` VALUES ('41', '40', '8', 'yyyyyyyy', null, '<p>yyyyyyyy</p>', 'yyyyyy', 'yyyyyyy', 'yyyyyyyyyy', '2014-08-27 15:07:36', '2014-08-27 15:07:36');
INSERT INTO `productmultilanguage` VALUES ('44', '42', '7', '23', null, '<p>23</p>', '43', '34', '343', '2014-08-27 15:07:39', '2014-08-27 15:07:39');
INSERT INTO `productmultilanguage` VALUES ('45', '42', '8', 'yyyyyyyy', null, '<p>yyyyyyyy</p>', 'yyyyyy', 'yyyyyyy', 'yyyyyyyyyy', '2014-08-27 15:07:39', '2014-08-27 15:07:39');
INSERT INTO `productmultilanguage` VALUES ('46', '43', '7', '23', null, '<p>23</p>', '43', '34', '343', '2014-08-27 15:09:11', '2014-08-27 15:09:11');
INSERT INTO `productmultilanguage` VALUES ('47', '43', '8', 'yyyyyyyy', null, '<p>yyyyyyyy</p>', 'yyyyyy', 'yyyyyyy', 'yyyyyyyyyy', '2014-08-27 15:09:12', '2014-08-27 15:09:12');
INSERT INTO `productmultilanguage` VALUES ('48', '44', '7', '23', null, '<p>23</p>', '43', '34', '343', '2014-08-27 15:10:30', '2014-08-27 15:10:30');
INSERT INTO `productmultilanguage` VALUES ('49', '44', '8', 'yyyyyyyy', null, '<p>yyyyyyyy</p>', 'yyyyyy', 'yyyyyyy', 'yyyyyyyyyy', '2014-08-27 15:10:30', '2014-08-27 15:10:30');
INSERT INTO `productmultilanguage` VALUES ('52', '46', '7', '23', null, '<p>23</p>', '43', '34', '343', '2014-08-27 15:11:02', '2014-08-27 15:11:02');
INSERT INTO `productmultilanguage` VALUES ('53', '46', '8', 'yyyyyyyy', null, '<p>yyyyyyyy</p>', 'yyyyyy', 'yyyyyyy', 'yyyyyyyyyy', '2014-08-27 15:11:02', '2014-08-27 15:11:02');
INSERT INTO `productmultilanguage` VALUES ('57', '20', '9', null, null, 'sdfsdfs', 'adsf', 'asdf', '<p>asdf</p>', '2014-11-08 18:09:38', '2014-11-08 18:09:38');
INSERT INTO `productmultilanguage` VALUES ('58', '4', '7', null, null, 'sdf', 'asdf ', 'asdf ', '<p>asd&nbsp;</p>', '2014-11-20 10:46:55', '2014-11-20 10:46:55');
INSERT INTO `productmultilanguage` VALUES ('59', '47', '7', '', null, '', '', '', '', '2014-11-20 11:45:02', '2014-11-20 11:45:02');
INSERT INTO `productmultilanguage` VALUES ('60', '47', '8', '', null, '', '', '', '', '2014-11-20 11:45:02', '2014-11-20 11:45:02');
INSERT INTO `productmultilanguage` VALUES ('61', '48', '7', '', null, '', '', '', '', '2014-11-20 11:45:02', '2014-11-20 11:45:02');
INSERT INTO `productmultilanguage` VALUES ('62', '48', '8', '', null, '', '', '', '', '2014-11-20 11:45:02', '2014-11-20 11:45:02');
INSERT INTO `productmultilanguage` VALUES ('63', '49', '7', '', null, '', '', '', '', '2014-11-20 11:45:02', '2014-11-20 11:45:02');
INSERT INTO `productmultilanguage` VALUES ('64', '49', '8', '', null, '', '', '', '', '2014-11-20 11:45:02', '2014-11-20 11:45:02');
INSERT INTO `productmultilanguage` VALUES ('65', '50', '7', '', null, '', '', '', '', '2014-11-20 11:45:02', '2014-11-20 11:45:02');
INSERT INTO `productmultilanguage` VALUES ('66', '50', '8', '', null, '', '', '', '', '2014-11-20 11:45:02', '2014-11-20 11:45:02');
INSERT INTO `productmultilanguage` VALUES ('67', '51', '7', '', null, '', '', '', '', '2014-11-20 11:45:02', '2014-11-20 11:45:02');
INSERT INTO `productmultilanguage` VALUES ('68', '51', '8', '', null, '', '', '', '', '2014-11-20 11:45:02', '2014-11-20 11:45:02');
INSERT INTO `productmultilanguage` VALUES ('69', '52', '7', '', null, '', '', '', '', '2014-11-20 11:45:02', '2014-11-20 11:45:02');
INSERT INTO `productmultilanguage` VALUES ('70', '52', '8', '', null, '', '', '', '', '2014-11-20 11:45:02', '2014-11-20 11:45:02');
INSERT INTO `productmultilanguage` VALUES ('71', '53', '7', '', null, '', '', '', '', '2014-11-20 11:45:02', '2014-11-20 11:45:02');
INSERT INTO `productmultilanguage` VALUES ('72', '53', '8', '', null, '', '', '', '', '2014-11-20 11:45:02', '2014-11-20 11:45:02');
INSERT INTO `productmultilanguage` VALUES ('73', '54', '7', '', null, '', '', '', '', '2014-11-20 11:45:02', '2014-11-20 11:45:02');
INSERT INTO `productmultilanguage` VALUES ('74', '54', '8', '', null, '', '', '', '', '2014-11-20 11:45:02', '2014-11-20 11:45:02');
INSERT INTO `productmultilanguage` VALUES ('75', '55', '7', '', null, '', '', '', '', '2014-11-20 11:45:02', '2014-11-20 11:45:02');
INSERT INTO `productmultilanguage` VALUES ('76', '55', '8', '', null, '', '', '', '', '2014-11-20 11:45:02', '2014-11-20 11:45:02');
INSERT INTO `productmultilanguage` VALUES ('77', '56', '7', '', null, '', '', '', '', '2014-11-20 11:45:02', '2014-11-20 11:45:02');
INSERT INTO `productmultilanguage` VALUES ('78', '56', '8', '', null, '', '', '', '', '2014-11-20 11:45:03', '2014-11-20 11:45:03');
INSERT INTO `productmultilanguage` VALUES ('79', '57', '7', '', null, '', '', '', '', '2014-11-20 12:41:20', '2014-11-20 12:41:20');
INSERT INTO `productmultilanguage` VALUES ('80', '57', '8', '', null, '', '', '', '', '2014-11-20 12:41:20', '2014-11-20 12:41:20');
INSERT INTO `productmultilanguage` VALUES ('81', '58', '7', '', null, '', '', '', '', '2014-11-20 12:41:21', '2014-11-20 12:41:21');
INSERT INTO `productmultilanguage` VALUES ('82', '58', '8', '', null, '', '', '', '', '2014-11-20 12:41:21', '2014-11-20 12:41:21');
INSERT INTO `productmultilanguage` VALUES ('83', '59', '7', '', null, '', '', '', '', '2014-11-20 12:41:21', '2014-11-20 12:41:21');
INSERT INTO `productmultilanguage` VALUES ('84', '59', '8', '', null, '', '', '', '', '2014-11-20 12:41:21', '2014-11-20 12:41:21');
INSERT INTO `productmultilanguage` VALUES ('85', '60', '7', '', null, '', '', '', '', '2014-11-20 12:41:21', '2014-11-20 12:41:21');
INSERT INTO `productmultilanguage` VALUES ('86', '60', '8', '', null, '', '', '', '', '2014-11-20 12:41:21', '2014-11-20 12:41:21');
INSERT INTO `productmultilanguage` VALUES ('87', '61', '7', '', null, '', '', '', '', '2014-11-20 12:41:21', '2014-11-20 12:41:21');
INSERT INTO `productmultilanguage` VALUES ('88', '61', '8', '', null, '', '', '', '', '2014-11-20 12:41:21', '2014-11-20 12:41:21');
INSERT INTO `productmultilanguage` VALUES ('89', '62', '7', '', null, '', '', '', '', '2014-11-20 12:41:21', '2014-11-20 12:41:21');
INSERT INTO `productmultilanguage` VALUES ('90', '62', '8', '', null, '', '', '', '', '2014-11-20 12:41:21', '2014-11-20 12:41:21');
INSERT INTO `productmultilanguage` VALUES ('91', '63', '7', '', null, '', '', '', '', '2014-11-20 12:41:21', '2014-11-20 12:41:21');
INSERT INTO `productmultilanguage` VALUES ('92', '63', '8', '', null, '', '', '', '', '2014-11-20 12:41:21', '2014-11-20 12:41:21');
INSERT INTO `productmultilanguage` VALUES ('93', '64', '7', '', null, '', '', '', '', '2014-11-20 12:41:21', '2014-11-20 12:41:21');
INSERT INTO `productmultilanguage` VALUES ('94', '64', '8', '', null, '', '', '', '', '2014-11-20 12:41:21', '2014-11-20 12:41:21');
INSERT INTO `productmultilanguage` VALUES ('95', '65', '7', '', null, '', '', '', '', '2014-11-20 12:41:21', '2014-11-20 12:41:21');
INSERT INTO `productmultilanguage` VALUES ('96', '65', '8', '', null, '', '', '', '', '2014-11-20 12:41:21', '2014-11-20 12:41:21');
INSERT INTO `productmultilanguage` VALUES ('97', '66', '7', '', null, '', '', '', '', '2014-11-20 12:41:21', '2014-11-20 12:41:21');
INSERT INTO `productmultilanguage` VALUES ('98', '66', '8', '', null, '', '', '', '', '2014-11-20 12:41:21', '2014-11-20 12:41:21');
INSERT INTO `productmultilanguage` VALUES ('99', '67', '7', '123 ', null, '<p>请问去外地</p>\r\n', '', '', '<p>123 王企鹅</p>', '2014-11-20 12:42:33', '2014-11-20 12:42:33');
INSERT INTO `productmultilanguage` VALUES ('100', '67', '8', '', null, '', '', '', '', '2014-11-20 12:42:33', '2014-11-20 12:42:33');
INSERT INTO `productmultilanguage` VALUES ('101', '68', '7', '', null, '', '', '', '', '2014-11-20 12:42:56', '2014-11-20 12:42:56');
INSERT INTO `productmultilanguage` VALUES ('102', '68', '8', '', null, '', '', '', '', '2014-11-20 12:42:56', '2014-11-20 12:42:56');
INSERT INTO `productmultilanguage` VALUES ('103', '69', '7', '', null, '', '', '', '', '2014-11-20 12:42:56', '2014-11-20 12:42:56');
INSERT INTO `productmultilanguage` VALUES ('104', '69', '8', '', null, '', '', '', '', '2014-11-20 12:42:56', '2014-11-20 12:42:56');
INSERT INTO `productmultilanguage` VALUES ('105', '70', '7', '', null, '', '', '', '', '2014-11-20 12:42:56', '2014-11-20 12:42:56');
INSERT INTO `productmultilanguage` VALUES ('106', '70', '8', '', null, '', '', '', '', '2014-11-20 12:42:56', '2014-11-20 12:42:56');
INSERT INTO `productmultilanguage` VALUES ('107', '71', '7', '', null, '', '', '', '', '2014-11-20 12:42:56', '2014-11-20 12:42:56');
INSERT INTO `productmultilanguage` VALUES ('108', '71', '8', '', null, '', '', '', '', '2014-11-20 12:42:56', '2014-11-20 12:42:56');
INSERT INTO `productmultilanguage` VALUES ('109', '72', '7', '', null, '', '', '', '', '2014-11-20 12:42:56', '2014-11-20 12:42:56');
INSERT INTO `productmultilanguage` VALUES ('110', '72', '8', '', null, '', '', '', '', '2014-11-20 12:42:56', '2014-11-20 12:42:56');
INSERT INTO `productmultilanguage` VALUES ('113', '74', '7', '', null, '', '', '', '', '2014-11-20 12:42:56', '2014-11-20 12:42:56');
INSERT INTO `productmultilanguage` VALUES ('114', '74', '8', '', null, '', '', '', '', '2014-11-20 12:42:56', '2014-11-20 12:42:56');
INSERT INTO `productmultilanguage` VALUES ('115', '75', '7', '', null, '', '', '', '', '2014-11-20 12:42:56', '2014-11-20 12:42:56');
INSERT INTO `productmultilanguage` VALUES ('116', '75', '8', '', null, '', '', '', '', '2014-11-20 12:42:56', '2014-11-20 12:42:56');
INSERT INTO `productmultilanguage` VALUES ('117', '76', '7', '', null, '', '', '', '', '2014-11-20 12:42:56', '2014-11-20 12:42:56');
INSERT INTO `productmultilanguage` VALUES ('118', '76', '8', '', null, '', '', '', '', '2014-11-20 12:42:56', '2014-11-20 12:42:56');
INSERT INTO `productmultilanguage` VALUES ('119', '77', '7', '', null, '', '', '', '', '2014-11-20 12:47:29', '2014-11-20 12:47:29');
INSERT INTO `productmultilanguage` VALUES ('120', '77', '8', '', null, '', '', '', '', '2014-11-20 12:47:29', '2014-11-20 12:47:29');
INSERT INTO `productmultilanguage` VALUES ('121', '78', '7', '', null, '', '', '', '', '2014-11-20 12:47:50', '2014-11-20 12:47:50');
INSERT INTO `productmultilanguage` VALUES ('122', '78', '8', '', null, '', '', '', '', '2014-11-20 12:47:50', '2014-11-20 12:47:50');
INSERT INTO `productmultilanguage` VALUES ('123', '79', '7', '', null, '', '', '', '', '2014-11-20 12:47:50', '2014-11-20 12:47:50');
INSERT INTO `productmultilanguage` VALUES ('124', '79', '8', '', null, '', '', '', '', '2014-11-20 12:47:50', '2014-11-20 12:47:50');
INSERT INTO `productmultilanguage` VALUES ('125', '80', '7', '', null, '', '', '', '', '2014-11-20 12:47:50', '2014-11-20 12:47:50');
INSERT INTO `productmultilanguage` VALUES ('126', '80', '8', '', null, '', '', '', '', '2014-11-20 12:47:50', '2014-11-20 12:47:50');
INSERT INTO `productmultilanguage` VALUES ('127', '81', '7', '', null, '', '', '', '', '2014-11-20 12:47:50', '2014-11-20 12:47:50');
INSERT INTO `productmultilanguage` VALUES ('128', '81', '8', '', null, '', '', '', '', '2014-11-20 12:47:50', '2014-11-20 12:47:50');
INSERT INTO `productmultilanguage` VALUES ('129', '82', '7', '', null, '', '', '', '', '2014-11-20 12:47:50', '2014-11-20 12:47:50');
INSERT INTO `productmultilanguage` VALUES ('130', '82', '8', '', null, '', '', '', '', '2014-11-20 12:47:50', '2014-11-20 12:47:50');
INSERT INTO `productmultilanguage` VALUES ('131', '83', '7', '', null, '', '', '', '', '2014-11-20 12:47:50', '2014-11-20 12:47:50');
INSERT INTO `productmultilanguage` VALUES ('132', '83', '8', '', null, '', '', '', '', '2014-11-20 12:47:50', '2014-11-20 12:47:50');
INSERT INTO `productmultilanguage` VALUES ('133', '84', '7', '', null, '', '', '', '', '2014-11-20 12:47:50', '2014-11-20 12:47:50');
INSERT INTO `productmultilanguage` VALUES ('134', '84', '8', '', null, '', '', '', '', '2014-11-20 12:47:50', '2014-11-20 12:47:50');
INSERT INTO `productmultilanguage` VALUES ('135', '85', '7', '', null, '', '', '', '', '2014-11-20 12:47:50', '2014-11-20 12:47:50');
INSERT INTO `productmultilanguage` VALUES ('136', '85', '8', '', null, '', '', '', '', '2014-11-20 12:47:50', '2014-11-20 12:47:50');
INSERT INTO `productmultilanguage` VALUES ('137', '86', '7', '', null, '', '', '', '', '2014-11-20 12:47:50', '2014-11-20 12:47:50');
INSERT INTO `productmultilanguage` VALUES ('138', '86', '8', '', null, '', '', '', '', '2014-11-20 12:47:50', '2014-11-20 12:47:50');
INSERT INTO `productmultilanguage` VALUES ('139', '67', '9', 'sdf', null, null, '隧道', '的', '<p>&nbsp;是</p>', '2014-11-20 15:53:02', '2014-11-20 15:53:02');
INSERT INTO `productmultilanguage` VALUES ('140', '87', '7', '', null, '', '', '', '', '2014-12-22 15:34:32', '2014-12-22 15:34:32');
INSERT INTO `productmultilanguage` VALUES ('141', '87', '8', '', null, '', '', '', '', '2014-12-22 15:34:32', '2014-12-22 15:34:32');
INSERT INTO `productmultilanguage` VALUES ('142', '88', '7', null, null, null, null, null, null, '2014-12-22 15:34:32', '2014-12-22 15:34:32');
INSERT INTO `productmultilanguage` VALUES ('143', '88', '8', null, null, null, null, null, null, '2014-12-22 15:34:32', '2014-12-22 15:34:32');
INSERT INTO `productmultilanguage` VALUES ('144', '89', '7', '', null, '', '', '', '', '2014-12-22 15:34:32', '2014-12-22 15:34:32');
INSERT INTO `productmultilanguage` VALUES ('145', '89', '8', '', null, '', '', '', '', '2014-12-22 15:34:32', '2014-12-22 15:34:32');
INSERT INTO `productmultilanguage` VALUES ('146', '90', '7', null, null, null, null, null, null, '2014-12-22 15:34:32', '2014-12-22 15:34:32');
INSERT INTO `productmultilanguage` VALUES ('147', '90', '8', null, null, null, null, null, null, '2014-12-22 15:34:32', '2014-12-22 15:34:32');
INSERT INTO `productmultilanguage` VALUES ('148', '91', '7', '', null, '', '', '', '', '2014-12-22 15:45:18', '2014-12-22 15:45:18');
INSERT INTO `productmultilanguage` VALUES ('149', '91', '8', '', null, '', '', '', '', '2014-12-22 15:45:18', '2014-12-22 15:45:18');
INSERT INTO `productmultilanguage` VALUES ('150', '92', '7', null, null, null, null, null, null, '2014-12-22 15:45:18', '2014-12-22 15:45:18');
INSERT INTO `productmultilanguage` VALUES ('151', '92', '8', null, null, null, null, null, null, '2014-12-22 15:45:18', '2014-12-22 15:45:18');
INSERT INTO `productmultilanguage` VALUES ('152', '93', '7', '', null, '', '', '', '', '2014-12-22 15:45:18', '2014-12-22 15:45:18');
INSERT INTO `productmultilanguage` VALUES ('153', '93', '8', '', null, '', '', '', '', '2014-12-22 15:45:18', '2014-12-22 15:45:18');
INSERT INTO `productmultilanguage` VALUES ('154', '94', '7', null, null, null, null, null, null, '2014-12-22 15:45:18', '2014-12-22 15:45:18');
INSERT INTO `productmultilanguage` VALUES ('155', '94', '8', null, null, null, null, null, null, '2014-12-22 15:45:19', '2014-12-22 15:45:19');
INSERT INTO `productmultilanguage` VALUES ('156', '95', '7', '', null, '', '', '', '', '2014-12-22 15:45:19', '2014-12-22 15:45:19');
INSERT INTO `productmultilanguage` VALUES ('157', '95', '8', '', null, '', '', '', '', '2014-12-22 15:45:19', '2014-12-22 15:45:19');
INSERT INTO `productmultilanguage` VALUES ('158', '96', '7', null, null, null, null, null, null, '2014-12-22 15:45:19', '2014-12-22 15:45:19');
INSERT INTO `productmultilanguage` VALUES ('159', '96', '8', null, null, null, null, null, null, '2014-12-22 15:45:19', '2014-12-22 15:45:19');
INSERT INTO `productmultilanguage` VALUES ('160', '97', '7', null, null, null, null, null, null, '2014-12-22 15:55:54', '2014-12-22 15:55:54');
INSERT INTO `productmultilanguage` VALUES ('161', '97', '8', null, null, null, null, null, null, '2014-12-22 15:55:54', '2014-12-22 15:55:54');
INSERT INTO `productmultilanguage` VALUES ('162', '98', '7', null, null, null, null, null, null, '2014-12-22 15:55:54', '2014-12-22 15:55:54');
INSERT INTO `productmultilanguage` VALUES ('163', '98', '8', null, null, null, null, null, null, '2014-12-22 15:55:54', '2014-12-22 15:55:54');
INSERT INTO `productmultilanguage` VALUES ('164', '99', '7', null, null, null, null, null, null, '2014-12-22 15:57:56', '2014-12-22 15:57:56');
INSERT INTO `productmultilanguage` VALUES ('165', '99', '8', null, null, null, null, null, null, '2014-12-22 15:57:56', '2014-12-22 15:57:56');
INSERT INTO `productmultilanguage` VALUES ('166', '100', '7', null, null, null, null, null, null, '2014-12-22 15:57:56', '2014-12-22 15:57:56');
INSERT INTO `productmultilanguage` VALUES ('167', '100', '8', null, null, null, null, null, null, '2014-12-22 15:57:56', '2014-12-22 15:57:56');
INSERT INTO `productmultilanguage` VALUES ('168', '101', '7', null, null, null, null, null, null, '2014-12-22 16:14:42', '2014-12-22 16:14:42');
INSERT INTO `productmultilanguage` VALUES ('169', '101', '8', null, null, null, null, null, null, '2014-12-22 16:14:42', '2014-12-22 16:14:42');
INSERT INTO `productmultilanguage` VALUES ('170', '102', '7', null, null, null, null, null, null, '2014-12-22 16:17:19', '2014-12-22 16:17:19');
INSERT INTO `productmultilanguage` VALUES ('171', '102', '8', null, null, null, null, null, null, '2014-12-22 16:17:19', '2014-12-22 16:17:19');
INSERT INTO `productmultilanguage` VALUES ('172', '103', '7', null, null, null, null, null, null, '2014-12-22 16:20:07', '2014-12-22 16:20:07');
INSERT INTO `productmultilanguage` VALUES ('173', '103', '8', null, null, null, null, null, null, '2014-12-22 16:20:07', '2014-12-22 16:20:07');
INSERT INTO `productmultilanguage` VALUES ('174', '104', '7', null, null, null, null, null, null, '2014-12-22 16:20:17', '2014-12-22 16:20:17');
INSERT INTO `productmultilanguage` VALUES ('175', '104', '8', null, null, null, null, null, null, '2014-12-22 16:20:17', '2014-12-22 16:20:17');
INSERT INTO `productmultilanguage` VALUES ('176', '105', '7', null, null, null, null, null, null, '2014-12-22 16:21:13', '2014-12-22 16:21:13');
INSERT INTO `productmultilanguage` VALUES ('177', '105', '8', null, null, null, null, null, null, '2014-12-22 16:21:13', '2014-12-22 16:21:13');
INSERT INTO `productmultilanguage` VALUES ('178', '106', '7', '皓杨男装 2014秋冬款新品男装 韩版非主流时尚修身假两件套长袖全棉T恤男潮上衣服 6008黑色 XL', '顺丰快递发货！我们用最好的快递让您及时到货！！超大防寒毛领 可脱卸 抽绳可收腰修身 采用高标准白鸭绒填充 300g以上填充量 绒朵大 超蓬松 超保暖 3.高密度牛筋记忆面料， 防风 防寒 . 4 七天无理由退货 品质保证。', '顺丰快递发货！我们用最好的快递让您及时到货！！超大防寒毛领 可脱卸 抽绳可收腰修身 采用高标准白鸭绒填充 300g以上填充量 绒朵大 超蓬松 超保暖 3.高密度牛筋记忆面料， 防风 防寒 . 4 七天无理由退货 品质保证。', '真狐狸毛领 90绒', '真狐狸毛领 90绒', '真狐狸毛领 90绒', '2014-12-22 16:21:16', '2014-12-22 16:21:16');
INSERT INTO `productmultilanguage` VALUES ('179', '106', '8', '马克华菲羽绒服男 2014冬装新款修身中长款连帽羽绒服 拼接外套', '品质保证。', '顺丰快递发货！我们用最好的快递让您及时到货！！超大防寒毛领 可脱卸 抽绳可收腰修身 采用高标准白鸭绒填充 300g以上填充量 绒朵大 超蓬松 超保暖 3.高密度牛筋记忆面料， 防风 防寒 . 4 七天无理由退货 品质保证。', '真狐狸毛领 90绒', '真狐狸毛领 90绒', '真狐狸毛领 90绒', '2014-12-22 16:21:16', '2014-12-22 16:21:16');
INSERT INTO `productmultilanguage` VALUES ('180', '107', '7', '', null, '', '', '', '', '2014-12-22 16:21:16', '2014-12-22 16:21:16');
INSERT INTO `productmultilanguage` VALUES ('181', '107', '8', '', null, '', '', '', '', '2014-12-22 16:21:16', '2014-12-22 16:21:16');
INSERT INTO `productmultilanguage` VALUES ('182', '108', '7', '11111111111111111111111111111111111111', '顺丰快递发货！我们用最好的快递让您及时到货！！超大防寒毛领 可脱卸 抽绳可收腰修身 采用高标准白鸭绒填充 300g以上填充量 绒朵大 超蓬松 超保暖 3.高密度牛筋记忆面料， 防风 防寒 . 4 七天无理由退货 品质保证。', '顺丰快递发货！我们用最好的快递让您及时到货！！超大防寒毛领 可脱卸 抽绳可收腰修身 采用高标准白鸭绒填充 300g以上填充量 绒朵大 超蓬松 超保暖 3.高密度牛筋记忆面料， 防风 防寒 . 4 七天无理由退货 品质保证。', '顺丰快递发货！我们用最好的快递让您及时到货！！超大防寒毛领 可脱卸 抽绳可收腰修身 采用高标准白鸭绒填充 300g以上填充量 绒朵大 超蓬松 超保暖 3.高密度牛筋记忆面料， 防风 防寒 . 4 七天无理由退货 品质保证。', '顺丰快递发货！我们用最好的快递让您及时到货！！超大防寒毛领 可脱卸 抽绳可收腰修身 采用高标准白鸭绒填充 300g以上填充量 绒朵大 超蓬松 超保暖 3.高密度牛筋记忆面料， 防风 防寒 . 4 七天无理由退货 品质保证。', '顺丰快递发货！我们用最好的快递让您及时到货！！超大防寒毛领 可脱卸 抽绳可收腰修身 采用高标准白鸭绒填充 300g以上填充量 绒朵大 超蓬松 超保暖 3.高密度牛筋记忆面料， 防风 防寒 . 4 七天无理由退货 品质保证。', '2014-12-27 21:44:30', '2014-12-27 21:44:30');
INSERT INTO `productmultilanguage` VALUES ('183', '108', '8', '2222222222222222222222222222222222222', '顺丰快递发货！我们用最好的快递让您及时到货！！超大防寒毛领 可脱卸 抽绳可收腰修身 采用高标准白鸭绒填充 300g以上填充量 绒朵大 超蓬松 超保暖 3.高密度牛筋记忆面料， 防风 防寒 . 4 七天无理由退货 品质保证。', '顺丰快递发货！我们用最好的快递让您及时到货！！超大防寒毛领 可脱卸 抽绳可收腰修身 采用高标准白鸭绒填充 300g以上填充量 绒朵大 超蓬松 超保暖 3.高密度牛筋记忆面料， 防风 防寒 . 4 七天无理由退货 品质保证。', '顺丰快递发货！我们用最好的快递让您及时到货！！超大防寒毛领 可脱卸 抽绳可收腰修身 采用高标准白鸭绒填充 300g以上填充量 绒朵大 超蓬松 超保暖 3.高密度牛筋记忆面料， 防风 防寒 . 4 七天无理由退货 品质保证。', '顺丰快递发货！我们用最好的快递让您及时到货！！超大防寒毛领 可脱卸 抽绳可收腰修身 采用高标准白鸭绒填充 300g以上填充量 绒朵大 超蓬松 超保暖 3.高密度牛筋记忆面料， 防风 防寒 . 4 七天无理由退货 品质保证。', '顺丰快递发货！我们用最好的快递让您及时到货！！超大防寒毛领 可脱卸 抽绳可收腰修身 采用高标准白鸭绒填充 300g以上填充量 绒朵大 超蓬松 超保暖 3.高密度牛筋记忆面料， 防风 防寒 . 4 七天无理由退货 品质保证。', '2014-12-27 21:44:30', '2014-12-27 21:44:30');
INSERT INTO `productmultilanguage` VALUES ('184', '108', '9', '', null, null, '', '', '', '2014-12-27 22:34:06', '2014-12-27 22:34:06');
INSERT INTO `productmultilanguage` VALUES ('185', '109', '7', null, null, null, null, null, null, '2014-12-29 17:29:44', '2014-12-29 17:29:44');
INSERT INTO `productmultilanguage` VALUES ('186', '109', '8', null, null, null, null, null, null, '2014-12-29 17:29:44', '2014-12-29 17:29:44');
INSERT INTO `productmultilanguage` VALUES ('187', '110', '7', null, null, null, null, null, null, '2014-12-29 17:29:44', '2014-12-29 17:29:44');
INSERT INTO `productmultilanguage` VALUES ('188', '110', '8', null, null, null, null, null, null, '2014-12-29 17:29:44', '2014-12-29 17:29:44');
INSERT INTO `productmultilanguage` VALUES ('189', '111', '7', '', null, '<p>1111111111111111111111111111</p>', 'we', 'we', 'we', '2014-12-29 17:29:44', '2014-12-29 17:29:44');
INSERT INTO `productmultilanguage` VALUES ('190', '111', '8', '', null, '<p>1222222222212121212</p>', 'we', 'we', 'we', '2014-12-29 17:29:44', '2014-12-29 17:29:44');
INSERT INTO `productmultilanguage` VALUES ('191', '112', '7', '七匹狼羽绒服 男士外套 2014冬装新款 轻薄款立领羽绒衣 男装正品', null, '<p><span style=\"color: rgb(153, 153, 153); font-family: tahoma, arial, 微软雅黑, sans-serif; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">【店铺明星】冬装爆款主推，热销超万件！高端经典多彩系列羽绒，最受欢迎单品，进店必买！ 【设计亮点】高效轻型保暖，90%超高含量白鸭绒填充，新型压合高密锁绒技术，有效防钻绒。 【质量保障】品牌授权正品专卖，假一赔十！旗舰之作，尊贵品质！七天无理由退换购物无忧！</span></p>', '', '', '', '2015-01-16 16:42:30', '2015-01-16 16:42:30');
INSERT INTO `productmultilanguage` VALUES ('192', '112', '8', '店铺明星】冬装爆款主推，热销超万件七匹狼羽绒服 男士外套 2014冬装新款 轻薄款立领羽绒衣 男装正品', null, '<p><span style=\"color: rgb(153, 153, 153); font-family: tahoma, arial, 微软雅黑, sans-serif; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">【店铺明星】冬装爆款主推，热销超万件！高端经典多彩系列羽绒，最受欢迎单品，进店必买！ 【设计亮点】高效轻型保暖，90%超高含量白鸭绒填充，新型压合高密锁绒技术，有效防钻绒。 【质量保障】品牌授权正品专卖，假一赔十！旗舰之作，尊贵品质！七天无理由退换购物无忧！</span></p>', '', '', '', '2015-01-16 16:42:30', '2015-01-16 16:42:30');

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(255) NOT NULL COMMENT '商品名称(中文）',
  `p_purchaprice` float(10,4) DEFAULT NULL COMMENT '采购价格',
  `p_originprice` float(10,4) DEFAULT NULL,
  `p_nowprice` float(10,4) DEFAULT NULL,
  `p_brandid` int(11) NOT NULL COMMENT '品牌',
  `p_categoryid` int(11) NOT NULL COMMENT '商品分类',
  `p_fromcompany` varchar(255) DEFAULT NULL COMMENT '产品来源厂家',
  `p_companyserinum` varchar(255) DEFAULT NULL COMMENT '厂家编号',
  `p_myserialnumber` varchar(255) DEFAULT NULL COMMENT '自编号',
  `p_fromnetaddress` varchar(255) DEFAULT NULL COMMENT '来源网址',
  `p_storenumber` int(11) NOT NULL DEFAULT '-1' COMMENT '库存',
  `p_minbuyamount` int(11) NOT NULL DEFAULT '1' COMMENT '最少购买数量',
  `p_freemail` tinyint(4) DEFAULT NULL COMMENT '是否免邮费',
  `p_jifen` float(5,4) DEFAULT NULL,
  `p_hot` tinyint(4) DEFAULT NULL,
  `p_recommend` tinyint(4) DEFAULT NULL,
  `p_new` tinyint(4) DEFAULT NULL,
  `p_date_added` datetime NOT NULL,
  `p_last_modified` datetime NOT NULL,
  `p_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否上架',
  `p_beizhu` varchar(255) DEFAULT NULL,
  `p_weight` int(11) DEFAULT NULL,
  `p_freight_templet` int(11) DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('67', '2014111916292267852', '0.0000', '0.0000', '0.0000', '21', '2', '', '', '', '', '0', '0', '0', '1.0000', '0', '0', '0', '2014-11-20 12:42:33', '2014-11-20 12:42:33', '0', '', null, null);
INSERT INTO `products` VALUES ('68', '2014111916303910733', '0.0000', '0.0000', '0.0000', '21', '2', '', '', '', '', '0', '0', '0', '1.0000', '0', '0', '0', '2014-11-20 12:42:56', '2014-11-20 12:42:56', '0', '', null, null);
INSERT INTO `products` VALUES ('69', '2014111916590141162', '0.0000', '0.0000', '0.0000', '21', '2', '', '', '', '', '0', '0', '0', '1.0000', '0', '0', '0', '2014-11-20 12:42:56', '2014-11-20 12:42:56', '0', '', null, null);
INSERT INTO `products` VALUES ('70', '2014111917010874811', '0.0000', '0.0000', '0.0000', '21', '2', '', '', '', '', '0', '0', '0', '1.0000', '0', '0', '0', '2014-11-20 12:42:56', '2014-11-20 12:42:56', '0', '', null, null);
INSERT INTO `products` VALUES ('71', '2014111917024660175', '0.0000', '0.0000', '0.0000', '21', '2', '', '', '', '', '0', '0', '0', '1.0000', '0', '0', '0', '2014-11-20 12:42:56', '2014-11-20 12:42:56', '0', '', null, null);
INSERT INTO `products` VALUES ('72', '2014111917074074630', '0.0000', '0.0000', '0.0000', '21', '2', '', '', '', '', '0', '0', '0', '1.0000', '0', '0', '0', '2014-11-20 12:42:56', '2014-11-20 12:42:56', '0', '', null, null);
INSERT INTO `products` VALUES ('74', '2014112010192591900', '0.0000', '0.0000', '0.0000', '21', '2', '', '', '', '', '0', '0', '0', '1.0000', '0', '0', '0', '2014-11-20 12:42:56', '2014-11-20 12:42:56', '0', '', null, null);
INSERT INTO `products` VALUES ('75', '2014112010220251611', '0.0000', '0.0000', '0.0000', '21', '2', '', '', '', '', '0', '0', '0', '1.0000', '0', '0', '0', '2014-11-20 12:42:56', '2014-11-20 12:42:56', '0', '', null, null);
INSERT INTO `products` VALUES ('76', '2014112010512189654', '0.0000', '0.0000', '0.0000', '21', '2', '', '', '', '', '0', '0', '0', '1.0000', '0', '0', '0', '2014-11-20 12:42:56', '2014-11-20 12:42:56', '0', '', null, null);
INSERT INTO `products` VALUES ('77', '2014111916292267852', '0.0000', '0.0000', '0.0000', '21', '2', '', '', '', '', '0', '0', '0', '1.0000', '0', '0', '0', '2014-11-20 12:47:04', '2014-11-20 12:47:04', '0', '', null, null);
INSERT INTO `products` VALUES ('78', '2014111916303910733', '0.0000', '0.0000', '0.0000', '21', '2', '', '', '', '', '0', '0', '0', '1.0000', '0', '0', '0', '2014-11-20 12:47:50', '2014-11-20 12:47:50', '0', '', null, null);
INSERT INTO `products` VALUES ('79', '2014111916590141162', '0.0000', '0.0000', '0.0000', '21', '2', '', '', '', '', '0', '0', '0', '1.0000', '0', '0', '0', '2014-11-20 12:47:50', '2014-11-20 12:47:50', '0', '', null, null);
INSERT INTO `products` VALUES ('80', '2014111917010874811', '0.0000', '0.0000', '0.0000', '21', '2', '', '', '', '', '0', '0', '0', '1.0000', '0', '0', '0', '2014-11-20 12:47:50', '2014-11-20 12:47:50', '0', '', null, null);
INSERT INTO `products` VALUES ('81', '2014111917024660175', '0.0000', '0.0000', '0.0000', '21', '2', '', '', '', '', '0', '0', '0', '1.0000', '0', '0', '0', '2014-11-20 12:47:50', '2014-11-20 12:47:50', '0', '', null, null);
INSERT INTO `products` VALUES ('82', '2014111917074074630', '0.0000', '0.0000', '0.0000', '21', '2', '', '', '', '', '0', '0', '0', '1.0000', '0', '0', '0', '2014-11-20 12:47:50', '2014-11-20 12:47:50', '0', '', null, null);
INSERT INTO `products` VALUES ('83', '2014111917083358560', '0.0000', '0.0000', '0.0000', '21', '2', '', '', '', '', '0', '0', '0', '1.0000', '0', '0', '0', '2014-11-20 12:47:50', '2014-11-20 12:47:50', '0', '', null, null);
INSERT INTO `products` VALUES ('84', '2014112010192591900', '0.0000', '0.0000', '0.0000', '21', '2', '', '', '', '', '0', '0', '0', '1.0000', '0', '0', '0', '2014-11-20 12:47:50', '2014-11-20 12:47:50', '0', '', null, null);
INSERT INTO `products` VALUES ('85', '2014112010220251611', '0.0000', '0.0000', '0.0000', '21', '2', '', '', '', '', '0', '0', '0', '1.0000', '0', '0', '0', '2014-11-20 12:47:50', '2014-11-20 12:47:50', '0', '', null, null);
INSERT INTO `products` VALUES ('86', '2014112010512189654', '0.0000', '0.0000', '0.0000', '21', '2', '', '', '', '', '0', '0', '0', '1.0000', '0', '0', '0', '2014-11-20 12:47:50', '2014-11-20 12:47:50', '0', '', null, null);
INSERT INTO `products` VALUES ('87', '8', '12.0000', '313.0000', '0.0000', '21', '2', 'asdf', 'asdf', 'asdf', 'asdf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-12-22 15:34:32', '2014-12-22 15:34:32', '0', '', null, null);
INSERT INTO `products` VALUES ('88', '5', '0.0000', '0.0000', '0.0000', '0', '0', null, null, null, null, '0', '0', '0', '0.0000', '0', '0', '0', '2014-12-22 15:34:32', '2014-12-22 15:34:32', '0', null, null, null);
INSERT INTO `products` VALUES ('89', '9', '12.0000', '313.0000', '0.0000', '21', '2', 'asdf', 'asdf', 'asdf', 'asdf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-12-22 15:34:32', '2014-12-22 15:34:32', '0', '', null, null);
INSERT INTO `products` VALUES ('90', '6', '0.0000', '0.0000', '0.0000', '0', '0', null, null, null, null, '0', '0', '0', '0.0000', '0', '0', '0', '2014-12-22 15:34:32', '2014-12-22 15:34:32', '0', null, null, null);
INSERT INTO `products` VALUES ('91', '8', '12.0000', '313.0000', '0.0000', '21', '2', 'asdf', 'asdf', 'asdf', 'asdf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-12-22 15:45:18', '2014-12-22 15:45:18', '0', '', null, null);
INSERT INTO `products` VALUES ('92', '5', '0.0000', '0.0000', '0.0000', '0', '0', null, null, null, null, '0', '0', '0', '0.0000', '0', '0', '0', '2014-12-22 15:45:18', '2014-12-22 15:45:18', '0', null, null, null);
INSERT INTO `products` VALUES ('93', '9', '12.0000', '313.0000', '0.0000', '21', '2', 'asdf', 'asdf', 'asdf', 'asdf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-12-22 15:45:18', '2014-12-22 15:45:18', '0', '', null, null);
INSERT INTO `products` VALUES ('94', '5', '0.0000', '0.0000', '0.0000', '0', '0', null, null, null, null, '0', '0', '0', '0.0000', '0', '0', '0', '2014-12-22 15:45:18', '2014-12-22 15:45:18', '0', null, null, null);
INSERT INTO `products` VALUES ('95', '9', '12.0000', '313.0000', '0.0000', '21', '2', 'asdf', 'asdf', 'asdf', 'asdf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-12-22 15:45:19', '2014-12-22 15:45:19', '0', '', null, null);
INSERT INTO `products` VALUES ('96', '6', '0.0000', '0.0000', '0.0000', '0', '0', null, null, null, null, '0', '0', '0', '0.0000', '0', '0', '0', '2014-12-22 15:45:19', '2014-12-22 15:45:19', '0', null, null, null);
INSERT INTO `products` VALUES ('97', '5', '0.0000', '0.0000', '0.0000', '0', '0', null, null, null, null, '0', '0', '0', '0.0000', '0', '0', '0', '2014-12-22 15:55:54', '2014-12-22 15:55:54', '0', null, null, null);
INSERT INTO `products` VALUES ('98', '6', '0.0000', '0.0000', '0.0000', '0', '0', null, null, null, null, '0', '0', '0', '0.0000', '0', '0', '0', '2014-12-22 15:55:54', '2014-12-22 15:55:54', '0', null, null, null);
INSERT INTO `products` VALUES ('99', '5', '0.0000', '0.0000', '0.0000', '0', '0', null, null, null, null, '0', '0', '0', '0.0000', '0', '0', '0', '2014-12-22 15:57:56', '2014-12-22 15:57:56', '0', null, null, null);
INSERT INTO `products` VALUES ('100', '6', '0.0000', '0.0000', '0.0000', '0', '0', null, null, null, null, '0', '0', '0', '0.0000', '0', '0', '0', '2014-12-22 15:57:56', '2014-12-22 15:57:56', '0', null, null, null);
INSERT INTO `products` VALUES ('101', '5', '0.0000', '0.0000', '0.0000', '0', '0', null, null, null, null, '0', '0', '0', '0.0000', '0', '0', '0', '2014-12-22 16:14:42', '2014-12-22 16:14:42', '0', null, null, null);
INSERT INTO `products` VALUES ('102', '6', '0.0000', '0.0000', '0.0000', '0', '0', null, null, null, null, '0', '0', '0', '0.0000', '0', '0', '0', '2014-12-22 16:17:19', '2014-12-22 16:17:19', '0', null, null, null);
INSERT INTO `products` VALUES ('103', '5', '0.0000', '0.0000', '0.0000', '0', '0', null, null, null, null, '0', '0', '0', '0.0000', '0', '0', '0', '2014-12-22 16:20:07', '2014-12-22 16:20:07', '0', null, null, null);
INSERT INTO `products` VALUES ('104', '6', '0.0000', '0.0000', '0.0000', '0', '0', null, null, null, null, '0', '0', '0', '0.0000', '0', '0', '0', '2014-12-22 16:20:17', '2014-12-22 16:20:17', '0', null, null, null);
INSERT INTO `products` VALUES ('105', '5', '0.0000', '170.0000', '80.0000', '0', '0', null, null, null, null, '0', '0', '0', '0.0000', '0', '0', '0', '2014-12-22 16:21:13', '2014-12-22 16:21:13', '0', null, null, null);
INSERT INTO `products` VALUES ('106', '6', '0.0000', '170.0000', '80.0000', '0', '0', null, null, null, null, '0', '0', '0', '0.0000', '0', '0', '0', '2014-12-22 16:21:16', '2014-12-22 16:21:16', '0', null, null, null);
INSERT INTO `products` VALUES ('107', 'outer5', '12.0000', '313.0000', '0.0000', '21', '2', 'asdf', 'asdf', 'asdf', 'asdf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-12-22 16:21:16', '2014-12-22 16:21:16', '0', '', null, null);
INSERT INTO `products` VALUES ('108', '11', '123.0000', '189.0000', '200.0000', '21', '2', '发到付', 'fsd', 'sfd', 'sd', '0', '0', '0', '1.0000', '0', '0', '0', '2014-12-29 15:44:30', '2014-12-29 15:44:30', '0', null, '0', '33');
INSERT INTO `products` VALUES ('109', '5', '0.0000', '0.0000', '0.0000', '0', '0', null, null, null, null, '0', '0', '0', '0.0000', '0', '0', '0', '2014-12-29 17:29:44', '2014-12-29 17:29:44', '0', null, null, null);
INSERT INTO `products` VALUES ('110', '6', '0.0000', '0.0000', '0.0000', '0', '0', null, null, null, null, '0', '0', '0', '0.0000', '0', '0', '0', '2014-12-29 17:29:44', '2014-12-29 17:29:44', '0', null, null, null);
INSERT INTO `products` VALUES ('111', 'outer5', '12.0000', '12.0000', '0.0000', '25', '2', '', '', '', '', '0', '0', '0', '1.0000', '0', '0', '0', '2014-12-29 17:29:44', '2014-12-29 17:29:44', '0', '发送端', null, null);
INSERT INTO `products` VALUES ('112', '6', '100.0000', '200.0000', '0.0000', '25', '2', 'fsdf', 'sdfsdf', 'sdfsdfsdf', 'sdfsdf', '0', '0', '0', '1.0000', '0', '0', '0', '2015-01-16 16:42:30', '2015-01-16 16:42:30', '0', '', null, null);

-- ----------------------------
-- Table structure for `product_basic_attr`
-- ----------------------------
DROP TABLE IF EXISTS `product_basic_attr`;
CREATE TABLE `product_basic_attr` (
  `p_basic_attr_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) DEFAULT NULL,
  `attr_name_id` varchar(255) DEFAULT NULL,
  `attr_value_id` varchar(255) DEFAULT NULL,
  `is_sku` tinyint(4) DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`p_basic_attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_basic_attr
-- ----------------------------
INSERT INTO `product_basic_attr` VALUES ('42', '4', '39', '59', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('43', '4', '39', '60', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('44', '4', '30', '40', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('45', '4', '31', '41', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('46', '4', '31', '42', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('47', '67', '13', '15', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('48', '67', '13', '17', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('49', '67', '20', '35', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('50', '67', '20', '36', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('51', '68', '13', '14', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('52', '68', '13', '15', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('53', '68', '13', '16', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('54', '68', '15', '19', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('55', '69', '15', '19', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('56', '87', '39', '59', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('57', '87', '39', '60', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('58', '87', '39', '61', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('59', '87', '13', '14', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('60', '87', '13', '15', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('61', '87', '13', '16', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('62', '108', '39', '59', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('63', '108', '39', '60', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('64', '108', '39', '61', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('65', '108', '39', '62', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('66', '108', '13', '14', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('67', '108', '13', '15', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('68', '108', '13', '16', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('69', '108', '13', '17', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('70', '108', '39', '63', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('71', '80', '39', '59', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('72', '80', '39', '60', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('73', '80', '39', '61', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('74', '80', '13', '14', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('75', '80', '13', '15', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('76', '112', '13', '14', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('77', '112', '13', '15', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('78', '112', '13', '16', '1', null, null);
INSERT INTO `product_basic_attr` VALUES ('79', '112', '41', '66', '0', null, null);
INSERT INTO `product_basic_attr` VALUES ('80', '112', '41', '67', '0', null, null);
INSERT INTO `product_basic_attr` VALUES ('81', '112', '41', '68', '0', null, null);

-- ----------------------------
-- Table structure for `product_collect`
-- ----------------------------
DROP TABLE IF EXISTS `product_collect`;
CREATE TABLE `product_collect` (
  `pc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏的id',
  `u_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL COMMENT '收藏商品的id',
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`pc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_collect
-- ----------------------------

-- ----------------------------
-- Table structure for `product_image`
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_addr` varchar(255) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `image_sort` tinyint(4) DEFAULT NULL COMMENT '产品图片排序，1为主图',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES ('36', 'productImage/categoryImage/2014111916292267852.jpg', '67', '1', '2014-11-20 12:42:33');
INSERT INTO `product_image` VALUES ('37', 'productImage/categoryImage/2014111916303910733.jpg', '68', '0', '2014-11-20 12:42:56');
INSERT INTO `product_image` VALUES ('38', 'productImage/categoryImage/2014111916590141162.jpg', '69', '0', '2014-11-20 12:42:56');
INSERT INTO `product_image` VALUES ('39', 'productImage/categoryImage/2014111917010874811.jpg', '70', '0', '2014-11-20 12:42:56');
INSERT INTO `product_image` VALUES ('40', 'productImage/categoryImage/2014111917024660175.jpg', '71', '0', '2014-11-20 12:42:56');
INSERT INTO `product_image` VALUES ('41', 'productImage/categoryImage/2014111917074074630.jpg', '72', '0', '2014-11-20 12:42:56');
INSERT INTO `product_image` VALUES ('43', 'productImage/categoryImage/2014112010192591900.jpg', '74', '0', '2014-11-20 12:42:56');
INSERT INTO `product_image` VALUES ('44', 'productImage/categoryImage/2014112010220251611.jpg', '75', '0', '2014-11-20 12:42:56');
INSERT INTO `product_image` VALUES ('45', 'productImage/categoryImage/2014112010512189654.jpg', '76', '0', '2014-11-20 12:42:56');
INSERT INTO `product_image` VALUES ('46', 'productImage/categoryImage/2014111916292267852.jpg', '77', '0', '2014-11-20 12:47:29');
INSERT INTO `product_image` VALUES ('47', 'productImage/categoryImage/2014111916303910733.jpg', '78', '0', '2014-11-20 12:47:50');
INSERT INTO `product_image` VALUES ('48', 'productImage/categoryImage/2014111916590141162.jpg', '79', '0', '2014-11-20 12:47:50');
INSERT INTO `product_image` VALUES ('49', 'productImage/categoryImage/2014111917010874811.jpg', '80', '0', '2014-11-20 12:47:50');
INSERT INTO `product_image` VALUES ('50', 'productImage/categoryImage/2014111917024660175.jpg', '81', '0', '2014-11-20 12:47:50');
INSERT INTO `product_image` VALUES ('51', 'productImage/categoryImage/2014111917074074630.jpg', '82', '0', '2014-11-20 12:47:50');
INSERT INTO `product_image` VALUES ('52', 'productImage/categoryImage/2014111917083358560.jpg', '83', '0', '2014-11-20 12:47:50');
INSERT INTO `product_image` VALUES ('53', 'productImage/categoryImage/2014112010192591900.jpg', '84', '0', '2014-11-20 12:47:50');
INSERT INTO `product_image` VALUES ('54', 'productImage/categoryImage/2014112010220251611.jpg', '85', '0', '2014-11-20 12:47:50');
INSERT INTO `product_image` VALUES ('55', 'productImage/categoryImage/2014112010512189654.jpg', '86', '0', '2014-11-20 12:47:50');
INSERT INTO `product_image` VALUES ('56', 'upload/productsImage/2014112012501559717.jpg', '67', '0', '2014-11-20 12:50:15');
INSERT INTO `product_image` VALUES ('57', 'upload/productsImage/2014112012531443302.jpg', '67', '0', '2014-11-20 12:53:14');
INSERT INTO `product_image` VALUES ('58', 'productImage/qaz/8/5(1).jpg', '88', '0', '2014-12-22 15:34:32');
INSERT INTO `product_image` VALUES ('59', 'productImage/qaz/8/5(2).jpg', '88', '1', '2014-12-22 15:34:32');
INSERT INTO `product_image` VALUES ('60', 'productImage/qaz/8/5(3).jpg', '88', '2', '2014-12-22 15:34:32');
INSERT INTO `product_image` VALUES ('61', 'productImage/qaz/8/5(4).jpg', '88', '3', '2014-12-22 15:34:32');
INSERT INTO `product_image` VALUES ('62', 'productImage/qaz/8/5(5).jpg', '88', '4', '2014-12-22 15:34:32');
INSERT INTO `product_image` VALUES ('63', 'productImage/qaz/9/6(1).jpg', '90', '0', '2014-12-22 15:34:32');
INSERT INTO `product_image` VALUES ('64', 'productImage/qaz/9/6(2).jpg', '90', '1', '2014-12-22 15:34:32');
INSERT INTO `product_image` VALUES ('65', 'productImage/qaz/9/6(3).jpg', '90', '2', '2014-12-22 15:34:32');
INSERT INTO `product_image` VALUES ('66', 'productImage/qaz/9/6(4).jpg', '90', '3', '2014-12-22 15:34:33');
INSERT INTO `product_image` VALUES ('82', 'productImage/qaz/8/5(1).jpg', '97', '0', '2014-12-22 15:55:54');
INSERT INTO `product_image` VALUES ('83', 'productImage/qaz/8/5(2).jpg', '97', '1', '2014-12-22 15:55:54');
INSERT INTO `product_image` VALUES ('84', 'productImage/qaz/8/5(3).jpg', '97', '2', '2014-12-22 15:55:54');
INSERT INTO `product_image` VALUES ('85', 'productImage/qaz/8/5(4).jpg', '97', '3', '2014-12-22 15:55:54');
INSERT INTO `product_image` VALUES ('86', 'productImage/qaz/8/5(5).jpg', '97', '4', '2014-12-22 15:55:54');
INSERT INTO `product_image` VALUES ('87', 'productImage/qaz/9/6(1).jpg', '98', '0', '2014-12-22 15:55:54');
INSERT INTO `product_image` VALUES ('88', 'productImage/qaz/9/6(2).jpg', '98', '1', '2014-12-22 15:55:54');
INSERT INTO `product_image` VALUES ('89', 'productImage/qaz/9/6(3).jpg', '98', '2', '2014-12-22 15:55:54');
INSERT INTO `product_image` VALUES ('90', 'productImage/qaz/9/6(4).jpg', '98', '3', '2014-12-22 15:55:54');
INSERT INTO `product_image` VALUES ('91', 'productImage/qaz/8/5(1).jpg', '99', '0', '2014-12-22 15:57:56');
INSERT INTO `product_image` VALUES ('92', 'productImage/qaz/8/5(2).jpg', '99', '1', '2014-12-22 15:57:56');
INSERT INTO `product_image` VALUES ('93', 'productImage/qaz/8/5(3).jpg', '99', '2', '2014-12-22 15:57:56');
INSERT INTO `product_image` VALUES ('94', 'productImage/qaz/8/5(4).jpg', '99', '3', '2014-12-22 15:57:56');
INSERT INTO `product_image` VALUES ('95', 'productImage/qaz/8/5(5).jpg', '99', '4', '2014-12-22 15:57:56');
INSERT INTO `product_image` VALUES ('96', 'productImage/qaz/9/6(1).jpg', '100', '0', '2014-12-22 15:57:56');
INSERT INTO `product_image` VALUES ('97', 'productImage/qaz/9/6(2).jpg', '100', '1', '2014-12-22 15:57:56');
INSERT INTO `product_image` VALUES ('98', 'productImage/qaz/9/6(3).jpg', '100', '2', '2014-12-22 15:57:56');
INSERT INTO `product_image` VALUES ('99', 'productImage/qaz/9/6(4).jpg', '100', '3', '2014-12-22 15:57:56');
INSERT INTO `product_image` VALUES ('100', 'productImage/qaz/8/5(1).jpg', '101', '0', '2014-12-22 16:14:42');
INSERT INTO `product_image` VALUES ('101', 'productImage/qaz/8/5(2).jpg', '101', '1', '2014-12-22 16:14:42');
INSERT INTO `product_image` VALUES ('102', 'productImage/qaz/8/5(3).jpg', '101', '2', '2014-12-22 16:14:42');
INSERT INTO `product_image` VALUES ('103', 'productImage/qaz/8/5(4).jpg', '101', '3', '2014-12-22 16:14:42');
INSERT INTO `product_image` VALUES ('104', 'productImage/qaz/8/5(5).jpg', '101', '4', '2014-12-22 16:14:42');
INSERT INTO `product_image` VALUES ('105', 'productImage/qaz/9/6(1).jpg', '102', '0', '2014-12-22 16:17:19');
INSERT INTO `product_image` VALUES ('106', 'productImage/qaz/9/6(2).jpg', '102', '1', '2014-12-22 16:17:19');
INSERT INTO `product_image` VALUES ('107', 'productImage/qaz/9/6(3).jpg', '102', '2', '2014-12-22 16:17:19');
INSERT INTO `product_image` VALUES ('108', 'productImage/qaz/9/6(4).jpg', '102', '3', '2014-12-22 16:17:19');
INSERT INTO `product_image` VALUES ('109', 'productImage/qaz/8/5(1).jpg', '103', '0', '2014-12-22 16:20:07');
INSERT INTO `product_image` VALUES ('110', 'productImage/qaz/8/5(2).jpg', '103', '1', '2014-12-22 16:20:07');
INSERT INTO `product_image` VALUES ('111', 'productImage/qaz/8/5(3).jpg', '103', '2', '2014-12-22 16:20:07');
INSERT INTO `product_image` VALUES ('112', 'productImage/qaz/8/5(4).jpg', '103', '3', '2014-12-22 16:20:07');
INSERT INTO `product_image` VALUES ('113', 'productImage/qaz/8/5(5).jpg', '103', '4', '2014-12-22 16:20:07');
INSERT INTO `product_image` VALUES ('114', 'productImage/qaz/9/6(1).jpg', '104', '0', '2014-12-22 16:20:17');
INSERT INTO `product_image` VALUES ('115', 'productImage/qaz/9/6(2).jpg', '104', '1', '2014-12-22 16:20:17');
INSERT INTO `product_image` VALUES ('116', 'productImage/qaz/9/6(3).jpg', '104', '2', '2014-12-22 16:20:17');
INSERT INTO `product_image` VALUES ('117', 'productImage/qaz/9/6(4).jpg', '104', '3', '2014-12-22 16:20:17');
INSERT INTO `product_image` VALUES ('118', 'productImage/qaz/8/5(1).jpg', '105', '0', '2014-12-22 16:21:13');
INSERT INTO `product_image` VALUES ('119', 'productImage/qaz/8/5(2).jpg', '105', '1', '2014-12-22 16:21:13');
INSERT INTO `product_image` VALUES ('120', 'productImage/qaz/8/5(3).jpg', '105', '2', '2014-12-22 16:21:13');
INSERT INTO `product_image` VALUES ('121', 'productImage/qaz/8/5(4).jpg', '105', '3', '2014-12-22 16:21:13');
INSERT INTO `product_image` VALUES ('122', 'productImage/qaz/8/5(5).jpg', '105', '4', '2014-12-22 16:21:13');
INSERT INTO `product_image` VALUES ('123', 'productImage/qaz/9/6(1).jpg', '106', '0', '2014-12-22 16:21:16');
INSERT INTO `product_image` VALUES ('124', 'productImage/qaz/9/6(2).jpg', '106', '1', '2014-12-22 16:21:16');
INSERT INTO `product_image` VALUES ('125', 'productImage/qaz/9/6(3).jpg', '106', '2', '2014-12-22 16:21:16');
INSERT INTO `product_image` VALUES ('126', 'productImage/qaz/9/6(4).jpg', '106', '3', '2014-12-22 16:21:16');
INSERT INTO `product_image` VALUES ('127', 'productImage/qaz/outer5(1).jpg', '107', '0', '2014-12-22 16:21:16');
INSERT INTO `product_image` VALUES ('128', 'productImage/ss/11(1).jpg', '108', '0', '2014-12-27 21:44:30');
INSERT INTO `product_image` VALUES ('129', 'productImage/ss/11(2).jpg', '108', '1', '2014-12-27 21:44:30');
INSERT INTO `product_image` VALUES ('130', 'productImage/ss/11(3).jpg', '108', '2', '2014-12-27 21:44:30');
INSERT INTO `product_image` VALUES ('131', 'productImage/ss/11(4).jpg', '108', '3', '2014-12-27 21:44:30');
INSERT INTO `product_image` VALUES ('132', 'productImage/ss/11(5).jpg', '108', '4', '2014-12-27 21:44:30');
INSERT INTO `product_image` VALUES ('133', 'productImage/ss/11(6).jpg', '108', '5', '2014-12-27 21:44:30');
INSERT INTO `product_image` VALUES ('134', 'productImage/qaz/8/5(1).jpg', '109', '0', '2014-12-29 17:29:44');
INSERT INTO `product_image` VALUES ('135', 'productImage/qaz/8/5(2).jpg', '109', '1', '2014-12-29 17:29:44');
INSERT INTO `product_image` VALUES ('136', 'productImage/qaz/8/5(3).jpg', '109', '2', '2014-12-29 17:29:44');
INSERT INTO `product_image` VALUES ('137', 'productImage/qaz/8/5(4).jpg', '109', '3', '2014-12-29 17:29:44');
INSERT INTO `product_image` VALUES ('138', 'productImage/qaz/8/5(5).jpg', '109', '4', '2014-12-29 17:29:44');
INSERT INTO `product_image` VALUES ('139', 'productImage/qaz/9/6(1).jpg', '110', '0', '2014-12-29 17:29:44');
INSERT INTO `product_image` VALUES ('140', 'productImage/qaz/9/6(2).jpg', '110', '1', '2014-12-29 17:29:44');
INSERT INTO `product_image` VALUES ('141', 'productImage/qaz/9/6(3).jpg', '110', '2', '2014-12-29 17:29:44');
INSERT INTO `product_image` VALUES ('142', 'productImage/qaz/9/6(4).jpg', '110', '3', '2014-12-29 17:29:44');
INSERT INTO `product_image` VALUES ('143', 'productImage/qaz/outer5(1).jpg', '111', '0', '2014-12-29 17:29:44');
INSERT INTO `product_image` VALUES ('144', 'productImage/qaz/9/6(1).jpg', '112', '0', '2015-01-16 16:42:30');
INSERT INTO `product_image` VALUES ('145', 'productImage/qaz/9/6(2).jpg', '112', '1', '2015-01-16 16:42:30');
INSERT INTO `product_image` VALUES ('146', 'productImage/qaz/9/6(3).jpg', '112', '2', '2015-01-16 16:42:30');
INSERT INTO `product_image` VALUES ('147', 'productImage/qaz/9/6(4).jpg', '112', '3', '2015-01-16 16:42:30');

-- ----------------------------
-- Table structure for `product_packet`
-- ----------------------------
DROP TABLE IF EXISTS `product_packet`;
CREATE TABLE `product_packet` (
  `packet_id` int(11) NOT NULL AUTO_INCREMENT,
  `packet_name` varchar(50) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL COMMENT '组合sku还是单个sku',
  `belongto_catory_id` int(11) DEFAULT NULL COMMENT '属于哪一个分类',
  `is_global` tinyint(4) DEFAULT '0' COMMENT '是否全局打包,全局打包，全局打包属性可以任何类目下显示',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`packet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_packet
-- ----------------------------

-- ----------------------------
-- Table structure for `product_packet_item`
-- ----------------------------
DROP TABLE IF EXISTS `product_packet_item`;
CREATE TABLE `product_packet_item` (
  `packet_item_id` int(11) NOT NULL,
  `packet_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `price` float(11,0) NOT NULL,
  `creattime` datetime NOT NULL,
  PRIMARY KEY (`packet_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_packet_item
-- ----------------------------

-- ----------------------------
-- Table structure for `product_sku`
-- ----------------------------
DROP TABLE IF EXISTS `product_sku`;
CREATE TABLE `product_sku` (
  `sku_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `price` float(10,0) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `sku_name` varchar(50) DEFAULT NULL,
  `properties_string` varchar(50) DEFAULT NULL COMMENT '保存各个属性值，每个属性值之间用#分割',
  `image` varchar(50) DEFAULT NULL COMMENT '图像位置',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_sku
-- ----------------------------
INSERT INTO `product_sku` VALUES ('62', '108', '0', '0', '1', '', null, '0', '2014-12-27 22:35:08');
INSERT INTO `product_sku` VALUES ('63', '108', '0', '0', '1', '', null, '0', '2014-12-27 22:35:08');
INSERT INTO `product_sku` VALUES ('64', '108', '0', '0', '1', '', null, '0', '2014-12-27 22:35:09');
INSERT INTO `product_sku` VALUES ('65', '108', '0', '0', '1', '', null, '0', '2014-12-27 22:35:09');
INSERT INTO `product_sku` VALUES ('66', '108', '0', '0', '1', '', null, '0', '2014-12-27 22:35:09');
INSERT INTO `product_sku` VALUES ('67', '108', '0', '0', '1', '', null, '0', '2014-12-27 22:35:09');
INSERT INTO `product_sku` VALUES ('68', '108', '0', '0', '1', '', null, '0', '2014-12-27 22:35:09');
INSERT INTO `product_sku` VALUES ('69', '108', '0', '0', '1', '', null, '0', '2014-12-27 22:35:09');
INSERT INTO `product_sku` VALUES ('70', '108', '0', '0', '1', '', null, '0', '2014-12-27 22:35:09');
INSERT INTO `product_sku` VALUES ('71', '108', '0', '0', '1', '', null, '0', '2014-12-27 22:35:09');
INSERT INTO `product_sku` VALUES ('72', '108', '0', '0', '1', '', null, '0', '2014-12-27 22:35:09');
INSERT INTO `product_sku` VALUES ('73', '108', '0', '0', '1', '', null, '0', '2014-12-27 22:35:09');
INSERT INTO `product_sku` VALUES ('74', '108', '0', '0', '1', '', null, '0', '2014-12-27 22:35:10');
INSERT INTO `product_sku` VALUES ('75', '108', '0', '0', '1', '', null, '0', '2014-12-27 22:35:10');
INSERT INTO `product_sku` VALUES ('76', '108', '0', '0', '1', '', null, '0', '2014-12-27 22:35:10');
INSERT INTO `product_sku` VALUES ('77', '108', '0', '0', '1', '', null, '0', '2014-12-27 22:35:10');
INSERT INTO `product_sku` VALUES ('80', '112', '100', '100', '1', '算法', null, '144', '2015-01-16 16:53:11');
INSERT INTO `product_sku` VALUES ('81', '112', '100', '100', '1', '暗室逢灯asd', null, '145', '2015-01-16 16:53:11');
INSERT INTO `product_sku` VALUES ('82', '112', '100', '100', '1', '阿斯蒂芬asf', null, '146', '2015-01-16 16:53:11');

-- ----------------------------
-- Table structure for `shipping`
-- ----------------------------
DROP TABLE IF EXISTS `shipping`;
CREATE TABLE `shipping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名字（物流）',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否可以用',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shipping
-- ----------------------------
INSERT INTO `shipping` VALUES ('1', 'ems', '1', '', '2014-10-14 14:30:08');
INSERT INTO `shipping` VALUES ('2', 'e-packet', '1', 'asjdfjasf', '2014-10-15 13:04:44');
INSERT INTO `shipping` VALUES ('3', 'expressxx', '1', 'xx', '2014-10-16 17:23:42');
INSERT INTO `shipping` VALUES ('5', '啊啊', '1', '啊啊', '2014-10-17 16:48:45');

-- ----------------------------
-- Table structure for `shipping_country`
-- ----------------------------
DROP TABLE IF EXISTS `shipping_country`;
CREATE TABLE `shipping_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名字（物流）',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否可以用',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shipping_country
-- ----------------------------
INSERT INTO `shipping_country` VALUES ('5', '啊啊', '1', '啊啊', '2014-10-17 16:50:43');
INSERT INTO `shipping_country` VALUES ('6', '啊啊3', '1', '啊啊3', '2015-01-05 17:08:58');
INSERT INTO `shipping_country` VALUES ('7', '啊啊4', '1', '啊啊4', '2015-01-05 17:08:52');
INSERT INTO `shipping_country` VALUES ('8', '啊啊5', '1', '啊啊5', '2015-01-05 17:08:46');
INSERT INTO `shipping_country` VALUES ('9', '啊啊爱疯', '0', '啊啊阿道夫', '2014-10-17 16:56:05');

-- ----------------------------
-- Table structure for `shipping_template`
-- ----------------------------
DROP TABLE IF EXISTS `shipping_template`;
CREATE TABLE `shipping_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名字（物流）',
  `status` tinyint(4) DEFAULT NULL COMMENT '是否可以用',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shipping_template
-- ----------------------------
INSERT INTO `shipping_template` VALUES ('31', 'jjbb', null, null, '2014-10-29 15:31:19');
INSERT INTO `shipping_template` VALUES ('32', 'cc', null, null, '2014-10-29 15:42:29');
INSERT INTO `shipping_template` VALUES ('33', 'jjaab', null, null, '2014-11-02 15:45:35');
INSERT INTO `shipping_template` VALUES ('34', 'my1', null, null, '2014-11-02 15:56:32');
INSERT INTO `shipping_template` VALUES ('35', 'aa', null, null, '2014-11-02 16:06:45');

-- ----------------------------
-- Table structure for `shipping_template_fee`
-- ----------------------------
DROP TABLE IF EXISTS `shipping_template_fee`;
CREATE TABLE `shipping_template_fee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `templateId` int(11) NOT NULL COMMENT '模板id',
  `shippingId` int(11) NOT NULL COMMENT '物流id',
  `shippingStyle` tinyint(5) NOT NULL COMMENT '设置运费的方式（全局统一，还是自定义）',
  `shippingCountryIds` varchar(200) DEFAULT '1' COMMENT '货运国家的所有id（用“|”隔开）',
  `selectMode` tinyint(4) DEFAULT NULL COMMENT '方式（标准，还是自定义）',
  `standardFee` float(11,4) DEFAULT NULL COMMENT '标准费用',
  `selectQWPattern` tinyint(4) DEFAULT NULL COMMENT '按照重量还是按照数量',
  `cl_min` int(10) DEFAULT NULL COMMENT '首重最低采购量',
  `cl_max` int(10) DEFAULT NULL COMMENT '首重最高采购量',
  `cl_price` int(10) DEFAULT NULL COMMENT '首重运费',
  `cl_add_num` int(10) DEFAULT NULL COMMENT '每增加产品数',
  `cl_add_price` int(10) DEFAULT NULL COMMENT '续加运费',
  `weight_end0` float(10,4) DEFAULT NULL COMMENT '首重',
  `weight_price0` float(10,4) DEFAULT NULL COMMENT '首重运费',
  `weight_end1` float(10,4) DEFAULT NULL COMMENT '续重范围',
  `weight_interval1` float(10,4) DEFAULT NULL COMMENT '此区间每增加重量',
  `weight_price1` float(10,4) DEFAULT NULL COMMENT '续加运费',
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shipping_template_fee
-- ----------------------------
INSERT INTO `shipping_template_fee` VALUES ('229', '33', '1', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2014-11-02 15:45:35');
INSERT INTO `shipping_template_fee` VALUES ('230', '33', '2', '1', '5|6', '1', '1.0000', null, null, null, null, null, null, null, null, null, null, null, '2014-11-02 15:45:36');
INSERT INTO `shipping_template_fee` VALUES ('231', '33', '3', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2014-11-02 15:45:36');
INSERT INTO `shipping_template_fee` VALUES ('232', '33', '5', '1', '5|6', '1', '34.0000', null, null, null, null, null, null, null, null, null, null, null, '2014-11-02 15:45:36');
INSERT INTO `shipping_template_fee` VALUES ('233', '33', '5', '1', '7', '2', null, '1', '1', '23', '23', '23', '23', null, null, null, null, null, '2014-11-02 15:45:36');
INSERT INTO `shipping_template_fee` VALUES ('234', '33', '5', '1', '8|9', '2', null, '2', null, null, null, null, null, '23.0000', '23.0000', '23.0000', '23.0000', '23.0000', '2014-11-02 15:45:36');
INSERT INTO `shipping_template_fee` VALUES ('238', '34', '1', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2014-11-02 15:56:32');
INSERT INTO `shipping_template_fee` VALUES ('239', '34', '2', '1', '6', '1', '11.0000', null, null, null, null, null, null, null, null, null, null, null, '2014-11-02 15:56:32');
INSERT INTO `shipping_template_fee` VALUES ('240', '34', '2', '1', '7|8', '2', null, '1', '1', '1', '1', '1', '1', null, null, null, null, null, '2014-11-02 15:56:32');
INSERT INTO `shipping_template_fee` VALUES ('242', '35', '1', '1', '7|8', '2', null, '1', '1', '23', '23', '23', '23', null, null, null, null, null, '2014-11-02 16:06:45');

-- ----------------------------
-- Table structure for `shipping_template_time`
-- ----------------------------
DROP TABLE IF EXISTS `shipping_template_time`;
CREATE TABLE `shipping_template_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `templateId` int(11) NOT NULL COMMENT '名字（物流）',
  `shippingId` int(11) NOT NULL DEFAULT '1' COMMENT '是否可以用',
  `timeStyle` tinyint(5) NOT NULL COMMENT '设置时间的方式（全局统一，还是自定义）',
  `shippingCountryIds` varchar(200) DEFAULT NULL COMMENT '备注',
  `shippingTime` varchar(50) NOT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shipping_template_time
-- ----------------------------
INSERT INTO `shipping_template_time` VALUES ('132', '33', '1', '0', null, '71', '2014-11-02 15:45:36');
INSERT INTO `shipping_template_time` VALUES ('133', '33', '2', '0', null, '11', '2014-11-02 15:45:36');
INSERT INTO `shipping_template_time` VALUES ('134', '33', '3', '1', '5|6', '44', '2014-11-02 15:45:36');
INSERT INTO `shipping_template_time` VALUES ('135', '33', '5', '1', '6', '22', '2014-11-02 15:45:36');
INSERT INTO `shipping_template_time` VALUES ('136', '33', '5', '1', '9', '323', '2014-11-02 15:45:36');
INSERT INTO `shipping_template_time` VALUES ('140', '34', '1', '0', null, '12', '2014-11-02 15:56:32');
INSERT INTO `shipping_template_time` VALUES ('141', '34', '2', '1', '6', '12', '2014-11-02 15:56:32');
INSERT INTO `shipping_template_time` VALUES ('143', '35', '1', '1', '8', '23', '2014-11-02 16:06:45');
INSERT INTO `shipping_template_time` VALUES ('144', '35', '1', '1', '7', '22', '2014-11-02 16:06:45');

-- ----------------------------
-- Table structure for `sku_atrvalue`
-- ----------------------------
DROP TABLE IF EXISTS `sku_atrvalue`;
CREATE TABLE `sku_atrvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` int(11) DEFAULT NULL,
  `attr_value_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8 COMMENT='产品sku和属性值的中间表';

-- ----------------------------
-- Records of sku_atrvalue
-- ----------------------------
INSERT INTO `sku_atrvalue` VALUES ('75', '45', '59');
INSERT INTO `sku_atrvalue` VALUES ('76', '45', '41');
INSERT INTO `sku_atrvalue` VALUES ('77', '45', '40');
INSERT INTO `sku_atrvalue` VALUES ('78', '46', '59');
INSERT INTO `sku_atrvalue` VALUES ('79', '46', '42');
INSERT INTO `sku_atrvalue` VALUES ('80', '46', '40');
INSERT INTO `sku_atrvalue` VALUES ('81', '47', '60');
INSERT INTO `sku_atrvalue` VALUES ('82', '47', '41');
INSERT INTO `sku_atrvalue` VALUES ('83', '47', '40');
INSERT INTO `sku_atrvalue` VALUES ('84', '48', '60');
INSERT INTO `sku_atrvalue` VALUES ('85', '48', '42');
INSERT INTO `sku_atrvalue` VALUES ('86', '48', '40');
INSERT INTO `sku_atrvalue` VALUES ('87', '49', '35');
INSERT INTO `sku_atrvalue` VALUES ('88', '49', '15');
INSERT INTO `sku_atrvalue` VALUES ('89', '50', '35');
INSERT INTO `sku_atrvalue` VALUES ('90', '50', '17');
INSERT INTO `sku_atrvalue` VALUES ('91', '51', '36');
INSERT INTO `sku_atrvalue` VALUES ('92', '51', '15');
INSERT INTO `sku_atrvalue` VALUES ('93', '52', '36');
INSERT INTO `sku_atrvalue` VALUES ('94', '52', '17');
INSERT INTO `sku_atrvalue` VALUES ('95', '53', '59');
INSERT INTO `sku_atrvalue` VALUES ('96', '53', '14');
INSERT INTO `sku_atrvalue` VALUES ('97', '54', '59');
INSERT INTO `sku_atrvalue` VALUES ('98', '54', '15');
INSERT INTO `sku_atrvalue` VALUES ('99', '55', '59');
INSERT INTO `sku_atrvalue` VALUES ('100', '55', '16');
INSERT INTO `sku_atrvalue` VALUES ('101', '56', '60');
INSERT INTO `sku_atrvalue` VALUES ('102', '56', '14');
INSERT INTO `sku_atrvalue` VALUES ('103', '57', '60');
INSERT INTO `sku_atrvalue` VALUES ('104', '57', '15');
INSERT INTO `sku_atrvalue` VALUES ('105', '58', '60');
INSERT INTO `sku_atrvalue` VALUES ('106', '58', '16');
INSERT INTO `sku_atrvalue` VALUES ('107', '59', '61');
INSERT INTO `sku_atrvalue` VALUES ('108', '59', '14');
INSERT INTO `sku_atrvalue` VALUES ('109', '60', '61');
INSERT INTO `sku_atrvalue` VALUES ('110', '60', '15');
INSERT INTO `sku_atrvalue` VALUES ('111', '61', '61');
INSERT INTO `sku_atrvalue` VALUES ('112', '61', '16');
INSERT INTO `sku_atrvalue` VALUES ('113', '62', '59');
INSERT INTO `sku_atrvalue` VALUES ('114', '62', '14');
INSERT INTO `sku_atrvalue` VALUES ('115', '63', '59');
INSERT INTO `sku_atrvalue` VALUES ('116', '63', '15');
INSERT INTO `sku_atrvalue` VALUES ('117', '64', '59');
INSERT INTO `sku_atrvalue` VALUES ('118', '64', '16');
INSERT INTO `sku_atrvalue` VALUES ('119', '65', '59');
INSERT INTO `sku_atrvalue` VALUES ('120', '65', '17');
INSERT INTO `sku_atrvalue` VALUES ('121', '66', '60');
INSERT INTO `sku_atrvalue` VALUES ('122', '66', '14');
INSERT INTO `sku_atrvalue` VALUES ('123', '67', '60');
INSERT INTO `sku_atrvalue` VALUES ('124', '67', '15');
INSERT INTO `sku_atrvalue` VALUES ('125', '68', '60');
INSERT INTO `sku_atrvalue` VALUES ('126', '68', '16');
INSERT INTO `sku_atrvalue` VALUES ('127', '69', '60');
INSERT INTO `sku_atrvalue` VALUES ('128', '69', '17');
INSERT INTO `sku_atrvalue` VALUES ('129', '70', '61');
INSERT INTO `sku_atrvalue` VALUES ('130', '70', '14');
INSERT INTO `sku_atrvalue` VALUES ('131', '71', '61');
INSERT INTO `sku_atrvalue` VALUES ('132', '71', '15');
INSERT INTO `sku_atrvalue` VALUES ('133', '72', '61');
INSERT INTO `sku_atrvalue` VALUES ('134', '72', '16');
INSERT INTO `sku_atrvalue` VALUES ('135', '73', '61');
INSERT INTO `sku_atrvalue` VALUES ('136', '73', '17');
INSERT INTO `sku_atrvalue` VALUES ('137', '74', '62');
INSERT INTO `sku_atrvalue` VALUES ('138', '74', '14');
INSERT INTO `sku_atrvalue` VALUES ('139', '75', '62');
INSERT INTO `sku_atrvalue` VALUES ('140', '75', '15');
INSERT INTO `sku_atrvalue` VALUES ('141', '76', '62');
INSERT INTO `sku_atrvalue` VALUES ('142', '76', '16');
INSERT INTO `sku_atrvalue` VALUES ('143', '77', '62');
INSERT INTO `sku_atrvalue` VALUES ('144', '77', '17');
INSERT INTO `sku_atrvalue` VALUES ('145', '78', '14');
INSERT INTO `sku_atrvalue` VALUES ('146', '79', '15');
INSERT INTO `sku_atrvalue` VALUES ('147', '80', '14');
INSERT INTO `sku_atrvalue` VALUES ('148', '81', '15');
INSERT INTO `sku_atrvalue` VALUES ('149', '82', '16');

-- ----------------------------
-- Table structure for `songhuo`
-- ----------------------------
DROP TABLE IF EXISTS `songhuo`;
CREATE TABLE `songhuo` (
  `sh_id` int(11) NOT NULL AUTO_INCREMENT,
  `sh_name` varchar(50) DEFAULT NULL,
  `sh_jiage` float DEFAULT NULL,
  `sh_shuoming` varchar(100) DEFAULT NULL,
  `sh_beizhu` varchar(100) DEFAULT NULL,
  `sh_state` int(10) DEFAULT NULL,
  PRIMARY KEY (`sh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of songhuo
-- ----------------------------

-- ----------------------------
-- Table structure for `storedescription`
-- ----------------------------
DROP TABLE IF EXISTS `storedescription`;
CREATE TABLE `storedescription` (
  `id` int(10) NOT NULL,
  `storedescription` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storedescription
-- ----------------------------

-- ----------------------------
-- Table structure for `storefooterinfo`
-- ----------------------------
DROP TABLE IF EXISTS `storefooterinfo`;
CREATE TABLE `storefooterinfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `fatherid` int(10) NOT NULL,
  `status` tinyint(5) NOT NULL DEFAULT '1',
  `pagename` varchar(100) DEFAULT NULL COMMENT '需要添加的内容所在的页面名称，系统会根据这个页面名称自动的根据已经构建的模版在相应位置生成页面',
  `image` varchar(50) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storefooterinfo
-- ----------------------------
INSERT INTO `storefooterinfo` VALUES ('1', '首页显示信息', '0', '0', '0', null, '2014-11-09 19:51:53');
INSERT INTO `storefooterinfo` VALUES ('37', '公司信息', '1', '1', 'common/footer/', '', '2014-12-12 17:08:46');
INSERT INTO `storefooterinfo` VALUES ('38', '公司信息1', '37', '0', 'common/footer/info1.jsp', '', '2014-12-12 17:20:50');
INSERT INTO `storefooterinfo` VALUES ('39', '联系我们', '1', '1', 'common/footer/', '', '2014-12-12 17:07:46');
INSERT INTO `storefooterinfo` VALUES ('40', 'cont1', '39', '1', 'common/footer/cont1.jsp', '', '2014-12-12 17:21:18');
INSERT INTO `storefooterinfo` VALUES ('41', 'hi', '1', '1', 'common/footer/', '', '2014-12-15 12:44:22');
INSERT INTO `storefooterinfo` VALUES ('42', 'Company Info', '41', '1', 'common/footer/jj.jsp', '', '2014-12-15 12:45:08');

-- ----------------------------
-- Table structure for `storefooterinfomultilanguage`
-- ----------------------------
DROP TABLE IF EXISTS `storefooterinfomultilanguage`;
CREATE TABLE `storefooterinfomultilanguage` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `storefooterinfoid` int(10) NOT NULL COMMENT '所属的页脚信息',
  `lanid` int(10) NOT NULL COMMENT '语言id',
  `name` varchar(50) DEFAULT NULL,
  `content` text,
  `title` varchar(50) DEFAULT NULL,
  `keyword` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `modifytime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storefooterinfomultilanguage
-- ----------------------------
INSERT INTO `storefooterinfomultilanguage` VALUES ('64', '37', '7', 'copanyinfo', null, '', '', '', '2014-12-12 17:05:57', '2014-12-12 17:05:57');
INSERT INTO `storefooterinfomultilanguage` VALUES ('65', '37', '8', '', null, '', '', '', '2014-12-12 17:05:57', '2014-12-12 17:05:57');
INSERT INTO `storefooterinfomultilanguage` VALUES ('66', '37', '9', '', null, '', '', '', '2014-12-12 17:05:57', '2014-12-12 17:05:57');
INSERT INTO `storefooterinfomultilanguage` VALUES ('67', '38', '7', 'info1', null, '', '', '', '2014-12-12 17:06:33', '2014-12-12 17:18:59');
INSERT INTO `storefooterinfomultilanguage` VALUES ('68', '38', '8', '', null, '', '', '', '2014-12-12 17:06:33', '2014-12-12 17:06:33');
INSERT INTO `storefooterinfomultilanguage` VALUES ('69', '38', '9', '', null, '', '', '', '2014-12-12 17:06:33', '2014-12-12 17:06:33');
INSERT INTO `storefooterinfomultilanguage` VALUES ('70', '39', '7', 'contantus', null, '', '', '', '2014-12-12 17:07:19', '2014-12-12 17:07:44');
INSERT INTO `storefooterinfomultilanguage` VALUES ('71', '39', '8', '', null, '', '', '', '2014-12-12 17:07:19', '2014-12-12 17:07:19');
INSERT INTO `storefooterinfomultilanguage` VALUES ('72', '39', '9', '', null, '', '', '', '2014-12-12 17:07:19', '2014-12-12 17:07:19');
INSERT INTO `storefooterinfomultilanguage` VALUES ('73', '40', '7', 'cont1', null, '', '', '', '2014-12-12 17:21:18', '2014-12-12 17:21:18');
INSERT INTO `storefooterinfomultilanguage` VALUES ('74', '40', '8', '', null, '', '', '', '2014-12-12 17:21:18', '2014-12-12 17:21:18');
INSERT INTO `storefooterinfomultilanguage` VALUES ('75', '40', '9', '', null, '', '', '', '2014-12-12 17:21:18', '2014-12-12 17:21:18');
INSERT INTO `storefooterinfomultilanguage` VALUES ('76', '41', '7', 'hii', null, '', '', '', '2014-12-15 12:44:22', '2014-12-15 12:44:22');
INSERT INTO `storefooterinfomultilanguage` VALUES ('77', '41', '8', 'hiru', null, '', '', '', '2014-12-15 12:44:22', '2014-12-15 12:44:22');
INSERT INTO `storefooterinfomultilanguage` VALUES ('78', '41', '9', '', null, '', '', '', '2014-12-15 12:44:22', '2014-12-15 12:44:22');
INSERT INTO `storefooterinfomultilanguage` VALUES ('79', '42', '7', 'Company Info', '<h1 class=\"static_h1\" style=\"margin: 0px 0px 10px; padding: 10px 0px; font-size: 24px; line-height: 24px; font-family: Verdana, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">About LightInTheBox</h1><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px 0px; line-height: 18px; color: rgb(102, 102, 102); font-family: Verdana, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);\">LightInTheBox is a global online retail company that delivers products directly to consumers around the world. Founded in 2007, LightInTheBox has offered customers a convenient way to shop for a wide selection of lifestyle products at attractive prices through www.lightinthebox.com, www.miniinthebox.com, and other websites, which are available in multiple major languages.</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px 0px; line-height: 18px; color: rgb(102, 102, 102); font-family: Verdana, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);\">LightInTheBox offers products in the three core categories of apparel, small accessories and gadgets and home and garden.</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px 0px; line-height: 18px; color: rgb(102, 102, 102); font-family: Verdana, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);\">LightInTheBox&#39;s innovative data-driven business model allows itself to offer customized products, such as wedding dress and evening dress, at scale for optimal marketing, merchandising and fulfillment.</p><h1 class=\"static_h1\" style=\"margin: 20px 0px 10px; padding: 10px 0px; font-size: 24px; line-height: 24px; font-family: Verdana, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">Legal Information</h1><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px 0px; line-height: 18px; color: rgb(102, 102, 102); font-family: Verdana, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);\">Please do not send any return items to the addresses below, returns sent to these addresses cannot be processed.&nbsp;<br/>If you need to return a product, please&nbsp;<a class=\"blue u\" href=\"http://www.lightinthebox.com/r/contact-us.html\" style=\"color: rgb(173, 50, 49);\">contact customer service</a>&nbsp;by submitting a ticket.</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px 0px; line-height: 18px; color: rgb(102, 102, 102); font-family: Verdana, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);\">US Address:<br/>808 Howell St #300<br/>Seattle, WA, 98101</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px 0px; line-height: 18px; color: rgb(102, 102, 102); font-family: Verdana, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);\">US EIN: 46-4354332</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px 0px; line-height: 18px; color: rgb(102, 102, 102); font-family: Verdana, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);\">China Address:<br/>Diantong Shidai Guangchang, Building #2 Suite D<br/>7 Jiuxianqiao Beilu, Chaoyang District, Beijing, China</p><p><br/></p>', '', '', '', '2014-12-15 12:45:08', '2014-12-15 12:45:28');
INSERT INTO `storefooterinfomultilanguage` VALUES ('80', '42', '8', 'Company Info3434', '<h1 class=\"static_h1\" style=\"margin: 20px 0px 10px; padding: 10px 0px; font-size: 24px; line-height: 24px; font-family: Verdana, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">Legal Information</h1><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px 0px; line-height: 18px; color: rgb(102, 102, 102); font-family: Verdana, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);\">Please do not send any return items to the addresses below, returns sent to these addresses cannot be processed.&nbsp;<br/>If you need to return a product, please&nbsp;<a class=\"blue u\" href=\"http://www.lightinthebox.com/r/contact-us.html\" style=\"color: rgb(173, 50, 49);\">contact customer service</a>&nbsp;by submitting a ticket.</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px 0px; line-height: 18px; color: rgb(102, 102, 102); font-family: Verdana, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);\">US Address:<br/>808 Howell St #300<br/>Seattle, WA, 98101</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px 0px; line-height: 18px; color: rgb(102, 102, 102); font-family: Verdana, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);\">US EIN: 46-4354332</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px 0px; line-height: 18px; color: rgb(102, 102, 102); font-family: Verdana, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);\">China Address:<br/>Diantong Shidai Guangchang, Building #2 Suite D<br/>7 Jiuxianqiao Beilu, Chaoyang District, Beijing, China</p><p><br/></p>', '', '', '', '2014-12-15 12:45:08', '2014-12-15 12:45:35');
INSERT INTO `storefooterinfomultilanguage` VALUES ('81', '42', '9', '', null, '', '', '', '2014-12-15 12:45:08', '2014-12-15 12:45:08');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `userpassword` varchar(50) NOT NULL,
  `userrealname` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `usertel` varchar(20) DEFAULT NULL,
  `usermail` varchar(50) NOT NULL,
  `userlevel` int(11) DEFAULT NULL COMMENT '用户级别',
  `sex` tinyint(5) DEFAULT NULL,
  `passwordtishi` varchar(50) DEFAULT NULL,
  `passworddaan` varchar(50) DEFAULT NULL,
  `totalbuycount` double(50,0) DEFAULT NULL COMMENT '用户所有的购买金额',
  `status` tinyint(5) NOT NULL DEFAULT '1' COMMENT '是否可用(0：可用，1不可用）',
  `timeforgetpass` bigint(50) DEFAULT NULL COMMENT '获取密码时的时间（以毫秒为单位）',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `lasttime` datetime NOT NULL COMMENT '更改时间',
  `u_id` int(11) DEFAULT NULL,
  `u_name` varchar(50) DEFAULT NULL,
  `u_password` varchar(50) DEFAULT NULL,
  `u_type` varchar(50) DEFAULT NULL,
  `zctime` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'root', null, null, '', '1', null, null, null, null, '1', '1415261731011', '2013-12-24 00:00:00', '2013-12-26 00:00:00', null, null, null, null, null);
INSERT INTO `user` VALUES ('2', 'cisco', 'cisco', null, null, '', '1', null, null, null, null, '1', null, '2013-12-25 21:49:01', '2013-12-25 21:49:13', null, null, null, null, null);
INSERT INTO `user` VALUES ('3', 'my', 'my', null, null, '', '1', null, null, null, null, '1', null, '2014-01-02 21:49:35', '2014-01-02 21:49:39', null, null, null, null, null);
INSERT INTO `user` VALUES ('4', 'yours', 'yours', null, '13436789087', '2@123.com', '2', null, null, null, null, '0', null, '2013-12-04 21:49:52', '2013-12-06 21:49:56', null, null, null, null, null);
INSERT INTO `user` VALUES ('5', 'lili', 'lili', null, '13436838059', '2@2.com', '2', null, null, null, null, '0', null, '2013-12-28 21:50:13', '2014-02-08 21:50:17', null, null, null, null, null);
INSERT INTO `user` VALUES ('6', 'a', 'aaaaaa', null, null, '12@123.com', null, null, null, null, null, '1', null, '2014-11-03 17:06:35', '2014-11-03 17:06:35', null, null, null, null, null);
INSERT INTO `user` VALUES ('7', 'aa', 'aaaaaa', null, null, '1@126.com', null, null, null, null, null, '1', '1415262538906', '2014-11-03 17:12:39', '2014-11-03 17:12:39', null, null, null, null, null);

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `uinfoid` int(11) NOT NULL AUTO_INCREMENT,
  `uinfouid` int(11) NOT NULL,
  `uinfoaddr` varchar(200) DEFAULT NULL COMMENT '用户地址',
  `uinfotel` varchar(20) DEFAULT NULL COMMENT '邮寄电话',
  `uinfopostcode` varchar(50) DEFAULT NULL COMMENT '用户邮编',
  PRIMARY KEY (`uinfoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `zhifu`
-- ----------------------------
DROP TABLE IF EXISTS `zhifu`;
CREATE TABLE `zhifu` (
  `zf_id` int(11) NOT NULL AUTO_INCREMENT,
  `zf_name` varchar(50) DEFAULT NULL,
  `zf_state` int(10) DEFAULT NULL,
  `zf_time` datetime DEFAULT NULL,
  PRIMARY KEY (`zf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zhifu
-- ----------------------------
