/*
Navicat MySQL Data Transfer

Source Server         : centos(2)
Source Server Version : 50173
Source Host           : 192.168.139.143:3306
Source Database       : wxshop

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-05-02 16:01:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wxshop_admin
-- ----------------------------
DROP TABLE IF EXISTS `wxshop_admin`;
CREATE TABLE `wxshop_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='@管理员表';

-- ----------------------------
-- Records of wxshop_admin
-- ----------------------------
INSERT INTO `wxshop_admin` VALUES ('1', 'admin', '4db74bb5649cf2848ab123d1667e2514');

-- ----------------------------
-- Table structure for wxshop_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `wxshop_cart_item`;
CREATE TABLE `wxshop_cart_item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `member_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `product_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `count` int(11) DEFAULT NULL COMMENT '商品数量',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='@购物车表';

-- ----------------------------
-- Records of wxshop_cart_item
-- ----------------------------

-- ----------------------------
-- Table structure for wxshop_category
-- ----------------------------
DROP TABLE IF EXISTS `wxshop_category`;
CREATE TABLE `wxshop_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(20) DEFAULT NULL COMMENT '分类名称',
  `category_no` int(11) DEFAULT NULL,
  `preview` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL COMMENT '父级ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='@商品分类表';

-- ----------------------------
-- Records of wxshop_category
-- ----------------------------
INSERT INTO `wxshop_category` VALUES ('1', 'php', '1', null, null, null, null);
INSERT INTO `wxshop_category` VALUES ('2', 'java', '2', null, null, null, null);
INSERT INTO `wxshop_category` VALUES ('3', 'javascript', '3', null, null, null, null);
INSERT INTO `wxshop_category` VALUES ('4', 'laravel', '1', null, '1', null, null);
INSERT INTO `wxshop_category` VALUES ('5', 'thinkphp', '2', null, '1', null, '2016-02-28 20:11:15');
INSERT INTO `wxshop_category` VALUES ('6', 'yii', '3', null, '1', null, null);
INSERT INTO `wxshop_category` VALUES ('7', 'nodejs', '1', null, '3', null, null);
INSERT INTO `wxshop_category` VALUES ('8', 'reactjs', '2', null, '3', null, null);
INSERT INTO `wxshop_category` VALUES ('9', 'angularjs', '3', null, '3', null, null);
INSERT INTO `wxshop_category` VALUES ('10', 'java base', '1', null, '2', null, null);
INSERT INTO `wxshop_category` VALUES ('11', 'java web', '2', null, '2', null, null);

-- ----------------------------
-- Table structure for wxshop_member
-- ----------------------------
DROP TABLE IF EXISTS `wxshop_member`;
CREATE TABLE `wxshop_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `nickname` varchar(16) DEFAULT NULL COMMENT '会员昵称',
  `phone` varchar(20) NOT NULL COMMENT '会员手机号码',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `email` varchar(45) NOT NULL COMMENT '邮箱',
  `active` int(11) DEFAULT '0' COMMENT '是否激活 默认为0(未激活)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='@会员表';

-- ----------------------------
-- Records of wxshop_member
-- ----------------------------
INSERT INTO `wxshop_member` VALUES ('12', 'hehe', '17000204093', 'ca95a7cb6dfc2a840255b7703d5a3f21', '2016-01-03 16:26:24', '2016-01-03 16:26:24', '', '0');
INSERT INTO `wxshop_member` VALUES ('17', 'haha', '13838381438', 'e10adc3949ba59abbe56e057f20f883e', '2016-01-03 20:06:26', '2016-03-02 00:40:51', '13838381438@163.com', '0');

-- ----------------------------
-- Table structure for wxshop_order
-- ----------------------------
DROP TABLE IF EXISTS `wxshop_order`;
CREATE TABLE `wxshop_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `member_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `order_no` varchar(45) DEFAULT NULL COMMENT '订单号',
  `name` varchar(45) DEFAULT NULL COMMENT '商品名称',
  `total_price` decimal(10,2) DEFAULT NULL COMMENT '总金额',
  `payway` int(11) DEFAULT '1' COMMENT '付款方式',
  `status` int(11) DEFAULT '1' COMMENT '状态',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='@订单表';

-- ----------------------------
-- Records of wxshop_order
-- ----------------------------
INSERT INTO `wxshop_order` VALUES ('9', '12', 'E14562303689', '《深入浅出Node.js》《Node.js权威指南》《React》', '90.00', '1', '2', '2016-02-23 20:26:08', '2016-03-02 22:41:35');
INSERT INTO `wxshop_order` VALUES ('10', '12', 'E145623055610', '《深入浅出Node.js》《Node.js权威指南》《React》', '90.00', '1', '1', '2016-02-23 20:29:16', '2016-03-02 22:44:29');
INSERT INTO `wxshop_order` VALUES ('18', '12', 'E145623133518', '《React》', '10.00', '1', '2', '2016-02-23 20:42:14', '2016-02-23 20:42:15');
INSERT INTO `wxshop_order` VALUES ('19', '12', 'E145623147819', '《React》', '10.00', '1', '1', '2016-02-23 20:44:38', '2016-02-23 20:44:38');
INSERT INTO `wxshop_order` VALUES ('20', '12', 'E145700200720', '《React》《深入浅出Node.js》', '20.00', '1', '4', '2016-03-03 18:46:47', '2017-05-01 14:53:31');
INSERT INTO `wxshop_order` VALUES ('21', '17', 'E149370608121', '《深入浅出Node.js》', '30.00', '1', '1', '2017-05-02 14:21:21', '2017-05-02 14:21:21');
INSERT INTO `wxshop_order` VALUES ('22', '17', 'E149370663922', '《深入浅出Node.js》', '10.00', '1', '1', '2017-05-02 14:30:39', '2017-05-02 14:30:39');

-- ----------------------------
-- Table structure for wxshop_order_item
-- ----------------------------
DROP TABLE IF EXISTS `wxshop_order_item`;
CREATE TABLE `wxshop_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `product_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `count` int(11) DEFAULT NULL COMMENT '商品数量',
  `pdt_snapshot` varchar(2000) DEFAULT NULL COMMENT '商品详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='@订单详情表';

-- ----------------------------
-- Records of wxshop_order_item
-- ----------------------------
INSERT INTO `wxshop_order_item` VALUES ('12', '9', '1', '4', '{\"id\":1,\"name\":\"\\u6df1\\u5165\\u6d45\\u51faNode.js\",\"summary\":\"\\u7b2c\\u4e00\\u672c\\u6df1\\u5ea6\\u8bb2\\u89e3Node\\u7684\\u56fe\\u4e66,\\u6e90\\u7801\\u7ea7\\u522b\\u63a2\\u5bfb\\u8fc7Node\\u7684\\u5b9e\\u73b0\\u539f\\u7406,\\u963f\\u91cc\\u5df4\\u5df4\\u4e00\\u7ebfNode\\u5f00\\u53d1\\u8005\\u6700\\u771f\\u5b9e\\u7684\\u7ecf\\u9a8c\",\"price\":\"10.00\",\"preview\":\"\\/images\\/1.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('13', '9', '2', '3', '{\"id\":2,\"name\":\"Node.js\\u6743\\u5a01\\u6307\\u5357\",\"summary\":\"\\u4ee5\\u5b9e\\u8df5\\u4e3a\\u5bfc\\u5411\\uff0c\\u4e0d\\u4ec5\\u4e3a\\u6bcf\\u4e2a\\u77e5\\u8bc6\\u70b9\\u914d\\u5907\\u4e86\\u7cbe\\u5de7\\u7684\\u5c0f\\u6848\\u4f8b\\uff0c\\u800c\\u4e14\\u8fd8\\u8bbe\\u8ba1\\u4e862\\u4e2a\\u53ef\\u64cd\\u4f5c\\u6027\\u6781\\u5f3a\\u7684\\u7efc\\u5408\\u6027\\u6848\\u4f8b\",\"price\":\"10.00\",\"preview\":\"\\/images\\/2.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('14', '9', '3', '2', '{\"id\":3,\"name\":\"React\",\"summary\":\"\\u8eab\\u51fa\\u540d\\u95e8\\uff0cFackbook\\u5f00\\u6e90\\u5de8\\u732e\\uff0c\\u4e00\\u7ecf\\u63a8\\u51fa\\uff0c\\u77ac\\u95f4\\u4eae\\u778e\\u5168\\u7403\\u653b\\u57ce\\u72ee,\\u4ee5BAT\\u4e3a\\u9996\\u7684\\u4e00\\u7ebf\\u56fd\\u5185\\u4e92\\u8054\\u7f51\\u4f01\\u4e1a\\u5747\\u4ee5\\u5feb\\u901f\\u8ddf\\u8fdb\\u7814\\u53d1\\u3001\\u5b9e\\u8df5React\\uff0c\\u4e0b\\u4e00\\u6b21\\u6c42\\u804c\\u4f60\\u5c31\\u4e00\\u5b9a\\u4f1a\\u88ab\\u9762\\u5230\",\"price\":\"10.00\",\"preview\":\"\\/images\\/3.jpg\",\"category_id\":8,\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('15', '10', '1', '4', '{\"id\":1,\"name\":\"\\u6df1\\u5165\\u6d45\\u51faNode.js\",\"summary\":\"\\u7b2c\\u4e00\\u672c\\u6df1\\u5ea6\\u8bb2\\u89e3Node\\u7684\\u56fe\\u4e66,\\u6e90\\u7801\\u7ea7\\u522b\\u63a2\\u5bfb\\u8fc7Node\\u7684\\u5b9e\\u73b0\\u539f\\u7406,\\u963f\\u91cc\\u5df4\\u5df4\\u4e00\\u7ebfNode\\u5f00\\u53d1\\u8005\\u6700\\u771f\\u5b9e\\u7684\\u7ecf\\u9a8c\",\"price\":\"10.00\",\"preview\":\"\\/images\\/1.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('16', '10', '2', '3', '{\"id\":2,\"name\":\"Node.js\\u6743\\u5a01\\u6307\\u5357\",\"summary\":\"\\u4ee5\\u5b9e\\u8df5\\u4e3a\\u5bfc\\u5411\\uff0c\\u4e0d\\u4ec5\\u4e3a\\u6bcf\\u4e2a\\u77e5\\u8bc6\\u70b9\\u914d\\u5907\\u4e86\\u7cbe\\u5de7\\u7684\\u5c0f\\u6848\\u4f8b\\uff0c\\u800c\\u4e14\\u8fd8\\u8bbe\\u8ba1\\u4e862\\u4e2a\\u53ef\\u64cd\\u4f5c\\u6027\\u6781\\u5f3a\\u7684\\u7efc\\u5408\\u6027\\u6848\\u4f8b\",\"price\":\"10.00\",\"preview\":\"\\/images\\/2.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('17', '10', '3', '2', '{\"id\":3,\"name\":\"React\",\"summary\":\"\\u8eab\\u51fa\\u540d\\u95e8\\uff0cFackbook\\u5f00\\u6e90\\u5de8\\u732e\\uff0c\\u4e00\\u7ecf\\u63a8\\u51fa\\uff0c\\u77ac\\u95f4\\u4eae\\u778e\\u5168\\u7403\\u653b\\u57ce\\u72ee,\\u4ee5BAT\\u4e3a\\u9996\\u7684\\u4e00\\u7ebf\\u56fd\\u5185\\u4e92\\u8054\\u7f51\\u4f01\\u4e1a\\u5747\\u4ee5\\u5feb\\u901f\\u8ddf\\u8fdb\\u7814\\u53d1\\u3001\\u5b9e\\u8df5React\\uff0c\\u4e0b\\u4e00\\u6b21\\u6c42\\u804c\\u4f60\\u5c31\\u4e00\\u5b9a\\u4f1a\\u88ab\\u9762\\u5230\",\"price\":\"10.00\",\"preview\":\"\\/images\\/3.jpg\",\"category_id\":8,\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('18', '11', '1', '4', '{\"id\":1,\"name\":\"\\u6df1\\u5165\\u6d45\\u51faNode.js\",\"summary\":\"\\u7b2c\\u4e00\\u672c\\u6df1\\u5ea6\\u8bb2\\u89e3Node\\u7684\\u56fe\\u4e66,\\u6e90\\u7801\\u7ea7\\u522b\\u63a2\\u5bfb\\u8fc7Node\\u7684\\u5b9e\\u73b0\\u539f\\u7406,\\u963f\\u91cc\\u5df4\\u5df4\\u4e00\\u7ebfNode\\u5f00\\u53d1\\u8005\\u6700\\u771f\\u5b9e\\u7684\\u7ecf\\u9a8c\",\"price\":\"10.00\",\"preview\":\"\\/images\\/1.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('19', '11', '2', '3', '{\"id\":2,\"name\":\"Node.js\\u6743\\u5a01\\u6307\\u5357\",\"summary\":\"\\u4ee5\\u5b9e\\u8df5\\u4e3a\\u5bfc\\u5411\\uff0c\\u4e0d\\u4ec5\\u4e3a\\u6bcf\\u4e2a\\u77e5\\u8bc6\\u70b9\\u914d\\u5907\\u4e86\\u7cbe\\u5de7\\u7684\\u5c0f\\u6848\\u4f8b\\uff0c\\u800c\\u4e14\\u8fd8\\u8bbe\\u8ba1\\u4e862\\u4e2a\\u53ef\\u64cd\\u4f5c\\u6027\\u6781\\u5f3a\\u7684\\u7efc\\u5408\\u6027\\u6848\\u4f8b\",\"price\":\"10.00\",\"preview\":\"\\/images\\/2.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('20', '11', '3', '2', '{\"id\":3,\"name\":\"React\",\"summary\":\"\\u8eab\\u51fa\\u540d\\u95e8\\uff0cFackbook\\u5f00\\u6e90\\u5de8\\u732e\\uff0c\\u4e00\\u7ecf\\u63a8\\u51fa\\uff0c\\u77ac\\u95f4\\u4eae\\u778e\\u5168\\u7403\\u653b\\u57ce\\u72ee,\\u4ee5BAT\\u4e3a\\u9996\\u7684\\u4e00\\u7ebf\\u56fd\\u5185\\u4e92\\u8054\\u7f51\\u4f01\\u4e1a\\u5747\\u4ee5\\u5feb\\u901f\\u8ddf\\u8fdb\\u7814\\u53d1\\u3001\\u5b9e\\u8df5React\\uff0c\\u4e0b\\u4e00\\u6b21\\u6c42\\u804c\\u4f60\\u5c31\\u4e00\\u5b9a\\u4f1a\\u88ab\\u9762\\u5230\",\"price\":\"10.00\",\"preview\":\"\\/images\\/3.jpg\",\"category_id\":8,\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('21', '12', '1', '4', '{\"id\":1,\"name\":\"\\u6df1\\u5165\\u6d45\\u51faNode.js\",\"summary\":\"\\u7b2c\\u4e00\\u672c\\u6df1\\u5ea6\\u8bb2\\u89e3Node\\u7684\\u56fe\\u4e66,\\u6e90\\u7801\\u7ea7\\u522b\\u63a2\\u5bfb\\u8fc7Node\\u7684\\u5b9e\\u73b0\\u539f\\u7406,\\u963f\\u91cc\\u5df4\\u5df4\\u4e00\\u7ebfNode\\u5f00\\u53d1\\u8005\\u6700\\u771f\\u5b9e\\u7684\\u7ecf\\u9a8c\",\"price\":\"10.00\",\"preview\":\"\\/images\\/1.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('22', '12', '2', '3', '{\"id\":2,\"name\":\"Node.js\\u6743\\u5a01\\u6307\\u5357\",\"summary\":\"\\u4ee5\\u5b9e\\u8df5\\u4e3a\\u5bfc\\u5411\\uff0c\\u4e0d\\u4ec5\\u4e3a\\u6bcf\\u4e2a\\u77e5\\u8bc6\\u70b9\\u914d\\u5907\\u4e86\\u7cbe\\u5de7\\u7684\\u5c0f\\u6848\\u4f8b\\uff0c\\u800c\\u4e14\\u8fd8\\u8bbe\\u8ba1\\u4e862\\u4e2a\\u53ef\\u64cd\\u4f5c\\u6027\\u6781\\u5f3a\\u7684\\u7efc\\u5408\\u6027\\u6848\\u4f8b\",\"price\":\"10.00\",\"preview\":\"\\/images\\/2.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('23', '12', '3', '2', '{\"id\":3,\"name\":\"React\",\"summary\":\"\\u8eab\\u51fa\\u540d\\u95e8\\uff0cFackbook\\u5f00\\u6e90\\u5de8\\u732e\\uff0c\\u4e00\\u7ecf\\u63a8\\u51fa\\uff0c\\u77ac\\u95f4\\u4eae\\u778e\\u5168\\u7403\\u653b\\u57ce\\u72ee,\\u4ee5BAT\\u4e3a\\u9996\\u7684\\u4e00\\u7ebf\\u56fd\\u5185\\u4e92\\u8054\\u7f51\\u4f01\\u4e1a\\u5747\\u4ee5\\u5feb\\u901f\\u8ddf\\u8fdb\\u7814\\u53d1\\u3001\\u5b9e\\u8df5React\\uff0c\\u4e0b\\u4e00\\u6b21\\u6c42\\u804c\\u4f60\\u5c31\\u4e00\\u5b9a\\u4f1a\\u88ab\\u9762\\u5230\",\"price\":\"10.00\",\"preview\":\"\\/images\\/3.jpg\",\"category_id\":8,\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('24', '13', '1', '4', '{\"id\":1,\"name\":\"\\u6df1\\u5165\\u6d45\\u51faNode.js\",\"summary\":\"\\u7b2c\\u4e00\\u672c\\u6df1\\u5ea6\\u8bb2\\u89e3Node\\u7684\\u56fe\\u4e66,\\u6e90\\u7801\\u7ea7\\u522b\\u63a2\\u5bfb\\u8fc7Node\\u7684\\u5b9e\\u73b0\\u539f\\u7406,\\u963f\\u91cc\\u5df4\\u5df4\\u4e00\\u7ebfNode\\u5f00\\u53d1\\u8005\\u6700\\u771f\\u5b9e\\u7684\\u7ecf\\u9a8c\",\"price\":\"10.00\",\"preview\":\"\\/images\\/1.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('25', '13', '2', '3', '{\"id\":2,\"name\":\"Node.js\\u6743\\u5a01\\u6307\\u5357\",\"summary\":\"\\u4ee5\\u5b9e\\u8df5\\u4e3a\\u5bfc\\u5411\\uff0c\\u4e0d\\u4ec5\\u4e3a\\u6bcf\\u4e2a\\u77e5\\u8bc6\\u70b9\\u914d\\u5907\\u4e86\\u7cbe\\u5de7\\u7684\\u5c0f\\u6848\\u4f8b\\uff0c\\u800c\\u4e14\\u8fd8\\u8bbe\\u8ba1\\u4e862\\u4e2a\\u53ef\\u64cd\\u4f5c\\u6027\\u6781\\u5f3a\\u7684\\u7efc\\u5408\\u6027\\u6848\\u4f8b\",\"price\":\"10.00\",\"preview\":\"\\/images\\/2.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('26', '13', '3', '2', '{\"id\":3,\"name\":\"React\",\"summary\":\"\\u8eab\\u51fa\\u540d\\u95e8\\uff0cFackbook\\u5f00\\u6e90\\u5de8\\u732e\\uff0c\\u4e00\\u7ecf\\u63a8\\u51fa\\uff0c\\u77ac\\u95f4\\u4eae\\u778e\\u5168\\u7403\\u653b\\u57ce\\u72ee,\\u4ee5BAT\\u4e3a\\u9996\\u7684\\u4e00\\u7ebf\\u56fd\\u5185\\u4e92\\u8054\\u7f51\\u4f01\\u4e1a\\u5747\\u4ee5\\u5feb\\u901f\\u8ddf\\u8fdb\\u7814\\u53d1\\u3001\\u5b9e\\u8df5React\\uff0c\\u4e0b\\u4e00\\u6b21\\u6c42\\u804c\\u4f60\\u5c31\\u4e00\\u5b9a\\u4f1a\\u88ab\\u9762\\u5230\",\"price\":\"10.00\",\"preview\":\"\\/images\\/3.jpg\",\"category_id\":8,\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('27', '14', '1', '4', '{\"id\":1,\"name\":\"\\u6df1\\u5165\\u6d45\\u51faNode.js\",\"summary\":\"\\u7b2c\\u4e00\\u672c\\u6df1\\u5ea6\\u8bb2\\u89e3Node\\u7684\\u56fe\\u4e66,\\u6e90\\u7801\\u7ea7\\u522b\\u63a2\\u5bfb\\u8fc7Node\\u7684\\u5b9e\\u73b0\\u539f\\u7406,\\u963f\\u91cc\\u5df4\\u5df4\\u4e00\\u7ebfNode\\u5f00\\u53d1\\u8005\\u6700\\u771f\\u5b9e\\u7684\\u7ecf\\u9a8c\",\"price\":\"10.00\",\"preview\":\"\\/images\\/1.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('28', '14', '2', '3', '{\"id\":2,\"name\":\"Node.js\\u6743\\u5a01\\u6307\\u5357\",\"summary\":\"\\u4ee5\\u5b9e\\u8df5\\u4e3a\\u5bfc\\u5411\\uff0c\\u4e0d\\u4ec5\\u4e3a\\u6bcf\\u4e2a\\u77e5\\u8bc6\\u70b9\\u914d\\u5907\\u4e86\\u7cbe\\u5de7\\u7684\\u5c0f\\u6848\\u4f8b\\uff0c\\u800c\\u4e14\\u8fd8\\u8bbe\\u8ba1\\u4e862\\u4e2a\\u53ef\\u64cd\\u4f5c\\u6027\\u6781\\u5f3a\\u7684\\u7efc\\u5408\\u6027\\u6848\\u4f8b\",\"price\":\"10.00\",\"preview\":\"\\/images\\/2.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('29', '14', '3', '2', '{\"id\":3,\"name\":\"React\",\"summary\":\"\\u8eab\\u51fa\\u540d\\u95e8\\uff0cFackbook\\u5f00\\u6e90\\u5de8\\u732e\\uff0c\\u4e00\\u7ecf\\u63a8\\u51fa\\uff0c\\u77ac\\u95f4\\u4eae\\u778e\\u5168\\u7403\\u653b\\u57ce\\u72ee,\\u4ee5BAT\\u4e3a\\u9996\\u7684\\u4e00\\u7ebf\\u56fd\\u5185\\u4e92\\u8054\\u7f51\\u4f01\\u4e1a\\u5747\\u4ee5\\u5feb\\u901f\\u8ddf\\u8fdb\\u7814\\u53d1\\u3001\\u5b9e\\u8df5React\\uff0c\\u4e0b\\u4e00\\u6b21\\u6c42\\u804c\\u4f60\\u5c31\\u4e00\\u5b9a\\u4f1a\\u88ab\\u9762\\u5230\",\"price\":\"10.00\",\"preview\":\"\\/images\\/3.jpg\",\"category_id\":8,\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('30', '15', '3', '1', '{\"id\":3,\"name\":\"React\",\"summary\":\"\\u8eab\\u51fa\\u540d\\u95e8\\uff0cFackbook\\u5f00\\u6e90\\u5de8\\u732e\\uff0c\\u4e00\\u7ecf\\u63a8\\u51fa\\uff0c\\u77ac\\u95f4\\u4eae\\u778e\\u5168\\u7403\\u653b\\u57ce\\u72ee,\\u4ee5BAT\\u4e3a\\u9996\\u7684\\u4e00\\u7ebf\\u56fd\\u5185\\u4e92\\u8054\\u7f51\\u4f01\\u4e1a\\u5747\\u4ee5\\u5feb\\u901f\\u8ddf\\u8fdb\\u7814\\u53d1\\u3001\\u5b9e\\u8df5React\\uff0c\\u4e0b\\u4e00\\u6b21\\u6c42\\u804c\\u4f60\\u5c31\\u4e00\\u5b9a\\u4f1a\\u88ab\\u9762\\u5230\",\"price\":\"10.00\",\"preview\":\"\\/images\\/3.jpg\",\"category_id\":8,\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('31', '17', '3', '1', '{\"id\":3,\"name\":\"React\",\"summary\":\"\\u8eab\\u51fa\\u540d\\u95e8\\uff0cFackbook\\u5f00\\u6e90\\u5de8\\u732e\\uff0c\\u4e00\\u7ecf\\u63a8\\u51fa\\uff0c\\u77ac\\u95f4\\u4eae\\u778e\\u5168\\u7403\\u653b\\u57ce\\u72ee,\\u4ee5BAT\\u4e3a\\u9996\\u7684\\u4e00\\u7ebf\\u56fd\\u5185\\u4e92\\u8054\\u7f51\\u4f01\\u4e1a\\u5747\\u4ee5\\u5feb\\u901f\\u8ddf\\u8fdb\\u7814\\u53d1\\u3001\\u5b9e\\u8df5React\\uff0c\\u4e0b\\u4e00\\u6b21\\u6c42\\u804c\\u4f60\\u5c31\\u4e00\\u5b9a\\u4f1a\\u88ab\\u9762\\u5230\",\"price\":\"10.00\",\"preview\":\"\\/images\\/3.jpg\",\"category_id\":8,\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('32', '18', '3', '1', '{\"id\":3,\"name\":\"React\",\"summary\":\"\\u8eab\\u51fa\\u540d\\u95e8\\uff0cFackbook\\u5f00\\u6e90\\u5de8\\u732e\\uff0c\\u4e00\\u7ecf\\u63a8\\u51fa\\uff0c\\u77ac\\u95f4\\u4eae\\u778e\\u5168\\u7403\\u653b\\u57ce\\u72ee,\\u4ee5BAT\\u4e3a\\u9996\\u7684\\u4e00\\u7ebf\\u56fd\\u5185\\u4e92\\u8054\\u7f51\\u4f01\\u4e1a\\u5747\\u4ee5\\u5feb\\u901f\\u8ddf\\u8fdb\\u7814\\u53d1\\u3001\\u5b9e\\u8df5React\\uff0c\\u4e0b\\u4e00\\u6b21\\u6c42\\u804c\\u4f60\\u5c31\\u4e00\\u5b9a\\u4f1a\\u88ab\\u9762\\u5230\",\"price\":\"10.00\",\"preview\":\"\\/images\\/3.jpg\",\"category_id\":8,\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('33', '19', '3', '1', '{\"id\":3,\"name\":\"React\",\"summary\":\"\\u8eab\\u51fa\\u540d\\u95e8\\uff0cFackbook\\u5f00\\u6e90\\u5de8\\u732e\\uff0c\\u4e00\\u7ecf\\u63a8\\u51fa\\uff0c\\u77ac\\u95f4\\u4eae\\u778e\\u5168\\u7403\\u653b\\u57ce\\u72ee,\\u4ee5BAT\\u4e3a\\u9996\\u7684\\u4e00\\u7ebf\\u56fd\\u5185\\u4e92\\u8054\\u7f51\\u4f01\\u4e1a\\u5747\\u4ee5\\u5feb\\u901f\\u8ddf\\u8fdb\\u7814\\u53d1\\u3001\\u5b9e\\u8df5React\\uff0c\\u4e0b\\u4e00\\u6b21\\u6c42\\u804c\\u4f60\\u5c31\\u4e00\\u5b9a\\u4f1a\\u88ab\\u9762\\u5230\",\"price\":\"10.00\",\"preview\":\"\\/images\\/3.jpg\",\"category_id\":8,\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('34', '20', '3', '1', '{\"id\":3,\"name\":\"React\",\"summary\":\"\\u8eab\\u51fa\\u540d\\u95e8\\uff0cFackbook\\u5f00\\u6e90\\u5de8\\u732e\\uff0c\\u4e00\\u7ecf\\u63a8\\u51fa\\uff0c\\u77ac\\u95f4\\u4eae\\u778e\\u5168\\u7403\\u653b\\u57ce\\u72ee,\\u4ee5BAT\\u4e3a\\u9996\\u7684\\u4e00\\u7ebf\\u56fd\\u5185\\u4e92\\u8054\\u7f51\\u4f01\\u4e1a\\u5747\\u4ee5\\u5feb\\u901f\\u8ddf\\u8fdb\\u7814\\u53d1\\u3001\\u5b9e\\u8df5React\\uff0c\\u4e0b\\u4e00\\u6b21\\u6c42\\u804c\\u4f60\\u5c31\\u4e00\\u5b9a\\u4f1a\\u88ab\\u9762\\u5230\",\"price\":\"10.00\",\"preview\":\"\\/images\\/3.jpg\",\"category_id\":8,\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('35', '20', '1', '1', '{\"id\":1,\"name\":\"\\u6df1\\u5165\\u6d45\\u51faNode.js\",\"summary\":\"\\u7b2c\\u4e00\\u672c\\u6df1\\u5ea6\\u8bb2\\u89e3Node\\u7684\\u56fe\\u4e66,\\u6e90\\u7801\\u7ea7\\u522b\\u63a2\\u5bfb\\u8fc7Node\\u7684\\u5b9e\\u73b0\\u539f\\u7406,\\u963f\\u91cc\\u5df4\\u5df4\\u4e00\\u7ebfNode\\u5f00\\u53d1\\u8005\\u6700\\u771f\\u5b9e\\u7684\\u7ecf\\u9a8c\",\"price\":\"10.00\",\"preview\":\"\\/images\\/1.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('36', '21', '1', '3', '{\"id\":\"1\",\"name\":\"\\u6df1\\u5165\\u6d45\\u51faNode.js\",\"summary\":\"\\u7b2c\\u4e00\\u672c\\u6df1\\u5ea6\\u8bb2\\u89e3Node\\u7684\\u56fe\\u4e66,\\u6e90\\u7801\\u7ea7\\u522b\\u63a2\\u5bfb\\u8fc7Node\\u7684\\u5b9e\\u73b0\\u539f\\u7406,\\u963f\\u91cc\\u5df4\\u5df4\\u4e00\\u7ebfNode\\u5f00\\u53d1\\u8005\\u6700\\u771f\\u5b9e\\u7684\\u7ecf\\u9a8c\",\"price\":\"10.00\",\"preview\":\"\\/images\\/1.jpg\",\"category_id\":\"7\",\"created_at\":null,\"updated_at\":null}');
INSERT INTO `wxshop_order_item` VALUES ('37', '22', '1', '1', '{\"id\":\"1\",\"name\":\"\\u6df1\\u5165\\u6d45\\u51faNode.js\",\"summary\":\"\\u7b2c\\u4e00\\u672c\\u6df1\\u5ea6\\u8bb2\\u89e3Node\\u7684\\u56fe\\u4e66,\\u6e90\\u7801\\u7ea7\\u522b\\u63a2\\u5bfb\\u8fc7Node\\u7684\\u5b9e\\u73b0\\u539f\\u7406,\\u963f\\u91cc\\u5df4\\u5df4\\u4e00\\u7ebfNode\\u5f00\\u53d1\\u8005\\u6700\\u771f\\u5b9e\\u7684\\u7ecf\\u9a8c\",\"price\":\"10.00\",\"preview\":\"\\/images\\/1.jpg\",\"category_id\":\"7\",\"created_at\":null,\"updated_at\":null}');

-- ----------------------------
-- Table structure for wxshop_pdt_content
-- ----------------------------
DROP TABLE IF EXISTS `wxshop_pdt_content`;
CREATE TABLE `wxshop_pdt_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `content` varchar(20000) DEFAULT NULL COMMENT '商品详情',
  `product_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='@商品详情表';

-- ----------------------------
-- Records of wxshop_pdt_content
-- ----------------------------
INSERT INTO `wxshop_pdt_content` VALUES ('1', 'Node.js实战（第2季） \n¥50.20 (8.51折)\nNode.js实战（第2季）\n吴中骅 雷宗民 赵坤 刘亚中 著\nAngularJS权威教程 “百科全书”式著作，公认的AngularJS经典。MVC教程精粹，JavaScript框架教程实例。\n¥84.00 (8.49折)\nAngularJS权威教程\n（美）勒纳　著 等\nJavaScript实战—JavaScript、jQuery、HTML5、Node.js实例大全 \n¥58.60 (8.5折)\nJavaScript实战—JavaScript、jQuery、HTML5、Node.js实例大\n张泽娜 编著\n跨终端 Web 移动优先|响应式|HTML5|Hybrid|桌面+移动应用|一线前端负责人联袂推荐\n¥46.70 (8.5折)\n跨终端 Web\n徐凯　著\nAngularJS高级程序设计 深入学习AngularJS，驾驭强大的现代Web浏览器\n¥84.20 (8.51折)\nAngularJS高级程序设计\n[美] Adam Freeman 弗里曼　著 等\nJavaScript框架设计 进入JavaScript框架设计的魔法指南。html+css+javascript教程详解，JavaScript高级程序设计精粹！\n¥75.00 (8.43折)\nJavaScript框架设计\n司徒正美　编著\n[当当自营]金龙鱼 原香稻大米5000g（限北京市购买）新老包装随机发放 自营食品 粮油 新老包装随机发货  物流原因限北京市购买\n¥61.00\n[当当自营]金龙鱼 原香稻大米5000g（限北京市购买）新老包装\n远山 白莲子 福建建宁磨皮莲子250g*2袋 口感粉面水磨通心去芯 满138-10 满228-20 满328-30\n¥36.80\n远山 白莲子 福建建宁磨皮莲子250g*2袋 口感粉面水磨通心去\n更多>>', '1', null, null);
INSERT INTO `wxshop_pdt_content` VALUES ('2', 'xxxxxxxxx', '2', null, null);
INSERT INTO `wxshop_pdt_content` VALUES ('3', '<p>111</p>', '5', '2016-02-29 02:15:37', '2016-02-29 02:15:37');
INSERT INTO `wxshop_pdt_content` VALUES ('4', '<p>休息休息</p>', '6', '2016-02-29 02:50:42', '2016-02-29 02:50:42');

-- ----------------------------
-- Table structure for wxshop_pdt_images
-- ----------------------------
DROP TABLE IF EXISTS `wxshop_pdt_images`;
CREATE TABLE `wxshop_pdt_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `image_path` varchar(200) DEFAULT NULL COMMENT '图片路径',
  `image_no` int(11) DEFAULT NULL COMMENT '图片编号',
  `product_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='@商品图片表';

-- ----------------------------
-- Records of wxshop_pdt_images
-- ----------------------------
INSERT INTO `wxshop_pdt_images` VALUES ('1', '/images/1.jpg', null, '1', null, null);
INSERT INTO `wxshop_pdt_images` VALUES ('2', '/images/2.jpg', null, '1', null, null);
INSERT INTO `wxshop_pdt_images` VALUES ('3', '/images/3.jpg', null, '1', null, null);
INSERT INTO `wxshop_pdt_images` VALUES ('4', '/upload/images/20160229/27edde94c996defb3e594c54d9328459.png', '1', '5', '2016-02-29 02:15:37', '2016-02-29 02:15:37');
INSERT INTO `wxshop_pdt_images` VALUES ('5', '/upload/images/20160229/4de6d095b3a014af4b1b2df29bde0ab5.png', '2', '5', '2016-02-29 02:15:37', '2016-02-29 02:15:37');
INSERT INTO `wxshop_pdt_images` VALUES ('6', '/upload/images/20160229/f46db7a5c23bc65ca2df8d6c77a38c2e.png', '1', '6', '2016-02-29 02:50:42', '2016-02-29 02:50:42');
INSERT INTO `wxshop_pdt_images` VALUES ('7', '/upload/images/20160229/f69a1305399e7ed2cb9cc6db79312887.png', '2', '6', '2016-02-29 02:50:42', '2016-02-29 02:50:42');

-- ----------------------------
-- Table structure for wxshop_product
-- ----------------------------
DROP TABLE IF EXISTS `wxshop_product`;
CREATE TABLE `wxshop_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(20) DEFAULT NULL COMMENT '商品名称',
  `summary` varchar(200) DEFAULT NULL COMMENT '商品摘要',
  `price` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `preview` varchar(200) DEFAULT NULL COMMENT '商品缩略图',
  `category_id` int(11) DEFAULT NULL COMMENT '商品分类ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='@商品表';

-- ----------------------------
-- Records of wxshop_product
-- ----------------------------
INSERT INTO `wxshop_product` VALUES ('1', '深入浅出Node.js', '第一本深度讲解Node的图书,源码级别探寻过Node的实现原理,阿里巴巴一线Node开发者最真实的经验', '10.00', '/images/1.jpg', '7', null, null);
INSERT INTO `wxshop_product` VALUES ('2', 'Node.js权威指南', '以实践为导向，不仅为每个知识点配备了精巧的小案例，而且还设计了2个可操作性极强的综合性案例', '10.00', '/images/2.jpg', '7', null, null);
INSERT INTO `wxshop_product` VALUES ('3', 'React', '身出名门，Fackbook开源巨献，一经推出，瞬间亮瞎全球攻城狮,以BAT为首的一线国内互联网企业均以快速跟进研发、实践React，下一次求职你就一定会被面到', '10.00', '/images/3.jpg', '8', null, null);
INSERT INTO `wxshop_product` VALUES ('4', 'React Native', '如果你对开发Web端的原生移动应用感兴趣，《React Native：用JavaScript开发移动应用》就是一本不容错过的以实例代码为引导的入门书籍', '10.00', '/images/4.jpg', '8', null, null);
INSERT INTO `wxshop_product` VALUES ('5', 'test', 'sss', '999.00', '/upload/images/20160229/ca8fd990a0cd3c4937afd7107cf01389.png', '7', '2016-02-29 02:15:37', '2016-02-29 02:15:37');
INSERT INTO `wxshop_product` VALUES ('6', 'test2', 'x\'x\'x\'x', '999.00', '/upload/images/20160229/305ab8feeff80360d817e70580c6b6e6.png', '7', '2016-02-29 02:50:42', '2016-02-29 02:50:42');

-- ----------------------------
-- Table structure for wxshop_temp_email
-- ----------------------------
DROP TABLE IF EXISTS `wxshop_temp_email`;
CREATE TABLE `wxshop_temp_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `code` varchar(32) DEFAULT NULL COMMENT '邮箱验证码',
  `deadline` timestamp NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='@邮箱验证临时表';

-- ----------------------------
-- Records of wxshop_temp_email
-- ----------------------------
INSERT INTO `wxshop_temp_email` VALUES ('2', '17', '1ece9d4717eb2a31a97967e629dbc1da', '2016-01-04 20:06:26');

-- ----------------------------
-- Table structure for wxshop_temp_phone
-- ----------------------------
DROP TABLE IF EXISTS `wxshop_temp_phone`;
CREATE TABLE `wxshop_temp_phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `code` int(11) DEFAULT NULL COMMENT '手机验证码',
  `deadline` timestamp NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='@手机号验证临时表';

-- ----------------------------
-- Records of wxshop_temp_phone
-- ----------------------------
INSERT INTO `wxshop_temp_phone` VALUES ('10', '17000204093', '209649', '2016-01-10 19:45:22');
