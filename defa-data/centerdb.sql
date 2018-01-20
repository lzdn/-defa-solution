/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : centerdb

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2018-01-20 22:50:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `customer_name` varchar(255) NOT NULL COMMENT '客户姓名',
  `customer_pwd` varchar(255) NOT NULL COMMENT '客户密码',
  `customer_phone` varchar(255) DEFAULT NULL COMMENT '客户联系电话',
  `customer_email` varchar(255) DEFAULT NULL COMMENT '客户电子邮件',
  `customer_address` varchar(255) DEFAULT NULL COMMENT '客户联系地址',
  `customer_zip_code` varchar(255) DEFAULT NULL COMMENT '客户邮编',
  `customer_webchat` varchar(255) DEFAULT NULL COMMENT '客户微信',
  `customer_qq` varchar(255) DEFAULT NULL COMMENT '客户qq',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 0 无效 ',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户表';

-- ----------------------------
-- Records of t_customer
-- ----------------------------

-- ----------------------------
-- Table structure for t_inquiry
-- ----------------------------
DROP TABLE IF EXISTS `t_inquiry`;
CREATE TABLE `t_inquiry` (
  `inquiry_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `amount` int(11) NOT NULL COMMENT '产品数量',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 0 无效 ',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`inquiry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='询价表';

-- ----------------------------
-- Records of t_inquiry
-- ----------------------------

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `product_kind_id` int(11) NOT NULL COMMENT '产品类别ID',
  `product_brand_id` int(11) NOT NULL COMMENT '产品品牌',
  `product_name` varchar(255) NOT NULL COMMENT '产品名称',
  `channel_id` int(11) NOT NULL COMMENT '渠道',
  `image_url` varchar(255) NOT NULL COMMENT '产品图片地址',
  `price` decimal(12,2) NOT NULL COMMENT '产品价格',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `description` varchar(255) DEFAULT NULL COMMENT '产品描述',
  `score` int(11) DEFAULT '999' COMMENT '推送打分，分值大的排在前面',
  `push_type` int(2) DEFAULT NULL COMMENT '推送类型',
  `is_putaway` int(2) NOT NULL DEFAULT '1' COMMENT '上下架',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 0 无效 ',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='产品表';

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('3', '1', '1', '大地', '1', 'http://webresource.defa1688.com/ba2deff708c181db953ac9c93e2d3694.jpeg', '2000.00', '200', '多少', '999', '1', '1', '1', '2018-01-08 23:16:51', '2018-01-08 23:16:52');
INSERT INTO `t_product` VALUES ('4', '1', '1', '大地', '1', 'http://webresource.defa1688.com/ba2deff708c181db953ac9c93e2d3694.jpeg', '2000.00', '200', '多少', '999', '1', '1', '1', '2018-01-08 23:17:14', '2018-01-08 23:17:14');
INSERT INTO `t_product` VALUES ('5', '1', '1', '大地', '1', 'http://webresource.defa1688.com/a82a7df4163ac16982c1c395d6b54371.jpeg', '2000.00', '200', '多少', '999', '1', '1', '1', '2018-01-08 23:18:13', '2018-01-08 23:18:13');
INSERT INTO `t_product` VALUES ('6', '1', '1', '大地', '1', 'http://webresource.defa1688.com/a82a7df4163ac16982c1c395d6b54371.jpeg', '2000.00', '200', '多少', '999', '1', '1', '1', '2018-01-08 23:18:25', '2018-01-08 23:18:25');
INSERT INTO `t_product` VALUES ('7', '1', '1', '测试', '1', 'http://webresource.defa1688.com/7ee92da44ba75b155ede653a8926f193.jpeg', '2000.00', '12', '12', '999', '1', '1', '1', '2018-01-08 23:31:25', '2018-01-08 23:31:25');
INSERT INTO `t_product` VALUES ('8', '1', '1', '产品1', '1', 'http://webresource.defa1688.com/6535327b581b5cfe03fd0e52a6f97309.jpeg', '122.00', '1', '阿萨德发', '99', '2', '1', '1', '2018-01-20 21:32:08', '2018-01-20 21:32:08');
INSERT INTO `t_product` VALUES ('9', '1', '1', '好吃饭', '1', 'http://webresource.defa1688.com/88f448ec238f3dbb37060f2ea755c064.jpeg', '600.00', '1', '阿萨德发', '999', '2', '1', '1', '2018-01-20 21:37:08', '2018-01-20 21:37:08');
INSERT INTO `t_product` VALUES ('10', '1', '1', '的股份锁定股份数', '1', 'http://webresource.defa1688.com/9e21a9e3f1f3c6bf943b2022536fe9a5.jpeg', '123.00', '1', '1212', '22', '2', '1', '1', '2018-01-20 21:37:58', '2018-01-20 21:37:58');
INSERT INTO `t_product` VALUES ('11', '1', '1', '经典1', '1', 'http://webresource.defa1688.com/f18984fc0a8f066e86f3560393e5f924.jpeg', '123.00', '1', '算多少', '66', '3', '1', '1', '2018-01-20 21:44:31', '2018-01-20 21:44:31');
INSERT INTO `t_product` VALUES ('12', '1', '1', '经典2', '1', 'http://webresource.defa1688.com/4cb4b0d34f1866be67fc4de9b5bedc50.jpeg', '12.00', '1', '斯蒂芬', '66', '3', '1', '1', '2018-01-20 21:45:12', '2018-01-20 21:45:12');
INSERT INTO `t_product` VALUES ('13', '1', '1', '热门1', '1', 'http://webresource.defa1688.com/dfff9ee50e52a040297473935e0f9386.jpeg', '2222.00', '1', '阿道夫', '22', '4', '1', '1', '2018-01-20 22:17:49', '2018-01-20 22:17:49');
INSERT INTO `t_product` VALUES ('14', '1', '1', '热门2', '1', 'http://webresource.defa1688.com/52aa0f7ffc7d4294a4b015c51d4d7d3c.jpeg', '333.00', '1', '热门2热门2热门2', '666', '4', '1', '1', '2018-01-20 22:18:48', '2018-01-20 22:18:48');

-- ----------------------------
-- Table structure for t_product_brand
-- ----------------------------
DROP TABLE IF EXISTS `t_product_brand`;
CREATE TABLE `t_product_brand` (
  `product_brand_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `product_brand_name` varchar(255) NOT NULL COMMENT '品牌名称',
  PRIMARY KEY (`product_brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='产品品牌表';

-- ----------------------------
-- Records of t_product_brand
-- ----------------------------
INSERT INTO `t_product_brand` VALUES ('1', '德发湘菜');

-- ----------------------------
-- Table structure for t_product_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_product_detail`;
CREATE TABLE `t_product_detail` (
  `product_detail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '产品产地',
  `produce_date` datetime DEFAULT NULL COMMENT '生产日期',
  `product_period` int(1) DEFAULT NULL COMMENT '产品保质期',
  `selling_mode` int(1) DEFAULT NULL COMMENT '售卖方式',
  `storage_mode` int(1) DEFAULT NULL COMMENT '存储方式',
  `raw_material` varchar(255) DEFAULT NULL COMMENT '原料配料',
  `enter_port` int(1) DEFAULT NULL COMMENT '是否进口',
  `is_specialty` int(1) DEFAULT NULL COMMENT '是否特产',
  `licence_no` varchar(255) DEFAULT NULL COMMENT '许可证编号',
  `hygiene_no` varchar(255) DEFAULT NULL COMMENT '卫生许可证编号',
  `criterion_no` varchar(255) DEFAULT NULL COMMENT '产品标准编号',
  `bar_code` varchar(255) DEFAULT NULL COMMENT '产品条形码',
  `unit_weight` double(8,2) DEFAULT NULL COMMENT '单位重量',
  `unit_net_weight` double(8,2) DEFAULT NULL COMMENT '单位净重量',
  `unit_code` int(2) DEFAULT NULL COMMENT '单位 （斤 件 包 ）',
  `unit_num` int(8) DEFAULT NULL COMMENT '单位数量',
  `total_weight` double(8,2) DEFAULT NULL COMMENT '总重量',
  `total_net_weight` double(8,2) DEFAULT NULL COMMENT '总净重量',
  `total_num` int(8) DEFAULT NULL COMMENT '总数量',
  PRIMARY KEY (`product_detail_id`,`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='产品详情表';

-- ----------------------------
-- Records of t_product_detail
-- ----------------------------
INSERT INTO `t_product_detail` VALUES ('3', '3', '湖南', '2018-01-08 00:00:00', '6', '19', null, null, null, null, null, null, null, null, '12.00', '12.00', '22', '12', null, null, null);
INSERT INTO `t_product_detail` VALUES ('4', '4', '湖南', '2018-01-08 00:00:00', '6', '19', null, null, null, null, null, null, null, null, '12.00', '12.00', '22', '12', null, null, null);
INSERT INTO `t_product_detail` VALUES ('5', '5', '湖南', '2018-01-08 00:00:00', '6', '19', null, null, null, null, null, null, null, null, '12.00', '12.00', '22', '12', null, null, null);
INSERT INTO `t_product_detail` VALUES ('6', '6', '湖南', '2018-01-08 00:00:00', '6', '19', null, null, null, null, null, null, null, null, '12.00', '12.00', '22', '12', null, null, null);
INSERT INTO `t_product_detail` VALUES ('7', '7', '', '2018-01-03 00:00:00', '6', '19', null, null, null, null, null, null, null, null, '12.00', '12.00', '22', '12', null, null, null);
INSERT INTO `t_product_detail` VALUES ('8', '8', '湖南', '2018-01-20 21:31:25', '6', '19', null, null, null, null, null, null, null, null, '1.00', '1.00', '22', '1', null, null, null);
INSERT INTO `t_product_detail` VALUES ('9', '9', '', '2018-01-20 21:37:05', '6', '19', null, null, null, null, null, null, null, null, '1.00', '1.00', '22', '1', null, null, null);
INSERT INTO `t_product_detail` VALUES ('10', '10', '', '2018-01-20 21:37:27', '6', '19', null, null, null, null, null, null, null, null, '1.00', '2.00', '22', '1', null, null, null);
INSERT INTO `t_product_detail` VALUES ('11', '11', '湖南', '2018-01-20 00:00:00', '6', '19', null, null, null, null, null, null, null, null, '1.00', '1.00', '22', '1', null, null, null);
INSERT INTO `t_product_detail` VALUES ('12', '12', '', '2018-01-20 21:44:47', '6', '19', null, null, null, null, null, null, null, null, '1.00', '1.00', '22', '1', null, null, null);
INSERT INTO `t_product_detail` VALUES ('13', '13', '', '2018-01-20 22:17:46', '6', '19', null, null, null, null, null, null, null, null, '1.00', '1.00', '22', '1', null, null, null);
INSERT INTO `t_product_detail` VALUES ('14', '14', '热门2', '2018-01-20 22:18:16', '6', '19', null, null, null, null, null, null, null, null, '1.00', '1.00', '22', '1', null, null, null);

-- ----------------------------
-- Table structure for t_product_img
-- ----------------------------
DROP TABLE IF EXISTS `t_product_img`;
CREATE TABLE `t_product_img` (
  `product_img_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `image_name` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL COMMENT '产品图片地址',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 0 无效 ',
  `order_by` int(11) NOT NULL DEFAULT '999' COMMENT '排序',
  PRIMARY KEY (`product_img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='产品图片表';

-- ----------------------------
-- Records of t_product_img
-- ----------------------------
INSERT INTO `t_product_img` VALUES ('31', '7', '无', 'http://webresource.defa1688.com/78683ba9b34ca0cf680c429fa563e9d4.jpeg', '1', '1');
INSERT INTO `t_product_img` VALUES ('32', '7', '任务', 'http://webresource.defa1688.com/992dbd550b8141769f3e21410a5d37b9.jpeg', '1', '2');
INSERT INTO `t_product_img` VALUES ('33', '7', '无', 'http://webresource.defa1688.com/7ee92da44ba75b155ede653a8926f193.jpeg', '1', '3');
INSERT INTO `t_product_img` VALUES ('34', '6', '第一张', 'http://webresource.defa1688.com/a82a7df4163ac16982c1c395d6b54371.jpeg', '1', '1');
INSERT INTO `t_product_img` VALUES ('35', '6', '第二张', 'http://webresource.defa1688.com/ba2deff708c181db953ac9c93e2d3694.jpeg', '1', '2');
INSERT INTO `t_product_img` VALUES ('36', '5', '第一张', 'http://webresource.defa1688.com/a82a7df4163ac16982c1c395d6b54371.jpeg', '1', '1');
INSERT INTO `t_product_img` VALUES ('37', '5', '第二张', 'http://webresource.defa1688.com/ba2deff708c181db953ac9c93e2d3694.jpeg', '1', '2');
INSERT INTO `t_product_img` VALUES ('40', '4', '第一张', 'http://webresource.defa1688.com/a82a7df4163ac16982c1c395d6b54371.jpeg', '1', '1');
INSERT INTO `t_product_img` VALUES ('41', '4', '第二张', 'http://webresource.defa1688.com/ba2deff708c181db953ac9c93e2d3694.jpeg', '1', '2');
INSERT INTO `t_product_img` VALUES ('42', '3', '第一张', 'http://webresource.defa1688.com/a82a7df4163ac16982c1c395d6b54371.jpeg', '1', '1');
INSERT INTO `t_product_img` VALUES ('43', '3', '第二张', 'http://webresource.defa1688.com/ba2deff708c181db953ac9c93e2d3694.jpeg', '1', '2');
INSERT INTO `t_product_img` VALUES ('44', '8', '产品1', 'http://webresource.defa1688.com/6535327b581b5cfe03fd0e52a6f97309.jpeg', '1', '1');
INSERT INTO `t_product_img` VALUES ('45', '9', '窝窝头', 'http://webresource.defa1688.com/88f448ec238f3dbb37060f2ea755c064.jpeg', '1', '1');
INSERT INTO `t_product_img` VALUES ('46', '10', '王五', 'http://webresource.defa1688.com/9e21a9e3f1f3c6bf943b2022536fe9a5.jpeg', '1', '1');
INSERT INTO `t_product_img` VALUES ('48', '11', '经典1', 'http://webresource.defa1688.com/f18984fc0a8f066e86f3560393e5f924.jpeg', '1', '1');
INSERT INTO `t_product_img` VALUES ('49', '12', '经典2', 'http://webresource.defa1688.com/4cb4b0d34f1866be67fc4de9b5bedc50.jpeg', '1', '1');
INSERT INTO `t_product_img` VALUES ('50', '13', '热门1', 'http://webresource.defa1688.com/dfff9ee50e52a040297473935e0f9386.jpeg', '1', '1');
INSERT INTO `t_product_img` VALUES ('51', '14', '热门2', 'http://webresource.defa1688.com/52aa0f7ffc7d4294a4b015c51d4d7d3c.jpeg', '1', '1');

-- ----------------------------
-- Table structure for t_product_kind
-- ----------------------------
DROP TABLE IF EXISTS `t_product_kind`;
CREATE TABLE `t_product_kind` (
  `product_kind_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `product_kind_name` varchar(255) NOT NULL COMMENT '种类名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 0 无效 ',
  PRIMARY KEY (`product_kind_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='产品类别';

-- ----------------------------
-- Records of t_product_kind
-- ----------------------------
INSERT INTO `t_product_kind` VALUES ('1', '干货系列', '干货系列', '1');
INSERT INTO `t_product_kind` VALUES ('2', '德发特色', '德发特色', '1');
INSERT INTO `t_product_kind` VALUES ('3', '酒店食材', '酒店食材', '1');
INSERT INTO `t_product_kind` VALUES ('4', '新菜系列', '新菜系列', '1');
INSERT INTO `t_product_kind` VALUES ('5', '腊制品类', '腊制品类', '1');
INSERT INTO `t_product_kind` VALUES ('6', '豆制品类', '豆制品类', '1');
INSERT INTO `t_product_kind` VALUES ('7', '坛子菜类', '坛子菜类', '1');
INSERT INTO `t_product_kind` VALUES ('8', '冻货品类', '冻货品类', '1');
INSERT INTO `t_product_kind` VALUES ('9', '水产品类', '水产品类', '1');

-- ----------------------------
-- Table structure for t_product_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_product_tag`;
CREATE TABLE `t_product_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `tag_name` varchar(255) NOT NULL COMMENT '标签名称',
  `tag_value` varchar(255) DEFAULT NULL COMMENT '产品名称',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 0 无效 ',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品标签';

-- ----------------------------
-- Records of t_product_tag
-- ----------------------------
