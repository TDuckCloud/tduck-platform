package com.tduck.cloud.form.service.impl;

import cn.hutool.captcha.generator.RandomGenerator;
import cn.hutool.core.util.StrUtil;
import com.tduck.cloud.common.constant.CommonConstants;
import com.tduck.cloud.common.sms.SmsService;
import com.tduck.cloud.common.util.CacheUtils;
import com.tduck.cloud.form.service.FormPhoneSmsService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import static com.tduck.cloud.form.constant.FormConstants.PHONE_NUMBER_CODE;


/**
 * @author : smalljop
 * @description :
 * @create : 2020-12-15 15:46
 **/
@Service
@Slf4j
@RequiredArgsConstructor
public class FormPhoneSmsServiceImpl implements FormPhoneSmsService {

    private final CacheUtils cacheUtils;
    private final SmsService smsService;

    /**
     * 生成验证码
     */
    private String genValidateCode(String key) {
        //生成验证码
        RandomGenerator randomGenerator = new RandomGenerator("0123456789", CommonConstants.ConstantNumber.FOUR);
        String code = randomGenerator.generate();
        cacheUtils.tempSave(key, code);
        log.debug("genValidateCode:{}", code);
        return code;
    }

    @Override
    public void sendPhoneCode(String phoneNumber) {
        smsService.sendValidateSms(phoneNumber,
                genValidateCode(StrUtil.format(PHONE_NUMBER_CODE, phoneNumber)));
    }

    @Override
    public Boolean checkPhoneCode(String phoneNumber, String code) {
        String phoneCodeKey = StrUtil.format(PHONE_NUMBER_CODE, phoneNumber);
        String validateCode = cacheUtils.getTemp(phoneCodeKey);
        if (code.equals(validateCode)) {
            cacheUtils.removeTemp(phoneCodeKey);
            return true;
        }
        return false;

    }


}
