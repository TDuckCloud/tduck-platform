package com.tduck.cloud.form.entity.enums;


import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * ElasticSearch的字段类型
 */
@AllArgsConstructor
@Getter
public enum EsTypeEnum {

    STRING("string", "字符串类型"),
    TEXT("text", "字符串类型"),
    KEYWORD("keyword", "字符串类型"),
    INTEGER("integer", "整数类型"),
    LONG("long", "整数类型"),
    SHORT("short", "整数类型"),
    BYTE("byte", "整数类型"),
    DOUBLE("double", "浮点类型"),
    FLOAT("float", "浮点类型"),
    HALF_FLOAT("half_float", "浮点类型"),
    SCALED_FLOAT("scaled_float", "浮点类型"),
    BOOLEAN("boolean", "逻辑类型"),
    DATE("date", "日期类型");

    private String type;
    private String name;


}
