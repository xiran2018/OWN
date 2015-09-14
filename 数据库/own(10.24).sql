/*
Navicat MySQL Data Transfer

Source Server         : own
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : own

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2014-10-27 09:02:35
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attribute
-- ----------------------------
INSERT INTO `attribute` VALUES ('2', 'size', '大小', '2', null, '2', null, null, null, '1', null, null, null, '0', '', null, '', '2014-01-18 20:02:50');
INSERT INTO `attribute` VALUES ('3', 'slajfl', '法律卷发', '47', null, '3', null, null, null, '1', null, null, null, '1', '', null, '', '2014-01-18 20:14:06');
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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

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
INSERT INTO `attributemultilanguage` VALUES ('35', '0', '13', 'color', 'size', '2', null);
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
INSERT INTO `attributemultilanguage` VALUES ('71', '7', '37', '', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('72', '8', '37', '', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('73', '7', '38', '', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('74', '8', '38', '', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('75', '7', '39', '', '', '', '');
INSERT INTO `attributemultilanguage` VALUES ('76', '8', '39', '', '', '', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attribute_value
-- ----------------------------
INSERT INTO `attribute_value` VALUES ('1', '你好', '9', null, '4', null, '2014-01-18 21:12:45');
INSERT INTO `attribute_value` VALUES ('2', '好的', '9', null, '4', null, '2014-01-18 21:12:45');
INSERT INTO `attribute_value` VALUES ('3', '我的', '9', null, '4', null, '2014-01-18 21:12:45');
INSERT INTO `attribute_value` VALUES ('4', '那里', '9', null, '4', null, '2014-01-18 21:12:45');
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
INSERT INTO `attribute_value` VALUES ('22', 'jjj', '15', null, '2', null, '2014-01-19 19:47:09');
INSERT INTO `attribute_value` VALUES ('23', 'jjjj', '15', null, '2', null, '2014-01-19 19:47:09');
INSERT INTO `attribute_value` VALUES ('24', 'lkkkljl', '16', null, '4', null, '2014-01-19 19:48:03');
INSERT INTO `attribute_value` VALUES ('25', 'kljlj', '16', null, '4', null, '2014-01-19 19:48:03');
INSERT INTO `attribute_value` VALUES ('26', 'kljlj', '16', null, '4', null, '2014-01-19 19:48:03');
INSERT INTO `attribute_value` VALUES ('27', 'jljl', '16', null, '4', null, '2014-01-19 19:48:03');
INSERT INTO `attribute_value` VALUES ('29', '版本', '19', null, '2', null, '2014-08-12 14:17:22');
INSERT INTO `attribute_value` VALUES ('30', 'bb', '19', null, '2', null, '2014-08-12 14:17:22');
INSERT INTO `attribute_value` VALUES ('31', '69642', '19', null, '2', null, '2014-08-12 14:17:22');
INSERT INTO `attribute_value` VALUES ('32', 'bb吧b', '19', null, '2', null, '2014-08-12 14:17:22');
INSERT INTO `attribute_value` VALUES ('33', '臭臭', '20', null, '2', null, '2014-08-12 14:20:20');
INSERT INTO `attribute_value` VALUES ('34', '臭臭', '20', null, '2', null, '2014-08-12 14:20:20');
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
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

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
INSERT INTO `attribute_valuemultilanguage` VALUES ('49', '0', '13', 'faklds', '11', null, '46');
INSERT INTO `attribute_valuemultilanguage` VALUES ('50', '0', '14', '红', '13', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('51', '0', '15', '慌', '13', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('52', '0', '16', '绿', '13', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('53', '0', '17', '蓝', '13', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('54', '0', '18', '清', '13', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('55', '0', '19', 'jjj', '15', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('56', '0', '20', 'jjjjkkk', '15', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('57', '0', '21', 'jjj', '15', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('58', '0', '22', 'jjj', '15', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('59', '0', '23', 'jjjj', '15', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('60', '0', '24', 'lkkkljl', '16', null, '4');
INSERT INTO `attribute_valuemultilanguage` VALUES ('61', '0', '25', 'kljlj', '16', null, '4');
INSERT INTO `attribute_valuemultilanguage` VALUES ('62', '0', '26', 'kljlj', '16', null, '4');
INSERT INTO `attribute_valuemultilanguage` VALUES ('63', '0', '27', 'jljl', '16', null, '4');
INSERT INTO `attribute_valuemultilanguage` VALUES ('64', '0', '29', '版本', '19', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('65', '0', '30', 'bb', '19', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('66', '0', '31', 'bb吧', '19', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('67', '0', '32', 'bb吧b', '19', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('68', '0', '33', '臭臭', '20', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('69', '0', '34', '臭臭', '20', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('70', '0', '35', '臭臭', '20', null, '2');
INSERT INTO `attribute_valuemultilanguage` VALUES ('71', '0', '36', '臭臭', '20', null, '2');
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
INSERT INTO `attribute_valuemultilanguage` VALUES ('112', '7', '59', '', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('113', '8', '59', '', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('114', '7', '60', '', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('115', '8', '60', '', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('116', '7', '61', '', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('117', '8', '61', '', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('118', '7', '62', '', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('119', '8', '62', '', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('120', '7', '63', '', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('121', '8', '63', '', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('122', '7', '64', 'xx', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('123', '8', '64', '', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('124', '7', '65', '', '', '', '');
INSERT INTO `attribute_valuemultilanguage` VALUES ('125', '8', '65', '', '', '', '');

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
  `image` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '商品分类', '0', '商品类目', null, '1', '0', null, null, null, null, '2013-12-28 11:29:32');
INSERT INTO `category` VALUES ('2', '婚纱礼服', '1', '婚纱礼服', null, '1', '0', null, null, null, null, '2013-12-28 15:01:00');
INSERT INTO `category` VALUES ('3', '长袖', '2', '长袖', null, '1', '0', null, null, null, null, '2013-12-28 16:46:19');
INSERT INTO `category` VALUES ('4', '箱包', '1', '箱包', null, '1', '0', null, null, null, null, '2013-12-28 16:46:48');
INSERT INTO `category` VALUES ('5', '花纹', '4', '花纹', null, '0', '0', null, null, null, null, '2013-12-28 16:47:16');
INSERT INTO `category` VALUES ('7', 'aa', '3', 'aa', null, '0', '0', 'upload/categoryImage/2014101317182262715.png', 'aa', 'aa', 'aa', '2013-12-30 17:09:44');
INSERT INTO `category` VALUES ('46', '大鞋子', '1', '大鞋子', null, '1', '0', null, '大鞋子', '大鞋子', '大鞋子', '2014-01-03 23:02:46');
INSERT INTO `category` VALUES ('47', 'украшения', '1', '饰品', null, '0', '0', null, '饰品', '饰品', '饰品', '2014-01-03 23:04:07');
INSERT INTO `category` VALUES ('48', '饰品', '46', '蝎子', null, '0', '0', null, '鞋子啊', '鞋子啊', '鞋子啊', '2014-01-05 13:20:57');
INSERT INTO `category` VALUES ('49', '俺的沙发', '1', '俺的沙发', null, '1', '0', null, '', '', '', '2014-01-19 19:54:30');
INSERT INTO `category` VALUES ('50', 'sdf', '2', 'sdf', null, '0', '0', null, 'sdf', 'sdf', 'sdf', '2014-08-16 23:01:40');
INSERT INTO `category` VALUES ('51', 'aa', '1', 'aa', null, '0', '0', null, null, null, null, '2014-08-29 15:06:51');
INSERT INTO `category` VALUES ('52', '男士鞋子', '1', null, null, '1', '0', null, null, null, null, '2014-08-29 15:16:37');
INSERT INTO `category` VALUES ('53', 'dd', '1', null, null, '1', '0', null, null, null, null, '2014-08-29 15:33:23');
INSERT INTO `category` VALUES ('54', 'dd', '1', null, null, '1', '0', null, null, null, null, '2014-08-29 15:34:25');
INSERT INTO `category` VALUES ('56', '2323', '52', null, '0', '0', '0', null, null, null, null, '2014-09-10 12:25:59');
INSERT INTO `category` VALUES ('57', 'sdf', '2', null, '0', '0', '0', null, null, null, null, '2014-09-10 15:10:13');
INSERT INTO `category` VALUES ('58', '56', '2', null, '0', '0', '0', null, null, null, null, '2014-09-10 15:15:45');
INSERT INTO `category` VALUES ('59', '11', '54', null, '0', '1', '0', null, null, null, null, '2014-10-12 23:00:32');
INSERT INTO `category` VALUES ('60', '22', '59', null, '0', '0', '0', 'upload/categoryImage/2014101223025059891.jpg', null, null, null, '2014-10-12 23:03:07');
INSERT INTO `category` VALUES ('61', 'xx', '53', null, '0', '0', '0', 'upload/categoryImage/2014101223060020428.jpg', null, null, null, '2014-10-12 23:06:14');
INSERT INTO `category` VALUES ('62', '12', '54', null, '0', '0', '1', 'upload/categoryImage/2014101223080014145.jpg', null, null, null, '2014-10-12 23:08:15');
INSERT INTO `category` VALUES ('63', '123', '54', null, '0', '0', '1', '', null, null, null, '2014-10-12 23:09:02');
INSERT INTO `category` VALUES ('64', '13', '54', null, '0', '0', '1', 'upload/categoryImage/2014101223143338728.jpg', null, null, null, '2014-10-12 23:14:41');
INSERT INTO `category` VALUES ('65', '23', '49', null, '0', '0', '0', 'upload/categoryImage/2014101314494554321.jpg', null, null, null, '2014-10-13 12:56:31');
INSERT INTO `category` VALUES ('66', '23', '49', null, '0', '0', '1', 'upload/categoryImage/2014101312555343160.png', null, null, null, '2014-10-13 12:57:15');
INSERT INTO `category` VALUES ('67', 'xx', '1', null, '0', '0', '1', 'upload/categoryImage/2014101316361558737.png', null, null, null, '2014-10-13 16:36:21');
INSERT INTO `category` VALUES ('68', 'xf才', '1', null, '0', '0', '0', 'upload/categoryImage/2014101316464186110.png', null, null, null, '2014-10-13 16:43:07');
INSERT INTO `category` VALUES ('69', 'zzz', '1', null, '0', '0', '0', 'upload/categoryImage/2014101316430291350.png', null, null, null, '2014-10-13 16:48:25');
INSERT INTO `category` VALUES ('70', 'xx', '2', null, '0', '0', '1', 'upload/categoryImage/2014101317030863398.png', null, null, null, '2014-10-13 16:58:13');
INSERT INTO `category` VALUES ('71', 'zf', '2', null, '0', '0', '1', 'upload/categoryImage/2014101317035757872.png', null, null, null, '2014-10-13 17:04:13');
INSERT INTO `category` VALUES ('72', 'xx', '2', null, '0', '0', '1', 'upload/categoryImage/2014101317035757872.png', null, null, null, '2014-10-13 17:04:43');
INSERT INTO `category` VALUES ('73', 'xx', '2', null, '0', '0', '1', 'upload/categoryImage/2014101317052952608.jpg', null, null, null, '2014-10-13 17:05:40');
INSERT INTO `category` VALUES ('74', 'xx', '3', null, '0', '0', '1', 'upload/categoryImage/2014101317134193258.png', null, null, null, '2014-10-13 17:13:51');

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categorymultilanguage
-- ----------------------------
INSERT INTO `categorymultilanguage` VALUES ('3', '7', '56', '23', '23', '32', '23', '2014-09-10 12:25:59', '2014-09-10 12:25:59');
INSERT INTO `categorymultilanguage` VALUES ('4', '8', '56', '23', '23', '23', '23', '2014-09-10 12:25:59', '2014-09-10 12:25:59');
INSERT INTO `categorymultilanguage` VALUES ('5', '7', '57', 'sdf', 'sdf', 'sdf', '', '2014-09-10 15:10:13', '2014-09-10 15:10:13');
INSERT INTO `categorymultilanguage` VALUES ('6', '8', '57', '', '', '', '', '2014-09-10 15:10:13', '2014-09-10 15:10:13');
INSERT INTO `categorymultilanguage` VALUES ('7', '7', '58', '', '', '', '', '2014-09-10 15:15:45', '2014-09-10 15:15:45');
INSERT INTO `categorymultilanguage` VALUES ('8', '8', '58', '', '', '', '', '2014-09-10 15:15:45', '2014-09-10 15:15:45');
INSERT INTO `categorymultilanguage` VALUES ('9', '7', '59', '11', '', '', '', '2014-10-12 23:00:32', '2014-10-12 23:00:32');
INSERT INTO `categorymultilanguage` VALUES ('10', '8', '59', '11', '', '', '', '2014-10-12 23:00:32', '2014-10-12 23:00:32');
INSERT INTO `categorymultilanguage` VALUES ('11', '7', '60', '22', '', '', '', '2014-10-12 23:03:07', '2014-10-12 23:03:07');
INSERT INTO `categorymultilanguage` VALUES ('12', '8', '60', '22', '', '', '', '2014-10-12 23:03:07', '2014-10-12 23:03:07');
INSERT INTO `categorymultilanguage` VALUES ('13', '7', '61', '', '', '', '', '2014-10-12 23:06:14', '2014-10-12 23:06:14');
INSERT INTO `categorymultilanguage` VALUES ('14', '8', '61', '试试', '', '', '', '2014-10-12 23:06:14', '2014-10-12 23:06:14');
INSERT INTO `categorymultilanguage` VALUES ('15', '7', '62', 'xx', '', '', '', '2014-10-12 23:08:15', '2014-10-12 23:08:15');
INSERT INTO `categorymultilanguage` VALUES ('16', '8', '62', '', '', '', '', '2014-10-12 23:08:15', '2014-10-12 23:08:15');
INSERT INTO `categorymultilanguage` VALUES ('17', '7', '63', '', '', '', '', '2014-10-12 23:09:02', '2014-10-12 23:09:02');
INSERT INTO `categorymultilanguage` VALUES ('18', '8', '63', '', '', '', '', '2014-10-12 23:09:02', '2014-10-12 23:09:02');
INSERT INTO `categorymultilanguage` VALUES ('19', '7', '64', '', '', '', '', '2014-10-12 23:14:41', '2014-10-12 23:14:41');
INSERT INTO `categorymultilanguage` VALUES ('20', '8', '64', '', '', '', '', '2014-10-12 23:14:41', '2014-10-12 23:14:41');
INSERT INTO `categorymultilanguage` VALUES ('21', '7', '65', '23', '', '', '', '2014-10-13 12:56:31', '2014-10-13 12:56:31');
INSERT INTO `categorymultilanguage` VALUES ('22', '8', '65', '32', '', '', '', '2014-10-13 12:56:31', '2014-10-13 12:56:31');
INSERT INTO `categorymultilanguage` VALUES ('23', '7', '66', '', '', '', '', '2014-10-13 12:57:15', '2014-10-13 12:57:15');
INSERT INTO `categorymultilanguage` VALUES ('24', '8', '66', '', '', '', '', '2014-10-13 12:57:15', '2014-10-13 12:57:15');
INSERT INTO `categorymultilanguage` VALUES ('25', '7', '67', '信息', '', '', '', '2014-10-13 16:36:21', '2014-10-13 16:36:21');
INSERT INTO `categorymultilanguage` VALUES ('26', '8', '67', '', '', '', '', '2014-10-13 16:36:21', '2014-10-13 16:36:21');
INSERT INTO `categorymultilanguage` VALUES ('27', '7', '68', '', '', '', '', '2014-10-13 16:43:07', '2014-10-13 16:43:07');
INSERT INTO `categorymultilanguage` VALUES ('28', '8', '68', '', '', '', '', '2014-10-13 16:43:07', '2014-10-13 16:43:07');
INSERT INTO `categorymultilanguage` VALUES ('29', '7', '69', '', '', '', '', '2014-10-13 16:48:25', '2014-10-13 16:48:25');
INSERT INTO `categorymultilanguage` VALUES ('30', '8', '69', '', '', '', '', '2014-10-13 16:48:25', '2014-10-13 16:48:25');
INSERT INTO `categorymultilanguage` VALUES ('31', '7', '70', '', '', '', '', '2014-10-13 16:58:13', '2014-10-13 16:58:13');
INSERT INTO `categorymultilanguage` VALUES ('32', '8', '70', '', '', '', '', '2014-10-13 16:58:13', '2014-10-13 16:58:13');
INSERT INTO `categorymultilanguage` VALUES ('33', '7', '71', '', '', '', '', '2014-10-13 17:04:13', '2014-10-13 17:04:13');
INSERT INTO `categorymultilanguage` VALUES ('34', '8', '71', '', '', '', '', '2014-10-13 17:04:13', '2014-10-13 17:04:13');
INSERT INTO `categorymultilanguage` VALUES ('35', '7', '72', '', '', '', '', '2014-10-13 17:04:43', '2014-10-13 17:04:43');
INSERT INTO `categorymultilanguage` VALUES ('36', '8', '72', '', '', '', '', '2014-10-13 17:04:43', '2014-10-13 17:04:43');
INSERT INTO `categorymultilanguage` VALUES ('37', '7', '73', '', '', '', '', '2014-10-13 17:05:40', '2014-10-13 17:05:40');
INSERT INTO `categorymultilanguage` VALUES ('38', '8', '73', '', '', '', '', '2014-10-13 17:05:41', '2014-10-13 17:05:41');
INSERT INTO `categorymultilanguage` VALUES ('39', '7', '74', '', '', '', '', '2014-10-13 17:13:51', '2014-10-13 17:13:51');
INSERT INTO `categorymultilanguage` VALUES ('40', '8', '74', '', '', '', '', '2014-10-13 17:13:51', '2014-10-13 17:13:51');

-- ----------------------------
-- Table structure for `jifen`
-- ----------------------------
DROP TABLE IF EXISTS `jifen`;
CREATE TABLE `jifen` (
  `jf_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL,
  `jifen` int(11) DEFAULT NULL,
  PRIMARY KEY (`jf_id`)
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
  `status` tinyint(10) NOT NULL COMMENT '是否在前台显示',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`lan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of language
-- ----------------------------
INSERT INTO `language` VALUES ('7', '英语', 'enligsh', 'en', 'US', '0', '2014-08-22 14:10:05');
INSERT INTO `language` VALUES ('8', '俄语', 'russian', 'ru', 'RU', '0', '2014-08-22 14:12:44');

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
  `product_desc` varchar(1000) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `modifytime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of productmultilanguage
-- ----------------------------
INSERT INTO `productmultilanguage` VALUES ('1', '11', '0', 'sjfl', 'sj', 'slf', 'sdf', 'sjdf', '2014-08-27 14:08:59', '2014-08-27 14:08:59');
INSERT INTO `productmultilanguage` VALUES ('2', '15', '7', '2323', '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:14:59', '2014-08-27 14:14:59');
INSERT INTO `productmultilanguage` VALUES ('3', '16', '7', '2323', '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:15:52', '2014-08-27 14:15:52');
INSERT INTO `productmultilanguage` VALUES ('4', '17', '7', '2323', '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:15:56', '2014-08-27 14:15:56');
INSERT INTO `productmultilanguage` VALUES ('5', '18', '7', '2323', '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:15:57', '2014-08-27 14:15:57');
INSERT INTO `productmultilanguage` VALUES ('6', '19', '7', '2323', '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:18:11', '2014-08-27 14:18:11');
INSERT INTO `productmultilanguage` VALUES ('7', '19', '8', '2323', '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:18:11', '2014-08-27 14:18:11');
INSERT INTO `productmultilanguage` VALUES ('8', '20', '7', '2323', '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:18:12', '2014-08-27 14:18:12');
INSERT INTO `productmultilanguage` VALUES ('9', '20', '8', '2323', '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:18:12', '2014-08-27 14:18:12');
INSERT INTO `productmultilanguage` VALUES ('10', '21', '7', '2323', '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:18:13', '2014-08-27 14:18:13');
INSERT INTO `productmultilanguage` VALUES ('11', '21', '8', '2323', '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:18:13', '2014-08-27 14:18:13');
INSERT INTO `productmultilanguage` VALUES ('12', '22', '7', '2323', '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:18:14', '2014-08-27 14:18:14');
INSERT INTO `productmultilanguage` VALUES ('13', '22', '8', '2323', '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:18:14', '2014-08-27 14:18:14');
INSERT INTO `productmultilanguage` VALUES ('14', '23', '7', '2323', '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:21:27', '2014-08-27 14:21:27');
INSERT INTO `productmultilanguage` VALUES ('15', '23', '8', '2323', '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:21:27', '2014-08-27 14:21:27');
INSERT INTO `productmultilanguage` VALUES ('16', '24', '7', '2323', '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:21:27', '2014-08-27 14:21:27');
INSERT INTO `productmultilanguage` VALUES ('17', '24', '8', '2323', '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:21:27', '2014-08-27 14:21:27');
INSERT INTO `productmultilanguage` VALUES ('18', '25', '7', '2323', '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:21:28', '2014-08-27 14:21:28');
INSERT INTO `productmultilanguage` VALUES ('19', '25', '8', '2323', '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:21:28', '2014-08-27 14:21:28');
INSERT INTO `productmultilanguage` VALUES ('20', '26', '7', '2323', '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:21:28', '2014-08-27 14:21:28');
INSERT INTO `productmultilanguage` VALUES ('21', '26', '8', '2323', '<p>2323</p>', '2323', '232', '2323', '2014-08-27 14:21:28', '2014-08-27 14:21:28');
INSERT INTO `productmultilanguage` VALUES ('22', '27', '7', '23', '<p>23</p>', '23', '23', '23', '2014-08-27 14:22:58', '2014-08-27 14:22:58');
INSERT INTO `productmultilanguage` VALUES ('23', '28', '7', '23', '<p>23</p>', '23', '23', '23', '2014-08-27 14:22:59', '2014-08-27 14:22:59');
INSERT INTO `productmultilanguage` VALUES ('24', '29', '7', '23', '<p>23</p>', '23', '23', '23', '2014-08-27 14:23:00', '2014-08-27 14:23:00');
INSERT INTO `productmultilanguage` VALUES ('25', '30', '7', '23', '<p>23</p>', '23', '23', '23', '2014-08-27 14:23:01', '2014-08-27 14:23:01');
INSERT INTO `productmultilanguage` VALUES ('26', '31', '7', '23', '<p>23</p>', '23', '23', '23', '2014-08-27 14:24:40', '2014-08-27 14:24:40');
INSERT INTO `productmultilanguage` VALUES ('27', '32', '7', '23', '<p>23</p>', '23', '23', '23', '2014-08-27 14:24:41', '2014-08-27 14:24:41');
INSERT INTO `productmultilanguage` VALUES ('28', '33', '7', '23', '<p>23</p>', '23', '23', '23', '2014-08-27 14:24:41', '2014-08-27 14:24:41');
INSERT INTO `productmultilanguage` VALUES ('29', '34', '7', '23', '<p>23</p>', '23', '23', '23', '2014-08-27 14:24:41', '2014-08-27 14:24:41');
INSERT INTO `productmultilanguage` VALUES ('30', '35', '7', '23', '<p>23</p>', '23', '23', '23', '2014-08-27 14:25:50', '2014-08-27 14:25:50');
INSERT INTO `productmultilanguage` VALUES ('31', '35', '8', 'yu', '<p>rurasdfl;</p><p>rurasdfk</p><p>sasjdfasdl;fk</p><p>asjdlfjsajasdfl;k</p><p>aslfjasasf;</p><p>asjlfjaasdfk;</p><p>jflajasdfl;</p><p>adlfjasdlasdjflasjdlfjaaaaaaaaaaaaaaaaaaa</p>', 'rur', 'rur', 'rur', '2014-08-27 14:25:50', '2014-08-27 14:25:50');
INSERT INTO `productmultilanguage` VALUES ('32', '36', '7', '23', '<p>23</p>', '23', '23', '23', '2014-08-27 14:25:50', '2014-08-27 14:25:50');
INSERT INTO `productmultilanguage` VALUES ('33', '36', '8', 'yu', '<p>rurasdfl;</p><p>rurasdfk</p><p>sasjdfasdl;fk</p><p>asjdlfjsajasdfl;k</p><p>aslfjasasf;</p><p>asjlfjaasdfk;</p><p>jflajasdfl;</p><p>adlfjasdlasdjflasjdlfjaaaaaaaaaaaaaaaaaaa</p>', 'rur', 'rur', 'rur', '2014-08-27 14:25:50', '2014-08-27 14:25:50');
INSERT INTO `productmultilanguage` VALUES ('34', '37', '7', '23', '<p>23</p>', '23', '23', '23', '2014-08-27 14:25:50', '2014-08-27 14:25:50');
INSERT INTO `productmultilanguage` VALUES ('35', '37', '8', 'yu', '<p>rurasdfl;</p><p>rurasdfk</p><p>sasjdfasdl;fk</p><p>asjdlfjsajasdfl;k</p><p>aslfjasasf;</p><p>asjlfjaasdfk;</p><p>jflajasdfl;</p><p>adlfjasdlasdjflasjdlfjaaaaaaaaaaaaaaaaaaa</p>', 'rur', 'rur', 'rur', '2014-08-27 14:25:51', '2014-08-27 14:25:51');
INSERT INTO `productmultilanguage` VALUES ('36', '38', '7', '23', '<p>23</p>', '23', '23', '23', '2014-08-27 14:25:51', '2014-08-27 14:25:51');
INSERT INTO `productmultilanguage` VALUES ('37', '38', '8', 'yu', '<p>rurasdfl;</p><p>rurasdfk</p><p>sasjdfasdl;fk</p><p>asjdlfjsajasdfl;k</p><p>aslfjasasf;</p><p>asjlfjaasdfk;</p><p>jflajasdfl;</p><p>adlfjasdlasdjflasjdlfjaaaaaaaaaaaaaaaaaaa</p>', 'rur', 'rur', 'rur', '2014-08-27 14:25:51', '2014-08-27 14:25:51');
INSERT INTO `productmultilanguage` VALUES ('38', '39', '7', '23', '<p>23</p>', '43', '34', '343', '2014-08-27 15:07:34', '2014-08-27 15:07:34');
INSERT INTO `productmultilanguage` VALUES ('39', '39', '8', 'yyyyyyyy', '<p>yyyyyyyy</p>', 'yyyyyy', 'yyyyyyy', 'yyyyyyyyyy', '2014-08-27 15:07:34', '2014-08-27 15:07:34');
INSERT INTO `productmultilanguage` VALUES ('40', '40', '7', '23', '<p>23</p>', '43', '34', '343', '2014-08-27 15:07:36', '2014-08-27 15:07:36');
INSERT INTO `productmultilanguage` VALUES ('41', '40', '8', 'yyyyyyyy', '<p>yyyyyyyy</p>', 'yyyyyy', 'yyyyyyy', 'yyyyyyyyyy', '2014-08-27 15:07:36', '2014-08-27 15:07:36');
INSERT INTO `productmultilanguage` VALUES ('42', '41', '7', '23', '<p>23</p>', '43', '34', '343', '2014-08-27 15:07:37', '2014-08-27 15:07:37');
INSERT INTO `productmultilanguage` VALUES ('43', '41', '8', 'yyyyyyyy', '<p>yyyyyyyy</p>', 'yyyyyy', 'yyyyyyy', 'yyyyyyyyyy', '2014-08-27 15:07:37', '2014-08-27 15:07:37');
INSERT INTO `productmultilanguage` VALUES ('44', '42', '7', '23', '<p>23</p>', '43', '34', '343', '2014-08-27 15:07:39', '2014-08-27 15:07:39');
INSERT INTO `productmultilanguage` VALUES ('45', '42', '8', 'yyyyyyyy', '<p>yyyyyyyy</p>', 'yyyyyy', 'yyyyyyy', 'yyyyyyyyyy', '2014-08-27 15:07:39', '2014-08-27 15:07:39');
INSERT INTO `productmultilanguage` VALUES ('46', '43', '7', '23', '<p>23</p>', '43', '34', '343', '2014-08-27 15:09:11', '2014-08-27 15:09:11');
INSERT INTO `productmultilanguage` VALUES ('47', '43', '8', 'yyyyyyyy', '<p>yyyyyyyy</p>', 'yyyyyy', 'yyyyyyy', 'yyyyyyyyyy', '2014-08-27 15:09:12', '2014-08-27 15:09:12');
INSERT INTO `productmultilanguage` VALUES ('48', '44', '7', '23', '<p>23</p>', '43', '34', '343', '2014-08-27 15:10:30', '2014-08-27 15:10:30');
INSERT INTO `productmultilanguage` VALUES ('49', '44', '8', 'yyyyyyyy', '<p>yyyyyyyy</p>', 'yyyyyy', 'yyyyyyy', 'yyyyyyyyyy', '2014-08-27 15:10:30', '2014-08-27 15:10:30');
INSERT INTO `productmultilanguage` VALUES ('50', '45', '7', '23', '<p>23</p>', '43', '34', '343', '2014-08-27 15:10:55', '2014-08-27 15:10:55');
INSERT INTO `productmultilanguage` VALUES ('51', '45', '8', 'yyyyyyyy', '<p>yyyyyyyy</p>', 'yyyyyy', 'yyyyyyy', 'yyyyyyyyyy', '2014-08-27 15:10:55', '2014-08-27 15:10:55');
INSERT INTO `productmultilanguage` VALUES ('52', '46', '7', '23', '<p>23</p>', '43', '34', '343', '2014-08-27 15:11:02', '2014-08-27 15:11:02');
INSERT INTO `productmultilanguage` VALUES ('53', '46', '8', 'yyyyyyyy', '<p>yyyyyyyy</p>', 'yyyyyy', 'yyyyyyy', 'yyyyyyyyyy', '2014-08-27 15:11:02', '2014-08-27 15:11:02');

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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'sjdfl', '2.0000', '0.0000', '2.4000', '21', '2', 'sdlfj', 'lsdjf', 'wrj', 'www.baidu.com', '40', '0', '0', '0.0000', '0', '0', '0', '2014-08-28 01:25:47', '2014-08-28 01:25:47', '0', null, null, null);
INSERT INTO `products` VALUES ('2', '2274粉色原版荔枝纹2.JPG', '22.0000', '22.0000', '0.0000', '21', '2', '22', '22', '22', '22', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 12:37:35', '2014-08-27 12:37:35', '0', '22', null, null);
INSERT INTO `products` VALUES ('3', '2274粉色原版荔枝纹3.JPG', '22.0000', '22.0000', '0.0000', '21', '2', '22', '22', '22', '22', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 12:37:46', '2014-08-27 12:37:46', '0', '22', null, null);
INSERT INTO `products` VALUES ('4', '2274粉色原版荔枝纹4.JPG', '22.0000', '22.0000', '0.0000', '21', '2', '22', '22', '22', '22', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 12:37:48', '2014-08-27 12:37:48', '0', '22', null, null);
INSERT INTO `products` VALUES ('5', '2274粉色原版荔枝纹2.JPG', '22.0000', '22.0000', '0.0000', '21', '2', 'sf', 'sdf', 'fsd', 'sf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 12:49:36', '2014-08-27 12:49:36', '0', 'adsf', null, null);
INSERT INTO `products` VALUES ('6', '2274粉色原版荔枝纹3.JPG', '22.0000', '22.0000', '0.0000', '21', '2', 'sf', 'sdf', 'fsd', 'sf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 12:49:40', '2014-08-27 12:49:40', '0', 'adsf', null, null);
INSERT INTO `products` VALUES ('7', '2274粉色原版荔枝纹4.JPG', '22.0000', '22.0000', '0.0000', '21', '2', 'sf', 'sdf', 'fsd', 'sf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 12:49:45', '2014-08-27 12:49:45', '0', 'adsf', null, null);
INSERT INTO `products` VALUES ('8', '2274粉色原版荔枝纹2.JPG', '22.0000', '22.0000', '0.0000', '21', '2', 'sf', 'sdf', 'fsd', 'sf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 12:50:38', '2014-08-27 12:50:38', '0', 'adsf', null, null);
INSERT INTO `products` VALUES ('9', '2274粉色原版荔枝纹3.JPG', '22.0000', '22.0000', '0.0000', '21', '2', 'sf', 'sdf', 'fsd', 'sf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 12:50:43', '2014-08-27 12:50:43', '0', 'adsf', null, null);
INSERT INTO `products` VALUES ('10', '2274粉色原版荔枝纹4.JPG', '22.0000', '22.0000', '0.0000', '21', '2', 'sf', 'sdf', 'fsd', 'sf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 12:52:08', '2014-08-27 12:52:08', '0', 'adsf', null, null);
INSERT INTO `products` VALUES ('11', '2274粉色原版荔枝纹2.JPG', '22.0000', '22.0000', '0.0000', '21', '2', 'sf', 'sdf', 'fsd', 'sf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 12:53:29', '2014-08-27 12:53:29', '0', 'adsf', null, null);
INSERT INTO `products` VALUES ('12', '2274粉色原版荔枝纹3.JPG', '22.0000', '22.0000', '0.0000', '21', '2', 'sf', 'sdf', 'fsd', 'sf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 12:53:33', '2014-08-27 12:53:33', '0', 'adsf', null, null);
INSERT INTO `products` VALUES ('13', '2274粉色原版荔枝纹4.JPG', '22.0000', '22.0000', '0.0000', '21', '2', 'sf', 'sdf', 'fsd', 'sf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 12:53:48', '2014-08-27 12:53:48', '0', 'adsf', null, null);
INSERT INTO `products` VALUES ('14', '2274粉色原版荔枝纹5.JPG', '22.0000', '22.0000', '0.0000', '21', '2', 'sf', 'sdf', 'fsd', 'sf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 12:54:06', '2014-08-27 12:54:06', '0', 'adsf', null, null);
INSERT INTO `products` VALUES ('15', '2274粉色原版荔枝纹2.JPG', '22.0000', '33.0000', '0.0000', '21', '2', 'asf', 'asf', 'afs', 'asf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 14:14:50', '2014-08-27 14:14:50', '0', '2323', null, null);
INSERT INTO `products` VALUES ('16', '2274粉色原版荔枝纹3.JPG', '22.0000', '33.0000', '0.0000', '21', '2', 'asf', 'asf', 'afs', 'asf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 14:15:50', '2014-08-27 14:15:50', '0', '2323', null, null);
INSERT INTO `products` VALUES ('17', '2274粉色原版荔枝纹4.JPG', '22.0000', '33.0000', '0.0000', '21', '2', 'asf', 'asf', 'afs', 'asf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 14:15:55', '2014-08-27 14:15:55', '0', '2323', null, null);
INSERT INTO `products` VALUES ('18', '2274粉色原版荔枝纹5.JPG', '22.0000', '33.0000', '0.0000', '21', '2', 'asf', 'asf', 'afs', 'asf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 14:15:56', '2014-08-27 14:15:56', '0', '2323', null, null);
INSERT INTO `products` VALUES ('19', '2274粉色原版荔枝纹2.JPG', '22.0000', '33.0000', '0.0000', '21', '2', 'asf', 'asf', 'afs', 'asf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 14:18:10', '2014-08-27 14:18:10', '0', '2323', null, null);
INSERT INTO `products` VALUES ('20', '2274粉色原版荔枝纹3.JPG', '22.0000', '33.0000', '0.0000', '21', '2', 'asf', 'asf', 'afs', 'asf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 14:18:11', '2014-08-27 14:18:11', '0', '2323', null, null);
INSERT INTO `products` VALUES ('21', '2274粉色原版荔枝纹4.JPG', '22.0000', '33.0000', '0.0000', '21', '2', 'asf', 'asf', 'afs', 'asf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 14:18:12', '2014-08-27 14:18:12', '0', '2323', null, null);
INSERT INTO `products` VALUES ('22', '2274粉色原版荔枝纹5.JPG', '22.0000', '33.0000', '0.0000', '21', '2', 'asf', 'asf', 'afs', 'asf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 14:18:13', '2014-08-27 14:18:13', '0', '2323', null, null);
INSERT INTO `products` VALUES ('23', '2274粉色原版荔枝纹2.JPG', '22.0000', '33.0000', '0.0000', '21', '2', 'asf', 'asf', 'afs', 'asf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 14:21:27', '2014-08-27 14:21:27', '0', '2323', null, null);
INSERT INTO `products` VALUES ('24', '2274粉色原版荔枝纹3.JPG', '22.0000', '33.0000', '0.0000', '21', '2', 'asf', 'asf', 'afs', 'asf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 14:21:27', '2014-08-27 14:21:27', '0', '2323', null, null);
INSERT INTO `products` VALUES ('25', '2274粉色原版荔枝纹4.JPG', '22.0000', '33.0000', '0.0000', '21', '2', 'asf', 'asf', 'afs', 'asf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 14:21:28', '2014-08-27 14:21:28', '0', '2323', null, null);
INSERT INTO `products` VALUES ('26', '2274粉色原版荔枝纹5.JPG', '22.0000', '33.0000', '0.0000', '21', '2', 'asf', 'asf', 'afs', 'asf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 14:21:28', '2014-08-27 14:21:28', '0', '2323', null, null);
INSERT INTO `products` VALUES ('27', '2274粉色原版荔枝纹2.JPG', '23.0000', '232.0000', '0.0000', '21', '2', 'af', 'asf', 'fas', 'asf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 14:22:58', '2014-08-27 14:22:58', '0', '', null, null);
INSERT INTO `products` VALUES ('28', '2274粉色原版荔枝纹3.JPG', '23.0000', '232.0000', '0.0000', '21', '2', 'af', 'asf', 'fas', 'asf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 14:22:59', '2014-08-27 14:22:59', '0', '', null, null);
INSERT INTO `products` VALUES ('29', '2274粉色原版荔枝纹4.JPG', '23.0000', '232.0000', '0.0000', '21', '2', 'af', 'asf', 'fas', 'asf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 14:23:00', '2014-08-27 14:23:00', '0', '', null, null);
INSERT INTO `products` VALUES ('30', '2274粉色原版荔枝纹5.JPG', '23.0000', '232.0000', '0.0000', '21', '2', 'af', 'asf', 'fas', 'asf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 14:23:00', '2014-08-27 14:23:00', '0', '', null, null);
INSERT INTO `products` VALUES ('31', '2274粉色原版荔枝纹2.JPG', '23.0000', '232.0000', '0.0000', '21', '2', 'af', 'asf', 'fas', 'asf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 14:24:40', '2014-08-27 14:24:40', '0', '', null, null);
INSERT INTO `products` VALUES ('32', '2274粉色原版荔枝纹3.JPG', '23.0000', '232.0000', '0.0000', '21', '2', 'af', 'asf', 'fas', 'asf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 14:24:40', '2014-08-27 14:24:40', '0', '', null, null);
INSERT INTO `products` VALUES ('33', '2274粉色原版荔枝纹4.JPG', '23.0000', '232.0000', '0.0000', '21', '2', 'af', 'asf', 'fas', 'asf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 14:24:41', '2014-08-27 14:24:41', '0', '', null, null);
INSERT INTO `products` VALUES ('34', '2274粉色原版荔枝纹5.JPG', '23.0000', '232.0000', '0.0000', '21', '2', 'af', 'asf', 'fas', 'asf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 14:24:41', '2014-08-27 14:24:41', '0', '', null, null);
INSERT INTO `products` VALUES ('35', '2274粉色原版荔枝纹2.JPG', '23.0000', '232.0000', '0.0000', '21', '2', 'af', 'asf', 'fas', 'asf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 14:25:50', '2014-08-27 14:25:50', '0', '', null, null);
INSERT INTO `products` VALUES ('36', '2274粉色原版荔枝纹3.JPG', '23.0000', '232.0000', '0.0000', '21', '2', 'af', 'asf', 'fas', 'asf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 14:25:50', '2014-08-27 14:25:50', '0', '', null, null);
INSERT INTO `products` VALUES ('37', '2274粉色原版荔枝纹4.JPG', '23.0000', '232.0000', '0.0000', '21', '2', 'af', 'asf', 'fas', 'asf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 14:25:50', '2014-08-27 14:25:50', '0', '', null, null);
INSERT INTO `products` VALUES ('38', '2274粉色原版荔枝纹5.JPG', '23.0000', '232.0000', '0.0000', '21', '2', 'af', 'asf', 'fas', 'asf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 14:25:51', '2014-08-27 14:25:51', '0', '', null, null);
INSERT INTO `products` VALUES ('39', '2274粉色原版荔枝纹2.JPG', '23.0000', '23.0000', '0.0000', '1', '2', 'sdf', 'sdf', 'sdf', 'sdf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 15:07:31', '2014-08-27 15:07:31', '0', '23', null, null);
INSERT INTO `products` VALUES ('40', '2274粉色原版荔枝纹3.JPG', '23.0000', '23.0000', '0.0000', '1', '2', 'sdf', 'sdf', 'sdf', 'sdf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 15:07:35', '2014-08-27 15:07:35', '0', '23', null, null);
INSERT INTO `products` VALUES ('41', '2274粉色原版荔枝纹4.JPG', '23.0000', '23.0000', '0.0000', '1', '2', 'sdf', 'sdf', 'sdf', 'sdf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 15:07:37', '2014-08-27 15:07:37', '0', '23', null, null);
INSERT INTO `products` VALUES ('42', '2274粉色原版荔枝纹5.JPG', '23.0000', '23.0000', '0.0000', '1', '2', 'sdf', 'sdf', 'sdf', 'sdf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 15:07:37', '2014-08-27 15:07:37', '0', '23', null, null);
INSERT INTO `products` VALUES ('43', '2274粉色原版荔枝纹2.JPG', '23.0000', '23.0000', '0.0000', '1', '2', 'sdf', 'sdf', 'sdf', 'sdf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 15:09:05', '2014-08-27 15:09:05', '0', '23', null, null);
INSERT INTO `products` VALUES ('44', '2274粉色原版荔枝纹3.JPG', '23.0000', '23.0000', '0.0000', '1', '2', 'sdf', 'sdf', 'sdf', 'sdf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 15:10:28', '2014-08-27 15:10:28', '0', '23', null, null);
INSERT INTO `products` VALUES ('45', '2274粉色原版荔枝纹4.JPG', '23.0000', '23.0000', '0.0000', '1', '2', 'sdf', 'sdf', 'sdf', 'sdf', '12', '0', '0', '1.0000', '1', '1', '0', '2014-08-29 23:10:54', '2014-08-29 23:10:54', '0', null, '0', '19');
INSERT INTO `products` VALUES ('46', '2274粉色原版荔枝纹5.JPG', '23.0000', '23.0000', '0.0000', '1', '2', 'sdf', 'sdf', 'sdf', 'sdf', '0', '0', '0', '1.0000', '0', '0', '0', '2014-08-27 15:10:58', '2014-08-27 15:10:58', '0', '23', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_basic_attr
-- ----------------------------
INSERT INTO `product_basic_attr` VALUES ('1', '1', '31', '41', '0', null, null);
INSERT INTO `product_basic_attr` VALUES ('2', '1', '31', '42', '0', null, null);
INSERT INTO `product_basic_attr` VALUES ('16', '45', '39', '59', '0', null, null);
INSERT INTO `product_basic_attr` VALUES ('17', '45', '39', '60', '0', null, null);
INSERT INTO `product_basic_attr` VALUES ('18', '45', '39', '61', '0', null, null);
INSERT INTO `product_basic_attr` VALUES ('19', '45', '13', '14', '0', null, null);
INSERT INTO `product_basic_attr` VALUES ('20', '45', '13', '15', '0', null, null);
INSERT INTO `product_basic_attr` VALUES ('21', '45', '13', '16', '0', null, null);

-- ----------------------------
-- Table structure for `product_collect`
-- ----------------------------
DROP TABLE IF EXISTS `product_collect`;
CREATE TABLE `product_collect` (
  `pc_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES ('1', 'upload/image/2274粉色原版荔枝纹2.JPG', '43', '0', '2014-08-27 15:10:18');
INSERT INTO `product_image` VALUES ('2', 'upload/image/2274粉色原版荔枝纹3.JPG', '44', '0', '2014-08-27 15:10:35');
INSERT INTO `product_image` VALUES ('4', 'upload/image/2274粉色原版荔枝纹5.JPG', '46', '0', '2014-08-27 15:11:02');
INSERT INTO `product_image` VALUES ('5', 'upload/productsImage/2014102111265460112.jpg', '45', '1', '2014-10-21 11:26:54');
INSERT INTO `product_image` VALUES ('6', 'upload/productsImage/2014102111270487821.jpg', '45', '1', '2014-10-21 11:27:04');

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_sku
-- ----------------------------
INSERT INTO `product_sku` VALUES ('15', '45', '1', '1', '1', '', null, '0', '2014-10-24 17:08:34');
INSERT INTO `product_sku` VALUES ('16', '45', '0', '2', '1', '', null, '0', '2014-10-24 17:08:34');
INSERT INTO `product_sku` VALUES ('17', '45', '2', '0', '1', '', null, '0', '2014-10-24 17:08:34');
INSERT INTO `product_sku` VALUES ('18', '0', '0', '0', '0', null, null, '0', null);
INSERT INTO `product_sku` VALUES ('19', '45', '0', '0', '1', '', null, '0', '2014-10-24 17:12:36');
INSERT INTO `product_sku` VALUES ('20', '45', '0', '0', '1', '', null, '0', '2014-10-24 17:13:00');
INSERT INTO `product_sku` VALUES ('21', '45', '0', '0', '1', '', null, '0', '2014-10-24 17:14:23');
INSERT INTO `product_sku` VALUES ('22', '45', '0', '0', '1', '', null, '0', '2014-10-24 17:14:23');
INSERT INTO `product_sku` VALUES ('23', '45', '0', '0', '1', '', null, '0', '2014-10-24 17:14:23');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shipping
-- ----------------------------
INSERT INTO `shipping` VALUES ('1', 'ems', '1', '', '2014-10-14 14:30:08');
INSERT INTO `shipping` VALUES ('2', 'e-packet', '1', 'asjdfjasf', '2014-10-15 13:04:44');
INSERT INTO `shipping` VALUES ('3', 'expressxx', '1', 'xx', '2014-10-16 17:23:42');
INSERT INTO `shipping` VALUES ('5', '啊啊', '1', '啊啊', '2014-10-17 16:48:45');
INSERT INTO `shipping` VALUES ('6', '啊啊', '1', '啊啊', '2014-10-17 16:49:23');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shipping_country
-- ----------------------------
INSERT INTO `shipping_country` VALUES ('5', '啊啊', '1', '啊啊', '2014-10-17 16:50:43');
INSERT INTO `shipping_country` VALUES ('6', '啊啊', '1', '啊啊', '2014-10-17 16:50:53');
INSERT INTO `shipping_country` VALUES ('7', '啊啊', '1', '啊啊', '2014-10-17 16:50:54');
INSERT INTO `shipping_country` VALUES ('8', '啊啊', '1', '啊啊', '2014-10-17 16:50:56');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shipping_template
-- ----------------------------
INSERT INTO `shipping_template` VALUES ('15', 'xx', '1', null, '2014-10-20 19:18:13');
INSERT INTO `shipping_template` VALUES ('16', 'xxx', '1', null, '2014-10-20 19:19:58');
INSERT INTO `shipping_template` VALUES ('19', 'aa', '1', null, '2014-10-20 21:23:29');
INSERT INTO `shipping_template` VALUES ('21', 'bb', '1', null, '2014-10-20 21:38:10');
INSERT INTO `shipping_template` VALUES ('22', 'bb', '1', null, '2014-10-20 21:39:56');
INSERT INTO `shipping_template` VALUES ('23', 'gg', '1', null, '2014-10-20 21:43:44');
INSERT INTO `shipping_template` VALUES ('24', 'gg', '1', null, '2014-10-20 21:44:41');
INSERT INTO `shipping_template` VALUES ('25', 'bb', null, null, '2014-10-21 10:41:31');
INSERT INTO `shipping_template` VALUES ('26', 'bbb', null, null, '2014-10-21 10:43:09');

-- ----------------------------
-- Table structure for `shipping_template_fee`
-- ----------------------------
DROP TABLE IF EXISTS `shipping_template_fee`;
CREATE TABLE `shipping_template_fee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `templateId` int(11) NOT NULL COMMENT '模板id',
  `shippingId` int(11) NOT NULL COMMENT '物流id',
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shipping_template_fee
-- ----------------------------
INSERT INTO `shipping_template_fee` VALUES ('7', '1', '1', '5', '1', '1.0000', null, null, null, null, null, null, null, null, null, null, null, '2014-10-20 21:23:40');
INSERT INTO `shipping_template_fee` VALUES ('8', '1', '1', '6|7', '2', '1.0000', '1', '1', '1', '1', '1', '1', null, null, null, null, null, '2014-10-20 21:23:42');
INSERT INTO `shipping_template_fee` VALUES ('9', '1', '1', '8|9', '2', '1.0000', '2', '1', '1', '1', '1', '1', '2.0000', '2.0000', '2.0000', '2.0000', '2.0000', '2014-10-20 21:23:43');
INSERT INTO `shipping_template_fee` VALUES ('10', '21', '1', '5', '1', '1.0000', null, null, null, null, null, null, null, null, null, null, null, '2014-10-20 21:38:10');
INSERT INTO `shipping_template_fee` VALUES ('11', '21', '1', '6|7', '2', '1.0000', '1', '2', '2', '2', '2', '2', null, null, null, null, null, '2014-10-20 21:38:10');
INSERT INTO `shipping_template_fee` VALUES ('12', '21', '1', '8|9', '2', '1.0000', '2', '2', '2', '2', '2', '2', '1.0000', '1.0000', '1.0000', '1.0000', '1.0000', '2014-10-20 21:38:10');
INSERT INTO `shipping_template_fee` VALUES ('13', '22', '1', '5', '1', '1.0000', null, null, null, null, null, null, null, null, null, null, null, '2014-10-20 21:39:56');
INSERT INTO `shipping_template_fee` VALUES ('14', '22', '1', '6|7', '2', '1.0000', '1', '2', '2', '2', '2', '2', null, null, null, null, null, '2014-10-20 21:39:56');
INSERT INTO `shipping_template_fee` VALUES ('15', '22', '1', '8|9', '2', '1.0000', '2', '2', '2', '2', '2', '2', '1.0000', '1.0000', '1.0000', '1.0000', '1.0000', '2014-10-20 21:39:56');
INSERT INTO `shipping_template_fee` VALUES ('16', '23', '1', '5|6', '1', '1.0000', null, null, null, null, null, null, null, null, null, null, null, '2014-10-20 21:43:46');
INSERT INTO `shipping_template_fee` VALUES ('17', '23', '1', '7', '2', null, '1', '1', '1', '1', '1', '1', null, null, null, null, null, '2014-10-20 21:43:47');
INSERT INTO `shipping_template_fee` VALUES ('18', '23', '1', '8|9', '2', null, '2', null, null, null, null, null, '2.0000', '2.0000', '2.0000', '2.0000', '2.0000', '2014-10-20 21:43:48');
INSERT INTO `shipping_template_fee` VALUES ('19', '24', '1', '5|6', '1', '1.0000', null, null, null, null, null, null, null, null, null, null, null, '2014-10-20 21:45:29');
INSERT INTO `shipping_template_fee` VALUES ('20', '24', '1', '7', '2', null, '1', '1', '1', '1', '1', '1', null, null, null, null, null, '2014-10-20 21:45:31');
INSERT INTO `shipping_template_fee` VALUES ('21', '24', '1', '8|9', '2', null, '2', null, null, null, null, null, '2.0000', '2.0000', '2.0000', '2.0000', '2.0000', '2014-10-20 21:45:32');
INSERT INTO `shipping_template_fee` VALUES ('22', '24', '2', '5|6', '2', null, '2', null, null, null, null, null, '2.0000', '2.0000', '2.0000', '2.0000', '2.0000', '2014-10-20 21:45:33');
INSERT INTO `shipping_template_fee` VALUES ('23', '24', '2', '7|8', '2', null, '1', '1', '1', '1', '1', '1', null, null, null, null, null, '2014-10-20 21:45:34');
INSERT INTO `shipping_template_fee` VALUES ('24', '24', '2', '9', '1', '1.0000', null, null, null, null, null, null, null, null, null, null, null, '2014-10-20 21:45:35');
INSERT INTO `shipping_template_fee` VALUES ('25', '25', '1', '5|6|7|8|9', '2', null, '2', null, null, null, null, null, '1.0000', '1.0000', '1.0000', '1.0000', '1.0000', '2014-10-21 10:41:31');
INSERT INTO `shipping_template_fee` VALUES ('26', '25', '2', '5|6|7|8|9', '2', null, '2', null, null, null, null, null, '1.0000', '1.0000', '1.0000', '1.0000', '1.0000', '2014-10-21 10:41:31');
INSERT INTO `shipping_template_fee` VALUES ('27', '26', '1', '5|6', '1', '12.0000', null, null, null, null, null, null, null, null, null, null, null, '2014-10-21 10:43:09');
INSERT INTO `shipping_template_fee` VALUES ('28', '26', '1', '7|8', '2', null, '1', '2', '2', '2', '2', '2', null, null, null, null, null, '2014-10-21 10:43:09');
INSERT INTO `shipping_template_fee` VALUES ('29', '26', '1', '9', '2', null, '2', null, null, null, null, null, '3.0000', '3.0000', '3.0000', '3.0000', '3.0000', '2014-10-21 10:43:09');
INSERT INTO `shipping_template_fee` VALUES ('30', '26', '2', '5|6', '2', null, '2', null, null, null, null, null, '3.0000', '3.0000', '3.0000', '3.0000', '3.0000', '2014-10-21 10:43:09');
INSERT INTO `shipping_template_fee` VALUES ('31', '26', '2', '7', '2', null, '1', '2', '2', '2', '2', '2', null, null, null, null, null, '2014-10-21 10:43:09');
INSERT INTO `shipping_template_fee` VALUES ('32', '26', '2', '8|9', '1', '12.0000', null, null, null, null, null, null, null, null, null, null, null, '2014-10-21 10:43:09');

-- ----------------------------
-- Table structure for `shipping_template_time`
-- ----------------------------
DROP TABLE IF EXISTS `shipping_template_time`;
CREATE TABLE `shipping_template_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `templateId` int(11) NOT NULL COMMENT '名字（物流）',
  `shippingId` int(11) NOT NULL DEFAULT '1' COMMENT '是否可以用',
  `shippingCountryIds` varchar(200) NOT NULL COMMENT '备注',
  `shippingTime` int(5) NOT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shipping_template_time
-- ----------------------------

-- ----------------------------
-- Table structure for `sku_atrvalue`
-- ----------------------------
DROP TABLE IF EXISTS `sku_atrvalue`;
CREATE TABLE `sku_atrvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` int(11) DEFAULT NULL,
  `attr_value_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='产品sku和属性值的中间表';

-- ----------------------------
-- Records of sku_atrvalue
-- ----------------------------
INSERT INTO `sku_atrvalue` VALUES ('34', '19', '59');
INSERT INTO `sku_atrvalue` VALUES ('35', '19', '15');
INSERT INTO `sku_atrvalue` VALUES ('36', '20', '59');
INSERT INTO `sku_atrvalue` VALUES ('37', '20', '16');
INSERT INTO `sku_atrvalue` VALUES ('38', '21', '14');
INSERT INTO `sku_atrvalue` VALUES ('39', '22', '15');
INSERT INTO `sku_atrvalue` VALUES ('40', '23', '16');

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
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(50) NOT NULL,
  `u_password` varchar(50) NOT NULL,
  `u_type` varchar(50) DEFAULT NULL,
  `zctime` datetime NOT NULL,
  `lasttime` datetime NOT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'root', 'v1', '2013-12-24 00:00:00', '2013-12-26 00:00:00');
INSERT INTO `user` VALUES ('2', 'cisco', 'cisco', 'v1', '2013-12-25 21:49:01', '2013-12-25 21:49:13');
INSERT INTO `user` VALUES ('3', 'my', 'my', 'v2', '2014-01-02 21:49:35', '2014-01-02 21:49:39');
INSERT INTO `user` VALUES ('4', 'yours', 'yours', 'v3', '2013-12-04 21:49:52', '2013-12-06 21:49:56');
INSERT INTO `user` VALUES ('5', 'lili', 'lili', 'v4', '2013-12-28 21:50:13', '2014-02-08 21:50:17');

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `uinfo_id` int(11) NOT NULL AUTO_INCREMENT,
  `uinfo_u_id` int(11) NOT NULL,
  `uinfo_stat` varchar(50) DEFAULT NULL,
  `uinfo_passtishi` varchar(50) DEFAULT NULL,
  `uinfo_passdaan` varchar(50) DEFAULT NULL,
  `uinfo_email` varchar(50) DEFAULT NULL,
  `uinfo_realname` varchar(50) DEFAULT NULL,
  `uinfo_tel` varchar(50) DEFAULT NULL,
  `uinfo_sex` varchar(10) DEFAULT NULL,
  `uinfo_addr` varchar(2000) DEFAULT NULL,
  `uinfo_postcode` varchar(50) DEFAULT NULL,
  `uinfo_jibie` int(11) DEFAULT NULL,
  PRIMARY KEY (`uinfo_id`)
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
