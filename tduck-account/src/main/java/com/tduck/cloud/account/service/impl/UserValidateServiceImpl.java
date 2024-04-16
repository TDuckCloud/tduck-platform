package com.tduck.cloud.account.service.impl;

import cn.hutool.captcha.generator.RandomGenerator;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.google.common.collect.ImmutableMap;
import com.tduck.cloud.account.constant.AccountRedisKeyConstants;
import com.tduck.cloud.account.entity.UserEntity;
import com.tduck.cloud.account.request.UpdateUserRequest;
import com.tduck.cloud.account.service.UserValidateService;
import com.tduck.cloud.common.constant.CommonConstants;
import com.tduck.cloud.common.email.MailService;
import com.tduck.cloud.common.util.CacheUtils;
import com.tduck.cloud.envconfig.service.SysEnvConfigService;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @author : smalljop
 * @description :
 * @create : 2020-12-15 15:46
 **/
@Service
@Slf4j
@RequiredArgsConstructor
public class UserValidateServiceImpl implements UserValidateService {

    private final static String REG_EMAIL_TITLE = "TDuck注册验证码";
    private final static String RESET_PWD_EMAIL_TITLE = "重置密码";
    private final CacheUtils cacheUtils;
    private final SysEnvConfigService sysEnvConfigService;

    @SneakyThrows
    @Override
    public void sendEmailCode(String email) {
        String code = genValidateCode(StrUtil.format(AccountRedisKeyConstants.EMAIL_CODE, email));
        //发送邮件
        MailService.sendTemplateHtmlMail(email, REG_EMAIL_TITLE, "mail/reg-code", MapUtil.of("code", code));
    }

    @SneakyThrows
    @Override
    public void sendResetPwdEmail(String email, UserEntity userEntity) {
        String code = getRestPasswordCode(userEntity.getId());
        //发送邮件
        String webBaseUrl = sysEnvConfigService.getSystemEnvConfig().getWebBaseUrl();
        String resetPwdUrl = webBaseUrl + "/forget/password?code={}&email={}";
        Map<String, Object> params = ImmutableMap.of("email", email, "resetPwdUrl", StrUtil.format(resetPwdUrl, code, email));
        MailService.sendTemplateHtmlMail(email, RESET_PWD_EMAIL_TITLE, "mail/reset-password", params);
    }

    @SneakyThrows
    @Override
    public void sendUpdateAccountEmail(String email, Long userId) {
        String code = IdUtil.fastUUID();
        cacheUtils.tempSave(StrUtil.format(AccountRedisKeyConstants.UPDATE_USER_EMAIL_CODE, code, email), userId.toString());
        //发送邮件
        String webBaseUrl = sysEnvConfigService.getSystemEnvConfig().getWebBaseUrl();
        String updateEmailUrl = webBaseUrl + "/account/forget/validate?type=updateEmail&code={}&email={}";
        Map<String, Object> params = ImmutableMap.of("updateEmailUrl", StrUtil.format(updateEmailUrl, code, email));
        MailService.sendTemplateHtmlMail(email, RESET_PWD_EMAIL_TITLE, "mail/update-account-email", params);
    }

    @Override
    public Long getUpdateEmailUserId(UpdateUserRequest.Email request) {
        String emailCodeKey = StrUtil.format(AccountRedisKeyConstants.UPDATE_USER_EMAIL_CODE, request.getKey(), request.getEmail());
        String userId = cacheUtils.getTemp(emailCodeKey);
        if (ObjectUtil.isNotNull(userId)) {
            cacheUtils.removeTemp(emailCodeKey);
            return Long.parseLong(userId);
        }
        return null;
    }


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
    public String getRestPasswordCode(Long userId) {
        String code = IdUtil.fastUUID();
        cacheUtils.tempSave(StrUtil.format(AccountRedisKeyConstants.RETRIEVE_PWD_USER_CODE, code), userId.toString());
        return code;
    }


}
