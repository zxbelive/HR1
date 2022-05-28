/*
Navicat MySQL Data Transfer

Source Server         : m
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : hrp

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2021-05-20 00:19:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `employee_number` int(10) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `time_type` enum('上午','下午','加班') DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `start_type` enum('正常','迟到','未签到') DEFAULT '未签到',
  `end_time` time DEFAULT NULL,
  `end_type` enum('正常','早退','未签到') DEFAULT '未签到',
  `work_type` enum('上班','请假') DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attendance
-- ----------------------------
INSERT INTO `attendance` VALUES ('1', '1001', '2017-07-07', '下午', '17:01:33', '迟到', '17:25:15', '早退', null, null);
INSERT INTO `attendance` VALUES ('2', '1001', '2017-07-08', '上午', '08:53:43', '正常', '11:20:46', '早退', null, null);
INSERT INTO `attendance` VALUES ('3', '1001', '2017-07-08', '下午', '14:25:17', '正常', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('4', '1009', '2017-07-10', '上午', '10:29:35', '迟到', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('5', '1009', '2017-07-10', '下午', '16:42:01', '迟到', '16:42:25', '早退', null, null);
INSERT INTO `attendance` VALUES ('6', '1009', '2017-07-10', '加班', '19:31:46', '正常', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('7', '1009', '2017-07-11', '上午', '09:21:13', '迟到', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('8', '1009', '2017-07-12', '上午', '09:09:53', '迟到', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('9', '1009', '2017-07-12', '下午', '15:31:03', '迟到', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('10', '1001', '2017-07-12', '下午', '15:34:58', '迟到', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('11', '1007', '2017-07-12', '下午', '15:51:24', '迟到', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('12', '1008', '2017-07-12', '下午', '16:48:03', '迟到', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('13', '1009', '2017-07-12', '加班', '21:02:35', '迟到', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('14', '1010', '2017-07-12', '加班', '21:24:34', '迟到', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('15', '1001', '2021-04-13', '下午', '15:09:00', '迟到', '15:09:18', '早退', null, null);
INSERT INTO `attendance` VALUES ('16', '1008', '2021-04-13', '下午', '15:14:32', '迟到', '15:14:51', '早退', null, null);
INSERT INTO `attendance` VALUES ('17', '1011', '2021-04-13', '下午', '15:26:41', '迟到', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('18', '1001', '2021-04-13', '加班', '19:10:59', '正常', '22:36:10', '正常', null, null);
INSERT INTO `attendance` VALUES ('19', '1001', '2021-04-14', '上午', '09:38:34', '迟到', '10:31:07', '早退', null, null);
INSERT INTO `attendance` VALUES ('20', '1008', '2021-04-14', '上午', '10:33:54', '迟到', '11:50:57', '早退', null, null);
INSERT INTO `attendance` VALUES ('21', '1001', '2021-04-15', '上午', '09:40:12', '迟到', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('22', '1008', '2021-04-15', '上午', '09:48:54', '迟到', '09:48:55', '早退', null, null);
INSERT INTO `attendance` VALUES ('23', '1001', '2021-04-16', '上午', '11:22:03', '迟到', '11:24:33', '早退', null, null);
INSERT INTO `attendance` VALUES ('24', '1007', '2021-04-17', '加班', '19:50:14', '正常', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('25', '1001', '2021-04-18', '上午', '09:19:05', '迟到', '09:19:53', '早退', null, null);
INSERT INTO `attendance` VALUES ('26', '1001', '2021-04-21', '上午', '08:30:44', '正常', '09:12:27', '早退', null, null);
INSERT INTO `attendance` VALUES ('27', '1008', '2021-04-21', '上午', '09:14:21', '迟到', '09:19:39', '早退', null, null);
INSERT INTO `attendance` VALUES ('28', '1001', '2021-04-23', '下午', '17:27:08', '迟到', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('29', '1001', '2021-04-23', '加班', '20:09:06', '迟到', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('30', '1008', '2021-04-23', '加班', '20:10:12', '迟到', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('31', '1011', '2021-04-23', '加班', '21:19:57', '迟到', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('32', '1001', '2021-04-24', '上午', '08:54:56', '正常', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('33', '1001', '2021-04-24', '加班', '20:34:20', '迟到', '20:34:22', '早退', null, null);
INSERT INTO `attendance` VALUES ('34', '1001', '2021-04-26', '上午', '09:20:09', '迟到', '09:20:13', '早退', null, null);
INSERT INTO `attendance` VALUES ('36', '1001', '2021-04-29', '上午', '09:09:28', '迟到', '09:09:31', '早退', null, null);
INSERT INTO `attendance` VALUES ('37', '1007', '2021-04-29', '上午', '09:11:16', '迟到', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('38', '1018', '2021-04-29', '上午', '09:18:34', '迟到', '09:18:37', '早退', null, null);
INSERT INTO `attendance` VALUES ('39', '1001', '2021-05-04', '下午', '16:51:13', '迟到', '16:51:14', '早退', null, null);
INSERT INTO `attendance` VALUES ('40', '1007', '2021-05-04', '加班', '19:27:31', '正常', '19:36:22', '早退', null, null);
INSERT INTO `attendance` VALUES ('41', '1008', '2021-05-04', '加班', '19:36:50', '迟到', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('42', '1001', '2021-05-06', '下午', '16:52:31', '迟到', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('43', '1001', '2021-05-06', '加班', '21:51:38', '迟到', '21:54:33', '早退', null, null);
INSERT INTO `attendance` VALUES ('44', '1001', '2021-05-07', '加班', '23:16:30', '迟到', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('45', '1001', '2021-05-09', '上午', '10:45:12', '迟到', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('46', '1001', '2021-05-09', '加班', '19:52:45', '迟到', '21:55:37', '早退', null, null);
INSERT INTO `attendance` VALUES ('47', '1001', '2021-05-11', '加班', '20:37:20', '迟到', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('48', '1011', '2021-05-15', '下午', '16:18:01', '迟到', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('49', '1035', '2021-05-17', '上午', '09:50:51', '迟到', null, '未签到', null, null);
INSERT INTO `attendance` VALUES ('50', '1011', '2021-05-19', '上午', '09:52:27', '迟到', null, '未签到', null, null);

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `department_number` int(10) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `manager` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '2001', '研发部', '王生安', '0923-3456180', '24楼', '');
INSERT INTO `department` VALUES ('2', '2002', '测试部', '贺易', '0923-3456324', '25楼', '');
INSERT INTO `department` VALUES ('3', '2003', '设计部', '周卓浩', '0923-3456909', '23楼', '');
INSERT INTO `department` VALUES ('4', '2004', '人事部', '何刚名', '0923-3456231', '22楼', '');
INSERT INTO `department` VALUES ('5', '2005', '运营部', '王成文 ', '0923-3456782', '24楼', '');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `employee_number` int(10) NOT NULL,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` enum('男','女') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `telephone` varchar(15) DEFAULT '',
  `email` varchar(30) DEFAULT '',
  `address` varchar(50) DEFAULT NULL,
  `photo` varchar(50) DEFAULT '',
  `education` varchar(20) DEFAULT '',
  `department_number` int(10) DEFAULT NULL,
  `position_number` int(10) DEFAULT NULL,
  `in_time` date DEFAULT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `notes` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `department_number` (`department_number`),
  KEY `title_number` (`position_number`),
  KEY `employee_number` (`employee_number`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '1001', 'admin', '男', '1995-10-18', '15678015439', '770392436@qq.com', '湖北黄冈112123', '', '123123', '2004', '3003', '2017-02-22', '25d55ad283aa400af464c76d713c07ad', '1111123');
INSERT INTO `employee` VALUES ('2', '1007', '李烨', '女', '1996-03-04', '18907327612', '770392436@qq.com', 'null', '', '1', '2001', '3001', '2017-01-10', '25d55ad283aa400af464c76d713c07ad', '11');
INSERT INTO `employee` VALUES ('3', '1008', '刘旭亮', '男', '1995-06-06', '13464238971', '770392436@qq.com', '', '', '', '2002', '3001', '2017-06-28', '25d55ad283aa400af464c76d713c07ad', '121211');
INSERT INTO `employee` VALUES ('4', '1009', '张彤', '男', '1995-09-24', '15810239904', '', '', '', '', '2003', '3001', '2017-02-06', '25d55ad283aa400af464c76d713c07ad', '');
INSERT INTO `employee` VALUES ('5', '1010', '杨杰', '男', '1995-01-25', '17871239756', '770392436@qq.com', '', '', '', '2005', '3001', '2017-05-12', '25d55ad283aa400af464c76d713c07ad', '');
INSERT INTO `employee` VALUES ('6', '1011', '唐治涛', '男', '1995-03-29', '18832013916', '', '河北沧州11', null, '大学本科', '2005', '3002', '2017-07-05', '25d55ad283aa400af464c76d713c07ad', '123123');
INSERT INTO `employee` VALUES ('7', '1012', '张璐', '男', '1997-03-04', '18832050264', '', '河北张家口', null, '大学本科', '2001', '3002', '2017-07-05', '25d55ad283aa400af464c76d713c07ad', '');
INSERT INTO `employee` VALUES ('8', '1013', 'cs', '男', '2013-10-16', '123', '770392436@qq.com', '', '', '', '2002', '3002', '2021-04-21', '25d55ad283aa400af464c76d713c07ad', '22');
INSERT INTO `employee` VALUES ('10', '1015', 'sjb', '男', '1998-07-09', '123', '', '', '', '', '2003', '3002', '2021-04-24', '81dc9bdb52d04dc20036dbd8313ed055', '1212');
INSERT INTO `employee` VALUES ('19', '1018', 'test1018', '男', '2021-04-24', '1', '', '11', '', '', '2001', '3001', '2021-04-24', '81dc9bdb52d04dc20036dbd8313ed055', '');
INSERT INTO `employee` VALUES ('20', '1019', '11', '男', '2001-07-28', '123', '', '', '', '', '2002', '3002', '2021-04-29', '81dc9bdb52d04dc20036dbd8313ed055', '11');
INSERT INTO `employee` VALUES ('21', '1020', 'zx', '男', '1998-12-29', '11', '', '', '', '', '2001', '3002', '2021-04-29', '81dc9bdb52d04dc20036dbd8313ed055', '11');
INSERT INTO `employee` VALUES ('24', '1023', '12', '男', '1998-12-28', '', '7777777777@qq.com', '湖北黄冈', '', '高中', '2004', '3003', '2021-05-08', '81dc9bdb52d04dc20036dbd8313ed055', '11');
INSERT INTO `employee` VALUES ('36', '1035', '13', '男', '1998-12-28', '12345678911', '7777777777@qq.com', '湖北黄冈', '', '高中', '2004', '3003', '2021-05-08', '81dc9bdb52d04dc20036dbd8313ed055', '11');

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `employee_number` int(10) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `gender` enum('男','女') DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `telephone` varchar(20) DEFAULT '',
  `email` varchar(30) DEFAULT '',
  `address` varchar(50) DEFAULT '',
  `photo` varchar(50) DEFAULT '',
  `education` varchar(20) DEFAULT '',
  `in_time` date DEFAULT NULL,
  `out_time` date DEFAULT NULL,
  `department_number` int(10) DEFAULT NULL,
  `position_number` int(10) DEFAULT NULL,
  `status` enum('离职','在职','退休') DEFAULT NULL,
  `home` varchar(100) DEFAULT '',
  `notes` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('1', '1001', 'admin', '男', '1995-10-18', '15678015439', '770392436@qq.com', '湖北黄冈112123', '', '123123', '2017-02-22', null, '2001', '3003', '在职', '', '');
INSERT INTO `history` VALUES ('2', '1002', '王秀英', '女', '1992-03-08', '15590678821', '', '', '', '', '2011-04-29', '2017-07-04', '2005', '3001', '离职', '', '');
INSERT INTO `history` VALUES ('3', '1003', '李强', '男', '1993-12-22', '18929778634', '', '', '', '', '2010-05-06', '2017-07-05', '2005', '3001', '退休', '', '');
INSERT INTO `history` VALUES ('4', '1004', '刘洋', '男', '1991-07-26', '13807987324', '', '', '', '', '2009-12-23', '2017-07-04', '2005', '3002', '退休', '', '');
INSERT INTO `history` VALUES ('5', '1005', '李敏', '女', '1991-01-03', '13791826142', '', '', '', '', '2010-03-29', '2017-07-05', '2004', '3002', '退休', '', '');
INSERT INTO `history` VALUES ('6', '1006', '王伟 ', '女', '1990-06-12', '13986207926', '', '', '', '', '2010-10-12', '2017-07-06', '2001', '3001', '离职', '', '');
INSERT INTO `history` VALUES ('7', '1007', '李烨', '女', '1996-03-04', '18907327612', '770392436@qq.com', 'null', '', '1', '2017-01-10', '2021-04-13', '2001', '3001', '在职', '', '');
INSERT INTO `history` VALUES ('8', '1008', '刘旭亮', '男', '1995-06-06', '13464238971', '770392436@qq.com', '', '', '', '2017-06-28', null, '2002', '3001', '在职', '', '');
INSERT INTO `history` VALUES ('9', '1009', '张彤', '男', '1995-09-24', '15810239904', '', '', '', '', '2017-02-06', '2021-04-13', '2002', '3003', '在职', '', '');
INSERT INTO `history` VALUES ('10', '1010', '杨杰', '男', '1995-01-26', '17871239756', '', '', '', '', '2017-05-12', null, '2003', '3003', '在职', '', '');
INSERT INTO `history` VALUES ('11', '1011', '唐治涛', '男', '1995-03-29', '18832013916', '', '河北沧州11', '', '大学本科', '2017-07-05', null, '2001', '3002', '在职', '', '');
INSERT INTO `history` VALUES ('12', '1012', '张璐', '男', '1997-03-11', '18832050264', '1215959210@qq.com', '河北省张家口', '', '本科', '2017-07-05', '2021-04-13', '2001', '3002', '在职', '', '');
INSERT INTO `history` VALUES ('13', '1013', 'cs', '男', '2013-10-16', '123', '770392436@qq.com', '', '', '', '2021-04-21', null, '2002', '3002', '在职', '', '22');
INSERT INTO `history` VALUES ('14', '1014', 'test', '女', '2021-04-21', '110', '1031854483@qq.com', '', '', '初中', '2021-04-21', null, '2005', '3002', '离职', '', '11');
INSERT INTO `history` VALUES ('15', '1015', 'sjb', '男', '1998-07-09', '123', '', '', '', '', '2021-04-24', null, '2003', '3002', '在职', '', '121');
INSERT INTO `history` VALUES ('16', '1016', 'test5', '男', '1998-06-10', '123', '', '', '', '', '2021-04-24', null, '2002', '3001', '离职', '', '');
INSERT INTO `history` VALUES ('17', '1017', 'zx', '男', '2021-04-24', '', '', '', '', '', '2021-04-24', null, '2001', '3001', '离职', '', '');
INSERT INTO `history` VALUES ('18', '1018', 'test1018', '男', '2021-04-24', '', '', '11', '', '', '2021-04-24', null, '2001', '3001', '在职', '', '');
INSERT INTO `history` VALUES ('19', '1019', '11', '男', '2001-07-28', '123', '', '', '', '', '2021-04-29', null, '2002', '3002', '在职', '', '11');
INSERT INTO `history` VALUES ('20', '1020', 'zx', '男', '1998-12-29', '11', '', '', '', '', '2021-04-29', null, '2001', '3002', '在职', '', '11');
INSERT INTO `history` VALUES ('21', '1021', '11', '男', '1998-12-30', '123', '', '', '', '', '2021-04-29', null, '2002', '3002', '离职', '', '11');
INSERT INTO `history` VALUES ('22', '1022', '11', '男', null, '', '', '', '', '', '2021-05-06', null, '2002', '3002', '离职', '', '');
INSERT INTO `history` VALUES ('23', '1023', '12', '男', '1998-12-28', '', '7777777777@qq.com', '湖北黄冈', '12345678911', '高中', '2021-05-08', null, '2004', '3003', '在职', '', '11');
INSERT INTO `history` VALUES ('24', '1024', '12', '男', '1998-12-28', '12345678911', '7777777777@qq.com', '湖北黄冈', '', '高中', '2021-05-08', null, '2004', '3003', '离职', '', '11');
INSERT INTO `history` VALUES ('25', '1025', '12', '男', '1998-12-28', '12345678911', '7777777777@qq.com', '湖北黄冈', '', '高中', '2021-05-08', null, '2004', '3003', '离职', '', '11');
INSERT INTO `history` VALUES ('26', '1026', '12', '男', '1998-12-28', '12345678911', '7777777777@qq.com', '湖北黄冈', '', '高中', '2021-05-08', null, '2004', '3003', '离职', '', '11');
INSERT INTO `history` VALUES ('27', '1027', '12', '男', '1998-12-28', '12345678911', '7777777777@qq.com', '湖北黄冈', '', '高中', '2021-05-08', null, '2004', '3003', '离职', '', '11');
INSERT INTO `history` VALUES ('28', '1028', '12', '男', '1998-12-28', '12345678911', '7777777777@qq.com', '湖北黄冈', '', '高中', '2021-05-08', null, '2004', '3003', '离职', '', '11');
INSERT INTO `history` VALUES ('29', '1029', '12', '男', '1998-12-28', '12345678911', '7777777777@qq.com', '湖北黄冈', '', '高中', '2021-05-08', null, '2004', '3003', '离职', '', '11');
INSERT INTO `history` VALUES ('30', '1030', '12', '男', '1998-12-28', '12345678911', '7777777777@qq.com', '湖北黄冈', '', '高中', '2021-05-08', null, '2004', '3003', '离职', '', '11');
INSERT INTO `history` VALUES ('31', '1031', '12', '男', '1998-12-28', '12345678911', '7777777777@qq.com', '湖北黄冈', '', '高中', '2021-05-08', null, '2004', '3003', '离职', '', '11');
INSERT INTO `history` VALUES ('32', '1032', '12', '男', '1998-12-28', '12345678911', '7777777777@qq.com', '湖北黄冈', '', '高中', '2021-05-08', null, '2004', '3003', '离职', '', '11');
INSERT INTO `history` VALUES ('33', '1033', '12', '男', '1998-12-28', '12345678911', '7777777777@qq.com', '湖北黄冈', '', '高中', '2021-05-08', null, '2004', '3003', '离职', '', '11');
INSERT INTO `history` VALUES ('34', '1034', '12', '男', '1998-12-28', '12345678911', '7777777777@qq.com', '湖北黄冈', '', '高中', '2021-05-08', null, '2004', '3003', '离职', '', '11');
INSERT INTO `history` VALUES ('35', '1035', '13', '男', '1998-12-28', '12345678911', '7777777777@qq.com', '湖北黄冈', '', '高中', '2021-05-08', null, '2004', '3003', '在职', '', '11');
INSERT INTO `history` VALUES ('36', '1036', '15', '男', '1998-12-28', '12345678911', '7777777777@qq.com', '湖北黄冈', '', '高中', '2021-05-08', '2021-05-15', '2004', '3003', '离职', '', '11');
INSERT INTO `history` VALUES ('37', '1037', '15', '男', '1998-12-28', '12345678911', '7777777777@qq.com', '湖北黄冈', '', '高中', '2021-05-08', null, '2004', '3003', '离职', '', '11');
INSERT INTO `history` VALUES ('38', '1038', '15', '男', '1998-12-28', '12345678911', '7777777777@qq.com', '湖北黄冈', '', '高中', '2021-05-08', null, '2004', '3003', '离职', '', '11');
INSERT INTO `history` VALUES ('39', '1039', '15', '男', '1998-12-28', '12345678911', '7777777777@qq.com', '湖北黄冈', '', '高中', '2021-05-08', null, '2004', '3003', '离职', '', '11');
INSERT INTO `history` VALUES ('40', '1040', '15', '男', '1998-12-28', '12345678911', '7777777777@qq.com', '湖北黄冈', '', '高中', '2021-05-08', null, '2004', '3003', '离职', '', '11');
INSERT INTO `history` VALUES ('41', '1041', '15', '男', '1998-12-28', '12345678911', '7777777777@qq.com', '湖北黄冈', '', '高中', '2021-05-09', null, '2004', '3003', '离职', '', '11');
INSERT INTO `history` VALUES ('42', '1042', '15', '男', '1998-12-28', '12345678911', '7777777777@qq.com', '湖北黄冈', '', '高中', '2021-05-09', null, '2004', '3003', '离职', '', '11');
INSERT INTO `history` VALUES ('43', '1043', 'zxt', '男', '1998-12-28', '123456789', '770392436@qq.com', 'gzz', '', 'gz', '2021-05-09', '2021-05-15', '2004', '3003', '离职', '', '1');
INSERT INTO `history` VALUES ('44', '1044', 'test1', '男', '1998-12-28', '123456789', '770392436@qq.com', 'gzz', '', 'gz', '2021-05-09', '2021-05-09', '2004', '3003', '离职', '', '1');
INSERT INTO `history` VALUES ('45', '1045', 'test2', '男', '1998-12-29', '123456789', '770392437@qq.com', 'gzz', '', 'gz', '2021-05-09', '2021-05-09', '2004', '3003', '离职', '', '1');
INSERT INTO `history` VALUES ('46', '1046', 'zxt', '男', '2021-05-09', '', '', '', '', '', '2021-05-09', '2021-05-15', '2001', '3002', '退休', '', '');
INSERT INTO `history` VALUES ('47', '1047', 'test111', '男', '2000-07-15', '1234', '770392436@qq.com', '', '', '', '2021-05-15', '2021-05-15', '2001', '3002', '离职', '', '');
INSERT INTO `history` VALUES ('48', '1048', 'test1', '男', '1998-12-28', '123456789', '770392436@qq.com', 'gzz', '', 'gz', '2021-05-15', '2021-05-15', '2004', '3003', '离职', '', '1');
INSERT INTO `history` VALUES ('49', '1049', 'test2', '男', '1998-12-29', '123456789', '770392437@qq.com', 'gzz', '', 'gz', '2021-05-15', '2021-05-15', '2004', '3003', '离职', '', '1');
INSERT INTO `history` VALUES ('50', '1050', 'test1', '男', '1998-12-28', '123456789', '770392436@qq.com', 'gzz', '', 'gz', '2021-05-15', '2021-05-15', '2004', '3003', '离职', '', '1');
INSERT INTO `history` VALUES ('51', '1051', 'test2', '男', '1998-12-29', '123456789', '770392437@qq.com', 'gzz', '', 'gz', '2021-05-15', '2021-05-15', '2004', '3003', '退休', '', '1');
INSERT INTO `history` VALUES ('52', '1052', 'test1', '男', '1998-12-28', '123456789', '770392436@qq.com', 'gzz', '', 'gz', '2021-05-16', '2021-05-16', '2004', '3003', '退休', '', '1');
INSERT INTO `history` VALUES ('53', '1053', 'test2', '男', '1998-12-29', '123456789', '770392437@qq.com', 'gzz', '', 'gz', '2021-05-16', '2021-05-16', '2004', '3003', '退休', '', '1');

-- ----------------------------
-- Table structure for lea
-- ----------------------------
DROP TABLE IF EXISTS `lea`;
CREATE TABLE `lea` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `employee_number` int(10) DEFAULT NULL,
  `department_number` int(10) DEFAULT NULL,
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `days` varchar(10) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `type` enum('事假','病假') DEFAULT NULL,
  `manager` varchar(10) DEFAULT NULL,
  `status` enum('已批准','未批准') DEFAULT '未批准',
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lea
-- ----------------------------
INSERT INTO `lea` VALUES ('1', '1007', '2001', '2017-07-11', '2017-07-12', '1', '家中有事', '事假', null, '已批准', null);
INSERT INTO `lea` VALUES ('2', '1008', '2002', '2017-07-10', '2017-07-12', '2', '偶感风寒', '病假', null, '已批准', null);
INSERT INTO `lea` VALUES ('3', '1011', '2005', '2017-07-11', '2017-07-11', '1', '回家看看', '事假', null, '已批准', null);
INSERT INTO `lea` VALUES ('7', '1008', '2002', '2017-07-14', '2017-07-17', '3', '真的有点事', '事假', null, '已批准', null);
INSERT INTO `lea` VALUES ('8', '1009', '2003', '2017-07-05', '2017-07-06', '1', '回家看看', '事假', null, '已批准', null);
INSERT INTO `lea` VALUES ('9', '1012', '2001', '2017-07-08', '2017-07-08', '1', '摊上事了', '事假', null, '已批准', null);
INSERT INTO `lea` VALUES ('10', '1012', '2001', '2017-07-13', '2017-07-14', '1', '真的有点事', '事假', null, '已批准', null);
INSERT INTO `lea` VALUES ('11', '1011', '2005', '2021-04-13', '2021-04-14', '2', '11', '病假', null, '已批准', null);
INSERT INTO `lea` VALUES ('12', '1011', '2005', '2021-04-13', '2021-04-14', '1', '11', '病假', null, '已批准', null);
INSERT INTO `lea` VALUES ('13', '1011', '2005', '2021-04-13', '2021-04-14', '2', '11', '病假', null, '已批准', null);
INSERT INTO `lea` VALUES ('14', '1011', '2005', '2021-04-01', '2021-04-02', '2', 'iug', '病假', null, '已批准', null);
INSERT INTO `lea` VALUES ('15', '1011', '2005', '2021-04-15', '2021-04-17', null, '11', '病假', null, '未批准', null);
INSERT INTO `lea` VALUES ('16', '1012', '2001', '2021-04-20', '2021-04-22', null, '11', '事假', null, '未批准', null);
INSERT INTO `lea` VALUES ('17', '1012', '2001', '2021-04-20', '2021-04-22', null, '11', '事假', null, '未批准', null);
INSERT INTO `lea` VALUES ('18', '1012', '2001', '2021-04-20', '2021-04-22', null, '21', '事假', null, '未批准', null);
INSERT INTO `lea` VALUES ('19', '1012', '2001', '2021-04-20', '2021-04-22', null, '21', '事假', null, '未批准', null);
INSERT INTO `lea` VALUES ('20', '1012', '2001', '2021-04-20', '2021-04-22', null, '11', '事假', null, '未批准', null);
INSERT INTO `lea` VALUES ('21', '1012', '2001', '2021-04-20', '2021-04-22', null, '111212312', '病假', null, '未批准', null);
INSERT INTO `lea` VALUES ('22', '1012', '2001', '2021-04-20', '2021-04-22', null, '111212312', '病假', null, '未批准', null);
INSERT INTO `lea` VALUES ('23', '1013', '2002', '2021-04-21', '2021-04-23', null, 'cs', '病假', null, '未批准', null);
INSERT INTO `lea` VALUES ('24', '1008', null, '2021-04-21', '2021-04-22', null, 'liuxuliang', '病假', null, '已批准', null);
INSERT INTO `lea` VALUES ('25', '1007', null, '2021-04-21', '2021-04-22', null, '1212', '事假', null, '已批准', null);
INSERT INTO `lea` VALUES ('26', '1008', null, '2021-04-21', '2021-04-23', null, 'asdda', '病假', null, '未批准', null);
INSERT INTO `lea` VALUES ('27', '1008', null, '2021-04-22', '2021-04-23', null, '12', '病假', null, '未批准', null);
INSERT INTO `lea` VALUES ('28', '1008', '2002', '2021-04-22', '2021-04-24', null, '11', '事假', null, '未批准', null);
INSERT INTO `lea` VALUES ('29', '1008', '2002', '2021-04-22', '2021-04-24', null, '12', '事假', null, '已批准', null);
INSERT INTO `lea` VALUES ('30', '1008', '2002', null, null, null, null, null, null, '未批准', null);
INSERT INTO `lea` VALUES ('31', '1008', '2002', null, null, null, null, null, null, '未批准', null);
INSERT INTO `lea` VALUES ('32', '1008', '2002', '2021-04-22', '2021-04-22', null, '1', '病假', null, '未批准', null);
INSERT INTO `lea` VALUES ('33', '1008', '2002', '2021-04-22', '2021-04-26', null, '12345', '病假', null, '未批准', null);
INSERT INTO `lea` VALUES ('34', '1008', '2002', '2021-04-23', '2021-04-25', '3', 'asd', '病假', null, '已批准', null);
INSERT INTO `lea` VALUES ('35', '1018', '2001', '2021-04-25', '2021-04-29', '5', '11', '病假', null, '已批准', null);
INSERT INTO `lea` VALUES ('36', '1001', '2004', '2021-04-29', '2021-05-01', '3', '11', '病假', null, '未批准', null);
INSERT INTO `lea` VALUES ('37', '1007', '2001', '2021-04-29', '2021-05-01', '3', '11', '事假', null, '已批准', null);
INSERT INTO `lea` VALUES ('39', '1018', '2001', '2021-04-29', '2021-05-01', '3', '33', '病假', null, '已批准', null);
INSERT INTO `lea` VALUES ('40', '1001', '2004', '2021-05-09', '2021-05-09', '1', '1', '事假', null, '未批准', null);
INSERT INTO `lea` VALUES ('41', '1001', '2004', '2021-05-09', '2021-05-30', '22', '11', '病假', null, '已批准', null);
INSERT INTO `lea` VALUES ('42', '1007', '2001', '2021-05-15', '2021-05-17', '3', '11', '病假', null, '已批准', null);
INSERT INTO `lea` VALUES ('43', '1011', '2005', '2021-05-15', '2021-05-30', '16', '11', '病假', null, '已批准', null);
INSERT INTO `lea` VALUES ('44', '1010', '2005', '2021-05-15', '2021-05-15', '1', '1', '事假', null, '已批准', null);
INSERT INTO `lea` VALUES ('45', '1001', '2004', '2021-05-19', '2021-05-23', '5', '11', '事假', null, '未批准', null);
INSERT INTO `lea` VALUES ('46', '1007', '2001', '2021-05-19', '2021-05-20', '2', 'tt', '事假', null, '未批准', null);

-- ----------------------------
-- Table structure for move
-- ----------------------------
DROP TABLE IF EXISTS `move`;
CREATE TABLE `move` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `employee_number` int(10) NOT NULL,
  `before` int(10) NOT NULL,
  `after` int(10) NOT NULL,
  `time` datetime NOT NULL,
  `manager` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of move
-- ----------------------------
INSERT INTO `move` VALUES ('1', '1011', '2001', '2002', '2017-07-10 20:40:20', '张彤', null);
INSERT INTO `move` VALUES ('3', '1007', '2001', '2003', '2017-07-11 09:53:34', '张彤', null);

-- ----------------------------
-- Table structure for overtime
-- ----------------------------
DROP TABLE IF EXISTS `overtime`;
CREATE TABLE `overtime` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `department_number` int(10) NOT NULL,
  `employee_number` int(10) NOT NULL,
  `day` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of overtime
-- ----------------------------
INSERT INTO `overtime` VALUES ('1', '2005', '1007', '2017-07-12', null, null, null);
INSERT INTO `overtime` VALUES ('2', '2001', '1008', '2017-07-12', null, null, null);
INSERT INTO `overtime` VALUES ('3', '2003', '1012', '2017-07-12', null, null, null);
INSERT INTO `overtime` VALUES ('4', '2003', '1010', '2017-07-12', null, null, null);
INSERT INTO `overtime` VALUES ('8', '2004', '1011', '2017-07-14', null, null, null);
INSERT INTO `overtime` VALUES ('9', '2001', '1008', '2021-04-13', null, null, null);
INSERT INTO `overtime` VALUES ('10', '2001', '1008', '2021-04-14', null, null, null);
INSERT INTO `overtime` VALUES ('11', '2004', '1001', '2021-04-15', null, null, null);
INSERT INTO `overtime` VALUES ('12', '2001', '1007', '2021-04-24', null, null, null);
INSERT INTO `overtime` VALUES ('13', '2001', '1018', '2021-04-24', null, null, null);
INSERT INTO `overtime` VALUES ('14', '2002', '1008', '2021-04-19', null, null, null);
INSERT INTO `overtime` VALUES ('15', '2004', '1001', '2021-04-26', null, null, null);
INSERT INTO `overtime` VALUES ('16', '2002', '1013', '2021-04-29', null, null, null);
INSERT INTO `overtime` VALUES ('17', '2005', '1011', '2021-04-29', null, null, null);
INSERT INTO `overtime` VALUES ('20', '2001', '1018', '2021-05-16', null, null, null);
INSERT INTO `overtime` VALUES ('23', '2001', '1007', '2021-05-17', null, null, null);
INSERT INTO `overtime` VALUES ('24', '2004', '1035', '2021-05-19', null, null, null);

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `position_number` int(10) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` enum('部门员工','部门领导','人事') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `notes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `position_number` (`position_number`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES ('1', '3001', '部门领导', '部门领导', 'MANAGE');
INSERT INTO `position` VALUES ('2', '3002', '部门员工', '部门员工', 'EMPLOYEE');
INSERT INTO `position` VALUES ('3', '3003', '人事', '部门领导', 'ADMIN');

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basic_salary` int(11) DEFAULT NULL,
  `user_code` int(255) DEFAULT NULL,
  `in_time` datetime DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES ('1', '8000', '1001', '2021-05-09 21:57:48', '11');
INSERT INTO `salary` VALUES ('2', '1300', '1007', '2021-05-15 11:27:27', '222');
INSERT INTO `salary` VALUES ('3', '1000', '1008', '2021-05-05 11:20:25', '333');
INSERT INTO `salary` VALUES ('4', '5000', '1009', '2021-05-05 11:33:55', '4444');
INSERT INTO `salary` VALUES ('5', '5000', '1010', '2021-05-05 11:34:07', '555');
INSERT INTO `salary` VALUES ('6', '6000', '1011', '2021-05-05 11:34:34', '666');
INSERT INTO `salary` VALUES ('7', '60000', '1018', '2021-05-06 16:11:07', 'null');
INSERT INTO `salary` VALUES ('8', '8000', '1019', '2021-05-08 10:23:42', null);
INSERT INTO `salary` VALUES ('9', '8000', '1020', '2021-05-08 10:26:13', null);
INSERT INTO `salary` VALUES ('10', '8000', '1023', '2021-05-08 10:30:00', null);
INSERT INTO `salary` VALUES ('20', '8000', '1035', '2021-05-08 17:46:28', null);
INSERT INTO `salary` VALUES ('29', '6000', '1012', '2021-05-09 18:46:52', null);
INSERT INTO `salary` VALUES ('30', '8000', '1013', '2021-05-09 18:47:10', null);
INSERT INTO `salary` VALUES ('31', '6000', '1015', '2021-05-09 18:47:34', null);

-- ----------------------------
-- Table structure for tab_menu
-- ----------------------------
DROP TABLE IF EXISTS `tab_menu`;
CREATE TABLE `tab_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT '上级菜单id',
  `menu_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单形式，0:空菜单，1:有连接菜单',
  `menu_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单调用url',
  `permis_id` bigint(20) unsigned DEFAULT NULL COMMENT '菜单与权限对应关系',
  `menu_order` int(10) unsigned NOT NULL COMMENT '菜单排序',
  `menu_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否展现0：展现，1：关闭',
  `menu_icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单图标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='菜单表';

-- ----------------------------
-- Records of tab_menu
-- ----------------------------
INSERT INTO `tab_menu` VALUES ('1', '0', '0', '个人信息', '#', null, '1', '0', 'fa-newspaper-o');
INSERT INTO `tab_menu` VALUES ('2', '0', '0', '员工', '#', null, '2', '0', null);
INSERT INTO `tab_menu` VALUES ('3', '0', '0', '部门', '#', null, '3', '0', null);
INSERT INTO `tab_menu` VALUES ('4', '1', '1', '查看个人信息', 'employee/oneself/1/detail.do', null, '4', '0', null);
INSERT INTO `tab_menu` VALUES ('5', '1', '1', '修改个人信息', 'employee/onseself/1/toUpdate.do', null, '5', '0', null);
INSERT INTO `tab_menu` VALUES ('6', '2', '0', '员工管理', '#', null, '6', '0', 'fa-user-md');
INSERT INTO `tab_menu` VALUES ('7', '2', '0', '考勤管理', '#', null, '7', '0', 'fa-calendar');
INSERT INTO `tab_menu` VALUES ('8', '2', '0', '请假管理', '#', null, '8', '0', 'fa-bookmark');
INSERT INTO `tab_menu` VALUES ('9', '3', '0', '部门管理', '#', null, '9', '0', 'fa-sitemap');
INSERT INTO `tab_menu` VALUES ('10', '6', '1', '在职员工管理', 'employee/listPage.do?pageNo=1', '24', '10', '0', null);
INSERT INTO `tab_menu` VALUES ('11', '6', '1', '离休人员管理', 'history/retirelistPage.do?pageNo=1', '20', '11', '0', null);
INSERT INTO `tab_menu` VALUES ('12', '7', '1', '考勤管理', 'attendance/list.do', '19', '12', '0', null);
INSERT INTO `tab_menu` VALUES ('13', '7', '1', '加班管理', 'overtime/listPage.do?pageNo=1', '3', '13', '0', null);
INSERT INTO `tab_menu` VALUES ('14', '8', '1', '未批准列表', 'leave/notlist.do', '13', '14', '0', null);
INSERT INTO `tab_menu` VALUES ('15', '8', '1', '已批准列表', 'leave/yeslist.do', '14', '15', '0', null);
INSERT INTO `tab_menu` VALUES ('16', '8', '1', '请假列表', 'leave/list.do', '15', '16', '0', null);
INSERT INTO `tab_menu` VALUES ('17', '9', '1', '部门管理', 'department/listPage.do?pageNo=1', '1', '17', '0', null);
INSERT INTO `tab_menu` VALUES ('18', '9', '1', '职称管理', 'position/listPage.do?pageNo=1', '2', '18', '0', null);
INSERT INTO `tab_menu` VALUES ('19', '1', '1', '申请请假', 'leave/toAdd.do', '16', '19', '0', null);
INSERT INTO `tab_menu` VALUES ('20', '1', '1', '查看请假记录', 'leave/oneself.do?pageNo=1', null, '20', '0', null);

-- ----------------------------
-- Table structure for tab_permis
-- ----------------------------
DROP TABLE IF EXISTS `tab_permis`;
CREATE TABLE `tab_permis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `permission_sign` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限标识,程序中判断使用,如"user:create"',
  `permission_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='权限表';

-- ----------------------------
-- Records of tab_permis
-- ----------------------------
INSERT INTO `tab_permis` VALUES ('1', '部门管理', 'depart:query', '部门管理查询');
INSERT INTO `tab_permis` VALUES ('2', '职称管理', 'position:query', '职称管理查询');
INSERT INTO `tab_permis` VALUES ('3', '加班管理', 'overtime:list', '加班管理查询');
INSERT INTO `tab_permis` VALUES ('4', '部门管理', 'depart:del', '部门管理删除');
INSERT INTO `tab_permis` VALUES ('6', '部门管理', 'depart:add:show', '部门新增展现');
INSERT INTO `tab_permis` VALUES ('8', '部门管理', 'depart:add:submit', '部门新增提交');
INSERT INTO `tab_permis` VALUES ('10', '部门管理', 'depart:update:show', '部门更新展现');
INSERT INTO `tab_permis` VALUES ('12', '部门管理', 'depart:update:submit', '部门更新提交');
INSERT INTO `tab_permis` VALUES ('13', '请假管理', 'leave:nolist', '请假管理未批准列表');
INSERT INTO `tab_permis` VALUES ('14', '请假管理', 'leave:yeslist', '请假管理已批准列表');
INSERT INTO `tab_permis` VALUES ('15', '请假管理', 'leave:list', '请假管理列表');
INSERT INTO `tab_permis` VALUES ('16', '请假管理', 'leave:add', '请假管理新增');
INSERT INTO `tab_permis` VALUES ('17', '请假管理', 'leave:new', '请假管理新增提交');
INSERT INTO `tab_permis` VALUES ('18', '请假管理', 'leave:update', '请假管理更新');
INSERT INTO `tab_permis` VALUES ('19', '考勤管理', 'attendance:list', '考勤管理列表');
INSERT INTO `tab_permis` VALUES ('20', '离退休管理', 'history:list', '离退休管理列表');
INSERT INTO `tab_permis` VALUES ('21', '离退休管理', 'history:detail', '离退休管理明细');
INSERT INTO `tab_permis` VALUES ('22', '离退休管理', 'history:update', '离退休管理更新');
INSERT INTO `tab_permis` VALUES ('23', '离退休管理', 'history:update:submit', '离退休管理更新提交');
INSERT INTO `tab_permis` VALUES ('24', '员工档案管理', 'employee:list', '员工档案管理列表');
INSERT INTO `tab_permis` VALUES ('25', '员工调动记录', 'move:list', '员工调动记录列表');
INSERT INTO `tab_permis` VALUES ('26', '加班管理', 'overtime:list', '员工加班记录列表');
INSERT INTO `tab_permis` VALUES ('27', '加班管理', 'overtime:add:show', '员工加班新增界面');
INSERT INTO `tab_permis` VALUES ('28', '加班管理', 'overtime:add:submit', '员工加班新增提交');
INSERT INTO `tab_permis` VALUES ('29', '加班管理', 'overtime:update:show', '员工加班更新界面');
INSERT INTO `tab_permis` VALUES ('30', '加班管理', 'overtime:update:submit', '员工加班更新提交');
INSERT INTO `tab_permis` VALUES ('31', '加班管理', 'overtime:del', '员工加班删除');
INSERT INTO `tab_permis` VALUES ('32', '获取人员', 'overtime:add:find', '根据部门查询员工');

-- ----------------------------
-- Table structure for tab_role
-- ----------------------------
DROP TABLE IF EXISTS `tab_role`;
CREATE TABLE `tab_role` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色标识，如:admin',
  `role_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色表';

-- ----------------------------
-- Records of tab_role
-- ----------------------------
INSERT INTO `tab_role` VALUES ('1', '管理员角色', 'ADMIN', '管理员角色');
INSERT INTO `tab_role` VALUES ('2', '工程师角色', 'EMPLOYEE', '工程师角色');
INSERT INTO `tab_role` VALUES ('3', '部门领导', 'MANAGE', '经理角色');

-- ----------------------------
-- Table structure for tab_role_permis
-- ----------------------------
DROP TABLE IF EXISTS `tab_role_permis`;
CREATE TABLE `tab_role_permis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned NOT NULL COMMENT '角色id',
  `permis_id` bigint(20) unsigned NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色权限表';

-- ----------------------------
-- Records of tab_role_permis
-- ----------------------------
INSERT INTO `tab_role_permis` VALUES ('1', '1', '1');
INSERT INTO `tab_role_permis` VALUES ('2', '1', '2');
INSERT INTO `tab_role_permis` VALUES ('4', '1', '4');
INSERT INTO `tab_role_permis` VALUES ('6', '1', '6');
INSERT INTO `tab_role_permis` VALUES ('8', '1', '8');
INSERT INTO `tab_role_permis` VALUES ('10', '1', '10');
INSERT INTO `tab_role_permis` VALUES ('12', '1', '12');
INSERT INTO `tab_role_permis` VALUES ('14', '1', '3');
INSERT INTO `tab_role_permis` VALUES ('16', '1', '13');
INSERT INTO `tab_role_permis` VALUES ('18', '1', '14');
INSERT INTO `tab_role_permis` VALUES ('20', '1', '15');
INSERT INTO `tab_role_permis` VALUES ('22', '1', '16');
INSERT INTO `tab_role_permis` VALUES ('24', '1', '17');
INSERT INTO `tab_role_permis` VALUES ('26', '1', '18');
INSERT INTO `tab_role_permis` VALUES ('28', '1', '19');
INSERT INTO `tab_role_permis` VALUES ('30', '1', '20');
INSERT INTO `tab_role_permis` VALUES ('32', '1', '21');
INSERT INTO `tab_role_permis` VALUES ('34', '1', '22');
INSERT INTO `tab_role_permis` VALUES ('36', '1', '23');
INSERT INTO `tab_role_permis` VALUES ('38', '1', '24');
INSERT INTO `tab_role_permis` VALUES ('40', '1', '25');
INSERT INTO `tab_role_permis` VALUES ('42', '1', '26');
INSERT INTO `tab_role_permis` VALUES ('44', '1', '27');
INSERT INTO `tab_role_permis` VALUES ('46', '1', '28');
INSERT INTO `tab_role_permis` VALUES ('48', '1', '29');
INSERT INTO `tab_role_permis` VALUES ('50', '1', '30');
INSERT INTO `tab_role_permis` VALUES ('51', '2', '16');
INSERT INTO `tab_role_permis` VALUES ('52', '1', '31');
INSERT INTO `tab_role_permis` VALUES ('53', '2', '17');
INSERT INTO `tab_role_permis` VALUES ('66', '3', '16');
INSERT INTO `tab_role_permis` VALUES ('67', '3', '17');
INSERT INTO `tab_role_permis` VALUES ('68', '3', '3');
INSERT INTO `tab_role_permis` VALUES ('69', '3', '13');
INSERT INTO `tab_role_permis` VALUES ('70', '3', '14');
INSERT INTO `tab_role_permis` VALUES ('71', '3', '15');
INSERT INTO `tab_role_permis` VALUES ('72', '3', '18');
INSERT INTO `tab_role_permis` VALUES ('73', '3', '19');
INSERT INTO `tab_role_permis` VALUES ('74', '3', '24');
INSERT INTO `tab_role_permis` VALUES ('75', '3', '25');
INSERT INTO `tab_role_permis` VALUES ('76', '3', '26');
INSERT INTO `tab_role_permis` VALUES ('77', '3', '27');
INSERT INTO `tab_role_permis` VALUES ('78', '3', '28');
INSERT INTO `tab_role_permis` VALUES ('79', '3', '29');
INSERT INTO `tab_role_permis` VALUES ('80', '3', '30');
INSERT INTO `tab_role_permis` VALUES ('81', '3', '31');
INSERT INTO `tab_role_permis` VALUES ('82', '1', '32');

-- ----------------------------
-- Table structure for tab_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tab_user_role`;
CREATE TABLE `tab_user_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_code` int(10) NOT NULL COMMENT '用户code值',
  `role_id` bigint(20) unsigned NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户角色表';

-- ----------------------------
-- Records of tab_user_role
-- ----------------------------
INSERT INTO `tab_user_role` VALUES ('1', '1011', '2');
INSERT INTO `tab_user_role` VALUES ('2', '1001', '1');
INSERT INTO `tab_user_role` VALUES ('3', '1007', '3');
INSERT INTO `tab_user_role` VALUES ('4', '1008', '3');
INSERT INTO `tab_user_role` VALUES ('5', '1012', '2');
INSERT INTO `tab_user_role` VALUES ('6', '1009', '3');
INSERT INTO `tab_user_role` VALUES ('7', '1010', '3');
INSERT INTO `tab_user_role` VALUES ('8', '1013', '2');
INSERT INTO `tab_user_role` VALUES ('10', '1015', '2');
INSERT INTO `tab_user_role` VALUES ('15', '1018', '3');
INSERT INTO `tab_user_role` VALUES ('16', '1019', '2');
INSERT INTO `tab_user_role` VALUES ('17', '1020', '2');
INSERT INTO `tab_user_role` VALUES ('20', '1023', '1');
INSERT INTO `tab_user_role` VALUES ('32', '1035', '1');
