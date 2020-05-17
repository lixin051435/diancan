/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : a

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 06/03/2020 15:27:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES (1, '粉面粥店');
INSERT INTO `category` VALUES (2, '简餐便当');
INSERT INTO `category` VALUES (3, '汉堡披萨');
INSERT INTO `category` VALUES (4, '香锅冒菜');
INSERT INTO `category` VALUES (5, '小吃炸串');
INSERT INTO `category` VALUES (6, '地方菜系');
COMMIT;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `address` varchar(100) DEFAULT NULL COMMENT '买家地址',
  `phone` varchar(100) DEFAULT NULL COMMENT '买家联系方式',
  `status` int(11) DEFAULT '0' COMMENT '状态，0：普通用户，1：会员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of customer
-- ----------------------------
BEGIN;
INSERT INTO `customer` VALUES (1, 'gjm', '12345', '5A124', '123456', 1);
INSERT INTO `customer` VALUES (9, 'gjm11', '123456', '大连东软信息学院', '13456785678', 0);
COMMIT;

-- ----------------------------
-- Table structure for order_
-- ----------------------------
DROP TABLE IF EXISTS `order_`;
CREATE TABLE `order_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `address` varchar(255) DEFAULT NULL COMMENT '买家地址',
  `status` int(255) DEFAULT '0' COMMENT '支付状态，0：未支付，1：正在发货，2：已发货，3：已收货',
  `cstid` int(11) DEFAULT NULL COMMENT '买家id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cstid` (`cstid`) USING BTREE,
  CONSTRAINT `order__ibfk_1` FOREIGN KEY (`cstid`) REFERENCES `customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order_
-- ----------------------------
BEGIN;
INSERT INTO `order_` VALUES (20, '202003052143273039626', '姓名：郭金明,邮箱：888@qq.com,配送地址：大连东软信息学院,手机号：13888888888', 1, 1);
INSERT INTO `order_` VALUES (21, '202003052212512977889', '姓名：郭金明,邮箱：6666@qq.com,配送地址：大连东软信息学院,手机号：13888888888', 1, 9);
COMMIT;

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '商品id',
  `oid` int(11) DEFAULT NULL COMMENT '订单id',
  `cstid` int(11) DEFAULT NULL COMMENT '买家id',
  `number` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `oid` (`oid`) USING BTREE,
  KEY `cstid` (`cstid`) USING BTREE,
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`oid`) REFERENCES `order_` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_3` FOREIGN KEY (`cstid`) REFERENCES `customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
BEGIN;
INSERT INTO `orderitem` VALUES (1, 4, 20, 1, 5);
INSERT INTO `orderitem` VALUES (5, 3, NULL, NULL, 1);
INSERT INTO `orderitem` VALUES (8, 2, NULL, NULL, 1);
INSERT INTO `orderitem` VALUES (18, 8, NULL, 1, 1);
INSERT INTO `orderitem` VALUES (34, 10, NULL, 1, 11);
INSERT INTO `orderitem` VALUES (46, 2, NULL, 1, 4);
INSERT INTO `orderitem` VALUES (47, 1, 21, 9, 2);
INSERT INTO `orderitem` VALUES (48, 3, NULL, 9, 1);
INSERT INTO `orderitem` VALUES (49, 26, NULL, 9, 1);
COMMIT;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `desc_` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------
BEGIN;
INSERT INTO `permission` VALUES (1, '删除分类', '删除分类', '/category/delCategory');
INSERT INTO `permission` VALUES (2, '分类列表', '查看分类列表', '/category/list');
INSERT INTO `permission` VALUES (15, '修改分类页面', '修改分类页面', '/category/editCategory');
INSERT INTO `permission` VALUES (17, '添加商品分类', '添加商品分类', '/category/addCategory');
INSERT INTO `permission` VALUES (18, '查看管理员列表', '查看管理员列表', '/config/listUser');
INSERT INTO `permission` VALUES (20, '查看角色列表', '可增删改查', '/config/listRole');
INSERT INTO `permission` VALUES (21, '查看权限列表', '无', '/config/listPermission');
INSERT INTO `permission` VALUES (23, '修改管理员信息界面', '修改界面', '/config/editUser');
INSERT INTO `permission` VALUES (24, '更新管理员信息', '无', '/config/updateUser');
INSERT INTO `permission` VALUES (25, '管理员删除', '删除', '/config/deleteUser');
INSERT INTO `permission` VALUES (26, '添加管理员界面', '无', '/config/adminAdd');
INSERT INTO `permission` VALUES (27, '添加管理员', '无', '/config/addUser');
INSERT INTO `permission` VALUES (28, '商品列表', '查看商品列表', '/product/list');
INSERT INTO `permission` VALUES (29, '添加商品', '添加上线商品', '/product/addProduct');
INSERT INTO `permission` VALUES (30, '删除商品', '暂无', '/product/deleteProduct');
INSERT INTO `permission` VALUES (31, '修改商品界面', '暂无', '/product/editProduct');
INSERT INTO `permission` VALUES (32, '更新商品', '暂无', '/product/updateProduct');
INSERT INTO `permission` VALUES (33, '添加商品界面', '暂无', '/product/productAddUI');
INSERT INTO `permission` VALUES (34, '商品上线', '暂无', '/product/enableStatus');
INSERT INTO `permission` VALUES (35, '商品下线', '暂无', '/product/stopStatus');
INSERT INTO `permission` VALUES (36, '订单发货', '暂无', '/order/orderDelivery');
INSERT INTO `permission` VALUES (37, '查看订单项', '暂无', '/order/seeOrderItem');
INSERT INTO `permission` VALUES (38, '评论列表', '暂无', '/review/list');
INSERT INTO `permission` VALUES (39, '删除评论', '暂无', '/review/del');
INSERT INTO `permission` VALUES (40, '查看订单列表', '暂无', '/order/list');
INSERT INTO `permission` VALUES (41, '添加权限UI', '暂无', '/config/adminPerAddUI');
INSERT INTO `permission` VALUES (42, '添加权限', '暂无', '/config/addPermission');
INSERT INTO `permission` VALUES (43, '删除权限', '暂无', '/config/deletePermission');
INSERT INTO `permission` VALUES (44, '修改权限ui', '暂无', '/config/editPermission');
INSERT INTO `permission` VALUES (45, '更新权限', '暂无', '/config/updatePermission');
INSERT INTO `permission` VALUES (46, '查看用户列表', '暂无', '/customer/list');
INSERT INTO `permission` VALUES (47, '删除角色', '暂无', '/config/deleteRole');
INSERT INTO `permission` VALUES (48, '添加管理员UI', '暂无', '/config/adminAdd');
INSERT INTO `permission` VALUES (49, '添加管理员', '暂未', '/config/addUser');
INSERT INTO `permission` VALUES (50, '修改角色UI', '暂无', '/config/editRole');
INSERT INTO `permission` VALUES (51, '修改角色', '暂无', '/config/updateRole');
INSERT INTO `permission` VALUES (52, '添加角色UI', '暂无', '/config/addRoleUI');
INSERT INTO `permission` VALUES (53, '添加角色', '暂无', '/config/addRole');
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `price` float(10,2) DEFAULT NULL COMMENT '价格',
  `zan` int(100) DEFAULT NULL COMMENT '赞',
  `number` int(100) DEFAULT NULL COMMENT '销量',
  `status` int(10) DEFAULT '1' COMMENT '状态，1：上线，0：下线',
  `imageurl` varchar(100) DEFAULT NULL COMMENT '商品图片url',
  `miaoshu` varchar(200) DEFAULT '' COMMENT '商品描述',
  `cid` int(11) DEFAULT NULL COMMENT '分类id',
  `bid` bigint(11) DEFAULT NULL COMMENT '商家id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_ibfk_1` (`cid`) USING BTREE,
  KEY `product_ibfk_2` (`bid`) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES (1, '红豆粥', 16.00, 888, 999, 1, 'images/product/1.jpg', '真香', 1, 1);
INSERT INTO `product` VALUES (2, '玉米粥', 16.00, 888, 999, 1, 'images/product/2.jpg', '真香', 2, 1);
INSERT INTO `product` VALUES (3, '紫薯粥', 16.00, 888, 999, 1, 'images/product/3.jpg', '真香', 3, 1);
INSERT INTO `product` VALUES (4, '皮蛋粥', 16.00, 888, 999, 1, 'images/product/4.jpg', '真香', 4, 1);
INSERT INTO `product` VALUES (5, '素白粥', 16.00, 888, 999, 1, 'images/product/5.jpg', '真香', 5, 1);
INSERT INTO `product` VALUES (6, '绿豆粥', 16.00, 888, 999, 1, 'images/product/6.jpg', '真香', 6, 1);
INSERT INTO `product` VALUES (7, '牛肉饭', 16.00, 888, 999, 1, 'images/product/7.jpg', '真香', 1, 1);
INSERT INTO `product` VALUES (8, '烤鸭饭', 16.00, 888, 999, 1, 'images/product/8.jpg', '真香', 1, 1);
INSERT INTO `product` VALUES (9, '猪脚饭', 16.00, 888, 999, 1, 'images/product/9.jpg', '真香', 1, 1);
INSERT INTO `product` VALUES (10, '盖饭', 16.00, 888, 999, 1, 'images/product/10.jpg', '真香', 1, 1);
INSERT INTO `product` VALUES (11, '炒饭', 16.00, 888, 999, 1, 'images/product/11.jpg', '真香', 2, 1);
INSERT INTO `product` VALUES (12, '白饭', 16.00, 888, 999, 1, 'images/product/12.jpg', '真香', 2, 1);
INSERT INTO `product` VALUES (13, '拌饭', 16.00, 888, 999, 1, 'images/product/13.jpg', '真香', 2, 1);
INSERT INTO `product` VALUES (14, '香辣鸡腿堡', 16.00, 888, 999, 1, 'images/product/14.jpg', '真香', 3, 1);
INSERT INTO `product` VALUES (15, '麦香鸡腿堡', 16.00, 888, 999, 1, 'images/product/15.jpg', '真香', 3, 1);
INSERT INTO `product` VALUES (16, '奥尔良烤翅', 16.00, 888, 999, 1, 'images/product/16.jpg', '真香', 3, 1);
INSERT INTO `product` VALUES (17, '薯条', 16.00, 888, 999, 1, 'images/product/17.jpg', '真香', 3, 1);
INSERT INTO `product` VALUES (18, '汉堡套餐', 16.00, 888, 999, 1, 'images/product/18.jpg', '真香', 3, 1);
INSERT INTO `product` VALUES (19, '圣代', 16.00, 888, 999, 1, 'images/product/19.jpg', '真香', 3, 1);
INSERT INTO `product` VALUES (20, '麻辣烫', 16.00, 888, 999, 1, 'images/product/20.jpg', '真香', 4, 1);
INSERT INTO `product` VALUES (25, '麻辣香锅', 16.00, 888, 999, 1, 'images/product/25.jpg', '真香', 4, 1);
INSERT INTO `product` VALUES (26, '过桥米线', 16.00, 888, 999, 1, 'images/product/26.jpg', '真香', 4, 1);
INSERT INTO `product` VALUES (27, '米粉', 16.00, 888, 999, 1, 'images/product/27.jpg', '真香', 4, 1);
INSERT INTO `product` VALUES (28, '土豆粉', 16.00, 888, 999, 1, 'images/product/28.jpg', '真香', 4, 1);
INSERT INTO `product` VALUES (29, '酸辣粉', 16.00, 888, 999, 1, 'images/product/29.jpg', '真香', 4, 1);
INSERT INTO `product` VALUES (30, '炸鸡', 16.00, 888, 999, 1, 'images/product/30.jpg', '真香', 5, 1);
INSERT INTO `product` VALUES (31, '川菜', 16.00, 888, 999, 1, 'images/product/31.jpg', '真香', 6, 1);
COMMIT;

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT '该用户默认给出了好评！！！' COMMENT '评论内容',
  `cstid` int(11) DEFAULT NULL COMMENT '用户id',
  `pid` int(11) DEFAULT NULL COMMENT '商品id',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cstid` (`cstid`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`cstid`) REFERENCES `customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `desc_` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES (1, 'admin', '超级管理员');
INSERT INTO `role` VALUES (2, 'productManager', '商品管理员');
INSERT INTO `role` VALUES (3, '游客', '只能查看，不能增删改');
COMMIT;

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=399 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
BEGIN;
INSERT INTO `role_permission` VALUES (134, 3, 2);
INSERT INTO `role_permission` VALUES (135, 3, 18);
INSERT INTO `role_permission` VALUES (136, 3, 20);
INSERT INTO `role_permission` VALUES (137, 3, 21);
INSERT INTO `role_permission` VALUES (138, 3, 28);
INSERT INTO `role_permission` VALUES (139, 3, 37);
INSERT INTO `role_permission` VALUES (140, 3, 38);
INSERT INTO `role_permission` VALUES (141, 3, 40);
INSERT INTO `role_permission` VALUES (346, 1, 53);
INSERT INTO `role_permission` VALUES (347, 1, 52);
INSERT INTO `role_permission` VALUES (348, 1, 51);
INSERT INTO `role_permission` VALUES (349, 1, 50);
INSERT INTO `role_permission` VALUES (350, 1, 49);
INSERT INTO `role_permission` VALUES (351, 1, 48);
INSERT INTO `role_permission` VALUES (352, 1, 47);
INSERT INTO `role_permission` VALUES (353, 1, 46);
INSERT INTO `role_permission` VALUES (354, 1, 45);
INSERT INTO `role_permission` VALUES (355, 1, 44);
INSERT INTO `role_permission` VALUES (356, 1, 43);
INSERT INTO `role_permission` VALUES (357, 1, 42);
INSERT INTO `role_permission` VALUES (358, 1, 41);
INSERT INTO `role_permission` VALUES (359, 1, 40);
INSERT INTO `role_permission` VALUES (360, 1, 39);
INSERT INTO `role_permission` VALUES (361, 1, 38);
INSERT INTO `role_permission` VALUES (362, 1, 37);
INSERT INTO `role_permission` VALUES (363, 1, 36);
INSERT INTO `role_permission` VALUES (364, 1, 35);
INSERT INTO `role_permission` VALUES (365, 1, 34);
INSERT INTO `role_permission` VALUES (366, 1, 33);
INSERT INTO `role_permission` VALUES (367, 1, 32);
INSERT INTO `role_permission` VALUES (368, 1, 31);
INSERT INTO `role_permission` VALUES (369, 1, 30);
INSERT INTO `role_permission` VALUES (370, 1, 29);
INSERT INTO `role_permission` VALUES (371, 1, 28);
INSERT INTO `role_permission` VALUES (372, 1, 27);
INSERT INTO `role_permission` VALUES (373, 1, 26);
INSERT INTO `role_permission` VALUES (374, 1, 25);
INSERT INTO `role_permission` VALUES (375, 1, 24);
INSERT INTO `role_permission` VALUES (376, 1, 23);
INSERT INTO `role_permission` VALUES (377, 1, 21);
INSERT INTO `role_permission` VALUES (378, 1, 20);
INSERT INTO `role_permission` VALUES (379, 1, 18);
INSERT INTO `role_permission` VALUES (380, 1, 17);
INSERT INTO `role_permission` VALUES (381, 1, 15);
INSERT INTO `role_permission` VALUES (382, 1, 2);
INSERT INTO `role_permission` VALUES (383, 1, 1);
INSERT INTO `role_permission` VALUES (384, 2, 40);
INSERT INTO `role_permission` VALUES (385, 2, 38);
INSERT INTO `role_permission` VALUES (386, 2, 37);
INSERT INTO `role_permission` VALUES (387, 2, 36);
INSERT INTO `role_permission` VALUES (388, 2, 35);
INSERT INTO `role_permission` VALUES (389, 2, 34);
INSERT INTO `role_permission` VALUES (390, 2, 33);
INSERT INTO `role_permission` VALUES (391, 2, 32);
INSERT INTO `role_permission` VALUES (392, 2, 31);
INSERT INTO `role_permission` VALUES (393, 2, 30);
INSERT INTO `role_permission` VALUES (394, 2, 29);
INSERT INTO `role_permission` VALUES (395, 2, 28);
INSERT INTO `role_permission` VALUES (396, 2, 17);
INSERT INTO `role_permission` VALUES (397, 2, 15);
INSERT INTO `role_permission` VALUES (398, 2, 2);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '管理员姓名',
  `password` varchar(100) DEFAULT NULL COMMENT '管理员密码',
  `salt` varchar(100) DEFAULT NULL,
  `status` int(10) DEFAULT NULL COMMENT '状态，1：启用，0：停用',
  `address` varchar(100) DEFAULT '暂无' COMMENT '商家管理员地址',
  `phone` varchar(50) DEFAULT NULL,
  `lasttime` datetime DEFAULT NULL COMMENT '最后登陆时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, '管理员', 'bd4b9f244abc416c9eb798c5eccdf911', 'YI7h6q+GgynkQyK2pZiPcQ==', 1, '大连', '18888886666', '2020-03-06 15:26:48');
COMMIT;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `rid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
BEGIN;
INSERT INTO `user_role` VALUES (88, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for zixun
-- ----------------------------
DROP TABLE IF EXISTS `zixun`;
CREATE TABLE `zixun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) DEFAULT NULL COMMENT '资讯内容',
  `cstid` int(11) DEFAULT NULL COMMENT '客户id',
  `status` int(255) DEFAULT '0' COMMENT '审核状态，1：通过，0：未通过;',
  `fabudate` datetime DEFAULT NULL COMMENT '发布时间;',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of zixun
-- ----------------------------
BEGIN;
INSERT INTO `zixun` VALUES (7, '真香', 1, 1, '2020-03-05 21:52:01');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
