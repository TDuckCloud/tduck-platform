package com.tduck.cloud.storage.entity.enums;

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
public enum OssTypeEnum {
    /**
     * 阿里云
     */
    ALIYUN(0),

    /**
     * 七牛云
     */
    QINIU(1),
    /**
     * 又拍云
     */
    UPYUN(2),

    /**
     * 本地存储
     */
    LOCAL(3),

    /**
     * minio
     */
    MINIO(4);

    @EnumValue
    @JsonValue
    private final int value;

    @JsonCreator
    OssTypeEnum(int value) {
        this.value = value;
    }

}
