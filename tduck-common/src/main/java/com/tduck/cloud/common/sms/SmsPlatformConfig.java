package com.tduck.cloud.common.sms;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author : wangqing
 * @description : 短信平台配置
 * @create :  2021/07/19 10:59
 **/
@Configuration
@RequiredArgsConstructor
public class SmsPlatformConfig {

    private final SmsPlatformProperties properties;


    @Bean
    public SmsService smsService() {
        SmsService smsService = null;
        switch (properties.getType()) {
            case ALIYUN:
                smsService = new AliyunSmsServiceImpl(properties);
                break;
            case TENCENT_CLOUD:
                smsService = new TencentSmsServiceImpl(properties);
                break;
        }
        return smsService;
    }
}
