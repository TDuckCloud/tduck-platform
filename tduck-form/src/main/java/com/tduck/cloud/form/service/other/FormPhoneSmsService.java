package com.tduck.cloud.form.service.other;

import cn.hutool.cache.CacheUtil;
import cn.hutool.cache.impl.TimedCache;
import cn.hutool.captcha.generator.RandomGenerator;
import cn.hutool.core.date.DateUnit;
import cn.hutool.core.util.StrUtil;
import com.tduck.cloud.common.constant.CommonConstants;
import com.tduck.cloud.common.sms.SmsConfiguration;
import com.tduck.cloud.form.constant.FormRedisKeyConstants;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * @author : smalljop
 * @description :
 * @create : 2020-12-15 15:46
 **/
@Service
@Slf4j
@RequiredArgsConstructor
public class FormPhoneSmsService {

    static TimedCache<String, String> timedCache = CacheUtil.newTimedCache(20);


    static {
        timedCache.schedulePrune(5);
    }

    /**
     * 生成验证码
     */
    private String genValidateCode(String key) {
        //生成验证码
        RandomGenerator randomGenerator = new RandomGenerator("0123456789", CommonConstants.ConstantNumber.FOUR);
        String code = randomGenerator.generate();
        timedCache.put(key, code, DateUnit.MINUTE.getMillis() * 5);
        log.debug("genValidateCode:{}", code);
        return code;
    }

    @SneakyThrows
    public void sendPhoneCode(String phoneNumber) {
        Map<String, Object> params = new HashMap<>();
        params.put("code", genValidateCode(StrUtil.format(FormRedisKeyConstants.PHONE_NUMBER_CODE, phoneNumber)));
        SmsConfiguration.getSmsService().sendSms(phoneNumber, SmsConfiguration.getSmsService().properties.getTemplateId(), params);
    }

    public Boolean checkPhoneCode(String phoneNumber, String code) {
        String phoneCodeKey = StrUtil.format(FormRedisKeyConstants.PHONE_NUMBER_CODE, phoneNumber);
        String validateCode = timedCache.get(phoneCodeKey);
        if (code.equals(validateCode)) {
            timedCache.remove(phoneCodeKey);
            return true;
        }
        return false;
    }


}
