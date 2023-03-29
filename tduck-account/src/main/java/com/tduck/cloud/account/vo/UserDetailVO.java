package com.tduck.cloud.account.vo;

import lombok.Data;

/**
 * @author : smalljop
 * @description : 用户详情
 * @create: 2020-12-21 10:51
 **/
@Data
public class UserDetailVO {
    /**
     * 姓名
     */
    private String name;
    /**
     * 头像
     */
    private String avatar;
    /**
     * 性别
     */
    private Integer gender;
    /**
     * 手机号
     */
    private String phoneNumber;
    /**
     * 邮箱
     */
    private String email;

    /**
     * 绑定qq
     */
    private String qqName;

    /**
     * 绑定微信名称
     */
    private String wxName;


    private boolean isAdmin;
}
