package com.tduck.cloud.common.sms;

import cn.hutool.core.util.ObjectUtil;
import com.tduck.cloud.common.util.JsonUtils;
import com.tduck.cloud.common.util.SpringContextUtils;
import com.tduck.cloud.envconfig.constant.ConfigConstants;
import com.tduck.cloud.envconfig.service.SysEnvConfigService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;


/**
 * @author : tduck
 * @description : 短信平台配置
 * @create :  2021/07/19 10:59
 **/
@RequiredArgsConstructor
public class SmsConfiguration {

    @Getter
    private static SmsService smsService;

    static {
        buildMsgSender();
    }

    public static synchronized void buildMsgSender() {
        SmsPlatformProperties properties = JsonUtils.jsonToObj(SpringContextUtils.getBean(SysEnvConfigService.class).getValueByKey(ConfigConstants.SMS_ENV_CONFIG), SmsPlatformProperties.class);
        if (ObjectUtil.isNull(properties)) {
            return;
        }
        switch (properties.getType()) {
            case ALIYUN:
                smsService = new AliyunSmsServiceImpl(properties);
                break;
            case TENCENT_CLOUD:
                smsService = new TencentSmsServiceImpl(properties);
                break;
            case VEESING:
                smsService = new VeesingSmsServiceImpl(properties);
                break;
        }
    }

}
