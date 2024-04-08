package com.tduck.cloud.common.sms;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * 短信配置类
 *
 * @author smalljop
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "platform.sms")
public class SmsPlatformProperties {

    /**
     * secretId
     */
    private String secretId;


    private SmsTypeEnum type;
    /**
     * 秘钥
     */
    private String secretKey;
    /**
     * appId 腾讯云使用
     */
    private String appId;
    /**
     * 短信签名 如【tduck】 需要去短信平台申请
     */
    private String sign;

    /**
     * 模板id
     */
    private String templateId;


}
