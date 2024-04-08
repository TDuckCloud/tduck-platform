package com.tduck.cloud.common.sms;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Arrays;

/**
 * @description: 短信渠道类型
 * @author: tduck
 * @create: 2020-02-18 23:06
 **/
@Getter
@AllArgsConstructor
public enum SmsTypeEnum {
    /**
     * 阿里云
     */
    ALIYUN(1),

    /**
     * 腾讯云
     */
    TENCENT_CLOUD(2),

    /**
     * veesing https://www.veesing.com/
     */
    VEESING(3);

    @EnumValue
    @JsonValue
    public final int value;

    @JsonCreator
    public static SmsTypeEnum fromString(String code) {
        SmsTypeEnum status = Arrays.stream(SmsTypeEnum.values()).filter(item -> item.toString().equals(code)).findFirst().get();
        return status;
    }

}
