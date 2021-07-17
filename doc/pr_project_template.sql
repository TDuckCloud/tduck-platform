/*
 Navicat Premium Data Transfer

 Source Server         : ivo1
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : sh-cynosdbmysql-grp-e911sges.sql.tencentcdb.com:29062
 Source Schema         : tduck

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 06/07/2021 13:45:03
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pr_project_template
-- ----------------------------
DROP TABLE IF EXISTS `pr_project_template`;
CREATE TABLE `pr_project_template`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT,
    `key`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '模板唯一标识',
    `cover_img`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图',
    `name`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目名称',
    `describe`    text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '项目描述',
    `like_count`  int(10) NULL DEFAULT 0 COMMENT '喜欢数',
    `category_id` int(2) NOT NULL COMMENT '项目类型',
    `status`      tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态',
    `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) COMMENT '更新时间',
    `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `code`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pr_project_template
-- ----------------------------
INSERT INTO `pr_project_template`
VALUES (1, 'd18614f57f994db894831181b5642bc4', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '社交网站满意度问卷模板',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 3, 0, '2021-01-11 13:58:07',
        '2021-01-11 13:58:07');
INSERT INTO `pr_project_template`
VALUES (2, '19b78ef7fb334a79a0f2d1f160e3a328', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '购物网用户满意度调查',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 3, 0, '2021-01-11 13:58:07',
        '2021-01-11 13:58:07');
INSERT INTO `pr_project_template`
VALUES (3, 'e0bc792b030b483684894e09a774f092', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '数码家电类产品满意度模板',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 3, 0, '2021-01-11 13:58:08',
        '2021-01-11 13:58:08');
INSERT INTO `pr_project_template`
VALUES (4, 'fbc0a3a6ad7441b28ebf79a7730fab5f', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '餐饮类团购用户满意度问卷模板',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 3, 0, '2021-01-11 13:58:08',
        '2021-01-11 13:58:08');
INSERT INTO `pr_project_template`
VALUES (5, '1ed08c925d374b0d9747932b6606fd04', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '团购网站用户满意度问卷模板',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 3, 0, '2021-01-11 13:58:09',
        '2021-01-11 13:58:09');
INSERT INTO `pr_project_template`
VALUES (6, '1b4698a9e5bf4f80b6547f3153a53af0', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '玩具网站用户满意度问卷模板',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 3, 0, '2021-01-11 13:58:09',
        '2021-01-11 13:58:09');
INSERT INTO `pr_project_template`
VALUES (7, '124ee8c12c9a4de28d2b691549a8bbd3', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', 'PC端游、页游满意度问卷模板',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 3, 0, '2021-01-11 13:58:10',
        '2021-01-11 13:58:10');
INSERT INTO `pr_project_template`
VALUES (8, '9698626c0c0e4a97a0c1f632984a18b9', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '员工满意度问卷模板',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 3, 0, '2021-01-11 13:58:10',
        '2021-01-11 13:58:10');
INSERT INTO `pr_project_template`
VALUES (9, '9ebed213fedd4dad9e66879b7cb7a896', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '手游满意度问卷',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 3, 0, '2021-01-11 13:58:11',
        '2021-01-11 13:58:11');
INSERT INTO `pr_project_template`
VALUES (10, 'f688e0d9d74d4eb0967c678f6684e54f', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '消费者满意度',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 3, 0, '2021-01-11 13:58:11',
        '2021-01-11 13:58:11');
INSERT INTO `pr_project_template`
VALUES (11, '302714b9b4984fefad81d386cf332f3e', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '国际标准智商测试问卷',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 2, 0, '2021-01-11 13:58:20',
        '2021-01-11 13:58:20');
INSERT INTO `pr_project_template`
VALUES (12, 'd2d26428ea0847a89af1fb817e648db0', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '情商测试问卷',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 2, 0, '2021-01-11 13:58:20',
        '2021-01-11 13:58:20');
INSERT INTO `pr_project_template`
VALUES (13, '9fb633d6da764926a499a68231b6f9cd', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '健康状况调查问卷',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:31',
        '2021-01-11 13:58:31');
INSERT INTO `pr_project_template`
VALUES (14, '2d2dc94faa1a48ae9f81d0ae194e94fc', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '学生身体健康状况调查',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:31',
        '2021-01-11 13:58:31');
INSERT INTO `pr_project_template`
VALUES (15, 'e13d66dcd329435ca7b539e4f1a4183b', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '教师身体健康状况调查',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:32',
        '2021-01-11 13:58:32');
INSERT INTO `pr_project_template`
VALUES (16, '2bb3c0d0fd86488bb146a1fc6b9f5dc1', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '中小学师生健康调查表',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:32',
        '2021-01-11 13:58:32');
INSERT INTO `pr_project_template`
VALUES (17, '036dcd3d099e42f7b473eb9cdf37231b', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', 'xx市中小学师生健康调查表',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:33',
        '2021-01-11 13:58:33');
INSERT INTO `pr_project_template`
VALUES (18, '7b9680452aed4dfc985f4493ce8fd039', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '网购消费者的行为习惯调查',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:33',
        '2021-01-11 13:58:33');
INSERT INTO `pr_project_template`
VALUES (19, '4c314ed6ef51414aaaf04051efbc438d', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '圣诞狂欢市场调查问卷',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:33',
        '2021-01-11 13:58:33');
INSERT INTO `pr_project_template`
VALUES (20, 'e85d66e7f94346b9b9d4510a6fa79c7b', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n',
        '旅游电子商务-消费心理与消费行为调查问卷', '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0,
        '2021-01-11 13:58:33', '2021-01-11 13:58:33');
INSERT INTO `pr_project_template`
VALUES (21, '786b9cad188e47d49b41ab39a7d45f4d', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '旅游网站用户小调查',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:34',
        '2021-01-11 13:58:34');
INSERT INTO `pr_project_template`
VALUES (22, '9dbf35a35f7a4aeb849c4715cea996e2', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n',
        '“双十一”电商促销行为对消费者的影响', '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0,
        '2021-01-11 13:58:34', '2021-01-11 13:58:34');
INSERT INTO `pr_project_template`
VALUES (23, '24f0b168b6724534ba36c21087c39778', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n',
        '“双十一”电商促销活动的参与情况调查', '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0,
        '2021-01-11 13:58:35', '2021-01-11 13:58:35');
INSERT INTO `pr_project_template`
VALUES (24, '438d94a1c0c6426d85f9df17977a78a1', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '网购用户的消费者维权意识',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:35',
        '2021-01-11 13:58:35');
INSERT INTO `pr_project_template`
VALUES (25, 'e4d62cfe7eda413a8538f524b4f2156f', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '网络商家的代运营需求调研',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:35',
        '2021-01-11 13:58:35');
INSERT INTO `pr_project_template`
VALUES (26, '73eb5cad65b84e4ea60a116e3786d487', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n',
        '点餐App(手机软件)使用需求', '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0,
        '2021-01-11 13:58:35', '2021-01-11 13:58:35');
INSERT INTO `pr_project_template`
VALUES (27, '9eb7a3477b8843198d24bad37587731b', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '服务需求',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:36',
        '2021-01-11 13:58:36');
INSERT INTO `pr_project_template`
VALUES (28, '3ff5045669a24a229e384966854c2c03', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '服务质量',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:36',
        '2021-01-11 13:58:36');
INSERT INTO `pr_project_template`
VALUES (29, '546151677b724bf7ac48dbbce1f3a557', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n',
        '商家自助在线外卖业务的需求调查', '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0,
        '2021-01-11 13:58:36', '2021-01-11 13:58:36');
INSERT INTO `pr_project_template`
VALUES (30, 'a6e9aeb9eb964e6190145e963a977f6c', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '外出就餐调查',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:36',
        '2021-01-11 13:58:36');
INSERT INTO `pr_project_template`
VALUES (31, 'c73206f879e4468ba6a3bc58a8606501', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '外卖需求',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:37',
        '2021-01-11 13:58:37');
INSERT INTO `pr_project_template`
VALUES (32, 'ac30ab9f3f6943679910e9003d7003ac', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '微信营销的使用分析[店长版]',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:37',
        '2021-01-11 13:58:37');
INSERT INTO `pr_project_template`
VALUES (33, '101a734bef0f404dbd6bd4010d39211d', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '微信营销的使用分析[顾客版]',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:37',
        '2021-01-11 13:58:37');
INSERT INTO `pr_project_template`
VALUES (34, 'a088854a92c34b4d87f3277da045c655', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '消费市场调查',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:38',
        '2021-01-11 13:58:38');
INSERT INTO `pr_project_template`
VALUES (35, '594fbe0cc6ae47e895435f327bfc5c8d', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '影响团购评价的因素分析',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:38',
        '2021-01-11 13:58:38');
INSERT INTO `pr_project_template`
VALUES (36, 'a629343e537645c997c8c040de2c2f92', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '主题餐厅',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:39',
        '2021-01-11 13:58:39');
INSERT INTO `pr_project_template`
VALUES (37, '4f8189866d6f43d9b1afd78c93922a38', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '充值返利',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:39',
        '2021-01-11 13:58:39');
INSERT INTO `pr_project_template`
VALUES (38, '1f09399d87394dec94a2f3a82d3c81f3', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '手游视频需求调查',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:39',
        '2021-01-11 13:58:39');
INSERT INTO `pr_project_template`
VALUES (39, 'c206940b3bc3468bb332eaf0bd56d06d', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '手游用户偏好',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:40',
        '2021-01-11 13:58:40');
INSERT INTO `pr_project_template`
VALUES (40, '8801cdbb5c394c599437d8c37da25903', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '知名度美誉度调查',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:40',
        '2021-01-11 13:58:40');
INSERT INTO `pr_project_template`
VALUES (41, '03175b0817564a5b90c031cafcdbd275', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', 'XX公众号粉丝调查',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:40',
        '2021-01-11 13:58:40');
INSERT INTO `pr_project_template`
VALUES (42, 'dffa146278884eec9298aaa6b2d3840f', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n',
        '学校师生寒假外出及身体情况统计表', '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0,
        '2021-01-11 13:58:41', '2021-01-11 13:58:41');
INSERT INTO `pr_project_template`
VALUES (43, '7847f6b39e8e41c08f9bb2496fe08387', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '新冠肺炎疫情防控信息表',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:41',
        '2021-01-11 13:58:41');
INSERT INTO `pr_project_template`
VALUES (44, 'ba5bdd3c7fc94ecf9170fe97cd790d1d', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '师生健康问卷',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:41',
        '2021-01-11 13:58:41');
INSERT INTO `pr_project_template`
VALUES (45, '69e2281f0094407f94d8a9b4f3d75508', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '健康状况日常上报',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:42',
        '2021-01-11 13:58:42');
INSERT INTO `pr_project_template`
VALUES (46, '335b69a4bfe44794a62a02de23f27c18', 'https://i.niupic.com/images/2021/01/08/99d0.png\r\n', '学生返校前健康监测上报',
        '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', NULL, 1, 0, '2021-01-11 13:58:42',
        '2021-01-11 13:58:42');

-- ----------------------------
-- Table structure for pr_project_template_category
-- ----------------------------
DROP TABLE IF EXISTS `pr_project_template_category`;
CREATE TABLE `pr_project_template_category`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT,
    `name`        varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主题名称',
    `sort`        int(11) NULL DEFAULT NULL COMMENT '排序',
    `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) COMMENT '更新时间',
    `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目模板分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pr_project_template_category
-- ----------------------------
INSERT INTO `pr_project_template_category`
VALUES (1, '调查', 1, '2021-01-06 10:18:48', '2021-01-06 10:18:48');
INSERT INTO `pr_project_template_category`
VALUES (2, '测试', 2, '2021-01-06 10:18:59', '2021-01-06 10:18:59');
INSERT INTO `pr_project_template_category`
VALUES (3, '满意度', 3, '2021-01-06 10:19:06', '2021-01-06 10:19:06');
INSERT INTO `pr_project_template_category`
VALUES (4, '其他', 0, '2021-06-21 22:12:36', '2021-06-21 22:12:36');

-- ----------------------------
-- Table structure for pr_project_template_item
-- ----------------------------
DROP TABLE IF EXISTS `pr_project_template_item`;
CREATE TABLE `pr_project_template_item`
(
    `id`              bigint(20) NOT NULL AUTO_INCREMENT,
    `project_key`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目key',
    `form_item_id`    varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单项Id',
    `type`            varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '表单项类型 ',
    `label`           varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单项标题',
    `show_label`      tinyint(1) NOT NULL COMMENT '是否显示标签',
    `default_value`   json NULL COMMENT '表单项默认值',
    `required`        tinyint(1) NOT NULL COMMENT '是否必填',
    `placeholder`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '输入型提示文字',
    `sort`            bigint(20) NULL DEFAULT 0 COMMENT '排序',
    `span`            int(10) NOT NULL DEFAULT 24 COMMENT '栅格宽度',
    `expand`          json NULL COMMENT '扩展字段 表单项独有字段',
    `reg_list`        json NULL COMMENT '正则表达式 ',
    `update_time`     datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) COMMENT '更新时间',
    `create_time`     datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) COMMENT '创建时间',
    `is_display_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '展示类型组件',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX             `project_key`(`project_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1048 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目表单项' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pr_project_template_item
-- ----------------------------
INSERT INTO `pr_project_template_item`
VALUES (1, 'd18614f57f994db894831181b5642bc4', '100', 'RADIO', '您是否使用过xx社交网站？', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:07',
        '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (2, 'd18614f57f994db894831181b5642bc4', '101', 'RADIO', '您使用xx社交网站的目的是？', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"方便与朋友联系，分享乐趣\", \"value\": 1}, {\"label\": \"展现自己多彩的生活\", \"value\": 2}, {\"label\": \"有机会结交更多的朋友\", \"value\": 3}, {\"label\": \"寻找知趣相投的群体\", \"value\": 4}, {\"label\": \"获取生活信息，扩展视野受\", \"value\": 5}, {\"label\": \"各种有趣的游戏、应用所吸引\", \"value\": 6}, {\"label\": \"关注名人动态\", \"value\": 7}, {\"label\": \"工作需要\", \"value\": 8}, {\"label\": \"打发时间\", \"value\": 9}, {\"label\": \"其他\", \"value\": 10}]}',
        NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (3, 'd18614f57f994db894831181b5642bc4', '102', 'RADIO', '您在XX社交网站上主要做什么？', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"写日志、发照片、微博/说说等\", \"value\": 1}, {\"label\": \"分享新鲜事\", \"value\": 2}, {\"label\": \"留言，跟帖\", \"value\": 3}, {\"label\": \"玩游戏、应用\", \"value\": 4}, {\"label\": \"做测试\", \"value\": 5}, {\"label\": \"购买虚拟物品，如礼物，外观等\", \"value\": 6}, {\"label\": \"关注时事及热点新闻\", \"value\": 7}, {\"label\": \"与好友即时聊天\", \"value\": 8}, {\"label\": \"随便浏览，打发时间\", \"value\": 9}, {\"label\": \"其他\", \"value\": 10}]}',
        NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (4, 'd18614f57f994db894831181b5642bc4', '103', 'RADIO', '您使用XX社交网站的频率是？', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"几乎每天都会使用\", \"value\": 1}, {\"label\": \"每个星期都会使用\", \"value\": 2}, {\"label\": \"每个月都会使用\", \"value\": 3}, {\"label\": \"很少使用\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (5, 'd18614f57f994db894831181b5642bc4', '104', 'RADIO', '到目前为止，您使用XX社交网站有多久了？', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"不到1个月\", \"value\": 1}, {\"label\": \"1-3个月（含3个月）\", \"value\": 2}, {\"label\": \"3-6个月（含6个月）\", \"value\": 3}, {\"label\": \"6-12个月（含12个月）\", \"value\": 4}, {\"label\": \"1-2年（含2年）\", \"value\": 5}, {\"label\": \"2年以上\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (6, 'd18614f57f994db894831181b5642bc4', '100', 'RADIO', '您认为对于XX社交网站而言，哪些因素比较重要？', 1, NULL, 1, NULL, 393216, 24,
        '{
          \"options\": [{\"label\": \"界面布局好、设计美观\", \"value\": 1}, {\"label\": \"操作容易上手、能快速找到想要的功能等\", \"value\": 2}, {\"label\": \"我想要的功能基本都有、能保护隐私和安全等\", \"value\": 3}, {\"label\": \"能随时联系好友、方便交到新朋友等\", \"value\": 4}, {\"label\": \"内容丰富全面、质量高、能看到感兴趣的内容等\", \"value\": 5}, {\"label\": \"打开速度快、不容易出错或者崩溃等\", \"value\": 6}, {\"label\": \"其他\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (7, 'd18614f57f994db894831181b5642bc4', '101', 'INPUT', '总的来说，您对XX社交网站的满意度是？', 1, NULL, 1, NULL, 458752, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (8, 'd18614f57f994db894831181b5642bc4', '102', 'RATE', '您是否愿意继续使用XX社交网站？', 1, NULL, 1, NULL, 524288, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (9, 'd18614f57f994db894831181b5642bc4', '103', 'RATE', '您是否愿意推荐身边的人（亲朋好友）使用XX社交网站？', 1, NULL, 1, NULL, 589824,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (10, 'd18614f57f994db894831181b5642bc4', '104', 'RATE', '您对xx社交网站“网站界面布局合理设计美观”的同意程度是？', 1, NULL, 1, NULL,
        655360, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (11, 'd18614f57f994db894831181b5642bc4', '105', 'RATE', '您对xx社交网站“网站内容更新速度快”的同意程度是？', 1, NULL, 1, NULL, 720896,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (12, 'd18614f57f994db894831181b5642bc4', '106', 'RATE', '您对xx社交网站“网站内容更新速度快”的同意程度是？', 1, NULL, 1, NULL, 786432,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (13, 'd18614f57f994db894831181b5642bc4', '107', 'RATE', '您对xx社交网站“网站内容丰富”的同意程度是？', 1, NULL, 1, NULL, 851968, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (14, 'd18614f57f994db894831181b5642bc4', '108', 'RATE', '您对xx社交网站“能获得我需要的资讯”的同意程度是？', 1, NULL, 1, NULL, 917504,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (15, 'd18614f57f994db894831181b5642bc4', '109', 'RATE', '您对xx社交网站“大家的交流和互动是友好、活跃的”的同意程度是？', 1, NULL, 1, NULL,
        983040, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (16, 'd18614f57f994db894831181b5642bc4', '110', 'RATE', '您对xx社交网站“能随时联系好友”的同意程度是？', 1, NULL, 1, NULL, 1048576,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (17, 'd18614f57f994db894831181b5642bc4', '111', 'RATE', '您对xx社交网站“方便交到新朋友”的同意程度是？', 1, NULL, 1, NULL, 1114112,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (18, 'd18614f57f994db894831181b5642bc4', '112', 'RATE', '您对xx社交网站“各种活动、应用有我感兴趣的”的同意程度是？', 1, NULL, 1, NULL,
        1179648, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (19, 'd18614f57f994db894831181b5642bc4', '113', 'RATE', '您对xx社交网站“网站功能丰富、实用”的同意程度是？', 1, NULL, 1, NULL, 1245184,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (20, 'd18614f57f994db894831181b5642bc4', '114', 'RATE', '您对xx社交网站“网站操作流程方便快捷”的同意程度是？', 1, NULL, 1, NULL, 1310720,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (21, 'd18614f57f994db894831181b5642bc4', '115', 'RATE', '您对xx社交网站“安全，不会泄露我的隐私”的同意程度是？', 1, NULL, 1, NULL,
        1376256, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (22, 'd18614f57f994db894831181b5642bc4', '116', 'RATE', '您对xx社交网站“当使用遇到困惑时，网页会有提示和帮助”的同意程度是？', 1, NULL, 1, NULL,
        1441792, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (23, 'd18614f57f994db894831181b5642bc4', '117', 'RATE', '您对xx社交网站“网站打开速度快”的同意程度是？', 1, NULL, 1, NULL, 1507328,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (24, 'd18614f57f994db894831181b5642bc4', '118', 'RATE', '您对xx社交网站“网站运行稳定，很少出错”的同意程度是？', 1, NULL, 1, NULL,
        1572864, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (25, 'd18614f57f994db894831181b5642bc4', '100', 'RADIO', '除xx网站以外，您还使用过以下哪些社交网站？', 1, NULL, 1, NULL, 1638400, 24,
        '{
          \"options\": [{\"label\": \"新浪微博\", \"value\": 1}, {\"label\": \"人人网\", \"value\": 2}, {\"label\": \"豆瓣\", \"value\": 3}, {\"label\": \"腾讯微博\", \"value\": 4}, {\"label\": \"QQ空间\", \"value\": 5}, {\"label\": \"开心网\", \"value\": 6}, {\"label\": \"51.com\", \"value\": 7}, {\"label\": \"知乎\", \"value\": 8}, {\"label\": \"网易微博\", \"value\": 9}, {\"label\": \"facebook\", \"value\": 10}, {\"label\": \"MySpace\", \"value\": 11}, {\"label\": \"其他\", \"value\": 12}]}',
        NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (26, 'd18614f57f994db894831181b5642bc4', '101', 'RADIO', '其中，您最常使用的社交网站是？', 1, NULL, 1, NULL, 1703936, 24, '{
  \"options\": [{\"label\": \"新浪微博\", \"value\": 1}, {\"label\": \"人人网\", \"value\": 2}, {\"label\": \"豆瓣\", \"value\": 3}, {\"label\": \"腾讯微博\", \"value\": 4}, {\"label\": \"QQ空间\", \"value\": 5}, {\"label\": \"开心网\", \"value\": 6}, {\"label\": \"51.com\", \"value\": 7}, {\"label\": \"知乎\", \"value\": 8}, {\"label\": \"网易微博\", \"value\": 9}, {\"label\": \"facebook\", \"value\": 10}, {\"label\": \"MySpace\", \"value\": 11}, {\"label\": \"其他\", \"value\": 12}]}',
        NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (27, 'd18614f57f994db894831181b5642bc4', '102', 'RATE', '总的来说，您对该社交网站的满意度是？', 1, NULL, 1, NULL, 1769472, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (28, 'd18614f57f994db894831181b5642bc4', '103', 'RATE', '您是否愿意继续使用该社交网站？', 1, NULL, 1, NULL, 1835008, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (29, 'd18614f57f994db894831181b5642bc4', '104', 'RATE', '您是否愿意推荐身边的人（亲朋好友）使用该社交网站？', 1, NULL, 1, NULL, 1900544,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (30, 'd18614f57f994db894831181b5642bc4', '100', 'RADIO', '您的性别是', 1, NULL, 1, NULL, 1966080, 24, '{
  \"options\": [{\"label\": \"男\", \"value\": 1}, {\"label\": \"女\", \"value\": 2}]}', NULL, '2021-01-11 13:58:07',
        '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (31, 'd18614f57f994db894831181b5642bc4', '101', 'SELECT', '您的出生年份是？', 1, NULL, 1, NULL, 2031616, 24, '{
  \"options\": [{\"label\": \"2005年后\", \"value\": 1}, {\"label\": \"2005年\", \"value\": 2}, {\"label\": \"2004年\", \"value\": 3}, {\"label\": \"2003年\", \"value\": 4}, {\"label\": \"2002年\", \"value\": 5}, {\"label\": \"2001年\", \"value\": 6}, {\"label\": \"2000年\", \"value\": 7}, {\"label\": \"1999年\", \"value\": 8}, {\"label\": \"1998年\", \"value\": 9}, {\"label\": \"1997年\", \"value\": 10}, {\"label\": \"1996年\", \"value\": 11}, {\"label\": \"1995年\", \"value\": 12}, {\"label\": \"1994年\", \"value\": 13}, {\"label\": \"1993年\", \"value\": 14}, {\"label\": \"1992年\", \"value\": 15}, {\"label\": \"1991年\", \"value\": 16}, {\"label\": \"1990年\", \"value\": 17}, {\"label\": \"1989年\", \"value\": 18}, {\"label\": \"1988年\", \"value\": 19}, {\"label\": \"1987年\", \"value\": 20}, {\"label\": \"1986年\", \"value\": 21}, {\"label\": \"1985年\", \"value\": 22}, {\"label\": \"1984年\", \"value\": 23}, {\"label\": \"1983年\", \"value\": 24}, {\"label\": \"1982年\", \"value\": 25}, {\"label\": \"1981年\", \"value\": 26}, {\"label\": \"1980年\", \"value\": 27}, {\"label\": \"1979年\", \"value\": 28}, {\"label\": \"1978年\", \"value\": 29}, {\"label\": \"1977年\", \"value\": 30}, {\"label\": \"1976年\", \"value\": 31}, {\"label\": \"1975年\", \"value\": 32}, {\"label\": \"1974年\", \"value\": 33}, {\"label\": \"1973年\", \"value\": 34}, {\"label\": \"1972年\", \"value\": 35}, {\"label\": \"1971年\", \"value\": 36}, {\"label\": \"1970年\", \"value\": 37}, {\"label\": \"1969年\", \"value\": 38}, {\"label\": \"1968年\", \"value\": 39}, {\"label\": \"1967年\", \"value\": 40}, {\"label\": \"1966年\", \"value\": 41}, {\"label\": \"1965年\", \"value\": 42}, {\"label\": \"1964年\", \"value\": 43}, {\"label\": \"1963年\", \"value\": 44}, {\"label\": \"1962年\", \"value\": 45}, {\"label\": \"1961年\", \"value\": 46}, {\"label\": \"1960年\", \"value\": 47}, {\"label\": \"1960年前\", \"value\": 48}]}',
        NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (32, 'd18614f57f994db894831181b5642bc4', '102', 'RADIO', '您的学历是', 1, NULL, 1, NULL, 2097152, 24, '{
  \"options\": [{\"label\": \"初中及以下\", \"value\": 1}, {\"label\": \"高中/中专\", \"value\": 2}, {\"label\": \"专科/高职\", \"value\": 3}, {\"label\": \"本科\", \"value\": 4}, {\"label\": \"硕士及以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (33, 'd18614f57f994db894831181b5642bc4', '103', 'RADIO', '您每月的收入大概是', 1, NULL, 1, NULL, 2162688, 24, '{
  \"options\": [{\"label\": \"1000元以下\", \"value\": 1}, {\"label\": \"1000-1999元\", \"value\": 2}, {\"label\": \"2000-3999元\", \"value\": 3}, {\"label\": \"4000-5999元\", \"value\": 4}, {\"label\": \"6000-9999元\", \"value\": 5}, {\"label\": \"10000-19999元\", \"value\": 6}, {\"label\": \"20000元以上\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (34, 'd18614f57f994db894831181b5642bc4', '104', 'RADIO', '您的职业是', 1, NULL, 1, NULL, 2228224, 24, '{
  \"options\": [{\"label\": \"学生\", \"value\": 1}, {\"label\": \"政府/机关干部/公务员/事业单位\", \"value\": 2}, {\"label\": \"企业管理者（包括基层及中高成管理者）\", \"value\": 3}, {\"label\": \"普通职员/白领工作者（在办公室/写字楼工作）\", \"value\": 4}, {\"label\": \"专业人员（如医生、律师、文体、记者、老师等）\", \"value\": 5}, {\"label\": \"蓝领工作者（普通工人）\", \"value\": 6}, {\"label\": \"销售人员/商店职员\", \"value\": 7}, {\"label\": \"自由职业者\", \"value\": 8}, {\"label\": \"退休\", \"value\": 9}, {\"label\": \"暂无固定职业\", \"value\": 10}, {\"label\": \"其他\", \"value\": 11}]}',
        NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (35, '19b78ef7fb334a79a0f2d1f160e3a328', '100', 'RADIO', '您使用过xx网吗？', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"使用过\", \"value\": 1}, {\"label\": \"从未使用过\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (36, '19b78ef7fb334a79a0f2d1f160e3a328', '101', 'RADIO', '您的性别', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"男\", \"value\": 1}, {\"label\": \"女\", \"value\": 2}]}', NULL, '2021-01-11 13:58:07',
        '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (37, '19b78ef7fb334a79a0f2d1f160e3a328', '102', 'RADIO', '您的年龄？', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"20岁及以下\", \"value\": 1}, {\"label\": \"21-25岁\", \"value\": 2}, {\"label\": \"26-30岁\", \"value\": 3}, {\"label\": \"31-40岁\", \"value\": 4}, {\"label\": \"40岁及以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (38, '19b78ef7fb334a79a0f2d1f160e3a328', '103', 'RADIO', '您的婚姻状况', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"已婚\", \"value\": 1}, {\"label\": \"未婚\", \"value\": 2}]}', NULL, '2021-01-11 13:58:07',
        '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (39, '19b78ef7fb334a79a0f2d1f160e3a328', '104', 'RADIO', '您的最高学历', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"初中及以下\", \"value\": 1}, {\"label\": \"高中/中专\", \"value\": 2}, {\"label\": \"大专\", \"value\": 3}, {\"label\": \"本科\", \"value\": 4}, {\"label\": \"硕士\", \"value\": 5}, {\"label\": \"博士\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (40, '19b78ef7fb334a79a0f2d1f160e3a328', '105', 'RADIO', '您的月收入（或每月生活费）', 1, NULL, 1, NULL, 393216, 24, '{
  \"options\": [{\"label\": \"1000元以下\", \"value\": 1}, {\"label\": \"1001-2000元\", \"value\": 2}, {\"label\": \"2001-3000元\", \"value\": 3}, {\"label\": \"3001-5000元\", \"value\": 4}, {\"label\": \"5001-8000元\", \"value\": 5}, {\"label\": \"8001-10000元\", \"value\": 6}, {\"label\": \"10001-20000元\", \"value\": 7}, {\"label\": \"20000元以上\", \"value\": 8}, {\"label\": \"不方便透露\", \"value\": 9}]}',
        NULL, '2021-01-11 13:58:07', '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (41, '19b78ef7fb334a79a0f2d1f160e3a328', '106', 'RADIO', '您是否觉得xx网很容易找到', 1, NULL, 1, NULL, 458752, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:07',
        '2021-01-11 13:58:07', 0);
INSERT INTO `pr_project_template_item`
VALUES (42, '19b78ef7fb334a79a0f2d1f160e3a328', '107', 'RATE', '您对网站logo的满意程度（logo即网站的品牌标识）', 1, NULL, 1, NULL, 524288,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (43, '19b78ef7fb334a79a0f2d1f160e3a328', '108', 'RATE', '对导航栏目的满意程度', 1, NULL, 1, NULL, 589824, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (44, '19b78ef7fb334a79a0f2d1f160e3a328', '109', 'RATE', '对网站页面设置及布局的满意程度', 1, NULL, 1, NULL, 655360, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (45, '19b78ef7fb334a79a0f2d1f160e3a328', '110', 'RATE', '对网站内容编排的满意程度', 1, NULL, 1, NULL, 720896, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (46, '19b78ef7fb334a79a0f2d1f160e3a328', '111', 'RATE', '对网站色彩风格的满意程度', 1, NULL, 1, NULL, 786432, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (47, '19b78ef7fb334a79a0f2d1f160e3a328', '112', 'RATE', '对网站字体的满意程度', 1, NULL, 1, NULL, 851968, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (48, '19b78ef7fb334a79a0f2d1f160e3a328', '113', 'RATE', '与同类网站相比，您对xx上的价格满意吗', 1, NULL, 1, NULL, 917504, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (49, '19b78ef7fb334a79a0f2d1f160e3a328', '114', 'RATE', '您对xx目前整体的产品质量水平感觉如何', 1, NULL, 1, NULL, 983040, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (50, '19b78ef7fb334a79a0f2d1f160e3a328', '115', 'RATE', '您觉得xx上的商品信息的可信度怎么样', 1, NULL, 1, NULL, 1048576, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (51, '19b78ef7fb334a79a0f2d1f160e3a328', '116', 'RATE', '您觉得xx的售后服务怎么样', 1, NULL, 1, NULL, 1114112, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (52, '19b78ef7fb334a79a0f2d1f160e3a328', '117', 'RATE', '您觉得xx更新信息的及时性怎么样', 1, NULL, 1, NULL, 1179648, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (53, '19b78ef7fb334a79a0f2d1f160e3a328', '118', 'RADIO', '您的咨询或抱怨通常会得到及时的回复吗', 1, NULL, 1, NULL, 1245184, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:08',
        '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (54, '19b78ef7fb334a79a0f2d1f160e3a328', '119', 'RADIO', '您觉得xx的交易和评价几率真实可靠吗', 1, NULL, 1, NULL, 1310720, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:08',
        '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (55, '19b78ef7fb334a79a0f2d1f160e3a328', '120', 'RADIO', '您觉得xx网能很好的保证交易时的安全性吗', 1, NULL, 1, NULL, 1376256, 24,
        '{
          \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (56, 'e0bc792b030b483684894e09a774f092', '100', 'RADIO', '您是否在xx网站购买过数码家电类产品？', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:08',
        '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (57, 'e0bc792b030b483684894e09a774f092', '101', 'RADIO', '您在xx网站购买数码家电类产品的次数是？', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"1~2次\", \"value\": 1}, {\"label\": \"3~5次\", \"value\": 2}, {\"label\": \"6~10次\", \"value\": 3}, {\"label\": \"10次以上\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (58, 'e0bc792b030b483684894e09a774f092', '102', 'RADIO', '到目前为止，您在xx网站购买数码家电类产品有多久了？', 1, NULL, 1, NULL, 196608,
        24, '{
    \"options\": [{\"label\": \"不到1个月\", \"value\": 1}, {\"label\": \"1-3个月（含3个月）\", \"value\": 2}, {\"label\": \"3-6个月（含6个月）\", \"value\": 3}, {\"label\": \"6-12个月（含12个月）\", \"value\": 4}, {\"label\": \"1-2年（含2年）\", \"value\": 5}, {\"label\": \"2年以上\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (59, 'e0bc792b030b483684894e09a774f092', '100', 'RADIO', '您认为对于在xx网站购买数码家电类产品而言，您认为哪些因素比较重要？', 1, NULL, 1, NULL,
        262144, 24, '{
    \"options\": [{\"label\": \"界面设计美观清晰、导航分类布局清晰合理\", \"value\": 1}, {\"label\": \"商品种类多、全，信息更新速度快\", \"value\": 2}, {\"label\": \"商品质量好\", \"value\": 3}, {\"label\": \"价格便宜\", \"value\": 4}, {\"label\": \"网站操作使用便捷流畅（如商品浏览、查找等）\", \"value\": 5}, {\"label\": \"支付方式多/全面，下单、支付等过程安全、有保障发货速度快\", \"value\": 6}, {\"label\": \"实际的商品/服务与页面描述一致\", \"value\": 7}, {\"label\": \"商家服务体验好（如送货上门、安装、售后等）\", \"value\": 8}, {\"label\": \"对用户咨询/投诉/反馈处理及时\", \"value\": 9}, {\"label\": \"商品保障措施全面（如正品保障、7天无理由退换等）\", \"value\": 10}, {\"label\": \"网站打开速度快，稳定\", \"value\": 11}, {\"label\": \"其他\", \"value\": 12}]}',
        NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (60, 'e0bc792b030b483684894e09a774f092', '101', 'RATE', '总的来说，您对在xx网站购买数码家电类产品的满意度是？', 1, NULL, 1, NULL, 327680,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (61, 'e0bc792b030b483684894e09a774f092', '102', 'RATE', '您是否愿意继续在xx网站购买数码家电类产品？', 1, NULL, 1, NULL, 393216, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (62, 'e0bc792b030b483684894e09a774f092', '103', 'RATE', '您是否愿意推荐身边的人（亲朋好友）在xx网站购买数码家电类产品？', 1, NULL, 1, NULL,
        458752, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (63, 'e0bc792b030b483684894e09a774f092', '104', 'RATE', '您对xx网站的“界面设计美观清晰，（布局、图文、颜色）结构布局合理”的同意程度是', 1, NULL, 1,
        NULL, 524288, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (64, 'e0bc792b030b483684894e09a774f092', '105', 'RATE', '您对xx网站的“导航分类布局清晰合理”的同意程度是？', 1, NULL, 1, NULL, 589824,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (65, 'e0bc792b030b483684894e09a774f092', '106', 'RATE', '您对xx网站的“数码类家电产品种类多、全面”的同意程度是？', 1, NULL, 1, NULL,
        655360, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (66, 'e0bc792b030b483684894e09a774f092', '107', 'RATE', '您对xx网站的“数码类家电产品质量好”的同意程度是？', 1, NULL, 1, NULL, 720896,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (67, 'e0bc792b030b483684894e09a774f092', '108', 'RATE', '您对xx网站的“数码类家电产品价格便宜”的同意程度是？', 1, NULL, 1, NULL, 786432,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (68, 'e0bc792b030b483684894e09a774f092', '109', 'RATE', '您对xx网站的“促销活动多”的同意程度是？', 1, NULL, 1, NULL, 851968, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (69, 'e0bc792b030b483684894e09a774f092', '110', 'RATE', '您对xx网站的“卖家能提供优质的服务”（如送货上门、安装等）的同意程度是？', 1, NULL, 1,
        NULL, 917504, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (70, 'e0bc792b030b483684894e09a774f092', '111', 'RATE', '您对xx网站“购物安全、有保障”的同意程度是？', 1, NULL, 1, NULL, 983040, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (71, 'e0bc792b030b483684894e09a774f092', '112', 'RATE', '您对xx网站的“操作简单流畅”的同意程度是？', 1, NULL, 1, NULL, 1048576, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (72, 'e0bc792b030b483684894e09a774f092', '113', 'RATE', '您对xx网站的“支付方式多”的同意程度是？', 1, NULL, 1, NULL, 1114112, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (73, 'e0bc792b030b483684894e09a774f092', '114', 'RATE', '您对xx网站的“发货速度快”的同意程度是？', 1, NULL, 1, NULL, 1179648, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (74, 'e0bc792b030b483684894e09a774f092', '115', 'RATE', '您对xx网站“所购商品与卖家描述一致”的同意程度是？', 1, NULL, 1, NULL, 1245184,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (75, 'e0bc792b030b483684894e09a774f092', '116', 'RATE', '您对xx网站的“网站打开速度快，稳定”的同意程度是？', 1, NULL, 1, NULL, 1310720,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (76, 'e0bc792b030b483684894e09a774f092', '117', 'RATE', '您对xx网站的“对用户咨询/投诉/反馈处理及时”的同意程度是？', 1, NULL, 1, NULL,
        1376256, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (77, 'e0bc792b030b483684894e09a774f092', '118', 'RATE', '您对xx网站的“售后服务体系完善，能够及时处理我购买商品后出现的问题”的同意程度是？', 1, NULL, 1,
        NULL, 1441792, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (78, 'e0bc792b030b483684894e09a774f092', '100', 'RADIO', '除xx网站以外，您还在以下哪些数码家电类网站购买过商品？', 1, NULL, 1, NULL,
        1507328, 24, '{
    \"options\": [{\"label\": \"天猫\", \"value\": 1}, {\"label\": \"京东\", \"value\": 2}, {\"label\": \"国美在线（包括国美商城，国美库巴）\", \"value\": 3}, {\"label\": \"苏宁易购\", \"value\": 4}, {\"label\": \"易迅网\", \"value\": 5}, {\"label\": \"新蛋\", \"value\": 6}, {\"label\": \"当当网\", \"value\": 7}, {\"label\": \"亚马逊\", \"value\": 8}, {\"label\": \"一号店\", \"value\": 9}, {\"label\": \"淘宝网\", \"value\": 10}, {\"label\": \"QQ网购/拍拍网\", \"value\": 11}, {\"label\": \"其他\", \"value\": 12}]}',
        NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (79, 'e0bc792b030b483684894e09a774f092', '101', 'RADIO', '其中，您最常使用的网站是？', 1, NULL, 1, NULL, 1572864, 24, '{
  \"options\": [{\"label\": \"天猫\", \"value\": 1}, {\"label\": \"京东\", \"value\": 2}, {\"label\": \"国美在线（包括国美商城，国美库巴）\", \"value\": 3}, {\"label\": \"苏宁易购\", \"value\": 4}, {\"label\": \"易迅网\", \"value\": 5}, {\"label\": \"新蛋\", \"value\": 6}, {\"label\": \"当当网\", \"value\": 7}, {\"label\": \"亚马逊\", \"value\": 8}, {\"label\": \"一号店\", \"value\": 9}, {\"label\": \"淘宝网\", \"value\": 10}, {\"label\": \"QQ网购/拍拍网\", \"value\": 11}, {\"label\": \"其他\", \"value\": 12}]}',
        NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (80, 'e0bc792b030b483684894e09a774f092', '102', 'RATE', '总的来说，您对在该网站购买数码家电类产品的满意度是？', 1, NULL, 1, NULL, 1638400,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (81, 'e0bc792b030b483684894e09a774f092', '103', 'RATE', '您是否愿意继续在该网站购买数码家电类产品？', 1, NULL, 1, NULL, 1703936, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (82, 'e0bc792b030b483684894e09a774f092', '104', 'RATE', '您是否愿意推荐身边的人（亲朋好友）在该网站购买数码家电类产品？', 1, NULL, 1, NULL,
        1769472, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (83, 'e0bc792b030b483684894e09a774f092', '100', 'RADIO', '您的性别是', 1, NULL, 1, NULL, 1835008, 24, '{
  \"options\": [{\"label\": \"男\", \"value\": 1}, {\"label\": \"女\", \"value\": 2}]}', NULL, '2021-01-11 13:58:08',
        '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (84, 'e0bc792b030b483684894e09a774f092', '101', 'SELECT', '您的出生年份是？', 1, NULL, 1, NULL, 1900544, 24, '{
  \"options\": [{\"label\": \"2005年后\", \"value\": 1}, {\"label\": \"2005年\", \"value\": 2}, {\"label\": \"2004年\", \"value\": 3}, {\"label\": \"2003年\", \"value\": 4}, {\"label\": \"2002年\", \"value\": 5}, {\"label\": \"2001年\", \"value\": 6}, {\"label\": \"2000年\", \"value\": 7}, {\"label\": \"1999年\", \"value\": 8}, {\"label\": \"1998年\", \"value\": 9}, {\"label\": \"1997年\", \"value\": 10}, {\"label\": \"1996年\", \"value\": 11}, {\"label\": \"1995年\", \"value\": 12}, {\"label\": \"1994年\", \"value\": 13}, {\"label\": \"1993年\", \"value\": 14}, {\"label\": \"1992年\", \"value\": 15}, {\"label\": \"1991年\", \"value\": 16}, {\"label\": \"1990年\", \"value\": 17}, {\"label\": \"1989年\", \"value\": 18}, {\"label\": \"1988年\", \"value\": 19}, {\"label\": \"1987年\", \"value\": 20}, {\"label\": \"1986年\", \"value\": 21}, {\"label\": \"1985年\", \"value\": 22}, {\"label\": \"1984年\", \"value\": 23}, {\"label\": \"1983年\", \"value\": 24}, {\"label\": \"1982年\", \"value\": 25}, {\"label\": \"1981年\", \"value\": 26}, {\"label\": \"1980年\", \"value\": 27}, {\"label\": \"1979年\", \"value\": 28}, {\"label\": \"1978年\", \"value\": 29}, {\"label\": \"1977年\", \"value\": 30}, {\"label\": \"1976年\", \"value\": 31}, {\"label\": \"1975年\", \"value\": 32}, {\"label\": \"1974年\", \"value\": 33}, {\"label\": \"1973年\", \"value\": 34}, {\"label\": \"1972年\", \"value\": 35}, {\"label\": \"1971年\", \"value\": 36}, {\"label\": \"1970年\", \"value\": 37}, {\"label\": \"1969年\", \"value\": 38}, {\"label\": \"1968年\", \"value\": 39}, {\"label\": \"1967年\", \"value\": 40}, {\"label\": \"1966年\", \"value\": 41}, {\"label\": \"1965年\", \"value\": 42}, {\"label\": \"1964年\", \"value\": 43}, {\"label\": \"1963年\", \"value\": 44}, {\"label\": \"1962年\", \"value\": 45}, {\"label\": \"1961年\", \"value\": 46}, {\"label\": \"1960年\", \"value\": 47}, {\"label\": \"1960年前\", \"value\": 48}]}',
        NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (85, 'e0bc792b030b483684894e09a774f092', '102', 'RADIO', '您的学历是', 1, NULL, 1, NULL, 1966080, 24, '{
  \"options\": [{\"label\": \"初中及以下\", \"value\": 1}, {\"label\": \"高中/中专\", \"value\": 2}, {\"label\": \"专科/高职\", \"value\": 3}, {\"label\": \"本科\", \"value\": 4}, {\"label\": \"硕士及以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (86, 'e0bc792b030b483684894e09a774f092', '103', 'RADIO', '您每月的收入大概是', 1, NULL, 1, NULL, 2031616, 24, '{
  \"options\": [{\"label\": \"1000元以下\", \"value\": 1}, {\"label\": \"1000-1999元\", \"value\": 2}, {\"label\": \"2000-3999元\", \"value\": 3}, {\"label\": \"4000-5999元\", \"value\": 4}, {\"label\": \"6000-9999元\", \"value\": 5}, {\"label\": \"10000-19999元\", \"value\": 6}, {\"label\": \"20000元以上\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (87, 'e0bc792b030b483684894e09a774f092', '104', 'RADIO', '您的职业是', 1, NULL, 1, NULL, 2097152, 24, '{
  \"options\": [{\"label\": \"学生\", \"value\": 1}, {\"label\": \"政府/机关干部/公务员/事业单位\", \"value\": 2}, {\"label\": \"企业管理者（包括基层及中高成管理者）\", \"value\": 3}, {\"label\": \"普通职员/白领工作者（在办公室/写字楼工作）\", \"value\": 4}, {\"label\": \"专业人员（如医生、律师、文体、记者、老师等）\", \"value\": 5}, {\"label\": \"蓝领工作者（普通工人）\", \"value\": 6}, {\"label\": \"销售人员/商店职员\", \"value\": 7}, {\"label\": \"自由职业者\", \"value\": 8}, {\"label\": \"退休\", \"value\": 9}, {\"label\": \"暂无固定职业\", \"value\": 10}, {\"label\": \"其他\", \"value\": 11}]}',
        NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (88, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '100', 'RADIO', '最近六个月内，请问您是否参与过餐饮团购？', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:08',
        '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (89, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '101', 'RADIO', '在这六个月内，您团购餐饮/美食（火锅、川菜、湘菜、西餐、日韩料理等）的次数是？', 1, NULL, 1,
        NULL, 131072, 24, '{
    \"options\": [{\"label\": \"1次\", \"value\": 1}, {\"label\": \"2-3次\", \"value\": 2}, {\"label\": \"4-5次\", \"value\": 3}, {\"label\": \"6-10次\", \"value\": 4}, {\"label\": \"10次以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (90, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '102', 'RADIO', '您最常到哪个网站进行餐饮团购？', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"拉手网\", \"value\": 1}, {\"label\": \"高朋网\", \"value\": 2}, {\"label\": \"嘀嗒团\", \"value\": 3}, {\"label\": \"窝窝网\", \"value\": 4}, {\"label\": \"大众点评\", \"value\": 5}, {\"label\": \"糯米网\", \"value\": 6}, {\"label\": \"美团网\", \"value\": 7}, {\"label\": \"淘宝聚划算\", \"value\": 8}, {\"label\": \"58团购\", \"value\": 9}, {\"label\": \"24劵\", \"value\": 10}, {\"label\": \"QQ团购\", \"value\": 11}, {\"label\": \"满座\", \"value\": 12}, {\"label\": \"其他\", \"value\": 13}]}',
        NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (91, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '103', 'RADIO', '您最常参与的餐饮团购人均价格区间是？', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"35元以下\", \"value\": 1}, {\"label\": \"35-50元\", \"value\": 2}, {\"label\": \"51-80元\", \"value\": 3}, {\"label\": \"81-120元\", \"value\": 4}, {\"label\": \"121-150元\", \"value\": 5}, {\"label\": \"150元以上\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (92, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '104', 'RADIO', '您喜欢参与什么类型的餐饮团购？', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"自助餐\", \"value\": 1}, {\"label\": \"火锅\", \"value\": 2}, {\"label\": \"西餐\", \"value\": 3}, {\"label\": \"中式地方特色菜\", \"value\": 4}, {\"label\": \"日本/韩国料理\", \"value\": 5}, {\"label\": \"烧烤\", \"value\": 6}, {\"label\": \"甜点饮品\", \"value\": 7}, {\"label\": \"其他\", \"value\": 8}]}',
        NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (93, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '105', 'RADIO', '您认为在选择团购餐饮/美食时，哪些因素比较重要？', 1, NULL, 1, NULL, 393216,
        24, '{
    \"options\": [{\"label\": \"餐厅口味好，品类多\", \"value\": 1}, {\"label\": \"餐厅卫生条件好，食品安全\", \"value\": 2}, {\"label\": \"餐厅环境干净、舒适\", \"value\": 3}, {\"label\": \"价格便宜、实惠\", \"value\": 4}, {\"label\": \"餐厅硬件设施（如桌椅、餐具）清洁、卫生\", \"value\": 5}, {\"label\": \"就餐服务等候时间、供餐速度等\", \"value\": 6}, {\"label\": \"餐厅实际情况与页面描述一致\", \"value\": 7}, {\"label\": \"与餐厅预约团购消费，方便快捷\", \"value\": 8}, {\"label\": \"餐厅对待团购顾客与非团购顾客无区别对待\", \"value\": 9}, {\"label\": \"餐厅能及时/迅速/主动为我提供服务\", \"value\": 10}, {\"label\": \"对用户咨询/投诉/反馈处理及时\", \"value\": 11}, {\"label\": \"团购的网站操作使用便捷流畅（如商品浏览、查找等）\", \"value\": 12}, {\"label\": \"下单、支付等过程安全、有保障商品保障措施全面（如正品保障、过期退款、先行赔付等）\", \"value\": 13}, {\"label\": \"网站打开速度快，稳定\", \"value\": 14}, {\"label\": \"其他\", \"value\": 15}]}',
        NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (94, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '100', 'INPUT', '您最近一次团购的餐厅名字是？', 1, NULL, 1, NULL, 458752, 24, '{}',
        NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (95, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '101', 'RADIO', '您团购该餐厅的原因是？', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"知道他们家饭菜/美食口感好，适合自己的口味\", \"value\": 1}, {\"label\": \"看介绍有特色\", \"value\": 2}, {\"label\": \"卫生条件好、安全环境干净舒适\", \"value\": 3}, {\"label\": \"方便快捷\", \"value\": 4}, {\"label\": \"团购价钱实惠\", \"value\": 5}, {\"label\": \"朋友请客/推荐\", \"value\": 6}, {\"label\": \"地理位置好\", \"value\": 7}, {\"label\": \"其他\", \"value\": 8}]}',
        NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (96, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '102', 'RATE', '总的来说，您对这次餐饮团购的满意度是？', 1, NULL, 1, NULL, 589824, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (97, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '103', 'RATE', '您是否愿意继续购买该餐厅的团购？', 1, NULL, 1, NULL, 655360, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (98, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '104', 'RATE', '您是否愿意推荐身边的人（亲朋好友）购买该餐饮团购？', 1, NULL, 1, NULL, 720896,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (99, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '105', 'RATE', '您对xx餐厅“提供的美食口味好，品类多”的同意程度是？（分数越高代表越同意，下同）', 1, NULL, 1,
        NULL, 786432, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (100, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '106', 'RATE', '您对xx餐厅“卫生条件好，食品安全”的同意程度是？', 1, NULL, 1, NULL, 851968,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (101, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '107', 'RATE', '您对xx餐厅“环境干净、舒适”的同意程度是？', 1, NULL, 1, NULL, 917504, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (102, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '108', 'RATE', '您对团购xx餐厅的“价格便宜、实惠”的同意程度是？', 1, NULL, 1, NULL, 983040,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:08', '2021-01-11 13:58:08', 0);
INSERT INTO `pr_project_template_item`
VALUES (103, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '109', 'RATE', '您对xx餐厅“硬件设施（如桌椅、餐具）清洁、卫生”的同意程度是？', 1, NULL, 1, NULL,
        1048576, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (104, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '110', 'RATE', '您对xx餐厅“就餐服务等候时间、供餐速度等”的同意程度是？', 1, NULL, 1, NULL,
        1114112, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (105, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '111', 'RATE', '您对xx餐厅“实际餐饮商品与团购网站宣传/描述的一致”的同意程度是？', 1, NULL, 1, NULL,
        1179648, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (106, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '112', 'RATE', '您对与xx餐厅“预约团购消费，方便快捷、态度好等”的同意程度是？', 1, NULL, 1, NULL,
        1245184, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (107, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '113', 'RATE', '您对xx餐厅“对待团购顾客与非团购顾客无区别对待”的同意程度是？', 1, NULL, 1, NULL,
        1310720, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (108, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '114', 'RATE', '您对xx餐厅“服务员能及时/迅速/主动为我提供服务”的同意程度是？', 1, NULL, 1, NULL,
        1376256, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (109, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '115', 'RATE', '您对xx餐厅“对用户咨询/投诉/反馈处理及时”的同意程度是？', 1, NULL, 1, NULL,
        1441792, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (110, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '116', 'RATE', '您对团购xx餐厅时“网站操作使用便捷流畅（如商品浏览、查找等）”的同意程度是？', 1, NULL, 1,
        NULL, 1507328, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (111, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '117', 'RATE', '您对团购xx餐厅时“下单、支付等过程安全、有保障”的同意程度是？', 1, NULL, 1, NULL,
        1572864, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (112, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '118', 'RATE', '您对团购xx餐厅时“保障措施全面（如正品保障、过期退款、先行赔付等）”的同意程度是？', 1, NULL,
        1, NULL, 1638400, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (113, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '119', 'RATE', '您对团购xx餐厅时“网站打开速度快，稳定”的同意程度是？', 1, NULL, 1, NULL,
        1703936, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (114, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '100', 'RADIO', '您的性别是', 1, NULL, 1, NULL, 1769472, 24, '{
  \"options\": [{\"label\": \"男\", \"value\": 1}, {\"label\": \"女\", \"value\": 2}]}', NULL, '2021-01-11 13:58:09',
        '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (115, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '101', 'SELECT', '您的出生年份是？', 1, NULL, 1, NULL, 1835008, 24, '{
  \"options\": [{\"label\": \"2005年后\", \"value\": 1}, {\"label\": \"2005年\", \"value\": 2}, {\"label\": \"2004年\", \"value\": 3}, {\"label\": \"2003年\", \"value\": 4}, {\"label\": \"2002年\", \"value\": 5}, {\"label\": \"2001年\", \"value\": 6}, {\"label\": \"2000年\", \"value\": 7}, {\"label\": \"1999年\", \"value\": 8}, {\"label\": \"1998年\", \"value\": 9}, {\"label\": \"1997年\", \"value\": 10}, {\"label\": \"1996年\", \"value\": 11}, {\"label\": \"1995年\", \"value\": 12}, {\"label\": \"1994年\", \"value\": 13}, {\"label\": \"1993年\", \"value\": 14}, {\"label\": \"1992年\", \"value\": 15}, {\"label\": \"1991年\", \"value\": 16}, {\"label\": \"1990年\", \"value\": 17}, {\"label\": \"1989年\", \"value\": 18}, {\"label\": \"1988年\", \"value\": 19}, {\"label\": \"1987年\", \"value\": 20}, {\"label\": \"1986年\", \"value\": 21}, {\"label\": \"1985年\", \"value\": 22}, {\"label\": \"1984年\", \"value\": 23}, {\"label\": \"1983年\", \"value\": 24}, {\"label\": \"1982年\", \"value\": 25}, {\"label\": \"1981年\", \"value\": 26}, {\"label\": \"1980年\", \"value\": 27}, {\"label\": \"1979年\", \"value\": 28}, {\"label\": \"1978年\", \"value\": 29}, {\"label\": \"1977年\", \"value\": 30}, {\"label\": \"1976年\", \"value\": 31}, {\"label\": \"1975年\", \"value\": 32}, {\"label\": \"1974年\", \"value\": 33}, {\"label\": \"1973年\", \"value\": 34}, {\"label\": \"1972年\", \"value\": 35}, {\"label\": \"1971年\", \"value\": 36}, {\"label\": \"1970年\", \"value\": 37}, {\"label\": \"1969年\", \"value\": 38}, {\"label\": \"1968年\", \"value\": 39}, {\"label\": \"1967年\", \"value\": 40}, {\"label\": \"1966年\", \"value\": 41}, {\"label\": \"1965年\", \"value\": 42}, {\"label\": \"1964年\", \"value\": 43}, {\"label\": \"1963年\", \"value\": 44}, {\"label\": \"1962年\", \"value\": 45}, {\"label\": \"1961年\", \"value\": 46}, {\"label\": \"1960年\", \"value\": 47}, {\"label\": \"1960年前\", \"value\": 48}]}',
        NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (116, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '102', 'RADIO', '您的学历是', 1, NULL, 1, NULL, 1900544, 24, '{
  \"options\": [{\"label\": \"初中及以下\", \"value\": 1}, {\"label\": \"高中/中专\", \"value\": 2}, {\"label\": \"专科/高职\", \"value\": 3}, {\"label\": \"本科硕士及以上\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (117, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '103', 'RADIO', '您每月的收入大概是', 1, NULL, 1, NULL, 1966080, 24, '{
  \"options\": [{\"label\": \"1000元以下\", \"value\": 1}, {\"label\": \"1000-1999元\", \"value\": 2}, {\"label\": \"2000-3999元\", \"value\": 3}, {\"label\": \"4000-5999元\", \"value\": 4}, {\"label\": \"6000-9999元\", \"value\": 5}, {\"label\": \"10000-19999元\", \"value\": 6}, {\"label\": \"20000元以上\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (118, 'fbc0a3a6ad7441b28ebf79a7730fab5f', '104', 'RADIO', '您的职业是', 1, NULL, 1, NULL, 2031616, 24, '{
  \"options\": [{\"label\": \"学生\", \"value\": 1}, {\"label\": \"政府/机关干部/公务员/事业单位\", \"value\": 2}, {\"label\": \"企业管理者（包括基层及中高成管理者）\", \"value\": 3}, {\"label\": \"普通职员/白领工作者（在办公室/写字楼工作）\", \"value\": 4}, {\"label\": \"专业人员（如医生、律师、文体、记者、老师等）\", \"value\": 5}, {\"label\": \"蓝领工作者（普通工人）\", \"value\": 6}, {\"label\": \"销售人员/商店职员\", \"value\": 7}, {\"label\": \"自由职业者\", \"value\": 8}, {\"label\": \"退休\", \"value\": 9}, {\"label\": \"暂无固定职业\", \"value\": 10}, {\"label\": \"其他\", \"value\": 11}]}',
        NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (119, '1ed08c925d374b0d9747932b6606fd04', '100', 'RADIO', '您是否在xx团购网站购买过商品或服务（如餐饮、电影票、娱乐、旅游、实物商品等）？ ', 1, NULL,
        1, NULL, 65536, 24, '{
    \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:09',
        '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (120, '1ed08c925d374b0d9747932b6606fd04', '101', 'RADIO', '您在XX团购网站购买商品或服务的次数是？ ', 1, NULL, 1, NULL, 131072, 24,
        '{
          \"options\": [{\"label\": \"1~2次\", \"value\": 1}, {\"label\": \"3~5次\", \"value\": 2}, {\"label\": \"6~10次\", \"value\": 3}, {\"label\": \"10次以上\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (121, '1ed08c925d374b0d9747932b6606fd04', '102', 'RADIO', '您在xx团购网站团购最多的是？ ', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"餐饮美食（在实体店消费的餐饮、甜点饮品等）\", \"value\": 1}, {\"label\": \"休闲娱乐（KTV、电影票、运动健身、温泉洗浴、养身按摩、赛事演出等）\", \"value\": 2}, {\"label\": \"生活服务（美容美发形塑、摄影写真、健康护理、教育培训、车房保养）\", \"value\": 3}, {\"label\": \"酒店旅游\", \"value\": 4}, {\"label\": \"化妆品\", \"value\": 5}, {\"label\": \"日用百货家居\", \"value\": 6}, {\"label\": \"其他\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (122, '1ed08c925d374b0d9747932b6606fd04', '103', 'RADIO', '到目前为止，您在xx团购网站购买商品/服务有多久了？ ', 1, NULL, 1, NULL,
        262144, 24, '{
    \"options\": [{\"label\": \"不到1个月\", \"value\": 1}, {\"label\": \"1-3个月（含 3个月）\", \"value\": 2}, {\"label\": \"3-6个月（含 6个月）\", \"value\": 3}, {\"label\": \"6-12个月（含 12个月）\", \"value\": 4}, {\"label\": \"1-2年（含2年）\", \"value\": 5}, {\"label\": \"2年以上\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (123, '1ed08c925d374b0d9747932b6606fd04', '100', 'RADIO', '您认为对于xx团购而言，哪些因素比较重要？ ', 1, NULL, 1, NULL, 327680, 24,
        '{
          \"options\": [{\"label\": \"界面设计美观，导航分类清晰，布局合理\", \"value\": 1}, {\"label\": \"商品/服务种类多、全，信息更新速度快\", \"value\": 2}, {\"label\": \"商品/服务质量好\", \"value\": 3}, {\"label\": \"价格便宜\", \"value\": 4}, {\"label\": \"网站操作使用便捷流畅（如商品浏览、查找等）\", \"value\": 5}, {\"label\": \"支付方式多/全面，下单、支付等过程安全、有保障\", \"value\": 6}, {\"label\": \"实物类商品的物流配送服务\", \"value\": 7}, {\"label\": \"实际的商品/服务与页面描述一致\", \"value\": 8}, {\"label\": \"消费预约服务体验好（预约方便、态度好等）\", \"value\": 9}, {\"label\": \"商家服务体验好（如服务态度好，无区别对待等）\", \"value\": 10}, {\"label\": \"对用户咨询/投诉/反馈处理及时 商品保障措施全面（如正品保障、过期退款、先行赔付、售后好等）\", \"value\": 11}, {\"label\": \"网站打开速度快，稳定\", \"value\": 12}, {\"label\": \"其他\", \"value\": 13}]}',
        NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (124, '1ed08c925d374b0d9747932b6606fd04', '101', 'RATE', '总的来说，您对xx团购的满意度是？ ', 1, NULL, 1, NULL, 393216, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (125, '1ed08c925d374b0d9747932b6606fd04', '102', 'RATE', '您是否愿意继续使用xx团购？ ', 1, NULL, 1, NULL, 458752, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (126, '1ed08c925d374b0d9747932b6606fd04', '103', 'RATE', '您是否愿意推荐身边的人（亲朋好友）使用xx团购？ ', 1, NULL, 1, NULL, 524288,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (127, '1ed08c925d374b0d9747932b6606fd04', '104', 'RATE', '您对xx团购“界面设计美观清晰布局合理”的同意程度是？', 1, NULL, 1, NULL, 589824,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (128, '1ed08c925d374b0d9747932b6606fd04', '105', 'RATE', '您对xx团购“导航分类清晰合理”的同意程度是？ ', 1, NULL, 1, NULL, 655360,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (129, '1ed08c925d374b0d9747932b6606fd04', '106', 'RATE', '您对xx团购“商品/服务种类多、全”的同意程度是？ ', 1, NULL, 1, NULL, 720896,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (130, '1ed08c925d374b0d9747932b6606fd04', '107', 'RATE', '您对xx团购的“商品/服务信息更新速度快”的同意程度是？ ', 1, NULL, 1, NULL,
        786432, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (131, '1ed08c925d374b0d9747932b6606fd04', '108', 'RATE', '您对xx团购的“商品/服务质量好”的同意程度是？ ', 1, NULL, 1, NULL, 851968,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (132, '1ed08c925d374b0d9747932b6606fd04', '109', 'RATE', '您对xx团购的“价格便宜”的同意程度是？ ', 1, NULL, 1, NULL, 917504, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (133, '1ed08c925d374b0d9747932b6606fd04', '110', 'RATE', '您对xx团购“网站操作使用便捷流畅（如商品浏览、查找等）”的同意程度是？ ', 1, NULL, 1,
        NULL, 983040, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (134, '1ed08c925d374b0d9747932b6606fd04', '111', 'RATE', '您对xx团购“下单、支付等过程安全、有保障”的同意程度是？ ', 1, NULL, 1, NULL,
        1048576, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (135, '1ed08c925d374b0d9747932b6606fd04', '112', 'RATE', '您对xx团购“支付方式多，全面”的同意程度是？ ', 1, NULL, 1, NULL, 1114112,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (136, '1ed08c925d374b0d9747932b6606fd04', '113', 'RATE', '您对xx团购“实物类商品的物流配送服务满意”的同意程度是？ ', 1, NULL, 1, NULL,
        1179648, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (137, '1ed08c925d374b0d9747932b6606fd04', '114', 'RATE', '您对xx团购“商品/服务与页面描述一致”的同意程度是？ ', 1, NULL, 1, NULL,
        1245184, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (138, '1ed08c925d374b0d9747932b6606fd04', '115', 'RATE', '您对xx团购“消费预约服务体验好（预约方便、态度好等）”的同意程度是？ ', 1, NULL, 1,
        NULL, 1310720, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (139, '1ed08c925d374b0d9747932b6606fd04', '116', 'RATE', '您对xx团购“商家服务体验好（如服务态度好，无区别对待等）”的同意程度是？ ', 1, NULL, 1,
        NULL, 1376256, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (140, '1ed08c925d374b0d9747932b6606fd04', '117', 'RATE', '您对xx团购“对用户咨询/投诉/反馈处理及时”的同意程度是？ ', 1, NULL, 1, NULL,
        1441792, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (141, '1ed08c925d374b0d9747932b6606fd04', '118', 'RATE', '您对xx团购“商品保障措施全面（如正品保障、过期退款、先行赔付等）”的同意程度是？ ', 1, NULL,
        1, NULL, 1507328, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (142, '1ed08c925d374b0d9747932b6606fd04', '119', 'RATE', '您对xx团购“售后服务体系完善，能够及时处理我购买商品后出现的问题”的同意程度是？ ', 1, NULL,
        1, NULL, 1572864, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (143, '1ed08c925d374b0d9747932b6606fd04', '120', 'RATE', '您对xx团购“网站打开速度快，稳定”的同意程度是？ ', 1, NULL, 1, NULL, 1638400,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (144, '1ed08c925d374b0d9747932b6606fd04', '121', 'RADIO', '您是否觉得xx团购网站比其他的网站好？ ', 1, NULL, 1, NULL, 1703936, 24,
        '{
          \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (145, '1ed08c925d374b0d9747932b6606fd04', '100', 'RADIO', '除xx网站以外，您还在以下哪些团购网站购买过商品或服务？ ', 1, NULL, 1, NULL,
        1769472, 24, '{
    \"options\": [{\"label\": \"拉手网\", \"value\": 1}, {\"label\": \"美团网\", \"value\": 2}, {\"label\": \"糯米网\", \"value\": 3}, {\"label\": \"淘宝聚划算\", \"value\": 4}, {\"label\": \"大众点评团\", \"value\": 5}, {\"label\": \"QQ团购\", \"value\": 6}, {\"label\": \"58团购\", \"value\": 7}, {\"label\": \"24券\", \"value\": 8}, {\"label\": \"窝窝团\", \"value\": 9}, {\"label\": \"高朋网\", \"value\": 10}, {\"label\": \"满座网\", \"value\": 11}, {\"label\": \"其他\", \"value\": 12}]}',
        NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (146, '1ed08c925d374b0d9747932b6606fd04', '101', 'RADIO', '其中，您最常使用的团购网站是？ ', 1, NULL, 1, NULL, 1835008, 24, '{
  \"options\": [{\"label\": \"拉手网\", \"value\": 1}, {\"label\": \"美团网\", \"value\": 2}, {\"label\": \"糯米网\", \"value\": 3}, {\"label\": \"淘宝聚划算\", \"value\": 4}, {\"label\": \"大众点评团\", \"value\": 5}, {\"label\": \"QQ团购\", \"value\": 6}, {\"label\": \"58团购\", \"value\": 7}, {\"label\": \"24券\", \"value\": 8}, {\"label\": \"窝窝团\", \"value\": 9}, {\"label\": \"高朋网\", \"value\": 10}, {\"label\": \"满座网\", \"value\": 11}, {\"label\": \"其他\", \"value\": 12}]}',
        NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (147, '1ed08c925d374b0d9747932b6606fd04', '102', 'RATE', '总的来说，您对该团购的满意度是？', 1, NULL, 1, NULL, 1900544, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (148, '1ed08c925d374b0d9747932b6606fd04', '103', 'RATE', '您是否愿意继续使用该团购网站？ ', 1, NULL, 1, NULL, 1966080, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (149, '1ed08c925d374b0d9747932b6606fd04', '104', 'RATE', '您是否愿意推荐身边的人（亲朋好友）使用该团购网站？ ', 1, NULL, 1, NULL, 2031616,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (150, '1ed08c925d374b0d9747932b6606fd04', '105', 'RADIO', '您每月的团购花费约为？ ', 1, NULL, 1, NULL, 2097152, 24, '{
  \"options\": [{\"label\": \"50元以下\", \"value\": 1}, {\"label\": \"51~100元\", \"value\": 2}, {\"label\": \"101~200元\", \"value\": 3}, {\"label\": \"201~300元\", \"value\": 4}, {\"label\": \"301~500元\", \"value\": 5}, {\"label\": \"500~800元\", \"value\": 6}, {\"label\": \"800~1500元\", \"value\": 7}, {\"label\": \"1500元以上\", \"value\": 8}]}',
        NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (151, '1ed08c925d374b0d9747932b6606fd04', '100', 'RADIO', '您的性别是 ', 1, NULL, 1, NULL, 2162688, 24, '{
  \"options\": [{\"label\": \"男\", \"value\": 1}, {\"label\": \"女\", \"value\": 2}]}', NULL, '2021-01-11 13:58:09',
        '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (152, '1ed08c925d374b0d9747932b6606fd04', '101', 'SELECT', '您的出生年份是？  ', 1, NULL, 1, NULL, 2228224, 24, '{
  \"options\": [{\"label\": \"2005年后\", \"value\": 1}, {\"label\": \"2005年\", \"value\": 2}, {\"label\": \"2004年\", \"value\": 3}, {\"label\": \"2003年\", \"value\": 4}, {\"label\": \"2002年\", \"value\": 5}, {\"label\": \"0201年\", \"value\": 6}, {\"label\": \"2000年\", \"value\": 7}, {\"label\": \"1999年\", \"value\": 8}, {\"label\": \"1998年\", \"value\": 9}, {\"label\": \"1997年\", \"value\": 10}, {\"label\": \"1996年\", \"value\": 11}, {\"label\": \"1995年\", \"value\": 12}, {\"label\": \"1994年\", \"value\": 13}, {\"label\": \"1993年\", \"value\": 14}, {\"label\": \"1992年\", \"value\": 15}, {\"label\": \"1991年\", \"value\": 16}, {\"label\": \"1990年\", \"value\": 17}, {\"label\": \"1989年\", \"value\": 18}, {\"label\": \"1988年\", \"value\": 19}, {\"label\": \"1987年\", \"value\": 20}, {\"label\": \"1986年\", \"value\": 21}, {\"label\": \"1985年\", \"value\": 22}, {\"label\": \"1984年\", \"value\": 23}, {\"label\": \"1983年\", \"value\": 24}, {\"label\": \"1982年\", \"value\": 25}, {\"label\": \"1981年\", \"value\": 26}, {\"label\": \"1980年\", \"value\": 27}, {\"label\": \"1979年\", \"value\": 28}, {\"label\": \"1978年\", \"value\": 29}, {\"label\": \"1977年\", \"value\": 30}, {\"label\": \"1976年\", \"value\": 31}, {\"label\": \"1975年\", \"value\": 32}, {\"label\": \"1974年\", \"value\": 33}, {\"label\": \"1973年\", \"value\": 34}, {\"label\": \"1972年\", \"value\": 35}, {\"label\": \"1971年\", \"value\": 36}, {\"label\": \"1970年\", \"value\": 37}, {\"label\": \"1969年\", \"value\": 38}, {\"label\": \"1968年\", \"value\": 39}, {\"label\": \"1967年\", \"value\": 40}, {\"label\": \"1966年\", \"value\": 41}, {\"label\": \"1965年\", \"value\": 42}, {\"label\": \"1964年\", \"value\": 43}, {\"label\": \"1963年\", \"value\": 44}, {\"label\": \"1962年\", \"value\": 45}, {\"label\": \"1961年\", \"value\": 46}, {\"label\": \"1960年\", \"value\": 47}, {\"label\": \"1960年前\", \"value\": 48}]}',
        NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (153, '1ed08c925d374b0d9747932b6606fd04', '102', 'RADIO', '您的学历是  ', 1, NULL, 1, NULL, 2293760, 24, '{
  \"options\": [{\"label\": \"初中及以下\", \"value\": 1}, {\"label\": \"高中/中专\", \"value\": 2}, {\"label\": \"专科/高职\", \"value\": 3}, {\"label\": \"本科\", \"value\": 4}, {\"label\": \"硕士及以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (154, '1ed08c925d374b0d9747932b6606fd04', '103', 'RADIO', '您每月的收入大概是  ', 1, NULL, 1, NULL, 2359296, 24, '{
  \"options\": [{\"label\": \"1000元以下\", \"value\": 1}, {\"label\": \"1000-1999元\", \"value\": 2}, {\"label\": \"2000-3999元\", \"value\": 3}, {\"label\": \"4000-5999元\", \"value\": 4}, {\"label\": \"6000-9999元\", \"value\": 5}, {\"label\": \"10000-19999元\", \"value\": 6}, {\"label\": \"20000元以上\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (155, '1ed08c925d374b0d9747932b6606fd04', '104', 'RADIO', '您的职业是  ', 1, NULL, 1, NULL, 2424832, 24, '{
  \"options\": [{\"label\": \"学生\", \"value\": 1}, {\"label\": \"政府/机关干部/公务员/事业单位\", \"value\": 2}, {\"label\": \"企业管理者（包括基层及中高成管理者）\", \"value\": 3}, {\"label\": \"普通职员/白领工作者（在办公室/写字楼工作）\", \"value\": 4}, {\"label\": \"专业人员（如医生、律师、文体、记者、老师等）\", \"value\": 5}, {\"label\": \"蓝领工作者（普通工人）\", \"value\": 6}, {\"label\": \"销售人员/商店职员\", \"value\": 7}, {\"label\": \"自由职业者\", \"value\": 8}, {\"label\": \"退休\", \"value\": 9}, {\"label\": \"暂无固定职业\", \"value\": 10}, {\"label\": \"其他\", \"value\": 11}]}',
        NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (156, '1b4698a9e5bf4f80b6547f3153a53af0', '100', 'RADIO', '您是否在xx网站购买过玩具？', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:09',
        '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (157, '1b4698a9e5bf4f80b6547f3153a53af0', '101', 'RADIO', '您在xx网站购买玩具的次数是？', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"1~2次\", \"value\": 1}, {\"label\": \"3~5次\", \"value\": 2}, {\"label\": \"6~10次\", \"value\": 3}, {\"label\": \"10次以上\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (158, '1b4698a9e5bf4f80b6547f3153a53af0', '102', 'RADIO', '一般而言，您平均每次购买玩具的价格范围大概是？', 1, NULL, 1, NULL, 196608,
        24, '{
    \"options\": [{\"label\": \"0-50\", \"value\": 1}, {\"label\": \"51-100\", \"value\": 2}, {\"label\": \"101-20\", \"value\": 3}, {\"label\": \"201-300\", \"value\": 4}, {\"label\": \"301-500\", \"value\": 5}, {\"label\": \"500以上\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (159, '1b4698a9e5bf4f80b6547f3153a53af0', '103', 'RADIO', '到目前为止，您在xx网站购买玩具有多长时间了？', 1, NULL, 1, NULL, 262144,
        24, '{
    \"options\": [{\"label\": \"不到1个月\", \"value\": 1}, {\"label\": \"1-3个月（含 3个月）\", \"value\": 2}, {\"label\": \"3-6个月（含 6个月）\", \"value\": 3}, {\"label\": \"6-12个月（含 12个月）\", \"value\": 4}, {\"label\": \"1-2年（含2年）\", \"value\": 5}, {\"label\": \"2年以上\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (160, '1b4698a9e5bf4f80b6547f3153a53af0', '100', 'RADIO', '对于在xx网站购买玩具而言，您认为哪些因素比较重要？', 1, NULL, 1, NULL, 327680,
        24, '{
    \"options\": [{\"label\": \"网站版面（布局、图文、颜色）结构布局合理\", \"value\": 1}, {\"label\": \"玩具种类多、全面\", \"value\": 2}, {\"label\": \"玩具质量好\", \"value\": 3}, {\"label\": \"玩具价格便宜\", \"value\": 4}, {\"label\": \"促销活动多\", \"value\": 5}, {\"label\": \"玩具是环保、安全的\", \"value\": 6}, {\"label\": \"图片与实物符合\", \"value\": 7}, {\"label\": \"产品描述与实物符合\", \"value\": 8}, {\"label\": \"支付方式多/全面，下单、支付等过程安全、有保障\", \"value\": 9}, {\"label\": \"网站操作使用便捷流畅（如商品浏览、查找等）\", \"value\": 10}, {\"label\": \"发货速度快\", \"value\": 11}, {\"label\": \"网站打开速度快，稳定\", \"value\": 12}, {\"label\": \"对用户咨询/投诉/反馈处理及时\", \"value\": 13}, {\"label\": \"售后服务体系完善，能够及时处理我购买商品后出现的问题\", \"value\": 14}, {\"label\": \"其他\", \"value\": 15}]}',
        NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (161, '1b4698a9e5bf4f80b6547f3153a53af0', '101', 'RATE', '总的来说，您对xx玩具网站的满意度是？', 1, NULL, 1, NULL, 393216, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:09', '2021-01-11 13:58:09', 0);
INSERT INTO `pr_project_template_item`
VALUES (162, '1b4698a9e5bf4f80b6547f3153a53af0', '102', 'RATE', '您是否愿意继续在xx网站购买玩具？', 1, NULL, 1, NULL, 458752, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (163, '1b4698a9e5bf4f80b6547f3153a53af0', '103', 'RATE', '您是否愿意推荐身边的人（亲朋好友）使用xx网站？', 1, NULL, 1, NULL, 524288,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (164, '1b4698a9e5bf4f80b6547f3153a53af0', '104', 'RATE', '您对xx网站“版面（布局、图文、颜色）结构布局合理”的同意程度是？', 1, NULL, 1, NULL,
        589824, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (165, '1b4698a9e5bf4f80b6547f3153a53af0', '105', 'RATE', '您对xx网站“玩具种类多、全面”的同意程度是？', 1, NULL, 1, NULL, 655360, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (166, '1b4698a9e5bf4f80b6547f3153a53af0', '106', 'RATE', '您对xx网站“玩具质量好”的同意程度是？', 1, NULL, 1, NULL, 720896, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (167, '1b4698a9e5bf4f80b6547f3153a53af0', '107', 'RATE', '您对xx网站“玩具价格便宜”的同意程度是？', 1, NULL, 1, NULL, 786432, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (168, '1b4698a9e5bf4f80b6547f3153a53af0', '108', 'RATE', '您对xx网站“促销活动多”的同意程度是？', 1, NULL, 1, NULL, 851968, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (169, '1b4698a9e5bf4f80b6547f3153a53af0', '109', 'RATE', '您对xx网站“玩具是环保、安全的”的同意程度是？', 1, NULL, 1, NULL, 917504,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (170, '1b4698a9e5bf4f80b6547f3153a53af0', '110', 'RATE', '您对xx网站“图片与实物符合”的同意程度是？', 1, NULL, 1, NULL, 983040, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (171, '1b4698a9e5bf4f80b6547f3153a53af0', '111', 'RATE', '您对xx网站“产品描述与实物符合”的同意程度是？', 1, NULL, 1, NULL, 1048576,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (172, '1b4698a9e5bf4f80b6547f3153a53af0', '112', 'RATE', '您对xx网站“下单、支付等过程安全、有保障”的同意程度是？', 1, NULL, 1, NULL,
        1114112, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (173, '1b4698a9e5bf4f80b6547f3153a53af0', '113', 'RATE', '您对xx网站“支付方式多/全面”的同意程度是？', 1, NULL, 1, NULL, 1179648,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (174, '1b4698a9e5bf4f80b6547f3153a53af0', '114', 'RATE', '您对xx网站“操作使用便捷流畅（如商品浏览、查找等）”的同意程度是？', 1, NULL, 1, NULL,
        1245184, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (175, '1b4698a9e5bf4f80b6547f3153a53af0', '115', 'RATE', '您对xx网站“发货速度快”的同意程度是？', 1, NULL, 1, NULL, 1310720, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (176, '1b4698a9e5bf4f80b6547f3153a53af0', '116', 'RATE', '您对xx网站“所购商品与卖家描述一致”的同意程度是？', 1, NULL, 1, NULL, 1376256,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (177, '1b4698a9e5bf4f80b6547f3153a53af0', '117', 'RATE', '您对xx网站“打开速度快，稳定”的同意程度是？', 1, NULL, 1, NULL, 1441792,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (178, '1b4698a9e5bf4f80b6547f3153a53af0', '118', 'RATE', '您对xx网站“对用户咨询/投诉/反馈处理及时”的同意程度是？', 1, NULL, 1, NULL,
        1507328, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (179, '1b4698a9e5bf4f80b6547f3153a53af0', '119', 'RATE', '您对xx网站“售后服务体系完善，能够及时处理我购买商品后出现的问题”的同意程度是？', 1, NULL, 1,
        NULL, 1572864, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (180, '1b4698a9e5bf4f80b6547f3153a53af0', '100', 'RADIO', '除xx网站以外，您还在以下哪些网站购买过玩具？', 1, NULL, 1, NULL, 1638400,
        24, '{
    \"options\": [{\"label\": \"卓越网\", \"value\": 1}, {\"label\": \"凡客诚品\", \"value\": 2}, {\"label\": \"红孩子\", \"value\": 3}, {\"label\": \"京东商城\", \"value\": 4}, {\"label\": \"当当网\", \"value\": 5}, {\"label\": \"QQ商城\", \"value\": 6}, {\"label\": \"拍拍\", \"value\": 7}, {\"label\": \"淘宝\", \"value\": 8}, {\"label\": \"天猫（淘宝商城）\", \"value\": 9}, {\"label\": \"好乐买\", \"value\": 10}, {\"label\": \"1号店\", \"value\": 11}, {\"label\": \"苏宁易购\", \"value\": 12}, {\"label\": \"QQ网购\", \"value\": 13}, {\"label\": \"易迅网\", \"value\": 14}, {\"label\": \"亚马逊\", \"value\": 15}, {\"label\": \"其他\", \"value\": 16}]}',
        NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (181, '1b4698a9e5bf4f80b6547f3153a53af0', '101', 'RADIO', '其中，您最常使用的网站是？', 1, NULL, 1, NULL, 1703936, 24, '{
  \"options\": [{\"label\": \"卓越网\", \"value\": 1}, {\"label\": \"凡客诚品\", \"value\": 2}, {\"label\": \"红孩子\", \"value\": 3}, {\"label\": \"京东商城\", \"value\": 4}, {\"label\": \"当当网\", \"value\": 5}, {\"label\": \"QQ商城\", \"value\": 6}, {\"label\": \"拍拍\", \"value\": 7}, {\"label\": \"淘宝\", \"value\": 8}, {\"label\": \"天猫（淘宝商城）\", \"value\": 9}, {\"label\": \"好乐买\", \"value\": 10}, {\"label\": \"1号店\", \"value\": 11}, {\"label\": \"苏宁易购\", \"value\": 12}, {\"label\": \"QQ网购\", \"value\": 13}, {\"label\": \"易迅网\", \"value\": 14}, {\"label\": \"亚马逊\", \"value\": 15}, {\"label\": \"其他\", \"value\": 16}]}',
        NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (182, '1b4698a9e5bf4f80b6547f3153a53af0', '102', 'RATE', '总的来说，您对该网站的满意度是？', 1, NULL, 1, NULL, 1769472, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (183, '1b4698a9e5bf4f80b6547f3153a53af0', '103', 'RATE', '您是否愿意继续使用该网站？', 1, NULL, 1, NULL, 1835008, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (184, '1b4698a9e5bf4f80b6547f3153a53af0', '104', 'RATE', '您是否愿意推荐身边的人（亲朋好友）使用该网站？', 1, NULL, 1, NULL, 1900544,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (185, '1b4698a9e5bf4f80b6547f3153a53af0', '100', 'RADIO', '您的性别是', 1, NULL, 1, NULL, 1966080, 24, '{
  \"options\": [{\"label\": \"男\", \"value\": 1}, {\"label\": \"女\", \"value\": 2}]}', NULL, '2021-01-11 13:58:10',
        '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (186, '1b4698a9e5bf4f80b6547f3153a53af0', '101', 'SELECT', '您的出生年份是？', 1, NULL, 1, NULL, 2031616, 24, '{
  \"options\": [{\"label\": \"2005年后\", \"value\": 1}, {\"label\": \"2005年\", \"value\": 2}, {\"label\": \"2004年\", \"value\": 3}, {\"label\": \"2003年\", \"value\": 4}, {\"label\": \"2002年\", \"value\": 5}, {\"label\": \"2001年\", \"value\": 6}, {\"label\": \"2000年\", \"value\": 7}, {\"label\": \"1999年\", \"value\": 8}, {\"label\": \"1998年\", \"value\": 9}, {\"label\": \"1997年\", \"value\": 10}, {\"label\": \"1996年\", \"value\": 11}, {\"label\": \"1995年\", \"value\": 12}, {\"label\": \"1994年\", \"value\": 13}, {\"label\": \"1993年\", \"value\": 14}, {\"label\": \"1992年\", \"value\": 15}, {\"label\": \"1991年\", \"value\": 16}, {\"label\": \"1990年\", \"value\": 17}, {\"label\": \"1989年\", \"value\": 18}, {\"label\": \"1988年\", \"value\": 19}, {\"label\": \"1987年\", \"value\": 20}, {\"label\": \"1986年\", \"value\": 21}, {\"label\": \"1985年\", \"value\": 22}, {\"label\": \"1984年\", \"value\": 23}, {\"label\": \"1983年\", \"value\": 24}, {\"label\": \"1982年\", \"value\": 25}, {\"label\": \"1981年\", \"value\": 26}, {\"label\": \"1980年\", \"value\": 27}, {\"label\": \"1979年\", \"value\": 28}, {\"label\": \"1978年\", \"value\": 29}, {\"label\": \"1977年\", \"value\": 30}, {\"label\": \"1976年\", \"value\": 31}, {\"label\": \"1975年\", \"value\": 32}, {\"label\": \"1974年\", \"value\": 33}, {\"label\": \"1973年\", \"value\": 34}, {\"label\": \"1972年\", \"value\": 35}, {\"label\": \"1971年\", \"value\": 36}, {\"label\": \"1970年\", \"value\": 37}, {\"label\": \"1969年\", \"value\": 38}, {\"label\": \"1968年\", \"value\": 39}, {\"label\": \"1967年\", \"value\": 40}, {\"label\": \"1966年\", \"value\": 41}, {\"label\": \"1965年\", \"value\": 42}, {\"label\": \"1964年\", \"value\": 43}, {\"label\": \"1963年\", \"value\": 44}, {\"label\": \"1962年\", \"value\": 45}, {\"label\": \"1961年\", \"value\": 46}, {\"label\": \"1960年\", \"value\": 47}, {\"label\": \"1960年前\", \"value\": 48}]}',
        NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (187, '1b4698a9e5bf4f80b6547f3153a53af0', '102', 'RADIO', '您的学历是', 1, NULL, 1, NULL, 2097152, 24, '{
  \"options\": [{\"label\": \"初中及以下\", \"value\": 1}, {\"label\": \"高中/中专\", \"value\": 2}, {\"label\": \"专科/高职\", \"value\": 3}, {\"label\": \"本科\", \"value\": 4}, {\"label\": \"硕士及以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (188, '1b4698a9e5bf4f80b6547f3153a53af0', '103', 'RADIO', '您每月的收入大概是', 1, NULL, 1, NULL, 2162688, 24, '{
  \"options\": [{\"label\": \"1000元以下\", \"value\": 1}, {\"label\": \"1000-1999元\", \"value\": 2}, {\"label\": \"2000-3999元\", \"value\": 3}, {\"label\": \"4000-5999元\", \"value\": 4}, {\"label\": \"6000-9999元\", \"value\": 5}, {\"label\": \"10000-19999元\", \"value\": 6}, {\"label\": \"20000元以上\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (189, '1b4698a9e5bf4f80b6547f3153a53af0', '104', 'RADIO', '您的职业是', 1, NULL, 1, NULL, 2228224, 24, '{
  \"options\": [{\"label\": \"学生\", \"value\": 1}, {\"label\": \"政府/机关干部/公务员/事业单位\", \"value\": 2}, {\"label\": \"企业管理者（包括基层及中高成管理者）\", \"value\": 3}, {\"label\": \"普通职员/白领工作者（在办公室/写字楼工作）\", \"value\": 4}, {\"label\": \"专业人员（如医生、律师、文体、记者、老师等）\", \"value\": 5}, {\"label\": \"蓝领工作者（普通工人）\", \"value\": 6}, {\"label\": \"销售人员/商店职员\", \"value\": 7}, {\"label\": \"自由职业者\", \"value\": 8}, {\"label\": \"退休\", \"value\": 9}, {\"label\": \"暂无固定职业\", \"value\": 10}, {\"label\": \"其他\", \"value\": 11}]}',
        NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (190, '124ee8c12c9a4de28d2b691549a8bbd3', '100', 'RADIO', '最近半年，您是否在玩网络游戏 ', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:10',
        '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (191, '124ee8c12c9a4de28d2b691549a8bbd3', '101', 'RADIO', '通常情况下，您通过哪些途径了解网络游戏  ', 1, NULL, 1, NULL, 131072, 24,
        '{
          \"options\": [{\"label\": \"专业游戏网站\", \"value\": 1}, {\"label\": \"游戏官方网站\", \"value\": 2}, {\"label\": \"朋友/同学推荐\", \"value\": 3}, {\"label\": \"网吧游戏推荐\", \"value\": 4}, {\"label\": \"游戏杂志评测\", \"value\": 5}, {\"label\": \"户外广告\", \"value\": 6}, {\"label\": \"论坛/BBS\", \"value\": 7}, {\"label\": \"QQ游戏推荐\", \"value\": 8}, {\"label\": \"报纸/杂志广告\", \"value\": 9}, {\"label\": \"综合门户网站\", \"value\": 10}, {\"label\": \"其他\", \"value\": 11}]}',
        NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (192, '124ee8c12c9a4de28d2b691549a8bbd3', '102', 'RADIO', '总体来说，您最常玩哪一类型的网络游戏 ', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"角色扮演类（例如魔兽世界、梦幻西游等）\", \"value\": 1}, {\"label\": \"策略类（例如封神榜3、将军等）\", \"value\": 2}, {\"label\": \"动作类（倩女幽魂、侠客世界等）\", \"value\": 3}, {\"label\": \"体育竞技类（例如体育帝国等）\", \"value\": 4}, {\"label\": \"音乐舞蹈类（例如炫舞、炫音等）\", \"value\": 5}, {\"label\": \"模拟经营类（例如足球经理、农场、超市等）\", \"value\": 6}, {\"label\": \"益智棋牌类 （例如斗地主、麻将等）\", \"value\": 7}, {\"label\": \"其他\", \"value\": 8}]}',
        NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (193, '124ee8c12c9a4de28d2b691549a8bbd3', '103', 'RADIO', '目前您最常玩的网络游戏是哪家公司的 ', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"腾讯\", \"value\": 1}, {\"label\": \"盛大\", \"value\": 2}, {\"label\": \"网易\", \"value\": 3}, {\"label\": \"完美时空\", \"value\": 4}, {\"label\": \"畅游\", \"value\": 5}, {\"label\": \"巨人\", \"value\": 6}, {\"label\": \"九城\", \"value\": 7}, {\"label\": \"金山\", \"value\": 8}, {\"label\": \"网龙\", \"value\": 9}, {\"label\": \"世纪天成\", \"value\": 10}, {\"label\": \"我不知道/不清楚\", \"value\": 11}, {\"label\": \"其他\", \"value\": 12}]}',
        NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (194, '124ee8c12c9a4de28d2b691549a8bbd3', '104', 'RADIO', '您玩该公司网络游戏大概多久了 ', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"不到3个月\", \"value\": 1}, {\"label\": \"3~6个月\", \"value\": 2}, {\"label\": \"6个月~1年\", \"value\": 3}, {\"label\": \"1年~3年\", \"value\": 4}, {\"label\": \"3年以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (195, '124ee8c12c9a4de28d2b691549a8bbd3', '105', 'RADIO', '您每个月玩网络游戏的花费大概是多少 ', 1, NULL, 1, NULL, 393216, 24, '{
  \"options\": [{\"label\": \"没有任何花费\", \"value\": 1}, {\"label\": \"30元以下\", \"value\": 2}, {\"label\": \"30–50元\", \"value\": 3}, {\"label\": \"50–80元\", \"value\": 4}, {\"label\": \"80–100元\", \"value\": 5}, {\"label\": \"100–200元\", \"value\": 6}, {\"label\": \"200–500元\", \"value\": 7}, {\"label\": \"500-1000元\", \"value\": 8}, {\"label\": \"1000-5000元\", \"value\": 9}, {\"label\": \"5000-10000元\", \"value\": 10}, {\"label\": \"10000元及以上\", \"value\": 11}]}',
        NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (196, '124ee8c12c9a4de28d2b691549a8bbd3', '106', 'RADIO', '主要和哪些人玩网络游戏 ', 1, NULL, 1, NULL, 458752, 24, '{
  \"options\": [{\"label\": \"游戏中认识的朋友\", \"value\": 1}, {\"label\": \"同学\", \"value\": 2}, {\"label\": \"同事\", \"value\": 3}, {\"label\": \"家人/亲戚\", \"value\": 4}, {\"label\": \"自己一个人玩\", \"value\": 5}, {\"label\": \"生活中认识的朋友\", \"value\": 6}, {\"label\": \"陌生人\", \"value\": 7}, {\"label\": \"其他\", \"value\": 8}]}',
        NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (197, '124ee8c12c9a4de28d2b691549a8bbd3', '107', 'RADIO', '通常情况下，您放弃一款网络游戏的主要原因是 ', 1, NULL, 1, NULL, 524288, 24,
        '{
          \"options\": [{\"label\": \"游戏的花费太大\", \"value\": 1}, {\"label\": \"更新太慢没有追求\", \"value\": 2}, {\"label\": \"装备强化失败\", \"value\": 3}, {\"label\": \"升级困难\", \"value\": 4}, {\"label\": \"对游戏PK或副本系统不满意\", \"value\": 5}, {\"label\": \"盗号，外挂\", \"value\": 6}, {\"label\": \"客服效率低/态度恶劣\", \"value\": 7}, {\"label\": \"服务器不稳定，很卡\", \"value\": 8}, {\"label\": \"职业不平衡\", \"value\": 9}, {\"label\": \"朋友不玩了/找不到人一起玩，很难认识到游戏里面的朋友\", \"value\": 10}, {\"label\": \"上手太难，经常是机械性的点击和操作\", \"value\": 11}, {\"label\": \"去玩其他游戏了\", \"value\": 0}, {\"label\": \"学习/工作变忙了，时间变少了\", \"value\": 13}, {\"label\": \"有了新的兴趣爱好，不想玩网络游戏了\", \"value\": 14}, {\"label\": \"从来没有放弃过一款游戏\", \"value\": 15}, {\"label\": \"其他\", \"value\": 16}]}',
        NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (198, '124ee8c12c9a4de28d2b691549a8bbd3', '100', 'RADIO', '您是否玩过xx网络游戏？ ', 1, NULL, 1, NULL, 589824, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:10',
        '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (199, '124ee8c12c9a4de28d2b691549a8bbd3', '101', 'RADIO', '您认为对于xx游戏而言，哪些因素比较重要？ ', 1, NULL, 1, NULL, 655360, 24,
        '{
          \"options\": [{\"label\": \"游戏平衡性（副本平衡、职业平衡、阵营平衡等）\", \"value\": 1}, {\"label\": \"游戏本身（如游戏数量、质量、游戏更新速度等）\", \"value\": 2}, {\"label\": \"反作弊/外挂措施 游戏故事性/世界观 游戏是否收费\", \"value\": 3}, {\"label\": \"连接速度及稳定性\", \"value\": 4}, {\"label\": \"画面和音乐效果\", \"value\": 5}, {\"label\": \"操作难易程度\", \"value\": 6}, {\"label\": \"玩家互动（交易、聊天、组队、结婚等）\", \"value\": 7}, {\"label\": \"活动趣味性\", \"value\": 8}, {\"label\": \"游戏环境（如文明用语、过程透明/游戏公平、帮助指引、账号安全等）\", \"value\": 9}, {\"label\": \"其他\", \"value\": 10}]}',
        NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (200, '124ee8c12c9a4de28d2b691549a8bbd3', '102', 'RATE', '总的来说，您对xx游戏的满意度是？ ', 1, NULL, 1, NULL, 720896, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (201, '124ee8c12c9a4de28d2b691549a8bbd3', '103', 'RATE', '您是否愿意继续玩xx游戏？ ', 1, NULL, 1, NULL, 786432, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (202, '124ee8c12c9a4de28d2b691549a8bbd3', '104', 'RATE', '您是否愿意推荐身边的人（亲朋好友）玩xx游戏？ ', 1, NULL, 1, NULL, 851968,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (203, '124ee8c12c9a4de28d2b691549a8bbd3', '105', 'RATE', '您对xx游戏的“游戏质量高，可玩性好”的同意程度是？', 1, NULL, 1, NULL, 917504,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (204, '124ee8c12c9a4de28d2b691549a8bbd3', '106', 'RATE', '您对xx游戏的“游戏更新快”的同意程度是？ ', 1, NULL, 1, NULL, 983040, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (205, '124ee8c12c9a4de28d2b691549a8bbd3', '107', 'RATE', '您对xx游戏的“游戏更新快”的同意程度是？ ', 1, NULL, 1, NULL, 1048576, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (206, '124ee8c12c9a4de28d2b691549a8bbd3', '108', 'RATE', '您对xx游戏的“游戏平衡性好（副本平衡、职业平衡、阵营平衡等）”的同意程度是？ ', 1, NULL, 1,
        NULL, 1114112, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (207, '124ee8c12c9a4de28d2b691549a8bbd3', '109', 'RATE', '您对xx游戏的“反作弊/外挂措施到位”的同意程度是？ ', 1, NULL, 1, NULL,
        1179648, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (208, '124ee8c12c9a4de28d2b691549a8bbd3', '110', 'RATE', '您对xx游戏的“游戏故事性/世界观是我认同的”的同意程度是？ ', 1, NULL, 1, NULL,
        1245184, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (209, '124ee8c12c9a4de28d2b691549a8bbd3', '111', 'RATE', '您对xx游戏的“游戏收费合理”的同意程度是？ ', 1, NULL, 1, NULL, 1310720,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (210, '124ee8c12c9a4de28d2b691549a8bbd3', '112', 'RATE', '您对xx游戏的“连接速度快、稳定（如启动/加载/进入游戏速度、过程流畅性稳定性等）”的同意程度是？ ', 1,
        NULL, 1, NULL, 1376256, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (211, '124ee8c12c9a4de28d2b691549a8bbd3', '113', 'RATE', '您对xx游戏的“画面精美，音乐效果好”的同意程度是？ ', 1, NULL, 1, NULL,
        1441792, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (212, '124ee8c12c9a4de28d2b691549a8bbd3', '114', 'RATE', '您对xx游戏的“操作（如打开/登陆、查找/添加/进入游戏、过程操作、退出游戏等）简单流畅”的同意程度是？',
        1, NULL, 1, NULL, 1507328, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (213, '124ee8c12c9a4de28d2b691549a8bbd3', '115', 'RATE', '您对xx游戏的“玩家互动（如与好友互动、游戏过程中的玩家交流、结交新朋友、结婚等）好”的同意程度是？ ',
        1, NULL, 1, NULL, 1572864, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (214, '124ee8c12c9a4de28d2b691549a8bbd3', '116', 'RATE', '您对xx游戏的“活动有趣味性”的同意程度是？ ', 1, NULL, 1, NULL, 1638400,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (215, '124ee8c12c9a4de28d2b691549a8bbd3', '117', 'RATE', '您对xx游戏的“游戏环境好（如文明用语、过程透明/游戏公平、帮助指引、账号安全等）”的同意程度是？ ', 1,
        NULL, 1, NULL, 1703936, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (216, '124ee8c12c9a4de28d2b691549a8bbd3', '100', 'RADIO', '您的性别是 ', 1, NULL, 1, NULL, 1769472, 24, '{
  \"options\": [{\"label\": \"男\", \"value\": 1}, {\"label\": \"女\", \"value\": 2}]}', NULL, '2021-01-11 13:58:10',
        '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (217, '124ee8c12c9a4de28d2b691549a8bbd3', '101', 'SELECT', '您的出生年份是？  ', 1, NULL, 1, NULL, 1835008, 24, '{
  \"options\": [{\"label\": \"2005年后\", \"value\": 1}, {\"label\": \"2005年\", \"value\": 2}, {\"label\": \"2004年\", \"value\": 3}, {\"label\": \"2003年\", \"value\": 4}, {\"label\": \"2002年\", \"value\": 5}, {\"label\": \"0201年\", \"value\": 6}, {\"label\": \"2000年\", \"value\": 7}, {\"label\": \"1999年\", \"value\": 8}, {\"label\": \"1998年\", \"value\": 9}, {\"label\": \"1997年\", \"value\": 10}, {\"label\": \"1996年\", \"value\": 11}, {\"label\": \"1995年\", \"value\": 12}, {\"label\": \"1994年\", \"value\": 13}, {\"label\": \"1993年\", \"value\": 14}, {\"label\": \"1992年\", \"value\": 15}, {\"label\": \"1991年\", \"value\": 16}, {\"label\": \"1990年\", \"value\": 17}, {\"label\": \"1989年\", \"value\": 18}, {\"label\": \"1988年\", \"value\": 19}, {\"label\": \"1987年\", \"value\": 20}, {\"label\": \"1986年\", \"value\": 21}, {\"label\": \"1985年\", \"value\": 22}, {\"label\": \"1984年\", \"value\": 23}, {\"label\": \"1983年\", \"value\": 24}, {\"label\": \"1982年\", \"value\": 25}, {\"label\": \"1981年\", \"value\": 26}, {\"label\": \"1980年\", \"value\": 27}, {\"label\": \"1979年\", \"value\": 28}, {\"label\": \"1978年\", \"value\": 29}, {\"label\": \"1977年\", \"value\": 30}, {\"label\": \"1976年\", \"value\": 31}, {\"label\": \"1975年\", \"value\": 32}, {\"label\": \"1974年\", \"value\": 33}, {\"label\": \"1973年\", \"value\": 34}, {\"label\": \"1972年\", \"value\": 35}, {\"label\": \"1971年\", \"value\": 36}, {\"label\": \"1970年\", \"value\": 37}, {\"label\": \"1969年\", \"value\": 38}, {\"label\": \"1968年\", \"value\": 39}, {\"label\": \"1967年\", \"value\": 40}, {\"label\": \"1966年\", \"value\": 41}, {\"label\": \"1965年\", \"value\": 42}, {\"label\": \"1964年\", \"value\": 43}, {\"label\": \"1963年\", \"value\": 44}, {\"label\": \"1962年\", \"value\": 45}, {\"label\": \"1961年\", \"value\": 46}, {\"label\": \"1960年\", \"value\": 47}, {\"label\": \"1960年前\", \"value\": 48}]}',
        NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (218, '124ee8c12c9a4de28d2b691549a8bbd3', '102', 'RADIO', '您的学历是  ', 1, NULL, 1, NULL, 1900544, 24, '{
  \"options\": [{\"label\": \"初中及以下\", \"value\": 1}, {\"label\": \"高中/中专\", \"value\": 2}, {\"label\": \"专科/高职\", \"value\": 3}, {\"label\": \"本科\", \"value\": 4}, {\"label\": \"硕士及以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (219, '124ee8c12c9a4de28d2b691549a8bbd3', '103', 'RADIO', '您每月的收入大概是  ', 1, NULL, 1, NULL, 1966080, 24, '{
  \"options\": [{\"label\": \"1000元以下\", \"value\": 1}, {\"label\": \"1000-1999元\", \"value\": 2}, {\"label\": \"2000-3999元\", \"value\": 3}, {\"label\": \"4000-5999元\", \"value\": 4}, {\"label\": \"6000-9999元\", \"value\": 5}, {\"label\": \"10000-19999元\", \"value\": 6}, {\"label\": \"20000元以上\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (220, '124ee8c12c9a4de28d2b691549a8bbd3', '104', 'RADIO', '您的职业是  ', 1, NULL, 1, NULL, 2031616, 24, '{
  \"options\": [{\"label\": \"学生\", \"value\": 1}, {\"label\": \"政府/机关干部/公务员/事业单位\", \"value\": 2}, {\"label\": \"企业管理者（包括基层及中高成管理者）\", \"value\": 3}, {\"label\": \"普通职员/白领工作者（在办公室/写字楼工作）\", \"value\": 4}, {\"label\": \"专业人员（如医生、律师、文体、记者、老师等）\", \"value\": 5}, {\"label\": \"蓝领工作者（普通工人）\", \"value\": 6}, {\"label\": \"销售人员/商店职员\", \"value\": 7}, {\"label\": \"自由职业者\", \"value\": 8}, {\"label\": \"退休\", \"value\": 9}, {\"label\": \"暂无固定职业\", \"value\": 10}, {\"label\": \"其他\", \"value\": 11}]}',
        NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (221, '9698626c0c0e4a97a0c1f632984a18b9', '100', 'RADIO', '您进入公司多长时间了? ', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"少于3个月\", \"value\": 1}, {\"label\": \"3-6个月\", \"value\": 2}, {\"label\": \"6个月以上，1年以下\", \"value\": 3}, {\"label\": \"1年及以上，2年以下\", \"value\": 4}, {\"label\": \"2年及以上，3年以下\", \"value\": 5}, {\"label\": \"3年及以上\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:10', '2021-01-11 13:58:10', 0);
INSERT INTO `pr_project_template_item`
VALUES (222, '9698626c0c0e4a97a0c1f632984a18b9', '101', 'INPUT', '您目前的职位是？ ', 1, NULL, 1, NULL, 131072, 24, '{}', NULL,
        '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (223, '9698626c0c0e4a97a0c1f632984a18b9', '100', 'RADIO', '对于在xx公司工作而言，您认为哪些因素比较重要？ ', 1, NULL, 1, NULL, 196608,
        24, '{
    \"options\": [{\"label\": \"公司远景与企业文化\", \"value\": 1}, {\"label\": \"公司政策与制度\", \"value\": 2}, {\"label\": \"工作环境\", \"value\": 3}, {\"label\": \"上级沟通和关怀\", \"value\": 4}, {\"label\": \"个人能力发挥\", \"value\": 5}, {\"label\": \"同事关系\", \"value\": 6}, {\"label\": \"员工关怀\", \"value\": 7}, {\"label\": \"薪酬与福利\", \"value\": 8}, {\"label\": \"培训与发展\", \"value\": 9}, {\"label\": \"其他\", \"value\": 10}]}',
        NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (224, '9698626c0c0e4a97a0c1f632984a18b9', '101', 'RATE', '您对“我非常看好公司的发展前景”的同意程度是？', 1, NULL, 1, NULL, 262144, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (225, '9698626c0c0e4a97a0c1f632984a18b9', '102', 'RATE', '您对“公司管理层经常向员工描述未来远景”的同意程度是？ ', 1, NULL, 1, NULL,
        327680, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (226, '9698626c0c0e4a97a0c1f632984a18b9', '103', 'RATE', '您对“公司是一个能吸引人才的地方”的同意程度是？ ', 1, NULL, 1, NULL, 393216,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (227, '9698626c0c0e4a97a0c1f632984a18b9', '104', 'RATE', '您对“公司的文化氛围是轻松、融洽的”的同意程度是？ ', 1, NULL, 1, NULL, 458752,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (228, '9698626c0c0e4a97a0c1f632984a18b9', '105', 'RATE', '您对“公司的人事政策与制度是明确和公开的”的同意程度是？ ', 1, NULL, 1, NULL,
        524288, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (229, '9698626c0c0e4a97a0c1f632984a18b9', '106', 'RATE', '您对“公司的各项管理制度能被良好的贯彻执行”的同意程度是？ ', 1, NULL, 1, NULL,
        589824, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (230, '9698626c0c0e4a97a0c1f632984a18b9', '107', 'RATE', '您对“公司奖惩制度是公正和公平的”的同意程度是？ ', 1, NULL, 1, NULL, 655360,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (231, '9698626c0c0e4a97a0c1f632984a18b9', '108', 'RATE', '您对“公司鼓励员工提出改善建议并能得到及时反馈”的同意程度是？ ', 1, NULL, 1, NULL,
        720896, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (232, '9698626c0c0e4a97a0c1f632984a18b9', '109', 'RATE', '您对“工作中的违规事件和行为都能得到正确处理”的同意程度是？ ', 1, NULL, 1, NULL,
        786432, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (233, '9698626c0c0e4a97a0c1f632984a18b9', '110', 'RATE', '您对“公司的办公设备很齐全”的同意程度是？ ', 1, NULL, 1, NULL, 851968, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (234, '9698626c0c0e4a97a0c1f632984a18b9', '111', 'RATE', '您对“公司的办公环境很干净”的同意程度是？ ', 1, NULL, 1, NULL, 917504, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (235, '9698626c0c0e4a97a0c1f632984a18b9', '112', 'RATE', '您对“当我工作取得突出成绩时，能立即得到上级的表扬”的同意程度是？ ', 1, NULL, 1, NULL,
        983040, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (236, '9698626c0c0e4a97a0c1f632984a18b9', '113', 'RATE', '您对“直接上级会主动关心我的工作情绪和绩效”的同意程度是？ ', 1, NULL, 1, NULL,
        1048576, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (237, '9698626c0c0e4a97a0c1f632984a18b9', '114', 'RATE', '您对“我的上级会提供给我必要的指导和协调”的同意程度是？ ', 1, NULL, 1, NULL,
        1114112, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (238, '9698626c0c0e4a97a0c1f632984a18b9', '115', 'RATE', '您对“我们部门内部的职位设置、工作安排合理”的同意程度是？ ', 1, NULL, 1, NULL,
        1179648, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (239, '9698626c0c0e4a97a0c1f632984a18b9', '116', 'RATE', '您对“我们部门内每个职位的分工和职责都很明确”的同意程度是？', 1, NULL, 1, NULL,
        1245184, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (240, '9698626c0c0e4a97a0c1f632984a18b9', '117', 'RATE', '您对“我的工作需要经常加班才能完成”的同意程度是？ ', 1, NULL, 1, NULL, 1310720,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (241, '9698626c0c0e4a97a0c1f632984a18b9', '118', 'RATE', '您对“工作中我能充分发挥自己才能和技术”的同意程度是？', 1, NULL, 1, NULL,
        1376256, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (242, '9698626c0c0e4a97a0c1f632984a18b9', '100', 'RATE', '您对“公司内同事间能相互尊重、相互帮助”的同意程度是？ ', 1, NULL, 1, NULL,
        1441792, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (243, '9698626c0c0e4a97a0c1f632984a18b9', '101', 'RATE', '您对“其他部门能够给我所在的部门提供良好的配合”的同意程度是？ ', 1, NULL, 1, NULL,
        1507328, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (244, '9698626c0c0e4a97a0c1f632984a18b9', '102', 'RATE', '您对“我所在的团队氛围很和谐，同事相处轻松愉快”的同意程度是？ ', 1, NULL, 1, NULL,
        1572864, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (245, '9698626c0c0e4a97a0c1f632984a18b9', '103', 'RATE', '您对“当过节/过生日或有重大事件时，我会收到公司或部门的礼物/祝福和温馨提醒”的同意程度是？ ', 1,
        NULL, 1, NULL, 1638400, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (246, '9698626c0c0e4a97a0c1f632984a18b9', '104', 'RATE', '您对“通过参加公司或部门组织的活动，可以有效疏解我的工作压力”的同意程度是？ ', 1, NULL, 1,
        NULL, 1703936, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (247, '9698626c0c0e4a97a0c1f632984a18b9', '105', 'RATE', '您对“当我遇到工作或生活的问题时，我知道公司或部门有哪些渠道可以进行反映”的同意程度是？ ', 1,
        NULL, 1, NULL, 1769472, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (248, '9698626c0c0e4a97a0c1f632984a18b9', '106', 'RATE', '您对“公司有很明确的绩效衡量标准”的同意程度是？ ', 1, NULL, 1, NULL, 1835008,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (249, '9698626c0c0e4a97a0c1f632984a18b9', '107', 'RATE', '您对“在公司，工作表现优异的人得到了更高的回报”的同意程度是？ ', 1, NULL, 1, NULL,
        1900544, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (250, '9698626c0c0e4a97a0c1f632984a18b9', '108', 'RATE', '您对“我的表现和所得报酬紧密联系”的同意程度是？', 1, NULL, 1, NULL, 1966080,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (251, '9698626c0c0e4a97a0c1f632984a18b9', '109', 'RATE', '您对“我目前的薪金待遇与承担的工作是相符的”的同意程度是？ ', 1, NULL, 1, NULL,
        2031616, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (252, '9698626c0c0e4a97a0c1f632984a18b9', '110', 'RATE', '您对“与同行相比，我认为公司的福利待遇比较合理”的同意程度是？', 1, NULL, 1, NULL,
        2097152, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (253, '9698626c0c0e4a97a0c1f632984a18b9', '111', 'RATE', '您对“公司有完善的培训制度和规划”的同意程度是？ ', 1, NULL, 1, NULL, 2162688,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (254, '9698626c0c0e4a97a0c1f632984a18b9', '112', 'RATE', '您对“我的工作成果中能得到上级和公司的认可”的同意程度是？', 1, NULL, 1, NULL,
        2228224, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (255, '9698626c0c0e4a97a0c1f632984a18b9', '113', 'RATE', '您对“与其它我可能工作的公司相比，我在这里的发展机会更大”的同意程度是？', 1, NULL, 1,
        NULL, 2293760, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (256, '9698626c0c0e4a97a0c1f632984a18b9', '114', 'RATE', '您对“我愿意在未来的三年里留在公司工作”的同意程度是？ ', 1, NULL, 1, NULL,
        2359296, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (257, '9698626c0c0e4a97a0c1f632984a18b9', '100', 'RADIO', '您的性别是  ', 1, NULL, 1, NULL, 2424832, 24, '{
  \"options\": [{\"label\": \"男\", \"value\": 1}, {\"label\": \"女\", \"value\": 2}]}', NULL, '2021-01-11 13:58:11',
        '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (258, '9698626c0c0e4a97a0c1f632984a18b9', '101', 'SELECT', '您的出生年份是？   ', 1, NULL, 1, NULL, 2490368, 24, '{
  \"options\": [{\"label\": \"2005年后\", \"value\": 1}, {\"label\": \"2005年\", \"value\": 2}, {\"label\": \"2004年\", \"value\": 3}, {\"label\": \"2003年\", \"value\": 4}, {\"label\": \"2002年\", \"value\": 5}, {\"label\": \"0201年\", \"value\": 6}, {\"label\": \"2000年\", \"value\": 7}, {\"label\": \"1999年\", \"value\": 8}, {\"label\": \"1998年\", \"value\": 9}, {\"label\": \"1997年\", \"value\": 10}, {\"label\": \"1996年\", \"value\": 11}, {\"label\": \"1995年\", \"value\": 12}, {\"label\": \"1994年\", \"value\": 13}, {\"label\": \"1993年\", \"value\": 14}, {\"label\": \"1992年\", \"value\": 15}, {\"label\": \"1991年\", \"value\": 16}, {\"label\": \"1990年\", \"value\": 17}, {\"label\": \"1989年\", \"value\": 18}, {\"label\": \"1988年\", \"value\": 19}, {\"label\": \"1987年\", \"value\": 20}, {\"label\": \"1986年\", \"value\": 21}, {\"label\": \"1985年\", \"value\": 22}, {\"label\": \"1984年\", \"value\": 23}, {\"label\": \"1983年\", \"value\": 24}, {\"label\": \"1982年\", \"value\": 25}, {\"label\": \"1981年\", \"value\": 26}, {\"label\": \"1980年\", \"value\": 27}, {\"label\": \"1979年\", \"value\": 28}, {\"label\": \"1978年\", \"value\": 29}, {\"label\": \"1977年\", \"value\": 30}, {\"label\": \"1976年\", \"value\": 31}, {\"label\": \"1975年\", \"value\": 32}, {\"label\": \"1974年\", \"value\": 33}, {\"label\": \"1973年\", \"value\": 34}, {\"label\": \"1972年\", \"value\": 35}, {\"label\": \"1971年\", \"value\": 36}, {\"label\": \"1970年\", \"value\": 37}, {\"label\": \"1969年\", \"value\": 38}, {\"label\": \"1968年\", \"value\": 39}, {\"label\": \"1967年\", \"value\": 40}, {\"label\": \"1966年\", \"value\": 41}, {\"label\": \"1965年\", \"value\": 42}, {\"label\": \"1964年\", \"value\": 43}, {\"label\": \"1963年\", \"value\": 44}, {\"label\": \"1962年\", \"value\": 45}, {\"label\": \"1961年\", \"value\": 46}, {\"label\": \"1960年\", \"value\": 47}, {\"label\": \"1960年前\", \"value\": 48}]}',
        NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (259, '9698626c0c0e4a97a0c1f632984a18b9', '102', 'RADIO', '您的学历是  ', 1, NULL, 1, NULL, 2555904, 24, '{
  \"options\": [{\"label\": \"初中及以下\", \"value\": 1}, {\"label\": \"高中/中专\", \"value\": 2}, {\"label\": \"专科/高职\", \"value\": 3}, {\"label\": \"本科\", \"value\": 4}, {\"label\": \"硕士及以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (260, '9698626c0c0e4a97a0c1f632984a18b9', '103', 'RADIO', '您每月的收入大概是  ', 1, NULL, 1, NULL, 2621440, 24, '{
  \"options\": [{\"label\": \"1000元以下\", \"value\": 1}, {\"label\": \"1000-1999元\", \"value\": 2}, {\"label\": \"2000-3999元\", \"value\": 3}, {\"label\": \"4000-5999元\", \"value\": 4}, {\"label\": \"6000-9999元\", \"value\": 5}, {\"label\": \"10000-19999元\", \"value\": 6}, {\"label\": \"20000元以上\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (261, '9698626c0c0e4a97a0c1f632984a18b9', '104', 'RADIO', '您的职业是  ', 1, NULL, 1, NULL, 2686976, 24, '{
  \"options\": [{\"label\": \"学生\", \"value\": 1}, {\"label\": \"政府/机关干部/公务员/事业单位\", \"value\": 2}, {\"label\": \"企业管理者（包括基层及中高成管理者）\", \"value\": 3}, {\"label\": \"普通职员/白领工作者（在办公室/写字楼工作）\", \"value\": 4}, {\"label\": \"专业人员（如医生、律师、文体、记者、老师等）\", \"value\": 5}, {\"label\": \"蓝领工作者（普通工人）\", \"value\": 6}, {\"label\": \"销售人员/商店职员\", \"value\": 7}, {\"label\": \"自由职业者\", \"value\": 8}, {\"label\": \"退休\", \"value\": 9}, {\"label\": \"暂无固定职业\", \"value\": 10}, {\"label\": \"其他\", \"value\": 11}]}',
        NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (262, '9ebed213fedd4dad9e66879b7cb7a896', '100', 'RADIO', '请问最近一个月，您在移动终端（包括手机/平板）上常玩过什么类型的游戏？（最多选3项） ', 1, NULL,
        1, NULL, 65536, 24, '{
    \"options\": [{\"label\": \"以下类型的游戏都没玩过\", \"value\": 1}, {\"label\": \"角色扮演（如忘仙、神仙道、君王2、QQ御剑、仙变OL，不含卡牌类）\", \"value\": 2}, {\"label\": \"卡牌角色扮演（如大掌门、我叫MT、萌江湖、百万亚瑟王、三国来了）\", \"value\": 3}, {\"label\": \"音乐（如节奏大师、劲乐团、乐动达人）\", \"value\": 4}, {\"label\": \"射击（如现代战争、兄弟连2、雷电、皇牌空战）\", \"value\": 5}, {\"label\": \"动作/格斗（如时空猎人、王者之剑、超级玛丽、拳皇）\", \"value\": 6}, {\"label\": \"竞速（如极品飞车、狂野飙车、真实赛车）\", \"value\": 7}, {\"label\": \"模拟经营/养成（如QQ餐厅、和风物语、模拟人生）\", \"value\": 8}, {\"label\": \"休闲/益智（如水果忍者、捕鱼达人、消除之星、糖果传奇）\", \"value\": 9}, {\"label\": \"策略（如二战风云、卧龙吟、三国塔防）\", \"value\": 10}, {\"label\": \"体育竞技（如FIFA足球、疯狂滑雪、台球大师）\", \"value\": 11}, {\"label\": \"其他\", \"value\": 12}]}',
        NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (263, '9ebed213fedd4dad9e66879b7cb7a896', '101', 'RADIO', '最近一个月，您是否在移动设备上（包括手机/平板）玩过xx游戏？ ', 1, NULL, 1, NULL,
        131072, 24, '{
    \"options\": [{\"label\": \"一直在玩\", \"value\": 1}, {\"label\": \"以前玩的多，现在玩得很少或者不玩了\", \"value\": 2}, {\"label\": \"下载后，玩过一两次就不再玩了\", \"value\": 3}, {\"label\": \"从没玩过\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (264, '9ebed213fedd4dad9e66879b7cb7a896', '102', 'RADIO', '您玩xx用的移动设备系统是？ ', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"iOS（苹果）手机/平板\", \"value\": 1}, {\"label\": \"Android（安卓）手机/平板\", \"value\": 2}, {\"label\": \"Windows（微软）手机/平板\", \"value\": 3}, {\"label\": \"其他\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (265, '9ebed213fedd4dad9e66879b7cb7a896', '103', 'RADIO', '您玩xx多长时间了？ ', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"不到1个月\", \"value\": 1}, {\"label\": \"1-3个月（含 3个月）\", \"value\": 2}, {\"label\": \"3-6个月（含 6个月）\", \"value\": 3}, {\"label\": \"6-12个月（含 12个月）\", \"value\": 4}, {\"label\": \"1-2年\", \"value\": 5}, {\"label\": \"2年以上\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (266, '9ebed213fedd4dad9e66879b7cb7a896', '104', 'RADIO', '您最近玩xx的频率大概是？ ', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"几乎每天都玩\", \"value\": 1}, {\"label\": \"每周4-5天\", \"value\": 2}, {\"label\": \"每周2-3天\", \"value\": 3}, {\"label\": \"更少\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (267, '9ebed213fedd4dad9e66879b7cb7a896', '105', 'RADIO', '一般而言，您每次会玩xx多长时间？ ', 1, NULL, 1, NULL, 393216, 24, '{
  \"options\": [{\"label\": \"半小时以内\", \"value\": 1}, {\"label\": \"半小时-1小时\", \"value\": 2}, {\"label\": \"1-2小时\", \"value\": 3}, {\"label\": \"2-3小时\", \"value\": 4}, {\"label\": \"3-5小时\", \"value\": 5}, {\"label\": \"更多\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (268, '9ebed213fedd4dad9e66879b7cb7a896', '106', 'RADIO', '您在xx中累计花过多少钱？ ', 1, NULL, 1, NULL, 458752, 24, '{
  \"options\": [{\"label\": \"从没有花过钱\", \"value\": 1}, {\"label\": \"1-100元\", \"value\": 2}, {\"label\": \"100-500元\", \"value\": 3}, {\"label\": \"500-2000元\", \"value\": 4}, {\"label\": \"2000元以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (269, '9ebed213fedd4dad9e66879b7cb7a896', '107', 'RATE', '总体来说，您对xx这款游戏的满意程度是？ ', 1, NULL, 1, NULL, 524288, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (270, '9ebed213fedd4dad9e66879b7cb7a896', '108', 'RATE', '您是否愿意推荐身边的人（亲朋好友）玩xx手游戏？ ', 1, NULL, 1, NULL, 589824,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (271, '9ebed213fedd4dad9e66879b7cb7a896', '109', 'RATE', '您是否愿意继续玩xx手游？ ', 1, NULL, 1, NULL, 655360, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (272, '9ebed213fedd4dad9e66879b7cb7a896', '113', 'RADIO', '您下载xx后，玩过一两次就不再玩xx的原因是？（限选3项） ', 1, NULL, 1, NULL,
        720896, 24, '{
    \"options\": [{\"label\": \"不是我喜欢的游戏类型，玩起来没有意思\", \"value\": 1}, {\"label\": \"版本不稳定，有卡、闪退等情况\", \"value\": 2}, {\"label\": \"画面不喜欢，人物造型不好看\", \"value\": 3}, {\"label\": \"不喜欢里面的游戏音乐\", \"value\": 4}, {\"label\": \"游戏任务剧情枯燥，没有吸引力\", \"value\": 5}, {\"label\": \"某个地方不知道怎么操作，又没有引导\", \"value\": 6}, {\"label\": \"进入后不知道该做什么，玩不懂，没法融入游戏\", \"value\": 7}, {\"label\": \"游戏有些复杂，玩起来太麻烦，感觉有压力\", \"value\": 8}, {\"label\": \"玩过很多类似游戏，太平淡没有新意\", \"value\": 9}, {\"label\": \"游戏没有人气，没人一起玩\", \"value\": 10}, {\"label\": \"其他\", \"value\": 11}]}',
        NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (273, '9ebed213fedd4dad9e66879b7cb7a896', '114', 'RADIO', '您现在玩得很少或者不再玩xx的原因是？（限选3项） ', 1, NULL, 1, NULL, 786432,
        24, '{
    \"options\": [{\"label\": \"登录游戏后，缺少目标，感觉没有什么可玩的内容\", \"value\": 1}, {\"label\": \"游戏活动单调重复，活动奖品不给力\", \"value\": 2}, {\"label\": \"操作引导不清晰，不明白怎么玩\", \"value\": 3}, {\"label\": \"没有朋友一起玩或者在游戏中很难交到朋友\", \"value\": 4}, {\"label\": \"好友互动不足\", \"value\": 5}, {\"label\": \"不花钱或者花钱少根本没法玩\", \"value\": 6}, {\"label\": \"游戏环境不好，比如刷屏、骗子等 升级难度太大，挫败感强\", \"value\": 7}, {\"label\": \"游戏荣誉感不够强，战胜后没有快感\", \"value\": 8}, {\"label\": \"游戏风格不符合预期 题材，故事情节看不懂\", \"value\": 9}, {\"label\": \"游戏体验不流畅，卡机，BUG多\", \"value\": 10}, {\"label\": \"其他\", \"value\": 11}]}',
        NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (274, '9ebed213fedd4dad9e66879b7cb7a896', '100', 'RADIO', '您的性别是  ', 1, NULL, 1, NULL, 851968, 24, '{
  \"options\": [{\"label\": \"男\", \"value\": 1}, {\"label\": \"女\", \"value\": 2}]}', NULL, '2021-01-11 13:58:11',
        '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (275, '9ebed213fedd4dad9e66879b7cb7a896', '101', 'SELECT', '您的出生年份是？   ', 1, NULL, 1, NULL, 917504, 24, '{
  \"options\": [{\"label\": \"2005年后\", \"value\": 1}, {\"label\": \"2005年\", \"value\": 2}, {\"label\": \"2004年\", \"value\": 3}, {\"label\": \"2003年\", \"value\": 4}, {\"label\": \"2002年\", \"value\": 5}, {\"label\": \"0201年\", \"value\": 6}, {\"label\": \"2000年\", \"value\": 7}, {\"label\": \"1999年\", \"value\": 8}, {\"label\": \"1998年\", \"value\": 9}, {\"label\": \"1997年\", \"value\": 10}, {\"label\": \"1996年\", \"value\": 11}, {\"label\": \"1995年\", \"value\": 12}, {\"label\": \"1994年\", \"value\": 13}, {\"label\": \"1993年\", \"value\": 14}, {\"label\": \"1992年\", \"value\": 15}, {\"label\": \"1991年\", \"value\": 16}, {\"label\": \"1990年\", \"value\": 17}, {\"label\": \"1989年\", \"value\": 18}, {\"label\": \"1988年\", \"value\": 19}, {\"label\": \"1987年\", \"value\": 20}, {\"label\": \"1986年\", \"value\": 21}, {\"label\": \"1985年\", \"value\": 22}, {\"label\": \"1984年\", \"value\": 23}, {\"label\": \"1983年\", \"value\": 24}, {\"label\": \"1982年\", \"value\": 25}, {\"label\": \"1981年\", \"value\": 26}, {\"label\": \"1980年\", \"value\": 27}, {\"label\": \"1979年\", \"value\": 28}, {\"label\": \"1978年\", \"value\": 29}, {\"label\": \"1977年\", \"value\": 30}, {\"label\": \"1976年\", \"value\": 31}, {\"label\": \"1975年\", \"value\": 32}, {\"label\": \"1974年\", \"value\": 33}, {\"label\": \"1973年\", \"value\": 34}, {\"label\": \"1972年\", \"value\": 35}, {\"label\": \"1971年\", \"value\": 36}, {\"label\": \"1970年\", \"value\": 37}, {\"label\": \"1969年\", \"value\": 38}, {\"label\": \"1968年\", \"value\": 39}, {\"label\": \"1967年\", \"value\": 40}, {\"label\": \"1966年\", \"value\": 41}, {\"label\": \"1965年\", \"value\": 42}, {\"label\": \"1964年\", \"value\": 43}, {\"label\": \"1963年\", \"value\": 44}, {\"label\": \"1962年\", \"value\": 45}, {\"label\": \"1961年\", \"value\": 46}, {\"label\": \"1960年\", \"value\": 47}, {\"label\": \"1960年前\", \"value\": 48}]}',
        NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (276, '9ebed213fedd4dad9e66879b7cb7a896', '102', 'RADIO', '您的学历是  ', 1, NULL, 1, NULL, 983040, 24, '{
  \"options\": [{\"label\": \"初中及以下\", \"value\": 1}, {\"label\": \"高中/中专\", \"value\": 2}, {\"label\": \"专科/高职\", \"value\": 3}, {\"label\": \"本科\", \"value\": 4}, {\"label\": \"硕士及以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (277, '9ebed213fedd4dad9e66879b7cb7a896', '103', 'RADIO', '您每月的收入大概是  ', 1, NULL, 1, NULL, 1048576, 24, '{
  \"options\": [{\"label\": \"1000元以下\", \"value\": 1}, {\"label\": \"1000-1999元\", \"value\": 2}, {\"label\": \"2000-3999元\", \"value\": 3}, {\"label\": \"4000-5999元\", \"value\": 4}, {\"label\": \"6000-9999元\", \"value\": 5}, {\"label\": \"10000-19999元\", \"value\": 6}, {\"label\": \"20000元以上\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (278, '9ebed213fedd4dad9e66879b7cb7a896', '104', 'RADIO', '您的职业是  ', 1, NULL, 1, NULL, 1114112, 24, '{
  \"options\": [{\"label\": \"学生\", \"value\": 1}, {\"label\": \"政府/机关干部/公务员/事业单位\", \"value\": 2}, {\"label\": \"企业管理者（包括基层及中高成管理者）\", \"value\": 3}, {\"label\": \"普通职员/白领工作者（在办公室/写字楼工作）\", \"value\": 4}, {\"label\": \"专业人员（如医生、律师、文体、记者、老师等）\", \"value\": 5}, {\"label\": \"蓝领工作者（普通工人）\", \"value\": 6}, {\"label\": \"销售人员/商店职员\", \"value\": 7}, {\"label\": \"自由职业者\", \"value\": 8}, {\"label\": \"退休\", \"value\": 9}, {\"label\": \"暂无固定职业\", \"value\": 10}, {\"label\": \"其他\", \"value\": 11}]}',
        NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (279, '9ebed213fedd4dad9e66879b7cb7a896', '105', 'INPUT', '如果您愿意参加我们后续的产品体验活动，请留下您的手机号码，以便我们能第一时间联系到您：', 1, NULL,
        1, NULL, 1179648, 24, '{}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (280, 'f688e0d9d74d4eb0967c678f6684e54f', '100', 'RADIO', '您的年龄', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"20岁及以下\", \"value\": 1}, {\"label\": \"21-25岁\", \"value\": 2}, {\"label\": \"26-30岁\", \"value\": 3}, {\"label\": \"31-40岁\", \"value\": 4}, {\"label\": \"40岁以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (281, 'f688e0d9d74d4eb0967c678f6684e54f', '101', 'RADIO', '您是餐饮店业者吗?', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"不是\", \"value\": 2}]}', NULL, '2021-01-11 13:58:11',
        '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (282, 'f688e0d9d74d4eb0967c678f6684e54f', '102', 'RADIO', '近三个月，您去餐厅就餐的次数', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"2次以下\", \"value\": 1}, {\"label\": \"3-5次\", \"value\": 2}, {\"label\": \"6-10次\", \"value\": 3}, {\"label\": \"10次以上\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (283, 'f688e0d9d74d4eb0967c678f6684e54f', '103', 'RATE', '您对xx餐厅“员工态度好”的满意程度是', 1, NULL, 1, NULL, 262144, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (284, 'f688e0d9d74d4eb0967c678f6684e54f', '104', 'RATE', '您对xx餐厅“员工会及时提供服务”的满意程度是', 1, NULL, 1, NULL, 327680, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:11', '2021-01-11 13:58:11', 0);
INSERT INTO `pr_project_template_item`
VALUES (285, 'f688e0d9d74d4eb0967c678f6684e54f', '105', 'RATE', '您对xx餐厅“员工服装仪容干净”的满意程度是', 1, NULL, 1, NULL, 393216, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:12', '2021-01-11 13:58:12', 0);
INSERT INTO `pr_project_template_item`
VALUES (286, 'f688e0d9d74d4eb0967c678f6684e54f', '106', 'RATE', '您对xx餐厅“室内外清洁干净”的满意程度是', 1, NULL, 1, NULL, 458752, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:12', '2021-01-11 13:58:12', 0);
INSERT INTO `pr_project_template_item`
VALUES (287, 'f688e0d9d74d4eb0967c678f6684e54f', '107', 'RATE', '您对xx餐厅“店内环境气氛好”的满意程度是', 1, NULL, 1, NULL, 524288, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:12', '2021-01-11 13:58:12', 0);
INSERT INTO `pr_project_template_item`
VALUES (288, 'f688e0d9d74d4eb0967c678f6684e54f', '108', 'RATE', '您对xx餐厅“空间宽敞，感觉舒适”的满意程度是', 1, NULL, 1, NULL, 589824, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:12', '2021-01-11 13:58:12', 0);
INSERT INTO `pr_project_template_item`
VALUES (289, 'f688e0d9d74d4eb0967c678f6684e54f', '109', 'RATE', '您对xx餐厅“餐具洁净完整”的满意程度是', 1, NULL, 1, NULL, 655360, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:12', '2021-01-11 13:58:12', 0);
INSERT INTO `pr_project_template_item`
VALUES (290, 'f688e0d9d74d4eb0967c678f6684e54f', '110', 'RATE', '您对xx餐厅“价格适中”的满意程度是', 1, NULL, 1, NULL, 720896, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:12', '2021-01-11 13:58:12', 0);
INSERT INTO `pr_project_template_item`
VALUES (291, 'f688e0d9d74d4eb0967c678f6684e54f', '111', 'RATE', '您对xx餐厅“菜式种类多”的满意程度是', 1, NULL, 1, NULL, 786432, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:12', '2021-01-11 13:58:12', 0);
INSERT INTO `pr_project_template_item`
VALUES (292, 'f688e0d9d74d4eb0967c678f6684e54f', '112', 'RATE', '您对xx餐厅“菜品/饮品安全”的满意程度是', 1, NULL, 1, NULL, 851968, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:12', '2021-01-11 13:58:12', 0);
INSERT INTO `pr_project_template_item`
VALUES (293, 'f688e0d9d74d4eb0967c678f6684e54f', '113', 'RATE', '您对xx餐厅“价格适中”的满意程度是', 1, NULL, 1, NULL, 917504, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:12', '2021-01-11 13:58:12', 0);
INSERT INTO `pr_project_template_item`
VALUES (294, 'f688e0d9d74d4eb0967c678f6684e54f', '114', 'RATE', '您对xx餐厅“菜单清楚”的满意程度是', 1, NULL, 1, NULL, 983040, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:12', '2021-01-11 13:58:12', 0);
INSERT INTO `pr_project_template_item`
VALUES (295, 'f688e0d9d74d4eb0967c678f6684e54f', '115', 'RATE', '您对xx餐厅“消费细目列式清楚”的满意程度是', 1, NULL, 1, NULL, 1048576, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:12', '2021-01-11 13:58:12', 0);
INSERT INTO `pr_project_template_item`
VALUES (296, 'f688e0d9d74d4eb0967c678f6684e54f', '116', 'RATE', '您对xx餐厅“点餐等候时间短”的满意程度是', 1, NULL, 1, NULL, 1114112, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:12', '2021-01-11 13:58:12', 0);
INSERT INTO `pr_project_template_item`
VALUES (297, 'f688e0d9d74d4eb0967c678f6684e54f', '117', 'RATE', '您对xx餐厅“上菜快速”的满意程度是', 1, NULL, 1, NULL, 1179648, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:12', '2021-01-11 13:58:12', 0);
INSERT INTO `pr_project_template_item`
VALUES (298, 'f688e0d9d74d4eb0967c678f6684e54f', '118', 'RATE', '您对xx餐厅“食物美味可口”的满意程度是', 1, NULL, 1, NULL, 1245184, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:12', '2021-01-11 13:58:12', 0);
INSERT INTO `pr_project_template_item`
VALUES (299, 'f688e0d9d74d4eb0967c678f6684e54f', '119', 'RATE', '您对xx餐厅“结帐速度快/效率高”的满意程度是', 1, NULL, 1, NULL, 1310720,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:12', '2021-01-11 13:58:12', 0);
INSERT INTO `pr_project_template_item`
VALUES (300, 'f688e0d9d74d4eb0967c678f6684e54f', '120', 'RATE', '您对xx餐厅“营业时间合理”的满意程度是', 1, NULL, 1, NULL, 1376256, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:12', '2021-01-11 13:58:12', 0);
INSERT INTO `pr_project_template_item`
VALUES (301, 'f688e0d9d74d4eb0967c678f6684e54f', '121', 'RATE', '您对xx餐厅“地点近或分店多”的满意程度是', 1, NULL, 1, NULL, 1441792, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:12', '2021-01-11 13:58:12', 0);
INSERT INTO `pr_project_template_item`
VALUES (302, 'f688e0d9d74d4eb0967c678f6684e54f', '122', 'RATE', '您对xx餐厅“停车方便”的满意程度是', 1, NULL, 1, NULL, 1507328, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:12', '2021-01-11 13:58:12', 0);
INSERT INTO `pr_project_template_item`
VALUES (303, 'f688e0d9d74d4eb0967c678f6684e54f', '123', 'RATE', '您对xx餐厅“客人投诉/反馈能及时处理”的满意程度是', 1, NULL, 1, NULL, 1572864,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:12', '2021-01-11 13:58:12', 0);
INSERT INTO `pr_project_template_item`
VALUES (304, 'f688e0d9d74d4eb0967c678f6684e54f', '124', 'RATE', '您对xx餐厅“促销多/折扣大”的满意程度是', 1, NULL, 1, NULL, 1638400, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:12', '2021-01-11 13:58:12', 0);
INSERT INTO `pr_project_template_item`
VALUES (305, 'f688e0d9d74d4eb0967c678f6684e54f', '125', 'RATE', '您对xx餐厅“口碑推荐”的满意程度是', 1, NULL, 1, NULL, 1703936, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:12', '2021-01-11 13:58:12', 0);
INSERT INTO `pr_project_template_item`
VALUES (306, '302714b9b4984fefad81d386cf332f3e', '100', 'RADIO', '选出不同类的一项： ', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"蛇\", \"value\": 1}, {\"label\": \"大树\", \"value\": 2}, {\"label\": \"老虎\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (307, '302714b9b4984fefad81d386cf332f3e', '101', 'RADIO', '在下列分数中，选出不同类的一项： ', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"3/5\", \"value\": 1}, {\"label\": \"3/7\", \"value\": 2}, {\"label\": \"3/9\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (308, '302714b9b4984fefad81d386cf332f3e', '102', 'RADIO', '男孩对男子，正如女孩对 ', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"青年\", \"value\": 1}, {\"label\": \"孩子\", \"value\": 2}, {\"label\": \"夫人\", \"value\": 3}, {\"label\": \"姑娘\", \"value\": 4}, {\"label\": \"妇女\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (309, '302714b9b4984fefad81d386cf332f3e', '103', 'RADIO', '如果笔相对于写字，那么书相对于 ', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"娱乐\", \"value\": 1}, {\"label\": \"阅读\", \"value\": 2}, {\"label\": \"学文化\", \"value\": 3}, {\"label\": \"解除疲劳\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (310, '302714b9b4984fefad81d386cf332f3e', '104', 'RADIO', '马之于马厩，正如人之于 ', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"牛棚\", \"value\": 1}, {\"label\": \"马车\", \"value\": 2}, {\"label\": \"房屋\", \"value\": 3}, {\"label\": \"农场\", \"value\": 4}, {\"label\": \"楼房\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (311, '302714b9b4984fefad81d386cf332f3e', '105', 'INPUT', '请在下面方框填入空缺的数字： 2 8 14 20 （ ） ', 1, NULL, 1, NULL,
        393216, 24, '{}', NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (312, '302714b9b4984fefad81d386cf332f3e', '106', 'RADIO', '下列四个词是否可以组成一个正确的句子', 1, NULL, 1, NULL, 458752, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:20',
        '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (313, '302714b9b4984fefad81d386cf332f3e', '107', 'RADIO', '下列六个词是否可以组成一个正确的句子', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:20',
        '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (314, '302714b9b4984fefad81d386cf332f3e', '108', 'INPUT', '动物学家与社会学家相对应，正如动物与（）相对  ', 1, NULL, 1, NULL, 589824,
        24, '{}', NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (315, '302714b9b4984fefad81d386cf332f3e', '109', 'RADIO', '如果所有的妇女都有大衣，那么漂亮的妇女会有 ', 1, NULL, 1, NULL, 655360, 24,
        '{
          \"options\": [{\"label\": \"更多的大衣\", \"value\": 1}, {\"label\": \"时髦的大衣\", \"value\": 2}, {\"label\": \"大衣\", \"value\": 3}, {\"label\": \"昂贵的大衣\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (316, '302714b9b4984fefad81d386cf332f3e', '110', 'INPUT', '请在下面方框填入空缺的数字：1 3 2 4 6 5 7 （ ） ', 1, NULL, 1, NULL,
        720896, 24, '{}', NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (317, '302714b9b4984fefad81d386cf332f3e', '111', 'RADIO', '南之于西北，正如西之于： ', 1, NULL, 1, NULL, 786432, 24, '{
  \"options\": [{\"label\": \"西北\", \"value\": 1}, {\"label\": \"东北\", \"value\": 2}, {\"label\": \"西南\", \"value\": 3}, {\"label\": \"东南\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (318, '302714b9b4984fefad81d386cf332f3e', '112', 'RADIO', '找出不同类的一项 ', 1, NULL, 1, NULL, 851968, 24, '{
  \"options\": [{\"label\": \"铁锅\", \"value\": 1}, {\"label\": \"小勺\", \"value\": 2}, {\"label\": \"米饭\", \"value\": 3}, {\"label\": \"碟子\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (319, '302714b9b4984fefad81d386cf332f3e', '113', 'INPUT', '请在下面方框填入空缺的数字：9 7 8 6 7 5 （ ） ', 1, NULL, 1, NULL,
        917504, 24, '{}', NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (320, '302714b9b4984fefad81d386cf332f3e', '114', 'RADIO', '找出不同类的一项 ', 1, NULL, 1, NULL, 983040, 24, '{
  \"options\": [{\"label\": \"写字台\", \"value\": 1}, {\"label\": \"沙发\", \"value\": 2}, {\"label\": \"电视\", \"value\": 3}, {\"label\": \"桌布\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (321, '302714b9b4984fefad81d386cf332f3e', '115', 'INPUT', '请在下面方框填入空缺的数字：961 （25） 432 932 （ ） 731 ', 1, NULL, 1,
        NULL, 1048576, 24, '{}', NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (322, '302714b9b4984fefad81d386cf332f3e', '116', 'RADIO', '以下选项中，哪一个应该填在“XOOOOXXOOOXXX”后面 ', 1, NULL, 1, NULL,
        1114112, 24, '{
    \"options\": [{\"label\": \"XOO\", \"value\": 1}, {\"label\": \"OO\", \"value\": 2}, {\"label\": \"OOX\", \"value\": 3}, {\"label\": \"OXX\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (323, '302714b9b4984fefad81d386cf332f3e', '117', 'RADIO', '请在下面方框填入空缺的的字：望子成龙的家长往往（ ）苗助长 ', 1, NULL, 1, NULL,
        1179648, 24, '{
    \"options\": [{\"label\": \"揠\", \"value\": 1}, {\"label\": \"堰\", \"value\": 2}, {\"label\": \"偃\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (324, '302714b9b4984fefad81d386cf332f3e', '118', 'INPUT', '请在下面方框填入空缺的词：金黄的头发（黄山）刀山火海 赞美人生（ ）卫国战争 ', 1, NULL, 1,
        NULL, 1245184, 24, '{}', NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (325, '302714b9b4984fefad81d386cf332f3e', '119', 'RADIO', '选出不同类的一项： ', 1, NULL, 1, NULL, 1310720, 24, '{
  \"options\": [{\"label\": \"地板\", \"value\": 1}, {\"label\": \"壁橱\", \"value\": 2}, {\"label\": \"窗户\", \"value\": 3}, {\"label\": \"窗帘\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (326, '302714b9b4984fefad81d386cf332f3e', '120', 'INPUT', '请在下面方框填入空缺的数字： 1 8 27 （ ） ', 1, NULL, 1, NULL,
        1376256, 24, '{}', NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (327, '302714b9b4984fefad81d386cf332f3e', '121', 'INPUT', '请在下面方框填入空缺的词：罄竹难书（书法）无法无天 作奸犯科（ ）教学相长 ', 1, NULL, 1,
        NULL, 1441792, 24, '{}', NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (328, '302714b9b4984fefad81d386cf332f3e', '122', 'INPUT', '请在下面方框填入空缺的字：款（ ）样 ', 1, NULL, 1, NULL, 1507328, 24,
        '{}', NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (329, '302714b9b4984fefad81d386cf332f3e', '123', 'INPUT', '请在下面方框填入空缺的数字：16（96）12 10（ ）7.5 ', 1, NULL, 1, NULL,
        1572864, 24, '{}', NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (330, '302714b9b4984fefad81d386cf332f3e', '124', 'RADIO', '找出不同类的一项  ', 1, NULL, 1, NULL, 1638400, 24, '{
  \"options\": [{\"label\": \"斑马\", \"value\": 1}, {\"label\": \"军马\", \"value\": 2}, {\"label\": \"赛马\", \"value\": 3}, {\"label\": \"骏马\", \"value\": 4}, {\"label\": \"驸马\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (331, '302714b9b4984fefad81d386cf332f3e', '125', 'INPUT', '请在下面方框填入空缺的字：祭（ ）定  ', 1, NULL, 1, NULL, 1703936, 24,
        '{}', NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (332, '302714b9b4984fefad81d386cf332f3e', '126', 'INPUT', '请在下面方框填入空缺的字：头部（ ）震荡  ', 1, NULL, 1, NULL, 1769472,
        24, '{}', NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (333, '302714b9b4984fefad81d386cf332f3e', '127', 'INPUT', '请在下面方框填入空缺的数字：65 37 17 （ ） ', 1, NULL, 1, NULL,
        1835008, 24, '{}', NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (334, '302714b9b4984fefad81d386cf332f3e', '128', 'INPUT', '请在下面方框填入空缺的数字：41（28）27 83（ ）65 ', 1, NULL, 1, NULL,
        1900544, 24, '{}', NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (335, '302714b9b4984fefad81d386cf332f3e', '129', 'INPUT', '请在下面方框填入空缺的字母 C F I D H L E J（）', 1, NULL, 1, NULL,
        1966080, 24, '{}', NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (336, 'd2d26428ea0847a89af1fb817e648db0', '100', 'RADIO', '我有能力克服各种困难   ', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"是的\", \"value\": 1}, {\"label\": \"不一定\", \"value\": 2}, {\"label\": \"不是的\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (337, 'd2d26428ea0847a89af1fb817e648db0', '101', 'RADIO', '如果我能到一个新的环境，我要把生活安排得  ', 1, NULL, 1, NULL, 131072, 24,
        '{
          \"options\": [{\"label\": \"和从前相仿\", \"value\": 1}, {\"label\": \"不一定\", \"value\": 2}, {\"label\": \"和从前不一样\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (338, 'd2d26428ea0847a89af1fb817e648db0', '102', 'RADIO', '一生中，我觉得自已能达到我所预想的目标  ', 1, NULL, 1, NULL, 196608, 24,
        '{
          \"options\": [{\"label\": \"是的\", \"value\": 1}, {\"label\": \"不一定\", \"value\": 2}, {\"label\": \"不是的\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (339, 'd2d26428ea0847a89af1fb817e648db0', '103', 'RADIO', '不知为什么，有些人总是回避或冷淡我  ', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"是的\", \"value\": 1}, {\"label\": \"不一定\", \"value\": 2}, {\"label\": \"不是的\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (340, 'd2d26428ea0847a89af1fb817e648db0', '104', 'RADIO', '在大街上，我常常避开我不愿打招呼的人  ', 1, NULL, 1, NULL, 327680, 24,
        '{
          \"options\": [{\"label\": \"从未如此\", \"value\": 1}, {\"label\": \"偶尔如此\", \"value\": 2}, {\"label\": \"有时如此\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (341, 'd2d26428ea0847a89af1fb817e648db0', '105', 'RADIO', '当我集中精力工作时，假使有人在旁边高谈阔论  ', 1, NULL, 1, NULL, 393216,
        24, '{
    \"options\": [{\"label\": \"我仍能专心工作\", \"value\": 1}, {\"label\": \"介于A、C之间\", \"value\": 2}, {\"label\": \"我不能专心且感到愤怒\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (342, 'd2d26428ea0847a89af1fb817e648db0', '106', 'RADIO', '我不论到什么地方，都能清楚地辨别方向  ', 1, NULL, 1, NULL, 458752, 24,
        '{
          \"options\": [{\"label\": \"是的\", \"value\": 1}, {\"label\": \"不一定\", \"value\": 2}, {\"label\": \"不是的\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:20', '2021-01-11 13:58:20', 0);
INSERT INTO `pr_project_template_item`
VALUES (343, 'd2d26428ea0847a89af1fb817e648db0', '107', 'RADIO', '我热爱所学的专业和所从事的工作  ', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"是的\", \"value\": 1}, {\"label\": \"不一定\", \"value\": 2}, {\"label\": \"不是的\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (344, 'd2d26428ea0847a89af1fb817e648db0', '108', 'RADIO', '气候的变化不会影响我的情绪  ', 1, NULL, 1, NULL, 589824, 24, '{
  \"options\": [{\"label\": \"是的\", \"value\": 1}, {\"label\": \"介于A、C之间\", \"value\": 2}, {\"label\": \"不是的\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (345, 'd2d26428ea0847a89af1fb817e648db0', '109', 'RADIO', '我从不因流言蜚语而生气  ', 1, NULL, 1, NULL, 655360, 24, '{
  \"options\": [{\"label\": \"是的\", \"value\": 1}, {\"label\": \"介于A、C之间\", \"value\": 2}, {\"label\": \"不是的\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (346, 'd2d26428ea0847a89af1fb817e648db0', '110', 'RADIO', '我善于控制自己的面部表情  ', 1, NULL, 1, NULL, 720896, 24, '{
  \"options\": [{\"label\": \"是的\", \"value\": 1}, {\"label\": \"不一定\", \"value\": 2}, {\"label\": \"不是的\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (347, 'd2d26428ea0847a89af1fb817e648db0', '111', 'RADIO', '在就寝时，我常常  ', 1, NULL, 1, NULL, 786432, 24, '{
  \"options\": [{\"label\": \"极易入睡\", \"value\": 1}, {\"label\": \"介于A、C之间\", \"value\": 2}, {\"label\": \"不易入睡\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (348, 'd2d26428ea0847a89af1fb817e648db0', '112', 'RADIO', '有人侵扰我时，我  ', 1, NULL, 1, NULL, 851968, 24, '{
  \"options\": [{\"label\": \"不露声色\", \"value\": 1}, {\"label\": \"介于A、C之间\", \"value\": 2}, {\"label\": \"大声抗议，以泄己愤\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (349, 'd2d26428ea0847a89af1fb817e648db0', '113', 'RADIO', '在和人争辨或工作出现失误后，我常常感到震颤，精疲力竭，而不能继续安心工作：______  ', 1,
        NULL, 1, NULL, 917504, 24, '{
    \"options\": [{\"label\": \"不是的\", \"value\": 1}, {\"label\": \"介于A、C之间\", \"value\": 2}, {\"label\": \"是的\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (350, 'd2d26428ea0847a89af1fb817e648db0', '114', 'RADIO', '我常常被一些无谓的小事困扰  ', 1, NULL, 1, NULL, 983040, 24, '{
  \"options\": [{\"label\": \"不是的\", \"value\": 1}, {\"label\": \"介于A、C之间\", \"value\": 2}, {\"label\": \"是的\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (351, 'd2d26428ea0847a89af1fb817e648db0', '115', 'RADIO', '我宁愿住在僻静的郊区，也不愿住在嘈杂的市区  ', 1, NULL, 1, NULL, 1048576,
        24, '{
    \"options\": [{\"label\": \"不是的\", \"value\": 1}, {\"label\": \"不太确定\", \"value\": 2}, {\"label\": \"是的\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (352, 'd2d26428ea0847a89af1fb817e648db0', '116', 'RADIO', '我被朋友、同事起过绰号、挖苦过  ', 1, NULL, 1, NULL, 1114112, 24, '{
  \"options\": [{\"label\": \"从来没有\", \"value\": 1}, {\"label\": \"偶尔有过\", \"value\": 2}, {\"label\": \"这是常有的事\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (353, 'd2d26428ea0847a89af1fb817e648db0', '117', 'RADIO', '有一种食物使我吃后呕吐  ', 1, NULL, 1, NULL, 1179648, 24, '{
  \"options\": [{\"label\": \"没有\", \"value\": 1}, {\"label\": \"记不清\", \"value\": 2}, {\"label\": \"有\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (354, 'd2d26428ea0847a89af1fb817e648db0', '118', 'RADIO', '除去看见的世界外，我的心中没有另外的世界  ', 1, NULL, 1, NULL, 1245184,
        24, '{
    \"options\": [{\"label\": \"没有\", \"value\": 1}, {\"label\": \"记不清\", \"value\": 2}, {\"label\": \"有\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (355, 'd2d26428ea0847a89af1fb817e648db0', '119', 'RADIO', '我会想到若干年后有什么使自己极为不安的事  ', 1, NULL, 1, NULL, 1310720,
        24, '{
    \"options\": [{\"label\": \"从来没有想过\", \"value\": 1}, {\"label\": \"偶尔想到过\", \"value\": 2}, {\"label\": \"经常想到\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (356, 'd2d26428ea0847a89af1fb817e648db0', '120', 'RADIO', '我常常觉得自己的家庭对自己不好，但是我又确切地知道他们的确对我好  ', 1, NULL, 1, NULL,
        1376256, 24, '{
    \"options\": [{\"label\": \"否\", \"value\": 1}, {\"label\": \"说不清楚\", \"value\": 2}, {\"label\": \"是\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (357, 'd2d26428ea0847a89af1fb817e648db0', '121', 'RADIO', '每天我一回家就立刻把门关上  ', 1, NULL, 1, NULL, 1441792, 24, '{
  \"options\": [{\"label\": \"否\", \"value\": 1}, {\"label\": \"不清楚\", \"value\": 2}, {\"label\": \"是\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (358, 'd2d26428ea0847a89af1fb817e648db0', '122', 'RADIO', '我坐在小房间里把门关上，但我仍觉得心里不安  ', 1, NULL, 1, NULL, 1507328,
        24, '{
    \"options\": [{\"label\": \"否\", \"value\": 1}, {\"label\": \"偶尔是\", \"value\": 2}, {\"label\": \"是\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (359, 'd2d26428ea0847a89af1fb817e648db0', '123', 'RADIO', '当一件事需要我作决定时，我常觉得很难  ', 1, NULL, 1, NULL, 1572864, 24,
        '{
          \"options\": [{\"label\": \"否\", \"value\": 1}, {\"label\": \"偶尔是\", \"value\": 2}, {\"label\": \"是\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (360, 'd2d26428ea0847a89af1fb817e648db0', '124', 'RADIO', '我常常用抛硬币、翻纸、抽签之类的游戏来预测凶吉  ', 1, NULL, 1, NULL, 1638400,
        24, '{
    \"options\": [{\"label\": \"否\", \"value\": 1}, {\"label\": \"偶尔是\", \"value\": 2}, {\"label\": \"是\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (361, 'd2d26428ea0847a89af1fb817e648db0', '125', 'RADIO', '为了工作我早出晚归，早晨起床我常常感到疲惫不堪：  ', 1, NULL, 1, NULL,
        1703936, 24, '{
    \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:21',
        '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (362, 'd2d26428ea0847a89af1fb817e648db0', '126', 'RADIO', '在某种心境下,我会因为困惑陷入空想,将工作搁置下来:  ', 1, NULL, 1, NULL,
        1769472, 24, '{
    \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:21',
        '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (363, 'd2d26428ea0847a89af1fb817e648db0', '127', 'RADIO', '我的神经脆弱,稍有刺激就会使我战栗:  ', 1, NULL, 1, NULL, 1835008, 24,
        '{
          \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (364, 'd2d26428ea0847a89af1fb817e648db0', '128', 'RADIO', '睡梦中,我常常被噩梦惊醒：  ', 1, NULL, 1, NULL, 1900544, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:21',
        '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (365, 'd2d26428ea0847a89af1fb817e648db0', '129', 'RADIO', '工作中我愿意挑战艰巨的任务  ', 1, NULL, 1, NULL, 1966080, 24, '{
  \"options\": [{\"label\": \"从不\", \"value\": 1}, {\"label\": \"几乎不\", \"value\": 2}, {\"label\": \"一半时间\", \"value\": 3}, {\"label\": \"大多数时间\", \"value\": 4}, {\"label\": \"总是\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (366, 'd2d26428ea0847a89af1fb817e648db0', '130', 'RADIO', '我常发现别人好的意愿  ', 1, NULL, 1, NULL, 2031616, 24, '{
  \"options\": [{\"label\": \"从不\", \"value\": 1}, {\"label\": \"几乎不\", \"value\": 2}, {\"label\": \"一半时间\", \"value\": 3}, {\"label\": \"大多数时间\", \"value\": 4}, {\"label\": \"总是\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (367, 'd2d26428ea0847a89af1fb817e648db0', '131', 'RADIO', '能听取不同的意见，包括对自己的批评  ', 1, NULL, 1, NULL, 2097152, 24,
        '{
          \"options\": [{\"label\": \"从不\", \"value\": 1}, {\"label\": \"几乎不\", \"value\": 2}, {\"label\": \"一半时间\", \"value\": 3}, {\"label\": \"大多数时间\", \"value\": 4}, {\"label\": \"总是\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (368, 'd2d26428ea0847a89af1fb817e648db0', '132', 'RADIO', '我时常勉励自己，对未来充满希望  ', 1, NULL, 1, NULL, 2162688, 24, '{
  \"options\": [{\"label\": \"从不\", \"value\": 1}, {\"label\": \"几乎不\", \"value\": 2}, {\"label\": \"一半时间\", \"value\": 3}, {\"label\": \"大多数时间\", \"value\": 4}, {\"label\": \"总是\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (369, 'd2d26428ea0847a89af1fb817e648db0', '100', 'RADIO', '您的性别是  ', 1, NULL, 1, NULL, 2228224, 24, '{
  \"options\": [{\"label\": \"男\", \"value\": 1}, {\"label\": \"女\", \"value\": 2}]}', NULL, '2021-01-11 13:58:21',
        '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (370, 'd2d26428ea0847a89af1fb817e648db0', '101', 'SELECT', '您的出生年份是？   ', 1, NULL, 1, NULL, 2293760, 24, '{
  \"options\": [{\"label\": \"2005年后\", \"value\": 1}, {\"label\": \"2005年\", \"value\": 2}, {\"label\": \"2004年\", \"value\": 3}, {\"label\": \"2003年\", \"value\": 4}, {\"label\": \"2002年\", \"value\": 5}, {\"label\": \"0201年\", \"value\": 6}, {\"label\": \"2000年\", \"value\": 7}, {\"label\": \"1999年\", \"value\": 8}, {\"label\": \"1998年\", \"value\": 9}, {\"label\": \"1997年\", \"value\": 10}, {\"label\": \"1996年\", \"value\": 11}, {\"label\": \"1995年\", \"value\": 12}, {\"label\": \"1994年\", \"value\": 13}, {\"label\": \"1993年\", \"value\": 14}, {\"label\": \"1992年\", \"value\": 15}, {\"label\": \"1991年\", \"value\": 16}, {\"label\": \"1990年\", \"value\": 17}, {\"label\": \"1989年\", \"value\": 18}, {\"label\": \"1988年\", \"value\": 19}, {\"label\": \"1987年\", \"value\": 20}, {\"label\": \"1986年\", \"value\": 21}, {\"label\": \"1985年\", \"value\": 22}, {\"label\": \"1984年\", \"value\": 23}, {\"label\": \"1983年\", \"value\": 24}, {\"label\": \"1982年\", \"value\": 25}, {\"label\": \"1981年\", \"value\": 26}, {\"label\": \"1980年\", \"value\": 27}, {\"label\": \"1979年\", \"value\": 28}, {\"label\": \"1978年\", \"value\": 29}, {\"label\": \"1977年\", \"value\": 30}, {\"label\": \"1976年\", \"value\": 31}, {\"label\": \"1975年\", \"value\": 32}, {\"label\": \"1974年\", \"value\": 33}, {\"label\": \"1973年\", \"value\": 34}, {\"label\": \"1972年\", \"value\": 35}, {\"label\": \"1971年\", \"value\": 36}, {\"label\": \"1970年\", \"value\": 37}, {\"label\": \"1969年\", \"value\": 38}, {\"label\": \"1968年\", \"value\": 39}, {\"label\": \"1967年\", \"value\": 40}, {\"label\": \"1966年\", \"value\": 41}, {\"label\": \"1965年\", \"value\": 42}, {\"label\": \"1964年\", \"value\": 43}, {\"label\": \"1963年\", \"value\": 44}, {\"label\": \"1962年\", \"value\": 45}, {\"label\": \"1961年\", \"value\": 46}, {\"label\": \"1960年\", \"value\": 47}, {\"label\": \"1960年前\", \"value\": 48}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (371, 'd2d26428ea0847a89af1fb817e648db0', '102', 'RADIO', '您的学历是  ', 1, NULL, 1, NULL, 2359296, 24, '{
  \"options\": [{\"label\": \"初中及以下\", \"value\": 1}, {\"label\": \"高中/中专\", \"value\": 2}, {\"label\": \"专科/高职\", \"value\": 3}, {\"label\": \"本科\", \"value\": 4}, {\"label\": \"硕士及以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (372, 'd2d26428ea0847a89af1fb817e648db0', '103', 'RADIO', '您每月的收入大概是  ', 1, NULL, 1, NULL, 2424832, 24, '{
  \"options\": [{\"label\": \"1000元以下\", \"value\": 1}, {\"label\": \"1000-1999元\", \"value\": 2}, {\"label\": \"2000-3999元\", \"value\": 3}, {\"label\": \"4000-5999元\", \"value\": 4}, {\"label\": \"6000-9999元\", \"value\": 5}, {\"label\": \"10000-19999元\", \"value\": 6}, {\"label\": \"20000元以上\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (373, 'd2d26428ea0847a89af1fb817e648db0', '104', 'RADIO', '您的职业是  ', 1, NULL, 1, NULL, 2490368, 24, '{
  \"options\": [{\"label\": \"学生\", \"value\": 1}, {\"label\": \"政府/机关干部/公务员/事业单位\", \"value\": 2}, {\"label\": \"企业管理者（包括基层及中高成管理者）\", \"value\": 3}, {\"label\": \"普通职员/白领工作者（在办公室/写字楼工作）\", \"value\": 4}, {\"label\": \"专业人员（如医生、律师、文体、记者、老师等）\", \"value\": 5}, {\"label\": \"蓝领工作者（普通工人）\", \"value\": 6}, {\"label\": \"销售人员/商店职员\", \"value\": 7}, {\"label\": \"自由职业者\", \"value\": 8}, {\"label\": \"退休\", \"value\": 9}, {\"label\": \"暂无固定职业\", \"value\": 10}, {\"label\": \"其他\", \"value\": 11}]}',
        NULL, '2021-01-11 13:58:21', '2021-01-11 13:58:21', 0);
INSERT INTO `pr_project_template_item`
VALUES (374, '9fb633d6da764926a499a68231b6f9cd', '100', 'INPUT', '上报人的姓名是？\n', 1, NULL, 1, NULL, 65536, 24, '{}', NULL,
        '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (375, '9fb633d6da764926a499a68231b6f9cd', '101', 'INPUT', '上报人的身份证最后四位是？&nbsp;\n', 1, NULL, 1, NULL, 131072, 24,
        '{}', NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (376, '9fb633d6da764926a499a68231b6f9cd', '102', 'INPUT', '代填人的姓名是？\n', 1, NULL, 0, NULL, 196608, 24, '{}', NULL,
        '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (377, '9fb633d6da764926a499a68231b6f9cd', '103', 'INPUT', '代填人身份证最后四位是？&nbsp;\n', 1, NULL, 0, NULL, 262144, 24,
        '{}', NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (378, '9fb633d6da764926a499a68231b6f9cd', '101', 'RADIO', '您当前是否有以下症状和体征？\n', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"发热\\n\", \"value\": 1}, {\"label\": \"干咳\\n\", \"value\": 2}, {\"label\": \"乏力\\n\", \"value\": 3}, {\"label\": \"咳痰\\n\", \"value\": 4}, {\"label\": \"鼻塞\\n\", \"value\": 5}, {\"label\": \"流鼻涕\\n\", \"value\": 6}, {\"label\": \"打寒颤\\n\", \"value\": 7}, {\"label\": \"气促\\n\", \"value\": 8}, {\"label\": \"呼吸困难\\n\", \"value\": 9}, {\"label\": \"咽喉痛\\n\", \"value\": 10}, {\"label\": \"头疼\\n\", \"value\": 11}, {\"label\": \"肌肉酸痛\\n\", \"value\": 12}, {\"label\": \"关节酸痛\\n\", \"value\": 13}, {\"label\": \"胸闷\\n\", \"value\": 14}, {\"label\": \"呕吐\\n\", \"value\": 15}, {\"label\": \"腹泻\\n\", \"value\": 16}, {\"label\": \"以上症状和体征都没有\\n\", \"value\": 17}]}',
        NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (379, '9fb633d6da764926a499a68231b6f9cd', '102', 'RADIO', '以下描述中，您符合的场景有？\n', 1, NULL, 1, NULL, 393216, 24, '{
  \"options\": [{\"label\": \"返岗前14天去过疫情高风险地区\\n\", \"value\": 1}, {\"label\": \"返岗前14天有经过疫情高风险地区\\n\", \"value\": 2}, {\"label\": \"返岗前14天接触过疫情高风险地区过来的人\\n\", \"value\": 3}, {\"label\": \"返岗前14天有接触过有&quot;发热、乏力、干咳或胸闷&quot;等不适症状的人\\n\", \"value\": 4}, {\"label\": \"以上都不符合\\n\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (380, '9fb633d6da764926a499a68231b6f9cd', '103', 'DATE', '您最后离开疫情高风险地区的时间是？\n', 1, NULL, 0, NULL, 458752, 24,
        '{}', NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (381, '9fb633d6da764926a499a68231b6f9cd', '104', 'DATE', '您最后接触有疫情高风险地区旅居史人员的时间是？\n', 1, NULL, 0, NULL, 524288,
        24, '{}', NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (382, '9fb633d6da764926a499a68231b6f9cd', '105', 'DATE', '您最后接触有&ldquo;发热、乏力、干咳或胸闷&rdquo;等不适症状人员的时间是？\n', 1,
        NULL, 0, NULL, 589824, 24, '{}', NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (383, '9fb633d6da764926a499a68231b6f9cd', '100', 'SELECT', '您的出生年份是？\n', 1, NULL, 1, NULL, 655360, 24, '{
  \"options\": [{\"label\": \"2010年后\", \"value\": 1}, {\"label\": \"2010年\", \"value\": 2}, {\"label\": \"2009年\", \"value\": 3}, {\"label\": \"2008年\", \"value\": 4}, {\"label\": \"2007年\", \"value\": 5}, {\"label\": \"2006年\", \"value\": 6}, {\"label\": \"2005年\", \"value\": 7}, {\"label\": \"2004年\", \"value\": 8}, {\"label\": \"2003年\", \"value\": 9}, {\"label\": \"2002年\", \"value\": 10}, {\"label\": \"2001年\", \"value\": 11}, {\"label\": \"2000年\", \"value\": 12}, {\"label\": \"1999年\", \"value\": 13}, {\"label\": \"1998年\", \"value\": 14}, {\"label\": \"1997年\", \"value\": 15}, {\"label\": \"1996年\", \"value\": 16}, {\"label\": \"1995年\", \"value\": 17}, {\"label\": \"1994年\", \"value\": 18}, {\"label\": \"1993年\", \"value\": 19}, {\"label\": \"1992年\", \"value\": 20}, {\"label\": \"1991年\", \"value\": 21}, {\"label\": \"1990年\", \"value\": 22}, {\"label\": \"1989年\", \"value\": 23}, {\"label\": \"1988年\", \"value\": 24}, {\"label\": \"1987年\", \"value\": 25}, {\"label\": \"1986年\", \"value\": 26}, {\"label\": \"1985年\", \"value\": 27}, {\"label\": \"1984年\", \"value\": 28}, {\"label\": \"1983年\", \"value\": 29}, {\"label\": \"1982年\", \"value\": 30}, {\"label\": \"1981年\", \"value\": 31}, {\"label\": \"1980年\", \"value\": 32}, {\"label\": \"1979年\", \"value\": 33}, {\"label\": \"1978年\", \"value\": 34}, {\"label\": \"1977年\", \"value\": 35}, {\"label\": \"1976年\", \"value\": 36}, {\"label\": \"1975年\", \"value\": 37}, {\"label\": \"1974年\", \"value\": 38}, {\"label\": \"1973年\", \"value\": 39}, {\"label\": \"1972年\", \"value\": 40}, {\"label\": \"1971年\", \"value\": 41}, {\"label\": \"1970年\", \"value\": 42}, {\"label\": \"1969年\", \"value\": 43}, {\"label\": \"1968年\", \"value\": 44}, {\"label\": \"1967年\", \"value\": 45}, {\"label\": \"1966年\", \"value\": 46}, {\"label\": \"1965年\", \"value\": 47}, {\"label\": \"1964年\", \"value\": 48}, {\"label\": \"1963年\", \"value\": 49}, {\"label\": \"1962年\", \"value\": 50}, {\"label\": \"1961年\", \"value\": 51}, {\"label\": \"1960年\", \"value\": 52}, {\"label\": \"1960年前\", \"value\": 53}]}',
        NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (384, '9fb633d6da764926a499a68231b6f9cd', '101', 'RADIO', '您的性别是？\n', 1, NULL, 1, NULL, 720896, 24, '{
  \"options\": [{\"label\": \"男\\n\", \"value\": 1}, {\"label\": \"女\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (385, '9fb633d6da764926a499a68231b6f9cd', '102', 'INPUT', '您的联系电话是？\n', 1, NULL, 1, NULL, 786432, 24, '{}', NULL,
        '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (386, '9fb633d6da764926a499a68231b6f9cd', '103', 'INPUT', '紧急联系人姓名？\n', 1, NULL, 1, NULL, 851968, 24, '{}', NULL,
        '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (387, '9fb633d6da764926a499a68231b6f9cd', '104', 'INPUT', '紧急联系人联系电话？\n', 1, NULL, 1, NULL, 917504, 24, '{}',
        NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (388, '9fb633d6da764926a499a68231b6f9cd', '105', 'DATE', '您返岗前所在的地区是？\n', 1, NULL, 1, NULL, 983040, 24, '{}',
        NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (389, '9fb633d6da764926a499a68231b6f9cd', '106', 'DATE', '您当前所在的地区是？\n', 1, NULL, 1, NULL, 1048576, 24, '{}',
        NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (390, '9fb633d6da764926a499a68231b6f9cd', '107', 'DATE', '您返程的日期是？\n', 1, NULL, 0, NULL, 1114112, 24, '{}', NULL,
        '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (391, '9fb633d6da764926a499a68231b6f9cd', '108', 'RADIO', '您返岗时乘坐交通工具主要是？\n', 1, NULL, 1, NULL, 1179648, 24, '{
  \"options\": [{\"label\": \"火车\\n\", \"value\": 1}, {\"label\": \"飞机\\n\", \"value\": 2}, {\"label\": \"轮船\\n\", \"value\": 3}, {\"label\": \"长途公共巴士\\n\", \"value\": 4}, {\"label\": \"自驾\\n\", \"value\": 5}, {\"label\": \"其他&lt;span class=&quot;mod_fillblank&quot; data-id=&quot;fillblank-jXWa&quot;&gt;____&lt;/span&gt;\\n\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (392, '9fb633d6da764926a499a68231b6f9cd', '109', 'INPUT', '您计划乘坐公共交通工具的具体航班是？\n', 1, NULL, 0, NULL, 1245184, 24,
        '{}', NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (393, '2d2dc94faa1a48ae9f81d0ae194e94fc', '100', 'INPUT', '你的姓名:&nbsp;\n', 1, NULL, 1, NULL, 65536, 24, '{}',
        NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (394, '2d2dc94faa1a48ae9f81d0ae194e94fc', '101', 'INPUT', '你的学号是：\n', 1, NULL, 1, NULL, 131072, 24, '{}', NULL,
        '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (395, '2d2dc94faa1a48ae9f81d0ae194e94fc', '102', 'RADIO', '你当前是：\n', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"专科生\\n\", \"value\": 1}, {\"label\": \"本科生\\n\", \"value\": 2}, {\"label\": \"研究生\\n\", \"value\": 3}, {\"label\": \"博士生\\n\", \"value\": 4}, {\"label\": \"其他&lt;span class=&quot;mod_fillblank&quot; data-id=&quot;fillblank-WTcQ&quot;&gt;____&lt;/span&gt;\\n\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (396, '2d2dc94faa1a48ae9f81d0ae194e94fc', '103', 'INPUT', '你所在的学院是：\n', 1, NULL, 1, NULL, 262144, 24, '{}', NULL,
        '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (397, '2d2dc94faa1a48ae9f81d0ae194e94fc', '104', 'INPUT', '你所在的专业是：\n', 1, NULL, 1, NULL, 327680, 24, '{}', NULL,
        '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (398, '2d2dc94faa1a48ae9f81d0ae194e94fc', '105', 'INPUT', '你所在班级是：\n', 1, NULL, 1, NULL, 393216, 24, '{}', NULL,
        '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (399, '2d2dc94faa1a48ae9f81d0ae194e94fc', '101', 'RADIO', '你当前的身体状况是:\n', 1, NULL, 1, NULL, 458752, 24, '{
  \"options\": [{\"label\": \"正常，没有症状\\n\", \"value\": 1}, {\"label\": \"发热\\n\", \"value\": 2}, {\"label\": \"新型肺炎疑似病例\\n\", \"value\": 3}, {\"label\": \"新型肺炎确诊病例\\n\", \"value\": 4}, {\"label\": \"疑似病例已排除\\n\", \"value\": 5}, {\"label\": \"确诊病例已治愈\\n\", \"value\": 6}, {\"label\": \"其他&lt;span class=&quot;mod_fillblank&quot; data-id=&quot;fillblank-NfVY&quot;&gt;____&lt;/span&gt;\\n\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (400, '2d2dc94faa1a48ae9f81d0ae194e94fc', '102', 'RADIO', '你当前的隔离状态是：\n', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"是，自我隔离中\\n\", \"value\": 1}, {\"label\": \"是，强制隔离中\\n\", \"value\": 2}, {\"label\": \"否\\n\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (401, '2d2dc94faa1a48ae9f81d0ae194e94fc', '103', 'DATE', '你开始隔离的时间是：\n', 1, NULL, 1, NULL, 589824, 24, '{}',
        NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (402, '2d2dc94faa1a48ae9f81d0ae194e94fc', '104', 'RADIO', '你当前隔离的地点是：\n', 1, NULL, 1, NULL, 655360, 24, '{
  \"options\": [{\"label\": \"家中\\n\", \"value\": 1}, {\"label\": \"医院\\n\", \"value\": 2}, {\"label\": \"政府指定隔离点\\n\", \"value\": 3}, {\"label\": \"其他&lt;span class=&quot;mod_fillblank&quot; data-id=&quot;fillblank-IP4G&quot;&gt;____&lt;/span&gt;\\n\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (403, '2d2dc94faa1a48ae9f81d0ae194e94fc', '105', 'DATE', '你被确诊为疑似病例的时间是：\n', 1, NULL, 1, NULL, 720896, 24, '{}',
        NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (404, '2d2dc94faa1a48ae9f81d0ae194e94fc', '106', 'DATE', '你被确诊为新型肺炎的时间是：\n', 1, NULL, 1, NULL, 786432, 24, '{}',
        NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (405, '2d2dc94faa1a48ae9f81d0ae194e94fc', '107', 'DATE', '你被排除疑似的时间是：\n', 1, NULL, 1, NULL, 851968, 24, '{}',
        NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (406, '2d2dc94faa1a48ae9f81d0ae194e94fc', '108', 'INPUT', '你被疑似或确诊为新型肺炎的医院是：\n', 1, NULL, 1, NULL, 917504, 24,
        '{}', NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (407, '2d2dc94faa1a48ae9f81d0ae194e94fc', '111', 'DATE', '你确诊已治愈的时间是：\n', 1, NULL, 1, NULL, 983040, 24, '{}',
        NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (408, '2d2dc94faa1a48ae9f81d0ae194e94fc', '113', 'RADIO', '以下描述中，你符合的场景有：\n', 1, NULL, 1, NULL, 1048576, 24, '{
  \"options\": [{\"label\": \"返校前14天去过疫情高风险地区\\n\", \"value\": 1}, {\"label\": \"返校前14天有经过疫情高风险地区\\n\", \"value\": 2}, {\"label\": \"返校前14天接触过疫情高风险地区过来的人\\n\", \"value\": 3}, {\"label\": \"返校前14天有接触过有&ldquo;发热、乏力、干咳或胸闷&rdquo;等不适症状的人\\n\", \"value\": 4}, {\"label\": \"以上都不符合\\n\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (409, '2d2dc94faa1a48ae9f81d0ae194e94fc', '100', 'RADIO', '你的性别是：\n', 1, NULL, 1, NULL, 1114112, 24, '{
  \"options\": [{\"label\": \"男\\n\", \"value\": 1}, {\"label\": \"女\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (410, '2d2dc94faa1a48ae9f81d0ae194e94fc', '101', 'INPUT', '你的联系电话:&nbsp;\n', 1, NULL, 1, NULL, 1179648, 24, '{}',
        NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (411, '2d2dc94faa1a48ae9f81d0ae194e94fc', '102', 'INPUT', '紧急联系人姓名:&nbsp;\n', 1, NULL, 1, NULL, 1245184, 24,
        '{}', NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (412, '2d2dc94faa1a48ae9f81d0ae194e94fc', '103', 'INPUT', '紧急联系人联系电话:&nbsp;\n', 1, NULL, 1, NULL, 1310720, 24,
        '{}', NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (413, '2d2dc94faa1a48ae9f81d0ae194e94fc', '104', 'SELECT', '你当前所在地是：\n', 1, NULL, 1, NULL, 1376256, 24, '{
  \"options\": [{\"label\": \"中国\", \"value\": 1}, {\"label\": \"香港（中国）\", \"value\": 2}, {\"label\": \"澳门（中国）\", \"value\": 3}, {\"label\": \"台湾（中国）\", \"value\": 4}, {\"label\": \"阿富汗\", \"value\": 5}, {\"label\": \"奥兰群岛\", \"value\": 6}, {\"label\": \"阿尔巴尼亚\", \"value\": 7}, {\"label\": \"阿尔及利亚\", \"value\": 8}, {\"label\": \"美属萨摩亚\", \"value\": 9}, {\"label\": \"安道尔\", \"value\": 10}, {\"label\": \"安哥拉\", \"value\": 11}, {\"label\": \"安圭拉\", \"value\": 12}, {\"label\": \"南极洲\", \"value\": 13}, {\"label\": \"安提瓜和巴布达\", \"value\": 14}, {\"label\": \"阿根廷\", \"value\": 15}, {\"label\": \"亚美尼亚\", \"value\": 16}, {\"label\": \"阿鲁巴\", \"value\": 17}, {\"label\": \"澳大利亚\", \"value\": 18}, {\"label\": \"奥地利\", \"value\": 19}, {\"label\": \"阿塞拜疆\", \"value\": 20}, {\"label\": \"巴哈马\", \"value\": 21}, {\"label\": \"巴林\", \"value\": 22}, {\"label\": \"孟加拉国\", \"value\": 23}, {\"label\": \"巴巴多斯\", \"value\": 24}, {\"label\": \"白俄罗斯\", \"value\": 25}, {\"label\": \"比利时\", \"value\": 26}, {\"label\": \"伯利兹\", \"value\": 27}, {\"label\": \"贝宁\", \"value\": 28}, {\"label\": \"百慕大\", \"value\": 29}, {\"label\": \"不丹\", \"value\": 30}, {\"label\": \"玻利维亚\", \"value\": 31}, {\"label\": \"波黑\", \"value\": 32}, {\"label\": \"博茨瓦纳\", \"value\": 33}, {\"label\": \"布维岛\", \"value\": 34}, {\"label\": \"巴西\", \"value\": 35}, {\"label\": \"英属印度洋领地\", \"value\": 36}, {\"label\": \"文莱\", \"value\": 37}, {\"label\": \"保加利亚\", \"value\": 38}, {\"label\": \"布基纳法索\", \"value\": 39}, {\"label\": \"布隆迪\", \"value\": 40}, {\"label\": \"柬埔寨\", \"value\": 41}, {\"label\": \"喀麦隆\", \"value\": 42}, {\"label\": \"加拿大\", \"value\": 43}, {\"label\": \"佛得角\", \"value\": 44}, {\"label\": \"开曼群岛\", \"value\": 45}, {\"label\": \"中非\", \"value\": 46}, {\"label\": \"乍得\", \"value\": 47}, {\"label\": \"智利\", \"value\": 48}, {\"label\": \"圣诞岛\", \"value\": 49}, {\"label\": \"科科斯（基林）群岛\", \"value\": 50}, {\"label\": \"哥伦比亚\", \"value\": 51}, {\"label\": \"科摩罗\", \"value\": 52}, {\"label\": \"刚果（布）\", \"value\": 53}, {\"label\": \"刚果（金）\", \"value\": 54}, {\"label\": \"库克群岛\", \"value\": 55}, {\"label\": \"哥斯达黎加\", \"value\": 56}, {\"label\": \"科特迪瓦\", \"value\": 57}, {\"label\": \"克罗地亚\", \"value\": 58}, {\"label\": \"古巴\", \"value\": 59}, {\"label\": \"塞浦路斯\", \"value\": 60}, {\"label\": \"捷克\", \"value\": 61}, {\"label\": \"丹麦\", \"value\": 62}, {\"label\": \"吉布提\", \"value\": 63}, {\"label\": \"多米尼克\", \"value\": 64}, {\"label\": \"多米尼加\", \"value\": 65}, {\"label\": \"厄瓜多尔\", \"value\": 66}, {\"label\": \"埃及\", \"value\": 67}, {\"label\": \"萨尔瓦多\", \"value\": 68}, {\"label\": \"赤道几内亚\", \"value\": 69}, {\"label\": \"厄立特里亚\", \"value\": 70}, {\"label\": \"爱沙尼亚\", \"value\": 71}, {\"label\": \"埃塞俄比亚\", \"value\": 72}, {\"label\": \"福克兰群岛（马尔维纳斯）\", \"value\": 73}, {\"label\": \"法罗群岛\", \"value\": 74}, {\"label\": \"斐济\", \"value\": 75}, {\"label\": \"芬兰\", \"value\": 76}, {\"label\": \"法国\", \"value\": 77}, {\"label\": \"法属圭亚那\", \"value\": 78}, {\"label\": \"法属波利尼西亚\", \"value\": 79}, {\"label\": \"法属南部领地\", \"value\": 80}, {\"label\": \"加蓬\", \"value\": 81}, {\"label\": \"冈比亚\", \"value\": 82}, {\"label\": \"格鲁吉亚\", \"value\": 83}, {\"label\": \"德国\", \"value\": 84}, {\"label\": \"加纳\", \"value\": 85}, {\"label\": \"直布罗陀\", \"value\": 86}, {\"label\": \"希腊\", \"value\": 87}, {\"label\": \"格陵兰\", \"value\": 88}, {\"label\": \"格林纳达\", \"value\": 89}, {\"label\": \"瓜德罗普\", \"value\": 90}, {\"label\": \"关岛\", \"value\": 91}, {\"label\": \"危地马拉\", \"value\": 92}, {\"label\": \"格恩西岛\", \"value\": 93}, {\"label\": \"几内亚\", \"value\": 94}, {\"label\": \"几内亚比绍\", \"value\": 95}, {\"label\": \"圭亚那\", \"value\": 96}, {\"label\": \"海地\", \"value\": 97}, {\"label\": \"赫德岛和麦克唐纳岛\", \"value\": 98}, {\"label\": \"梵蒂冈\", \"value\": 99}, {\"label\": \"洪都拉斯\", \"value\": 100}, {\"label\": \"匈牙利\", \"value\": 101}, {\"label\": \"冰岛\", \"value\": 102}, {\"label\": \"印度\", \"value\": 103}, {\"label\": \"印度尼西亚\", \"value\": 104}, {\"label\": \"伊朗\", \"value\": 105}, {\"label\": \"伊拉克\", \"value\": 106}, {\"label\": \"Ireland\", \"value\": 107}, {\"label\": \"英国属地曼岛\", \"value\": 108}, {\"label\": \"以色列\", \"value\": 109}, {\"label\": \"意大利\", \"value\": 110}, {\"label\": \"牙买加\", \"value\": 111}, {\"label\": \"日本\", \"value\": 112}, {\"label\": \"泽西岛\", \"value\": 113}, {\"label\": \"约旦\", \"value\": 114}, {\"label\": \"哈萨克斯坦\", \"value\": 115}, {\"label\": \"肯尼亚\", \"value\": 116}, {\"label\": \"基里巴斯\", \"value\": 117}, {\"label\": \"朝鲜\", \"value\": 118}, {\"label\": \"韩国\", \"value\": 119}, {\"label\": \"科威特\", \"value\": 120}, {\"label\": \"吉尔吉斯斯坦\", \"value\": 121}, {\"label\": \"老挝\", \"value\": 122}, {\"label\": \"拉脱维亚\", \"value\": 123}, {\"label\": \"黎巴嫩\", \"value\": 124}, {\"label\": \"莱索托\", \"value\": 125}, {\"label\": \"利比里亚\", \"value\": 126}, {\"label\": \"利比亚\", \"value\": 127}, {\"label\": \"列支敦士登\", \"value\": 128}, {\"label\": \"立陶宛\", \"value\": 129}, {\"label\": \"卢森堡\", \"value\": 130}, {\"label\": \"前南马其顿\", \"value\": 131}, {\"label\": \"马达加斯加\", \"value\": 132}, {\"label\": \"马拉维\", \"value\": 133}, {\"label\": \"马来西亚\", \"value\": 134}, {\"label\": \"马尔代夫\", \"value\": 135}, {\"label\": \"马里\", \"value\": 136}, {\"label\": \"马耳他\", \"value\": 137}, {\"label\": \"马绍尔群岛\", \"value\": 138}, {\"label\": \"马提尼克\", \"value\": 139}, {\"label\": \"毛利塔尼亚\", \"value\": 140}, {\"label\": \"毛里求斯\", \"value\": 141}, {\"label\": \"马约特\", \"value\": 142}, {\"label\": \"墨西哥\", \"value\": 143}, {\"label\": \"密克罗尼西亚联邦\", \"value\": 144}, {\"label\": \"摩尔多瓦\", \"value\": 145}, {\"label\": \"摩纳哥\", \"value\": 146}, {\"label\": \"蒙古\", \"value\": 147}, {\"label\": \"黑山\", \"value\": 148}, {\"label\": \"蒙特塞拉特\", \"value\": 149}, {\"label\": \"摩洛哥\", \"value\": 150}, {\"label\": \"莫桑比克\", \"value\": 151}, {\"label\": \"缅甸\", \"value\": 152}, {\"label\": \"纳米比亚\", \"value\": 153}, {\"label\": \"瑙鲁\", \"value\": 154}, {\"label\": \"尼泊尔\", \"value\": 155}, {\"label\": \"荷兰\", \"value\": 156}, {\"label\": \"荷属安的列斯\", \"value\": 157}, {\"label\": \"新喀里多尼亚\", \"value\": 158}, {\"label\": \"新西兰\", \"value\": 159}, {\"label\": \"尼加拉瓜\", \"value\": 160}, {\"label\": \"尼日尔\", \"value\": 161}, {\"label\": \"尼日利亚\", \"value\": 162}, {\"label\": \"纽埃\", \"value\": 163}, {\"label\": \"诺福克岛\", \"value\": 164}, {\"label\": \"北马里亚纳\", \"value\": 165}, {\"label\": \"挪威\", \"value\": 166}, {\"label\": \"阿曼\", \"value\": 167}, {\"label\": \"巴基斯坦\", \"value\": 168}, {\"label\": \"帕劳\", \"value\": 169}, {\"label\": \"巴勒斯坦\", \"value\": 170}, {\"label\": \"巴拿马\", \"value\": 171}, {\"label\": \"巴布亚新几内亚\", \"value\": 172}, {\"label\": \"巴拉圭\", \"value\": 173}, {\"label\": \"秘鲁\", \"value\": 174}, {\"label\": \"菲律宾\", \"value\": 175}, {\"label\": \"皮特凯恩\", \"value\": 176}, {\"label\": \"波兰\", \"value\": 177}, {\"label\": \"葡萄牙\", \"value\": 178}, {\"label\": \"波多黎各\", \"value\": 179}, {\"label\": \"卡塔尔\", \"value\": 180}, {\"label\": \"留尼汪\", \"value\": 181}, {\"label\": \"罗马尼亚\", \"value\": 182}, {\"label\": \"俄罗斯联邦\", \"value\": 183}, {\"label\": \"卢旺达\", \"value\": 184}, {\"label\": \"圣赫勒拿\", \"value\": 185}, {\"label\": \"圣基茨和尼维斯\", \"value\": 186}, {\"label\": \"圣卢西亚\", \"value\": 187}, {\"label\": \"圣皮埃尔和密克隆\", \"value\": 188}, {\"label\": \"圣文森特和格林纳丁斯\", \"value\": 189}, {\"label\": \"萨摩亚\", \"value\": 190}, {\"label\": \"圣马力诺\", \"value\": 191}, {\"label\": \"圣多美和普林西比\", \"value\": 192}, {\"label\": \"沙特阿拉伯\", \"value\": 193}, {\"label\": \"塞内加尔\", \"value\": 194}, {\"label\": \"塞尔维亚\", \"value\": 195}, {\"label\": \"塞舌尔\", \"value\": 196}, {\"label\": \"塞拉利昂\", \"value\": 197}, {\"label\": \"新加坡\", \"value\": 198}, {\"label\": \"斯洛伐克\", \"value\": 199}, {\"label\": \"斯洛文尼亚\", \"value\": 200}, {\"label\": \"所罗门群岛\", \"value\": 201}, {\"label\": \"索马里\", \"value\": 202}, {\"label\": \"南非\", \"value\": 203}, {\"label\": \"南乔治亚岛和南桑德韦奇岛\", \"value\": 204}, {\"label\": \"西班牙\", \"value\": 205}, {\"label\": \"斯里兰卡\", \"value\": 206}, {\"label\": \"苏丹\", \"value\": 207}, {\"label\": \"苏里南\", \"value\": 208}, {\"label\": \"斯瓦尔巴岛和扬马延岛\", \"value\": 209}, {\"label\": \"斯威士兰\", \"value\": 210}, {\"label\": \"瑞典\", \"value\": 211}, {\"label\": \"瑞士\", \"value\": 212}, {\"label\": \"叙利亚\", \"value\": 213}, {\"label\": \"塔吉克斯坦\", \"value\": 214}, {\"label\": \"坦桑尼亚\", \"value\": 215}, {\"label\": \"泰国\", \"value\": 216}, {\"label\": \"东帝汶\", \"value\": 217}, {\"label\": \"多哥\", \"value\": 218}, {\"label\": \"托克劳\", \"value\": 219}, {\"label\": \"汤加\", \"value\": 220}, {\"label\": \"特立尼达和多巴哥\", \"value\": 221}, {\"label\": \"突尼斯\", \"value\": 222}, {\"label\": \"土耳其\", \"value\": 223}, {\"label\": \"土库曼斯坦\", \"value\": 224}, {\"label\": \"特克斯和凯科斯群岛\", \"value\": 225}, {\"label\": \"图瓦卢\", \"value\": 226}, {\"label\": \"乌干达\", \"value\": 227}, {\"label\": \"乌克兰\", \"value\": 228}, {\"label\": \"阿联酋\", \"value\": 229}, {\"label\": \"英国\", \"value\": 230}, {\"label\": \"美国\", \"value\": 231}, {\"label\": \"美国本土外小岛屿\", \"value\": 232}, {\"label\": \"乌拉圭\", \"value\": 233}, {\"label\": \"乌兹别克斯坦\", \"value\": 234}, {\"label\": \"瓦努阿图\", \"value\": 235}, {\"label\": \"委内瑞拉\", \"value\": 236}, {\"label\": \"越南\", \"value\": 237}, {\"label\": \"英属维尔京群岛\", \"value\": 238}, {\"label\": \"美属维尔京群岛\", \"value\": 239}, {\"label\": \"瓦利斯和富图纳\", \"value\": 240}, {\"label\": \"西撒哈拉\", \"value\": 241}, {\"label\": \"也门\", \"value\": 242}, {\"label\": \"赞比亚\", \"value\": 243}, {\"label\": \"津巴布韦\", \"value\": 244}]}',
        NULL, '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (414, '2d2dc94faa1a48ae9f81d0ae194e94fc', '105', 'DATE', '你所在的地区是：\n', 1, NULL, 1, NULL, 1441792, 24, '{}', NULL,
        '2021-01-11 13:58:31', '2021-01-11 13:58:31', 0);
INSERT INTO `pr_project_template_item`
VALUES (415, 'e13d66dcd329435ca7b539e4f1a4183b', '100', 'INPUT', '您的姓名:&nbsp;\n', 1, NULL, 1, NULL, 65536, 24, '{}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (416, 'e13d66dcd329435ca7b539e4f1a4183b', '101', 'INPUT', '您的工号:&nbsp;\n', 1, NULL, 1, NULL, 131072, 24, '{}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (417, 'e13d66dcd329435ca7b539e4f1a4183b', '102', 'RADIO', '您的身份是：\n', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"教职工\\n\", \"value\": 1}, {\"label\": \"合同制员工\\n\", \"value\": 2}, {\"label\": \"其他&lt;span class=&quot;mod_fillblank&quot; data-id=&quot;fillblank-HEn1&quot;&gt;____&lt;/span&gt;\\n\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (418, 'e13d66dcd329435ca7b539e4f1a4183b', '103', 'INPUT', '您的院系/部处是：\n', 1, NULL, 1, NULL, 262144, 24, '{}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (419, 'e13d66dcd329435ca7b539e4f1a4183b', '101', 'RADIO', '您当前的身体状况是：\n', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"正常、没有症状\\n\", \"value\": 1}, {\"label\": \"发热\\n\", \"value\": 2}, {\"label\": \"新型肺炎疑似病例\\n\", \"value\": 3}, {\"label\": \"新型肺炎确诊病例\\n\", \"value\": 4}, {\"label\": \"疑似病例已排除\\n\", \"value\": 5}, {\"label\": \"确诊病例已治愈\\n\", \"value\": 6}, {\"label\": \"其他&lt;span class=&quot;mod_fillblank&quot; data-id=&quot;fillblank-NfVY&quot;&gt;____&lt;/span&gt;\\n\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (420, 'e13d66dcd329435ca7b539e4f1a4183b', '102', 'RADIO', '您当前是否采取自我隔离观察等措施？\n', 1, NULL, 1, NULL, 393216, 24, '{
  \"options\": [{\"label\": \"是，自我隔离中\\n\", \"value\": 1}, {\"label\": \"是，强制隔离中\\n\", \"value\": 2}, {\"label\": \"否\\n\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (421, 'e13d66dcd329435ca7b539e4f1a4183b', '103', 'DATE', '您开始隔离的时间是：\n', 1, NULL, 1, NULL, 458752, 24, '{}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (422, 'e13d66dcd329435ca7b539e4f1a4183b', '104', 'RADIO', '您当前隔离的地点是：\n', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"家中\\n\", \"value\": 1}, {\"label\": \"医院\\n\", \"value\": 2}, {\"label\": \"政府指定隔离点\\n\", \"value\": 3}, {\"label\": \"其他&lt;span class=&quot;mod_fillblank&quot; data-id=&quot;fillblank-9UIa&quot;&gt;____&lt;/span&gt;\\n\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (423, 'e13d66dcd329435ca7b539e4f1a4183b', '105', 'DATE', '您被确诊为疑似病例的时间是：\n', 1, NULL, 1, NULL, 589824, 24, '{}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (424, 'e13d66dcd329435ca7b539e4f1a4183b', '106', 'DATE', '您被确诊为新型肺炎的时间是：\n', 1, NULL, 1, NULL, 655360, 24, '{}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (425, 'e13d66dcd329435ca7b539e4f1a4183b', '107', 'DATE', '您被排除疑似的时间是：\n', 1, NULL, 1, NULL, 720896, 24, '{}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (426, 'e13d66dcd329435ca7b539e4f1a4183b', '108', 'INPUT', '您被疑似/确诊为新型肺炎的医院是：\n', 1, NULL, 1, NULL, 786432, 24,
        '{}', NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (427, 'e13d66dcd329435ca7b539e4f1a4183b', '111', 'DATE', '您确诊已治愈的时间是：\n', 1, NULL, 1, NULL, 851968, 24, '{}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (428, 'e13d66dcd329435ca7b539e4f1a4183b', '113', 'RADIO', '以下描述中，您符合的场景有：\n', 1, NULL, 1, NULL, 917504, 24, '{
  \"options\": [{\"label\": \"返校前14天去过疫情高风险地区\\n\", \"value\": 1}, {\"label\": \"返校前14天有经过疫情高风险地区\\n\", \"value\": 2}, {\"label\": \"返校前14天接触过疫情高风险地区过来的人\\n\", \"value\": 3}, {\"label\": \"返校前14天有接触过有&ldquo;发热、乏力、干咳或胸闷&rdquo;等不适症状的人\\n\", \"value\": 4}, {\"label\": \"以上都不符合\\n\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (429, 'e13d66dcd329435ca7b539e4f1a4183b', '100', 'RADIO', '您的性别是：\n', 1, NULL, 1, NULL, 983040, 24, '{
  \"options\": [{\"label\": \"男\\n\", \"value\": 1}, {\"label\": \"女\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (430, 'e13d66dcd329435ca7b539e4f1a4183b', '101', 'INPUT', '您的联系电话:&nbsp;\n', 1, NULL, 1, NULL, 1048576, 24, '{}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (431, 'e13d66dcd329435ca7b539e4f1a4183b', '102', 'INPUT', '紧急联系人姓名:&nbsp;\n', 1, NULL, 1, NULL, 1114112, 24,
        '{}', NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (432, 'e13d66dcd329435ca7b539e4f1a4183b', '103', 'INPUT', '紧急联系人联系电话:&nbsp;\n', 1, NULL, 1, NULL, 1179648, 24,
        '{}', NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (433, 'e13d66dcd329435ca7b539e4f1a4183b', '104', 'SELECT', '您当前所在地是：\n', 1, NULL, 1, NULL, 1245184, 24, '{
  \"options\": [{\"label\": \"中国\", \"value\": 1}, {\"label\": \"香港（中国）\", \"value\": 2}, {\"label\": \"澳门（中国）\", \"value\": 3}, {\"label\": \"台湾（中国）\", \"value\": 4}, {\"label\": \"阿富汗\", \"value\": 5}, {\"label\": \"奥兰群岛\", \"value\": 6}, {\"label\": \"阿尔巴尼亚\", \"value\": 7}, {\"label\": \"阿尔及利亚\", \"value\": 8}, {\"label\": \"美属萨摩亚\", \"value\": 9}, {\"label\": \"安道尔\", \"value\": 10}, {\"label\": \"安哥拉\", \"value\": 11}, {\"label\": \"安圭拉\", \"value\": 12}, {\"label\": \"南极洲\", \"value\": 13}, {\"label\": \"安提瓜和巴布达\", \"value\": 14}, {\"label\": \"阿根廷\", \"value\": 15}, {\"label\": \"亚美尼亚\", \"value\": 16}, {\"label\": \"阿鲁巴\", \"value\": 17}, {\"label\": \"澳大利亚\", \"value\": 18}, {\"label\": \"奥地利\", \"value\": 19}, {\"label\": \"阿塞拜疆\", \"value\": 20}, {\"label\": \"巴哈马\", \"value\": 21}, {\"label\": \"巴林\", \"value\": 22}, {\"label\": \"孟加拉国\", \"value\": 23}, {\"label\": \"巴巴多斯\", \"value\": 24}, {\"label\": \"白俄罗斯\", \"value\": 25}, {\"label\": \"比利时\", \"value\": 26}, {\"label\": \"伯利兹\", \"value\": 27}, {\"label\": \"贝宁\", \"value\": 28}, {\"label\": \"百慕大\", \"value\": 29}, {\"label\": \"不丹\", \"value\": 30}, {\"label\": \"玻利维亚\", \"value\": 31}, {\"label\": \"波黑\", \"value\": 32}, {\"label\": \"博茨瓦纳\", \"value\": 33}, {\"label\": \"布维岛\", \"value\": 34}, {\"label\": \"巴西\", \"value\": 35}, {\"label\": \"英属印度洋领地\", \"value\": 36}, {\"label\": \"文莱\", \"value\": 37}, {\"label\": \"保加利亚\", \"value\": 38}, {\"label\": \"布基纳法索\", \"value\": 39}, {\"label\": \"布隆迪\", \"value\": 40}, {\"label\": \"柬埔寨\", \"value\": 41}, {\"label\": \"喀麦隆\", \"value\": 42}, {\"label\": \"加拿大\", \"value\": 43}, {\"label\": \"佛得角\", \"value\": 44}, {\"label\": \"开曼群岛\", \"value\": 45}, {\"label\": \"中非\", \"value\": 46}, {\"label\": \"乍得\", \"value\": 47}, {\"label\": \"智利\", \"value\": 48}, {\"label\": \"圣诞岛\", \"value\": 49}, {\"label\": \"科科斯（基林）群岛\", \"value\": 50}, {\"label\": \"哥伦比亚\", \"value\": 51}, {\"label\": \"科摩罗\", \"value\": 52}, {\"label\": \"刚果（布）\", \"value\": 53}, {\"label\": \"刚果（金）\", \"value\": 54}, {\"label\": \"库克群岛\", \"value\": 55}, {\"label\": \"哥斯达黎加\", \"value\": 56}, {\"label\": \"科特迪瓦\", \"value\": 57}, {\"label\": \"克罗地亚\", \"value\": 58}, {\"label\": \"古巴\", \"value\": 59}, {\"label\": \"塞浦路斯\", \"value\": 60}, {\"label\": \"捷克\", \"value\": 61}, {\"label\": \"丹麦\", \"value\": 62}, {\"label\": \"吉布提\", \"value\": 63}, {\"label\": \"多米尼克\", \"value\": 64}, {\"label\": \"多米尼加\", \"value\": 65}, {\"label\": \"厄瓜多尔\", \"value\": 66}, {\"label\": \"埃及\", \"value\": 67}, {\"label\": \"萨尔瓦多\", \"value\": 68}, {\"label\": \"赤道几内亚\", \"value\": 69}, {\"label\": \"厄立特里亚\", \"value\": 70}, {\"label\": \"爱沙尼亚\", \"value\": 71}, {\"label\": \"埃塞俄比亚\", \"value\": 72}, {\"label\": \"福克兰群岛（马尔维纳斯）\", \"value\": 73}, {\"label\": \"法罗群岛\", \"value\": 74}, {\"label\": \"斐济\", \"value\": 75}, {\"label\": \"芬兰\", \"value\": 76}, {\"label\": \"法国\", \"value\": 77}, {\"label\": \"法属圭亚那\", \"value\": 78}, {\"label\": \"法属波利尼西亚\", \"value\": 79}, {\"label\": \"法属南部领地\", \"value\": 80}, {\"label\": \"加蓬\", \"value\": 81}, {\"label\": \"冈比亚\", \"value\": 82}, {\"label\": \"格鲁吉亚\", \"value\": 83}, {\"label\": \"德国\", \"value\": 84}, {\"label\": \"加纳\", \"value\": 85}, {\"label\": \"直布罗陀\", \"value\": 86}, {\"label\": \"希腊\", \"value\": 87}, {\"label\": \"格陵兰\", \"value\": 88}, {\"label\": \"格林纳达\", \"value\": 89}, {\"label\": \"瓜德罗普\", \"value\": 90}, {\"label\": \"关岛\", \"value\": 91}, {\"label\": \"危地马拉\", \"value\": 92}, {\"label\": \"格恩西岛\", \"value\": 93}, {\"label\": \"几内亚\", \"value\": 94}, {\"label\": \"几内亚比绍\", \"value\": 95}, {\"label\": \"圭亚那\", \"value\": 96}, {\"label\": \"海地\", \"value\": 97}, {\"label\": \"赫德岛和麦克唐纳岛\", \"value\": 98}, {\"label\": \"梵蒂冈\", \"value\": 99}, {\"label\": \"洪都拉斯\", \"value\": 100}, {\"label\": \"匈牙利\", \"value\": 101}, {\"label\": \"冰岛\", \"value\": 102}, {\"label\": \"印度\", \"value\": 103}, {\"label\": \"印度尼西亚\", \"value\": 104}, {\"label\": \"伊朗\", \"value\": 105}, {\"label\": \"伊拉克\", \"value\": 106}, {\"label\": \"爱尔兰\", \"value\": 107}, {\"label\": \"英国属地曼岛\", \"value\": 108}, {\"label\": \"以色列\", \"value\": 109}, {\"label\": \"意大利\", \"value\": 110}, {\"label\": \"牙买加\", \"value\": 111}, {\"label\": \"日本\", \"value\": 112}, {\"label\": \"泽西岛\", \"value\": 113}, {\"label\": \"约旦\", \"value\": 114}, {\"label\": \"哈萨克斯坦\", \"value\": 115}, {\"label\": \"肯尼亚\", \"value\": 116}, {\"label\": \"基里巴斯\", \"value\": 117}, {\"label\": \"朝鲜\", \"value\": 118}, {\"label\": \"韩国\", \"value\": 119}, {\"label\": \"科威特\", \"value\": 120}, {\"label\": \"吉尔吉斯斯坦\", \"value\": 121}, {\"label\": \"老挝\", \"value\": 122}, {\"label\": \"拉脱维亚\", \"value\": 123}, {\"label\": \"黎巴嫩\", \"value\": 124}, {\"label\": \"莱索托\", \"value\": 125}, {\"label\": \"利比里亚\", \"value\": 126}, {\"label\": \"利比亚\", \"value\": 127}, {\"label\": \"列支敦士登\", \"value\": 128}, {\"label\": \"立陶宛\", \"value\": 129}, {\"label\": \"卢森堡\", \"value\": 130}, {\"label\": \"前南马其顿\", \"value\": 131}, {\"label\": \"马达加斯加\", \"value\": 132}, {\"label\": \"马拉维\", \"value\": 133}, {\"label\": \"马来西亚\", \"value\": 134}, {\"label\": \"马尔代夫\", \"value\": 135}, {\"label\": \"马里\", \"value\": 136}, {\"label\": \"马耳他\", \"value\": 137}, {\"label\": \"马绍尔群岛\", \"value\": 138}, {\"label\": \"马提尼克\", \"value\": 139}, {\"label\": \"毛利塔尼亚\", \"value\": 140}, {\"label\": \"毛里求斯\", \"value\": 141}, {\"label\": \"马约特\", \"value\": 142}, {\"label\": \"墨西哥\", \"value\": 143}, {\"label\": \"密克罗尼西亚联邦\", \"value\": 144}, {\"label\": \"摩尔多瓦\", \"value\": 145}, {\"label\": \"摩纳哥\", \"value\": 146}, {\"label\": \"蒙古\", \"value\": 147}, {\"label\": \"黑山\", \"value\": 148}, {\"label\": \"蒙特塞拉特\", \"value\": 149}, {\"label\": \"摩洛哥\", \"value\": 150}, {\"label\": \"莫桑比克\", \"value\": 151}, {\"label\": \"缅甸\", \"value\": 152}, {\"label\": \"纳米比亚\", \"value\": 153}, {\"label\": \"瑙鲁\", \"value\": 154}, {\"label\": \"尼泊尔\", \"value\": 155}, {\"label\": \"荷兰\", \"value\": 156}, {\"label\": \"荷属安的列斯\", \"value\": 157}, {\"label\": \"新喀里多尼亚\", \"value\": 158}, {\"label\": \"新西兰\", \"value\": 159}, {\"label\": \"尼加拉瓜\", \"value\": 160}, {\"label\": \"尼日尔\", \"value\": 161}, {\"label\": \"尼日利亚\", \"value\": 162}, {\"label\": \"纽埃\", \"value\": 163}, {\"label\": \"诺福克岛\", \"value\": 164}, {\"label\": \"北马里亚纳\", \"value\": 165}, {\"label\": \"挪威\", \"value\": 166}, {\"label\": \"阿曼\", \"value\": 167}, {\"label\": \"巴基斯坦\", \"value\": 168}, {\"label\": \"帕劳\", \"value\": 169}, {\"label\": \"巴勒斯坦\", \"value\": 170}, {\"label\": \"巴拿马\", \"value\": 171}, {\"label\": \"巴布亚新几内亚\", \"value\": 172}, {\"label\": \"巴拉圭\", \"value\": 173}, {\"label\": \"秘鲁\", \"value\": 174}, {\"label\": \"菲律宾\", \"value\": 175}, {\"label\": \"皮特凯恩\", \"value\": 176}, {\"label\": \"波兰\", \"value\": 177}, {\"label\": \"葡萄牙\", \"value\": 178}, {\"label\": \"波多黎各\", \"value\": 179}, {\"label\": \"卡塔尔\", \"value\": 180}, {\"label\": \"留尼汪\", \"value\": 181}, {\"label\": \"罗马尼亚\", \"value\": 182}, {\"label\": \"俄罗斯联邦\", \"value\": 183}, {\"label\": \"卢旺达\", \"value\": 184}, {\"label\": \"圣赫勒拿\", \"value\": 185}, {\"label\": \"圣基茨和尼维斯\", \"value\": 186}, {\"label\": \"圣卢西亚\", \"value\": 187}, {\"label\": \"圣皮埃尔和密克隆\", \"value\": 188}, {\"label\": \"圣文森特和格林纳丁斯\", \"value\": 189}, {\"label\": \"萨摩亚\", \"value\": 190}, {\"label\": \"圣马力诺\", \"value\": 191}, {\"label\": \"圣多美和普林西比\", \"value\": 192}, {\"label\": \"沙特阿拉伯\", \"value\": 193}, {\"label\": \"塞内加尔\", \"value\": 194}, {\"label\": \"塞尔维亚\", \"value\": 195}, {\"label\": \"塞舌尔\", \"value\": 196}, {\"label\": \"塞拉利昂\", \"value\": 197}, {\"label\": \"新加坡\", \"value\": 198}, {\"label\": \"斯洛伐克\", \"value\": 199}, {\"label\": \"斯洛文尼亚\", \"value\": 200}, {\"label\": \"所罗门群岛\", \"value\": 201}, {\"label\": \"索马里\", \"value\": 202}, {\"label\": \"南非\", \"value\": 203}, {\"label\": \"南乔治亚岛和南桑德韦奇岛\", \"value\": 204}, {\"label\": \"西班牙\", \"value\": 205}, {\"label\": \"斯里兰卡\", \"value\": 206}, {\"label\": \"苏丹\", \"value\": 207}, {\"label\": \"苏里南\", \"value\": 208}, {\"label\": \"斯瓦尔巴岛和扬马延岛\", \"value\": 209}, {\"label\": \"斯威士兰\", \"value\": 210}, {\"label\": \"瑞典\", \"value\": 211}, {\"label\": \"瑞士\", \"value\": 212}, {\"label\": \"叙利亚\", \"value\": 213}, {\"label\": \"塔吉克斯坦\", \"value\": 214}, {\"label\": \"坦桑尼亚\", \"value\": 215}, {\"label\": \"泰国\", \"value\": 216}, {\"label\": \"东帝汶\", \"value\": 217}, {\"label\": \"多哥\", \"value\": 218}, {\"label\": \"托克劳\", \"value\": 219}, {\"label\": \"汤加\", \"value\": 220}, {\"label\": \"特立尼达和多巴哥\", \"value\": 221}, {\"label\": \"突尼斯\", \"value\": 222}, {\"label\": \"土耳其\", \"value\": 223}, {\"label\": \"土库曼斯坦\", \"value\": 224}, {\"label\": \"特克斯和凯科斯群岛\", \"value\": 225}, {\"label\": \"图瓦卢\", \"value\": 226}, {\"label\": \"乌干达\", \"value\": 227}, {\"label\": \"乌克兰\", \"value\": 228}, {\"label\": \"阿联酋\", \"value\": 229}, {\"label\": \"英国\", \"value\": 230}, {\"label\": \"美国\", \"value\": 231}, {\"label\": \"美国本土外小岛屿\", \"value\": 232}, {\"label\": \"乌拉圭\", \"value\": 233}, {\"label\": \"乌兹别克斯坦\", \"value\": 234}, {\"label\": \"瓦努阿图\", \"value\": 235}, {\"label\": \"委内瑞拉\", \"value\": 236}, {\"label\": \"越南\", \"value\": 237}, {\"label\": \"英属维尔京群岛\", \"value\": 238}, {\"label\": \"美属维尔京群岛\", \"value\": 239}, {\"label\": \"瓦利斯和富图纳\", \"value\": 240}, {\"label\": \"西撒哈拉\", \"value\": 241}, {\"label\": \"也门\", \"value\": 242}, {\"label\": \"赞比亚\", \"value\": 243}, {\"label\": \"津巴布韦\", \"value\": 244}]}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (434, 'e13d66dcd329435ca7b539e4f1a4183b', '105', 'DATE', '您所在的地区是：\n', 1, NULL, 1, NULL, 1310720, 24, '{}', NULL,
        '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (435, '2bb3c0d0fd86488bb146a1fc6b9f5dc1', '101', 'RADIO', '您目前所在地是：\n', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"武汉\\n\", \"value\": 1}, {\"label\": \"湖北地区\\n\", \"value\": 2}, {\"label\": \"其它地区\\n\", \"value\": 3}, {\"label\": \"境外（港澳台和其他外国国家和地区）\\n\", \"value\": 0}]}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (436, '2bb3c0d0fd86488bb146a1fc6b9f5dc1', '102', 'SELECT', '您在湖北哪个城市？\n', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"黄石市\", \"value\": 1}, {\"label\": \"十堰市\", \"value\": 2}, {\"label\": \"宜昌市\", \"value\": 3}, {\"label\": \"襄阳市\", \"value\": 4}, {\"label\": \"鄂州市\", \"value\": 5}, {\"label\": \"荆门市\", \"value\": 6}, {\"label\": \"孝感市\", \"value\": 7}, {\"label\": \"荆州市\", \"value\": 8}, {\"label\": \"黄冈市\", \"value\": 9}, {\"label\": \"咸宁市\", \"value\": 10}, {\"label\": \"随州市\", \"value\": 11}, {\"label\": \"恩施土家族苗族自治州\", \"value\": 12}, {\"label\": \"仙桃市\", \"value\": 13}, {\"label\": \"天门市\", \"value\": 14}, {\"label\": \"潜江市\", \"value\": 15}, {\"label\": \"神农架林区\", \"value\": 16}]}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (437, '2bb3c0d0fd86488bb146a1fc6b9f5dc1', '103', 'DATE', '您所在的其他地区是？\n', 1, NULL, 1, NULL, 196608, 24, '{}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (438, '2bb3c0d0fd86488bb146a1fc6b9f5dc1', '104', 'SELECT', '您目前所在的国家或地区是？\n', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"中国\", \"value\": 1}, {\"label\": \"香港（中国）\", \"value\": 2}, {\"label\": \"澳门（中国）\", \"value\": 3}, {\"label\": \"台湾（中国）\", \"value\": 4}, {\"label\": \"阿富汗\", \"value\": 5}, {\"label\": \"奥兰群岛\", \"value\": 6}, {\"label\": \"阿尔巴尼亚\", \"value\": 7}, {\"label\": \"阿尔及利亚\", \"value\": 8}, {\"label\": \"美属萨摩亚\", \"value\": 9}, {\"label\": \"安道尔\", \"value\": 10}, {\"label\": \"安哥拉\", \"value\": 11}, {\"label\": \"安圭拉\", \"value\": 12}, {\"label\": \"南极洲\", \"value\": 13}, {\"label\": \"安提瓜和巴布达\", \"value\": 14}, {\"label\": \"阿根廷\", \"value\": 15}, {\"label\": \"亚美尼亚\", \"value\": 16}, {\"label\": \"阿鲁巴\", \"value\": 17}, {\"label\": \"澳大利亚\", \"value\": 18}, {\"label\": \"奥地利\", \"value\": 19}, {\"label\": \"阿塞拜疆\", \"value\": 20}, {\"label\": \"巴哈马\", \"value\": 21}, {\"label\": \"巴林\", \"value\": 22}, {\"label\": \"孟加拉国\", \"value\": 23}, {\"label\": \"巴巴多斯\", \"value\": 24}, {\"label\": \"白俄罗斯\", \"value\": 25}, {\"label\": \"比利时\", \"value\": 26}, {\"label\": \"伯利兹\", \"value\": 27}, {\"label\": \"贝宁\", \"value\": 28}, {\"label\": \"百慕大\", \"value\": 29}, {\"label\": \"不丹\", \"value\": 30}, {\"label\": \"玻利维亚\", \"value\": 31}, {\"label\": \"波黑\", \"value\": 32}, {\"label\": \"博茨瓦纳\", \"value\": 33}, {\"label\": \"布维岛\", \"value\": 34}, {\"label\": \"巴西\", \"value\": 35}, {\"label\": \"英属印度洋领地\", \"value\": 36}, {\"label\": \"文莱\", \"value\": 37}, {\"label\": \"保加利亚\", \"value\": 38}, {\"label\": \"布基纳法索\", \"value\": 39}, {\"label\": \"布隆迪\", \"value\": 40}, {\"label\": \"柬埔寨\", \"value\": 41}, {\"label\": \"喀麦隆\", \"value\": 42}, {\"label\": \"加拿大\", \"value\": 43}, {\"label\": \"佛得角\", \"value\": 44}, {\"label\": \"开曼群岛\", \"value\": 45}, {\"label\": \"中非\", \"value\": 46}, {\"label\": \"乍得\", \"value\": 47}, {\"label\": \"智利\", \"value\": 48}, {\"label\": \"圣诞岛\", \"value\": 49}, {\"label\": \"科科斯（基林）群岛\", \"value\": 50}, {\"label\": \"哥伦比亚\", \"value\": 51}, {\"label\": \"科摩罗\", \"value\": 52}, {\"label\": \"刚果（布）\", \"value\": 53}, {\"label\": \"刚果（金）\", \"value\": 54}, {\"label\": \"库克群岛\", \"value\": 55}, {\"label\": \"哥斯达黎加\", \"value\": 56}, {\"label\": \"科特迪瓦\", \"value\": 57}, {\"label\": \"克罗地亚\", \"value\": 58}, {\"label\": \"古巴\", \"value\": 59}, {\"label\": \"塞浦路斯\", \"value\": 60}, {\"label\": \"捷克\", \"value\": 61}, {\"label\": \"丹麦\", \"value\": 62}, {\"label\": \"吉布提\", \"value\": 63}, {\"label\": \"多米尼克\", \"value\": 64}, {\"label\": \"多米尼加\", \"value\": 65}, {\"label\": \"厄瓜多尔\", \"value\": 66}, {\"label\": \"埃及\", \"value\": 67}, {\"label\": \"萨尔瓦多\", \"value\": 68}, {\"label\": \"赤道几内亚\", \"value\": 69}, {\"label\": \"厄立特里亚\", \"value\": 70}, {\"label\": \"爱沙尼亚\", \"value\": 71}, {\"label\": \"埃塞俄比亚\", \"value\": 72}, {\"label\": \"福克兰群岛（马尔维纳斯）\", \"value\": 73}, {\"label\": \"法罗群岛\", \"value\": 74}, {\"label\": \"斐济\", \"value\": 75}, {\"label\": \"芬兰\", \"value\": 76}, {\"label\": \"法国\", \"value\": 77}, {\"label\": \"法属圭亚那\", \"value\": 78}, {\"label\": \"法属波利尼西亚\", \"value\": 79}, {\"label\": \"法属南部领地\", \"value\": 80}, {\"label\": \"加蓬\", \"value\": 81}, {\"label\": \"冈比亚\", \"value\": 82}, {\"label\": \"格鲁吉亚\", \"value\": 83}, {\"label\": \"德国\", \"value\": 84}, {\"label\": \"加纳\", \"value\": 85}, {\"label\": \"直布罗陀\", \"value\": 86}, {\"label\": \"希腊\", \"value\": 87}, {\"label\": \"格陵兰\", \"value\": 88}, {\"label\": \"格林纳达\", \"value\": 89}, {\"label\": \"瓜德罗普\", \"value\": 90}, {\"label\": \"关岛\", \"value\": 91}, {\"label\": \"危地马拉\", \"value\": 92}, {\"label\": \"格恩西岛\", \"value\": 93}, {\"label\": \"几内亚\", \"value\": 94}, {\"label\": \"几内亚比绍\", \"value\": 95}, {\"label\": \"圭亚那\", \"value\": 96}, {\"label\": \"海地\", \"value\": 97}, {\"label\": \"赫德岛和麦克唐纳岛\", \"value\": 98}, {\"label\": \"梵蒂冈\", \"value\": 99}, {\"label\": \"洪都拉斯\", \"value\": 100}, {\"label\": \"匈牙利\", \"value\": 101}, {\"label\": \"冰岛\", \"value\": 102}, {\"label\": \"印度\", \"value\": 103}, {\"label\": \"印度尼西亚\", \"value\": 104}, {\"label\": \"伊朗\", \"value\": 105}, {\"label\": \"伊拉克\", \"value\": 106}, {\"label\": \"爱尔兰\", \"value\": 107}, {\"label\": \"英国属地曼岛\", \"value\": 108}, {\"label\": \"以色列\", \"value\": 109}, {\"label\": \"意大利\", \"value\": 110}, {\"label\": \"牙买加\", \"value\": 111}, {\"label\": \"日本\", \"value\": 112}, {\"label\": \"泽西岛\", \"value\": 113}, {\"label\": \"约旦\", \"value\": 114}, {\"label\": \"哈萨克斯坦\", \"value\": 115}, {\"label\": \"肯尼亚\", \"value\": 116}, {\"label\": \"基里巴斯\", \"value\": 117}, {\"label\": \"朝鲜\", \"value\": 118}, {\"label\": \"韩国\", \"value\": 119}, {\"label\": \"科威特\", \"value\": 120}, {\"label\": \"吉尔吉斯斯坦\", \"value\": 121}, {\"label\": \"老挝\", \"value\": 122}, {\"label\": \"拉脱维亚\", \"value\": 123}, {\"label\": \"黎巴嫩\", \"value\": 124}, {\"label\": \"莱索托\", \"value\": 125}, {\"label\": \"利比里亚\", \"value\": 126}, {\"label\": \"利比亚\", \"value\": 127}, {\"label\": \"列支敦士登\", \"value\": 128}, {\"label\": \"立陶宛\", \"value\": 129}, {\"label\": \"卢森堡\", \"value\": 130}, {\"label\": \"前南马其顿\", \"value\": 131}, {\"label\": \"马达加斯加\", \"value\": 132}, {\"label\": \"马拉维\", \"value\": 133}, {\"label\": \"马来西亚\", \"value\": 134}, {\"label\": \"马尔代夫\", \"value\": 135}, {\"label\": \"马里\", \"value\": 136}, {\"label\": \"马耳他\", \"value\": 137}, {\"label\": \"马绍尔群岛\", \"value\": 138}, {\"label\": \"马提尼克\", \"value\": 139}, {\"label\": \"毛利塔尼亚\", \"value\": 140}, {\"label\": \"毛里求斯\", \"value\": 141}, {\"label\": \"马约特\", \"value\": 142}, {\"label\": \"墨西哥\", \"value\": 143}, {\"label\": \"密克罗尼西亚联邦\", \"value\": 144}, {\"label\": \"摩尔多瓦\", \"value\": 145}, {\"label\": \"摩纳哥\", \"value\": 146}, {\"label\": \"蒙古\", \"value\": 147}, {\"label\": \"黑山\", \"value\": 148}, {\"label\": \"蒙特塞拉特\", \"value\": 149}, {\"label\": \"摩洛哥\", \"value\": 150}, {\"label\": \"莫桑比克\", \"value\": 151}, {\"label\": \"缅甸\", \"value\": 152}, {\"label\": \"纳米比亚\", \"value\": 153}, {\"label\": \"瑙鲁\", \"value\": 154}, {\"label\": \"尼泊尔\", \"value\": 155}, {\"label\": \"荷兰\", \"value\": 156}, {\"label\": \"荷属安的列斯\", \"value\": 157}, {\"label\": \"新喀里多尼亚\", \"value\": 158}, {\"label\": \"新西兰\", \"value\": 159}, {\"label\": \"尼加拉瓜\", \"value\": 160}, {\"label\": \"尼日尔\", \"value\": 161}, {\"label\": \"尼日利亚\", \"value\": 162}, {\"label\": \"纽埃\", \"value\": 163}, {\"label\": \"诺福克岛\", \"value\": 164}, {\"label\": \"北马里亚纳\", \"value\": 165}, {\"label\": \"挪威\", \"value\": 166}, {\"label\": \"阿曼\", \"value\": 167}, {\"label\": \"巴基斯坦\", \"value\": 168}, {\"label\": \"帕劳\", \"value\": 169}, {\"label\": \"巴勒斯坦\", \"value\": 170}, {\"label\": \"巴拿马\", \"value\": 171}, {\"label\": \"巴布亚新几内亚\", \"value\": 172}, {\"label\": \"巴拉圭\", \"value\": 173}, {\"label\": \"秘鲁\", \"value\": 174}, {\"label\": \"菲律宾\", \"value\": 175}, {\"label\": \"皮特凯恩\", \"value\": 176}, {\"label\": \"波兰\", \"value\": 177}, {\"label\": \"葡萄牙\", \"value\": 178}, {\"label\": \"波多黎各\", \"value\": 179}, {\"label\": \"卡塔尔\", \"value\": 180}, {\"label\": \"留尼汪\", \"value\": 181}, {\"label\": \"罗马尼亚\", \"value\": 182}, {\"label\": \"俄罗斯联邦\", \"value\": 183}, {\"label\": \"卢旺达\", \"value\": 184}, {\"label\": \"圣赫勒拿\", \"value\": 185}, {\"label\": \"圣基茨和尼维斯\", \"value\": 186}, {\"label\": \"圣卢西亚\", \"value\": 187}, {\"label\": \"圣皮埃尔和密克隆\", \"value\": 188}, {\"label\": \"圣文森特和格林纳丁斯\", \"value\": 189}, {\"label\": \"萨摩亚\", \"value\": 190}, {\"label\": \"圣马力诺\", \"value\": 191}, {\"label\": \"圣多美和普林西比\", \"value\": 192}, {\"label\": \"沙特阿拉伯\", \"value\": 193}, {\"label\": \"塞内加尔\", \"value\": 194}, {\"label\": \"塞尔维亚\", \"value\": 195}, {\"label\": \"塞舌尔\", \"value\": 196}, {\"label\": \"塞拉利昂\", \"value\": 197}, {\"label\": \"新加坡\", \"value\": 198}, {\"label\": \"斯洛伐克\", \"value\": 199}, {\"label\": \"斯洛文尼亚\", \"value\": 200}, {\"label\": \"所罗门群岛\", \"value\": 201}, {\"label\": \"索马里\", \"value\": 202}, {\"label\": \"南非\", \"value\": 203}, {\"label\": \"南乔治亚岛和南桑德韦奇岛\", \"value\": 204}, {\"label\": \"西班牙\", \"value\": 205}, {\"label\": \"斯里兰卡\", \"value\": 206}, {\"label\": \"苏丹\", \"value\": 207}, {\"label\": \"苏里南\", \"value\": 208}, {\"label\": \"斯瓦尔巴岛和扬马延岛\", \"value\": 209}, {\"label\": \"斯威士兰\", \"value\": 210}, {\"label\": \"瑞典\", \"value\": 211}, {\"label\": \"瑞士\", \"value\": 212}, {\"label\": \"叙利亚\", \"value\": 213}, {\"label\": \"塔吉克斯坦\", \"value\": 214}, {\"label\": \"坦桑尼亚\", \"value\": 215}, {\"label\": \"泰国\", \"value\": 216}, {\"label\": \"东帝汶\", \"value\": 217}, {\"label\": \"多哥\", \"value\": 218}, {\"label\": \"托克劳\", \"value\": 219}, {\"label\": \"汤加\", \"value\": 220}, {\"label\": \"特立尼达和多巴哥\", \"value\": 221}, {\"label\": \"突尼斯\", \"value\": 222}, {\"label\": \"土耳其\", \"value\": 223}, {\"label\": \"土库曼斯坦\", \"value\": 224}, {\"label\": \"特克斯和凯科斯群岛\", \"value\": 225}, {\"label\": \"图瓦卢\", \"value\": 226}, {\"label\": \"乌干达\", \"value\": 227}, {\"label\": \"乌克兰\", \"value\": 228}, {\"label\": \"阿联酋\", \"value\": 229}, {\"label\": \"英国\", \"value\": 230}, {\"label\": \"美国\", \"value\": 231}, {\"label\": \"美国本土外小岛屿\", \"value\": 232}, {\"label\": \"乌拉圭\", \"value\": 233}, {\"label\": \"乌兹别克斯坦\", \"value\": 234}, {\"label\": \"瓦努阿图\", \"value\": 235}, {\"label\": \"委内瑞拉\", \"value\": 236}, {\"label\": \"越南\", \"value\": 237}, {\"label\": \"英属维尔京群岛\", \"value\": 238}, {\"label\": \"美属维尔京群岛\", \"value\": 239}, {\"label\": \"瓦利斯和富图纳\", \"value\": 240}, {\"label\": \"西撒哈拉\", \"value\": 241}, {\"label\": \"也门\", \"value\": 242}, {\"label\": \"赞比亚\", \"value\": 243}, {\"label\": \"津巴布韦\", \"value\": 244}]}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (439, '2bb3c0d0fd86488bb146a1fc6b9f5dc1', '105', 'INPUT', '您当前的具体住址是？\n', 1, NULL, 1, NULL, 327680, 24, '{}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (440, '2bb3c0d0fd86488bb146a1fc6b9f5dc1', '106', 'RADIO', '您当前的身体状况是:\n', 1, NULL, 1, NULL, 393216, 24, '{
  \"options\": [{\"label\": \"正常，没有症状\\n\", \"value\": 1}, {\"label\": \"身体有异常（咳嗽、发热、胸闷等）\\n\", \"value\": 2}, {\"label\": \"新型肺炎疑似病例\\n\", \"value\": 3}, {\"label\": \"新型肺炎确诊病例\\n\", \"value\": 4}, {\"label\": \"疑似病例已排除\\n\", \"value\": 5}, {\"label\": \"确诊病例已治愈\\n\", \"value\": 6}, {\"label\": \"其他&lt;span class=&quot;mod_fillblank&quot; data-id=&quot;fillblank-NfVY&quot;&gt;____&lt;/span&gt;\\n\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (441, '2bb3c0d0fd86488bb146a1fc6b9f5dc1', '107', 'RADIO', '您当前是否进行医学观察：\n', 1, NULL, 1, NULL, 458752, 24, '{
  \"options\": [{\"label\": \"自行隔离\\n\", \"value\": 1}, {\"label\": \"集中隔离\\n\", \"value\": 2}, {\"label\": \"没有隔离\\n\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (442, '2bb3c0d0fd86488bb146a1fc6b9f5dc1', '108', 'RADIO', '您是否已经及时就诊？\n', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"是\\n\", \"value\": 1}, {\"label\": \"否\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (443, '2bb3c0d0fd86488bb146a1fc6b9f5dc1', '109', 'INPUT', '您当前就诊的医院是：\n', 1, NULL, 1, NULL, 589824, 24, '{}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (444, '2bb3c0d0fd86488bb146a1fc6b9f5dc1', '111', 'INPUT', '您当前的体温是：\n', 1, NULL, 1, NULL, 655360, 24, '{}', NULL,
        '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (445, '2bb3c0d0fd86488bb146a1fc6b9f5dc1', '100', 'RADIO', '您是否接触过疑似或确诊新型冠状病毒感染的肺炎患者？\n', 1, NULL, 1, NULL,
        720896, 24, '{
    \"options\": [{\"label\": \"是\\n\", \"value\": 1}, {\"label\": \"否\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (446, '2bb3c0d0fd86488bb146a1fc6b9f5dc1', '101', 'RADIO', '以下描述中，您符合的场景有：\n', 1, NULL, 1, NULL, 786432, 24, '{
  \"options\": [{\"label\": \"近14天内都在省内\\n\", \"value\": 1}, {\"label\": \"近14天内从疫情高风险地区返回当前所在地\\n\", \"value\": 2}, {\"label\": \"近14天内接触\\\\接待过从疫情高风险地区返回的人员\\n\", \"value\": 3}, {\"label\": \"近14天内有接触过从境外回国的人员\\n\", \"value\": 4}, {\"label\": \"以上都不符合\\n\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (447, '2bb3c0d0fd86488bb146a1fc6b9f5dc1', '102', 'DATE', '您接触/接待疫情高风险地区地区人员的时间是？\n', 1, NULL, 1, NULL, 851968,
        24, '{}', NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (448, '2bb3c0d0fd86488bb146a1fc6b9f5dc1', '103', 'DATE', '您从疫情高风险地区地区返回的时间是？\n', 1, NULL, 1, NULL, 917504, 24,
        '{}', NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (449, '2bb3c0d0fd86488bb146a1fc6b9f5dc1', '104', 'RADIO', '您返回时乘坐交通工具主要是？\n', 1, NULL, 1, NULL, 983040, 24, '{
  \"options\": [{\"label\": \"火车\\n\", \"value\": 1}, {\"label\": \"飞机\\n\", \"value\": 2}, {\"label\": \"轮船\\n\", \"value\": 3}, {\"label\": \"长途公共巴士\\n\", \"value\": 4}, {\"label\": \"自驾\\n\", \"value\": 5}, {\"label\": \"其他&lt;span class=&quot;mod_fillblank&quot; data-id=&quot;fillblank-jXWa&quot;&gt;____&lt;/span&gt;\\n\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (450, '2bb3c0d0fd86488bb146a1fc6b9f5dc1', '105', 'INPUT', '您乘坐的交通工具的航班号/车次/车牌号是？\n', 1, NULL, 0, NULL, 1048576,
        24, '{}', NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (451, '2bb3c0d0fd86488bb146a1fc6b9f5dc1', '106', 'SELECT', '您或您家里接触/接待从哪个国家返回的人员？\n', 1, NULL, 1, NULL, 1114112,
        24, '{
    \"options\": [{\"label\": \"中国\", \"value\": 1}, {\"label\": \"香港（中国）\", \"value\": 2}, {\"label\": \"澳门（中国）\", \"value\": 3}, {\"label\": \"台湾（中国）\", \"value\": 4}, {\"label\": \"阿富汗\", \"value\": 5}, {\"label\": \"奥兰群岛\", \"value\": 6}, {\"label\": \"阿尔巴尼亚\", \"value\": 7}, {\"label\": \"阿尔及利亚\", \"value\": 8}, {\"label\": \"美属萨摩亚\", \"value\": 9}, {\"label\": \"安道尔\", \"value\": 10}, {\"label\": \"安哥拉\", \"value\": 11}, {\"label\": \"安圭拉\", \"value\": 12}, {\"label\": \"南极洲\", \"value\": 13}, {\"label\": \"安提瓜和巴布达\", \"value\": 14}, {\"label\": \"阿根廷\", \"value\": 15}, {\"label\": \"亚美尼亚\", \"value\": 16}, {\"label\": \"阿鲁巴\", \"value\": 17}, {\"label\": \"澳大利亚\", \"value\": 18}, {\"label\": \"奥地利\", \"value\": 19}, {\"label\": \"阿塞拜疆\", \"value\": 20}, {\"label\": \"巴哈马\", \"value\": 21}, {\"label\": \"巴林\", \"value\": 22}, {\"label\": \"孟加拉国\", \"value\": 23}, {\"label\": \"巴巴多斯\", \"value\": 24}, {\"label\": \"白俄罗斯\", \"value\": 25}, {\"label\": \"比利时\", \"value\": 26}, {\"label\": \"伯利兹\", \"value\": 27}, {\"label\": \"贝宁\", \"value\": 28}, {\"label\": \"百慕大\", \"value\": 29}, {\"label\": \"不丹\", \"value\": 30}, {\"label\": \"玻利维亚\", \"value\": 31}, {\"label\": \"波黑\", \"value\": 32}, {\"label\": \"博茨瓦纳\", \"value\": 33}, {\"label\": \"布维岛\", \"value\": 34}, {\"label\": \"巴西\", \"value\": 35}, {\"label\": \"英属印度洋领地\", \"value\": 36}, {\"label\": \"文莱\", \"value\": 37}, {\"label\": \"保加利亚\", \"value\": 38}, {\"label\": \"布基纳法索\", \"value\": 39}, {\"label\": \"布隆迪\", \"value\": 40}, {\"label\": \"柬埔寨\", \"value\": 41}, {\"label\": \"喀麦隆\", \"value\": 42}, {\"label\": \"加拿大\", \"value\": 43}, {\"label\": \"佛得角\", \"value\": 44}, {\"label\": \"开曼群岛\", \"value\": 45}, {\"label\": \"中非\", \"value\": 46}, {\"label\": \"乍得\", \"value\": 47}, {\"label\": \"智利\", \"value\": 48}, {\"label\": \"圣诞岛\", \"value\": 49}, {\"label\": \"科科斯（基林）群岛\", \"value\": 50}, {\"label\": \"哥伦比亚\", \"value\": 51}, {\"label\": \"科摩罗\", \"value\": 52}, {\"label\": \"刚果（布）\", \"value\": 53}, {\"label\": \"刚果（金）\", \"value\": 54}, {\"label\": \"库克群岛\", \"value\": 55}, {\"label\": \"哥斯达黎加\", \"value\": 56}, {\"label\": \"科特迪瓦\", \"value\": 57}, {\"label\": \"克罗地亚\", \"value\": 58}, {\"label\": \"古巴\", \"value\": 59}, {\"label\": \"塞浦路斯\", \"value\": 60}, {\"label\": \"捷克\", \"value\": 61}, {\"label\": \"丹麦\", \"value\": 62}, {\"label\": \"吉布提\", \"value\": 63}, {\"label\": \"多米尼克\", \"value\": 64}, {\"label\": \"多米尼加\", \"value\": 65}, {\"label\": \"厄瓜多尔\", \"value\": 66}, {\"label\": \"埃及\", \"value\": 67}, {\"label\": \"萨尔瓦多\", \"value\": 68}, {\"label\": \"赤道几内亚\", \"value\": 69}, {\"label\": \"厄立特里亚\", \"value\": 70}, {\"label\": \"爱沙尼亚\", \"value\": 71}, {\"label\": \"埃塞俄比亚\", \"value\": 72}, {\"label\": \"福克兰群岛（马尔维纳斯）\", \"value\": 73}, {\"label\": \"法罗群岛\", \"value\": 74}, {\"label\": \"斐济\", \"value\": 75}, {\"label\": \"芬兰\", \"value\": 76}, {\"label\": \"法国\", \"value\": 77}, {\"label\": \"法属圭亚那\", \"value\": 78}, {\"label\": \"法属波利尼西亚\", \"value\": 79}, {\"label\": \"法属南部领地\", \"value\": 80}, {\"label\": \"加蓬\", \"value\": 81}, {\"label\": \"冈比亚\", \"value\": 82}, {\"label\": \"格鲁吉亚\", \"value\": 83}, {\"label\": \"德国\", \"value\": 84}, {\"label\": \"加纳\", \"value\": 85}, {\"label\": \"直布罗陀\", \"value\": 86}, {\"label\": \"希腊\", \"value\": 87}, {\"label\": \"格陵兰\", \"value\": 88}, {\"label\": \"格林纳达\", \"value\": 89}, {\"label\": \"瓜德罗普\", \"value\": 90}, {\"label\": \"关岛\", \"value\": 91}, {\"label\": \"危地马拉\", \"value\": 92}, {\"label\": \"格恩西岛\", \"value\": 93}, {\"label\": \"几内亚\", \"value\": 94}, {\"label\": \"几内亚比绍\", \"value\": 95}, {\"label\": \"圭亚那\", \"value\": 96}, {\"label\": \"海地\", \"value\": 97}, {\"label\": \"赫德岛和麦克唐纳岛\", \"value\": 98}, {\"label\": \"梵蒂冈\", \"value\": 99}, {\"label\": \"洪都拉斯\", \"value\": 100}, {\"label\": \"匈牙利\", \"value\": 101}, {\"label\": \"冰岛\", \"value\": 102}, {\"label\": \"印度\", \"value\": 103}, {\"label\": \"印度尼西亚\", \"value\": 104}, {\"label\": \"伊朗\", \"value\": 105}, {\"label\": \"伊拉克\", \"value\": 106}, {\"label\": \"爱尔兰\", \"value\": 107}, {\"label\": \"英国属地曼岛\", \"value\": 108}, {\"label\": \"以色列\", \"value\": 109}, {\"label\": \"意大利\", \"value\": 110}, {\"label\": \"牙买加\", \"value\": 111}, {\"label\": \"日本\", \"value\": 112}, {\"label\": \"泽西岛\", \"value\": 113}, {\"label\": \"约旦\", \"value\": 114}, {\"label\": \"哈萨克斯坦\", \"value\": 115}, {\"label\": \"肯尼亚\", \"value\": 116}, {\"label\": \"基里巴斯\", \"value\": 117}, {\"label\": \"朝鲜\", \"value\": 118}, {\"label\": \"韩国\", \"value\": 119}, {\"label\": \"科威特\", \"value\": 120}, {\"label\": \"吉尔吉斯斯坦\", \"value\": 121}, {\"label\": \"老挝\", \"value\": 122}, {\"label\": \"拉脱维亚\", \"value\": 123}, {\"label\": \"黎巴嫩\", \"value\": 124}, {\"label\": \"莱索托\", \"value\": 125}, {\"label\": \"利比里亚\", \"value\": 126}, {\"label\": \"利比亚\", \"value\": 127}, {\"label\": \"列支敦士登\", \"value\": 128}, {\"label\": \"立陶宛\", \"value\": 129}, {\"label\": \"卢森堡\", \"value\": 130}, {\"label\": \"前南马其顿\", \"value\": 131}, {\"label\": \"马达加斯加\", \"value\": 132}, {\"label\": \"马拉维\", \"value\": 133}, {\"label\": \"马来西亚\", \"value\": 134}, {\"label\": \"马尔代夫\", \"value\": 135}, {\"label\": \"马里\", \"value\": 136}, {\"label\": \"马耳他\", \"value\": 137}, {\"label\": \"马绍尔群岛\", \"value\": 138}, {\"label\": \"马提尼克\", \"value\": 139}, {\"label\": \"毛利塔尼亚\", \"value\": 140}, {\"label\": \"毛里求斯\", \"value\": 141}, {\"label\": \"马约特\", \"value\": 142}, {\"label\": \"墨西哥\", \"value\": 143}, {\"label\": \"密克罗尼西亚联邦\", \"value\": 144}, {\"label\": \"摩尔多瓦\", \"value\": 145}, {\"label\": \"摩纳哥\", \"value\": 146}, {\"label\": \"蒙古\", \"value\": 147}, {\"label\": \"黑山\", \"value\": 148}, {\"label\": \"蒙特塞拉特\", \"value\": 149}, {\"label\": \"摩洛哥\", \"value\": 150}, {\"label\": \"莫桑比克\", \"value\": 151}, {\"label\": \"缅甸\", \"value\": 152}, {\"label\": \"纳米比亚\", \"value\": 153}, {\"label\": \"瑙鲁\", \"value\": 154}, {\"label\": \"尼泊尔\", \"value\": 155}, {\"label\": \"荷兰\", \"value\": 156}, {\"label\": \"荷属安的列斯\", \"value\": 157}, {\"label\": \"新喀里多尼亚\", \"value\": 158}, {\"label\": \"新西兰\", \"value\": 159}, {\"label\": \"尼加拉瓜\", \"value\": 160}, {\"label\": \"尼日尔\", \"value\": 161}, {\"label\": \"尼日利亚\", \"value\": 162}, {\"label\": \"纽埃\", \"value\": 163}, {\"label\": \"诺福克岛\", \"value\": 164}, {\"label\": \"北马里亚纳\", \"value\": 165}, {\"label\": \"挪威\", \"value\": 166}, {\"label\": \"阿曼\", \"value\": 167}, {\"label\": \"巴基斯坦\", \"value\": 168}, {\"label\": \"帕劳\", \"value\": 169}, {\"label\": \"巴勒斯坦\", \"value\": 170}, {\"label\": \"巴拿马\", \"value\": 171}, {\"label\": \"巴布亚新几内亚\", \"value\": 172}, {\"label\": \"巴拉圭\", \"value\": 173}, {\"label\": \"秘鲁\", \"value\": 174}, {\"label\": \"菲律宾\", \"value\": 175}, {\"label\": \"皮特凯恩\", \"value\": 176}, {\"label\": \"波兰\", \"value\": 177}, {\"label\": \"葡萄牙\", \"value\": 178}, {\"label\": \"波多黎各\", \"value\": 179}, {\"label\": \"卡塔尔\", \"value\": 180}, {\"label\": \"留尼汪\", \"value\": 181}, {\"label\": \"罗马尼亚\", \"value\": 182}, {\"label\": \"俄罗斯联邦\", \"value\": 183}, {\"label\": \"卢旺达\", \"value\": 184}, {\"label\": \"圣赫勒拿\", \"value\": 185}, {\"label\": \"圣基茨和尼维斯\", \"value\": 186}, {\"label\": \"圣卢西亚\", \"value\": 187}, {\"label\": \"圣皮埃尔和密克隆\", \"value\": 188}, {\"label\": \"圣文森特和格林纳丁斯\", \"value\": 189}, {\"label\": \"萨摩亚\", \"value\": 190}, {\"label\": \"圣马力诺\", \"value\": 191}, {\"label\": \"圣多美和普林西比\", \"value\": 192}, {\"label\": \"沙特阿拉伯\", \"value\": 193}, {\"label\": \"塞内加尔\", \"value\": 194}, {\"label\": \"塞尔维亚\", \"value\": 195}, {\"label\": \"塞舌尔\", \"value\": 196}, {\"label\": \"塞拉利昂\", \"value\": 197}, {\"label\": \"新加坡\", \"value\": 198}, {\"label\": \"斯洛伐克\", \"value\": 199}, {\"label\": \"斯洛文尼亚\", \"value\": 200}, {\"label\": \"所罗门群岛\", \"value\": 201}, {\"label\": \"索马里\", \"value\": 202}, {\"label\": \"南非\", \"value\": 203}, {\"label\": \"南乔治亚岛和南桑德韦奇岛\", \"value\": 204}, {\"label\": \"西班牙\", \"value\": 205}, {\"label\": \"斯里兰卡\", \"value\": 206}, {\"label\": \"苏丹\", \"value\": 207}, {\"label\": \"苏里南\", \"value\": 208}, {\"label\": \"斯瓦尔巴岛和扬马延岛\", \"value\": 209}, {\"label\": \"斯威士兰\", \"value\": 210}, {\"label\": \"瑞典\", \"value\": 211}, {\"label\": \"瑞士\", \"value\": 212}, {\"label\": \"叙利亚\", \"value\": 213}, {\"label\": \"塔吉克斯坦\", \"value\": 214}, {\"label\": \"坦桑尼亚\", \"value\": 215}, {\"label\": \"泰国\", \"value\": 216}, {\"label\": \"东帝汶\", \"value\": 217}, {\"label\": \"多哥\", \"value\": 218}, {\"label\": \"托克劳\", \"value\": 219}, {\"label\": \"汤加\", \"value\": 220}, {\"label\": \"特立尼达和多巴哥\", \"value\": 221}, {\"label\": \"突尼斯\", \"value\": 222}, {\"label\": \"土耳其\", \"value\": 223}, {\"label\": \"土库曼斯坦\", \"value\": 224}, {\"label\": \"特克斯和凯科斯群岛\", \"value\": 225}, {\"label\": \"图瓦卢\", \"value\": 226}, {\"label\": \"乌干达\", \"value\": 227}, {\"label\": \"乌克兰\", \"value\": 228}, {\"label\": \"阿联酋\", \"value\": 229}, {\"label\": \"英国\", \"value\": 230}, {\"label\": \"美国\", \"value\": 231}, {\"label\": \"美国本土外小岛屿\", \"value\": 232}, {\"label\": \"乌拉圭\", \"value\": 233}, {\"label\": \"乌兹别克斯坦\", \"value\": 234}, {\"label\": \"瓦努阿图\", \"value\": 235}, {\"label\": \"委内瑞拉\", \"value\": 236}, {\"label\": \"越南\", \"value\": 237}, {\"label\": \"英属维尔京群岛\", \"value\": 238}, {\"label\": \"美属维尔京群岛\", \"value\": 239}, {\"label\": \"瓦利斯和富图纳\", \"value\": 240}, {\"label\": \"西撒哈拉\", \"value\": 241}, {\"label\": \"也门\", \"value\": 242}, {\"label\": \"赞比亚\", \"value\": 243}, {\"label\": \"津巴布韦\", \"value\": 244}]}',
        NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (452, '2bb3c0d0fd86488bb146a1fc6b9f5dc1', '107', 'DATE', '您或您家里接待从境外回国人员开始的时间是？\n', 1, NULL, 1, NULL, 1179648,
        24, '{}', NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (453, '2bb3c0d0fd86488bb146a1fc6b9f5dc1', '108', 'DATE', '您或您家里接待回国人员结束的时间是？\n', 1, NULL, 1, NULL, 1245184, 24,
        '{}', NULL, '2021-01-11 13:58:32', '2021-01-11 13:58:32', 0);
INSERT INTO `pr_project_template_item`
VALUES (454, '036dcd3d099e42f7b473eb9cdf37231b', '100', 'RADIO', '您今日的体温是？\n', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"低于37.3度，体温是&lt;span class=&quot;mod_fillblank&quot; data-id=&quot;fillblank-omxs&quot;&gt;______&lt;/span&gt;\\n\", \"value\": 1}, {\"label\": \"不低于37.3度，体温是&lt;span class=&quot;mod_fillblank&quot; data-id=&quot;fillblank-YFaI&quot;&gt;______&lt;/span&gt;\\n\", \"value\": 2}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (455, '036dcd3d099e42f7b473eb9cdf37231b', '101', 'RADIO', '近14天内，您是否出现发热、干咳、乏力、呼吸困难等症状？\n', 1, NULL, 1, NULL,
        131072, 24, '{
    \"options\": [{\"label\": \"是\\n\", \"value\": 1}, {\"label\": \"否\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (456, '036dcd3d099e42f7b473eb9cdf37231b', '102', 'RADIO',
        '近14天内，您是否被确诊或疑似为新冠肺炎（包括无症状感染者、医学（居家/集中）观察未满14天或治愈出院未满14天的病人等）?', 1, NULL, 1, NULL, 196608, 24, '{
    \"options\": [{\"label\": \"是\\n\", \"value\": 1}, {\"label\": \"否\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (457, '036dcd3d099e42f7b473eb9cdf37231b', '103', 'RADIO', '近14天内，您是否有疫情重点地区旅居史、途经史或有确诊、疑似病例、境外来桂返桂人员接触史？\n', 1,
        NULL, 1, NULL, 262144, 24, '{
    \"options\": [{\"label\": \"是\\n\", \"value\": 1}, {\"label\": \"否\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (458, '036dcd3d099e42f7b473eb9cdf37231b', '104', 'RADIO', '近14天内，您家人是否有疫情重点地区旅居史、途经史或有确诊、疑似病例、境外来桂返桂人员接触史？\n', 1,
        NULL, 1, NULL, 327680, 24, '{
    \"options\": [{\"label\": \"是\\n\", \"value\": 1}, {\"label\": \"否\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (459, '7b9680452aed4dfc985f4493ce8fd039', '100', 'RADIO', '您的性别？', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"男\", \"value\": 1}, {\"label\": \"女\", \"value\": 2}]}', NULL, '2021-01-11 13:58:33',
        '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (460, '7b9680452aed4dfc985f4493ce8fd039', '101', 'RADIO', '您的年龄？ ', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"20岁及以下\", \"value\": 1}, {\"label\": \"21-25岁\", \"value\": 2}, {\"label\": \"26-30岁\", \"value\": 3}, {\"label\": \"31-40岁\", \"value\": 4}, {\"label\": \"40岁及以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (461, '7b9680452aed4dfc985f4493ce8fd039', '102', 'RADIO', '您的月收入为？（或每月生活费）', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"1000元以下\", \"value\": 1}, {\"label\": \"1001-2000元\", \"value\": 2}, {\"label\": \"2001-3000元\", \"value\": 3}, {\"label\": \"3001-5000元\", \"value\": 4}, {\"label\": \"5001-8000元\", \"value\": 5}, {\"label\": \"8001-10000元\", \"value\": 6}, {\"label\": \"10001-20000元\", \"value\": 7}, {\"label\": \"20000元以上\", \"value\": 8}, {\"label\": \"不方便透露\", \"value\": 9}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (462, '7b9680452aed4dfc985f4493ce8fd039', '103', 'RADIO', '最近半年，您网购东西的频率是？', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"每天都会看\", \"value\": 1}, {\"label\": \"每周都会看\", \"value\": 2}, {\"label\": \"每月都会看\", \"value\": 3}, {\"label\": \"有促销或有需求才看\", \"value\": 4}, {\"label\": \"更少\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (463, '7b9680452aed4dfc985f4493ce8fd039', '104', 'RADIO', '在最近半年里，您每月大概花了多少钱在网上购物上？', 1, NULL, 1, NULL, 327680,
        24, '{
    \"options\": [{\"label\": \"100元以内\", \"value\": 1}, {\"label\": \"100-200元\", \"value\": 2}, {\"label\": \"201-500元\", \"value\": 3}, {\"label\": \"501-1000元\", \"value\": 4}, {\"label\": \"1001-2000元\", \"value\": 5}, {\"label\": \"2001-5000元\", \"value\": 6}, {\"label\": \"5000元以上\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (464, '7b9680452aed4dfc985f4493ce8fd039', '105', 'RADIO', '您选择网络购物的原因？', 1, NULL, 1, NULL, 393216, 24, '{
  \"options\": [{\"label\": \"价格便宜\", \"value\": 1}, {\"label\": \"方便，不用出门\", \"value\": 2}, {\"label\": \"商品种类丰富，选择范围广\", \"value\": 3}, {\"label\": \"紧跟潮流，时尚\", \"value\": 4}, {\"label\": \"质量有保证\", \"value\": 5}, {\"label\": \"有很多顾客的评价，口碑可真实查看\", \"value\": 6}, {\"label\": \"其他\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (465, '7b9680452aed4dfc985f4493ce8fd039', '100', 'RADIO', '您目前通常会在哪些网上商城上购物？ ', 1, NULL, 1, NULL, 458752, 24, '{
  \"options\": [{\"label\": \"淘宝\", \"value\": 1}, {\"label\": \"天猫\", \"value\": 2}, {\"label\": \"拍拍\", \"value\": 3}, {\"label\": \"QQ商城\", \"value\": 4}, {\"label\": \"京东商城\", \"value\": 5}, {\"label\": \"易迅\", \"value\": 6}, {\"label\": \"当当\", \"value\": 7}, {\"label\": \"亚马逊\", \"value\": 8}, {\"label\": \"聚美优品\", \"value\": 9}, {\"label\": \"唯品会\", \"value\": 10}, {\"label\": \"1号店\", \"value\": 11}, {\"label\": \"红孩子\", \"value\": 12}, {\"label\": \"麦包包\", \"value\": 13}, {\"label\": \"凡客诚品\", \"value\": 14}, {\"label\": \"其他\", \"value\": 15}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (466, '7b9680452aed4dfc985f4493ce8fd039', '101', 'RADIO', '您最近两个月网购过下列哪些种类的商品？ ', 1, NULL, 1, NULL, 524288, 24,
        '{
          \"options\": [{\"label\": \"数码电子\", \"value\": 1}, {\"label\": \"家电产品\", \"value\": 2}, {\"label\": \"服装、鞋、包 时尚配饰（手表、项链等）\", \"value\": 3}, {\"label\": \"化妆品、个人护肤品\", \"value\": 4}, {\"label\": \"家居用品，如床上用品、家饰、厨卫用品之类\", \"value\": 5}, {\"label\": \"粮油食品、休闲食品\", \"value\": 6}, {\"label\": \"图书、音像制品\", \"value\": 7}, {\"label\": \"机票酒店\", \"value\": 8}, {\"label\": \"手机话费\", \"value\": 9}, {\"label\": \"保健食品\", \"value\": 10}, {\"label\": \"运动器材\", \"value\": 11}, {\"label\": \"其他\", \"value\": 12}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (467, '7b9680452aed4dfc985f4493ce8fd039', '102', 'RADIO', '你一般选择哪些途径进行网络购物？ ', 1, NULL, 1, NULL, 589824, 24, '{
  \"options\": [{\"label\": \"门户网站建立的商城（如淘宝商城等）\", \"value\": 1}, {\"label\": \"公司及个体户\", \"value\": 2}, {\"label\": \"自己建立的销售网站\", \"value\": 3}, {\"label\": \"电子交易平台（如淘宝、网易等）\", \"value\": 4}, {\"label\": \"通过聊天工具和人交易（QQ、MSN等）\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (468, '7b9680452aed4dfc985f4493ce8fd039', '103', 'RADIO', '您选择某一网站主要看中的因素？ ', 1, NULL, 1, NULL, 655360, 24, '{
  \"options\": [{\"label\": \"价格比其它网站低\", \"value\": 1}, {\"label\": \"商品丰富，可以一次性购买多类商品，省运费\", \"value\": 2}, {\"label\": \"网站品牌知名度高\", \"value\": 3}, {\"label\": \"有正品保证/品质有保证\", \"value\": 4}, {\"label\": \"用户评价好\", \"value\": 5}, {\"label\": \"自己以往的购物经历\", \"value\": 6}, {\"label\": \"流程简单易操作\", \"value\": 7}, {\"label\": \"退换货方便\", \"value\": 8}, {\"label\": \"在当地配货，发货更快\", \"value\": 9}, {\"label\": \"其他\", \"value\": 10}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (469, '7b9680452aed4dfc985f4493ce8fd039', '104', 'RATE', '目前为止的网购体验，总体来说，您满意吗？', 1, NULL, 1, NULL, 720896, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (470, '7b9680452aed4dfc985f4493ce8fd039', '105', 'RADIO', '在您的网购经历中，您是否遭遇过您认为是侵犯您权利的事件 ', 1, NULL, 1, NULL,
        786432, 24, '{
    \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:33',
        '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (471, '7b9680452aed4dfc985f4493ce8fd039', '106', 'RADIO', '在您的网购经历中，您认为遭遇过的侵权事件问题主要是在哪一环节 ', 1, NULL, 1, NULL,
        851968, 24, '{
    \"options\": [{\"label\": \"卖家或者供应商\", \"value\": 1}, {\"label\": \"购物网站\", \"value\": 2}, {\"label\": \"物流公司\", \"value\": 3}, {\"label\": \"银行或第三方支付机构\", \"value\": 4}, {\"label\": \"其他\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (472, '7b9680452aed4dfc985f4493ce8fd039', '107', 'RADIO', '您期望网络购物在哪些方面能做一些改善？ ', 1, NULL, 1, NULL, 917504, 24,
        '{
          \"options\": [{\"label\": \"信息描述\", \"value\": 1}, {\"label\": \"产品质量\", \"value\": 2}, {\"label\": \"退换货服务\", \"value\": 3}, {\"label\": \"支付手段\", \"value\": 4}, {\"label\": \"诚信经营\", \"value\": 5}, {\"label\": \"售后服务\", \"value\": 6}, {\"label\": \"物流配送\", \"value\": 7}, {\"label\": \"网络安全\", \"value\": 8}, {\"label\": \"法律保护\", \"value\": 9}, {\"label\": \"其他\", \"value\": 10}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (473, '7b9680452aed4dfc985f4493ce8fd039', '108', 'RADIO', '您使用过手机购物吗？ ', 1, NULL, 1, NULL, 983040, 24, '{
  \"options\": [{\"label\": \"使用过\", \"value\": 1}, {\"label\": \"没使用过\", \"value\": 2}]}', NULL, '2021-01-11 13:58:33',
        '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (474, '7b9680452aed4dfc985f4493ce8fd039', '100', 'RADIO', '以下描述符合您真实感受的是？ ', 1, NULL, 1, NULL, 1048576, 24, '{
  \"options\": [{\"label\": \"与电脑相比，我更愿意使用手机去浏览购物网站\", \"value\": 1}, {\"label\": \"我使用手机浏览购物网站的时间比电脑长\", \"value\": 2}, {\"label\": \"与电脑相比，我用手机浏览购物网站时下单速度更快\", \"value\": 3}, {\"label\": \"我更喜欢手机上购物网站的浏览体验\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (475, '7b9680452aed4dfc985f4493ce8fd039', '101', 'RADIO', '您为什么选择手机购物呢？ ', 1, NULL, 1, NULL, 1114112, 24, '{
  \"options\": [{\"label\": \"更加便捷，购物效率高\", \"value\": 1}, {\"label\": \"易了解购物时尚资讯\", \"value\": 2}, {\"label\": \"购物方式时尚\", \"value\": 3}, {\"label\": \"移动支付很方便\", \"value\": 4}, {\"label\": \"移动购物在我生活中很有用\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (476, '7b9680452aed4dfc985f4493ce8fd039', '102', 'RADIO', '您最喜欢哪个移动购物网站？', 1, NULL, 1, NULL, 1179648, 24, '{
  \"options\": [{\"label\": \"淘宝无线\", \"value\": 1}, {\"label\": \"手机京东\", \"value\": 2}, {\"label\": \"手机腾讯\", \"value\": 3}, {\"label\": \"手机凡客\", \"value\": 4}, {\"label\": \"手机当当\", \"value\": 5}, {\"label\": \"一号店\", \"value\": 6}, {\"label\": \"买卖宝\", \"value\": 7}, {\"label\": \"其他\", \"value\": 8}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (477, '7b9680452aed4dfc985f4493ce8fd039', '103', 'RADIO', '您如何在手机上查看商品信息呢？ ', 1, NULL, 1, NULL, 1245184, 24, '{
  \"options\": [{\"label\": \"手机上百度等通用搜索查看\", \"value\": 1}, {\"label\": \"输入网址打开网站浏览\", \"value\": 2}, {\"label\": \"手机上一淘等购物搜索查看\", \"value\": 3}, {\"label\": \"登录手机购物网站app浏览\", \"value\": 4}, {\"label\": \"使用网购推荐类软件（蘑菇街、美丽说等）\", \"value\": 5}, {\"label\": \"使用快拍条形码等方式查看\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (478, '7b9680452aed4dfc985f4493ce8fd039', '104', 'RADIO', '您一般是在什么情况下进行手机购物呢？ ', 1, NULL, 1, NULL, 1310720, 24,
        '{
          \"options\": [{\"label\": \"在家休闲时\", \"value\": 1}, {\"label\": \"无法用电脑联网时\", \"value\": 2}, {\"label\": \"上床入睡饭后休息时\", \"value\": 3}, {\"label\": \"坐车途中\", \"value\": 4}, {\"label\": \"吃饭时\", \"value\": 5}, {\"label\": \"上班或上课等工作学习时\", \"value\": 6}, {\"label\": \"早晨起床前\", \"value\": 7}, {\"label\": \"排队等候时\", \"value\": 8}, {\"label\": \"其他\", \"value\": 9}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (479, '7b9680452aed4dfc985f4493ce8fd039', '100', 'RADIO', '您喜欢通过哪些方式了解网站所售商品的信息  ', 1, NULL, 1, NULL, 1376256,
        24, '{
    \"options\": [{\"label\": \"仔细询问卖家\", \"value\": 1}, {\"label\": \"观察商品的图片\", \"value\": 2}, {\"label\": \"查看销售记录和销售评价\", \"value\": 3}, {\"label\": \"询问购买过该商品的买家\", \"value\": 4}, {\"label\": \"仔细阅读商品的描述\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (480, '7b9680452aed4dfc985f4493ce8fd039', '101', 'RADIO', '当您要进行网上交易时，您选择卖家的标准有  ', 1, NULL, 1, NULL, 1441792,
        24, '{
    \"options\": [{\"label\": \"产品的价格\", \"value\": 1}, {\"label\": \"卖家的信用等级\", \"value\": 2}, {\"label\": \"售后服务 送\", \"value\": 3}, {\"label\": \"货是否及时，送货费用的多少\", \"value\": 4}, {\"label\": \"支付方式的安全性\", \"value\": 5}, {\"label\": \"优惠活动\", \"value\": 6}, {\"label\": \"其他\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (481, '7b9680452aed4dfc985f4493ce8fd039', '102', 'RADIO', '您一般选择的支付方式  ', 1, NULL, 1, NULL, 1507328, 24, '{
  \"options\": [{\"label\": \"支付宝、财付通等平台\", \"value\": 1}, {\"label\": \"信用卡支付\", \"value\": 2}, {\"label\": \"网银支付\", \"value\": 3}, {\"label\": \"储蓄卡支付\", \"value\": 4}, {\"label\": \"邮寄汇款\", \"value\": 5}, {\"label\": \"货到付款\", \"value\": 6}, {\"label\": \"微信支付\", \"value\": 7}, {\"label\": \"其他\", \"value\": 8}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (482, '7b9680452aed4dfc985f4493ce8fd039', '103', 'RADIO', '您最喜欢哪种网购促销手段  ', 1, NULL, 1, NULL, 1572864, 24, '{
  \"options\": [{\"label\": \"打折\", \"value\": 1}, {\"label\": \"秒杀\", \"value\": 2}, {\"label\": \"免运费\", \"value\": 3}, {\"label\": \"积分\", \"value\": 4}, {\"label\": \"购物送礼\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (483, '7b9680452aed4dfc985f4493ce8fd039', '104', 'RADIO', '网购收货后，您都会对商品进行评价吗？  ', 1, NULL, 1, NULL, 1638400, 24,
        '{
          \"options\": [{\"label\": \"都会认真写，喜欢分享自己的购物心得\", \"value\": 1}, {\"label\": \"每次都随便写写\", \"value\": 2}, {\"label\": \"偶尔一次，看心情\", \"value\": 3}, {\"label\": \"除非是很好或很坏的经历，不然不会写\", \"value\": 4}, {\"label\": \"太麻烦，从来不写\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (484, '7b9680452aed4dfc985f4493ce8fd039', '105', 'RADIO', '网购到满意的商品后，你会推荐给其他人吗？ ', 1, NULL, 1, NULL, 1703936, 24,
        '{
          \"options\": [{\"label\": \"会\", \"value\": 1}, {\"label\": \"不会\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (485, '7b9680452aed4dfc985f4493ce8fd039', '106', 'RADIO', '您最常用哪个渠道推荐呢？  ', 1, NULL, 1, NULL, 1769472, 24, '{
  \"options\": [{\"label\": \"口头推荐\", \"value\": 1}, {\"label\": \"电话/短信\", \"value\": 2}, {\"label\": \"微信\", \"value\": 3}, {\"label\": \"微博\", \"value\": 4}, {\"label\": \"QQ\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (486, '4c314ed6ef51414aaaf04051efbc438d', '100', 'RADIO', '您的性别 ', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"男\", \"value\": 1}, {\"label\": \"女\", \"value\": 2}]}', NULL, '2021-01-11 13:58:33',
        '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (487, '4c314ed6ef51414aaaf04051efbc438d', '101', 'RADIO', '您目前的职业是 ', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"在校学生\", \"value\": 1}, {\"label\": \"政府/机关干部/公务员\", \"value\": 2}, {\"label\": \"企业管理者（包括基层及中高层管理者）\", \"value\": 3}, {\"label\": \"普通职员（办公室/写字楼工作人员）\", \"value\": 4}, {\"label\": \"专业人员（如医生/律师/文体/记者/老师等）\", \"value\": 5}, {\"label\": \"普通工人（如工厂工人/体力劳动者等）\", \"value\": 6}, {\"label\": \"商业服务业职工（如销售人员/商店职员/服务员等）\", \"value\": 7}, {\"label\": \"个体经营者/承包商\", \"value\": 8}, {\"label\": \"自由职业者\", \"value\": 9}, {\"label\": \"农林牧渔劳动者\", \"value\": 10}, {\"label\": \"退休\", \"value\": 11}, {\"label\": \"暂无职业\", \"value\": 12}, {\"label\": \"其他\", \"value\": 13}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (488, '4c314ed6ef51414aaaf04051efbc438d', '102', 'RADIO', '您的个人月收入（从各种途径得到的全部收入总和，包括零花钱）（或每月生活费） ', 1, NULL, 1,
        NULL, 196608, 24, '{
    \"options\": [{\"label\": \"1000元以下\", \"value\": 1}, {\"label\": \"1001-2000元\", \"value\": 2}, {\"label\": \"2001-3000元\", \"value\": 3}, {\"label\": \"3001-5000元\", \"value\": 4}, {\"label\": \"5001-8000元\", \"value\": 5}, {\"label\": \"8001-10000元\", \"value\": 6}, {\"label\": \"10001-20000元\", \"value\": 7}, {\"label\": \"20000元以上\", \"value\": 8}, {\"label\": \"不方便透露\", \"value\": 9}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (489, '4c314ed6ef51414aaaf04051efbc438d', '103', 'RADIO', '你期待今年圣诞节吗？ ', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"很期待\", \"value\": 1}, {\"label\": \"期待\", \"value\": 2}, {\"label\": \"一般\", \"value\": 3}, {\"label\": \"不期待\", \"value\": 4}, {\"label\": \"很不期待\", \"value\": 5}, {\"label\": \"没听说过圣诞节\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (490, '4c314ed6ef51414aaaf04051efbc438d', '104', 'RADIO', '关于圣诞节的描述，你最认同的一点是？ ', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"和朋友狂欢happy的节日\", \"value\": 1}, {\"label\": \"绝对要去购物扫货，因为折扣都非常优惠\", \"value\": 2}, {\"label\": \"必须来个温馨家庭大聚餐\", \"value\": 3}, {\"label\": \"最适合跟恋人一起享受浪漫时光\", \"value\": 4}, {\"label\": \"就让我一个人做安静的美男纸或女纸吧\", \"value\": 5}, {\"label\": \"没兴趣，这个节日与我无关\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (491, '4c314ed6ef51414aaaf04051efbc438d', '105', 'RADIO', '您是否有在圣诞节送礼物给别人的经历 ', 1, NULL, 1, NULL, 393216, 24, '{
  \"options\": [{\"label\": \"有\", \"value\": 1}, {\"label\": \"无\", \"value\": 2}, {\"label\": \"没有，但打算送\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (492, '4c314ed6ef51414aaaf04051efbc438d', '106', 'RADIO', '您想送礼物给谁或最想收到谁送的礼物 ', 1, NULL, 1, NULL, 458752, 24, '{
  \"options\": [{\"label\": \"恋人\", \"value\": 1}, {\"label\": \"老师\", \"value\": 2}, {\"label\": \"父母\", \"value\": 3}, {\"label\": \"朋友\", \"value\": 4}, {\"label\": \"其他\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (493, '4c314ed6ef51414aaaf04051efbc438d', '107', 'RADIO', '您购买或赠送圣诞礼物的目的 ', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"收藏观赏性\", \"value\": 1}, {\"label\": \"有实用性\", \"value\": 2}, {\"label\": \"馈赠朋友\", \"value\": 3}, {\"label\": \"感受节日\", \"value\": 4}, {\"label\": \"气氛\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (494, '4c314ed6ef51414aaaf04051efbc438d', '108', 'RADIO', '你看中礼物的价格还是价值？ ', 1, NULL, 1, NULL, 589824, 24, '{
  \"options\": [{\"label\": \"价格\", \"value\": 1}, {\"label\": \"价值\", \"value\": 2}, {\"label\": \"都看重\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (495, '4c314ed6ef51414aaaf04051efbc438d', '109', 'RADIO', '您会选择哪种类型的礼物 ', 1, NULL, 1, NULL, 655360, 24, '{
  \"options\": [{\"label\": \"衣服\", \"value\": 1}, {\"label\": \"箱包鞋履\", \"value\": 2}, {\"label\": \"化妆护肤\", \"value\": 3}, {\"label\": \"珠宝首饰\", \"value\": 4}, {\"label\": \"数码产品\", \"value\": 5}, {\"label\": \"个性小玩物\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (496, '4c314ed6ef51414aaaf04051efbc438d', '110', 'RADIO', '如果购买礼物您愿花多少钱 ', 1, NULL, 1, NULL, 720896, 24, '{
  \"options\": [{\"label\": \"100元以内\", \"value\": 1}, {\"label\": \"100-200元\", \"value\": 2}, {\"label\": \"201-500元\", \"value\": 3}, {\"label\": \"501-1000元\", \"value\": 4}, {\"label\": \"1001-2000元\", \"value\": 5}, {\"label\": \"2001-5000元\", \"value\": 6}, {\"label\": \"5000元以上\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (497, '4c314ed6ef51414aaaf04051efbc438d', '111', 'RADIO', '选择礼物时您最看重哪个方面 ', 1, NULL, 1, NULL, 786432, 24, '{
  \"options\": [{\"label\": \"品牌知名度\", \"value\": 1}, {\"label\": \"价格，性价比高\", \"value\": 2}, {\"label\": \"质量/性能最好\", \"value\": 3}, {\"label\": \"美观\", \"value\": 4}, {\"label\": \"广告宣传吸引人\", \"value\": 5}, {\"label\": \"售后服务\", \"value\": 6}, {\"label\": \"实用，TA刚好需要\", \"value\": 7}, {\"label\": \"是限量版本或有特殊含义\", \"value\": 8}, {\"label\": \"有促销活动\", \"value\": 9}, {\"label\": \"销售人员的推荐\", \"value\": 10}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (498, '4c314ed6ef51414aaaf04051efbc438d', '112', 'RADIO', '您一般是在哪里购买礼物？ ', 1, NULL, 1, NULL, 851968, 24, '{
  \"options\": [{\"label\": \"网购\", \"value\": 1}, {\"label\": \"商场超市\", \"value\": 2}, {\"label\": \"精品小店\", \"value\": 3}, {\"label\": \"其他\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (499, '4c314ed6ef51414aaaf04051efbc438d', '113', 'RADIO', '您送礼物的方式中最多是？', 1, NULL, 1, NULL, 917504, 24, '{
  \"options\": [{\"label\": \"快递直邮\", \"value\": 1}, {\"label\": \"亲自送\", \"value\": 2}, {\"label\": \"熟人转交\", \"value\": 3}, {\"label\": \"经创意策划的方式\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (500, '4c314ed6ef51414aaaf04051efbc438d', '114', 'RADIO', '您网购过圣诞礼物吗？ ', 1, NULL, 1, NULL, 983040, 24, '{
  \"options\": [{\"label\": \"一直都在网上买\", \"value\": 1}, {\"label\": \"偶尔会在网上买\", \"value\": 2}, {\"label\": \"从来没有\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (501, '4c314ed6ef51414aaaf04051efbc438d', '115', 'RATE', '您对网购来的礼物的满意度 ', 1, NULL, 1, NULL, 1048576, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (502, '4c314ed6ef51414aaaf04051efbc438d', '116', 'RADIO', '您对网购的礼物最不满意或最担心的是？ ', 1, NULL, 1, NULL, 1114112, 24,
        '{
          \"options\": [{\"label\": \"配送是龟速，慢\", \"value\": 1}, {\"label\": \"产品质量与实物相关太大\", \"value\": 2}, {\"label\": \"包装太差，无法当礼物送人\", \"value\": 3}, {\"label\": \"送货和收货时间不确定，惊喜变成了担忧\", \"value\": 4}, {\"label\": \"不能代写贺卡，礼物少了点情趣\", \"value\": 5}, {\"label\": \"代写祝福的字太丑，感觉整个人都不好了\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:33', '2021-01-11 13:58:33', 0);
INSERT INTO `pr_project_template_item`
VALUES (503, 'e85d66e7f94346b9b9d4510a6fa79c7b', '100', 'RADIO', '你的性别 ', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"男\", \"value\": 1}, {\"label\": \"女\", \"value\": 2}]}', NULL, '2021-01-11 13:58:34',
        '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (504, 'e85d66e7f94346b9b9d4510a6fa79c7b', '101', 'RADIO', '您的年龄  ', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"20岁及以下\", \"value\": 1}, {\"label\": \"21-25岁\", \"value\": 2}, {\"label\": \"26-30岁\", \"value\": 3}, {\"label\": \"31-40岁\", \"value\": 4}, {\"label\": \"40岁及以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (505, 'e85d66e7f94346b9b9d4510a6fa79c7b', '102', 'RADIO', '你的学历  ', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"初中及以下\", \"value\": 1}, {\"label\": \"高中/中专\", \"value\": 2}, {\"label\": \"大专\", \"value\": 3}, {\"label\": \"本科\", \"value\": 4}, {\"label\": \"硕士\", \"value\": 5}, {\"label\": \"博士\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (506, 'e85d66e7f94346b9b9d4510a6fa79c7b', '103', 'RADIO', '你的职业 ', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"在校学生\", \"value\": 1}, {\"label\": \"政府/机关干部/公务员\", \"value\": 2}, {\"label\": \"企业管理者（包括基层及中高层管理者）\", \"value\": 3}, {\"label\": \"普通职员（办公室/写字楼工作人员）\", \"value\": 4}, {\"label\": \"专业人员（如医生/律师/文体/记者/老师等）\", \"value\": 5}, {\"label\": \"普通工人（如工厂工人/体力劳动者等）\", \"value\": 6}, {\"label\": \"商业服务业职工（如销售人员/商店职员/服务员等）\", \"value\": 7}, {\"label\": \"个体经营者/承包商\", \"value\": 8}, {\"label\": \"自由职业者\", \"value\": 9}, {\"label\": \"农林牧渔劳动者\", \"value\": 10}, {\"label\": \"退休\", \"value\": 11}, {\"label\": \"暂无职业\", \"value\": 12}, {\"label\": \"其他\", \"value\": 13}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (507, 'e85d66e7f94346b9b9d4510a6fa79c7b', '104', 'RADIO', '你的个人月收入（或每月生活费） ', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"1000元以下\", \"value\": 1}, {\"label\": \"1001-2000元\", \"value\": 2}, {\"label\": \"2001-3000元\", \"value\": 3}, {\"label\": \"3001-5000元\", \"value\": 4}, {\"label\": \"5001-8000元\", \"value\": 5}, {\"label\": \"8001-10000元\", \"value\": 6}, {\"label\": \"10001-20000元\", \"value\": 7}, {\"label\": \"20000元以上\", \"value\": 8}, {\"label\": \"不方便透露\", \"value\": 9}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (508, 'e85d66e7f94346b9b9d4510a6fa79c7b', '105', 'RADIO', '你能接受通过旅游电子商务网站获取信息吗 ', 1, NULL, 1, NULL, 393216, 24,
        '{
          \"options\": [{\"label\": \"非常能接受\", \"value\": 1}, {\"label\": \"能接受\", \"value\": 2}, {\"label\": \"一般\", \"value\": 3}, {\"label\": \"不能接受\", \"value\": 4}, {\"label\": \"非常不能接受\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (509, 'e85d66e7f94346b9b9d4510a6fa79c7b', '106', 'RADIO', '你经常浏览的旅游电子商务网站都有哪些  ', 1, NULL, 1, NULL, 458752, 24,
        '{
          \"options\": [{\"label\": \"携程网\", \"value\": 1}, {\"label\": \"途牛网\", \"value\": 2}, {\"label\": \"驴妈妈网\", \"value\": 3}, {\"label\": \"去哪儿网\", \"value\": 4}, {\"label\": \"艺龙网\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (510, 'e85d66e7f94346b9b9d4510a6fa79c7b', '107', 'RADIO', '你是通过哪些途径认识这些旅游电子商务网站的 ', 1, NULL, 1, NULL, 524288, 24,
        '{
          \"options\": [{\"label\": \"电视\", \"value\": 1}, {\"label\": \"报刊等媒体\", \"value\": 2}, {\"label\": \"人员推销\", \"value\": 3}, {\"label\": \"互联网\", \"value\": 4}, {\"label\": \"亲朋好友的推荐\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (511, 'e85d66e7f94346b9b9d4510a6fa79c7b', '108', 'RADIO', '你浏览旅游电子商务网站的频率 ', 1, NULL, 1, NULL, 589824, 24, '{
  \"options\": [{\"label\": \"从不\", \"value\": 1}, {\"label\": \"很少\", \"value\": 2}, {\"label\": \"每月1次\", \"value\": 3}, {\"label\": \"每月2-5次\", \"value\": 4}, {\"label\": \"每月5-10次\", \"value\": 5}, {\"label\": \"每月10次以上\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (512, 'e85d66e7f94346b9b9d4510a6fa79c7b', '109', 'RADIO', '你觉得从旅游电子商务网站获取的信息 ', 1, NULL, 1, NULL, 655360, 24, '{
  \"options\": [{\"label\": \"客观可靠\", \"value\": 1}, {\"label\": \"对我的决策有帮助\", \"value\": 2}, {\"label\": \"随便看看，参考度不高\", \"value\": 3}, {\"label\": \"网站的信息都是不可靠的，都不借鉴\", \"value\": 4}, {\"label\": \"视网站的性质而定\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (513, 'e85d66e7f94346b9b9d4510a6fa79c7b', '110', 'RADIO', '你浏览旅游电子商务网站时，最关注的内容是 ', 1, NULL, 1, NULL, 720896, 24,
        '{
          \"options\": [{\"label\": \"价格\", \"value\": 1}, {\"label\": \"景点路线\", \"value\": 2}, {\"label\": \"支付安全\", \"value\": 3}, {\"label\": \"可靠性\", \"value\": 4}, {\"label\": \"时间安排\", \"value\": 5}, {\"label\": \"服务质量不可靠的，都不借鉴\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (514, 'e85d66e7f94346b9b9d4510a6fa79c7b', '111', 'RADIO', '以下哪些因素会刺激你在旅游电子商务网站中消费 ', 1, NULL, 1, NULL, 786432,
        24, '{
    \"options\": [{\"label\": \"亲友推荐\", \"value\": 1}, {\"label\": \"社交网站，经验论坛的介绍\", \"value\": 2}, {\"label\": \"团购网站的介绍\", \"value\": 3}, {\"label\": \"旅游杂志或期刊的介绍\", \"value\": 4}, {\"label\": \"网页上自动弹出的小广告\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (515, 'e85d66e7f94346b9b9d4510a6fa79c7b', '112', 'RADIO', '你觉得通过旅游电子商务网站消费有哪些不足 ', 1, NULL, 1, NULL, 851968, 24,
        '{
          \"options\": [{\"label\": \"电话或电脑普及率的问题\", \"value\": 1}, {\"label\": \"操作较困难\", \"value\": 2}, {\"label\": \"网络安全性问题\", \"value\": 3}, {\"label\": \"信息的可靠性\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (516, 'e85d66e7f94346b9b9d4510a6fa79c7b', '113', 'RADIO', '你习惯于什么方式完成对旅游产品的支付 ', 1, NULL, 1, NULL, 917504, 24, '{
  \"options\": [{\"label\": \"货到付款\", \"value\": 1}, {\"label\": \"网上银行结算\", \"value\": 2}, {\"label\": \"第三方支付平台（支付宝等）\", \"value\": 3}, {\"label\": \"现金支付\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (517, 'e85d66e7f94346b9b9d4510a6fa79c7b', '114', 'RADIO', '你对自己所使用的支付工具是否满意 ', 1, NULL, 1, NULL, 983040, 24, '{
  \"options\": [{\"label\": \"非常满意\", \"value\": 1}, {\"label\": \"满意\", \"value\": 2}, {\"label\": \"一般\", \"value\": 3}, {\"label\": \"不满意\", \"value\": 4}, {\"label\": \"非常不满意\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (518, '786b9cad188e47d49b41ab39a7d45f4d', '100', 'RADIO', '您是酒店从业人员？', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"不是\", \"value\": 2}]}', NULL, '2021-01-11 13:58:34',
        '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (519, '786b9cad188e47d49b41ab39a7d45f4d', '100', 'RADIO', '你的性别', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"男\", \"value\": 1}, {\"label\": \"女\", \"value\": 2}]}', NULL, '2021-01-11 13:58:34',
        '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (520, '786b9cad188e47d49b41ab39a7d45f4d', '101', 'RADIO', '您的年龄', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"20岁及以下\", \"value\": 1}, {\"label\": \"21-25岁\", \"value\": 2}, {\"label\": \"26-30岁\", \"value\": 3}, {\"label\": \"31-40岁\", \"value\": 4}, {\"label\": \"40岁及以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (521, '786b9cad188e47d49b41ab39a7d45f4d', '102', 'RADIO', '你的学历', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"初中及以下\", \"value\": 1}, {\"label\": \"高中/中专\", \"value\": 2}, {\"label\": \"大专\", \"value\": 3}, {\"label\": \"本科\", \"value\": 4}, {\"label\": \"硕士\", \"value\": 5}, {\"label\": \"博士\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (522, '786b9cad188e47d49b41ab39a7d45f4d', '103', 'RADIO', '你的职业', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"在校学生\", \"value\": 1}, {\"label\": \"政府/机关干部/公务员\", \"value\": 2}, {\"label\": \"企业管理者（包括基层及中高层管理者）\", \"value\": 3}, {\"label\": \"普通职员（办公室/写字楼工作人员）\", \"value\": 4}, {\"label\": \"专业人员（如医生/律师/文体/记者/老师等）\", \"value\": 5}, {\"label\": \"普通工人（如工厂工人/体力劳动者等）\", \"value\": 6}, {\"label\": \"商业服务业职工（如销售人员/商店职员/服务员等）\", \"value\": 7}, {\"label\": \"个体经营者/承包商\", \"value\": 8}, {\"label\": \"自由职业者\", \"value\": 9}, {\"label\": \"农林牧渔劳动者\", \"value\": 10}, {\"label\": \"退休\", \"value\": 11}, {\"label\": \"暂无职业\", \"value\": 12}, {\"label\": \"其他\", \"value\": 13}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (523, '786b9cad188e47d49b41ab39a7d45f4d', '104', 'RADIO', '你的个人月收入（或每月生活费）', 1, NULL, 1, NULL, 393216, 24, '{
  \"options\": [{\"label\": \"1000元以下\", \"value\": 1}, {\"label\": \"1001-2000元\", \"value\": 2}, {\"label\": \"2001-3000元\", \"value\": 3}, {\"label\": \"3001-5000元\", \"value\": 4}, {\"label\": \"5001-8000元\", \"value\": 5}, {\"label\": \"8001-10000元\", \"value\": 6}, {\"label\": \"10001-20000元\", \"value\": 7}, {\"label\": \"20000元以上\", \"value\": 8}, {\"label\": \"不方便透露\", \"value\": 9}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (524, '786b9cad188e47d49b41ab39a7d45f4d', '100', 'RADIO', '您平时预订酒店的主要原因是什么？', 1, NULL, 1, NULL, 458752, 24, '{
  \"options\": [{\"label\": \"出差\", \"value\": 1}, {\"label\": \"旅游\", \"value\": 2}, {\"label\": \"探亲访友\", \"value\": 3}, {\"label\": \"帮领导或者同事预订\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (525, '786b9cad188e47d49b41ab39a7d45f4d', '101', 'RADIO', '您平均每月出差多少次?', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"1-2次\", \"value\": 1}, {\"label\": \"3-5次\", \"value\": 2}, {\"label\": \"5次以上\", \"value\": 3}, {\"label\": \"其他\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (526, '786b9cad188e47d49b41ab39a7d45f4d', '102', 'RADIO', '您每月平均给领导或同事预订几次酒店?', 1, NULL, 1, NULL, 589824, 24, '{
  \"options\": [{\"label\": \"1-2次\", \"value\": 1}, {\"label\": \"3-5次\", \"value\": 2}, {\"label\": \"5次以上\", \"value\": 3}, {\"label\": \"其他\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (527, '786b9cad188e47d49b41ab39a7d45f4d', '103', 'RADIO', '您公司预订酒店的方式', 1, NULL, 1, NULL, 655360, 24, '{
  \"options\": [{\"label\": \"秘书代订\", \"value\": 1}, {\"label\": \"公司协议酒店\", \"value\": 2}, {\"label\": \"只要在公司规定的报销范畴即可，不限定预订方式\", \"value\": 3}, {\"label\": \"公司限定的预订网站和渠道\", \"value\": 4}, {\"label\": \"其他\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (528, '786b9cad188e47d49b41ab39a7d45f4d', '104', 'RADIO', '您出差会选择什么类型的酒店', 1, NULL, 1, NULL, 720896, 24, '{
  \"options\": [{\"label\": \"5星级及以上酒店\", \"value\": 1}, {\"label\": \"3-4星级酒店\", \"value\": 2}, {\"label\": \"品牌连锁经济型酒店\", \"value\": 3}, {\"label\": \"家庭旅馆客栈\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (529, '786b9cad188e47d49b41ab39a7d45f4d', '105', 'RADIO', '您一年大概出行几次', 1, NULL, 1, NULL, 786432, 24, '{
  \"options\": [{\"label\": \"1次\", \"value\": 1}, {\"label\": \"2-3次\", \"value\": 2}, {\"label\": \"3次以上\", \"value\": 3}, {\"label\": \"其他\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (530, '786b9cad188e47d49b41ab39a7d45f4d', '106', 'RADIO', '你出行一般会选择什么类型的酒店', 1, NULL, 1, NULL, 851968, 24, '{
  \"options\": [{\"label\": \"5星级及以上酒店\", \"value\": 1}, {\"label\": \"3-4星级酒店\", \"value\": 2}, {\"label\": \"品牌连锁经济型酒店\", \"value\": 3}, {\"label\": \"家庭旅馆客栈\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (531, '786b9cad188e47d49b41ab39a7d45f4d', '107', 'RADIO', '您一般帮领导和同事预订什么类型的酒店？', 1, NULL, 1, NULL, 917504, 24, '{
  \"options\": [{\"label\": \"5星级及以上酒店\", \"value\": 1}, {\"label\": \"3-4星级酒店\", \"value\": 2}, {\"label\": \"品牌连锁经济连锁酒店\", \"value\": 3}, {\"label\": \"家庭旅馆客栈\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (532, '786b9cad188e47d49b41ab39a7d45f4d', '108', 'RADIO', '您平时预订酒店一般会', 1, NULL, 1, NULL, 983040, 24, '{
  \"options\": [{\"label\": \"提前几天预订\", \"value\": 1}, {\"label\": \"临时预订\", \"value\": 2}, {\"label\": \"直接到酒店入住\", \"value\": 3}, {\"label\": \"其他\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (533, '786b9cad188e47d49b41ab39a7d45f4d', '109', 'RADIO', '选择酒店您看中哪些因素', 1, NULL, 1, NULL, 1048576, 24, '{
  \"options\": [{\"label\": \"服务\", \"value\": 1}, {\"label\": \"价格\", \"value\": 2}, {\"label\": \"位置\", \"value\": 3}, {\"label\": \"周边环境\", \"value\": 4}, {\"label\": \"点评\", \"value\": 5}, {\"label\": \"图片\", \"value\": 6}, {\"label\": \"其他\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (534, '786b9cad188e47d49b41ab39a7d45f4d', '110', 'RADIO', '您平时习惯怎么预订酒店', 1, NULL, 1, NULL, 1114112, 24, '{
  \"options\": [{\"label\": \"电话预订\", \"value\": 1}, {\"label\": \"百度或者google搜索查找\", \"value\": 2}, {\"label\": \"直接到网站预订（比如携程、艺龙、去哪儿等）\", \"value\": 3}, {\"label\": \"拨打114等中介机构预订\", \"value\": 4}, {\"label\": \"到酒店前台直接入住\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (535, '786b9cad188e47d49b41ab39a7d45f4d', '111', 'RADIO', '网上预订酒店您会选择哪个网站？', 1, NULL, 1, NULL, 1179648, 24, '{
  \"options\": [{\"label\": \"携程网\", \"value\": 1}, {\"label\": \"艺龙旅行网\", \"value\": 2}, {\"label\": \"去哪儿\", \"value\": 3}, {\"label\": \"淘宝旅行\", \"value\": 4}, {\"label\": \"XX旅游网\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (536, '786b9cad188e47d49b41ab39a7d45f4d', '112', 'RADIO', '您上网预订酒店的原因是什么？', 1, NULL, 1, NULL, 1245184, 24, '{
  \"options\": [{\"label\": \"上网预订价格比较便宜\", \"value\": 1}, {\"label\": \"可以返现金\", \"value\": 2}, {\"label\": \"可以累积积分\", \"value\": 3}, {\"label\": \"各类促销活动\", \"value\": 4}, {\"label\": \"其他\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (537, '786b9cad188e47d49b41ab39a7d45f4d', '113', 'RADIO', '您有来xx旅游网查看或者预订过机票和酒店吗？', 1, NULL, 1, NULL, 1310720,
        24, '{
    \"options\": [{\"label\": \"有\", \"value\": 1}, {\"label\": \"没有\", \"value\": 2}]}', NULL, '2021-01-11 13:58:34',
        '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (538, '786b9cad188e47d49b41ab39a7d45f4d', '114', 'RADIO', '您对xx旅游网印象最深刻的是什么？', 1, NULL, 1, NULL, 1376256, 24, '{
  \"options\": [{\"label\": \"各种促销活动\", \"value\": 1}, {\"label\": \"著名公司产品，值得信赖\", \"value\": 2}, {\"label\": \"返现金额高，还可以累积积分兑换ipad\", \"value\": 3}, {\"label\": \"酒店价格便宜\", \"value\": 4}, {\"label\": \"xx旅游网入口很多，很容易找到\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (539, '786b9cad188e47d49b41ab39a7d45f4d', '115', 'RADIO', '您还未用xx旅游网预订酒店的原因是什么?', 1, NULL, 1, NULL, 1441792, 24,
        '{
          \"options\": [{\"label\": \"我习惯了在其他网站预订\", \"value\": 0}, {\"label\": \"我是酒店会员\", \"value\": 2}, {\"label\": \"公司有协议酒店\", \"value\": 3}, {\"label\": \"xx网旅游酒店太贵了\", \"value\": 4}, {\"label\": \"xx网旅游机票太贵了\", \"value\": 5}, {\"label\": \"xx网旅游酒店太少了\", \"value\": 6}, {\"label\": \"没有听说过xx旅游网\", \"value\": 7}, {\"label\": \"其他\", \"value\": 8}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (540, '786b9cad188e47d49b41ab39a7d45f4d', '116', 'RADIO', '您希望xx旅游网提供什么服务，才会考虑预订酒店？', 1, NULL, 1, NULL, 1507328,
        24, '{
    \"options\": [{\"label\": \"机票价格便宜\", \"value\": 1}, {\"label\": \"在QQ面板上设置入口，方便随时打开查询\", \"value\": 2}, {\"label\": \"定期将XX旅游网的促销活动或者近期的咨询邮件告之我\", \"value\": 3}, {\"label\": \"预订酒店可以返现金\", \"value\": 4}, {\"label\": \"可以电话和手机预订\", \"value\": 5}, {\"label\": \"酒店资源丰富，各种类型的酒店都有\", \"value\": 6}, {\"label\": \"酒店价格打折\", \"value\": 7}, {\"label\": \"多做一些促销活动\", \"value\": 8}, {\"label\": \"可以累积积分，兑换物品\", \"value\": 9}, {\"label\": \"其他\", \"value\": 10}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (541, '9dbf35a35f7a4aeb849c4715cea996e2', '100', 'RADIO', '您的性别是？  ', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"男\", \"value\": 1}, {\"label\": \"女\", \"value\": 2}]}', NULL, '2021-01-11 13:58:34',
        '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (542, '9dbf35a35f7a4aeb849c4715cea996e2', '101', 'RADIO', '您的年龄是？  ', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"20岁及以下\", \"value\": 1}, {\"label\": \"21-25岁\", \"value\": 2}, {\"label\": \"26-30岁\", \"value\": 3}, {\"label\": \"31-40岁\", \"value\": 4}, {\"label\": \"40岁及以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (543, '9dbf35a35f7a4aeb849c4715cea996e2', '102', 'RADIO', '平时是否利用手机或者电脑上网  ', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"不是\", \"value\": 2}]}', NULL, '2021-01-11 13:58:34',
        '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (544, '9dbf35a35f7a4aeb849c4715cea996e2', '103', 'RADIO', '上网的频率  ', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"每周5次或更多\", \"value\": 1}, {\"label\": \"每周2-4次\", \"value\": 2}, {\"label\": \"每周1次\", \"value\": 3}, {\"label\": \"几周或更长时间才1次\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (545, '9dbf35a35f7a4aeb849c4715cea996e2', '104', 'RADIO', '你平时是否网购？  ', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:34',
        '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (546, '9dbf35a35f7a4aeb849c4715cea996e2', '105', 'RADIO', '在哪些网站进行过购物 ', 1, NULL, 1, NULL, 393216, 24, '{
  \"options\": [{\"label\": \"淘宝网\", \"value\": 1}, {\"label\": \"天猫商城\", \"value\": 2}, {\"label\": \"唯品会\", \"value\": 3}, {\"label\": \"京东商城\", \"value\": 4}, {\"label\": \"聚美优品\", \"value\": 5}, {\"label\": \"苏宁易购\", \"value\": 6}, {\"label\": \"亚马逊\", \"value\": 7}, {\"label\": \"其他\", \"value\": 8}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (547, '9dbf35a35f7a4aeb849c4715cea996e2', '106', 'RADIO', '你现在习惯于用哪些工具进行网购？ ', 1, NULL, 1, NULL, 458752, 24, '{
  \"options\": [{\"label\": \"电脑\", \"value\": 1}, {\"label\": \"手机\", \"value\": 2}, {\"label\": \"电脑和手机都常用\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (548, '9dbf35a35f7a4aeb849c4715cea996e2', '107', 'RADIO', '你知道“双十一”狂欢活动吗？ ', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"知道\", \"value\": 1}, {\"label\": \"不知道\", \"value\": 2}]}', NULL, '2021-01-11 13:58:34',
        '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (549, '9dbf35a35f7a4aeb849c4715cea996e2', '108', 'RADIO', '你通过什么途径得知“双十一”狂欢活动的？ ', 1, NULL, 1, NULL, 589824, 24,
        '{
          \"options\": [{\"label\": \"户外灯箱广告\", \"value\": 1}, {\"label\": \"报纸杂志\", \"value\": 2}, {\"label\": \"电视\", \"value\": 3}, {\"label\": \"网络\", \"value\": 4}, {\"label\": \"朋友告诉\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (550, '9dbf35a35f7a4aeb849c4715cea996e2', '109', 'RADIO', '你觉得双十一最吸引你去网上购物的影响因素有？ ', 1, NULL, 1, NULL, 655360,
        24, '{
    \"options\": [{\"label\": \"价格吸引\", \"value\": 1}, {\"label\": \"为了使用活动的优惠券现金券\", \"value\": 2}, {\"label\": \"感到新奇\", \"value\": 3}, {\"label\": \"正好有购物需求\", \"value\": 4}, {\"label\": \"其他\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (551, '9dbf35a35f7a4aeb849c4715cea996e2', '110', 'RADIO', '你认为“双十一”的商品比平常便宜吗？ ', 1, NULL, 1, NULL, 720896, 24, '{
  \"options\": [{\"label\": \"便宜很多\", \"value\": 1}, {\"label\": \"便宜一点点\", \"value\": 2}, {\"label\": \"跟平时价格一样\", \"value\": 3}, {\"label\": \"反而还比平时卖得贵\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (552, '9dbf35a35f7a4aeb849c4715cea996e2', '111', 'RADIO', '你在“双十一”消费中遇到过哪些问题？ ', 1, NULL, 1, NULL, 786432, 24, '{
  \"options\": [{\"label\": \"没遇到过\", \"value\": 1}, {\"label\": \"容易缺货\", \"value\": 2}, {\"label\": \"先涨价后降价的假优惠\", \"value\": 3}, {\"label\": \"物流紧张，延时发货\", \"value\": 4}, {\"label\": \"店小二服务沟通不及时\", \"value\": 5}, {\"label\": \"退换货困难，理赔困难\", \"value\": 6}, {\"label\": \"产品以次充好\", \"value\": 7}, {\"label\": \"其他\", \"value\": 8}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (553, '9dbf35a35f7a4aeb849c4715cea996e2', '112', 'RADIO', '你有参与过“双十一”购物网站推出的促销活动吗？ ', 1, NULL, 1, NULL, 851968,
        24, '{
    \"options\": [{\"label\": \"有\", \"value\": 1}, {\"label\": \"没有\", \"value\": 2}]}', NULL, '2021-01-11 13:58:34',
        '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (554, '9dbf35a35f7a4aeb849c4715cea996e2', '113', 'RADIO', '你参与过以下哪些购物网站的“双十一”狂欢活动？ ', 1, NULL, 1, NULL, 917504,
        24, '{
    \"options\": [{\"label\": \"淘宝网\", \"value\": 1}, {\"label\": \"天猫商城\", \"value\": 2}, {\"label\": \"唯品会\", \"value\": 3}, {\"label\": \"京东商城\", \"value\": 4}, {\"label\": \"聚美优品\", \"value\": 5}, {\"label\": \"苏宁易购\", \"value\": 6}, {\"label\": \"亚马逊\", \"value\": 7}, {\"label\": \"其他\", \"value\": 8}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (555, '9dbf35a35f7a4aeb849c4715cea996e2', '114', 'RADIO', '你通过哪种途径得知网的“双十一”广告？ ', 1, NULL, 1, NULL, 983040, 24,
        '{
          \"options\": [{\"label\": \"户外灯箱广告\", \"value\": 1}, {\"label\": \"报纸杂志\", \"value\": 2}, {\"label\": \"电视\", \"value\": 3}, {\"label\": \"网络\", \"value\": 4}, {\"label\": \"朋友告诉\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (556, '9dbf35a35f7a4aeb849c4715cea996e2', '115', 'RADIO', '网的哪一种促销方式让你影响深刻？ ', 1, NULL, 1, NULL, 1048576, 24, '{
  \"options\": [{\"label\": \"创意广告宣传片\", \"value\": 1}, {\"label\": \"现金券\", \"value\": 2}, {\"label\": \"网站小游戏，如抽宝箱、抽免单\", \"value\": 3}, {\"label\": \"微博微信的关注和转发\", \"value\": 4}, {\"label\": \"准点抢购\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (557, '9dbf35a35f7a4aeb849c4715cea996e2', '116', 'RADIO', '你会不会因为某种促销方式而产生购买行为？ ', 1, NULL, 1, NULL, 1114112, 24,
        '{
          \"options\": [{\"label\": \"会\", \"value\": 1}, {\"label\": \"不会 ——跳过下一题\", \"value\": 2}, {\"label\": \"具体是哪种方式，请补充 [单行主观]\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (558, '9dbf35a35f7a4aeb849c4715cea996e2', '117', 'RADIO', '当你看到网的“双十一”推广信息时，选择打开页面的原因是？ ', 1, NULL, 1, NULL,
        1179648, 24, '{
    \"options\": [{\"label\": \"恰好看到自己想买的\", \"value\": 1}, {\"label\": \"全网最低价等广告语的吸引\", \"value\": 2}, {\"label\": \"有好玩的相关活动小游戏，如抽宝箱\", \"value\": 3}, {\"label\": \"图片上显示出优惠，想认真了解\", \"value\": 4}, {\"label\": \"知名品牌促销\", \"value\": 5}, {\"label\": \"正好有我喜欢的名人明星\", \"value\": 6}, {\"label\": \"其他\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (559, '9dbf35a35f7a4aeb849c4715cea996e2', '118', 'RADIO', '你对网发放的优惠券作何评价？ ', 1, NULL, 1, NULL, 1245184, 24, '{
  \"options\": [{\"label\": \"很有用，真的有享受到优惠\", \"value\": 1}, {\"label\": \"感觉没什么用，使用的门槛过高\", \"value\": 2}, {\"label\": \"没感觉 ，觉得可有可无\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (560, '9dbf35a35f7a4aeb849c4715cea996e2', '119', 'RADIO', '你参加过网“双十一”的抢红包活动吗？ ', 1, NULL, 1, NULL, 1310720, 24,
        '{
          \"options\": [{\"label\": \"有\", \"value\": 1}, {\"label\": \"没有\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (561, '9dbf35a35f7a4aeb849c4715cea996e2', '120', 'RATE', '请你为网的“双十一”活动打个分 ', 1, NULL, 1, NULL, 1376256, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:34', '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (562, '9dbf35a35f7a4aeb849c4715cea996e2', '122', 'RADIO', '你还愿意参加网2015年的“双十一”活动吗？ ', 1, NULL, 1, NULL, 1441792,
        24, '{
    \"options\": [{\"label\": \"愿意\", \"value\": 1}, {\"label\": \"不愿意\", \"value\": 2}]}', NULL, '2021-01-11 13:58:34',
        '2021-01-11 13:58:34', 0);
INSERT INTO `pr_project_template_item`
VALUES (563, '24f0b168b6724534ba36c21087c39778', '100', 'RADIO', '您是否参加了去年的xx网“双十一”活动 ', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:35',
        '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (564, '24f0b168b6724534ba36c21087c39778', '101', 'RADIO', '您没有参加xx网“双十一”的原因 ', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"没有购物需求\", \"value\": 1}, {\"label\": \"觉得这只是商家的宣传手段\", \"value\": 2}, {\"label\": \"不追求低价商品\", \"value\": 3}, {\"label\": \"物流太慢\", \"value\": 4}, {\"label\": \"已经参加其他网站“双十一”活动了\", \"value\": 0}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (565, '24f0b168b6724534ba36c21087c39778', '102', 'RADIO', '您周围的人参加双十一后，最普遍的反响是 ', 1, NULL, 1, NULL, 196608, 24,
        '{
          \"options\": [{\"label\": \"非常满意\", \"value\": 1}, {\"label\": \"觉得没什么特别的\", \"value\": 2}, {\"label\": \"觉得自己吃亏或是受骗了\", \"value\": 3}, {\"label\": \"不清楚\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (566, '24f0b168b6724534ba36c21087c39778', '103', 'RADIO', '您参加xx网“双十一”活动的原因是 ', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"受周围人的影响\", \"value\": 1}, {\"label\": \"网络宣传声势浩大\", \"value\": 2}, {\"label\": \"有购物的需求\", \"value\": 3}, {\"label\": \"其他\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (567, '24f0b168b6724534ba36c21087c39778', '104', 'RATE', '在“双十一”活动中您会购买很多减价但不需要的商品 ', 1, NULL, 1, NULL, 327680,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (568, '24f0b168b6724534ba36c21087c39778', '105', 'RATE', '您会关注自己之前已经认准的品牌/店铺，而不是在整个xx网内搜索商品 ', 1, NULL, 1, NULL,
        393216, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (569, '24f0b168b6724534ba36c21087c39778', '106', 'RATE', '您发现自己所购买的商品在“双十一”活动过后并没有抬价 ', 1, NULL, 1, NULL, 458752,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (570, '24f0b168b6724534ba36c21087c39778', '107', 'RATE', '您在“双十一”后将已购买的（部分或全部）商品退货 ', 1, NULL, 1, NULL, 524288,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (571, '24f0b168b6724534ba36c21087c39778', '108', 'RATE', '您还愿意继续参加xx网“双十一”活动 ', 1, NULL, 1, NULL, 589824, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (572, '24f0b168b6724534ba36c21087c39778', '109', 'RATE', '您愿意参加以后xx网“双十一”活动  ', 1, NULL, 1, NULL, 655360, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (573, '24f0b168b6724534ba36c21087c39778', '113', 'RADIO', '您的平均月收入（或每月生活费）是 ', 1, NULL, 1, NULL, 720896, 24, '{
  \"options\": [{\"label\": \"1000元以下\", \"value\": 1}, {\"label\": \"1001-2000元\", \"value\": 2}, {\"label\": \"2001-3000元\", \"value\": 3}, {\"label\": \"3001-5000元\", \"value\": 4}, {\"label\": \"5001-8000元\", \"value\": 5}, {\"label\": \"8001-10000元\", \"value\": 6}, {\"label\": \"10001-20000元\", \"value\": 7}, {\"label\": \"20000元以上\", \"value\": 8}, {\"label\": \"不方便透露\", \"value\": 9}]}',
        NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (574, '24f0b168b6724534ba36c21087c39778', '114', 'RADIO', '您每月的购物花销大概是 ', 1, NULL, 1, NULL, 786432, 24, '{
  \"options\": [{\"label\": \"100元以内\", \"value\": 1}, {\"label\": \"100-200元\", \"value\": 2}, {\"label\": \"201-500元\", \"value\": 3}, {\"label\": \"501-1000元\", \"value\": 4}, {\"label\": \"1001-2000元\", \"value\": 5}, {\"label\": \"2001-5000元\", \"value\": 6}, {\"label\": \"5000元以上\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (575, '24f0b168b6724534ba36c21087c39778', '115', 'RADIO', '您每月在网上购物的平均花销是 ', 1, NULL, 1, NULL, 851968, 24, '{
  \"options\": [{\"label\": \"100元以内\", \"value\": 1}, {\"label\": \"100-200元\", \"value\": 2}, {\"label\": \"201-500元\", \"value\": 3}, {\"label\": \"501-1000元\", \"value\": 4}, {\"label\": \"1001-2000元\", \"value\": 5}, {\"label\": \"2001-5000元\", \"value\": 6}, {\"label\": \"5000元以上\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (576, '24f0b168b6724534ba36c21087c39778', '116', 'INPUT', '您的手机号码是： ', 1, NULL, 1, NULL, 917504, 24, '{}', NULL,
        '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (577, '438d94a1c0c6426d85f9df17977a78a1', '100', 'RADIO', '你喜欢网购吗？', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"喜欢\", \"value\": 1}, {\"label\": \"不喜欢\", \"value\": 2}]}', NULL, '2021-01-11 13:58:35',
        '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (578, '438d94a1c0c6426d85f9df17977a78a1', '101', 'RADIO', '网购时，你会在意卖家的信誉度以及买家的评论吗？', 1, NULL, 1, NULL, 131072,
        24, '{
    \"options\": [{\"label\": \"在意\", \"value\": 1}, {\"label\": \"不在意\", \"value\": 2}]}', NULL, '2021-01-11 13:58:35',
        '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (579, '438d94a1c0c6426d85f9df17977a78a1', '102', 'RADIO', '你在网购时出现过哪些问题？(可多选)', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"没问题\", \"value\": 1}, {\"label\": \"产品质量问题\", \"value\": 2}, {\"label\": \"退换货问题\", \"value\": 3}, {\"label\": \"实际产品与图文不符\", \"value\": 4}, {\"label\": \"买到假冒伪劣产品\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (580, '438d94a1c0c6426d85f9df17977a78a1', '103', 'RADIO', '如果出现以上的问题时，你会选择？', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"忍气吞声，直接给差评\", \"value\": 1}, {\"label\": \"与卖家协商，要求退款或换货\", \"value\": 2}, {\"label\": \"向淘宝客服投诉解决\", \"value\": 3}, {\"label\": \"拨打当地的12315进行投诉维权\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (581, '438d94a1c0c6426d85f9df17977a78a1', '104', 'RADIO', '鉴收包裹时，您有先验货后鉴收的习惯吗？', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"一直都有\", \"value\": 1}, {\"label\": \"没有\", \"value\": 2}, {\"label\": \"偶尔有\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (582, '438d94a1c0c6426d85f9df17977a78a1', '105', 'RADIO', '你觉得网络购物可靠吗？', 1, NULL, 1, NULL, 393216, 24, '{
  \"options\": [{\"label\": \"可靠\", \"value\": 1}, {\"label\": \"不可靠\", \"value\": 2}]}', NULL, '2021-01-11 13:58:35',
        '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (583, '438d94a1c0c6426d85f9df17977a78a1', '106', 'RADIO', '你会在网吧等公共场所登录自己的网银账号吗？', 1, NULL, 1, NULL, 458752, 24,
        '{
          \"options\": [{\"label\": \"会\", \"value\": 1}, {\"label\": \"不会\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (584, '438d94a1c0c6426d85f9df17977a78a1', '107', 'RADIO', '你有没有一张专用的网银卡且上面仅存一定数额的资金', 1, NULL, 1, NULL, 524288,
        24, '{
    \"options\": [{\"label\": \"有\", \"value\": 1}, {\"label\": \"没有\", \"value\": 2}]}', NULL, '2021-01-11 13:58:35',
        '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (585, '438d94a1c0c6426d85f9df17977a78a1', '108', 'RADIO', '对于卖家发过来的链接你会随便点开并输入网银进行支付吗?', 1, NULL, 1, NULL,
        589824, 24, '{
    \"options\": [{\"label\": \"会\", \"value\": 1}, {\"label\": \"不会\", \"value\": 2}]}', NULL, '2021-01-11 13:58:35',
        '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (586, '438d94a1c0c6426d85f9df17977a78a1', '109', 'RADIO', '网购时，你一般会使用快捷支付还是网银支付', 1, NULL, 1, NULL, 655360, 24,
        '{
          \"options\": [{\"label\": \"快捷支付\", \"value\": 1}, {\"label\": \"网银支付\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (587, 'e4d62cfe7eda413a8538f524b4f2156f', '100', 'RADIO', '入驻xx网的时间 ', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"小于1年\", \"value\": 1}, {\"label\": \"1-2年\", \"value\": 2}, {\"label\": \"2-3年\", \"value\": 3}, {\"label\": \"3年以上\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (588, 'e4d62cfe7eda413a8538f524b4f2156f', '101', 'RADIO', '您在xx网每月店铺的成交额是 ', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"小于5W\", \"value\": 1}, {\"label\": \"5W-10W\", \"value\": 2}, {\"label\": \"10W-50W\", \"value\": 3}, {\"label\": \"50W-100W\", \"value\": 4}, {\"label\": \"100W以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (589, 'e4d62cfe7eda413a8538f524b4f2156f', '102', 'RADIO', '是否在xx网以外的平台有店铺 ', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"没有\", \"value\": 1}, {\"label\": \"有\", \"value\": 2}]}', NULL, '2021-01-11 13:58:35',
        '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (590, 'e4d62cfe7eda413a8538f524b4f2156f', '103', 'RADIO', '您还在哪些平台有店铺 ', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"淘宝\", \"value\": 1}, {\"label\": \"天猫\", \"value\": 2}, {\"label\": \"京东\", \"value\": 3}, {\"label\": \"亚马逊\", \"value\": 4}, {\"label\": \"苏宁\", \"value\": 5}, {\"label\": \"当当\", \"value\": 6}, {\"label\": \"其他\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (591, 'e4d62cfe7eda413a8538f524b4f2156f', '104', 'RADIO', '目前店铺有几个客服提供服务 ', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"1个\", \"value\": 1}, {\"label\": \"2-3个\", \"value\": 2}, {\"label\": \"4-5个\", \"value\": 3}, {\"label\": \"5个以上\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (592, 'e4d62cfe7eda413a8538f524b4f2156f', '105', 'RADIO', '是否使用过外包服务 ', 1, NULL, 1, NULL, 393216, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:35',
        '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (593, 'e4d62cfe7eda413a8538f524b4f2156f', '100', 'RADIO', '你认为使用客服外包有哪些好处 ', 1, NULL, 1, NULL, 458752, 24, '{
  \"options\": [{\"label\": \"降低成本\", \"value\": 1}, {\"label\": \"服务更专业\", \"value\": 2}, {\"label\": \"可全天值班\", \"value\": 3}, {\"label\": \"没有太多好处\", \"value\": 4}, {\"label\": \"其他\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (594, 'e4d62cfe7eda413a8538f524b4f2156f', '100', 'RADIO', '是否使用过店铺代运营服务 ', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:35',
        '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (595, 'e4d62cfe7eda413a8538f524b4f2156f', '100', 'INPUT', '目前合作的代运营公司名称 ', 1, NULL, 1, NULL, 589824, 24, '{}',
        NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (596, 'e4d62cfe7eda413a8538f524b4f2156f', '101', 'RADIO', '对现在服务的代运营公司效果是否满意 ', 1, NULL, 1, NULL, 655360, 24, '{
  \"options\": [{\"label\": \"满意\", \"value\": 1}, {\"label\": \"一般\", \"value\": 2}, {\"label\": \"不满意\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (597, 'e4d62cfe7eda413a8538f524b4f2156f', '102', 'RADIO', '目前合作的代运营收费方式 ', 1, NULL, 1, NULL, 720896, 24, '{
  \"options\": [{\"label\": \"只收基础服务费\", \"value\": 1}, {\"label\": \"基础服务费+店铺交易提成\", \"value\": 2}, {\"label\": \"店铺交易提成\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (598, 'e4d62cfe7eda413a8538f524b4f2156f', '103', 'INPUT', '代运营每个月需支付多少费用 ', 1, NULL, 1, NULL, 786432, 24, '{}',
        NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (599, 'e4d62cfe7eda413a8538f524b4f2156f', '104', 'RADIO', '选择代运营的初衷是什么 ', 1, NULL, 1, NULL, 851968, 24, '{
  \"options\": [{\"label\": \"传统企业不知道如何运营，专业的人做专业的事\", \"value\": 1}, {\"label\": \"前期不想组建运营团队，便于控制风险\", \"value\": 2}, {\"label\": \"降低成本投入\", \"value\": 3}, {\"label\": \"销量到了瓶颈，不知道如何提升\", \"value\": 4}, {\"label\": \"学习下代运营公司如何操作，便于后续自己运营\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (600, 'e4d62cfe7eda413a8538f524b4f2156f', '100', 'RADIO', '目前没有使用代运营的原因？ ', 1, NULL, 1, NULL, 917504, 24, '{
  \"options\": [{\"label\": \"公司已有专业的团队负责运营\", \"value\": 1}, {\"label\": \"担心效果不好\", \"value\": 2}, {\"label\": \"有意向使用代运营，但还没开始洽谈\", \"value\": 3}, {\"label\": \"不了解有代运营这种服务\", \"value\": 4}, {\"label\": \"其他\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (601, 'e4d62cfe7eda413a8538f524b4f2156f', '100', 'RADIO', '运营过程中那块觉得最难做需要外包 ', 1, NULL, 1, NULL, 983040, 24, '{
  \"options\": [{\"label\": \"店铺装修\", \"value\": 1}, {\"label\": \"商品详情\", \"value\": 2}, {\"label\": \"营销\", \"value\": 3}, {\"label\": \"商品管理\", \"value\": 4}, {\"label\": \"订单管理\", \"value\": 5}, {\"label\": \"客服\", \"value\": 6}, {\"label\": \"仓储配送\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (602, 'e4d62cfe7eda413a8538f524b4f2156f', '101', 'RADIO', '是否希望XX网为你推荐代运营公司 ', 1, NULL, 1, NULL, 1048576, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:35',
        '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (603, '73eb5cad65b84e4ea60a116e3786d487', '100', 'RADIO', '您的办公地点在', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"市中心CBD\", \"value\": 1}, {\"label\": \"市区\", \"value\": 2}, {\"label\": \"近郊\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (604, '73eb5cad65b84e4ea60a116e3786d487', '101', 'RADIO', '您的职业类型', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"在校学生\", \"value\": 1}, {\"label\": \"政府/机关干部/公务员\", \"value\": 2}, {\"label\": \"企业管理者（包括基层及中高层管理者）\", \"value\": 3}, {\"label\": \"普通职员（办公室/写字楼工作人员）\", \"value\": 4}, {\"label\": \"专业人员（如医生/律师/文体/记者/老师等）\", \"value\": 5}, {\"label\": \"普通工人（如工厂工人/体力劳动者等）\", \"value\": 6}, {\"label\": \"商业服务业职工（如销售人员/商店职员/服务员等）\", \"value\": 7}, {\"label\": \"个体经营者/承包商\", \"value\": 8}, {\"label\": \"自由职业者\", \"value\": 9}, {\"label\": \"农林牧渔劳动者\", \"value\": 10}, {\"label\": \"退休\", \"value\": 11}, {\"label\": \"暂无职业\", \"value\": 12}, {\"label\": \"其他\", \"value\": 13}]}',
        NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (605, '73eb5cad65b84e4ea60a116e3786d487', '102', 'RADIO', '您的月收入（或每月生活费）', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"1000元以下\", \"value\": 1}, {\"label\": \"1001-2000元\", \"value\": 2}, {\"label\": \"2001-3000元\", \"value\": 3}, {\"label\": \"3001-5000元\", \"value\": 4}, {\"label\": \"5001-8000元\", \"value\": 5}, {\"label\": \"8001-10000元\", \"value\": 6}, {\"label\": \"10001-20000元\", \"value\": 7}, {\"label\": \"20000元以上\", \"value\": 8}, {\"label\": \"不方便透露\", \"value\": 9}]}',
        NULL, '2021-01-11 13:58:35', '2021-01-11 13:58:35', 0);
INSERT INTO `pr_project_template_item`
VALUES (606, '73eb5cad65b84e4ea60a116e3786d487', '103', 'RADIO', '您是否拥有充足的午休时间', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:36',
        '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (607, '73eb5cad65b84e4ea60a116e3786d487', '104', 'RADIO', '您的午餐时间一般为是？', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"30分钟以内\", \"value\": 1}, {\"label\": \"30-60分钟\", \"value\": 2}, {\"label\": \"1小时-1个半小时\", \"value\": 3}, {\"label\": \"一个半小时以上\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (608, '73eb5cad65b84e4ea60a116e3786d487', '105', 'RADIO', '工作时最常见的用餐形式', 1, NULL, 1, NULL, 393216, 24, '{
  \"options\": [{\"label\": \"回家用餐\", \"value\": 1}, {\"label\": \"去饭堂/食堂\", \"value\": 2}, {\"label\": \"就近的餐馆用餐\", \"value\": 3}, {\"label\": \"点外卖\", \"value\": 4}, {\"label\": \"带饭\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (609, '73eb5cad65b84e4ea60a116e3786d487', '106', 'RADIO', '到店用餐时，您是否遇到过以下情况？', 1, NULL, 1, NULL, 458752, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:36',
        '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (610, '73eb5cad65b84e4ea60a116e3786d487', '107', 'RADIO', '您是否听说过有App可以在线点餐？', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:36',
        '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (611, '73eb5cad65b84e4ea60a116e3786d487', '108', 'RADIO', '您主要通过什么途径了解到点餐App的呢？', 1, NULL, 1, NULL, 589824, 24,
        '{
          \"options\": [{\"label\": \"朋友推荐\", \"value\": 1}, {\"label\": \"网络广告\", \"value\": 2}, {\"label\": \"户外广告\", \"value\": 3}, {\"label\": \"电视、报刊\", \"value\": 4}, {\"label\": \"偶尔链接\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (612, '73eb5cad65b84e4ea60a116e3786d487', '109', 'RADIO', '您是否愿意使用点餐App呢？', 1, NULL, 1, NULL, 655360, 24, '{
  \"options\": [{\"label\": \"愿意\", \"value\": 1}, {\"label\": \"不愿意\", \"value\": 2}, {\"label\": \"看情况\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (613, '73eb5cad65b84e4ea60a116e3786d487', '110', 'RADIO', '您选择的点餐App终端是？', 1, NULL, 1, NULL, 720896, 24, '{
  \"options\": [{\"label\": \"淘点点\", \"value\": 1}, {\"label\": \"饿了么\", \"value\": 2}, {\"label\": \"团购网（美团、百度糯米等）\", \"value\": 3}, {\"label\": \"点餐网\", \"value\": 4}, {\"label\": \"大众点评网\", \"value\": 5}, {\"label\": \"餐厅自身开发的App\", \"value\": 6}, {\"label\": \"美味不用等\", \"value\": 7}, {\"label\": \"其他\", \"value\": 8}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (614, '73eb5cad65b84e4ea60a116e3786d487', '111', 'RADIO', '对于点餐App，你最希望有的三项功能是：', 1, NULL, 1, NULL, 786432, 24,
        '{
          \"options\": [{\"label\": \"在线订位\", \"value\": 1}, {\"label\": \"优惠信息\", \"value\": 2}, {\"label\": \"自助点餐\", \"value\": 3}, {\"label\": \"排队叫号\", \"value\": 4}, {\"label\": \"附近餐厅的位置\", \"value\": 5}, {\"label\": \"随手拍的评价\", \"value\": 6}, {\"label\": \"餐厅信息\", \"value\": 7}, {\"label\": \"积分换礼\", \"value\": 8}, {\"label\": \"其他\", \"value\": 9}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (615, '73eb5cad65b84e4ea60a116e3786d487', '112', 'RADIO', '关于点餐App，您会担心的问题是？', 1, NULL, 1, NULL, 851968, 24, '{
  \"options\": [{\"label\": \"食品质量\", \"value\": 1}, {\"label\": \"配送及时性\", \"value\": 2}, {\"label\": \"信息描述的真实性\", \"value\": 3}, {\"label\": \"支付手段\", \"value\": 4}, {\"label\": \"网络安全\", \"value\": 5}, {\"label\": \"消费者权益保护\", \"value\": 6}, {\"label\": \"其他\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (616, '73eb5cad65b84e4ea60a116e3786d487', '113', 'RADIO', '总而言之，您对点餐App的态度是：', 1, NULL, 1, NULL, 917504, 24, '{
  \"options\": [{\"label\": \"它会越来越被人们接受，发展空间很大\", \"value\": 1}, {\"label\": \"不怎么样，还存在很多令人担心的问题\", \"value\": 2}, {\"label\": \"短期内，不会有很大的发展\", \"value\": 3}, {\"label\": \"其他\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (617, '9eb7a3477b8843198d24bad37587731b', '100', 'RADIO', '以下菜品中，哪类是您更常品尝的款式？', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"粤菜\", \"value\": 1}, {\"label\": \"川湘菜\", \"value\": 2}, {\"label\": \"其他地方菜系（江浙菜、西北菜等）\", \"value\": 3}, {\"label\": \"火锅\", \"value\": 4}, {\"label\": \"西餐\", \"value\": 5}, {\"label\": \"日韩料理\", \"value\": 6}, {\"label\": \"南亚（泰国，越南）\", \"value\": 7}, {\"label\": \"墨西哥菜\", \"value\": 8}, {\"label\": \"地方特色小吃\", \"value\": 9}, {\"label\": \"其他\", \"value\": 10}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (618, '9eb7a3477b8843198d24bad37587731b', '101', 'RADIO', '您希望我们提供哪个时段供餐？', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"早餐\", \"value\": 1}, {\"label\": \"午餐\", \"value\": 2}, {\"label\": \"下午茶\", \"value\": 3}, {\"label\": \"晚餐\", \"value\": 4}, {\"label\": \"夜宵\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (619, '9eb7a3477b8843198d24bad37587731b', '102', 'RADIO', '餐厅装修风格，您跟喜欢在哪种环境下就餐？', 1, NULL, 1, NULL, 196608, 24,
        '{
          \"options\": [{\"label\": \"简约时尚\", \"value\": 1}, {\"label\": \"商务休闲\", \"value\": 2}, {\"label\": \"高档气派\", \"value\": 3}, {\"label\": \"主题文化特色\", \"value\": 4}, {\"label\": \"绿化/水景等\", \"value\": 5}, {\"label\": \"无特别要求，无所谓\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (620, '9eb7a3477b8843198d24bad37587731b', '103', 'RADIO', '餐厅的采光和照明，哪种感觉让你更舒服？', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"明亮通透\", \"value\": 1}, {\"label\": \"柔和舒适\", \"value\": 2}, {\"label\": \"静谧隐私\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (621, '9eb7a3477b8843198d24bad37587731b', '104', 'RADIO', '您是否希望在就餐时有以下音乐伴随？', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"不需要音乐\", \"value\": 1}, {\"label\": \"轻音乐伴奏，无人声\", \"value\": 2}, {\"label\": \"流行音乐\", \"value\": 3}, {\"label\": \"古典音乐\", \"value\": 4}, {\"label\": \"民俗音乐\", \"value\": 5}, {\"label\": \"电台电视\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (622, '9eb7a3477b8843198d24bad37587731b', '105', 'RADIO', '您希望餐厅多久推出一次新菜品？', 1, NULL, 1, NULL, 393216, 24, '{
  \"options\": [{\"label\": \"每月1次\", \"value\": 1}, {\"label\": \"三月1次\", \"value\": 2}, {\"label\": \"半年到一年1次\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (623, '9eb7a3477b8843198d24bad37587731b', '106', 'RADIO', '为此，您一次消费愿意支付多少元？', 1, NULL, 1, NULL, 458752, 24, '{
  \"options\": [{\"label\": \"30元以下\", \"value\": 1}, {\"label\": \"30-50元\", \"value\": 2}, {\"label\": \"50-80元\", \"value\": 3}, {\"label\": \"80-100元\", \"value\": 4}, {\"label\": \"100元以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (624, '9eb7a3477b8843198d24bad37587731b', '107', 'RADIO', '为此，您一周会光顾多少次自助餐厅？', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"2次以下\", \"value\": 1}, {\"label\": \"3-5次\", \"value\": 2}, {\"label\": \"6-10次\", \"value\": 3}, {\"label\": \"10次以上\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (625, '9eb7a3477b8843198d24bad37587731b', '108', 'RADIO', '在就餐过程中，哪些因素会让您很不满意？', 1, NULL, 1, NULL, 589824, 24, '{
  \"options\": [{\"label\": \"饭菜中出现异味\", \"value\": 1}, {\"label\": \"餐具不卫生\", \"value\": 2}, {\"label\": \"服务人员怠慢\", \"value\": 3}, {\"label\": \"虚假宣传\", \"value\": 4}, {\"label\": \"等餐时间过长\", \"value\": 5}, {\"label\": \"不主动提供发票\", \"value\": 6}, {\"label\": \"不允许自带酒水\", \"value\": 7}, {\"label\": \"另外收费的项目没有事先提醒\", \"value\": 8}, {\"label\": \"其他\", \"value\": 9}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (626, '9eb7a3477b8843198d24bad37587731b', '109', 'RADIO', '您是否需要以下增值服务？', 1, NULL, 1, NULL, 655360, 24, '{
  \"options\": [{\"label\": \"自助餐\", \"value\": 1}, {\"label\": \"咖啡吧\", \"value\": 2}, {\"label\": \"VIP包间\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (627, '9eb7a3477b8843198d24bad37587731b', '110', 'RADIO', '咖啡吧，您希望咖啡吧提供哪些出品？', 1, NULL, 1, NULL, 720896, 24, '{
  \"options\": [{\"label\": \"咖啡，饮品\", \"value\": 1}, {\"label\": \"西点，甜点\", \"value\": 2}, {\"label\": \"西式简餐\", \"value\": 3}, {\"label\": \"时令冷/热饮\", \"value\": 4}, {\"label\": \"无\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (628, '9eb7a3477b8843198d24bad37587731b', '111', 'RADIO', 'VIP包间，您希望我们提供哪些服务？', 1, NULL, 1, NULL, 786432, 24, '{
  \"options\": [{\"label\": \"西式宴请\", \"value\": 1}, {\"label\": \"中式宴请\", \"value\": 2}, {\"label\": \"无\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (629, '3ff5045669a24a229e384966854c2c03', '100', 'RADIO', '在xx餐厅就餐前，您是通过什么途径得知我们的 ?', 1, NULL, 1, NULL, 65536,
        24, '{
    \"options\": [{\"label\": \"亲友推荐\", \"value\": 1}, {\"label\": \"网络推荐\", \"value\": 2}, {\"label\": \"团购活动\", \"value\": 3}, {\"label\": \"促销优惠券\", \"value\": 4}, {\"label\": \"宣传广告\", \"value\": 5}, {\"label\": \"走路经过时发现的\", \"value\": 6}, {\"label\": \"其他\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (630, '3ff5045669a24a229e384966854c2c03', '101', 'RADIO', '您在本餐厅进餐时，最关心的问题是？', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"餐厅环境\", \"value\": 1}, {\"label\": \"服务质量\", \"value\": 2}, {\"label\": \"服务效率\", \"value\": 3}, {\"label\": \"礼貌待客\", \"value\": 4}, {\"label\": \"环境礼节\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (631, '3ff5045669a24a229e384966854c2c03', '102', 'RADIO', '在您就餐过程中，最关心的是？', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"分量大小\", \"value\": 1}, {\"label\": \"菜肴口味\", \"value\": 2}, {\"label\": \"菜品装饰\", \"value\": 3}, {\"label\": \"冷热搭配\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (632, '3ff5045669a24a229e384966854c2c03', '103', 'RATE', '您对本餐厅的整体满意度是？ ', 1, NULL, 1, NULL, 262144, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (633, '3ff5045669a24a229e384966854c2c03', '104', 'RADIO', '您觉得本餐厅最大的三个特点是？', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"价格便宜\", \"value\": 1}, {\"label\": \"口味适合\", \"value\": 2}, {\"label\": \"菜式新颖\", \"value\": 3}, {\"label\": \"卫生好\", \"value\": 4}, {\"label\": \"装饰格调好\", \"value\": 5}, {\"label\": \"品牌档次佳\", \"value\": 6}, {\"label\": \"服务周到\", \"value\": 7}, {\"label\": \"方便快捷\", \"value\": 8}, {\"label\": \"朋友推荐\", \"value\": 9}, {\"label\": \"优惠活动\", \"value\": 10}, {\"label\": \"交通便利\", \"value\": 11}, {\"label\": \"停车位充足\", \"value\": 12}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (634, '3ff5045669a24a229e384966854c2c03', '105', 'RATE', '您认为本餐厅“菜式新颖”描述的符合程度是 ', 1, NULL, 1, NULL, 393216, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (635, '3ff5045669a24a229e384966854c2c03', '106', 'RATE', '您认为本餐厅“环境优美，品质高”描述的符合程度是？', 1, NULL, 1, NULL, 458752,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (636, '3ff5045669a24a229e384966854c2c03', '107', 'RATE', '您对本餐厅桌椅布置摆放满意程度？', 1, NULL, 1, NULL, 524288, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (637, '3ff5045669a24a229e384966854c2c03', '108', 'RADIO', '您在外就餐时，选择本餐厅的比率约是？', 1, NULL, 1, NULL, 589824, 24, '{
  \"options\": [{\"label\": \"20%以下\", \"value\": 1}, {\"label\": \"21-40%\", \"value\": 2}, {\"label\": \"41-60%\", \"value\": 3}, {\"label\": \"61-80%\", \"value\": 4}, {\"label\": \"81-100%\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (638, '3ff5045669a24a229e384966854c2c03', '109', 'RADIO', '您对本餐厅菜肴价格是否合理？', 1, NULL, 1, NULL, 655360, 24, '{
  \"options\": [{\"label\": \"过高\", \"value\": 1}, {\"label\": \"适中\", \"value\": 2}, {\"label\": \"合理\", \"value\": 3}, {\"label\": \"较低\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (639, '3ff5045669a24a229e384966854c2c03', '110', 'RATE', '您对本餐厅餐饮服务人员形象的满意度作出评价', 1, NULL, 1, NULL, 720896, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (640, '3ff5045669a24a229e384966854c2c03', '111', 'RADIO', '您觉得就餐时服务员应与您保持的距离应保持？', 1, NULL, 1, NULL, 786432, 24,
        '{
          \"options\": [{\"label\": \"桌边\", \"value\": 1}, {\"label\": \"桌边稍远\", \"value\": 2}, {\"label\": \"不妨碍聚餐即可\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (641, '3ff5045669a24a229e384966854c2c03', '112', 'RADIO', '请问您的职业是？', 1, NULL, 1, NULL, 851968, 24, '{
  \"options\": [{\"label\": \"在校学生\", \"value\": 1}, {\"label\": \"政府/机关干部/公务员\", \"value\": 2}, {\"label\": \"企业管理者（包括基层及中高层管理者）\", \"value\": 3}, {\"label\": \"普通职员（办公室/写字楼工作人员）\", \"value\": 4}, {\"label\": \"专业人员（如医生/律师/文体/记者/老师等）\", \"value\": 5}, {\"label\": \"普通工人（如工厂工人/体力劳动者等）\", \"value\": 6}, {\"label\": \"商业服务业职工（如销售人员/商店职员/服务员等）\", \"value\": 7}, {\"label\": \"个体经营者/承包商\", \"value\": 8}, {\"label\": \"自由职业者\", \"value\": 9}, {\"label\": \"农林牧渔劳动者\", \"value\": 10}, {\"label\": \"退休\", \"value\": 11}, {\"label\": \"暂无职业\", \"value\": 12}, {\"label\": \"其他\", \"value\": 13}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (642, '3ff5045669a24a229e384966854c2c03', '113', 'RATE', '请您对我们餐饮服务质量的评价是？', 1, NULL, 1, NULL, 917504, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (643, '546151677b724bf7ac48dbbce1f3a557', '100', 'RADIO', '请问您的餐厅是否提供外卖服务', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"提供\", \"value\": 1}, {\"label\": \"不提供\", \"value\": 2}, {\"label\": \"正计划提供\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (644, '546151677b724bf7ac48dbbce1f3a557', '101', 'RADIO', '您现有或规划的外卖配送员是', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"全部是自己员工\", \"value\": 1}, {\"label\": \"全部是有第三方人员（如“点我吧”等外送公司）\", \"value\": 2}, {\"label\": \"有，以上两类都有\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (645, '546151677b724bf7ac48dbbce1f3a557', '102', 'RADIO', '您为什么会选择与第三方配送公司进行合作', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"节省配送的人力成本\", \"value\": 1}, {\"label\": \"配送更专业\", \"value\": 2}, {\"label\": \"有专门的网站和电话，不需要我们自己操作\", \"value\": 3}, {\"label\": \"其他\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (646, '546151677b724bf7ac48dbbce1f3a557', '103', 'RADIO', '在您的餐厅，到店堂食的顾客平均每天约有', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"0-20人次\", \"value\": 1}, {\"label\": \"20-50人次\", \"value\": 2}, {\"label\": \"51-100人次\", \"value\": 3}, {\"label\": \"101-200人次\", \"value\": 4}, {\"label\": \"201-400人次\", \"value\": 5}, {\"label\": \"400人次以上\", \"value\": 6}, {\"label\": \"不方便透露\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (647, '546151677b724bf7ac48dbbce1f3a557', '104', 'RADIO', '在您的餐厅，外卖订单的数量平均每天约是', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"0-5单\", \"value\": 1}, {\"label\": \"6-10单\", \"value\": 2}, {\"label\": \"11-20单\", \"value\": 3}, {\"label\": \"21-40单\", \"value\": 4}, {\"label\": \"40单以上\", \"value\": 5}, {\"label\": \"不方便透露\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (648, '546151677b724bf7ac48dbbce1f3a557', '105', 'RADIO', '您是否愿意在开通在线外卖业务，让用户可以在网上下单您餐厅的外卖', 1, NULL, 1, NULL,
        393216, 24, '{
    \"options\": [{\"label\": \"愿意\", \"value\": 1}, {\"label\": \"不愿意\", \"value\": 2}]}', NULL, '2021-01-11 13:58:36',
        '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (649, '546151677b724bf7ac48dbbce1f3a557', '106', 'RADIO',
        '如果xx网开通餐厅外卖的自助上线功能，让您可以在电脑上自助填写餐厅信息、外卖菜单，更新到xx网上，您愿意参与吗？', 1, NULL, 1, NULL, 458752, 24, '{
    \"options\": [{\"label\": \"愿意，我们很需要这样的功能\", \"value\": 1}, {\"label\": \"不愿意\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (650, '546151677b724bf7ac48dbbce1f3a557', '107', 'RADIO', '请问您不愿意开通的原因是', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"店里太忙，外卖单配送不过来\", \"value\": 1}, {\"label\": \"我们是连锁店，需要总部同意才能在网上开外卖功能\", \"value\": 2}, {\"label\": \"设备条件不够\", \"value\": 3}, {\"label\": \"自助填写信息比较麻烦\", \"value\": 4}, {\"label\": \"操作不熟悉，不方便\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (651, '546151677b724bf7ac48dbbce1f3a557', '108', 'RADIO', '如果开通在线外卖功能，您餐厅愿意进行哪些宣传推广的措施呢？', 1, NULL, 1, NULL,
        589824, 24, '{
    \"options\": [{\"label\": \"优先配送\", \"value\": 1}, {\"label\": \"价格优惠\", \"value\": 2}, {\"label\": \"赠送代金券/积分\", \"value\": 3}, {\"label\": \"升级为本餐厅会员\", \"value\": 4}, {\"label\": \"店内海报宣传\", \"value\": 5}, {\"label\": \"店员推荐\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:36', '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (652, 'a6e9aeb9eb964e6190145e963a977f6c', '100', 'RADIO', '你的性别 ', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"男\", \"value\": 1}, {\"label\": \"女\", \"value\": 2}]}', NULL, '2021-01-11 13:58:36',
        '2021-01-11 13:58:36', 0);
INSERT INTO `pr_project_template_item`
VALUES (653, 'a6e9aeb9eb964e6190145e963a977f6c', '101', 'RADIO', '您的年龄段是？ ', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"20岁及以下\", \"value\": 1}, {\"label\": \"21-25岁\", \"value\": 2}, {\"label\": \"26-30岁\", \"value\": 3}, {\"label\": \"31-40岁\", \"value\": 4}, {\"label\": \"40岁以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (654, 'a6e9aeb9eb964e6190145e963a977f6c', '102', 'RADIO', '您的月收入（或每月生活费） ', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"1000元以下\", \"value\": 1}, {\"label\": \"1001-2000元\", \"value\": 2}, {\"label\": \"2001-3000元\", \"value\": 3}, {\"label\": \"3001-5000元\", \"value\": 4}, {\"label\": \"5001-8000元\", \"value\": 5}, {\"label\": \"8001-10000元\", \"value\": 6}, {\"label\": \"10001-20000元\", \"value\": 7}, {\"label\": \"20000元以上\", \"value\": 8}, {\"label\": \"不方便透露\", \"value\": 9}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (655, 'a6e9aeb9eb964e6190145e963a977f6c', '103', 'RADIO', '您一般外出就餐花费的时间？ ', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"30分钟以内\", \"value\": 1}, {\"label\": \"30-60分钟\", \"value\": 2}, {\"label\": \"1小时-1个半小时\", \"value\": 3}, {\"label\": \"一个半小时以上\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (656, 'a6e9aeb9eb964e6190145e963a977f6c', '104', 'RADIO', '外出就餐时您经常遇到客满需等位的情况吗？ ', 1, NULL, 1, NULL, 327680, 24,
        '{
          \"options\": [{\"label\": \"没有\", \"value\": 1}, {\"label\": \"偶尔有\", \"value\": 2}, {\"label\": \"经常有\", \"value\": 3}, {\"label\": \"其他\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (657, 'a6e9aeb9eb964e6190145e963a977f6c', '105', 'RADIO', '如果餐厅满座需等位，您愿意等待的时间是？ ', 1, NULL, 1, NULL, 393216, 24,
        '{
          \"options\": [{\"label\": \"15分钟内\", \"value\": 1}, {\"label\": \"15-30分钟\", \"value\": 2}, {\"label\": \"30到45分钟\", \"value\": 3}, {\"label\": \"不等，直接换餐厅\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (658, 'a6e9aeb9eb964e6190145e963a977f6c', '106', 'RADIO', '目前您一次就餐人均花费是？ ', 1, NULL, 1, NULL, 458752, 24, '{
  \"options\": [{\"label\": \"20元以下\", \"value\": 1}, {\"label\": \"20--30元\", \"value\": 2}, {\"label\": \"31--40元\", \"value\": 3}, {\"label\": \"41--50元\", \"value\": 4}, {\"label\": \"51--60元\", \"value\": 5}, {\"label\": \"61--100元\", \"value\": 6}, {\"label\": \"101--200元\", \"value\": 7}, {\"label\": \"200元以上\", \"value\": 8}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (659, 'a6e9aeb9eb964e6190145e963a977f6c', '107', 'RADIO', '对于餐厅选择，您注重它的：', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"价格\", \"value\": 1}, {\"label\": \"口味\", \"value\": 2}, {\"label\": \"方便快捷\", \"value\": 3}, {\"label\": \"健康营养\", \"value\": 4}, {\"label\": \"菜式新颖\", \"value\": 5}, {\"label\": \"卫生条件\", \"value\": 6}, {\"label\": \"装修格调\", \"value\": 7}, {\"label\": \"品牌档次\", \"value\": 8}, {\"label\": \"服务周到\", \"value\": 9}, {\"label\": \"朋友推荐\", \"value\": 10}, {\"label\": \"优惠活动\", \"value\": 11}, {\"label\": \"交通便利\", \"value\": 12}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (660, 'a6e9aeb9eb964e6190145e963a977f6c', '108', 'RADIO', '您最倾向于哪种环境下用餐？ ', 1, NULL, 1, NULL, 589824, 24, '{
  \"options\": [{\"label\": \"安静的\", \"value\": 1}, {\"label\": \"热闹的\", \"value\": 2}, {\"label\": \"有音乐的\", \"value\": 3}, {\"label\": \"有电视看的\", \"value\": 4}, {\"label\": \"有免费wifi的\", \"value\": 5}, {\"label\": \"有空调的\", \"value\": 6}, {\"label\": \"其他\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (661, 'a6e9aeb9eb964e6190145e963a977f6c', '109', 'RADIO', '您喜欢哪类型的特色餐饮？', 1, NULL, 1, NULL, 655360, 24, '{
  \"options\": [{\"label\": \"烧烤类\", \"value\": 1}, {\"label\": \"煎炸类\", \"value\": 2}, {\"label\": \"火锅类\", \"value\": 3}, {\"label\": \"蒸煮类\", \"value\": 4}, {\"label\": \"烘焙类\", \"value\": 5}, {\"label\": \"小吃类\", \"value\": 6}, {\"label\": \"快餐类\", \"value\": 7}, {\"label\": \"中餐馆\", \"value\": 8}, {\"label\": \"西餐厅\", \"value\": 9}, {\"label\": \"日韩料理\", \"value\": 10}, {\"label\": \"异国风味类（泰国菜、印度菜等）\", \"value\": 11}, {\"label\": \"其他\", \"value\": 12}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (662, 'a6e9aeb9eb964e6190145e963a977f6c', '110', 'RADIO', '您出外就餐的主要原因是？', 1, NULL, 1, NULL, 720896, 24, '{
  \"options\": [{\"label\": \"饭堂就餐的人太多，不想排长队\", \"value\": 1}, {\"label\": \"离家较远，需要在外就餐\", \"value\": 2}, {\"label\": \"休息时间少，紧张\", \"value\": 3}, {\"label\": \"在外就餐方便\", \"value\": 4}, {\"label\": \"在外就餐便宜\", \"value\": 5}, {\"label\": \"朋友相邀\", \"value\": 6}, {\"label\": \"部门聚餐\", \"value\": 7}, {\"label\": \"就想好好犒劳自己，放松下心情\", \"value\": 8}, {\"label\": \"其他\", \"value\": 9}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (663, 'a6e9aeb9eb964e6190145e963a977f6c', '111', 'RADIO', '您经常选择的就餐地点？', 1, NULL, 1, NULL, 786432, 24, '{
  \"options\": [{\"label\": \"地方特色餐厅（川湘菜、粤菜）\", \"value\": 1}, {\"label\": \"异国风情（泰国菜、日韩料理等）\", \"value\": 2}, {\"label\": \"私房菜馆快餐店\", \"value\": 3}, {\"label\": \"火锅店\", \"value\": 4}, {\"label\": \"小吃店\", \"value\": 5}, {\"label\": \"大排档\", \"value\": 6}, {\"label\": \"视心情而定\", \"value\": 7}, {\"label\": \"看哪里人少就去哪里\", \"value\": 8}, {\"label\": \"其他\", \"value\": 9}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (664, 'a6e9aeb9eb964e6190145e963a977f6c', '112', 'RADIO', '为什么您会选择这些就餐地点呢？', 1, NULL, 1, NULL, 851968, 24, '{
  \"options\": [{\"label\": \"价格便宜\", \"value\": 1}, {\"label\": \"口味适合\", \"value\": 2}, {\"label\": \"菜式新颖\", \"value\": 3}, {\"label\": \"卫生好\", \"value\": 4}, {\"label\": \"装饰格调好\", \"value\": 5}, {\"label\": \"品牌档次佳\", \"value\": 6}, {\"label\": \"服务周到\", \"value\": 7}, {\"label\": \"方便快捷\", \"value\": 8}, {\"label\": \"朋友推荐\", \"value\": 9}, {\"label\": \"优惠活动\", \"value\": 10}, {\"label\": \"交通便利\", \"value\": 11}, {\"label\": \"停车位充足\", \"value\": 12}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (665, 'a6e9aeb9eb964e6190145e963a977f6c', '113', 'RADIO', '您了解的大多数餐厅中，能否按承诺提供优质菜品与服务？ ', 1, NULL, 1, NULL,
        917504, 24, '{
    \"options\": [{\"label\": \"不能\", \"value\": 1}, {\"label\": \"一般\", \"value\": 2}, {\"label\": \"能\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (666, 'a6e9aeb9eb964e6190145e963a977f6c', '114', 'RADIO', '餐厅员工的质素是否会影响你再一次消费？ ', 1, NULL, 1, NULL, 983040, 24,
        '{
          \"options\": [{\"label\": \"不会影响\", \"value\": 1}, {\"label\": \"有一定影响，但不会因此而放弃选择该店进行再消费\", \"value\": 2}, {\"label\": \"受影响，如果不满意绝不再消费\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (667, 'a6e9aeb9eb964e6190145e963a977f6c', '115', 'RADIO', '请问您注重餐厅提供的贴心服务吗？', 1, NULL, 1, NULL, 1048576, 24, '{
  \"options\": [{\"label\": \"注重\", \"value\": 1}, {\"label\": \"不注重\", \"value\": 2}, {\"label\": \"无所谓\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (668, 'a6e9aeb9eb964e6190145e963a977f6c', '116', 'RADIO', '您觉得食品安全是首位吗 ', 1, NULL, 1, NULL, 1114112, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}, {\"label\": \"无所谓\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (669, 'a6e9aeb9eb964e6190145e963a977f6c', '117', 'RADIO', '那您一般光顾的餐厅是否能做到食品安全？ ', 1, NULL, 1, NULL, 1179648, 24,
        '{
          \"options\": [{\"label\": \"能\", \"value\": 1}, {\"label\": \"不能\", \"value\": 2}, {\"label\": \"没注意\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (670, 'c73206f879e4468ba6a3bc58a8606501', '100', 'RADIO', '您是否经常困扰中午应该吃什么？', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:37',
        '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (671, 'c73206f879e4468ba6a3bc58a8606501', '101', 'RADIO', '您的性别？', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"男\", \"value\": 1}, {\"label\": \"女\", \"value\": 2}]}', NULL, '2021-01-11 13:58:37',
        '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (672, 'c73206f879e4468ba6a3bc58a8606501', '102', 'RADIO', '在工作日时，您午餐的选择是', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"公司餐厅\", \"value\": 1}, {\"label\": \"上餐馆\", \"value\": 2}, {\"label\": \"叫外卖\", \"value\": 3}, {\"label\": \"自带\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (673, 'c73206f879e4468ba6a3bc58a8606501', '103', 'RADIO', '最近三个月内，您叫外卖的频率更接近于？', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"0次\", \"value\": 1}, {\"label\": \"1次/周\", \"value\": 2}, {\"label\": \"3次/周\", \"value\": 3}, {\"label\": \"5次/周\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (674, 'c73206f879e4468ba6a3bc58a8606501', '104', 'RADIO', '您在什么情况下会选择叫外卖呢？', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"不想出门\", \"value\": 1}, {\"label\": \"工作/学习太忙时\", \"value\": 2}, {\"label\": \"想换个口味\", \"value\": 3}, {\"label\": \"没人一起吃饭\", \"value\": 4}, {\"label\": \"朋友们都叫了外卖\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (675, 'c73206f879e4468ba6a3bc58a8606501', '105', 'RADIO', '您午餐花费的时间一般为？ ', 1, NULL, 1, NULL, 393216, 24, '{
  \"options\": [{\"label\": \"30分钟以内\", \"value\": 1}, {\"label\": \"30-60分钟\", \"value\": 2}, {\"label\": \"1小时-1个半小时\", \"value\": 3}, {\"label\": \"一个半小时以上\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (676, 'c73206f879e4468ba6a3bc58a8606501', '106', 'RADIO', '您一般通过什么方式订外卖？', 1, NULL, 1, NULL, 458752, 24, '{
  \"options\": [{\"label\": \"手机/电话\", \"value\": 1}, {\"label\": \"网上订餐\", \"value\": 2}, {\"label\": \"微信\", \"value\": 3}, {\"label\": \"外卖App\", \"value\": 4}, {\"label\": \"亲自上门打包\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (677, 'c73206f879e4468ba6a3bc58a8606501', '107', 'RADIO', '您一般通过什么途径知道外卖店？', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"传单广告\", \"value\": 1}, {\"label\": \"朋友介绍\", \"value\": 2}, {\"label\": \"上网查询\", \"value\": 3}, {\"label\": \"走在路上，发现不错的店就会记下来\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (678, 'c73206f879e4468ba6a3bc58a8606501', '108', 'RADIO', '您喜欢哪类型的外卖餐饮？', 1, NULL, 1, NULL, 589824, 24, '{
  \"options\": [{\"label\": \"烧烤类\", \"value\": 1}, {\"label\": \"煎炸类\", \"value\": 2}, {\"label\": \"火锅类\", \"value\": 3}, {\"label\": \"蒸煮类\", \"value\": 4}, {\"label\": \"烘焙类\", \"value\": 5}, {\"label\": \"小吃类\", \"value\": 6}, {\"label\": \"快餐类\", \"value\": 7}, {\"label\": \"中餐馆\", \"value\": 8}, {\"label\": \"西餐厅\", \"value\": 9}, {\"label\": \"日韩料理\", \"value\": 10}, {\"label\": \"异国风味类（泰国菜、印度菜等）\", \"value\": 11}, {\"label\": \"其他\", \"value\": 12}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (679, 'c73206f879e4468ba6a3bc58a8606501', '109', 'RADIO', '在您的外卖经历中，您觉得存在的哪些问题是？', 1, NULL, 1, NULL, 655360, 24,
        '{
          \"options\": [{\"label\": \"没有遇到过问题\", \"value\": 1}, {\"label\": \"送餐速度慢\", \"value\": 2}, {\"label\": \"菜品与图片不符\", \"value\": 3}, {\"label\": \"味道不好\", \"value\": 4}, {\"label\": \"份量太少\", \"value\": 5}, {\"label\": \"卫生不佳\", \"value\": 6}, {\"label\": \"包装不良（有食物或汁水洒出来）\", \"value\": 7}, {\"label\": \"其他\", \"value\": 8}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (680, 'c73206f879e4468ba6a3bc58a8606501', '110', 'RADIO', '遇到外卖服务不满意的情况，您会怎样处理？', 1, NULL, 1, NULL, 720896, 24,
        '{
          \"options\": [{\"label\": \"向送餐员说明\", \"value\": 1}, {\"label\": \"到店/电话与老板沟通\", \"value\": 2}, {\"label\": \"向食品监管部门投诉\", \"value\": 3}, {\"label\": \"放在心里，下次再也不买了\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (681, 'c73206f879e4468ba6a3bc58a8606501', '111', 'RADIO', '您是否希望通过饮食来控制体重？', 1, NULL, 1, NULL, 786432, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:37',
        '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (682, 'c73206f879e4468ba6a3bc58a8606501', '112', 'RADIO', '一家外卖餐厅能够提供菜品所含的卡路里和营养，您是否会感兴趣？', 1, NULL, 1, NULL,
        851968, 24, '{
    \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}, {\"label\": \"无所谓\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (683, 'c73206f879e4468ba6a3bc58a8606501', '113', 'RADIO', '您对外卖服务最看重的是哪方面？', 1, NULL, 1, NULL, 917504, 24, '{
  \"options\": [{\"label\": \"健康\", \"value\": 1}, {\"label\": \"口味\", \"value\": 2}, {\"label\": \"速度\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (684, 'c73206f879e4468ba6a3bc58a8606501', '114', 'RADIO', '您希望外卖公司提供的菜品组合？', 1, NULL, 1, NULL, 983040, 24, '{
  \"options\": [{\"label\": \"一荤两素\", \"value\": 1}, {\"label\": \"两荤两素\", \"value\": 2}, {\"label\": \"盖浇饭\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (685, 'c73206f879e4468ba6a3bc58a8606501', '115', 'RADIO', '您能接受的午餐价格？', 1, NULL, 1, NULL, 1048576, 24, '{
  \"options\": [{\"label\": \"15元以内\", \"value\": 1}, {\"label\": \"15—20元\", \"value\": 2}, {\"label\": \"21—25元\", \"value\": 3}, {\"label\": \"26—30元\", \"value\": 4}, {\"label\": \"31—50元\", \"value\": 5}, {\"label\": \"50元以上\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (686, 'ac30ab9f3f6943679910e9003d7003ac', '100', 'RADIO', '您所在的餐饮店主要经营', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"中餐\", \"value\": 1}, {\"label\": \"西餐\", \"value\": 2}, {\"label\": \"日韩料理\", \"value\": 3}, {\"label\": \"异国风味\", \"value\": 4}, {\"label\": \"咖啡酒吧\", \"value\": 5}, {\"label\": \"烧烤/火锅\", \"value\": 6}, {\"label\": \"小吃快餐\", \"value\": 7}, {\"label\": \"蛋糕甜点\", \"value\": 8}, {\"label\": \"其他\", \"value\": 9}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (687, 'ac30ab9f3f6943679910e9003d7003ac', '101', 'RADIO', '店内人均消费约为', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"20元以下\", \"value\": 1}, {\"label\": \"20-30元\", \"value\": 2}, {\"label\": \"31-40元\", \"value\": 3}, {\"label\": \"41-50元\", \"value\": 4}, {\"label\": \"51-60元\", \"value\": 5}, {\"label\": \"61-100元\", \"value\": 6}, {\"label\": \"101-200元\", \"value\": 7}, {\"label\": \"200元以上\", \"value\": 8}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (688, 'ac30ab9f3f6943679910e9003d7003ac', '102', 'RADIO', '店内主要消费群体（按年龄分）', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"20岁及以下\", \"value\": 1}, {\"label\": \"21-25岁\", \"value\": 2}, {\"label\": \"26-30岁\", \"value\": 3}, {\"label\": \"31-40岁\", \"value\": 4}, {\"label\": \"40岁以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (689, 'ac30ab9f3f6943679910e9003d7003ac', '103', 'RADIO', '目前店内已开展了哪些网络营销渠道？', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"微信\", \"value\": 1}, {\"label\": \"大众点评\", \"value\": 2}, {\"label\": \"新浪微博\", \"value\": 3}, {\"label\": \"本店官网\", \"value\": 4}, {\"label\": \"博客\", \"value\": 5}, {\"label\": \"美食类App\", \"value\": 6}, {\"label\": \"其他\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (690, 'ac30ab9f3f6943679910e9003d7003ac', '104', 'RADIO', '进行微信营销的原因：', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"微信用户量大，营销环境有利\", \"value\": 1}, {\"label\": \"是一种新型方式，抓住机遇\", \"value\": 2}, {\"label\": \"微信营销有自身的优势，值得探索与开发\", \"value\": 3}, {\"label\": \"开发多一种营销宣传渠道，有利于店内的发展\", \"value\": 4}, {\"label\": \"投入较低，营销门槛抵\", \"value\": 5}, {\"label\": \"竞争对手都开通了，不能落后\", \"value\": 6}, {\"label\": \"其他\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (691, 'ac30ab9f3f6943679910e9003d7003ac', '105', 'RADIO', '没有进行微信营销的原因：', 1, NULL, 1, NULL, 393216, 24, '{
  \"options\": [{\"label\": \"不了解微信\", \"value\": 1}, {\"label\": \"不知道微信营销方式\", \"value\": 2}, {\"label\": \"再看看，持观望态度\", \"value\": 3}, {\"label\": \"不感兴趣\", \"value\": 4}, {\"label\": \"已投入资源到其他平台营销\", \"value\": 0}, {\"label\": \"进行微信营销要额外的增加资源投入\", \"value\": 6}, {\"label\": \"其他\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (692, 'ac30ab9f3f6943679910e9003d7003ac', '106', 'RADIO', '店内将来是否打算开展微信营销？', 1, NULL, 1, NULL, 458752, 24, '{
  \"options\": [{\"label\": \"会\", \"value\": 1}, {\"label\": \"持观望态度\", \"value\": 2}, {\"label\": \"不会\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (693, 'ac30ab9f3f6943679910e9003d7003ac', '107', 'RADIO', '店内是如何看待微信营销的宣传效果？ ', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"微信传播速度快且范围广泛，效果很好\", \"value\": 1}, {\"label\": \"微信普及不够，效果打折扣\", \"value\": 2}, {\"label\": \"效果微乎其微\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (694, 'ac30ab9f3f6943679910e9003d7003ac', '108', 'RADIO', '店内运用微信营销的主要目的：', 1, NULL, 1, NULL, 589824, 24, '{
  \"options\": [{\"label\": \"开发潜在顾客\", \"value\": 1}, {\"label\": \"培养顾客关系/忠诚度\", \"value\": 2}, {\"label\": \"品牌推广\", \"value\": 3}, {\"label\": \"增加人气\", \"value\": 4}, {\"label\": \"增加营收\", \"value\": 5}, {\"label\": \"做一家时尚潮店\", \"value\": 6}, {\"label\": \"节省营销成本\", \"value\": 7}, {\"label\": \"其他\", \"value\": 8}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (695, 'ac30ab9f3f6943679910e9003d7003ac', '109', 'RADIO', '店内微信营销的日常运营者是：', 1, NULL, 1, NULL, 655360, 24, '{
  \"options\": [{\"label\": \"店内有微信营销专员\", \"value\": 1}, {\"label\": \"店员兼任\", \"value\": 2}, {\"label\": \"委托第三方管理\", \"value\": 3}, {\"label\": \"其他\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (696, 'ac30ab9f3f6943679910e9003d7003ac', '110', 'RADIO', '店内的公众账号推送内容的频率为：', 1, NULL, 1, NULL, 720896, 24, '{
  \"options\": [{\"label\": \"每天2次\", \"value\": 1}, {\"label\": \"每天1次\", \"value\": 2}, {\"label\": \"每周3次\", \"value\": 3}, {\"label\": \"每周1次\", \"value\": 4}, {\"label\": \"每月1次\", \"value\": 5}, {\"label\": \"每月2次\", \"value\": 6}, {\"label\": \"其他\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (697, 'ac30ab9f3f6943679910e9003d7003ac', '111', 'RADIO', '店内公众账号推送的内容为：', 1, NULL, 1, NULL, 786432, 24, '{
  \"options\": [{\"label\": \"品牌推广活动\", \"value\": 1}, {\"label\": \"新菜推介\", \"value\": 2}, {\"label\": \"优惠折扣\", \"value\": 3}, {\"label\": \"在线点单\", \"value\": 4}, {\"label\": \"美食养生资讯\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (698, 'ac30ab9f3f6943679910e9003d7003ac', '112', 'RADIO', '店内为促进微信营销，计划或进行了哪些工作？', 1, NULL, 1, NULL, 851968, 24,
        '{
          \"options\": [{\"label\": \"设置微信客服\", \"value\": 1}, {\"label\": \"微信专属优惠\", \"value\": 2}, {\"label\": \"增加特色服务（提前预约/在线下单等）\", \"value\": 3}, {\"label\": \"制定合理的推送时间/次数\", \"value\": 4}, {\"label\": \"设计符合订阅顾客需求的推送内容\", \"value\": 5}, {\"label\": \"合理设置公众号自定义菜单栏\", \"value\": 6}, {\"label\": \"其他\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (699, 'ac30ab9f3f6943679910e9003d7003ac', '113', 'RADIO', '您认为微信营销的优势在于：', 1, NULL, 1, NULL, 917504, 24, '{
  \"options\": [{\"label\": \"使用微信的群体数量庞大\", \"value\": 1}, {\"label\": \"分享功能更有针对性\", \"value\": 2}, {\"label\": \"通过二维码作为入口，便利连接线上与线下\", \"value\": 3}, {\"label\": \"微生活会员卡\", \"value\": 4}, {\"label\": \"精准营销，推送信息\", \"value\": 5}, {\"label\": \"确保推送的信息送达至用户\", \"value\": 6}, {\"label\": \"一对一的互动交流平台\", \"value\": 7}, {\"label\": \"其他\", \"value\": 8}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (700, 'ac30ab9f3f6943679910e9003d7003ac', '114', 'RADIO', '您认为微信营销的劣势在于：', 1, NULL, 1, NULL, 983040, 24, '{
  \"options\": [{\"label\": \"公众号需要专业人员进行设置，操作要求高\", \"value\": 1}, {\"label\": \"营销者角色被动，公众号需要被订阅后才能开展微信营销工作\", \"value\": 2}, {\"label\": \"不如餐饮/美食类网站专业成熟\", \"value\": 3}, {\"label\": \"微信营销功能刚起步，多样化方式需探索\", \"value\": 4}, {\"label\": \"公众账号的订阅用户数量相对较少\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (701, 'ac30ab9f3f6943679910e9003d7003ac', '115', 'RADIO', '您认为哪种方式更容易提高本店的微信关注量？', 1, NULL, 1, NULL, 1048576, 24,
        '{
          \"options\": [{\"label\": \"明星名人效应\", \"value\": 1}, {\"label\": \"店内外做广告\", \"value\": 2}, {\"label\": \"即时优惠折扣\", \"value\": 3}, {\"label\": \"店员主动推荐\", \"value\": 4}, {\"label\": \"合理的推送时间\", \"value\": 5}, {\"label\": \"有趣的美食咨讯推送\", \"value\": 6}, {\"label\": \"鼓励顾客分享到朋友圈的活动\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (702, 'ac30ab9f3f6943679910e9003d7003ac', '116', 'INPUT', '您的姓名是? ', 1, NULL, 1, NULL, 1114112, 24, '{}', NULL,
        '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (703, 'ac30ab9f3f6943679910e9003d7003ac', '117', 'INPUT', '您的手机号码是? ', 1, NULL, 1, NULL, 1179648, 24, '{}', NULL,
        '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (704, 'ac30ab9f3f6943679910e9003d7003ac', '118', 'RADIO', '您的职业是?', 1, NULL, 1, NULL, 1245184, 24, '{
  \"options\": [{\"label\": \"在校学生\", \"value\": 1}, {\"label\": \"政府/机关干部/公务员\", \"value\": 2}, {\"label\": \"企业管理者（包括基层及中高层管理者）\", \"value\": 3}, {\"label\": \"普通职员（办公室/写字楼工作人员）\", \"value\": 4}, {\"label\": \"专业人员（如医生/律师/文体/记者/老师等）\", \"value\": 5}, {\"label\": \"普通工人（如工厂工人/体力劳动者等）\", \"value\": 6}, {\"label\": \"商业服务业职工（如销售人员/商店职员/服务员等）\", \"value\": 7}, {\"label\": \"个体经营者/承包商\", \"value\": 8}, {\"label\": \"自由职业者\", \"value\": 9}, {\"label\": \"农林牧渔劳动者\", \"value\": 10}, {\"label\": \"退休\", \"value\": 11}, {\"label\": \"暂无职业\", \"value\": 12}, {\"label\": \"其他\", \"value\": 13}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (705, '101a734bef0f404dbd6bd4010d39211d', '100', 'RADIO', '您是否使用微信的呢？', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"使用\", \"value\": 1}, {\"label\": \"偶尔使用\", \"value\": 2}, {\"label\": \"不使用\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (706, '101a734bef0f404dbd6bd4010d39211d', '101', 'RADIO', '您的微信在线频率更接近于？', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"24小时在线\", \"value\": 1}, {\"label\": \"每天上线且超过6小时\", \"value\": 2}, {\"label\": \"每天上线但低于6小时\", \"value\": 3}, {\"label\": \"需要时才使用，偶尔上线\", \"value\": 4}, {\"label\": \"几乎不在线\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (707, '101a734bef0f404dbd6bd4010d39211d', '102', 'RADIO', '您使用微信的目的是什么？', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"社会交际（聊天/加好友等）\", \"value\": 1}, {\"label\": \"更新状态（记录生活/分享心情）\", \"value\": 2}, {\"label\": \"关注商家（使用商家的优惠/关注商家的动态等）\", \"value\": 3}, {\"label\": \"了解资讯\", \"value\": 4}, {\"label\": \"其他\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (708, '101a734bef0f404dbd6bd4010d39211d', '103', 'RADIO', '您所关注的微信群体主要是？', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"亲朋好友\", \"value\": 1}, {\"label\": \"名人、明星\", \"value\": 2}, {\"label\": \"企事业的官方微信\", \"value\": 3}, {\"label\": \"资讯订阅号\", \"value\": 4}, {\"label\": \"陌生人但感兴趣的人\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:37', '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (709, '101a734bef0f404dbd6bd4010d39211d', '104', 'RADIO', '您加过餐厅或美食的微信号吗？', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"会\", \"value\": 1}, {\"label\": \"不会\", \"value\": 2}]}', NULL, '2021-01-11 13:58:37',
        '2021-01-11 13:58:37', 0);
INSERT INTO `pr_project_template_item`
VALUES (710, '101a734bef0f404dbd6bd4010d39211d', '105', 'RADIO', '您加该餐厅或美食微信号的原因是？', 1, NULL, 1, NULL, 393216, 24, '{
  \"options\": [{\"label\": \"喜欢该商家\", \"value\": 1}, {\"label\": \"有即时的优惠\", \"value\": 2}, {\"label\": \"可以获得长期的优惠\", \"value\": 3}, {\"label\": \"其他\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (711, '101a734bef0f404dbd6bd4010d39211d', '106', 'RADIO', '看到该微信号发来的宣传时，您的反应比较接近于哪一项？', 1, NULL, 1, NULL, 458752,
        24, '{
    \"options\": [{\"label\": \"认真阅读，会考虑消费\", \"value\": 1}, {\"label\": \"随便看看，有兴趣再说\", \"value\": 2}, {\"label\": \"匆匆扫过，只见到标题\", \"value\": 3}, {\"label\": \"屏蔽信息，需要才查看\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (712, '101a734bef0f404dbd6bd4010d39211d', '107', 'RADIO', '您觉得该微信号的宣传力度如何？', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"有微信客服，而且互动不错\", \"value\": 1}, {\"label\": \"有微信客服，但没什么消息\", \"value\": 2}, {\"label\": \"没有微信客服，但不时会有宣传讯息\", \"value\": 3}, {\"label\": \"没有微信客服，也几乎没有宣传讯息\", \"value\": 4}, {\"label\": \"不清楚，我不怎么关注\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (713, '101a734bef0f404dbd6bd4010d39211d', '108', 'RADIO', '您关注该微信号最想获得的是？', 1, NULL, 1, NULL, 589824, 24, '{
  \"options\": [{\"label\": \"长期的优惠\", \"value\": 1}, {\"label\": \"尊贵的身份\", \"value\": 2}, {\"label\": \"即时的优惠\", \"value\": 3}, {\"label\": \"最新的活动\", \"value\": 4}, {\"label\": \"其他\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (714, '101a734bef0f404dbd6bd4010d39211d', '109', 'RADIO', '微信上如果有陌生餐厅/美食号跟您打招呼，并发布一些即时的美食资讯，您会回应吗？', 1, NULL, 1,
        NULL, 655360, 24, '{
    \"options\": [{\"label\": \"会\", \"value\": 1}, {\"label\": \"不会\", \"value\": 2}, {\"label\": \"不确定\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (715, '101a734bef0f404dbd6bd4010d39211d', '110', 'RADIO', '您会因为微信上的促销信息而光临该餐厅并进行消费吗', 1, NULL, 1, NULL, 720896,
        24, '{
    \"options\": [{\"label\": \"会\", \"value\": 1}, {\"label\": \"不会\", \"value\": 2}, {\"label\": \"不确定\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (716, '101a734bef0f404dbd6bd4010d39211d', '111', 'RADIO', '您打捞到餐厅/美食号相关的漂流瓶后会回应吗？', 1, NULL, 1, NULL, 786432, 24,
        '{
          \"options\": [{\"label\": \"会\", \"value\": 1}, {\"label\": \"不会\", \"value\": 2}, {\"label\": \"不确定\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (717, '101a734bef0f404dbd6bd4010d39211d', '112', 'RADIO', '您会通过微信朋友圈的餐厅/美食号推荐去消费吗？', 1, NULL, 1, NULL, 851968,
        24, '{
    \"options\": [{\"label\": \"会\", \"value\": 1}, {\"label\": \"不会\", \"value\": 2}, {\"label\": \"不确定\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (718, '101a734bef0f404dbd6bd4010d39211d', '113', 'RADIO', '您是否会把您收到的美食讯息分享给亲朋好友？', 1, NULL, 1, NULL, 917504, 24,
        '{
          \"options\": [{\"label\": \"会\", \"value\": 1}, {\"label\": \"不会\", \"value\": 2}, {\"label\": \"不确定\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (719, '101a734bef0f404dbd6bd4010d39211d', '114', 'RATE', '您对于语音功能在餐饮消费便利方面的使用情况还满意吗？', 1, NULL, 1, NULL, 983040,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (720, '101a734bef0f404dbd6bd4010d39211d', '115', 'RADIO', '您在使用微信进行餐饮消费信息获取和处理过程中遇到过哪些问题？', 1, NULL, 1, NULL,
        1048576, 24, '{
    \"options\": [{\"label\": \"服务质量差\", \"value\": 1}, {\"label\": \"造成骚扰\", \"value\": 2}, {\"label\": \"宣传有误\", \"value\": 3}, {\"label\": \"信息时效性弱\", \"value\": 4}, {\"label\": \"流量耗费\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (721, '101a734bef0f404dbd6bd4010d39211d', '116', 'RADIO', '您的年龄', 1, NULL, 1, NULL, 1114112, 24, '{
  \"options\": [{\"label\": \"20岁及以下\", \"value\": 1}, {\"label\": \"21-25岁\", \"value\": 2}, {\"label\": \"26-30岁\", \"value\": 3}, {\"label\": \"31-40岁\", \"value\": 4}, {\"label\": \"40岁以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (722, '101a734bef0f404dbd6bd4010d39211d', '117', 'RADIO', '您的性别', 1, NULL, 1, NULL, 1179648, 24, '{
  \"options\": [{\"label\": \"男\", \"value\": 1}, {\"label\": \"女\", \"value\": 2}]}', NULL, '2021-01-11 13:58:38',
        '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (723, '101a734bef0f404dbd6bd4010d39211d', '118', 'RADIO', '您的学历', 1, NULL, 1, NULL, 1245184, 24, '{
  \"options\": [{\"label\": \"初中及以下\", \"value\": 1}, {\"label\": \"高中及中职、技校\", \"value\": 2}, {\"label\": \"大专\", \"value\": 3}, {\"label\": \"本科\", \"value\": 4}, {\"label\": \"硕士及以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (724, '101a734bef0f404dbd6bd4010d39211d', '119', 'RADIO', '您的月收入', 1, NULL, 1, NULL, 1310720, 24, '{
  \"options\": [{\"label\": \"无固定收入\", \"value\": 1}, {\"label\": \"1000元以下\", \"value\": 2}, {\"label\": \"1001-2000元\", \"value\": 3}, {\"label\": \"2001-3000元\", \"value\": 4}, {\"label\": \"3001-5000元\", \"value\": 5}, {\"label\": \"5001-8000元\", \"value\": 6}, {\"label\": \"8001-10000元\", \"value\": 7}, {\"label\": \"10001-20000元\", \"value\": 8}, {\"label\": \"20000元以上\", \"value\": 9}, {\"label\": \"不方便透露\", \"value\": 10}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (725, '101a734bef0f404dbd6bd4010d39211d', '120', 'RADIO', '您的职业是', 1, NULL, 1, NULL, 1376256, 24, '{
  \"options\": [{\"label\": \"在校学生\", \"value\": 1}, {\"label\": \"政府/机关干部/公务员\", \"value\": 2}, {\"label\": \"企业管理者（包括基层及中高层管理者）\", \"value\": 3}, {\"label\": \"普通职员（办公室/写字楼工作人员）\", \"value\": 4}, {\"label\": \"专业人员（如医生/律师/文体/记者/老师等）\", \"value\": 5}, {\"label\": \"普通工人（如工厂工人/体力劳动者等）\", \"value\": 6}, {\"label\": \"商业服务业职工（如销售人员/商店职员/服务员等）\", \"value\": 7}, {\"label\": \"个体经营者/承包商\", \"value\": 8}, {\"label\": \"自由职业者\", \"value\": 9}, {\"label\": \"农林牧渔劳动者\", \"value\": 10}, {\"label\": \"退休\", \"value\": 11}, {\"label\": \"暂无职业\", \"value\": 12}, {\"label\": \"其他\", \"value\": 13}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (726, 'a088854a92c34b4d87f3277da045c655', '100', 'RADIO', '您外出就餐的频率? ', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"一个月1次\", \"value\": 1}, {\"label\": \"半个月1次\", \"value\": 2}, {\"label\": \"每周1次\", \"value\": 3}, {\"label\": \"每周2次或以上\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (727, 'a088854a92c34b4d87f3277da045c655', '101', 'RADIO', '您经常在外就餐的原因? ', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"没有时间自己做饭\", \"value\": 1}, {\"label\": \"朋友邀请\", \"value\": 2}, {\"label\": \"交际应酬\", \"value\": 3}, {\"label\": \"休闲放松\", \"value\": 4}, {\"label\": \"品尝特色美食\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (728, 'a088854a92c34b4d87f3277da045c655', '102', 'RADIO', '和亲戚朋友聚餐时人均支出： ', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"20元以内\", \"value\": 1}, {\"label\": \"21-50元\", \"value\": 2}, {\"label\": \"51-100元\", \"value\": 3}, {\"label\": \"101-150元\", \"value\": 4}, {\"label\": \"151-200元\", \"value\": 5}, {\"label\": \"201-300元\", \"value\": 6}, {\"label\": \"301-500元\", \"value\": 7}, {\"label\": \"501元以上\", \"value\": 8}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (729, 'a088854a92c34b4d87f3277da045c655', '103', 'RADIO', '交际或商务应酬就餐时人均支出： ', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"20元以内\", \"value\": 1}, {\"label\": \"21-50元\", \"value\": 2}, {\"label\": \"51-100元\", \"value\": 3}, {\"label\": \"101-150元\", \"value\": 4}, {\"label\": \"151-200元\", \"value\": 5}, {\"label\": \"201-300元\", \"value\": 6}, {\"label\": \"301-500元\", \"value\": 7}, {\"label\": \"501元以上\", \"value\": 8}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (730, 'a088854a92c34b4d87f3277da045c655', '104', 'RADIO', '您每月在外餐饮消费支出大概为： ', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"200元以内\", \"value\": 1}, {\"label\": \"201－500元\", \"value\": 2}, {\"label\": \"501－1000元\", \"value\": 3}, {\"label\": \"1001－1500元\", \"value\": 4}, {\"label\": \"1501-2500元\", \"value\": 5}, {\"label\": \"2500元以上\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (731, 'a088854a92c34b4d87f3277da045c655', '105', 'RADIO', '每月在外餐饮消费支出占所有食品消费支出的比例： ', 1, NULL, 1, NULL, 393216,
        24, '{
    \"options\": [{\"label\": \"20％以内\", \"value\": 1}, {\"label\": \"21％一40％\", \"value\": 2}, {\"label\": \"41％一60％\", \"value\": 3}, {\"label\": \"61％－80％\", \"value\": 4}, {\"label\": \"80％以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (732, 'a088854a92c34b4d87f3277da045c655', '106', 'RADIO', '您认为您身边环境的餐饮消费价格? ', 1, NULL, 1, NULL, 458752, 24, '{
  \"options\": [{\"label\": \"很低\", \"value\": 1}, {\"label\": \"较低\", \"value\": 2}, {\"label\": \"一般\", \"value\": 3}, {\"label\": \"较高\", \"value\": 4}, {\"label\": \"很高\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (733, 'a088854a92c34b4d87f3277da045c655', '107', 'RADIO', '您选择餐馆消费时，最看重什么? ', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"价格便宜\", \"value\": 1}, {\"label\": \"口味适合\", \"value\": 2}, {\"label\": \"菜式新颖\", \"value\": 3}, {\"label\": \"卫生好\", \"value\": 4}, {\"label\": \"装饰格调好\", \"value\": 5}, {\"label\": \"品牌档次佳\", \"value\": 6}, {\"label\": \"服务周到\", \"value\": 7}, {\"label\": \"方便快捷\", \"value\": 8}, {\"label\": \"朋友推荐\", \"value\": 9}, {\"label\": \"优惠活动\", \"value\": 10}, {\"label\": \"交通便利\", \"value\": 11}, {\"label\": \"停车位充足\", \"value\": 12}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (734, 'a088854a92c34b4d87f3277da045c655', '108', 'RADIO', '您更喜欢选择哪类菜系? ', 1, NULL, 1, NULL, 589824, 24, '{
  \"options\": [{\"label\": \"粤菜\", \"value\": 1}, {\"label\": \"川湘菜\", \"value\": 2}, {\"label\": \"其他地方菜系（江浙菜、西北菜等）\", \"value\": 3}, {\"label\": \"火锅\", \"value\": 4}, {\"label\": \"西餐\", \"value\": 5}, {\"label\": \"日韩料理\", \"value\": 6}, {\"label\": \"南亚（泰国，越南）\", \"value\": 7}, {\"label\": \"墨西哥菜\", \"value\": 8}, {\"label\": \"地方特色小吃\", \"value\": 9}, {\"label\": \"其他\", \"value\": 10}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (735, 'a088854a92c34b4d87f3277da045c655', '109', 'RADIO', '您最常和谁一起就餐', 1, NULL, 1, NULL, 655360, 24, '{
  \"options\": [{\"label\": \"朋友\", \"value\": 1}, {\"label\": \"家人\", \"value\": 2}, {\"label\": \"爱人\", \"value\": 3}, {\"label\": \"同事\", \"value\": 4}, {\"label\": \"客户\", \"value\": 5}, {\"label\": \"领导\", \"value\": 6}, {\"label\": \"同学\", \"value\": 7}, {\"label\": \"安静独处\", \"value\": 8}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (736, 'a088854a92c34b4d87f3277da045c655', '110', 'RADIO', '您经常选择的餐饮消费档次? ', 1, NULL, 1, NULL, 720896, 24, '{
  \"options\": [{\"label\": \"高档餐\", \"value\": 1}, {\"label\": \"大众化经济餐\", \"value\": 2}, {\"label\": \"特色小吃\", \"value\": 3}, {\"label\": \"小摊小贩\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (737, 'a088854a92c34b4d87f3277da045c655', '111', 'RADIO', '您选择就餐地点的信息渠道有?', 1, NULL, 1, NULL, 786432, 24, '{
  \"options\": [{\"label\": \"朋友或家人推荐\", \"value\": 1}, {\"label\": \"路过看到\", \"value\": 2}, {\"label\": \"以前去过\", \"value\": 3}, {\"label\": \"宣传单\", \"value\": 4}, {\"label\": \"老字号\", \"value\": 5}, {\"label\": \"网络点评推荐\", \"value\": 6}, {\"label\": \"其他\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (738, 'a088854a92c34b4d87f3277da045c655', '112', 'RADIO', '您认为餐馆有待改进的地方是? ', 1, NULL, 1, NULL, 851968, 24, '{
  \"options\": [{\"label\": \"菜品价格\", \"value\": 1}, {\"label\": \"酒水饮料价格\", \"value\": 2}, {\"label\": \"口味\", \"value\": 3}, {\"label\": \"份量\", \"value\": 4}, {\"label\": \"菜式种类\", \"value\": 5}, {\"label\": \"卫生条件\", \"value\": 6}, {\"label\": \"就餐环境\", \"value\": 7}, {\"label\": \"服务质量\", \"value\": 8}, {\"label\": \"品牌规模\", \"value\": 9}, {\"label\": \"停车方便性\", \"value\": 10}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (739, 'a088854a92c34b4d87f3277da045c655', '113', 'RATE', '目前来说，您对在外就餐的状况的满意度? ', 1, NULL, 1, NULL, 917504, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (740, 'a088854a92c34b4d87f3277da045c655', '114', 'RADIO', '您的性别？ ', 1, NULL, 1, NULL, 983040, 24, '{
  \"options\": [{\"label\": \"男\", \"value\": 1}, {\"label\": \"女\", \"value\": 2}]}', NULL, '2021-01-11 13:58:38',
        '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (741, 'a088854a92c34b4d87f3277da045c655', '115', 'RADIO', '您的年龄? ', 1, NULL, 1, NULL, 1048576, 24, '{
  \"options\": [{\"label\": \"20岁及以下\", \"value\": 1}, {\"label\": \"21-25 岁\", \"value\": 2}, {\"label\": \"26-30 岁\", \"value\": 3}, {\"label\": \"31-40 岁\", \"value\": 4}, {\"label\": \"40岁以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (742, 'a088854a92c34b4d87f3277da045c655', '116', 'RADIO', '您的受教育程度是? ', 1, NULL, 1, NULL, 1114112, 24, '{
  \"options\": [{\"label\": \"初中及以下\", \"value\": 1}, {\"label\": \"高中/中专\", \"value\": 2}, {\"label\": \"大专\", \"value\": 3}, {\"label\": \"本科\", \"value\": 4}, {\"label\": \"硕士\", \"value\": 5}, {\"label\": \"博士及以上\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (743, 'a088854a92c34b4d87f3277da045c655', '117', 'RADIO', '您的职业： ', 1, NULL, 1, NULL, 1179648, 24, '{
  \"options\": [{\"label\": \"在校学生\", \"value\": 1}, {\"label\": \"政府/机关干部/公务员\", \"value\": 2}, {\"label\": \"企业管理者（包括基层及中高层管理者）\", \"value\": 3}, {\"label\": \"普通职员（办公室/写字楼工作人员）\", \"value\": 4}, {\"label\": \"专业人员（如医生/律师/文体/记者/老师等）\", \"value\": 5}, {\"label\": \"普通工人（如工厂工人/体力劳动者等）\", \"value\": 6}, {\"label\": \"商业服务业职工（如销售人员/商店职员/服务员等）\", \"value\": 7}, {\"label\": \"个体经营者/承包商\", \"value\": 8}, {\"label\": \"自由职业者\", \"value\": 9}, {\"label\": \"农林牧渔劳动者\", \"value\": 10}, {\"label\": \"退休\", \"value\": 11}, {\"label\": \"暂无职业\", \"value\": 12}, {\"label\": \"其他\", \"value\": 13}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (744, 'a088854a92c34b4d87f3277da045c655', '118', 'RADIO', '您的月收入（或生活费）? ', 1, NULL, 1, NULL, 1245184, 24, '{
  \"options\": [{\"label\": \"1000元以下\", \"value\": 1}, {\"label\": \"1001-2000元\", \"value\": 2}, {\"label\": \"2001-3000元\", \"value\": 3}, {\"label\": \"3001-5000元\", \"value\": 4}, {\"label\": \"5001-8000元\", \"value\": 5}, {\"label\": \"8001-10000元\", \"value\": 6}, {\"label\": \"10001-20000元\", \"value\": 7}, {\"label\": \"20000元以上\", \"value\": 8}, {\"label\": \"不方便透露\", \"value\": 9}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (745, 'a088854a92c34b4d87f3277da045c655', '119', 'INPUT', '您的居住城市是', 1, NULL, 1, NULL, 1310720, 24, '{}', NULL,
        '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (746, '594fbe0cc6ae47e895435f327bfc5c8d', '100', 'RADIO', '您的性别：', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"男\", \"value\": 1}, {\"label\": \"女\", \"value\": 2}]}', NULL, '2021-01-11 13:58:38',
        '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (747, '594fbe0cc6ae47e895435f327bfc5c8d', '101', 'RADIO', '您的年龄：', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"20岁及以下\", \"value\": 1}, {\"label\": \"21-25岁\", \"value\": 2}, {\"label\": \"26-30岁\", \"value\": 3}, {\"label\": \"31-40岁\", \"value\": 4}, {\"label\": \"40岁以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (748, '594fbe0cc6ae47e895435f327bfc5c8d', '102', 'RADIO', '您的月收入（或生活费）? ', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"1000元以下\", \"value\": 1}, {\"label\": \"1001-2000元\", \"value\": 2}, {\"label\": \"2001-3000元\", \"value\": 3}, {\"label\": \"3001-5000元\", \"value\": 4}, {\"label\": \"5001-8000元\", \"value\": 5}, {\"label\": \"8001-10000元\", \"value\": 6}, {\"label\": \"10001-20000元\", \"value\": 7}, {\"label\": \"20000元以上\", \"value\": 8}, {\"label\": \"不方便透露\", \"value\": 9}]}',
        NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (749, '594fbe0cc6ae47e895435f327bfc5c8d', '103', 'RATE', '餐厅提供的菜品种类多，影响我给予好评的程度。', 1, NULL, 1, NULL, 262144, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (750, '594fbe0cc6ae47e895435f327bfc5c8d', '104', 'RATE', '餐厅提供的菜品口味好，影响我给予好评的程度。', 1, NULL, 1, NULL, 327680, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (751, '594fbe0cc6ae47e895435f327bfc5c8d', '105', 'RATE', '餐厅食材质量高，影响我给予好评的程度。', 1, NULL, 1, NULL, 393216, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (752, '594fbe0cc6ae47e895435f327bfc5c8d', '106', 'RATE', '餐厅提供的菜品分量足，影响我给予好评的程度。', 1, NULL, 1, NULL, 458752, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (753, '594fbe0cc6ae47e895435f327bfc5c8d', '107', 'RATE', '餐厅没有隐性消费，影响我给予好评的程度。', 1, NULL, 1, NULL, 524288, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (754, '594fbe0cc6ae47e895435f327bfc5c8d', '108', 'RATE', '餐厅团购信息与实际一致，影响我给予好评的程度。', 1, NULL, 1, NULL, 589824, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (755, '594fbe0cc6ae47e895435f327bfc5c8d', '109', 'RATE', '餐厅折扣力度大，影响我给予好评的程度。', 1, NULL, 1, NULL, 655360, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (756, '594fbe0cc6ae47e895435f327bfc5c8d', '110', 'RATE', '餐厅团购券没有使用时间限制，影响我给予好评的程度。', 1, NULL, 1, NULL, 720896,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (757, '594fbe0cc6ae47e895435f327bfc5c8d', '111', 'RATE', '餐厅团购兑换方便快捷，影响我给予好评的程度。', 1, NULL, 1, NULL, 786432, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (758, '594fbe0cc6ae47e895435f327bfc5c8d', '112', 'RATE', '店员对团购顾客的接待流程熟练，影响我给予好评的程度。', 1, NULL, 1, NULL, 851968,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (759, '594fbe0cc6ae47e895435f327bfc5c8d', '113', 'RATE', '餐厅提供免费WIFI，影响我给予好评的程度。', 1, NULL, 1, NULL, 917504, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (760, '594fbe0cc6ae47e895435f327bfc5c8d', '114', 'RATE', '上餐速度快，影响我给予好评的程度。', 1, NULL, 1, NULL, 983040, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (761, '594fbe0cc6ae47e895435f327bfc5c8d', '115', 'RATE', '排号时间短，影响我给予好评的程度。', 1, NULL, 1, NULL, 1048576, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (762, '594fbe0cc6ae47e895435f327bfc5c8d', '116', 'RATE', '服务人员没有差别对待，服务态度良好，影响我给予好评的程度。', 1, NULL, 1, NULL,
        1114112, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (763, '594fbe0cc6ae47e895435f327bfc5c8d', '117', 'RATE', '餐厅拥有独特的装修风格，影响我给予好评的程度。', 1, NULL, 1, NULL, 1179648,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (764, '594fbe0cc6ae47e895435f327bfc5c8d', '118', 'RATE', '餐厅卫生状况良好，影响我给予好评的程度。', 1, NULL, 1, NULL, 1245184, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (765, '594fbe0cc6ae47e895435f327bfc5c8d', '119', 'RATE', '餐厅提供了精致的用餐设备，如精致的桌椅、餐具等，影响我给予好评的程度。', 1, NULL, 1, NULL,
        1310720, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (766, '594fbe0cc6ae47e895435f327bfc5c8d', '120', 'RATE', '餐厅为消费者提供必要的权益保障，例如主动提供发票等，影响我给予好评的程度。', 1, NULL, 1,
        NULL, 1376256, 24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (767, '594fbe0cc6ae47e895435f327bfc5c8d', '121', 'RATE', '餐厅知名度高，是有名的品牌，影响我给予好评的程度。', 1, NULL, 1, NULL, 1441792,
        24, '{
    \"max\": 5}', NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (768, '594fbe0cc6ae47e895435f327bfc5c8d', '122', 'RATE', '餐厅提供停车位，影响我给予好评的程度。', 1, NULL, 1, NULL, 1507328, 24, '{
  \"max\": 5}', NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (769, '594fbe0cc6ae47e895435f327bfc5c8d', '123', 'RATE', '餐厅地理位置交通便利，影响我给予好评的程度。', 1, NULL, 1, NULL, 1572864, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:38', '2021-01-11 13:58:38', 0);
INSERT INTO `pr_project_template_item`
VALUES (770, '594fbe0cc6ae47e895435f327bfc5c8d', '124', 'RATE', '周围朋友推荐过的店铺，影响我给予好评的程度。', 1, NULL, 1, NULL, 1638400, 24,
        '{
          \"max\": 5}', NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (771, 'a629343e537645c997c8c040de2c2f92', '100', 'RADIO', '您的性别？', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"女\", \"value\": 1}, {\"label\": \"男\", \"value\": 2}]}', NULL, '2021-01-11 13:58:39',
        '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (772, 'a629343e537645c997c8c040de2c2f92', '101', 'RADIO', '您的年龄？', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"20岁及以下\", \"value\": 1}, {\"label\": \"21-25岁\", \"value\": 2}, {\"label\": \"26-30岁\", \"value\": 3}, {\"label\": \"31-40岁\", \"value\": 4}, {\"label\": \"40岁以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (773, 'a629343e537645c997c8c040de2c2f92', '102', 'RADIO', '您的职业？', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"在校学生\", \"value\": 1}, {\"label\": \"政府/机关干部/公务员\", \"value\": 2}, {\"label\": \"企业管理者（包括基层及中高层管理者）\", \"value\": 3}, {\"label\": \"普通职员（办公室/写字楼工作人员）\", \"value\": 4}, {\"label\": \"专业人员（如医生/律师/文体/记者/老师等）\", \"value\": 5}, {\"label\": \"普通工人（如工厂工人/体力劳动者等）\", \"value\": 6}, {\"label\": \"商业服务业职工（如销售人员/商店职员/服务员等）\", \"value\": 7}, {\"label\": \"个体经营者/承包商\", \"value\": 8}, {\"label\": \"自由职业者\", \"value\": 9}, {\"label\": \"农林牧渔劳动者\", \"value\": 10}, {\"label\": \"退休\", \"value\": 11}, {\"label\": \"暂无职业\", \"value\": 12}, {\"label\": \"其他\", \"value\": 13}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (774, 'a629343e537645c997c8c040de2c2f92', '103', 'RADIO', '您外出就餐的频率?', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"一个月1次\", \"value\": 1}, {\"label\": \"半个月1次\", \"value\": 2}, {\"label\": \"每周1次\", \"value\": 3}, {\"label\": \"每周2次或以上\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (775, 'a629343e537645c997c8c040de2c2f92', '104', 'RADIO', '选择餐厅时，您最关注的三个方面是？', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"价格便宜\", \"value\": 1}, {\"label\": \"口味适合\", \"value\": 2}, {\"label\": \"菜式新颖\", \"value\": 3}, {\"label\": \"卫生好\", \"value\": 4}, {\"label\": \"装饰格调好\", \"value\": 5}, {\"label\": \"品牌档次佳\", \"value\": 6}, {\"label\": \"服务周到\", \"value\": 7}, {\"label\": \"方便快捷\", \"value\": 8}, {\"label\": \"朋友推荐\", \"value\": 9}, {\"label\": \"优惠活动\", \"value\": 10}, {\"label\": \"交通便利\", \"value\": 11}, {\"label\": \"停车位充足\", \"value\": 12}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (776, 'a629343e537645c997c8c040de2c2f92', '105', 'RADIO', '您每月在外餐饮花费大约是？', 1, NULL, 1, NULL, 393216, 24, '{
  \"options\": [{\"label\": \"500以内\", \"value\": 1}, {\"label\": \"500-1000元\", \"value\": 2}, {\"label\": \"1000-2500元\", \"value\": 3}, {\"label\": \"2500元以上\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (777, 'a629343e537645c997c8c040de2c2f92', '106', 'RADIO', '您一般都和谁一起就餐（最多选2项）？', 1, NULL, 1, NULL, 458752, 24, '{
  \"options\": [{\"label\": \"朋友\", \"value\": 1}, {\"label\": \"家人\", \"value\": 2}, {\"label\": \"情侣/爱人\", \"value\": 3}, {\"label\": \"同事\", \"value\": 4}, {\"label\": \"客户\", \"value\": 5}, {\"label\": \"领导\", \"value\": 6}, {\"label\": \"同学\", \"value\": 7}, {\"label\": \"安静独处\", \"value\": 8}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (778, 'a629343e537645c997c8c040de2c2f92', '107', 'RADIO', '平均每人每次消费多少钱您可以接受？', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"20元以内\", \"value\": 1}, {\"label\": \"21-50元\", \"value\": 2}, {\"label\": \"51-100元\", \"value\": 3}, {\"label\": \"101-150元\", \"value\": 4}, {\"label\": \"151-200元\", \"value\": 5}, {\"label\": \"201-300元\", \"value\": 6}, {\"label\": \"301-500元\", \"value\": 7}, {\"label\": \"501元以上\", \"value\": 8}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (779, 'a629343e537645c997c8c040de2c2f92', '108', 'RADIO', '您了解主题餐厅吗？', 1, NULL, 1, NULL, 589824, 24, '{
  \"options\": [{\"label\": \"喜欢\", \"value\": 1}, {\"label\": \"有兴趣\", \"value\": 2}, {\"label\": \"不喜欢\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (780, 'a629343e537645c997c8c040de2c2f92', '109', 'RADIO', '如果发现一家新开的主题餐厅，您会怎么看？', 1, NULL, 1, NULL, 655360, 24,
        '{
          \"options\": [{\"label\": \"很好奇，自己先尝鲜\", \"value\": 1}, {\"label\": \"预备和好友一起来品尝\", \"value\": 2}, {\"label\": \"等他人尝试过后，再决定\", \"value\": 3}, {\"label\": \"看看，仅此而已\", \"value\": 4}, {\"label\": \"不会去理睬\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (781, 'a629343e537645c997c8c040de2c2f92', '110', 'RADIO', '您更喜欢哪类主题餐厅？', 1, NULL, 1, NULL, 720896, 24, '{
  \"options\": [{\"label\": \"以浪漫为主题\", \"value\": 1}, {\"label\": \"以休闲为主题\", \"value\": 2}, {\"label\": \"以怀旧为主题\", \"value\": 3}, {\"label\": \"以商务为主题\", \"value\": 4}, {\"label\": \"其他\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (782, 'a629343e537645c997c8c040de2c2f92', '111', 'RADIO', '您希望主题餐厅包含怎样的文化？', 1, NULL, 1, NULL, 786432, 24, '{
  \"options\": [{\"label\": \"古典文学\", \"value\": 1}, {\"label\": \"时尚潮流\", \"value\": 2}, {\"label\": \"温馨家庭\", \"value\": 3}, {\"label\": \"复古简约\", \"value\": 4}, {\"label\": \"其他\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (783, 'a629343e537645c997c8c040de2c2f92', '112', 'RADIO', '您希望主题餐厅布局形式是？', 1, NULL, 1, NULL, 851968, 24, '{
  \"options\": [{\"label\": \"包间\", \"value\": 1}, {\"label\": \"卡座\", \"value\": 2}, {\"label\": \"大厅\", \"value\": 3}, {\"label\": \"都有\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (784, 'a629343e537645c997c8c040de2c2f92', '113', 'RADIO', '您希望主题餐厅的就餐形式是？', 1, NULL, 1, NULL, 917504, 24, '{
  \"options\": [{\"label\": \"点餐制\", \"value\": 1}, {\"label\": \"自助式\", \"value\": 2}, {\"label\": \"套餐式\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (785, 'a629343e537645c997c8c040de2c2f92', '114', 'RADIO', '您更喜爱的菜系是？', 1, NULL, 1, NULL, 983040, 24, '{
  \"options\": [{\"label\": \"川湘菜\", \"value\": 1}, {\"label\": \"粤菜\", \"value\": 2}, {\"label\": \"其他地方菜系（江浙菜等）\", \"value\": 3}, {\"label\": \"快餐\", \"value\": 4}, {\"label\": \"火锅\", \"value\": 5}, {\"label\": \"日韩料理\", \"value\": 6}, {\"label\": \"西餐\", \"value\": 7}, {\"label\": \"特色小吃\", \"value\": 8}, {\"label\": \"其他\", \"value\": 9}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (786, 'a629343e537645c997c8c040de2c2f92', '115', 'INPUT', '您外出就餐经常点的菜品？ ', 1, NULL, 1, NULL, 1048576, 24, '{}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (787, 'a629343e537645c997c8c040de2c2f92', '116', 'INPUT', '您平时最爱吃的菜肴？ ', 1, NULL, 1, NULL, 1114112, 24, '{}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (788, '4f8189866d6f43d9b1afd78c93922a38', '100', 'RADIO', '您是否玩手机游戏', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"玩\", \"value\": 1}, {\"label\": \"不玩\", \"value\": 2}]}', NULL, '2021-01-11 13:58:39',
        '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (789, '4f8189866d6f43d9b1afd78c93922a38', '101', 'RADIO', '您玩游戏常用的手机系统是？ ', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"IOS\", \"value\": 1}, {\"label\": \"Android\", \"value\": 2}, {\"label\": \"windows phone\", \"value\": 3}, {\"label\": \"black Berry\", \"value\": 4}, {\"label\": \"其他\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (790, '4f8189866d6f43d9b1afd78c93922a38', '102', 'RADIO', '您手机里的游戏是否有通过付费下载？', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"有\", \"value\": 1}, {\"label\": \"没有\", \"value\": 2}]}', NULL, '2021-01-11 13:58:39',
        '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (791, '4f8189866d6f43d9b1afd78c93922a38', '103', 'RADIO', '请问您玩手游的过程中是否有过充值或购买等付费行为？', 1, NULL, 1, NULL, 262144,
        24, '{
    \"options\": [{\"label\": \"没有\", \"value\": 1}, {\"label\": \"有\", \"value\": 2}]}', NULL, '2021-01-11 13:58:39',
        '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (792, '4f8189866d6f43d9b1afd78c93922a38', '104', 'RADIO', '您是否知道手游能提供充值返利的福利？ ', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:39',
        '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (793, '4f8189866d6f43d9b1afd78c93922a38', '105', 'RADIO', '您是否有享受过充值返利？ ', 1, NULL, 1, NULL, 393216, 24, '{
  \"options\": [{\"label\": \"有\", \"value\": 1}, {\"label\": \"没有\", \"value\": 2}]}', NULL, '2021-01-11 13:58:39',
        '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (794, '4f8189866d6f43d9b1afd78c93922a38', '106', 'RADIO', '如果有充值需要，您是否愿意尝试了解充值返利？ ', 1, NULL, 1, NULL, 458752,
        24, '{
    \"options\": [{\"label\": \"愿意\", \"value\": 1}, {\"label\": \"不愿意\", \"value\": 2}]}', NULL, '2021-01-11 13:58:39',
        '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (795, '4f8189866d6f43d9b1afd78c93922a38', '107', 'INPUT', '您不愿意的原因是', 1, NULL, 1, NULL, 524288, 24, '{}', NULL,
        '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (796, '4f8189866d6f43d9b1afd78c93922a38', '108', 'RADIO', '您享受的返利比率是？ ', 1, NULL, 1, NULL, 589824, 24, '{
  \"options\": [{\"label\": \"10%\", \"value\": 1}, {\"label\": \"20%\", \"value\": 2}, {\"label\": \"30%\", \"value\": 3}, {\"label\": \"40%\", \"value\": 4}, {\"label\": \"50%及以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (797, '4f8189866d6f43d9b1afd78c93922a38', '109', 'RADIO', '若必须重新练号才能获得充值返利的权利，您会？ ', 1, NULL, 1, NULL, 655360,
        24, '{
    \"options\": [{\"label\": \"立即重新练号\", \"value\": 1}, {\"label\": \"等想换区或换游戏时再考虑\", \"value\": 2}, {\"label\": \"朋友或公会组织一起玩时再考虑\", \"value\": 3}, {\"label\": \"麻烦，不再考虑\", \"value\": 4}, {\"label\": \"其他\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (798, '4f8189866d6f43d9b1afd78c93922a38', '110', 'RADIO', '后续玩新区或玩新手游时，您是否会寻求充值返利的权利？', 1, NULL, 1, NULL, 720896,
        24, '{
    \"options\": [{\"label\": \"是\", \"value\": 1}, {\"label\": \"否\", \"value\": 2}]}', NULL, '2021-01-11 13:58:39',
        '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (799, '1f09399d87394dec94a2f3a82d3c81f3', '100', 'RADIO', '请选择性别', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"男\", \"value\": 1}, {\"label\": \"女\", \"value\": 2}]}', NULL, '2021-01-11 13:58:39',
        '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (800, '1f09399d87394dec94a2f3a82d3c81f3', '101', 'RADIO', '您的年龄段是？ ', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"20岁及以下\", \"value\": 1}, {\"label\": \"21-25岁\", \"value\": 2}, {\"label\": \"26-30岁\", \"value\": 3}, {\"label\": \"31-40岁\", \"value\": 4}, {\"label\": \"40岁以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (801, '1f09399d87394dec94a2f3a82d3c81f3', '102', 'RADIO', '您的职业： ', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"在校学生\", \"value\": 1}, {\"label\": \"政府/机关干部/公务员\", \"value\": 2}, {\"label\": \"企业管理者（包括基层及中高层管理者）\", \"value\": 3}, {\"label\": \"普通职员（办公室/写字楼工作人员）\", \"value\": 4}, {\"label\": \"专业人员（如医生/律师/文体/记者/老师等）\", \"value\": 5}, {\"label\": \"普通工人（如工厂工人/体力劳动者等）\", \"value\": 6}, {\"label\": \"商业服务业职工（如销售人员/商店职员/服务员等）\", \"value\": 7}, {\"label\": \"个体经营者/承包商\", \"value\": 8}, {\"label\": \"自由职业者\", \"value\": 9}, {\"label\": \"农林牧渔劳动者\", \"value\": 10}, {\"label\": \"退休\", \"value\": 11}, {\"label\": \"暂无职业\", \"value\": 12}, {\"label\": \"其他\", \"value\": 13}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (802, '1f09399d87394dec94a2f3a82d3c81f3', '103', 'RADIO', '您最近玩过手机游戏吗？', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"每天都玩\", \"value\": 1}, {\"label\": \"每周都玩\", \"value\": 2}, {\"label\": \"偶尔会玩\", \"value\": 3}, {\"label\": \"没玩过但感兴趣\", \"value\": 4}, {\"label\": \"不感兴趣\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (803, '1f09399d87394dec94a2f3a82d3c81f3', '104', 'RADIO', '下列哪种方式会让您对某一款游戏感兴趣？（最多选三项）', 1, NULL, 1, NULL, 327680,
        24, '{
    \"options\": [{\"label\": \"海报等平面广告\", \"value\": 1}, {\"label\": \"视频广告\", \"value\": 2}, {\"label\": \"视频推荐\", \"value\": 3}, {\"label\": \"图文信息推荐\", \"value\": 4}, {\"label\": \"朋友推荐\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (804, '1f09399d87394dec94a2f3a82d3c81f3', '105', 'RADIO', '您会在什么时间玩手机游戏？  （最多选三项）', 1, NULL, 1, NULL, 393216, 24,
        '{
          \"options\": [{\"label\": \"上下班路上\", \"value\": 1}, {\"label\": \"上班时间\", \"value\": 2}, {\"label\": \"吃饭时间\", \"value\": 3}, {\"label\": \"下班回家后\", \"value\": 4}, {\"label\": \"睡觉前\", \"value\": 5}, {\"label\": \"周末休息\", \"value\": 6}, {\"label\": \"上课时间\", \"value\": 7}, {\"label\": \"课余时间\", \"value\": 8}, {\"label\": \"上厕所时\", \"value\": 9}, {\"label\": \"其他\", \"value\": 10}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (805, '1f09399d87394dec94a2f3a82d3c81f3', '106', 'RADIO', '您会对哪些手机游戏相关内容感兴趣？（最多选三项）', 1, NULL, 1, NULL, 458752,
        24, '{
    \"options\": [{\"label\": \"游戏礼包\", \"value\": 1}, {\"label\": \"游戏攻略\", \"value\": 2}, {\"label\": \"游戏视频\", \"value\": 3}, {\"label\": \"游戏周边\", \"value\": 4}, {\"label\": \"其他\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (806, '1f09399d87394dec94a2f3a82d3c81f3', '107', 'RADIO', '您会关注手机游戏相关视频吗？', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"喜欢，经常看\", \"value\": 1}, {\"label\": \"一般，偶尔会看\", \"value\": 2}, {\"label\": \"没看过但感兴趣\", \"value\": 3}, {\"label\": \"不感兴趣\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (807, '1f09399d87394dec94a2f3a82d3c81f3', '108', 'RADIO', '对于新游戏，观看相关视频后您会去下载吗？', 1, NULL, 1, NULL, 589824, 24,
        '{
          \"options\": [{\"label\": \"会\", \"value\": 1}, {\"label\": \"不会\", \"value\": 2}, {\"label\": \"也许会\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (808, '1f09399d87394dec94a2f3a82d3c81f3', '111', 'RADIO', '对于玩过的游戏，您会去搜索和观看相关视频吗？', 1, NULL, 1, NULL, 655360, 24,
        '{
          \"options\": [{\"label\": \"会\", \"value\": 1}, {\"label\": \"不会\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (809, '1f09399d87394dec94a2f3a82d3c81f3', '113', 'RADIO', '您对哪种类型的手游视频感兴趣？', 1, NULL, 1, NULL, 720896, 24, '{
  \"options\": [{\"label\": \"专业手游资讯\", \"value\": 1}, {\"label\": \"专业评测\", \"value\": 2}, {\"label\": \"专业攻略\", \"value\": 3}, {\"label\": \"休闲手游吐槽\", \"value\": 4}, {\"label\": \"休闲周边\", \"value\": 5}, {\"label\": \"休闲美女主播解说\", \"value\": 6}, {\"label\": \"其他\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (810, '1f09399d87394dec94a2f3a82d3c81f3', '114', 'RADIO', '专业类视频您最感兴趣的是哪些？', 1, NULL, 1, NULL, 786432, 24, '{
  \"options\": [{\"label\": \"手游资讯\", \"value\": 1}, {\"label\": \"手游评测\", \"value\": 2}, {\"label\": \"手游攻略\", \"value\": 3}, {\"label\": \"高手进阶\", \"value\": 4}, {\"label\": \"实况直播\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (811, '1f09399d87394dec94a2f3a82d3c81f3', '115', 'RADIO', '休闲类视频您最感兴趣的是哪些？', 1, NULL, 1, NULL, 851968, 24, '{
  \"options\": [{\"label\": \"游戏吐槽\", \"value\": 1}, {\"label\": \"资讯杂谈\", \"value\": 2}, {\"label\": \"美女主播\", \"value\": 3}, {\"label\": \"其他\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (812, '1f09399d87394dec94a2f3a82d3c81f3', '116', 'RADIO', '您一般会在游戏什么阶段观看相关视频？', 1, NULL, 1, NULL, 917504, 24, '{
  \"options\": [{\"label\": \"游戏上线前，接触到资讯或者广告\", \"value\": 1}, {\"label\": \"游戏刚上线时，查看攻略等\", \"value\": 2}, {\"label\": \"游戏成熟期，查看攻略或者高手研究视频等。\", \"value\": 3}, {\"label\": \"其他\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (813, '1f09399d87394dec94a2f3a82d3c81f3', '117', 'RADIO', '您喜欢哪种方式的游戏攻略？', 1, NULL, 1, NULL, 983040, 24, '{
  \"options\": [{\"label\": \"图文\", \"value\": 1}, {\"label\": \"视频\", \"value\": 2}, {\"label\": \"其他\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (814, '1f09399d87394dec94a2f3a82d3c81f3', '118', 'RADIO', '玩游戏时您会查看攻略吗？', 1, NULL, 1, NULL, 1048576, 24, '{
  \"options\": [{\"label\": \"玩游戏前，查清楚玩法再去玩\", \"value\": 1}, {\"label\": \"玩游戏时，碰到问题再去查\", \"value\": 2}, {\"label\": \"游戏结束时，查看攻略总结经验\", \"value\": 3}, {\"label\": \"其他\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (815, '1f09399d87394dec94a2f3a82d3c81f3', '119', 'RADIO', '您希望通过下列哪些方式赚钱积分？', 1, NULL, 1, NULL, 1114112, 24, '{
  \"options\": [{\"label\": \"评论吐槽\", \"value\": 1}, {\"label\": \"社交聊天\", \"value\": 2}, {\"label\": \"下载推荐游戏\", \"value\": 3}, {\"label\": \"登陆签到\", \"value\": 4}, {\"label\": \"其他\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (816, '1f09399d87394dec94a2f3a82d3c81f3', '120', 'RADIO', '除了游戏，您还对以下哪些内容感兴趣？', 1, NULL, 1, NULL, 1179648, 24, '{
  \"options\": [{\"label\": \"韩剧\", \"value\": 1}, {\"label\": \"美剧\", \"value\": 2}, {\"label\": \"动漫\", \"value\": 3}, {\"label\": \"电影\", \"value\": 4}, {\"label\": \"综艺\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (817, '1f09399d87394dec94a2f3a82d3c81f3', '121', 'RADIO', '您习惯在什么时间看视频？', 1, NULL, 1, NULL, 1245184, 24, '{
  \"options\": [{\"label\": \"上下班路上\", \"value\": 1}, {\"label\": \"上班时间\", \"value\": 2}, {\"label\": \"吃饭时间\", \"value\": 3}, {\"label\": \"下班回家后\", \"value\": 4}, {\"label\": \"睡觉前\", \"value\": 5}, {\"label\": \"周末休息\", \"value\": 6}, {\"label\": \"上课时间\", \"value\": 7}, {\"label\": \"课余时间\", \"value\": 8}, {\"label\": \"上厕所时\", \"value\": 9}, {\"label\": \"其他\", \"value\": 10}]}',
        NULL, '2021-01-11 13:58:39', '2021-01-11 13:58:39', 0);
INSERT INTO `pr_project_template_item`
VALUES (818, 'c206940b3bc3468bb332eaf0bd56d06d', '100', 'RADIO', '您的性别', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"男\", \"value\": 1}, {\"label\": \"女\", \"value\": 2}]}', NULL, '2021-01-11 13:58:40',
        '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (819, 'c206940b3bc3468bb332eaf0bd56d06d', '101', 'RADIO', '您的年龄? ', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"20岁及以下\", \"value\": 1}, {\"label\": \"21-25 岁\", \"value\": 2}, {\"label\": \"26-30 岁\", \"value\": 3}, {\"label\": \"31-40 岁\", \"value\": 4}, {\"label\": \"40岁以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (820, 'c206940b3bc3468bb332eaf0bd56d06d', '102', 'RADIO', '您的月收入（或生活费）? ', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"1000元以下\", \"value\": 1}, {\"label\": \"1001-2000元\", \"value\": 2}, {\"label\": \"2001-3000元\", \"value\": 3}, {\"label\": \"3001-5000元\", \"value\": 4}, {\"label\": \"5001-8000元\", \"value\": 5}, {\"label\": \"8001-10000元\", \"value\": 6}, {\"label\": \"10001-20000元\", \"value\": 7}, {\"label\": \"20000元以上\", \"value\": 8}, {\"label\": \"不方便透露\", \"value\": 9}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (821, 'c206940b3bc3468bb332eaf0bd56d06d', '103', 'RADIO', '手机系统类型', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"IOS\", \"value\": 1}, {\"label\": \"Android\", \"value\": 2}, {\"label\": \"windows phone\", \"value\": 3}, {\"label\": \"black Berry\", \"value\": 4}, {\"label\": \"其他\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (822, 'c206940b3bc3468bb332eaf0bd56d06d', '104', 'RADIO', '您最常用的手机游戏下载方式？', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"游戏官网下载\", \"value\": 1}, {\"label\": \"手机自带下载中心\", \"value\": 2}, {\"label\": \"应用宝\", \"value\": 3}, {\"label\": \"百度搜索\", \"value\": 4}, {\"label\": \"App Store\", \"value\": 5}, {\"label\": \"360\", \"value\": 6}, {\"label\": \"UC\", \"value\": 7}, {\"label\": \"当乐\", \"value\": 8}, {\"label\": \"拇指玩\", \"value\": 9}, {\"label\": \"小米\", \"value\": 10}, {\"label\": \"91\", \"value\": 11}, {\"label\": \"豌豆荚\", \"value\": 12}, {\"label\": \"其他\", \"value\": 13}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (823, 'c206940b3bc3468bb332eaf0bd56d06d', '105', 'RADIO', '您常玩的或会尝试的手机游戏类型：', 1, NULL, 1, NULL, 393216, 24, '{
  \"options\": [{\"label\": \"角色扮演\", \"value\": 1}, {\"label\": \"卡牌类\", \"value\": 2}, {\"label\": \"动作格斗\", \"value\": 3}, {\"label\": \"战争策略\", \"value\": 4}, {\"label\": \"模拟经营\", \"value\": 5}, {\"label\": \"体育竞技\", \"value\": 6}, {\"label\": \"音乐类\", \"value\": 7}, {\"label\": \"塔防类\", \"value\": 8}, {\"label\": \"休闲类\", \"value\": 9}, {\"label\": \"其他\", \"value\": 10}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (824, 'c206940b3bc3468bb332eaf0bd56d06d', '106', 'RADIO', '您每天玩手机游戏花费的时间：', 1, NULL, 1, NULL, 458752, 24, '{
  \"options\": [{\"label\": \"1小时以内\", \"value\": 1}, {\"label\": \"1-2小时\", \"value\": 2}, {\"label\": \"2-3小时\", \"value\": 3}, {\"label\": \"3-5小时\", \"value\": 4}, {\"label\": \"5小时以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (825, 'c206940b3bc3468bb332eaf0bd56d06d', '107', 'RADIO', '您是否玩过以下手机游戏', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"我叫MT 2\", \"value\": 1}, {\"label\": \"天天酷跑\", \"value\": 2}, {\"label\": \"全民突击\", \"value\": 3}, {\"label\": \"全民飞机大战\", \"value\": 4}, {\"label\": \"欢乐斗地主\", \"value\": 5}, {\"label\": \"欢乐王国\", \"value\": 6}, {\"label\": \"欢乐斗牛\", \"value\": 7}, {\"label\": \"QQ餐厅\", \"value\": 8}, {\"label\": \"英雄杀\", \"value\": 9}, {\"label\": \"仙剑奇侠传\", \"value\": 10}, {\"label\": \"天天风之旅\", \"value\": 11}, {\"label\": \"游龙英雄\", \"value\": 12}, {\"label\": \"七骑士\", \"value\": 13}, {\"label\": \"三国塔防魏传\", \"value\": 14}, {\"label\": \"其他\", \"value\": 15}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (826, 'c206940b3bc3468bb332eaf0bd56d06d', '108', 'RADIO', '您最喜欢的手机游戏画面风格是', 1, NULL, 1, NULL, 589824, 24, '{
  \"options\": [{\"label\": \"欧洲中世纪\", \"value\": 1}, {\"label\": \"日本风格\", \"value\": 2}, {\"label\": \"中国仙侠\", \"value\": 3}, {\"label\": \"科幻宇宙\", \"value\": 4}, {\"label\": \"现代战争\", \"value\": 5}, {\"label\": \"生活写实\", \"value\": 6}, {\"label\": \"Q萌风\", \"value\": 7}, {\"label\": \"像素风\", \"value\": 8}, {\"label\": \"其他\", \"value\": 9}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (827, 'c206940b3bc3468bb332eaf0bd56d06d', '109', 'RADIO', '在哪些情况下，您会考虑为手机游戏消费？', 1, NULL, 1, NULL, 655360, 24, '{
  \"options\": [{\"label\": \"该游戏内的大部分玩家都消费了\", \"value\": 1}, {\"label\": \"可以使自己拥有明显的优势\", \"value\": 2}, {\"label\": \"习惯性消费\", \"value\": 3}, {\"label\": \"不消费则无法继续游戏\", \"value\": 4}, {\"label\": \"无论如何都不会消费\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (828, 'c206940b3bc3468bb332eaf0bd56d06d', '110', 'RADIO', '您每周为经常玩的一款手机游戏最多花费多少钱？', 1, NULL, 1, NULL, 720896, 24,
        '{
          \"options\": [{\"label\": \"1-5元\", \"value\": 1}, {\"label\": \"6-10元\", \"value\": 2}, {\"label\": \"11-50元\", \"value\": 3}, {\"label\": \"51-100元\", \"value\": 4}, {\"label\": \"101-500元\", \"value\": 5}, {\"label\": \"500元及以上\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (829, 'c206940b3bc3468bb332eaf0bd56d06d', '111', 'RADIO', '您为一款游戏花费最多的道具类型是？', 1, NULL, 1, NULL, 786432, 24, '{
  \"options\": [{\"label\": \"随机抽装备/卡牌/宠物\", \"value\": 1}, {\"label\": \"装备/卡牌/宠物强化培养\", \"value\": 2}, {\"label\": \"角色时装\", \"value\": 3}, {\"label\": \"实用类道具，如包裹，喇叭等\", \"value\": 4}, {\"label\": \"复活、续关类道具\", \"value\": 5}, {\"label\": \"增益的道具，如双倍经验等\", \"value\": 6}, {\"label\": \"其他\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (830, 'c206940b3bc3468bb332eaf0bd56d06d', '112', 'RADIO', '您是否会因为喜欢的明星代言而去玩TA推荐的游戏？', 1, NULL, 1, NULL, 851968,
        24, '{
    \"options\": [{\"label\": \"不会\", \"value\": 1}, {\"label\": \"会去尝试一下\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (831, 'c206940b3bc3468bb332eaf0bd56d06d', '113', 'RADIO', '您主要通过哪些途径了解到正在玩的游戏？', 1, NULL, 1, NULL, 917504, 24, '{
  \"options\": [{\"label\": \"微信朋友圈转发\", \"value\": 1}, {\"label\": \"微博、QQ转发\", \"value\": 2}, {\"label\": \"App Store等应用平台\", \"value\": 3}, {\"label\": \"游戏媒体网站，如17173等\", \"value\": 4}, {\"label\": \"手机WAP门户网站\", \"value\": 5}, {\"label\": \"地铁、电梯间的户外广告\", \"value\": 6}, {\"label\": \"朋友推荐\", \"value\": 7}, {\"label\": \"其他\", \"value\": 8}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (832, 'c206940b3bc3468bb332eaf0bd56d06d', '114', 'RADIO', '在游戏产品的广告中，您觉得哪部分会最吸引您？', 1, NULL, 1, NULL, 983040, 24,
        '{
          \"options\": [{\"label\": \"有自己喜欢的明星代言\", \"value\": 1}, {\"label\": \"丰厚奖励的活动\", \"value\": 2}, {\"label\": \"知名漫画、电视剧、游戏等改编的作品\", \"value\": 3}, {\"label\": \"有冲击感的游戏画面\", \"value\": 4}, {\"label\": \"其他\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (833, 'c206940b3bc3468bb332eaf0bd56d06d', '115', 'RADIO', '您更喜欢通过哪种渠道了解游戏：', 1, NULL, 1, NULL, 1048576, 24, '{
  \"options\": [{\"label\": \"广告投放\", \"value\": 1}, {\"label\": \"新闻发布\", \"value\": 2}, {\"label\": \"论坛讨论\", \"value\": 3}, {\"label\": \"激活码及礼包发放等活动\", \"value\": 4}, {\"label\": \"视频推荐\", \"value\": 5}, {\"label\": \"微信转发\", \"value\": 6}, {\"label\": \"微博发布\", \"value\": 7}, {\"label\": \"官方Q群发布\", \"value\": 8}, {\"label\": \"朋友推荐\", \"value\": 9}, {\"label\": \"其他\", \"value\": 10}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (834, 'c206940b3bc3468bb332eaf0bd56d06d', '116', 'RADIO', '您平时习惯在以下哪里讨论游戏？', 1, NULL, 1, NULL, 1114112, 24, '{
  \"options\": [{\"label\": \"百度贴吧\", \"value\": 1}, {\"label\": \"游戏论坛\", \"value\": 2}, {\"label\": \"微博微信\", \"value\": 3}, {\"label\": \"QQ 群\", \"value\": 4}, {\"label\": \"YY、QT 等聊天软件\", \"value\": 5}, {\"label\": \"多玩等媒体专区\", \"value\": 6}, {\"label\": \"面对面\", \"value\": 7}, {\"label\": \"其他\", \"value\": 8}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (835, 'c206940b3bc3468bb332eaf0bd56d06d', '117', 'RADIO', '你目前所使用的手机通信运营商', 1, NULL, 1, NULL, 1179648, 24, '{
  \"options\": [{\"label\": \"中国移动\", \"value\": 1}, {\"label\": \"中国联通\", \"value\": 2}, {\"label\": \"中国电信\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (836, 'c206940b3bc3468bb332eaf0bd56d06d', '118', 'RADIO', '玩手机游戏时，你会关注它的开发商和运营商？', 1, NULL, 1, NULL, 1245184, 24,
        '{
          \"options\": [{\"label\": \"会关注\", \"value\": 1}, {\"label\": \"不会关注，好玩就行\", \"value\": 2}, {\"label\": \"偶尔\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (837, 'c206940b3bc3468bb332eaf0bd56d06d', '119', 'RADIO', '你认为智能手机的普及给手机游戏带来了什么影响？', 1, NULL, 1, NULL, 1310720,
        24, '{
    \"options\": [{\"label\": \"精美的画面\", \"value\": 1}, {\"label\": \"更便捷的操作\", \"value\": 2}, {\"label\": \"更丰富的游戏内容\", \"value\": 3}, {\"label\": \"更流畅的游戏速度\", \"value\": 4}, {\"label\": \"其他\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (838, 'c206940b3bc3468bb332eaf0bd56d06d', '120', 'RADIO', '你认为目前手机游戏有哪些不足 ', 1, NULL, 1, NULL, 1376256, 24, '{
  \"options\": [{\"label\": \"追求低成本和短期利益，游戏质量粗糙\", \"value\": 1}, {\"label\": \"手机游戏的同质化严重，创新不够\", \"value\": 2}, {\"label\": \"不重视市场的宣传和推广工作\", \"value\": 3}, {\"label\": \"忽视用户的体验和习惯方式\", \"value\": 4}, {\"label\": \"资费标准单一，价格的多样化不足\", \"value\": 5}, {\"label\": \"手机游戏产品用户和手机游戏终端用户之间的矛盾\", \"value\": 6}, {\"label\": \"其他\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (839, 'c206940b3bc3468bb332eaf0bd56d06d', '121', 'RADIO', '你希望未来的手机游戏是怎样的？', 1, NULL, 1, NULL, 1441792, 24, '{
  \"options\": [{\"label\": \"持续提升手机游戏用户体验\", \"value\": 1}, {\"label\": \"智能化\", \"value\": 2}, {\"label\": \"有专业的手机游戏平台\", \"value\": 3}, {\"label\": \"有新手演练的环节\", \"value\": 4}, {\"label\": \"能与更多好友PK\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (840, '8801cdbb5c394c599437d8c37da25903', '100', 'RADIO', '您在《xx》的级别是？', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"1级-10级\", \"value\": 1}, {\"label\": \"11级-20级\", \"value\": 2}, {\"label\": \"20级-30级\", \"value\": 3}, {\"label\": \"30级-60级\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (841, '8801cdbb5c394c599437d8c37da25903', '101', 'RADIO', '您是怎么知道《xx》的？', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"朋友推荐\", \"value\": 1}, {\"label\": \"论坛/贴吧\", \"value\": 2}, {\"label\": \"博客微博\", \"value\": 3}, {\"label\": \"微信朋友圈\", \"value\": 4}, {\"label\": \"百度等搜索引擎\", \"value\": 5}, {\"label\": \"PPS、PPTV、优酷等视频网站\", \"value\": 6}, {\"label\": \"游戏公会、公会论坛\", \"value\": 7}, {\"label\": \"游戏网站及门户网站游戏频道\", \"value\": 8}, {\"label\": \"游戏应用排行榜\", \"value\": 9}, {\"label\": \"应用商店\", \"value\": 10}, {\"label\": \"游戏代言人\", \"value\": 11}, {\"label\": \"运营商/开发商的品牌知名度\", \"value\": 12}, {\"label\": \"其他\", \"value\": 13}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (842, '8801cdbb5c394c599437d8c37da25903', '102', 'RADIO', '是什么让您决定玩《xx》？', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"游戏画面、音效\", \"value\": 1}, {\"label\": \"游戏剧情、题材\", \"value\": 2}, {\"label\": \"战斗系统\", \"value\": 3}, {\"label\": \"关卡设计\", \"value\": 4}, {\"label\": \"角色成长\", \"value\": 5}, {\"label\": \"服务器人数\", \"value\": 6}, {\"label\": \"游戏版本更新速度\", \"value\": 7}, {\"label\": \"游戏活动\", \"value\": 8}, {\"label\": \"交友系统\", \"value\": 9}, {\"label\": \"其他\", \"value\": 10}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (843, '8801cdbb5c394c599437d8c37da25903', '103', 'RADIO', '您认为哪些情况使你在《xx》中感到快乐？', 1, NULL, 1, NULL, 262144, 24,
        '{
          \"options\": [{\"label\": \"击败其他玩家，抢占更多的财富和地盘\", \"value\": 0}, {\"label\": \"游戏获得现实物品\", \"value\": 2}, {\"label\": \"在游戏中认识志同道合的朋友\", \"value\": 3}, {\"label\": \"以优惠价格在线团购\", \"value\": 4}, {\"label\": \"独自发展或者游历，达成更高的等级\", \"value\": 5}, {\"label\": \"攻城群战\", \"value\": 6}, {\"label\": \"收集罕见奇特的物品\", \"value\": 7}, {\"label\": \"与其他玩家进行各种交易，积累财富\", \"value\": 0}, {\"label\": \"其他\", \"value\": 9}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (844, '8801cdbb5c394c599437d8c37da25903', '105', 'RADIO', '您会因为以下哪些情况而离开一款游戏？', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"对游戏产生厌倦感\", \"value\": 1}, {\"label\": \"游戏更新太慢\", \"value\": 2}, {\"label\": \"服务器不稳定\", \"value\": 3}, {\"label\": \"客户服务不好\", \"value\": 4}, {\"label\": \"平衡性太差\", \"value\": 5}, {\"label\": \"帐号被盗\", \"value\": 6}, {\"label\": \"外挂\", \"value\": 7}, {\"label\": \"没有时间\", \"value\": 8}, {\"label\": \"花费太高\", \"value\": 9}, {\"label\": \"朋友的离开\", \"value\": 10}, {\"label\": \"家人/朋友的反对\", \"value\": 11}, {\"label\": \"新游戏的出现\", \"value\": 12}, {\"label\": \"其他\", \"value\": 13}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (845, '8801cdbb5c394c599437d8c37da25903', '106', 'RADIO', '您最喜欢的游戏活动？', 1, NULL, 1, NULL, 393216, 24, '{
  \"options\": [{\"label\": \"选秀类：如选美女，选明星玩家\", \"value\": 1}, {\"label\": \"运营类：如节日送宝箱、经验\", \"value\": 2}, {\"label\": \"征集类：如征集照片、视频\", \"value\": 3}, {\"label\": \"比赛竞技类：如线上对战赛\", \"value\": 4}, {\"label\": \"聚会类：如线下玩家见面会、公会聚会\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (846, '8801cdbb5c394c599437d8c37da25903', '107', 'RADIO', '您最喜欢的游戏奖励？', 1, NULL, 1, NULL, 458752, 24, '{
  \"options\": [{\"label\": \"非游戏奖励：如送QB卡、京东卡\", \"value\": 1}, {\"label\": \"手机流量奖励\", \"value\": 2}, {\"label\": \"限量游戏奖励：如新手礼包\", \"value\": 3}, {\"label\": \"游戏周边奖励：如游戏公仔\", \"value\": 4}, {\"label\": \"游戏特权奖励：如特权礼包\", \"value\": 5}, {\"label\": \"数码电子产品奖励\", \"value\": 6}, {\"label\": \"其他\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (847, '8801cdbb5c394c599437d8c37da25903', '108', 'RADIO', '您每月在手机游戏上的花费？', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"1-50元\", \"value\": 1}, {\"label\": \"51-100元\", \"value\": 2}, {\"label\": \"101-200元\", \"value\": 3}, {\"label\": \"201-500元\", \"value\": 4}, {\"label\": \"500-1000元\", \"value\": 5}, {\"label\": \"1000元以上\", \"value\": 6}, {\"label\": \"从不花费\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (848, '8801cdbb5c394c599437d8c37da25903', '109', 'RADIO', '您在《xx》中消费的直接用途包括哪些？', 1, NULL, 1, NULL, 589824, 24, '{
  \"options\": [{\"label\": \"购买游戏币\", \"value\": 1}, {\"label\": \"购买VIP卡或双倍经验等日常道具\", \"value\": 2}, {\"label\": \"购买游戏装备宝石等待强化角色用物品\", \"value\": 3}, {\"label\": \"购买直接获取经验的道具、外挂，或雇佣代练\", \"value\": 4}, {\"label\": \"购买时装、个性头衔等装饰品\", \"value\": 5}, {\"label\": \"购买游戏帐号\", \"value\": 6}, {\"label\": \"其他\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (849, '8801cdbb5c394c599437d8c37da25903', '110', 'RADIO', '您平时在哪里玩游戏？', 1, NULL, 1, NULL, 655360, 24, '{
  \"options\": [{\"label\": \"家里\", \"value\": 1}, {\"label\": \"学校\", \"value\": 2}, {\"label\": \"上下班路上\", \"value\": 3}, {\"label\": \"公司\", \"value\": 4}, {\"label\": \"餐厅、车站等有免费wifi的地方\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (850, '8801cdbb5c394c599437d8c37da25903', '111', 'RADIO', '初次下载手机游戏能接受多大的客户端？', 1, NULL, 1, NULL, 720896, 24, '{
  \"options\": [{\"label\": \"20M以下\", \"value\": 1}, {\"label\": \"20-50M\", \"value\": 2}, {\"label\": \"51-100M\", \"value\": 3}, {\"label\": \"101-200M\", \"value\": 4}, {\"label\": \"只要想玩无所谓大小\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (851, '8801cdbb5c394c599437d8c37da25903', '112', 'RADIO', '您玩游戏的经验是？', 1, NULL, 1, NULL, 786432, 24, '{
  \"options\": [{\"label\": \"1-2年\", \"value\": 1}, {\"label\": \"3-4年\", \"value\": 2}, {\"label\": \"4-5年\", \"value\": 3}, {\"label\": \"5年以上\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (852, '8801cdbb5c394c599437d8c37da25903', '113', 'RADIO', '您的性别？', 1, NULL, 1, NULL, 851968, 24, '{
  \"options\": [{\"label\": \"男\", \"value\": 1}, {\"label\": \"女\", \"value\": 2}]}', NULL, '2021-01-11 13:58:40',
        '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (853, '8801cdbb5c394c599437d8c37da25903', '114', 'RADIO', '您的年龄? ', 1, NULL, 1, NULL, 917504, 24, '{
  \"options\": [{\"label\": \"20岁及以下\", \"value\": 1}, {\"label\": \"21-25 岁\", \"value\": 2}, {\"label\": \"26-30 岁\", \"value\": 3}, {\"label\": \"31-40 岁\", \"value\": 4}, {\"label\": \"40岁以上\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (854, '8801cdbb5c394c599437d8c37da25903', '115', 'RADIO', '您的职业： ', 1, NULL, 1, NULL, 983040, 24, '{
  \"options\": [{\"label\": \"在校学生\", \"value\": 1}, {\"label\": \"政府/机关干部/公务员\", \"value\": 2}, {\"label\": \"企业管理者（包括基层及中高层管理者）\", \"value\": 3}, {\"label\": \"普通职员（办公室/写字楼工作人员）\", \"value\": 4}, {\"label\": \"专业人员（如医生/律师/文体/记者/老师等）\", \"value\": 5}, {\"label\": \"普通工人（如工厂工人/体力劳动者等）\", \"value\": 6}, {\"label\": \"商业服务业职工（如销售人员/商店职员/服务员等）\", \"value\": 7}, {\"label\": \"个体经营者/承包商\", \"value\": 8}, {\"label\": \"自由职业者\", \"value\": 9}, {\"label\": \"农林牧渔劳动者\", \"value\": 10}, {\"label\": \"退休\", \"value\": 11}, {\"label\": \"暂无职业\", \"value\": 12}, {\"label\": \"其他\", \"value\": 13}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (855, '8801cdbb5c394c599437d8c37da25903', '116', 'RADIO', '您的受教育程度是? ', 1, NULL, 1, NULL, 1048576, 24, '{
  \"options\": [{\"label\": \"初中及以下\", \"value\": 1}, {\"label\": \"高中/中专\", \"value\": 2}, {\"label\": \"大专\", \"value\": 3}, {\"label\": \"本科\", \"value\": 4}, {\"label\": \"硕士\", \"value\": 5}, {\"label\": \"博士及以上\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (856, '8801cdbb5c394c599437d8c37da25903', '117', 'RADIO', '您的月收入（或生活费）? ', 1, NULL, 1, NULL, 1114112, 24, '{
  \"options\": [{\"label\": \"1000元以下\", \"value\": 1}, {\"label\": \"1001-2000元\", \"value\": 2}, {\"label\": \"2001-3000元\", \"value\": 3}, {\"label\": \"3001-5000元\", \"value\": 4}, {\"label\": \"5001-8000元\", \"value\": 5}, {\"label\": \"8001-10000元\", \"value\": 6}, {\"label\": \"10001-20000元\", \"value\": 7}, {\"label\": \"20000元以上\", \"value\": 8}, {\"label\": \"不方便透露\", \"value\": 9}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (857, '8801cdbb5c394c599437d8c37da25903', '118', 'INPUT', '您的所在地？', 1, NULL, 1, NULL, 1179648, 24, '{}', NULL,
        '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (858, '8801cdbb5c394c599437d8c37da25903', '119', 'INPUT', '您的区服和角色名字？', 1, NULL, 1, NULL, 1245184, 24, '{}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (859, '8801cdbb5c394c599437d8c37da25903', '120', 'INPUT', '您的QQ号（以作抽奖标准）', 1, NULL, 1, NULL, 1310720, 24, '{}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (860, '8801cdbb5c394c599437d8c37da25903', '121', 'INPUT', '您的手机号（以便奖励通知）', 1, NULL, 1, NULL, 1376256, 24, '{}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (861, '03175b0817564a5b90c031cafcdbd275', '100', 'RADIO', '您是从什么地方得知（关注）XX公众号的？', 1, NULL, 1, NULL, 65536, 24, '{
  \"options\": [{\"label\": \"朋友推荐\", \"value\": 1}, {\"label\": \"相关文章\", \"value\": 2}, {\"label\": \"二维码扫描\", \"value\": 3}, {\"label\": \"主动搜索\", \"value\": 4}, {\"label\": \"社交平台（百度贴吧/新浪微博)\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (862, '03175b0817564a5b90c031cafcdbd275', '101', 'RADIO', '您最喜欢XX公众号的哪个功能？', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"查成绩\", \"value\": 1}, {\"label\": \"校花校草\", \"value\": 2}, {\"label\": \"表白墙\", \"value\": 3}, {\"label\": \"校园街景\", \"value\": 4}, {\"label\": \"其他，请注明\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (863, '03175b0817564a5b90c031cafcdbd275', '102', 'RADIO', '您最喜欢XX公众号哪些方面的消息推送？', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"学校通知\", \"value\": 1}, {\"label\": \"社团活动\", \"value\": 2}, {\"label\": \"原创文章\", \"value\": 3}, {\"label\": \"其他，请注明\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (864, '03175b0817564a5b90c031cafcdbd275', '103', 'RADIO', '您一般在什么时间查看我们的推送内容？', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"早上起床后\", \"value\": 1}, {\"label\": \"中午休息时\", \"value\": 2}, {\"label\": \"上课时间\", \"value\": 3}, {\"label\": \"晚上睡觉前\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (865, '03175b0817564a5b90c031cafcdbd275', '104', 'RADIO', '您最喜欢什么形式的消息推送？', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"纯文字\", \"value\": 1}, {\"label\": \"图文欣赏\", \"value\": 2}, {\"label\": \"视频消息\", \"value\": 3}, {\"label\": \"语音消息\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (866, '03175b0817564a5b90c031cafcdbd275', '105', 'RADIO', '您觉得XX公众号推送频率多少可以接受？', 1, NULL, 1, NULL, 393216, 24, '{
  \"options\": [{\"label\": \"每天一次\", \"value\": 1}, {\"label\": \"两天一次\", \"value\": 2}, {\"label\": \"一周两次\", \"value\": 3}, {\"label\": \"一周一次\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (867, '03175b0817564a5b90c031cafcdbd275', '106', 'RADIO', '您关注了多少个公众号？', 1, NULL, 1, NULL, 458752, 24, '{
  \"options\": [{\"label\": \"10个以内\", \"value\": 1}, {\"label\": \"10—20个\", \"value\": 2}, {\"label\": \"太多了，没有数过\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (868, '03175b0817564a5b90c031cafcdbd275', '107', 'RADIO', '您所在的年级是？', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"大一\", \"value\": 1}, {\"label\": \"大二\", \"value\": 2}, {\"label\": \"大三\", \"value\": 3}, {\"label\": \"大四\", \"value\": 4}, {\"label\": \"校友\", \"value\": 5}, {\"label\": \"其他\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (869, '03175b0817564a5b90c031cafcdbd275', '108', 'RADIO', '您对我们的XX公众号总体满意度如何？', 1, NULL, 1, NULL, 589824, 24, '{
  \"options\": [{\"label\": \"非常满意\", \"value\": 1}, {\"label\": \"比较满意\", \"value\": 2}, {\"label\": \"感觉一般\", \"value\": 3}, {\"label\": \"比较不满意\", \"value\": 4}, {\"label\": \"非常不满意\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (870, '03175b0817564a5b90c031cafcdbd275', '111', 'INPUT', '您的昵称是？', 1, NULL, 1, NULL, 655360, 24, '{}', NULL,
        '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (871, '03175b0817564a5b90c031cafcdbd275', '112', 'INPUT', '您的联系方式（方便奖品发放）是？', 1, NULL, 1, NULL, 720896, 24, '{}',
        NULL, '2021-01-11 13:58:40', '2021-01-11 13:58:40', 0);
INSERT INTO `pr_project_template_item`
VALUES (872, 'dffa146278884eec9298aaa6b2d3840f', '100', 'INPUT', '您的姓名是？\n', 1, NULL, 1, NULL, 65536, 24, '{}', NULL,
        '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (873, 'dffa146278884eec9298aaa6b2d3840f', '101', 'RADIO', '您的性别是？\n', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"男\\n\", \"value\": 1}, {\"label\": \"女\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (874, 'dffa146278884eec9298aaa6b2d3840f', '102', 'RADIO', '您的身份类别是？\n', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"学生\\n\", \"value\": 1}, {\"label\": \"教师\\n\", \"value\": 2}, {\"label\": \"员工\\n\", \"value\": 3}, {\"label\": \"离退休人员\\n\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (875, 'dffa146278884eec9298aaa6b2d3840f', '103', 'INPUT', '您的学号是？【非必答】\n', 1, NULL, 0, NULL, 262144, 24, '{}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (876, 'dffa146278884eec9298aaa6b2d3840f', '104', 'INPUT', '您的工号是？【非必答】\n', 1, NULL, 0, NULL, 327680, 24, '{}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (877, 'dffa146278884eec9298aaa6b2d3840f', '105', 'DATE', '您所在的学院班级是？\n', 1, NULL, 1, NULL, 393216, 24, '{}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (878, 'dffa146278884eec9298aaa6b2d3840f', '106', 'DATE', '您所在的科室是？\n', 1, NULL, 1, NULL, 458752, 24, '{}', NULL,
        '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (879, 'dffa146278884eec9298aaa6b2d3840f', '107', 'DATE', '您的户籍所在地是？\n', 1, NULL, 1, NULL, 524288, 24, '{}', NULL,
        '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (880, 'dffa146278884eec9298aaa6b2d3840f', '108', 'SELECT', '您的出生年份是？\n', 1, NULL, 1, NULL, 589824, 24, '{
  \"options\": [{\"label\": \"2010年后\", \"value\": 1}, {\"label\": \"2010年\", \"value\": 2}, {\"label\": \"2009年\", \"value\": 3}, {\"label\": \"2008年\", \"value\": 4}, {\"label\": \"2007年\", \"value\": 5}, {\"label\": \"2006年\", \"value\": 6}, {\"label\": \"2005年\", \"value\": 7}, {\"label\": \"2004年\", \"value\": 8}, {\"label\": \"2003年\", \"value\": 9}, {\"label\": \"2002年\", \"value\": 10}, {\"label\": \"2001年\", \"value\": 11}, {\"label\": \"2000年\", \"value\": 12}, {\"label\": \"1999年\", \"value\": 13}, {\"label\": \"1998年\", \"value\": 14}, {\"label\": \"1997年\", \"value\": 15}, {\"label\": \"1996年\", \"value\": 16}, {\"label\": \"1995年\", \"value\": 17}, {\"label\": \"1994年\", \"value\": 18}, {\"label\": \"1993年\", \"value\": 19}, {\"label\": \"1992年\", \"value\": 20}, {\"label\": \"1991年\", \"value\": 21}, {\"label\": \"1990年\", \"value\": 22}, {\"label\": \"1989年\", \"value\": 23}, {\"label\": \"1988年\", \"value\": 24}, {\"label\": \"1987年\", \"value\": 25}, {\"label\": \"1986年\", \"value\": 26}, {\"label\": \"1985年\", \"value\": 27}, {\"label\": \"1984年\", \"value\": 28}, {\"label\": \"1983年\", \"value\": 29}, {\"label\": \"1982年\", \"value\": 30}, {\"label\": \"1981年\", \"value\": 31}, {\"label\": \"1980年\", \"value\": 32}, {\"label\": \"1979年\", \"value\": 33}, {\"label\": \"1978年\", \"value\": 34}, {\"label\": \"1977年\", \"value\": 35}, {\"label\": \"1976年\", \"value\": 36}, {\"label\": \"1975年\", \"value\": 37}, {\"label\": \"1974年\", \"value\": 38}, {\"label\": \"1973年\", \"value\": 39}, {\"label\": \"1972年\", \"value\": 40}, {\"label\": \"1971年\", \"value\": 41}, {\"label\": \"1970年\", \"value\": 42}, {\"label\": \"1969年\", \"value\": 43}, {\"label\": \"1968年\", \"value\": 44}, {\"label\": \"1967年\", \"value\": 45}, {\"label\": \"1966年\", \"value\": 46}, {\"label\": \"1965年\", \"value\": 47}, {\"label\": \"1964年\", \"value\": 48}, {\"label\": \"1963年\", \"value\": 49}, {\"label\": \"1962年\", \"value\": 50}, {\"label\": \"1961年\", \"value\": 51}, {\"label\": \"1960年\", \"value\": 52}, {\"label\": \"1960年前\", \"value\": 53}]}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (881, 'dffa146278884eec9298aaa6b2d3840f', '109', 'INPUT', '您的手机号是？\n', 1, NULL, 1, NULL, 655360, 24, '{}', NULL,
        '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (882, 'dffa146278884eec9298aaa6b2d3840f', '110', 'INPUT', '您的紧急联系人姓名是？\n', 1, NULL, 1, NULL, 720896, 24, '{}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (883, 'dffa146278884eec9298aaa6b2d3840f', '111', 'INPUT', '紧急联系人的电话是？\n', 1, NULL, 1, NULL, 786432, 24, '{}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (884, 'dffa146278884eec9298aaa6b2d3840f', '100', 'RADIO', '您目前所在地是？\n', 1, NULL, 1, NULL, 851968, 24, '{
  \"options\": [{\"label\": \"北京\\n\", \"value\": 1}, {\"label\": \"湖北武汉\\n\", \"value\": 2}, {\"label\": \"湖北其他地区\\n\", \"value\": 0}, {\"label\": \"其他地区\\n\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (885, 'dffa146278884eec9298aaa6b2d3840f', '101', 'SELECT', '您在湖北哪个城市？\n', 1, NULL, 1, NULL, 917504, 24, '{
  \"options\": [{\"label\": \"黄石市\", \"value\": 1}, {\"label\": \"十堰市\", \"value\": 2}, {\"label\": \"宜昌市\", \"value\": 3}, {\"label\": \"襄阳市\", \"value\": 4}, {\"label\": \"鄂州市\", \"value\": 5}, {\"label\": \"荆门市\", \"value\": 6}, {\"label\": \"孝感市\", \"value\": 7}, {\"label\": \"荆州市\", \"value\": 8}, {\"label\": \"黄冈市\", \"value\": 9}, {\"label\": \"咸宁市\", \"value\": 10}, {\"label\": \"随州市\", \"value\": 11}, {\"label\": \"恩施土家族苗族自治州\", \"value\": 12}, {\"label\": \"仙桃市\", \"value\": 13}, {\"label\": \"天门市\", \"value\": 14}, {\"label\": \"潜江市\", \"value\": 15}, {\"label\": \"神农架林区\", \"value\": 16}]}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (886, 'dffa146278884eec9298aaa6b2d3840f', '102', 'RADIO', '您当前在其他地区是？\n', 1, NULL, 1, NULL, 983040, 24, '{
  \"options\": [{\"label\": \"中国境内\\n\", \"value\": 1}, {\"label\": \"中国境外（港澳台和其他外国国家和地区）\\n\", \"value\": 0}]}', NULL,
        '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (887, 'dffa146278884eec9298aaa6b2d3840f', '103', 'INPUT', '您当前的具体住址是？\n', 1, NULL, 1, NULL, 1048576, 24, '{}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (888, 'dffa146278884eec9298aaa6b2d3840f', '104', 'RADIO', '您当前的住宿情况是？\n', 1, NULL, 1, NULL, 1114112, 24, '{
  \"options\": [{\"label\": \"学校内集体宿舍\\n\", \"value\": 1}, {\"label\": \"学校统一安排的校外集体宿舍\\n\", \"value\": 2}, {\"label\": \"其他\\n\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (889, 'dffa146278884eec9298aaa6b2d3840f', '105', 'RADIO', '近14天，您是否去过武汉或者湖北其他地区？\n', 1, NULL, 1, NULL, 1179648,
        24, '{
    \"options\": [{\"label\": \"去过武汉\\n\", \"value\": 1}, {\"label\": \"去过湖北其他地区\\n\", \"value\": 0}, {\"label\": \"都没有去过\\n\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (890, 'dffa146278884eec9298aaa6b2d3840f', '106', 'RADIO', '您前往武汉或者湖北其他地区是否是由学校组织？\n', 1, NULL, 1, NULL, 1245184,
        24, '{
    \"options\": [{\"label\": \"是\\n\", \"value\": 1}, {\"label\": \"否\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (891, 'dffa146278884eec9298aaa6b2d3840f', '107', 'RADIO', '您当前是否是由学校组织前往的武汉或湖北其他地区？\n', 1, NULL, 1, NULL,
        1310720, 24, '{
    \"options\": [{\"label\": \"是\\n\", \"value\": 1}, {\"label\": \"否\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (892, 'dffa146278884eec9298aaa6b2d3840f', '108', 'RADIO', '近14天，您是否去过武汉或者湖北其他地区？\n', 1, NULL, 1, NULL, 1376256,
        24, '{
    \"options\": [{\"label\": \"去过武汉\\n\", \"value\": 1}, {\"label\": \"去过湖北其他地区\\n\", \"value\": 0}, {\"label\": \"都没有去过\\n\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (893, 'dffa146278884eec9298aaa6b2d3840f', '109', 'RADIO', '您前往武汉或者湖北其他地区是否是由学校组织的？\n', 1, NULL, 1, NULL, 1441792,
        24, '{
    \"options\": [{\"label\": \"是\\n\", \"value\": 1}, {\"label\": \"否\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (894, 'dffa146278884eec9298aaa6b2d3840f', '110', 'DATE', '您去湖北地区的时间是？\n', 1, NULL, 1, NULL, 1507328, 24, '{}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (895, 'dffa146278884eec9298aaa6b2d3840f', '111', 'DATE', '您从湖北地区返回北京的时间是？\n', 1, NULL, 1, NULL, 1572864, 24,
        '{}', NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (896, 'dffa146278884eec9298aaa6b2d3840f', '112', 'DATE', '您从武汉或湖北其他地区返回当前所在地的时间是？\n', 1, NULL, 1, NULL, 1638400,
        24, '{}', NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (897, 'dffa146278884eec9298aaa6b2d3840f', '113', 'RADIO', '您去湖北地区乘坐的交通工具是？\n', 1, NULL, 1, NULL, 1703936, 24, '{
  \"options\": [{\"label\": \"火车\\n\", \"value\": 1}, {\"label\": \"长途巴士\\n\", \"value\": 2}, {\"label\": \"飞机\\n\", \"value\": 3}, {\"label\": \"轮船\\n\", \"value\": 4}, {\"label\": \"自驾\\n\", \"value\": 5}, {\"label\": \"其他&lt;span class=&quot;mod_fillblank&quot; data-id=&quot;fillblank-3wj6&quot;&gt;____&lt;/span&gt;\\n\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (898, 'dffa146278884eec9298aaa6b2d3840f', '114', 'INPUT', '您乘坐的交通工具的航班号/车次/车牌号是？\n', 1, NULL, 0, NULL, 1769472,
        24, '{}', NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (899, 'dffa146278884eec9298aaa6b2d3840f', '115', 'RADIO', '您近期是否有返京计划？\n', 1, NULL, 1, NULL, 1835008, 24, '{
  \"options\": [{\"label\": \"是\\n\", \"value\": 1}, {\"label\": \"否\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (900, 'dffa146278884eec9298aaa6b2d3840f', '116', 'DATE', '您计划返京时间是？\n', 1, NULL, 1, NULL, 1900544, 24, '{}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (901, 'dffa146278884eec9298aaa6b2d3840f', '117', 'RADIO', '您预计返京乘坐的交通工具是？\n', 1, NULL, 1, NULL, 1966080, 24, '{
  \"options\": [{\"label\": \"火车\\n\", \"value\": 1}, {\"label\": \"长途巴士\\n\", \"value\": 2}, {\"label\": \"飞机\\n\", \"value\": 3}, {\"label\": \"轮船\\n\", \"value\": 4}, {\"label\": \"自驾\\n\", \"value\": 5}, {\"label\": \"其他&lt;span class=&quot;mod_fillblank&quot; data-id=&quot;fillblank-3wj6&quot;&gt;____&lt;/span&gt;\\n\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (902, 'dffa146278884eec9298aaa6b2d3840f', '118', 'INPUT', '您预计乘坐的交通工具的航班号/车次/车牌号是？\n', 1, NULL, 0, NULL, 2031616,
        24, '{}', NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (903, 'dffa146278884eec9298aaa6b2d3840f', '100', 'RADIO', '近14天，您和共同居住者是否接待过从湖北地区来京的人员？\n', 1, NULL, 1, NULL,
        2097152, 24, '{
    \"options\": [{\"label\": \"是\\n\", \"value\": 1}, {\"label\": \"否\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (904, 'dffa146278884eec9298aaa6b2d3840f', '101', 'SELECT', '上述来京人员主要来自湖北哪个地区？\n', 1, NULL, 1, NULL, 2162688, 24,
        '{
          \"options\": [{\"label\": \"武汉\", \"value\": 1}, {\"label\": \"黄石市\", \"value\": 2}, {\"label\": \"十堰市\", \"value\": 3}, {\"label\": \"宜昌市\", \"value\": 4}, {\"label\": \"襄阳市\", \"value\": 5}, {\"label\": \"鄂州市\", \"value\": 6}, {\"label\": \"荆门市\", \"value\": 7}, {\"label\": \"孝感市\", \"value\": 8}, {\"label\": \"荆州市\", \"value\": 9}, {\"label\": \"黄冈市\", \"value\": 10}, {\"label\": \"咸宁市\", \"value\": 11}, {\"label\": \"随州市\", \"value\": 12}, {\"label\": \"恩施土家族苗族自治州\", \"value\": 13}, {\"label\": \"仙桃市\", \"value\": 14}, {\"label\": \"天门市\", \"value\": 15}, {\"label\": \"潜江市\", \"value\": 16}, {\"label\": \"神农架林区\", \"value\": 17}]}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (905, 'dffa146278884eec9298aaa6b2d3840f', '102', 'DATE', '您或您家里接待来京人员开始的时间是？\n', 1, NULL, 1, NULL, 2228224, 24,
        '{}', NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (906, 'dffa146278884eec9298aaa6b2d3840f', '103', 'DATE', '您或您家里接待来京人员结束的时间是？\n', 1, NULL, 1, NULL, 2293760, 24,
        '{}', NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (907, 'dffa146278884eec9298aaa6b2d3840f', '104', 'RADIO', '您是否接触过疑似或确诊新型冠状病毒感染的肺炎患者？\n', 1, NULL, 1, NULL,
        2359296, 24, '{
    \"options\": [{\"label\": \"是\\n\", \"value\": 1}, {\"label\": \"否\\n\", \"value\": 2}, {\"label\": \"不清楚\\n\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (908, 'dffa146278884eec9298aaa6b2d3840f', '100', 'RADIO', '你当前的身体状况是？\n', 1, NULL, 1, NULL, 2424832, 24, '{
  \"options\": [{\"label\": \"正常，没有症状\\n\", \"value\": 1}, {\"label\": \"身体有异常（咳嗽、发热、胸闷等）\\n\", \"value\": 2}, {\"label\": \"新型肺炎疑似病例\\n\", \"value\": 3}, {\"label\": \"新型肺炎确诊病例\\n\", \"value\": 4}, {\"label\": \"疑似病例已排除\\n\", \"value\": 5}, {\"label\": \"确诊病例已治愈\\n\", \"value\": 6}, {\"label\": \"其他&lt;span class=&quot;mod_fillblank&quot; data-id=&quot;fillblank-NfVY&quot;&gt;____&lt;/span&gt;\\n\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (909, 'dffa146278884eec9298aaa6b2d3840f', '101', 'RADIO', '您当前的隔离情况是？\n', 1, NULL, 1, NULL, 2490368, 24, '{
  \"options\": [{\"label\": \"自行隔离\\n\", \"value\": 1}, {\"label\": \"集中隔离\\n\", \"value\": 2}, {\"label\": \"没有隔离\\n\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (910, 'dffa146278884eec9298aaa6b2d3840f', '102', 'RADIO', '您是否已经及时就诊？\n', 1, NULL, 1, NULL, 2555904, 24, '{
  \"options\": [{\"label\": \"是\\n\", \"value\": 1}, {\"label\": \"否\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (911, 'dffa146278884eec9298aaa6b2d3840f', '103', 'INPUT', '您去就诊的医院是？&nbsp;\n', 1, NULL, 1, NULL, 2621440, 24,
        '{}', NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (912, 'dffa146278884eec9298aaa6b2d3840f', '105', 'INPUT', '您当前体温是？\n', 1, NULL, 1, NULL, 2686976, 24, '{}', NULL,
        '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (913, 'dffa146278884eec9298aaa6b2d3840f', '106', 'RADIO', '您当前的实习情况是？\n', 1, NULL, 1, NULL, 2752512, 24, '{
  \"options\": [{\"label\": \"在外地开展实习\\n\", \"value\": 1}, {\"label\": \"在北京开展实习\\n\", \"value\": 2}, {\"label\": \"当前在工作岗位上实习\\n\", \"value\": 3}, {\"label\": \"还没有实习\\n\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (914, '7847f6b39e8e41c08f9bb2496fe08387', '100', 'DATE', '请选择本次上报信息的统计日期：\n', 1, NULL, 1, NULL, 65536, 24, '{}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (915, '7847f6b39e8e41c08f9bb2496fe08387', '101', 'INPUT', '学校带班主要领导姓名:\n', 1, NULL, 1, NULL, 131072, 24, '{}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (916, '7847f6b39e8e41c08f9bb2496fe08387', '102', 'INPUT', '当天在校学生数：\n', 1, NULL, 1, NULL, 196608, 24, '{}', NULL,
        '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (917, '7847f6b39e8e41c08f9bb2496fe08387', '103', 'RADIO', '当前是否已经制定湖北籍人员返京工作预案？\n', 1, NULL, 1, NULL, 262144, 24,
        '{
          \"options\": [{\"label\": \"是\\n\", \"value\": 1}, {\"label\": \"否\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (918, '7847f6b39e8e41c08f9bb2496fe08387', '104', 'RADIO', '当前是否已经设立隔离地点？\n', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"是\\n\", \"value\": 1}, {\"label\": \"否\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (919, '7847f6b39e8e41c08f9bb2496fe08387', '105', 'INPUT', '当前设置的隔离点床位数？\n', 1, NULL, 1, NULL, 393216, 24, '{}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (920, '7847f6b39e8e41c08f9bb2496fe08387', '106', 'RADIO', '当前防疫工作是否有安排相关工作人员？\n', 1, NULL, 1, NULL, 458752, 24,
        '{
          \"options\": [{\"label\": \"是\\n\", \"value\": 1}, {\"label\": \"否\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (921, '7847f6b39e8e41c08f9bb2496fe08387', '107', 'INPUT', '安排工作人员数量是？\n', 1, NULL, 1, NULL, 524288, 24, '{}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (922, '7847f6b39e8e41c08f9bb2496fe08387', '108', 'RADIO', '当前是否有防疫相关的物资储备？\n', 1, NULL, 1, NULL, 589824, 24, '{
  \"options\": [{\"label\": \"是\\n\", \"value\": 1}, {\"label\": \"否\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (923, '7847f6b39e8e41c08f9bb2496fe08387', '110', 'RADIO', '学校在1月30日之后是否有重大活动安排？\n', 1, NULL, 1, NULL, 655360, 24,
        '{
          \"options\": [{\"label\": \"是\\n\", \"value\": 1}, {\"label\": \"否\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (924, '7847f6b39e8e41c08f9bb2496fe08387', '111', 'INPUT', '活动名称\n', 1, NULL, 1, NULL, 720896, 24, '{}', NULL,
        '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (925, '7847f6b39e8e41c08f9bb2496fe08387', '112', 'INPUT', '活动时间\n', 1, NULL, 1, NULL, 786432, 24, '{}', NULL,
        '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (926, 'ba5bdd3c7fc94ecf9170fe97cd790d1d', '100', 'RADIO', '您/您的孩子的&ldquo;粤康码&rdquo;是什么码？\n', 1, NULL, 1, NULL,
        65536, 24, '{
    \"options\": [{\"label\": \"绿码\\n\", \"value\": 1}, {\"label\": \"红码\\n\", \"value\": 2}, {\"label\": \"黑码\\n\", \"value\": 3}, {\"label\": \"其他\\n\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (927, 'ba5bdd3c7fc94ecf9170fe97cd790d1d', '101', 'RADIO', '您/您的孩子身份是：\n', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"学生\\n\", \"value\": 1}, {\"label\": \"教职工\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (928, 'ba5bdd3c7fc94ecf9170fe97cd790d1d', '102', 'RADIO', '您的教职工类型是：\n', 1, NULL, 1, NULL, 196608, 24, '{
  \"options\": [{\"label\": \"内地教职工\\n\", \"value\": 1}, {\"label\": \"香港教职工\\n\", \"value\": 2}, {\"label\": \"澳门教职工\\n\", \"value\": 3}, {\"label\": \"台湾教职工\\n\", \"value\": 4}, {\"label\": \"外籍教职工\\n\", \"value\": 5}, {\"label\": \"离退休教职工\\n\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (929, 'ba5bdd3c7fc94ecf9170fe97cd790d1d', '103', 'RADIO', '您的身份类型是：\n', 1, NULL, 1, NULL, 262144, 24, '{
  \"options\": [{\"label\": \"专任教师\\n\", \"value\": 1}, {\"label\": \"行政管理人员\\n\", \"value\": 2}, {\"label\": \"食堂从业人员\\n\", \"value\": 3}, {\"label\": \"宿舍管理人员\\n\", \"value\": 4}, {\"label\": \"校医\\n\", \"value\": 5}, {\"label\": \"幼儿园保育员\\n\", \"value\": 6}, {\"label\": \"保安\\n\", \"value\": 7}, {\"label\": \"校内超市人员\\n\", \"value\": 8}, {\"label\": \"其他&lt;span class=&quot;mod_fillblank&quot; data-id=&quot;fillblank-0FMn&quot;&gt;______&lt;/span&gt;\\n\", \"value\": 9}]}',
        NULL, '2021-01-11 13:58:41', '2021-01-11 13:58:41', 0);
INSERT INTO `pr_project_template_item`
VALUES (930, 'ba5bdd3c7fc94ecf9170fe97cd790d1d', '104', 'SELECT', '您/您的孩子的国籍是？\n', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"中国大陆\", \"value\": 1}, {\"label\": \"香港（中国）\", \"value\": 2}, {\"label\": \"澳门（中国）\", \"value\": 3}, {\"label\": \"台湾（中国）\", \"value\": 4}, {\"label\": \"阿富汗\", \"value\": 5}, {\"label\": \"奥兰群岛\", \"value\": 6}, {\"label\": \"阿尔巴尼亚\", \"value\": 7}, {\"label\": \"阿尔及利亚\", \"value\": 8}, {\"label\": \"美属萨摩亚\", \"value\": 9}, {\"label\": \"安道尔\", \"value\": 10}, {\"label\": \"安哥拉\", \"value\": 11}, {\"label\": \"安圭拉\", \"value\": 12}, {\"label\": \"南极洲\", \"value\": 13}, {\"label\": \"安提瓜和巴布达\", \"value\": 14}, {\"label\": \"阿根廷\", \"value\": 15}, {\"label\": \"亚美尼亚\", \"value\": 16}, {\"label\": \"阿鲁巴\", \"value\": 17}, {\"label\": \"澳大利亚\", \"value\": 18}, {\"label\": \"奥地利\", \"value\": 19}, {\"label\": \"阿塞拜疆\", \"value\": 20}, {\"label\": \"巴哈马\", \"value\": 21}, {\"label\": \"巴林\", \"value\": 22}, {\"label\": \"孟加拉国\", \"value\": 23}, {\"label\": \"巴巴多斯\", \"value\": 24}, {\"label\": \"白俄罗斯\", \"value\": 25}, {\"label\": \"比利时\", \"value\": 26}, {\"label\": \"伯利兹\", \"value\": 27}, {\"label\": \"贝宁\", \"value\": 28}, {\"label\": \"百慕大\", \"value\": 29}, {\"label\": \"不丹\", \"value\": 30}, {\"label\": \"玻利维亚\", \"value\": 31}, {\"label\": \"波黑\", \"value\": 32}, {\"label\": \"博茨瓦纳\", \"value\": 33}, {\"label\": \"布维岛\", \"value\": 34}, {\"label\": \"巴西\", \"value\": 35}, {\"label\": \"英属印度洋领地\", \"value\": 36}, {\"label\": \"文莱\", \"value\": 37}, {\"label\": \"保加利亚\", \"value\": 38}, {\"label\": \"布基纳法索\", \"value\": 39}, {\"label\": \"布隆迪\", \"value\": 40}, {\"label\": \"柬埔寨\", \"value\": 41}, {\"label\": \"喀麦隆\", \"value\": 42}, {\"label\": \"加拿大\", \"value\": 43}, {\"label\": \"佛得角\", \"value\": 44}, {\"label\": \"开曼群岛\", \"value\": 45}, {\"label\": \"中非\", \"value\": 46}, {\"label\": \"乍得\", \"value\": 47}, {\"label\": \"智利\", \"value\": 48}, {\"label\": \"圣诞岛\", \"value\": 49}, {\"label\": \"科科斯（基林）群岛\", \"value\": 50}, {\"label\": \"哥伦比亚\", \"value\": 51}, {\"label\": \"科摩罗\", \"value\": 52}, {\"label\": \"刚果（布）\", \"value\": 53}, {\"label\": \"刚果（金）\", \"value\": 54}, {\"label\": \"库克群岛\", \"value\": 55}, {\"label\": \"哥斯达黎加\", \"value\": 56}, {\"label\": \"科特迪瓦\", \"value\": 57}, {\"label\": \"克罗地亚\", \"value\": 58}, {\"label\": \"古巴\", \"value\": 59}, {\"label\": \"塞浦路斯\", \"value\": 60}, {\"label\": \"捷克\", \"value\": 61}, {\"label\": \"丹麦\", \"value\": 62}, {\"label\": \"吉布提\", \"value\": 63}, {\"label\": \"多米尼克\", \"value\": 64}, {\"label\": \"多米尼加\", \"value\": 65}, {\"label\": \"厄瓜多尔\", \"value\": 66}, {\"label\": \"埃及\", \"value\": 67}, {\"label\": \"萨尔瓦多\", \"value\": 68}, {\"label\": \"赤道几内亚\", \"value\": 69}, {\"label\": \"厄立特里亚\", \"value\": 70}, {\"label\": \"爱沙尼亚\", \"value\": 71}, {\"label\": \"埃塞俄比亚\", \"value\": 72}, {\"label\": \"福克兰群岛（马尔维纳斯）\", \"value\": 73}, {\"label\": \"法罗群岛\", \"value\": 74}, {\"label\": \"斐济\", \"value\": 75}, {\"label\": \"芬兰\", \"value\": 76}, {\"label\": \"法国\", \"value\": 77}, {\"label\": \"法属圭亚那\", \"value\": 78}, {\"label\": \"法属波利尼西亚\", \"value\": 79}, {\"label\": \"法属南部领地\", \"value\": 80}, {\"label\": \"加蓬\", \"value\": 81}, {\"label\": \"冈比亚\", \"value\": 82}, {\"label\": \"格鲁吉亚\", \"value\": 83}, {\"label\": \"德国\", \"value\": 84}, {\"label\": \"加纳\", \"value\": 85}, {\"label\": \"直布罗陀\", \"value\": 86}, {\"label\": \"希腊\", \"value\": 87}, {\"label\": \"格陵兰\", \"value\": 88}, {\"label\": \"格林纳达\", \"value\": 89}, {\"label\": \"瓜德罗普\", \"value\": 90}, {\"label\": \"关岛\", \"value\": 91}, {\"label\": \"危地马拉\", \"value\": 92}, {\"label\": \"格恩西岛\", \"value\": 93}, {\"label\": \"几内亚\", \"value\": 94}, {\"label\": \"几内亚比绍\", \"value\": 95}, {\"label\": \"圭亚那\", \"value\": 96}, {\"label\": \"海地\", \"value\": 97}, {\"label\": \"赫德岛和麦克唐纳岛\", \"value\": 98}, {\"label\": \"梵蒂冈\", \"value\": 99}, {\"label\": \"洪都拉斯\", \"value\": 100}, {\"label\": \"匈牙利\", \"value\": 101}, {\"label\": \"冰岛\", \"value\": 102}, {\"label\": \"印度\", \"value\": 103}, {\"label\": \"印度尼西亚\", \"value\": 104}, {\"label\": \"伊朗\", \"value\": 105}, {\"label\": \"伊拉克\", \"value\": 106}, {\"label\": \"爱尔兰\", \"value\": 107}, {\"label\": \"英国属地曼岛\", \"value\": 108}, {\"label\": \"以色列\", \"value\": 109}, {\"label\": \"意大利\", \"value\": 110}, {\"label\": \"牙买加\", \"value\": 111}, {\"label\": \"日本\", \"value\": 112}, {\"label\": \"泽西岛\", \"value\": 113}, {\"label\": \"约旦\", \"value\": 114}, {\"label\": \"哈萨克斯坦\", \"value\": 115}, {\"label\": \"肯尼亚\", \"value\": 116}, {\"label\": \"基里巴斯\", \"value\": 117}, {\"label\": \"朝鲜\", \"value\": 118}, {\"label\": \"韩国\", \"value\": 119}, {\"label\": \"科威特\", \"value\": 120}, {\"label\": \"吉尔吉斯斯坦\", \"value\": 121}, {\"label\": \"老挝\", \"value\": 122}, {\"label\": \"拉脱维亚\", \"value\": 123}, {\"label\": \"黎巴嫩\", \"value\": 124}, {\"label\": \"莱索托\", \"value\": 125}, {\"label\": \"利比里亚\", \"value\": 126}, {\"label\": \"利比亚\", \"value\": 127}, {\"label\": \"列支敦士登\", \"value\": 128}, {\"label\": \"立陶宛\", \"value\": 129}, {\"label\": \"卢森堡\", \"value\": 130}, {\"label\": \"前南马其顿\", \"value\": 131}, {\"label\": \"马达加斯加\", \"value\": 132}, {\"label\": \"马拉维\", \"value\": 133}, {\"label\": \"马来西亚\", \"value\": 134}, {\"label\": \"马尔代夫\", \"value\": 135}, {\"label\": \"马里\", \"value\": 136}, {\"label\": \"马耳他\", \"value\": 137}, {\"label\": \"马绍尔群岛\", \"value\": 138}, {\"label\": \"马提尼克\", \"value\": 139}, {\"label\": \"毛利塔尼亚\", \"value\": 140}, {\"label\": \"毛里求斯\", \"value\": 141}, {\"label\": \"马约特\", \"value\": 142}, {\"label\": \"墨西哥\", \"value\": 143}, {\"label\": \"密克罗尼西亚联邦\", \"value\": 144}, {\"label\": \"摩尔多瓦\", \"value\": 145}, {\"label\": \"摩纳哥\", \"value\": 146}, {\"label\": \"蒙古\", \"value\": 147}, {\"label\": \"黑山\", \"value\": 148}, {\"label\": \"蒙特塞拉特\", \"value\": 149}, {\"label\": \"摩洛哥\", \"value\": 150}, {\"label\": \"莫桑比克\", \"value\": 151}, {\"label\": \"缅甸\", \"value\": 152}, {\"label\": \"纳米比亚\", \"value\": 153}, {\"label\": \"瑙鲁\", \"value\": 154}, {\"label\": \"尼泊尔\", \"value\": 155}, {\"label\": \"荷兰\", \"value\": 156}, {\"label\": \"荷属安的列斯\", \"value\": 157}, {\"label\": \"新喀里多尼亚\", \"value\": 158}, {\"label\": \"新西兰\", \"value\": 159}, {\"label\": \"尼加拉瓜\", \"value\": 160}, {\"label\": \"尼日尔\", \"value\": 161}, {\"label\": \"尼日利亚\", \"value\": 162}, {\"label\": \"纽埃\", \"value\": 163}, {\"label\": \"诺福克岛\", \"value\": 164}, {\"label\": \"北马里亚纳\", \"value\": 165}, {\"label\": \"挪威\", \"value\": 166}, {\"label\": \"阿曼\", \"value\": 167}, {\"label\": \"巴基斯坦\", \"value\": 168}, {\"label\": \"帕劳\", \"value\": 169}, {\"label\": \"巴勒斯坦\", \"value\": 170}, {\"label\": \"巴拿马\", \"value\": 171}, {\"label\": \"巴布亚新几内亚\", \"value\": 172}, {\"label\": \"巴拉圭\", \"value\": 173}, {\"label\": \"秘鲁\", \"value\": 174}, {\"label\": \"菲律宾\", \"value\": 175}, {\"label\": \"皮特凯恩\", \"value\": 176}, {\"label\": \"波兰\", \"value\": 177}, {\"label\": \"葡萄牙\", \"value\": 178}, {\"label\": \"波多黎各\", \"value\": 179}, {\"label\": \"卡塔尔\", \"value\": 180}, {\"label\": \"留尼汪\", \"value\": 181}, {\"label\": \"罗马尼亚\", \"value\": 182}, {\"label\": \"俄罗斯联邦\", \"value\": 183}, {\"label\": \"卢旺达\", \"value\": 184}, {\"label\": \"圣赫勒拿\", \"value\": 185}, {\"label\": \"圣基茨和尼维斯\", \"value\": 186}, {\"label\": \"圣卢西亚\", \"value\": 187}, {\"label\": \"圣皮埃尔和密克隆\", \"value\": 188}, {\"label\": \"圣文森特和格林纳丁斯\", \"value\": 189}, {\"label\": \"萨摩亚\", \"value\": 190}, {\"label\": \"圣马力诺\", \"value\": 191}, {\"label\": \"圣多美和普林西比\", \"value\": 192}, {\"label\": \"沙特阿拉伯\", \"value\": 193}, {\"label\": \"塞内加尔\", \"value\": 194}, {\"label\": \"塞尔维亚\", \"value\": 195}, {\"label\": \"塞舌尔\", \"value\": 196}, {\"label\": \"塞拉利昂\", \"value\": 197}, {\"label\": \"新加坡\", \"value\": 198}, {\"label\": \"斯洛伐克\", \"value\": 199}, {\"label\": \"斯洛文尼亚\", \"value\": 200}, {\"label\": \"所罗门群岛\", \"value\": 201}, {\"label\": \"索马里\", \"value\": 202}, {\"label\": \"南非\", \"value\": 203}, {\"label\": \"南乔治亚岛和南桑德韦奇岛\", \"value\": 204}, {\"label\": \"西班牙\", \"value\": 205}, {\"label\": \"斯里兰卡\", \"value\": 206}, {\"label\": \"苏丹\", \"value\": 207}, {\"label\": \"苏里南\", \"value\": 208}, {\"label\": \"斯瓦尔巴岛和扬马延岛\", \"value\": 209}, {\"label\": \"斯威士兰\", \"value\": 210}, {\"label\": \"瑞典\", \"value\": 211}, {\"label\": \"瑞士\", \"value\": 212}, {\"label\": \"叙利亚\", \"value\": 213}, {\"label\": \"塔吉克斯坦\", \"value\": 214}, {\"label\": \"坦桑尼亚\", \"value\": 215}, {\"label\": \"泰国\", \"value\": 216}, {\"label\": \"东帝汶\", \"value\": 217}, {\"label\": \"多哥\", \"value\": 218}, {\"label\": \"托克劳\", \"value\": 219}, {\"label\": \"汤加\", \"value\": 220}, {\"label\": \"特立尼达和多巴哥\", \"value\": 221}, {\"label\": \"突尼斯\", \"value\": 222}, {\"label\": \"土耳其\", \"value\": 223}, {\"label\": \"土库曼斯坦\", \"value\": 224}, {\"label\": \"特克斯和凯科斯群岛\", \"value\": 225}, {\"label\": \"图瓦卢\", \"value\": 226}, {\"label\": \"乌干达\", \"value\": 227}, {\"label\": \"乌克兰\", \"value\": 228}, {\"label\": \"阿联酋\", \"value\": 229}, {\"label\": \"英国\", \"value\": 230}, {\"label\": \"美国\", \"value\": 231}, {\"label\": \"美国本土外小岛屿\", \"value\": 232}, {\"label\": \"乌拉圭\", \"value\": 233}, {\"label\": \"乌兹别克斯坦\", \"value\": 234}, {\"label\": \"瓦努阿图\", \"value\": 235}, {\"label\": \"委内瑞拉\", \"value\": 236}, {\"label\": \"越南\", \"value\": 237}, {\"label\": \"英属维尔京群岛\", \"value\": 238}, {\"label\": \"美属维尔京群岛\", \"value\": 239}, {\"label\": \"瓦利斯和富图纳\", \"value\": 240}, {\"label\": \"西撒哈拉\", \"value\": 241}, {\"label\": \"也门\", \"value\": 242}, {\"label\": \"赞比亚\", \"value\": 243}, {\"label\": \"津巴布韦\", \"value\": 244}]}',
        NULL, '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (931, 'ba5bdd3c7fc94ecf9170fe97cd790d1d', '105', 'DATE', '您/您的孩子户籍所在地是？\n', 1, NULL, 1, NULL, 393216, 24, '{}',
        NULL, '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (932, 'ba5bdd3c7fc94ecf9170fe97cd790d1d', '106', 'RADIO', '您/您的孩子今日是否到校？\n', 1, NULL, 1, NULL, 458752, 24, '{
  \"options\": [{\"label\": \"是\\n\", \"value\": 1}, {\"label\": \"否\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (933, 'ba5bdd3c7fc94ecf9170fe97cd790d1d', '107', 'RADIO', '您/您的孩子是否计划今日留校？\n', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"是\\n\", \"value\": 1}, {\"label\": \"否\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (934, 'ba5bdd3c7fc94ecf9170fe97cd790d1d', '108', 'RADIO', '您/您的孩子近14天内是否从疫情高发危险地区（湖北省、黑龙江省、境外等）返回？\n', 1, NULL,
        1, NULL, 589824, 24, '{
    \"options\": [{\"label\": \"是\\n\", \"value\": 1}, {\"label\": \"否\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (935, 'ba5bdd3c7fc94ecf9170fe97cd790d1d', '109', 'RADIO', '您/您的孩子从哪里返回？\n', 1, NULL, 1, NULL, 655360, 24, '{
  \"options\": [{\"label\": \"武汉市\\n\", \"value\": 1}, {\"label\": \"湖北（除武汉市外）\\n\", \"value\": 2}, {\"label\": \"温州市\\n\", \"value\": 3}, {\"label\": \"黑龙江省\\n\", \"value\": 4}, {\"label\": \"境外\\n\", \"value\": 5}, {\"label\": \"其他地区&lt;span class=&quot;mod_fillblank&quot; data-id=&quot;fillblank-C4cl&quot;&gt;______&lt;/span&gt;\\n\", \"value\": 6}]}',
        NULL, '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (936, 'ba5bdd3c7fc94ecf9170fe97cd790d1d', '110', 'DATE', '您/您的孩子返回湛江的时间是？\n', 1, NULL, 1, NULL, 720896, 24, '{}',
        NULL, '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (937, 'ba5bdd3c7fc94ecf9170fe97cd790d1d', '111', 'RADIO', '您/您的孩子今日是否有以下症状？\n', 1, NULL, 1, NULL, 786432, 24, '{
  \"options\": [{\"label\": \"发热（体温37.3℃及以上）\\n\", \"value\": 1}, {\"label\": \"咳嗽\\n\", \"value\": 2}, {\"label\": \"乏力\\n\", \"value\": 3}, {\"label\": \"呕吐\\n\", \"value\": 4}, {\"label\": \"腹泻\\n\", \"value\": 5}, {\"label\": \"其他&lt;span class=&quot;mod_fillblank&quot; data-id=&quot;fillblank-q6zG&quot;&gt;______&lt;/span&gt;\\n\", \"value\": 6}, {\"label\": \"以上症状都没有\\n\", \"value\": 7}]}',
        NULL, '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (938, 'ba5bdd3c7fc94ecf9170fe97cd790d1d', '100', 'RADIO', '最近经历，与您/您的孩子符合的有？\n', 1, NULL, 1, NULL, 851968, 24, '{
  \"options\": [{\"label\": \"返校前14天内有疫情高风险地区的旅居史\\n\", \"value\": 1}, {\"label\": \"返校前14天内接触过疫情高风险地区的返粤人员\\n\", \"value\": 2}, {\"label\": \"返校前14天有接触过疑似或确诊新型冠状病毒感染的肺炎患者\\n\", \"value\": 3}, {\"label\": \"以上都不符合\\n\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (939, 'ba5bdd3c7fc94ecf9170fe97cd790d1d', '101', 'RADIO', '您/您的孩子今日是否有发热症状？（体温37.3℃及以上）\n', 1, NULL, 1, NULL,
        917504, 24, '{
    \"options\": [{\"label\": \"是\\n\", \"value\": 1}, {\"label\": \"否\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (940, 'ba5bdd3c7fc94ecf9170fe97cd790d1d', '102', 'RADIO', '您/您的孩子今日健康状况是：\n', 1, NULL, 1, NULL, 983040, 24, '{
  \"options\": [{\"label\": \"正常\\n\", \"value\": 1}, {\"label\": \"疑似病例\\n\", \"value\": 2}, {\"label\": \"确诊病例\\n\", \"value\": 3}, {\"label\": \"无症状感染者\\n\", \"value\": 4}, {\"label\": \"其他&lt;span class=&quot;mod_fillblank&quot; data-id=&quot;fillblank-ULFv&quot;&gt;____&lt;/span&gt;\\n\", \"value\": 5}]}',
        NULL, '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (941, 'ba5bdd3c7fc94ecf9170fe97cd790d1d', '103', 'RADIO', '您/您的孩子今日医学观察状态是：\n', 1, NULL, 1, NULL, 1048576, 24, '{
  \"options\": [{\"label\": \"居家观察\\n\", \"value\": 1}, {\"label\": \"集中观察\\n\", \"value\": 2}, {\"label\": \"解除医学观察\\n\", \"value\": 3}]}',
        NULL, '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (942, '69e2281f0094407f94d8a9b4f3d75508', '100', 'INPUT', '你的姓名：\n', 1, NULL, 1, NULL, 65536, 24, '{}', NULL,
        '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (943, '69e2281f0094407f94d8a9b4f3d75508', '101', 'INPUT', '你的学号：\n', 1, NULL, 0, NULL, 131072, 24, '{}', NULL,
        '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (944, '69e2281f0094407f94d8a9b4f3d75508', '102', 'DATE', '目前所在地是：\n', 1, NULL, 1, NULL, 196608, 24, '{}', NULL,
        '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (945, '69e2281f0094407f94d8a9b4f3d75508', '103', 'INPUT', '所在街道详细地址：\n', 1, NULL, 1, NULL, 262144, 24, '{}',
        NULL, '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (946, '69e2281f0094407f94d8a9b4f3d75508', '104', 'RADIO', '目前的健康状况\n', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"身体健康\\n\", \"value\": 1}, {\"label\": \"身体不适\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (947, '69e2281f0094407f94d8a9b4f3d75508', '105', 'RADIO', '当前的症状是（可多选）\n', 1, NULL, 1, NULL, 393216, 24, '{
  \"options\": [{\"label\": \"发热\\n\", \"value\": 1}, {\"label\": \"咳嗽\\n\", \"value\": 2}, {\"label\": \"流鼻涕\\n\", \"value\": 3}, {\"label\": \"咽痛\\n\", \"value\": 4}, {\"label\": \"嗓子哑\\n\", \"value\": 5}, {\"label\": \"鼻子痒、干\\n\", \"value\": 6}, {\"label\": \"打喷嚏\\n\", \"value\": 7}, {\"label\": \"鼻塞\\n\", \"value\": 8}, {\"label\": \"哮喘\\n\", \"value\": 9}, {\"label\": \"呼吸困难\\n\", \"value\": 10}, {\"label\": \"眼红、疼、痒\\n\", \"value\": 11}, {\"label\": \"头痛\\n\", \"value\": 12}, {\"label\": \"乏力、嗜睡\\n\", \"value\": 13}, {\"label\": \"抽搐\\n\", \"value\": 14}, {\"label\": \"呕吐\\n\", \"value\": 15}, {\"label\": \"腹痛\\n\", \"value\": 16}, {\"label\": \"腹泻\\n\", \"value\": 17}, {\"label\": \"心慌、胸闷\\n\", \"value\": 18}, {\"label\": \"皮疹\\n\", \"value\": 19}, {\"label\": \"肌痛、关节痛\\n\", \"value\": 20}, {\"label\": \"损伤\\n\", \"value\": 21}, {\"label\": \"其他&lt;span class=&quot;mod_fillblank&quot; data-id=&quot;fillblank-BR2y&quot;&gt;____&lt;/span&gt;\\n\", \"value\": 22}]}',
        NULL, '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (948, '69e2281f0094407f94d8a9b4f3d75508', '106', 'RADIO', '近14天是否在高风险地区停留或路过，接触过来自高风险地区的人员\n', 1, NULL, 1, NULL,
        458752, 24, '{
    \"options\": [{\"label\": \"否\\n\", \"value\": 1}, {\"label\": \"是\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (949, '69e2281f0094407f94d8a9b4f3d75508', '107', 'RADIO', '是否接触过疑似或确诊的新冠肺炎患者\n', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"否\\n\", \"value\": 1}, {\"label\": \"是\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (950, '69e2281f0094407f94d8a9b4f3d75508', '108', 'RADIO', '建议诊疗方案是：\n', 1, NULL, 1, NULL, 589824, 24, '{
  \"options\": [{\"label\": \"按时治疗即可，无需休病假\\n\", \"value\": 1}, {\"label\": \"在家休养\\n\", \"value\": 2}, {\"label\": \"住院治疗\\n\", \"value\": 3}, {\"label\": \"隔离观察、治疗\\n\", \"value\": 4}]}',
        NULL, '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (951, '69e2281f0094407f94d8a9b4f3d75508', '109', 'INPUT', '监护人联系电话是：\n', 1, NULL, 1, NULL, 655360, 24, '{}',
        NULL, '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (952, '335b69a4bfe44794a62a02de23f27c18', '100', 'INPUT', '学生姓名\n', 1, NULL, 1, NULL, 65536, 24, '{}', NULL,
        '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (953, '335b69a4bfe44794a62a02de23f27c18', '101', 'RADIO', '学生性别：\n', 1, NULL, 1, NULL, 131072, 24, '{
  \"options\": [{\"label\": \"男\\n\", \"value\": 1}, {\"label\": \"女\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (954, '335b69a4bfe44794a62a02de23f27c18', '102', 'INPUT', '学生的家庭住址是：\n', 1, NULL, 1, NULL, 196608, 24, '{}',
        NULL, '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (955, '335b69a4bfe44794a62a02de23f27c18', '103', 'INPUT', '学生监护人的联系电话是？\n', 1, NULL, 1, NULL, 262144, 24, '{}',
        NULL, '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (956, '335b69a4bfe44794a62a02de23f27c18', '104', 'RADIO', '学生今日的健康状况是：\n', 1, NULL, 1, NULL, 327680, 24, '{
  \"options\": [{\"label\": \"正常，没有症状\\n\", \"value\": 1}, {\"label\": \"身体异常\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (957, '335b69a4bfe44794a62a02de23f27c18', '105', 'INPUT', '今日的体温是？\n', 1, NULL, 1, NULL, 393216, 24, '{}', NULL,
        '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (958, '335b69a4bfe44794a62a02de23f27c18', '106', 'RADIO', '今日是否有以下症状和体征？\n', 1, NULL, 1, NULL, 458752, 24, '{
  \"options\": [{\"label\": \"发热\\n\", \"value\": 1}, {\"label\": \"干咳\\n\", \"value\": 2}, {\"label\": \"乏力\\n\", \"value\": 3}, {\"label\": \"咳痰\\n\", \"value\": 4}, {\"label\": \"鼻塞\\n\", \"value\": 5}, {\"label\": \"流鼻涕\\n\", \"value\": 6}, {\"label\": \"打寒颤\\n\", \"value\": 7}, {\"label\": \"气促\\n\", \"value\": 8}, {\"label\": \"呼吸困难\\n\", \"value\": 9}, {\"label\": \"咽喉痛\\n\", \"value\": 10}, {\"label\": \"头疼\\n\", \"value\": 11}, {\"label\": \"肌肉酸痛\\n\", \"value\": 12}, {\"label\": \"关节酸痛\\n\", \"value\": 13}, {\"label\": \"胸闷\\n\", \"value\": 14}, {\"label\": \"呕吐\\n\", \"value\": 15}, {\"label\": \"腹泻\\n\", \"value\": 16}, {\"label\": \"皮肤疱疹\\n\", \"value\": 17}, {\"label\": \"口腔疱疹\\n\", \"value\": 18}, {\"label\": \"以上症状和体征都没有\\n\", \"value\": 19}]}',
        NULL, '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (959, '335b69a4bfe44794a62a02de23f27c18', '107', 'RADIO', '学生假期是否离开过本市？\n', 1, NULL, 1, NULL, 524288, 24, '{
  \"options\": [{\"label\": \"是\\n\", \"value\": 1}, {\"label\": \"否\\n\", \"value\": 2}]}', NULL,
        '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (960, '335b69a4bfe44794a62a02de23f27c18', '108', 'DATE', '假期去过的地区是？\n', 1, NULL, 1, NULL, 589824, 24, '{}', NULL,
        '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);
INSERT INTO `pr_project_template_item`
VALUES (961, '335b69a4bfe44794a62a02de23f27c18', '109', 'DATE', '学生从外地返回当前所在地的时间是？\n', 1, NULL, 0, NULL, 655360, 24,
        '{}', NULL, '2021-01-11 13:58:42', '2021-01-11 13:58:42', 0);

SET
FOREIGN_KEY_CHECKS = 1;
