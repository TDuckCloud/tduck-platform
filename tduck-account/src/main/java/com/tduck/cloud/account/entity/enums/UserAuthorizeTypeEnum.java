package com.tduck.cloud.account.entity.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author : smalljop
 * @description : 用户授权认证平台类型
 * @create : 2020-12-09 18:11
 **/
@AllArgsConstructor
@Getter
public enum UserAuthorizeTypeEnum {

    QQ(1, "QQ");


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
    public static UserAuthorizeTypeEnum getByValue(int value) {
        for (UserAuthorizeTypeEnum item : values()) {
            if (item.getValue() == value) {
                return item;
            }
        }
        return null;
    }
}
