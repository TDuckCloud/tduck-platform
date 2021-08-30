ALTER TABLE `tduck`.`pr_user_project_result`
    ADD COLUMN `wx_open_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信openId' AFTER `complete_time`,
ADD COLUMN `wx_user_info` json NULL COMMENT '微信用户信息' AFTER `wx_open_id`;

ALTER TABLE `tduck`.`pr_user_project_setting`
    ADD COLUMN `is_wx_write_once` tinyint(1) NULL AFTER `is_wx_write`;