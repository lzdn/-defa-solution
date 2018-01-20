/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : coredb

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2018-01-20 22:50:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键dept_id',
  `parent_dept_id` int(11) DEFAULT NULL COMMENT '父部门parent_dept_id',
  `dept_simple_name` varchar(45) NOT NULL COMMENT '简称',
  `dept_full_name` varchar(255) DEFAULT NULL COMMENT '全称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES ('1', '1', '总经理办公室', '总经理办公室', '');
INSERT INTO `t_dept` VALUES ('2', '1', '采购部', '采购部', '');
INSERT INTO `t_dept` VALUES ('3', '1', '产品部', '产品部', '');

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `dict_code` varchar(255) NOT NULL COMMENT '代码',
  `dict_name` varchar(255) NOT NULL COMMENT '名称',
  `dict_value` varchar(255) NOT NULL COMMENT '值',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 0 无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES ('1', 'channel_code', '来源渠道/发布渠道', '1', '网站', '1');
INSERT INTO `t_dict` VALUES ('2', 'channel_code', '来源渠道/发布渠道', '2', 'App移动端', '1');
INSERT INTO `t_dict` VALUES ('3', 'push_type', '推送类型', '1', '新菜推送', '1');
INSERT INTO `t_dict` VALUES ('4', 'push_type', '推送类型', '2', '店长推荐', '1');
INSERT INTO `t_dict` VALUES ('5', 'push_type', '推送类型', '3', '经典', '1');
INSERT INTO `t_dict` VALUES ('6', 'period_type', '保质期', '1', '当天', '1');
INSERT INTO `t_dict` VALUES ('7', 'period_type', '保质期', '2', '两天内', '1');
INSERT INTO `t_dict` VALUES ('8', 'period_type', '保质期', '3', '三天内', '1');
INSERT INTO `t_dict` VALUES ('9', 'period_type', '保质期', '4', '七天内', '1');
INSERT INTO `t_dict` VALUES ('10', 'period_type', '保质期', '5', '一个月内', '1');
INSERT INTO `t_dict` VALUES ('11', 'period_type', '保质期', '6', '三个月内', '1');
INSERT INTO `t_dict` VALUES ('12', 'period_type', '保质期', '7', '五个月内', '1');
INSERT INTO `t_dict` VALUES ('13', 'period_type', '保质期', '8', '六个月内', '1');
INSERT INTO `t_dict` VALUES ('14', 'period_type', '保质期', '9', '八个月内', '1');
INSERT INTO `t_dict` VALUES ('15', 'period_type', '保质期', '10', '一年内', '1');
INSERT INTO `t_dict` VALUES ('16', 'period_type', '保质期', '11', '一年以上', '1');
INSERT INTO `t_dict` VALUES ('17', 'period_type', '保质期', '12', '两年', '1');
INSERT INTO `t_dict` VALUES ('18', 'period_type', '保质期', '13', '两年以上', '1');
INSERT INTO `t_dict` VALUES ('19', 'selling_mode', '销售模式', '1', '零售', '1');
INSERT INTO `t_dict` VALUES ('20', 'selling_mode', '销售模式', '2', '批发', '1');
INSERT INTO `t_dict` VALUES ('21', 'selling_mode', '销售模式', '3', '混批', '1');
INSERT INTO `t_dict` VALUES ('22', 'unit_code', '单位类型', '1', '斤', '1');
INSERT INTO `t_dict` VALUES ('23', 'unit_code', '单位类型', '2', '包（袋）', '1');
INSERT INTO `t_dict` VALUES ('24', 'unit_code', '单位类型', '3', '瓶', '1');
INSERT INTO `t_dict` VALUES ('25', 'unit_code', '单位类型', '4', '件', '1');
INSERT INTO `t_dict` VALUES ('26', 'push_type', '推荐类型', '4', '热门推荐', '1');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `group_id` int(11) NOT NULL COMMENT '菜单组id',
  `menu_name` varchar(255) NOT NULL COMMENT '菜单名称',
  `menu_code` varchar(255) DEFAULT NULL COMMENT '菜单代码',
  `url` varchar(255) NOT NULL COMMENT 'url地址',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '级别',
  `description` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 0 无效',
  `order_by` int(11) NOT NULL DEFAULT '999' COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', '2', '部门管理', 'dept_manage', '/dept/main', '0', '', '1', '1');
INSERT INTO `t_menu` VALUES ('2', '2', '权限管理', '', '/right/main', '0', '', '1', '2');
INSERT INTO `t_menu` VALUES ('3', '2', '菜单组管理', '', '/group/main', '0', '', '1', '4');
INSERT INTO `t_menu` VALUES ('4', '2', '菜单管理', '', '/menu/main', '0', '', '1', '5');
INSERT INTO `t_menu` VALUES ('5', '3', '产品列表', 'product_manage', '/product/main', '0', '', '1', '1');
INSERT INTO `t_menu` VALUES ('6', '2', '角色管理', 'role_manage', '/role/main', '0', '', '1', '3');
INSERT INTO `t_menu` VALUES ('7', '2', '用户管理', 'user_manage', '/user/main', '0', '', '1', '6');
INSERT INTO `t_menu` VALUES ('8', '3', '产品类别', '', '/kind/main', '0', '', '1', '2');
INSERT INTO `t_menu` VALUES ('9', '3', '产品品牌', '', '/brand/main', '0', '', '1', '3');
INSERT INTO `t_menu` VALUES ('10', '2', '系统字典', '', '/dict/main', '0', '', '1', '7');

-- ----------------------------
-- Table structure for t_menu_group
-- ----------------------------
DROP TABLE IF EXISTS `t_menu_group`;
CREATE TABLE `t_menu_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键group_id',
  `icon` varchar(255) NOT NULL COMMENT '图标',
  `group_name` varchar(255) NOT NULL COMMENT '组名称',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `order_by` int(11) NOT NULL DEFAULT '999' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 0 无效',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='菜单组表';

-- ----------------------------
-- Records of t_menu_group
-- ----------------------------
INSERT INTO `t_menu_group` VALUES ('1', 'fa fa-user', '个人中心', '个人中心', '1', '1');
INSERT INTO `t_menu_group` VALUES ('2', 'fa fa-power-off', '系统设置', '系统设置', '2', '1');
INSERT INTO `t_menu_group` VALUES ('3', 'fa fa-bookmark', '产品维护', '产品维护', '3', '1');

-- ----------------------------
-- Table structure for t_right
-- ----------------------------
DROP TABLE IF EXISTS `t_right`;
CREATE TABLE `t_right` (
  `right_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键right_id',
  `right_url` varchar(255) NOT NULL COMMENT '权限url',
  `upper_right_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级权限',
  `right_name` varchar(255) NOT NULL COMMENT '权限名称',
  `menu_id` int(11) DEFAULT NULL COMMENT '菜单Id',
  `description` varchar(255) DEFAULT NULL COMMENT '权限描述',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 0 无效',
  PRIMARY KEY (`right_id`),
  UNIQUE KEY `t_right_right_url` (`right_url`),
  KEY `t_right_menu_index` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of t_right
-- ----------------------------
INSERT INTO `t_right` VALUES ('1', '/dept/main', '0', '部门管理', '1', '', '1');
INSERT INTO `t_right` VALUES ('2', '/right/main', '0', '权限管理', '2', '', '1');
INSERT INTO `t_right` VALUES ('3', '/group/main', '0', '菜单组管理', '3', '', '1');
INSERT INTO `t_right` VALUES ('4', '/menu/main', '0', '菜单管理', '4', '', '1');
INSERT INTO `t_right` VALUES ('5', '/product/main', '0', '产品列表', '5', '', '1');
INSERT INTO `t_right` VALUES ('6', '/role/main', '0', '角色管理', '6', '', '1');
INSERT INTO `t_right` VALUES ('7', '/dept/add', '1', '新增部门', null, '', '1');
INSERT INTO `t_right` VALUES ('8', '/dept/find', '1', '部门查询', null, '', '1');
INSERT INTO `t_right` VALUES ('9', '/dept/edit', '1', '修改部门', null, '', '1');
INSERT INTO `t_right` VALUES ('10', '/right/add', '2', '新增权限', null, '', '1');
INSERT INTO `t_right` VALUES ('11', '/right/edit', '2', '修改权限', null, '', '1');
INSERT INTO `t_right` VALUES ('12', '/right/find', '2', '权限列表', null, '', '1');
INSERT INTO `t_right` VALUES ('13', '/group/find', '3', '菜单组列表', null, '', '1');
INSERT INTO `t_right` VALUES ('14', '/group/add', '3', '新增菜单组', null, '', '1');
INSERT INTO `t_right` VALUES ('15', '/group/edit', '3', '菜单组修改', null, '', '1');
INSERT INTO `t_right` VALUES ('16', '/menu/add', '4', '新增菜单', null, '', '1');
INSERT INTO `t_right` VALUES ('17', '/menu/find', '4', '菜单列表', null, '', '1');
INSERT INTO `t_right` VALUES ('18', '/menu/edit', '4', '菜单修改', null, '', '1');
INSERT INTO `t_right` VALUES ('19', '/role/auth', '6', '角色授权', null, '', '1');
INSERT INTO `t_right` VALUES ('20', '/group', '3', '菜单组查询', null, '', '1');
INSERT INTO `t_right` VALUES ('21', '/menu', '4', '菜单查询', null, '', '1');
INSERT INTO `t_right` VALUES ('22', '/right/save', '2', '权限保存', null, '', '1');
INSERT INTO `t_right` VALUES ('23', '/role', '6', '角色查询', null, '', '1');
INSERT INTO `t_right` VALUES ('24', '/role/find', '6', '角色列表', null, '', '1');
INSERT INTO `t_right` VALUES ('25', '/dept', '1', '部门查询', null, '', '1');
INSERT INTO `t_right` VALUES ('26', '/dept/save', '1', '部门保存', null, '', '1');
INSERT INTO `t_right` VALUES ('27', '/role/saveauth', '2', '授权保存', null, '', '1');
INSERT INTO `t_right` VALUES ('28', '/user/main', '0', '用户管理', '7', '', '1');
INSERT INTO `t_right` VALUES ('29', '/user/find', '28', '用户列表', null, '', '1');
INSERT INTO `t_right` VALUES ('30', '/user', '28', '用户查询', null, '', '1');
INSERT INTO `t_right` VALUES ('31', '/user/edit', '29', '用户修改', null, '', '1');
INSERT INTO `t_right` VALUES ('32', '/user/save', '29', '用户保存', null, '', '1');
INSERT INTO `t_right` VALUES ('33', '/right', '2', '权限查询', null, '', '1');
INSERT INTO `t_right` VALUES ('34', '/menu/save', '21', '菜单保存', null, '', '1');
INSERT INTO `t_right` VALUES ('35', '/kind/main', '0', '产品类别', '8', '', '1');
INSERT INTO `t_right` VALUES ('36', '/brand/main', '0', '产品品牌', '9', '', '1');
INSERT INTO `t_right` VALUES ('37', '/kind', '35', '产品类别查询', null, '', '1');
INSERT INTO `t_right` VALUES ('38', '/kind/find', '35', '产品类别列表查询', null, '', '1');
INSERT INTO `t_right` VALUES ('39', '/kind/add', '35', '新增产品类别', null, '', '1');
INSERT INTO `t_right` VALUES ('40', '/kind/save', '35', '保存产品类别', null, '', '1');
INSERT INTO `t_right` VALUES ('41', '/kind/edit', '35', '编辑产品类别', null, '', '1');
INSERT INTO `t_right` VALUES ('42', '/brand', '36', '产品品牌查询', null, '', '1');
INSERT INTO `t_right` VALUES ('43', '/brand/find', '36', '产品品牌列表查询', null, '', '1');
INSERT INTO `t_right` VALUES ('44', '/brand/add', '36', '新增产品品牌', null, '', '1');
INSERT INTO `t_right` VALUES ('45', '/brand/save', '36', '保存产品品牌', null, '', '1');
INSERT INTO `t_right` VALUES ('46', '/brand/edit', '36', '编辑产品品牌', null, '', '1');
INSERT INTO `t_right` VALUES ('47', '/dict/main', '0', '系统字典', '10', '', '1');
INSERT INTO `t_right` VALUES ('48', '/dict', '47', '字典查询', null, '', '1');
INSERT INTO `t_right` VALUES ('49', '/dict/find', '47', '字典列表查询', null, '', '1');
INSERT INTO `t_right` VALUES ('50', '/dict/add', '47', '新增字典', null, '', '1');
INSERT INTO `t_right` VALUES ('51', '/dict/edit', '47', '编辑字典', null, '', '1');
INSERT INTO `t_right` VALUES ('52', '/dict/save', '47', '保存字典', null, '', '1');
INSERT INTO `t_right` VALUES ('53', '/product', '5', '产品查询', null, '', '1');
INSERT INTO `t_right` VALUES ('54', '/product/add', '5', '新增产品', null, '', '1');
INSERT INTO `t_right` VALUES ('55', '/product/edit', '5', '编辑产品', null, '', '1');
INSERT INTO `t_right` VALUES ('56', '/product/find', '5', '产品列表查询', null, '', '1');
INSERT INTO `t_right` VALUES ('57', '/product/save', '5', '产品保存', null, '', '1');
INSERT INTO `t_right` VALUES ('58', '/upload/uploadimage', '0', '图片上传', null, '', '1');
INSERT INTO `t_right` VALUES ('59', '/product/delete', '5', '产品删除', null, '', '1');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键role_id',
  `role_name` varchar(255) NOT NULL COMMENT '角色名称',
  `description` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 0 无效',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '超级管理员', '', '1');
INSERT INTO `t_role` VALUES ('2', '管理员', '', '1');
INSERT INTO `t_role` VALUES ('3', '普通会员', '', '1');
INSERT INTO `t_role` VALUES ('4', '游客', '', '1');

-- ----------------------------
-- Table structure for t_role_right_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_role_right_relation`;
CREATE TABLE `t_role_right_relation` (
  `role_id` int(11) NOT NULL COMMENT '角色',
  `right_id` int(11) NOT NULL COMMENT '权限',
  PRIMARY KEY (`role_id`,`right_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- ----------------------------
-- Records of t_role_right_relation
-- ----------------------------
INSERT INTO `t_role_right_relation` VALUES ('1', '1');
INSERT INTO `t_role_right_relation` VALUES ('1', '2');
INSERT INTO `t_role_right_relation` VALUES ('1', '3');
INSERT INTO `t_role_right_relation` VALUES ('1', '4');
INSERT INTO `t_role_right_relation` VALUES ('1', '5');
INSERT INTO `t_role_right_relation` VALUES ('1', '6');
INSERT INTO `t_role_right_relation` VALUES ('1', '7');
INSERT INTO `t_role_right_relation` VALUES ('1', '8');
INSERT INTO `t_role_right_relation` VALUES ('1', '9');
INSERT INTO `t_role_right_relation` VALUES ('1', '10');
INSERT INTO `t_role_right_relation` VALUES ('1', '11');
INSERT INTO `t_role_right_relation` VALUES ('1', '12');
INSERT INTO `t_role_right_relation` VALUES ('1', '13');
INSERT INTO `t_role_right_relation` VALUES ('1', '14');
INSERT INTO `t_role_right_relation` VALUES ('1', '15');
INSERT INTO `t_role_right_relation` VALUES ('1', '16');
INSERT INTO `t_role_right_relation` VALUES ('1', '17');
INSERT INTO `t_role_right_relation` VALUES ('1', '18');
INSERT INTO `t_role_right_relation` VALUES ('1', '19');
INSERT INTO `t_role_right_relation` VALUES ('1', '20');
INSERT INTO `t_role_right_relation` VALUES ('1', '21');
INSERT INTO `t_role_right_relation` VALUES ('1', '22');
INSERT INTO `t_role_right_relation` VALUES ('1', '23');
INSERT INTO `t_role_right_relation` VALUES ('1', '24');
INSERT INTO `t_role_right_relation` VALUES ('1', '25');
INSERT INTO `t_role_right_relation` VALUES ('1', '26');
INSERT INTO `t_role_right_relation` VALUES ('1', '27');
INSERT INTO `t_role_right_relation` VALUES ('1', '28');
INSERT INTO `t_role_right_relation` VALUES ('1', '29');
INSERT INTO `t_role_right_relation` VALUES ('1', '30');
INSERT INTO `t_role_right_relation` VALUES ('1', '33');
INSERT INTO `t_role_right_relation` VALUES ('1', '34');
INSERT INTO `t_role_right_relation` VALUES ('1', '35');
INSERT INTO `t_role_right_relation` VALUES ('1', '36');
INSERT INTO `t_role_right_relation` VALUES ('1', '37');
INSERT INTO `t_role_right_relation` VALUES ('1', '38');
INSERT INTO `t_role_right_relation` VALUES ('1', '39');
INSERT INTO `t_role_right_relation` VALUES ('1', '40');
INSERT INTO `t_role_right_relation` VALUES ('1', '41');
INSERT INTO `t_role_right_relation` VALUES ('1', '42');
INSERT INTO `t_role_right_relation` VALUES ('1', '43');
INSERT INTO `t_role_right_relation` VALUES ('1', '44');
INSERT INTO `t_role_right_relation` VALUES ('1', '45');
INSERT INTO `t_role_right_relation` VALUES ('1', '46');
INSERT INTO `t_role_right_relation` VALUES ('1', '47');
INSERT INTO `t_role_right_relation` VALUES ('1', '48');
INSERT INTO `t_role_right_relation` VALUES ('1', '49');
INSERT INTO `t_role_right_relation` VALUES ('1', '50');
INSERT INTO `t_role_right_relation` VALUES ('1', '51');
INSERT INTO `t_role_right_relation` VALUES ('1', '52');
INSERT INTO `t_role_right_relation` VALUES ('1', '53');
INSERT INTO `t_role_right_relation` VALUES ('1', '54');
INSERT INTO `t_role_right_relation` VALUES ('1', '55');
INSERT INTO `t_role_right_relation` VALUES ('1', '56');
INSERT INTO `t_role_right_relation` VALUES ('1', '57');
INSERT INTO `t_role_right_relation` VALUES ('1', '58');
INSERT INTO `t_role_right_relation` VALUES ('1', '59');
INSERT INTO `t_role_right_relation` VALUES ('2', '5');
INSERT INTO `t_role_right_relation` VALUES ('2', '35');
INSERT INTO `t_role_right_relation` VALUES ('2', '36');
INSERT INTO `t_role_right_relation` VALUES ('2', '37');
INSERT INTO `t_role_right_relation` VALUES ('2', '38');
INSERT INTO `t_role_right_relation` VALUES ('2', '39');
INSERT INTO `t_role_right_relation` VALUES ('2', '40');
INSERT INTO `t_role_right_relation` VALUES ('2', '41');
INSERT INTO `t_role_right_relation` VALUES ('2', '42');
INSERT INTO `t_role_right_relation` VALUES ('2', '43');
INSERT INTO `t_role_right_relation` VALUES ('2', '44');
INSERT INTO `t_role_right_relation` VALUES ('2', '45');
INSERT INTO `t_role_right_relation` VALUES ('2', '46');
INSERT INTO `t_role_right_relation` VALUES ('2', '53');
INSERT INTO `t_role_right_relation` VALUES ('2', '54');
INSERT INTO `t_role_right_relation` VALUES ('2', '55');
INSERT INTO `t_role_right_relation` VALUES ('2', '56');
INSERT INTO `t_role_right_relation` VALUES ('2', '57');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键user_id',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门id',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `account` varchar(45) NOT NULL COMMENT '账号',
  `password` varchar(45) NOT NULL COMMENT '密码',
  `salt` varchar(45) NOT NULL COMMENT 'md5密码盐',
  `username` varchar(45) NOT NULL COMMENT '名字',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` int(11) DEFAULT NULL COMMENT '性别（1：男 2：女）',
  `email` varchar(45) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) DEFAULT NULL COMMENT '电话',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态(1：启用  2：冻结  3：删除）',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1000', '1', null, 'admin', '9c9d6357c2e36766', '&|^286._', '刘德华', null, null, '415656544@qq.com', null, '1', '2017-10-18 17:42:40', null, null);
INSERT INTO `t_user` VALUES ('1001', '3', null, 'zhanglin', 'cf04cccb4e9cff8d6a7ddaa15ea72da4', '&|^286._', '张林', null, null, '1660766588@qq.com', null, '1', '2017-12-31 20:29:06', null, null);

-- ----------------------------
-- Table structure for t_user_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role_relation`;
CREATE TABLE `t_user_role_relation` (
  `user_id` int(11) NOT NULL COMMENT '用户',
  `role_id` int(11) NOT NULL COMMENT '角色',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of t_user_role_relation
-- ----------------------------
INSERT INTO `t_user_role_relation` VALUES ('1000', '1');
INSERT INTO `t_user_role_relation` VALUES ('1001', '2');

-- ----------------------------
-- Function structure for queryChildrenRight
-- ----------------------------
DROP FUNCTION IF EXISTS `queryChildrenRight`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `queryChildrenRight`(rootId varchar(100)) RETURNS varchar(2000) CHARSET utf8
BEGIN   
DECLARE str varchar(2000);  
DECLARE cid varchar(100);   
SET str = '$';   
SET cid = rootId;   
WHILE cid is not null DO   
    SET str = concat(str, ',', cid);   
    SELECT group_concat(right_id) INTO cid FROM t_right where FIND_IN_SET(upper_right_id, cid) > 0;   
END WHILE;   
RETURN str;   
END
;;
DELIMITER ;
