/*
 Navicat MySQL Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50173
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50173
 File Encoding         : 65001

 Date: 29/05/2019 20:08:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tab_menu
-- ----------------------------
DROP TABLE IF EXISTS `tab_menu`;
CREATE TABLE `tab_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `parent_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '上级菜单id',
  `menu_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单形式，0:空菜单，1:有连接菜单',
  `menu_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单调用url',
  `permis_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '菜单与权限对应关系',
  `menu_order` int(10) UNSIGNED NOT NULL COMMENT '菜单排序',
  `menu_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否展现0：展现，1：关闭',
  `menu_icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tab_menu
-- ----------------------------
INSERT INTO `tab_menu` VALUES (1, 0, '0', '个人信息', '#', NULL, 1, '0', 'fa-newspaper-o');
INSERT INTO `tab_menu` VALUES (2, 0, '0', '员工', '#', NULL, 2, '0', NULL);
INSERT INTO `tab_menu` VALUES (3, 0, '0', '部门', '#', NULL, 3, '0', NULL);
INSERT INTO `tab_menu` VALUES (4, 1, '1', '查看个人信息', 'employee/oneself/1/detail.do', NULL, 4, '0', NULL);
INSERT INTO `tab_menu` VALUES (5, 1, '1', '修改个人信息', 'employee/onseself/1/toUpdate.do', NULL, 5, '0', NULL);
INSERT INTO `tab_menu` VALUES (6, 2, '0', '员工管理', '#', NULL, 6, '0', 'fa-user-md');
INSERT INTO `tab_menu` VALUES (7, 2, '0', '考勤管理', '#', NULL, 7, '0', 'fa-calendar');
INSERT INTO `tab_menu` VALUES (8, 2, '0', '请假管理', '#', NULL, 8, '0', 'fa-bookmark');
INSERT INTO `tab_menu` VALUES (9, 3, '0', '部门管理', '#', NULL, 9, '0', 'fa-sitemap');
INSERT INTO `tab_menu` VALUES (10, 6, '1', '在职员工管理', 'employee/listPage.do?pageNo=1', 24, 10, '0', NULL);
INSERT INTO `tab_menu` VALUES (11, 6, '1', '离休人员管理', 'history/retirelistPage.do?pageNo=1', 20, 11, '0', NULL);
INSERT INTO `tab_menu` VALUES (12, 7, '1', '考勤管理', 'attendance/list.do', 19, 12, '0', NULL);
INSERT INTO `tab_menu` VALUES (13, 7, '1', '加班管理', 'overtime/listPage.do?pageNo=1', 3, 13, '0', NULL);
INSERT INTO `tab_menu` VALUES (14, 8, '1', '未批准列表', 'leave/notlist.do', 13, 14, '0', NULL);
INSERT INTO `tab_menu` VALUES (15, 8, '1', '已批准列表', 'leave/yeslist.do', 14, 15, '0', NULL);
INSERT INTO `tab_menu` VALUES (16, 8, '1', '请假列表', 'leave/list.do', 15, 16, '0', NULL);
INSERT INTO `tab_menu` VALUES (17, 9, '1', '部门管理', 'department/listPage.do?pageNo=1', 1, 17, '0', NULL);
INSERT INTO `tab_menu` VALUES (18, 9, '1', '职称管理', 'position/listPage.do?pageNo=1', 2, 18, '0', NULL);
INSERT INTO `tab_menu` VALUES (19, 1, '1', '申请请假', 'leave/toAdd.do', 16, 19, '0', NULL);
INSERT INTO `tab_menu` VALUES (20, 1, '1', '查看请假记录', 'leave/oneself.do?pageNo=1', NULL, 20, '0', NULL);

-- ----------------------------
-- Table structure for tab_permis
-- ----------------------------
DROP TABLE IF EXISTS `tab_permis`;
CREATE TABLE `tab_permis`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `permission_sign` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限标识,程序中判断使用,如\"user:create\"',
  `permission_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tab_permis
-- ----------------------------
INSERT INTO `tab_permis` VALUES (1, '部门管理', 'depart:query', '部门管理查询');
INSERT INTO `tab_permis` VALUES (2, '职称管理', 'position:query', '职称管理查询');
INSERT INTO `tab_permis` VALUES (3, '加班管理', 'overtime:list', '加班管理查询');
INSERT INTO `tab_permis` VALUES (4, '部门管理', 'depart:del', '部门管理删除');
INSERT INTO `tab_permis` VALUES (6, '部门管理', 'depart:add:show', '部门新增展现');
INSERT INTO `tab_permis` VALUES (8, '部门管理', 'depart:add:submit', '部门新增提交');
INSERT INTO `tab_permis` VALUES (10, '部门管理', 'depart:update:show', '部门更新展现');
INSERT INTO `tab_permis` VALUES (12, '部门管理', 'depart:update:submit', '部门更新提交');
INSERT INTO `tab_permis` VALUES (13, '请假管理', 'leave:nolist', '请假管理未批准列表');
INSERT INTO `tab_permis` VALUES (14, '请假管理', 'leave:yeslist', '请假管理已批准列表');
INSERT INTO `tab_permis` VALUES (15, '请假管理', 'leave:list', '请假管理列表');
INSERT INTO `tab_permis` VALUES (16, '请假管理', 'leave:add', '请假管理新增');
INSERT INTO `tab_permis` VALUES (17, '请假管理', 'leave:new', '请假管理新增提交');
INSERT INTO `tab_permis` VALUES (18, '请假管理', 'leave:update', '请假管理更新');
INSERT INTO `tab_permis` VALUES (19, '考勤管理', 'attendance:list', '考勤管理列表');
INSERT INTO `tab_permis` VALUES (20, '离退休管理', 'history:list', '离退休管理列表');
INSERT INTO `tab_permis` VALUES (21, '离退休管理', 'history:detail', '离退休管理明细');
INSERT INTO `tab_permis` VALUES (22, '离退休管理', 'history:update', '离退休管理更新');
INSERT INTO `tab_permis` VALUES (23, '离退休管理', 'history:update:submit', '离退休管理更新提交');
INSERT INTO `tab_permis` VALUES (24, '员工档案管理', 'employee:list', '员工档案管理列表');
INSERT INTO `tab_permis` VALUES (25, '员工调动记录', 'move:list', '员工调动记录列表');
INSERT INTO `tab_permis` VALUES (26, '加班管理', 'overtime:list', '员工加班记录列表');
INSERT INTO `tab_permis` VALUES (27, '加班管理', 'overtime:add:show', '员工加班新增界面');
INSERT INTO `tab_permis` VALUES (28, '加班管理', 'overtime:add:submit', '员工加班新增提交');
INSERT INTO `tab_permis` VALUES (29, '加班管理', 'overtime:update:show', '员工加班更新界面');
INSERT INTO `tab_permis` VALUES (30, '加班管理', 'overtime:update:submit', '员工加班更新提交');
INSERT INTO `tab_permis` VALUES (31, '加班管理', 'overtime:del', '员工加班删除');

-- ----------------------------
-- Table structure for tab_role
-- ----------------------------
DROP TABLE IF EXISTS `tab_role`;
CREATE TABLE `tab_role`  (
  `id` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色标识，如:admin',
  `role_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tab_role
-- ----------------------------
INSERT INTO `tab_role` VALUES (1, '管理员角色', 'ADMIN', '管理员角色');
INSERT INTO `tab_role` VALUES (2, '工程师角色', 'EMPLOYEE', '工程师角色');

-- ----------------------------
-- Table structure for tab_role_permis
-- ----------------------------
DROP TABLE IF EXISTS `tab_role_permis`;
CREATE TABLE `tab_role_permis`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) UNSIGNED NOT NULL COMMENT '角色id',
  `permis_id` bigint(20) UNSIGNED NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tab_role_permis
-- ----------------------------
INSERT INTO `tab_role_permis` VALUES (1, 1, 1);
INSERT INTO `tab_role_permis` VALUES (2, 1, 2);
INSERT INTO `tab_role_permis` VALUES (4, 1, 4);
INSERT INTO `tab_role_permis` VALUES (6, 1, 6);
INSERT INTO `tab_role_permis` VALUES (8, 1, 8);
INSERT INTO `tab_role_permis` VALUES (10, 1, 10);
INSERT INTO `tab_role_permis` VALUES (12, 1, 12);
INSERT INTO `tab_role_permis` VALUES (14, 1, 3);
INSERT INTO `tab_role_permis` VALUES (16, 1, 13);
INSERT INTO `tab_role_permis` VALUES (18, 1, 14);
INSERT INTO `tab_role_permis` VALUES (20, 1, 15);
INSERT INTO `tab_role_permis` VALUES (22, 1, 16);
INSERT INTO `tab_role_permis` VALUES (24, 1, 17);
INSERT INTO `tab_role_permis` VALUES (26, 1, 18);
INSERT INTO `tab_role_permis` VALUES (28, 1, 19);
INSERT INTO `tab_role_permis` VALUES (30, 1, 20);
INSERT INTO `tab_role_permis` VALUES (32, 1, 21);
INSERT INTO `tab_role_permis` VALUES (34, 1, 22);
INSERT INTO `tab_role_permis` VALUES (36, 1, 23);
INSERT INTO `tab_role_permis` VALUES (38, 1, 24);
INSERT INTO `tab_role_permis` VALUES (40, 1, 25);
INSERT INTO `tab_role_permis` VALUES (42, 1, 26);
INSERT INTO `tab_role_permis` VALUES (44, 1, 27);
INSERT INTO `tab_role_permis` VALUES (46, 1, 28);
INSERT INTO `tab_role_permis` VALUES (48, 1, 29);
INSERT INTO `tab_role_permis` VALUES (50, 1, 30);
INSERT INTO `tab_role_permis` VALUES (51, 2, 16);
INSERT INTO `tab_role_permis` VALUES (52, 1, 31);

-- ----------------------------
-- Table structure for tab_user_permis
-- ----------------------------
DROP TABLE IF EXISTS `tab_user_permis`;
CREATE TABLE `tab_user_permis`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户code',
  `permis_id` bigint(20) UNSIGNED NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tab_user_permis
-- ----------------------------
INSERT INTO `tab_user_permis` VALUES (1, '1011', 3);
INSERT INTO `tab_user_permis` VALUES (2, '1001', 2);

-- ----------------------------
-- Table structure for tab_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tab_user_role`;
CREATE TABLE `tab_user_role`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户code值',
  `role_id` bigint(20) UNSIGNED NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tab_user_role
-- ----------------------------
INSERT INTO `tab_user_role` VALUES (1, '1011', 2);
INSERT INTO `tab_user_role` VALUES (2, '1001', 1);
INSERT INTO `tab_user_role` VALUES (3, '1007', 2);

SET FOREIGN_KEY_CHECKS = 1;
