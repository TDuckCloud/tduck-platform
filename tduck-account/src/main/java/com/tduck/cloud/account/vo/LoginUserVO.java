package com.tduck.cloud.account.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author : smalljop
 * @description : 登录用户VO
 * @create : 2020-11-12 14:34
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginUserVO {
    /**
     * 头像
     */
    private String avatar;
    /**
     * 性别
     */
    private String name;

    /**
     * token
     */
    private String token;

    private boolean isAdmin;
}
