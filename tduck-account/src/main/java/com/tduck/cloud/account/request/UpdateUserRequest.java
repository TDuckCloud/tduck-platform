package com.tduck.cloud.account.request;


import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * 更新用户请求
 *
 * @author smalljop
 */
@Data
public class UpdateUserRequest {

    @Data
    public static class PhoneNumber {
        @NotBlank(message = "手机号不能为空")
        private String phoneNumber;

        @NotBlank(message = "验证码不能为空")
        private String code;

    }

    @Data
    public static class Email {
        @NotBlank(message = "邮箱不能为空")
        private String email;

        @NotBlank(message = "验证码不能为空")
        private String key;

    }

    @Data
    public static class Password {
        @NotBlank(message = "原密码不能为空")
        private String oldPassword;

        @NotBlank(message = "密码不能为空")
        private String password;

        @NotBlank(message = "重复密码不能为空")
        private String repeatPassword;
    }

}
