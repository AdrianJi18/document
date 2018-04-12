/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : smartfarm

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-04-12 18:45:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `animal`
-- ----------------------------
DROP TABLE IF EXISTS `animal`;
CREATE TABLE `animal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `growth` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of animal
-- ----------------------------

-- ----------------------------
-- Table structure for `menu1`
-- ----------------------------
DROP TABLE IF EXISTS `menu1`;
CREATE TABLE `menu1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu1
-- ----------------------------
INSERT INTO `menu1` VALUES ('1', '账号管理', '0', '1', null, 'account');
INSERT INTO `menu1` VALUES ('2', '用户管理', '1', '2', null, null);
INSERT INTO `menu1` VALUES ('3', '权限配置', '2', '3', 'permissionCfg', null);
INSERT INTO `menu1` VALUES ('4', '用户配置', '2', '3', 'userCfg', null);
INSERT INTO `menu1` VALUES ('5', '报表管理', '0', '1', null, 'report');
INSERT INTO `menu1` VALUES ('6', '日志', '5', '2', null, null);
INSERT INTO `menu1` VALUES ('7', '操作日志', '6', '3', 'operateLog', null);
INSERT INTO `menu1` VALUES ('8', '访问日志', '6', '3', 'visitlog', null);
INSERT INTO `menu1` VALUES ('9', '图表', '5', '2', null, null);
INSERT INTO `menu1` VALUES ('10', '图表统计', '9', '3', 'chart', null);
INSERT INTO `menu1` VALUES ('11', '饲养中心', '0', '1', null, 'feed');
INSERT INTO `menu1` VALUES ('12', '生产中心', '0', '1', null, 'make');
INSERT INTO `menu1` VALUES ('13', '销售中心', '0', '1', null, 'sale');

-- ----------------------------
-- Table structure for `operatelog`
-- ----------------------------
DROP TABLE IF EXISTS `operatelog`;
CREATE TABLE `operatelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` int(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operatelog
-- ----------------------------
INSERT INTO `operatelog` VALUES ('9', 'admin', '2018-04-11 19:35:46', '4', '访问日志', '操作成功');
INSERT INTO `operatelog` VALUES ('10', 'admin', '2018-04-11 19:35:51', '4', '访问日志', '操作成功');
INSERT INTO `operatelog` VALUES ('11', 'admin', '2018-04-11 19:36:03', '4', '访问日志', '操作成功');
INSERT INTO `operatelog` VALUES ('12', 'admin', '2018-04-11 19:36:11', '5', '访问日志', '操作失败,失败原因：导出数据失败');
INSERT INTO `operatelog` VALUES ('13', 'admin', '2018-04-11 19:40:52', '5', '访问日志', '操作成功');
INSERT INTO `operatelog` VALUES ('14', 'admin', '2018-04-11 19:56:40', '3', '重置密码', '操作成功');
INSERT INTO `operatelog` VALUES ('15', 'admin', '2018-04-12 13:36:05', '1', '权限信息', '操作成功');
INSERT INTO `operatelog` VALUES ('16', 'admin', '2018-04-12 13:36:53', '3', '权限信息', '操作成功');
INSERT INTO `operatelog` VALUES ('17', 'admin', '2018-04-12 13:37:10', '2', '权限信息', '操作成功');
INSERT INTO `operatelog` VALUES ('18', 'admin', '2018-04-12 15:16:52', '1', '用户信息', 'Invalid bound statement (not found): com.jh.dao.UserMapper.insertSelective');
INSERT INTO `operatelog` VALUES ('19', 'admin', '2018-04-12 15:21:43', '1', '用户信息', 'Invalid bound statement (not found): com.jh.dao.UserMapper.insertSelective');
INSERT INTO `operatelog` VALUES ('20', 'admin', '2018-04-12 15:23:52', '1', '用户信息', '操作成功');
INSERT INTO `operatelog` VALUES ('21', 'admin', '2018-04-12 15:49:38', '2', '用户信息', '操作成功');
INSERT INTO `operatelog` VALUES ('22', 'admin', '2018-04-12 15:50:48', '1', '用户信息', '操作成功');
INSERT INTO `operatelog` VALUES ('23', 'admin', '2018-04-12 16:36:32', '3', '用户信息', '操作成功');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `a_id` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', null, null, '23', null);
INSERT INTO `orders` VALUES ('2', null, null, '23', null);

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('3', '222', '2');
INSERT INTO `permission` VALUES ('4', '333', '3');

-- ----------------------------
-- Table structure for `permission_menu`
-- ----------------------------
DROP TABLE IF EXISTS `permission_menu`;
CREATE TABLE `permission_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_1` (`permissionId`),
  KEY `fk_2` (`menuId`),
  CONSTRAINT `fk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_2` FOREIGN KEY (`menuId`) REFERENCES `menu1` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission_menu
-- ----------------------------
INSERT INTO `permission_menu` VALUES ('27', '4', '5');
INSERT INTO `permission_menu` VALUES ('28', '4', '6');
INSERT INTO `permission_menu` VALUES ('29', '4', '7');
INSERT INTO `permission_menu` VALUES ('30', '4', '8');
INSERT INTO `permission_menu` VALUES ('31', '4', '9');
INSERT INTO `permission_menu` VALUES ('32', '4', '10');
INSERT INTO `permission_menu` VALUES ('33', '3', '5');
INSERT INTO `permission_menu` VALUES ('34', '3', '6');
INSERT INTO `permission_menu` VALUES ('35', '3', '7');
INSERT INTO `permission_menu` VALUES ('36', '3', '8');
INSERT INTO `permission_menu` VALUES ('37', '3', '9');
INSERT INTO `permission_menu` VALUES ('38', '3', '10');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `a_id` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `desciption` varchar(255) DEFAULT NULL,
  `use` varchar(255) DEFAULT NULL,
  `productQC` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', null, null, '23', null, null);
INSERT INTO `product` VALUES ('2', null, null, null, null, null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `permissionId` int(11) DEFAULT NULL,
  `trueName` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `area` int(255) DEFAULT NULL,
  `identity` int(255) DEFAULT NULL,
  `audit` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', 'ji', 'e10adc3949ba59abbe56e057f20f883e', '3', 'jihong', '12', '11111111111', 'sd', '1', '1', '1', '0');

-- ----------------------------
-- Table structure for `visitlog`
-- ----------------------------
DROP TABLE IF EXISTS `visitlog`;
CREATE TABLE `visitlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `visitime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `exitime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of visitlog
-- ----------------------------
INSERT INTO `visitlog` VALUES ('43', 'admin', '2018-04-11 13:16:46', null);
INSERT INTO `visitlog` VALUES ('44', 'admin', '2018-04-11 18:46:23', null);
INSERT INTO `visitlog` VALUES ('45', 'admin', '2018-04-11 19:11:05', null);
INSERT INTO `visitlog` VALUES ('46', 'admin', '2018-04-11 19:22:38', null);
INSERT INTO `visitlog` VALUES ('47', 'admin', '2018-04-11 19:24:50', null);
INSERT INTO `visitlog` VALUES ('48', 'admin', '2018-04-11 19:35:20', '2018-04-11 19:35:20');
INSERT INTO `visitlog` VALUES ('49', 'admin', '2018-04-11 19:35:27', null);
INSERT INTO `visitlog` VALUES ('50', 'admin', '2018-04-11 20:08:39', null);
INSERT INTO `visitlog` VALUES ('51', 'admin', '2018-04-11 20:30:39', null);
INSERT INTO `visitlog` VALUES ('52', 'admin', '2018-04-11 20:44:01', null);
INSERT INTO `visitlog` VALUES ('53', 'admin', '2018-04-11 20:56:11', null);
INSERT INTO `visitlog` VALUES ('54', 'admin', '2018-04-11 21:00:56', null);
INSERT INTO `visitlog` VALUES ('55', 'admin', '2018-04-11 21:19:58', null);
INSERT INTO `visitlog` VALUES ('56', 'admin', '2018-04-11 21:58:36', null);
INSERT INTO `visitlog` VALUES ('57', 'admin', '2018-04-12 10:36:23', null);
INSERT INTO `visitlog` VALUES ('58', 'admin', '2018-04-12 10:46:58', null);
INSERT INTO `visitlog` VALUES ('59', 'admin', '2018-04-12 10:55:02', null);
INSERT INTO `visitlog` VALUES ('60', 'admin', '2018-04-12 11:03:59', null);
INSERT INTO `visitlog` VALUES ('61', 'admin', '2018-04-12 11:06:18', null);
INSERT INTO `visitlog` VALUES ('62', 'admin', '2018-04-12 11:22:41', null);
INSERT INTO `visitlog` VALUES ('63', 'admin', '2018-04-12 11:24:55', null);
INSERT INTO `visitlog` VALUES ('64', 'admin', '2018-04-12 11:39:39', null);
INSERT INTO `visitlog` VALUES ('65', 'admin', '2018-04-12 13:03:43', null);
INSERT INTO `visitlog` VALUES ('66', 'admin', '2018-04-12 14:21:02', null);
INSERT INTO `visitlog` VALUES ('67', 'admin', '2018-04-12 14:30:09', null);
INSERT INTO `visitlog` VALUES ('68', 'admin', '2018-04-12 14:37:35', null);
INSERT INTO `visitlog` VALUES ('69', 'admin', '2018-04-12 14:39:52', null);
INSERT INTO `visitlog` VALUES ('70', 'admin', '2018-04-12 14:52:32', null);
INSERT INTO `visitlog` VALUES ('71', 'admin', '2018-04-12 16:36:45', '2018-04-12 16:36:45');
INSERT INTO `visitlog` VALUES ('72', 'ji', '2018-04-12 16:44:24', null);
INSERT INTO `visitlog` VALUES ('73', 'ji', '2018-04-12 16:46:13', null);
INSERT INTO `visitlog` VALUES ('74', 'ji', '2018-04-12 16:51:14', null);
INSERT INTO `visitlog` VALUES ('75', 'ji', '2018-04-12 16:55:02', null);
INSERT INTO `visitlog` VALUES ('76', 'ji', '2018-04-12 16:56:33', null);
INSERT INTO `visitlog` VALUES ('77', 'admin', '2018-04-12 16:57:01', null);
INSERT INTO `visitlog` VALUES ('78', 'admin', '2018-04-12 17:09:40', null);
INSERT INTO `visitlog` VALUES ('79', 'admin', '2018-04-12 18:26:40', null);
