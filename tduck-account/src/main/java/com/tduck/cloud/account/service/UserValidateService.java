package com.tduck.cloud.account.service;


import com.tduck.cloud.account.entity.UserEntity;
import com.tduck.cloud.account.request.UpdateUserRequest;

/**
 * 账号验证码
 *
 * @author : smalljop
 * @description :
 * @create : 2020-12-15 15:45
 **/
public interface UserValidateService {

    /**
     * 发送邮箱验证码
     *
     * @param email
     */
    void sendEmailCode(String email);


    /**
     * 发送重置密码邮件
     *
     * @param email
     * @param userEntity
     */
    void sendResetPwdEmail(String email, UserEntity userEntity);

    /**
     * 发送绑定账号邮箱
     *
     * @param email
     * @param userId
     */
    void sendUpdateAccountEmail(String email, Long userId);

    /**
     * 获取需要更改邮箱的UserId
     *
     * @param request
     */
    Long getUpdateEmailUserId(UpdateUserRequest.Email request);

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


    /**
     * 找回密码验证码
     *
     * @param phoneNumber
     */
    void sendRetrievePwdPhoneCode(String phoneNumber);


    /**
     * 重置密码身份编码 验证通过之后生成
     *
     * @param userId
     * @return code
     */
    String getRestPasswordCode(Long userId);
}
