package com.tduck.cloud.form.entity.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * @author : smalljop
 * @description : 表单来源
 * @create : 2020-12-04 13:35
 **/
@AllArgsConstructor
@Getter
@NoArgsConstructor
public enum FormSourceTypeEnum {

    BLANK(1, "空白创建"),
    TEMPLATE(2, "模板");


    @EnumValue
    @JsonValue
    private int value;

    private String desc;


    /**
     * 枚举入参注解
     *
     * @param value
     * @return
     */
    @JsonCreator
    public static FormSourceTypeEnum getByValue(int value) {
        for (FormSourceTypeEnum sourceTypeEnum : values()) {
            if (sourceTypeEnum.getValue() == value) {
                return sourceTypeEnum;
            }
        }
        return null;
    }

}
