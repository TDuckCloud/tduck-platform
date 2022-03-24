package com.tduck.cloud.form.request;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @author : smalljop
 * @description : 检查验证码是否正确
 * @create : 2020-11-10 18:17
 **/
@Data
public class CheckPhoneCodeRequest {
    @NotBlank(message = "手机号不能为空")
    private String phoneNumber;

    @NotBlank(message = "验证码不能为空")
    private String code;
}