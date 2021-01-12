package com.tduck.cloud.account.request;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @author : smalljop
 * @description : 找回密码请求
 * @create : 2020-11-10 18:17
 **/
@Data
public class RetrievePasswordRequest {

    @Data
    public static class CheckPhoneCode {
        @NotBlank(message = "手机号不能为空")
        private String phoneNumber;

        @NotBlank(message = "验证码不能为空")
        private String code;
    }


    /**
     * 重置密码
     */
    @Data
    public static class Reset {
        @NotBlank(message = "code不能为空")
        private String code;
        @NotBlank(message = "密码不能为空")
        private String password;
        @NotBlank(message = "确认密码不能为空")
        private String rePassword;
    }

}
