package com.tduck.cloud.account.request;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @author : smalljop
 * @description : qq登录
 * @create : 2020-12-09 18:30
 **/
@Data
public class QqLoginRequest {


    private String redirectUri;

    private String authorizeCode;

    /**
     * 请求Ip地址
     */
    private String requestIp;
}
