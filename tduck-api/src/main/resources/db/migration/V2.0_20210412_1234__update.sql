ALTER TABLE `tduck`.`pr_user_project_item`
    MODIFY COLUMN `type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单项类型 ' AFTER `form_item_id`;