/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : tduck-v3

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 09/04/2022 22:32:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ac_user
-- ----------------------------
DROP TABLE IF EXISTS `ac_user`;
CREATE TABLE `ac_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `avatar` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `gender` tinyint(1) NOT NULL DEFAULT 0 COMMENT '性别0未知 1男2女',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone_number` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `reg_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '注册渠道',
  `last_login_channel` tinyint(4) NULL DEFAULT NULL COMMENT '最后登录渠道',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录Ip',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '状态',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 202 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ac_user
-- ----------------------------
INSERT INTO `ac_user` VALUES (201, 'Tduck001', 'https://oss-cn-shanghai.aliyuncs.com/t/xxx.jpg', 0, 'test@tduckapp.com', NULL, 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', '1', 2, '2022-04-09 09:13:42', '127.0.0.1', 0, '2020-11-12 11:50:50', '2022-04-09 09:13:42');

-- ----------------------------
-- Table structure for ac_user_authorize
-- ----------------------------
DROP TABLE IF EXISTS `ac_user_authorize`;
CREATE TABLE `ac_user_authorize`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL COMMENT '第三方平台类型',
  `app_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台AppId',
  `open_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台OpenId',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台用户名',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户Id',
  `user_info` json NULL COMMENT '平台用户信息',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '第三方用户授权信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ac_user_authorize
-- ----------------------------

-- ----------------------------
-- Table structure for fm_form_template
-- ----------------------------
DROP TABLE IF EXISTS `fm_form_template`;
CREATE TABLE `fm_form_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '模板Id',
  `key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板唯一标识',
  `cover_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板I名称',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '模板I描述',
  `category_id` int(11) NOT NULL COMMENT '模板类型',
  `scheme` json NULL COMMENT '模板定义',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单模板' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_form_template
-- ----------------------------

-- ----------------------------
-- Table structure for fm_form_template_category
-- ----------------------------
DROP TABLE IF EXISTS `fm_form_template_category`;
CREATE TABLE `fm_form_template_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目模板分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_form_template_category
-- ----------------------------
INSERT INTO `fm_form_template_category` VALUES (1, '教育', 5, '2022-04-09 22:29:09', '2022-04-09 22:29:11');
INSERT INTO `fm_form_template_category` VALUES (2, '生活', 4, '2022-04-09 22:29:18', '2022-04-09 22:29:20');
INSERT INTO `fm_form_template_category` VALUES (3, '疫情', 3, '2022-04-09 22:29:27', '2022-04-09 22:29:27');
INSERT INTO `fm_form_template_category` VALUES (4, '商业', 2, '2022-04-09 22:29:37', '2022-04-09 22:29:37');
INSERT INTO `fm_form_template_category` VALUES (5, '其他', 5, '2022-04-09 22:29:48', '2022-04-09 22:29:48');

-- ----------------------------
-- Table structure for fm_form_theme
-- ----------------------------
DROP TABLE IF EXISTS `fm_form_theme`;
CREATE TABLE `fm_form_theme`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主题名称',
  `style` json NOT NULL COMMENT '主题风格\r\n',
  `head_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头部图片',
  `color` json NOT NULL COMMENT '颜色代码',
  `btns_color` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮颜色',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '项目主题外观模板' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_form_theme
-- ----------------------------

-- ----------------------------
-- Table structure for fm_form_theme_category
-- ----------------------------
DROP TABLE IF EXISTS `fm_form_theme_category`;
CREATE TABLE `fm_form_theme_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主题名称',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单主题分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_form_theme_category
-- ----------------------------

-- ----------------------------
-- Table structure for fm_user_form
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form`;
CREATE TABLE `fm_user_form`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单唯一标识',
  `source_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源Id',
  `source_type` tinyint(4) NULL DEFAULT NULL COMMENT '来源类型',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '表单描述',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '表单类型',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4950 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form
-- ----------------------------
INSERT INTO `fm_user_form` VALUES (4933, '56f39f226b744d3b89bd12e3f07c208b', NULL, 1, '问卷名称', '<p>为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位 用户的宝贵意见，期待您的参与！现在我们就马上开始吧！</p>', 201, NULL, 2, 0, '2022-04-09 22:32:19', '2022-03-10 14:44:57');
INSERT INTO `fm_user_form` VALUES (4941, '77620e15d7d040e2a13dfb879e182b0e', NULL, 1, '问卷名称', '<p>为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位 用户的宝贵意见，期待您的参与！现在我们就马上开始吧！</p>', 201, NULL, 1, 0, '2022-04-09 22:32:21', '2022-04-09 22:32:20');
INSERT INTO `fm_user_form` VALUES (4942, '6310dcf86b0b4c5b819ee546a6bc422d', NULL, 1, '问卷名称', '<p>为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位 用户的宝贵意见，期待您的参与！现在我们就马上开始吧！</p>', 201, NULL, 1, 0, '2022-04-09 22:32:22', '2022-04-09 22:32:21');
INSERT INTO `fm_user_form` VALUES (4943, 'bfbe72d6cfa742c3a304466be356e5c8', NULL, 1, '问卷名称', '<p>为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位 用户的宝贵意见，期待您的参与！现在我们就马上开始吧！</p>', 201, NULL, 1, 0, '2022-04-09 22:32:24', '2022-04-09 22:32:23');
INSERT INTO `fm_user_form` VALUES (4944, '55534086f9d249c6a3bdee7b9e95754e', NULL, 1, '问卷名称', '<p>为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位 用户的宝贵意见，期待您的参与！现在我们就马上开始吧！</p>', 201, NULL, 1, 0, '2022-04-09 22:32:24', '2022-04-09 22:32:24');
INSERT INTO `fm_user_form` VALUES (4945, '0613b7afea7d484cbeab4de43d9077b5', NULL, 1, '问卷名称', '<p>为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位 用户的宝贵意见，期待您的参与！现在我们就马上开始吧！</p>', 201, NULL, 1, 0, '2022-04-09 22:32:25', '2022-04-09 22:32:25');
INSERT INTO `fm_user_form` VALUES (4946, '83737919cc10449cbf5c2bc2c3d7133e', NULL, 1, '问卷名称', '<p>为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位 用户的宝贵意见，期待您的参与！现在我们就马上开始吧！</p>', 201, NULL, 1, 0, '2022-04-09 22:32:26', '2022-04-09 22:32:26');
INSERT INTO `fm_user_form` VALUES (4947, 'eb188f21b64242d8b6db0b9915f25045', NULL, 1, '问卷名称', '<p>为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位 用户的宝贵意见，期待您的参与！现在我们就马上开始吧！</p>', 201, NULL, 1, 0, '2022-04-09 22:32:27', '2022-04-09 22:32:27');
INSERT INTO `fm_user_form` VALUES (4948, 'fb7607396ab840918702bf1ed6efd954', NULL, 1, '问卷名称', '<p>为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位 用户的宝贵意见，期待您的参与！现在我们就马上开始吧！</p>', 201, NULL, 1, 0, '2022-04-09 22:32:29', '2022-04-09 22:32:28');
INSERT INTO `fm_user_form` VALUES (4949, '17b1f15d880941459e116f1977cf72c5', NULL, 1, '问卷名称', '<p>为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位 用户的宝贵意见，期待您的参与！现在我们就马上开始吧！</p>', 201, NULL, 1, 0, '2022-04-09 22:32:30', '2022-04-09 22:32:29');

-- ----------------------------
-- Table structure for fm_user_form_auth
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_auth`;
CREATE TABLE `fm_user_form_auth`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `form_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目key',
  `auth_group_id` bigint(20) NULL DEFAULT NULL COMMENT '授权组id',
  `user_id_list` json NULL COMMENT '用户Id列表',
  `role_id_list` json NULL COMMENT '角色Id列表',
  `dept_id_list` json NULL COMMENT '部门Id列表',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_key`(`form_key`, `auth_group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单授权对象' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form_auth
-- ----------------------------

-- ----------------------------
-- Table structure for fm_user_form_data
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_data`;
CREATE TABLE `fm_user_form_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `form_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单key',
  `serial_number` int(11) NULL DEFAULT NULL COMMENT '序号',
  `original_data` json NULL COMMENT '填写结果',
  `submit_ua` json NULL COMMENT '提交ua',
  `submit_os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交系统',
  `submit_browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交浏览器',
  `submit_request_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求ip',
  `submit_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交地址',
  `complete_time` int(11) NULL DEFAULT NULL COMMENT '完成时间 毫秒',
  `wx_open_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信openId',
  `wx_user_info` json NULL COMMENT '微信用户信息',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project_key`(`form_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单收集数据结果' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form_data
-- ----------------------------

-- ----------------------------
-- Table structure for fm_user_form_item
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_item`;
CREATE TABLE `fm_user_form_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `form_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目key',
  `form_item_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单项Id',
  `type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单项类型 ',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单项标题',
  `is_display_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '展示类型组件',
  `show_label` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示标签',
  `default_value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单项默认值',
  `required` tinyint(1) NOT NULL COMMENT '是否必填',
  `placeholder` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '输入型提示文字',
  `sort` bigint(20) NULL DEFAULT 0 COMMENT '排序',
  `span` int(11) NOT NULL DEFAULT 24 COMMENT '栅格宽度',
  `scheme` json NULL COMMENT '表表单原始JSON',
  `reg_list` json NULL COMMENT '正则表达式 ',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project_key`(`form_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37772 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单项' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form_item
-- ----------------------------
INSERT INTO `fm_user_form_item` VALUES (37769, '56f39f226b744d3b89bd12e3f07c208b', 'input-1646894753370', 'INPUT', '单行文本', 0, 1, NULL, 1, '请输入单行文本', 1, 24, '{\"style\": {\"width\": \"100%\"}, \"config\": {\"tag\": \"t-input\", \"span\": 24, \"label\": \"单行文本\", \"append\": \"\", \"formId\": \"input-1646894753370\", \"prepend\": \"\", \"regList\": [], \"tagIcon\": \"input\", \"dataType\": {\"type\": \"\", \"message\": \"\"}, \"required\": true, \"changeTag\": true, \"renderKey\": \"input-16468947533701646894753370\", \"showLabel\": true}, \"typeId\": \"INPUT\", \"vModel\": \"input-1646894753370\", \"disabled\": false, \"readonly\": false, \"clearable\": true, \"placeholder\": \"请输入单行文本\", \"prefix-icon\": \"\", \"suffix-icon\": \"\", \"show-word-limit\": false}', '[]', '2022-03-10 14:45:54', '2022-03-10 14:45:54');
INSERT INTO `fm_user_form_item` VALUES (37770, '56f39f226b744d3b89bd12e3f07c208b', 'input-1646894754486', 'INPUT', '单行文本', 0, 1, NULL, 1, '请输入单行文本', 65537, 24, '{\"style\": {\"width\": \"100%\"}, \"config\": {\"tag\": \"t-input\", \"span\": 24, \"label\": \"单行文本\", \"append\": \"\", \"formId\": \"input-1646894754486\", \"prepend\": \"\", \"regList\": [], \"tagIcon\": \"input\", \"dataType\": {\"type\": \"\", \"message\": \"\"}, \"required\": true, \"changeTag\": true, \"renderKey\": \"input-16468947544861646894754486\", \"showLabel\": true}, \"typeId\": \"INPUT\", \"vModel\": \"input-1646894754486\", \"disabled\": false, \"readonly\": false, \"clearable\": true, \"placeholder\": \"请输入单行文本\", \"prefix-icon\": \"\", \"suffix-icon\": \"\", \"show-word-limit\": false}', '[]', '2022-03-10 14:45:55', '2022-03-10 14:45:55');
INSERT INTO `fm_user_form_item` VALUES (37771, '2c4f8a4089564485995e1f9201cf51aa', 'input-1649514512631', 'INPUT', '单行文本', 0, 1, NULL, 1, '请输入单行文本', 1, 24, '{\"sort\": 1, \"style\": {\"width\": \"100%\"}, \"config\": {\"tag\": \"t-input\", \"span\": 24, \"label\": \"单行文本\", \"append\": \"\", \"formId\": \"input-1649514512631\", \"prepend\": \"\", \"regList\": [], \"tagIcon\": \"input\", \"dataType\": {\"type\": \"identity\", \"message\": \"请输入正确的身份证号\"}, \"required\": true, \"changeTag\": true, \"renderKey\": \"input-16495145126311649514512631\", \"showLabel\": true}, \"typeId\": \"INPUT\", \"vModel\": \"input-1649514512631\", \"disabled\": false, \"readonly\": false, \"clearable\": true, \"placeholder\": \"请输入单行文本\", \"prefix-icon\": \"\", \"suffix-icon\": \"\", \"show-word-limit\": false}', '[]', '2022-04-09 22:28:36', '2022-04-09 22:28:33');

-- ----------------------------
-- Table structure for fm_user_form_logic
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_logic`;
CREATE TABLE `fm_user_form_logic`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '逻辑Id',
  `form_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单key',
  `scheme` json NULL COMMENT '逻辑定义',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_key`(`form_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目逻辑' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form_logic
-- ----------------------------

-- ----------------------------
-- Table structure for fm_user_form_notify_setting
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_notify_setting`;
CREATE TABLE `fm_user_form_notify_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `form_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单key',
  `is_email_notify` tinyint(1) NULL DEFAULT NULL COMMENT '开启邮件通知',
  `new_write_notify_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新反馈通知邮件列表',
  `is_wx_notify` tinyint(1) NULL DEFAULT NULL COMMENT '开启邮件通知',
  `new_write_notify_wx` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新反馈通知微信列表',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_key`(`form_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单通知设置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form_notify_setting
-- ----------------------------

-- ----------------------------
-- Table structure for fm_user_form_perms_group
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_perms_group`;
CREATE TABLE `fm_user_form_perms_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `form_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单key',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限组名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限组描述',
  `btn_perms` json NOT NULL COMMENT '按钮权限',
  `field_visible_perms` json NOT NULL COMMENT '数据可见权限',
  `field_edit_perms` json NOT NULL COMMENT '数据编辑权限',
  `data_perms` json NOT NULL COMMENT '数据权限',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单权限组' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form_perms_group
-- ----------------------------

-- ----------------------------
-- Table structure for fm_user_form_share_setting
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_share_setting`;
CREATE TABLE `fm_user_form_share_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `form_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单key',
  `is_share_img` tinyint(1) NULL DEFAULT NULL COMMENT '是否设置分享图片',
  `share_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享图片',
  `is_share_title` tinyint(1) NULL DEFAULT NULL COMMENT '是否开启设置标题',
  `share_title_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享标题',
  `is_share_desc` tinyint(1) NULL DEFAULT NULL COMMENT '是否设置分享描述',
  `share_desc_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享描述',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_key`(`form_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单分享设置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form_share_setting
-- ----------------------------

-- ----------------------------
-- Table structure for fm_user_form_submit_setting
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_submit_setting`;
CREATE TABLE `fm_user_form_submit_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `form_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单key',
  `is_prompt_img` tinyint(1) NULL DEFAULT NULL COMMENT '是否显示提示图片',
  `prompt_img_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提示图片地址',
  `is_prompt_text` tinyint(1) NULL DEFAULT NULL COMMENT '是否显示提示文字',
  `prompt_text_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交提示文字内容',
  `is_submit_jump` tinyint(1) NULL DEFAULT NULL COMMENT '是否提交跳转',
  `submit_jump_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交跳转连接',
  `is_public_result` tinyint(1) NULL DEFAULT NULL COMMENT '公开提交结果',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_key`(`form_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表单提交设置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form_submit_setting
-- ----------------------------

-- ----------------------------
-- Table structure for fm_user_form_theme
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_theme`;
CREATE TABLE `fm_user_form_theme`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_key`(`form_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目表单项' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form_theme
-- ----------------------------

-- ----------------------------
-- Table structure for fm_user_form_write_setting
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_write_setting`;
CREATE TABLE `fm_user_form_write_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `form_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单key',
  `is_wx_write` tinyint(1) NULL DEFAULT NULL COMMENT '只在微信填写',
  `is_wx_write_once` tinyint(1) NULL DEFAULT NULL COMMENT '一个微信只能填写一次',
  `is_everyone_write_once` tinyint(1) NULL DEFAULT NULL COMMENT '每人只能填写一次',
  `is_everyone_day_write_once` tinyint(1) NULL DEFAULT NULL COMMENT '每人每天只能填写一次',
  `write_once_prompt_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '填写之后提示',
  `is_record_wx_user` tinyint(1) NULL DEFAULT NULL COMMENT '记录微信用户个人信息',
  `is_timed_collection` tinyint(1) NULL DEFAULT NULL COMMENT '是否定时收集',
  `is_timed_quantitative_collection` tinyint(1) NULL DEFAULT NULL COMMENT '是否定时定量收集',
  `timed_collection_begin_time` datetime NULL DEFAULT NULL COMMENT '定时收集开始时间',
  `timed_collection_end_time` datetime NULL DEFAULT NULL COMMENT '定时收集结束时间',
  `timed_not_enabled_prompt_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定时未启动提示文字',
  `timed_deactivate_prompt_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定时停用会提示文字',
  `timed_quantitative_quantity` int(11) NULL DEFAULT NULL COMMENT '定时定量数量',
  `timed_end_prompt_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定时定量完成提示',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_key`(`form_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单填写设置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form_write_setting
-- ----------------------------

-- ----------------------------
-- Table structure for wx_mp_user
-- ----------------------------
DROP TABLE IF EXISTS `wx_mp_user`;
CREATE TABLE `wx_mp_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
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
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户Id',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `wx_union_id`(`head_img_url`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信公众号用户 ' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wx_mp_user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
