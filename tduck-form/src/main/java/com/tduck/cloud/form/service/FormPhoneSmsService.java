package com.tduck.cloud.form.service;

/**
 * 表单手机短信
 *
 * @author : smalljop
 * @description :
 * @create : 2020-12-15 15:45
 **/
public interface FormPhoneSmsService {


    /**
     * 发送短信验证码
     *
     * @param phoneNumber
     */
    void sendPhoneCode(String phoneNumber);


    /**
     * 验证码是否正确
     *
     * @param phoneNumber
     */
    Boolean checkPhoneCode(String phoneNumber, String code);

}
