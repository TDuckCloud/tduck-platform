/*
 Navicat Premium Data Transfer

 Source Server         : tduck
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : sh-cdb-jl4inxc4.sql.tencentcdb.com:59495
 Source Schema         : tduck-v3

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 17/01/2022 10:30:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ac_user
-- ----------------------------
DROP TABLE IF EXISTS `ac_user`;
CREATE TABLE `ac_user`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `avatar` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `gender` tinyint(1) NOT NULL DEFAULT 0 COMMENT '性别0未知 1男2女',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone_number` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `reg_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '注册渠道',
  `last_login_channel` tinyint NULL DEFAULT NULL COMMENT '最后登录渠道',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录Ip',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '状态',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 202 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

INSERT INTO `ac_user`
VALUES (201, 'Tduck001', 'https://oss.tduckcloud.com/logo-blue.png', 0, 'test@tduck.com', NULL,
        'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', '1', 2, '2022-01-10 11:00:20', '127.0.0.1',
        0, '2020-11-12 11:50:50', '2022-01-10 11:00:20');
INSERT INTO `ac_user`
VALUES (202, 'Tduck002', 'https://oss.tduckcloud.com/logo-blue.png', 0, 'test@tduckapp.com', NULL,
        'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', '1', 2, '2022-01-10 11:00:20', '127.0.0.1',
        0, '2020-11-12 11:50:50', '2022-01-10 11:00:20');

-- ----------------------------
-- Table structure for ac_user_authorize
-- ----------------------------
DROP TABLE IF EXISTS `ac_user_authorize`;
CREATE TABLE `ac_user_authorize`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL COMMENT '第三方平台类型',
  `app_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台AppId',
  `open_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台OpenId',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台用户名',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户Id',
  `user_info` json NULL COMMENT '平台用户信息',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '第三方用户授权信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fm_form_template
-- ----------------------------
DROP TABLE IF EXISTS `fm_form_template`;
CREATE TABLE `fm_form_template`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '模板Id',
  `key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板唯一标识',
  `cover_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板I名称',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '模板I描述',
  `category_id` int NOT NULL COMMENT '模板类型',
  `scheme` json NULL COMMENT '模板定义',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3327 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fm_form_template_category
-- ----------------------------
DROP TABLE IF EXISTS `fm_form_template_category`;
CREATE TABLE `fm_form_template_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目模板分类' ROW_FORMAT = Dynamic;

INSERT INTO `fm_form_template_category` (`id`, `name`, `sort`, `update_time`, `create_time`) VALUES (1, '调查', 1, '2021-01-06 10:18:48', '2021-01-06 10:18:48');
INSERT INTO `fm_form_template_category` (`id`, `name`, `sort`, `update_time`, `create_time`) VALUES (2, '测试', 2, '2021-01-06 10:18:59', '2021-01-06 10:18:59');
INSERT INTO `fm_form_template_category` (`id`, `name`, `sort`, `update_time`, `create_time`) VALUES (3, '满意度', 3, '2021-01-06 10:19:06', '2021-01-06 10:19:06');


-- ----------------------------
-- Table structure for fm_form_theme
-- ----------------------------
DROP TABLE IF EXISTS `fm_form_theme`;
CREATE TABLE `fm_form_theme`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主题名称',
  `style` json NOT NULL COMMENT '主题风格\r\n',
  `head_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头部图片',
  `color` json NOT NULL COMMENT '颜色代码',
  `btns_color` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮颜色',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 227 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '项目主题外观模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fm_form_theme_category
-- ----------------------------
DROP TABLE IF EXISTS `fm_form_theme_category`;
CREATE TABLE `fm_form_theme_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主题名称',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单主题分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fm_user_form
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form`;
CREATE TABLE `fm_user_form`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单唯一标识',
  `source_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源Id',
  `source_type` tinyint NULL DEFAULT NULL COMMENT '来源类型',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '表单描述',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `type` tinyint NULL DEFAULT NULL COMMENT '表单类型',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4933 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fm_user_form_auth
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_auth`;
CREATE TABLE `fm_user_form_auth`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目key',
  `auth_group_id` bigint NULL DEFAULT NULL COMMENT '授权组id',
  `user_id_list` json NULL COMMENT '用户Id列表',
  `role_id_list` json NULL COMMENT '角色Id列表',
  `dept_id_list` json NULL COMMENT '部门Id列表',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_key`(`form_key`, `auth_group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单授权对象' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fm_user_form_data
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_data`;
CREATE TABLE `fm_user_form_data`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单key',
  `serial_number` int NULL DEFAULT NULL COMMENT '序号',
  `original_data` json NULL COMMENT '填写结果',
  `submit_ua` json NULL COMMENT '提交ua',
  `submit_os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交系统',
  `submit_browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交浏览器',
  `submit_request_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求ip',
  `submit_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交地址',
  `complete_time` int NULL DEFAULT NULL COMMENT '完成时间 毫秒',
  `wx_open_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信openId',
  `wx_user_info` json NULL COMMENT '微信用户信息',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project_key`(`form_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 174253 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单收集数据结果' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fm_user_form_item
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_item`;
CREATE TABLE `fm_user_form_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目key',
  `form_item_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单项Id',
  `type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单项类型 ',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单项标题',
  `is_display_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '展示类型组件',
  `show_label` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示标签',
  `default_value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单项默认值',
  `required` tinyint(1) NOT NULL COMMENT '是否必填',
  `placeholder` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '输入型提示文字',
  `sort` bigint NULL DEFAULT 0 COMMENT '排序',
  `span` int NOT NULL DEFAULT 24 COMMENT '栅格宽度',
  `scheme` json NULL COMMENT '表表单原始JSON',
  `reg_list` json NULL COMMENT '正则表达式 ',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project_key`(`form_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37769 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fm_user_form_logic
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_logic`;
CREATE TABLE `fm_user_form_logic`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '逻辑Id',
  `form_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单key',
  `scheme` json NULL COMMENT '逻辑定义',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_key`(`form_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 858 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目逻辑' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fm_user_form_notify_setting
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_notify_setting`;
CREATE TABLE `fm_user_form_notify_setting`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单key',
  `is_email_notify` tinyint(1) NULL DEFAULT NULL COMMENT '开启邮件通知',
  `new_write_notify_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新反馈通知邮件列表',
  `is_wx_notify` tinyint(1) NULL DEFAULT NULL COMMENT '开启邮件通知',
  `new_write_notify_wx` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新反馈通知微信列表',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_key`(`form_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 464 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单通知设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fm_user_form_perms_group
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_perms_group`;
CREATE TABLE `fm_user_form_perms_group`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单key',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限组名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限组描述',
  `btn_perms` json NOT NULL COMMENT '按钮权限',
  `field_visible_perms` json NOT NULL COMMENT '数据可见权限',
  `field_edit_perms` json NOT NULL COMMENT '数据编辑权限',
  `data_perms` json NOT NULL COMMENT '数据权限',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单权限组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fm_user_form_share_setting
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_share_setting`;
CREATE TABLE `fm_user_form_share_setting`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单key',
  `is_share_img` tinyint(1) NULL DEFAULT NULL COMMENT '是否设置分享图片',
  `share_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享图片',
  `is_share_title` tinyint(1) NULL DEFAULT NULL COMMENT '是否开启设置标题',
  `share_title_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享标题',
  `is_share_desc` tinyint(1) NULL DEFAULT NULL COMMENT '是否设置分享描述',
  `share_desc_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享描述',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_key`(`form_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单分享设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fm_user_form_submit_setting
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_submit_setting`;
CREATE TABLE `fm_user_form_submit_setting`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单key',
  `is_prompt_img` tinyint(1) NULL DEFAULT NULL COMMENT '是否显示提示图片',
  `prompt_img_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提示图片地址',
  `is_prompt_text` tinyint(1) NULL DEFAULT NULL COMMENT '是否显示提示文字',
  `prompt_text_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交提示文字内容',
  `is_submit_jump` tinyint(1) NULL DEFAULT NULL COMMENT '是否提交跳转',
  `submit_jump_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交跳转连接',
  `is_public_result` tinyint(1) NULL DEFAULT NULL COMMENT '公开提交结果',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_key`(`form_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表单提交设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fm_user_form_theme
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_theme`;
CREATE TABLE `fm_user_form_theme`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单key',
  `submit_btn_text` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交按钮文字',
  `logo_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'logo图片',
  `logo_position` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'logo位置',
  `background_color` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '背景颜色',
  `background_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '背景图片',
  `show_title` tinyint(1) NULL DEFAULT 1 COMMENT '是否显示标题',
  `show_describe` tinyint(1) NULL DEFAULT 1 COMMENT '是否显示描述语',
  `btns_color` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮颜色',
  `show_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '显示序号',
  `head_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头部图片',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_key`(`form_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1160 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目表单项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fm_user_form_write_setting
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_write_setting`;
CREATE TABLE `fm_user_form_write_setting`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单key',
  `is_wx_write` tinyint(1) NULL DEFAULT NULL COMMENT '只在微信填写',
  `is_wx_write_once` tinyint(1) NULL DEFAULT NULL COMMENT '一个微信只能填写一次',
  `is_everyone_write_once` tinyint(1) NULL DEFAULT NULL COMMENT '每人只能填写一次',
  `is_everyone_day_write_once` tinyint(1) NULL DEFAULT NULL COMMENT '每人每天只能填写一次',
  `write_once_prompt_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '填写之后提示',
  `is_record_wx_user` tinyint(1) NULL DEFAULT NULL COMMENT '记录微信用户个人信息',
  `is_timed_collection` tinyint(1) NULL DEFAULT NULL COMMENT '是否定时收集',
  `is_timed_quantitative_collection` tinyint(1) NULL DEFAULT NULL COMMENT '是否定时定量收集',
  `timed_collection_begin_time` datetime(0) NULL DEFAULT NULL COMMENT '定时收集开始时间',
  `timed_collection_end_time` datetime(0) NULL DEFAULT NULL COMMENT '定时收集结束时间',
  `timed_not_enabled_prompt_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定时未启动提示文字',
  `timed_deactivate_prompt_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定时停用会提示文字',
  `timed_quantitative_quantity` int NULL DEFAULT NULL COMMENT '定时定量数量',
  `timed_end_prompt_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定时定量完成提示',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_key`(`form_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单填写设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wx_mp_user
-- ----------------------------
DROP TABLE IF EXISTS `wx_mp_user`;
CREATE TABLE `wx_mp_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `appid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公众号AppId',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(1) NULL DEFAULT NULL COMMENT '性别',
  `head_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头像',
  `union_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `open_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家',
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
  `is_subscribe` tinyint(1) NULL DEFAULT 1 COMMENT '是否关注',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户Id',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `wx_union_id`(`head_img_url`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信公众号用户 ' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
