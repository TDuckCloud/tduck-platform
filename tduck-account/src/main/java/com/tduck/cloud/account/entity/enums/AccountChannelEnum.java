package com.tduck.cloud.account.entity.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author : smalljop
 * @description : 账号注册登录渠道
 * @create : 2020-11-19 10:51
 **/
@AllArgsConstructor
@Getter
public enum AccountChannelEnum {


    WX_MP(1, "微信扫码"),
    EMAIL(2, "邮箱"),
    PHONE(3, "手机号"),
    QQ(4, "QQ");


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
    public static AccountChannelEnum getByValue(int value) {
        for (AccountChannelEnum item : values()) {
            if (item.getValue() == value) {
                return item;
            }
        }
        return null;
    }


}
