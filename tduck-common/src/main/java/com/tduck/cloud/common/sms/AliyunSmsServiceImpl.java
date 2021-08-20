package com.tduck.cloud.common.sms;

import cn.hutool.core.util.StrUtil;
import com.aliyun.dysmsapi20170525.Client;
import com.aliyun.dysmsapi20170525.models.SendSmsRequest;
import com.aliyun.dysmsapi20170525.models.SendSmsResponse;
import com.aliyun.teaopenapi.models.Config;
import com.google.common.collect.ImmutableMap;
import com.tduck.cloud.common.util.JsonUtils;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;

import java.util.Map;

/**
 * @author : smalljop
 * @description : 阿里云短信
 * @create : 2020-12-15 10:33
 **/
@Data
@Slf4j
public class AliyunSmsServiceImpl extends SmsService {


    private Client client;

    public AliyunSmsServiceImpl(SmsPlatformProperties properties) {
        Config config = new Config()
                // 您的AccessKey ID
                .setAccessKeyId(properties.getSecretId())
                // 您的AccessKey Secret
                .setAccessKeySecret(properties.getSecretKey());
        // 访问的域名
        config.endpoint = "dysmsapi.aliyuncs.com";
        try {
            client = new Client(config);
            this.properties = properties;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @Override
    public boolean sendSms(String phoneNumber, String templateId, String... templateParams) {
        Map<String, Object> params = ImmutableMap.of("code", templateParams);
        // 1.发送短信
        SendSmsRequest sendReq = new SendSmsRequest()
                .setPhoneNumbers(phoneNumber)
                .setSignName(properties.getSign())
                .setTemplateCode(templateId)
                .setTemplateParam(JsonUtils.objToJson(params));
        SendSmsResponse sendResp = null;
        try {
            sendResp = client.sendSms(sendReq);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String code = sendResp.body.code;
        if (!StrUtil.equals(code, "OK")) {
            return false;
        }
        return true;
    }

    @Override
    public boolean sendValidateSms(String phoneNumber, String... templateParams) {
        this.sendSms(phoneNumber, properties.getValidateCodeTemplateId(), templateParams);
        return true;
    }

    @Override
    public boolean sendRetrievePwdValidateSms(String phoneNumber, String... templateParams) {
        this.sendSms(phoneNumber, properties.getValidateCodeTemplateId(), templateParams);
        return false;
    }
}
