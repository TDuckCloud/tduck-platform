package com.tduck.cloud.common.sms;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.map.MapUtil;
import cn.hutool.http.HttpUtil;
import lombok.extern.slf4j.Slf4j;

import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author : tduck
 * @description : 接入平台 https://vip.veesing.com/client/smscode
 * @create : 2020-12-15 10:33
 **/
@Slf4j
public class VeesingSmsServiceImpl extends SmsService {



    public VeesingSmsServiceImpl(SmsPlatformProperties properties) {
        this.properties = properties;
    }


    @Override
    public boolean sendSms(String phoneNumber, String templateId, Map<String, Object> templateParams) {
        Map<String, Object> params = MapUtil.newHashMap();
        params.put("appId", properties.getAppId());
        params.put("appKey", properties.getSecretKey());
        params.put("phone", phoneNumber);
        params.put("templateId", templateId);
        params.put("variables", templateParams.values().stream().map(Convert::toStr).collect(Collectors.toList()));
        String result = HttpUtil.createPost("https://vip.veesing.com/smsApi/verifyCode")
                .header("ContentType", "application/x-www-form-urlencoded;charset=utf-8")
                .form(params).execute().body();
        log.info("sendSms:{}", result);
        return true;
    }


}
