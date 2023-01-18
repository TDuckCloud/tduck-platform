package com.tduck.cloud.account.constant;

/**
 * @description: redis key常量
 * @author: smalljop
 * @create: 2020-02-12 22:34
 **/
public interface AccountRedisKeyConstants {
    /**
     * 邮箱验证码
     */
    String EMAIL_CODE = "user:email:code:{}";

    /**
     * 手机号验证码
     */
    String PHONE_NUMBER_CODE = "user:mobile:code:{}";

    /**
     * 手机找回密码验证码
     */
    String PHONE_RETRIEVE_PWD_CODE = "user:mobile:retrieve:pwd:code:{}";


    /**
     * 找回密码验证完成用户身份code
     */
    String RETRIEVE_PWD_USER_CODE = "user:retrieve:pwd:code:{}";

    /**
     * 修改邮箱验证
     */
    String UPDATE_USER_EMAIL_CODE = "user:email:update:code:{}:{}";


    /**
     * 用户token
     */
    String USER_TOKEN = "user:token:{}";
}
