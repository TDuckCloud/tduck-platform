package com.tduck.cloud.account.request;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @author : smalljop
 * @description : 账号登录请求
 * @create : 2020-11-10 18:17
 **/
@Data
public class AccountLoginRequest {

    @NotBlank(message = "请填写账号")
    private String account;
    @NotBlank(message = "请填写密码")
    private String password;

    /**
     * 请求Ip地址
     */
    private String requestIp;
}
