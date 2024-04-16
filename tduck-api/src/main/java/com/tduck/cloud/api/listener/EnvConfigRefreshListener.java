package com.tduck.cloud.api.listener;

import com.tduck.cloud.common.email.MailConfiguration;
import com.tduck.cloud.common.sms.SmsConfiguration;
import com.tduck.cloud.envconfig.constant.ConfigConstants;
import com.tduck.cloud.common.util.JsonUtils;
import com.tduck.cloud.common.util.SpringContextUtils;
import com.tduck.cloud.envconfig.entity.event.EnvConfigRefreshEvent;
import com.tduck.cloud.storage.cloud.OssStorageFactory;
import com.tduck.cloud.wx.mp.config.WxMpConfiguration;
import com.tduck.cloud.wx.mp.config.WxMpProperties;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.mp.api.impl.WxMpServiceImpl;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;


/**
 * @author : tduck
 * @description :  系统配置更新
 * @create :  2021/11/30 10:40
 **/
@Component
@RequiredArgsConstructor
@Slf4j
public class EnvConfigRefreshListener {


    /**
     * 更新系统环境配置
     *
     * @param event 环境配置更新事件
     */
    @EventListener
    public void envConfigRefreshEvent(EnvConfigRefreshEvent event) {
        log.debug("配置更新:{}", JsonUtils.objToJson(event.getConfig()));
        switch (event.getConfig().getEnvKey().trim()) {
            case ConfigConstants.FILE_ENV_CONFIG:
                OssStorageFactory.build();
                break;
            case ConfigConstants.SMS_ENV_CONFIG:
                SmsConfiguration.buildMsgSender();
                break;
            case ConfigConstants.EMAIL_ENV_CONFIG:
                MailConfiguration.buildMailSender();
                break;
            case ConfigConstants.WX_MP_ENV_CONFIG:
                WxMpProperties.MpConfig mpConfig = JsonUtils.jsonToObj(JsonUtils.objToJson(event.getConfig().getEnvValue()), WxMpProperties.MpConfig.class);
                WxMpServiceImpl wxService = SpringContextUtils.getBean(WxMpServiceImpl.class);
                WxMpConfiguration.setWxMpConfig(wxService, mpConfig);
                break;
            default:
                break;
        }

    }


}
