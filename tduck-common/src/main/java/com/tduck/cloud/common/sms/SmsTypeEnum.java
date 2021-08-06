package com.tduck.cloud.common.sms;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.Getter;

/**
 * @description: Oss类型
 * @author: smalljop
 * @create: 2020-02-18 23:06
 **/
@Getter
public enum SmsTypeEnum {
    /**
     * 阿里云
     */
    ALIYUN(1),

    /**
     * 腾讯云
     */
    TENCENT_CLOUD(2);


    @EnumValue
    @JsonValue
    public final int value;

    @JsonCreator
    SmsTypeEnum(int value) {
        this.value = value;
    }

}
