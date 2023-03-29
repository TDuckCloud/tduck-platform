package com.tduck.cloud.form.entity.enums;


import lombok.AllArgsConstructor;

/**
 * 表单按钮权限类型
 */
@AllArgsConstructor
public enum FormPermsBtnTypeEnum {
    DETAIL("detail", "查看"),
    ADD("add", "新增"),
    IMPORT("import", "导入"),
    EXPORT("export", "导出"),
    QUERY("query", "结构查询"),
    BATCH_ACTION("batchAction", "批量操作"),
    CUSTOM_COLUMN("customColumn", "自定义列"),
    UPDATE("update", "编辑"),
    DELETE("delete", "删除");


    private final String code;
    private final String desc;

}
    