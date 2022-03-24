package com.tduck.cloud.form.entity.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * @author : smalljop
 * @description : 表单状态
 * @create : 2020-12-04 13:35
 **/
@AllArgsConstructor
@Getter
@NoArgsConstructor
public enum FormStatusEnum {

    CREATE(1, "未发布"),
    RELEASE(2, "收集中"),
    STOP(3, "停止发布");


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
    public static FormStatusEnum getByValue(int value) {
        for (FormStatusEnum statusEnum : values()) {
            if (statusEnum.getValue() == value) {
                return statusEnum;
            }
        }
        return null;
    }
}
