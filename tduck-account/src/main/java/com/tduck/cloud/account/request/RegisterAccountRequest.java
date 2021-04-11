package com.tduck.cloud.account.request;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @author : smalljop
 * @description : 账号注册
 * @create : 2020-11-10 18:17
 **/
@Data
public class RegisterAccountRequest {

    @NotBlank(message = "邮箱不能为空", groups = {EmailGroup.class})
    private String email;
    @NotBlank(message = "手机号不能为空", groups = {PhoneNumberGroup.class})
    private String phoneNumber;
    @NotBlank(message = "密码不能为空", groups = {EmailGroup.class, PhoneNumberGroup.class})
    private String password;
    @NotBlank(message = "验证码不能为空", groups = {EmailGroup.class, PhoneNumberGroup.class})
    private String code;

    /**
     * 邮箱校验组
     */
    public interface EmailGroup {
    }


    /**
     * 手机校验组
     */
    public interface PhoneNumberGroup {
    }
}
