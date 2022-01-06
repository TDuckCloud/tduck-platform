package com.tduck.cloud.form.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.tduck.cloud.common.entity.BaseEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * 表单通知设置 fm_user_Form_notify_setting
 *
 * @author tduck-gen
 * @date 2021-08-12 15:21:03
 */
@Data
@TableName("fm_user_form_notify_setting")
public class UserFormNotifySettingEntity extends BaseEntity {

    private Long id;

    /**
     * 项目key
     */
    @NotBlank
    private String formKey;

    /**
     * 开启邮件通知
     */
    @TableField("is_email_notify")
    private Boolean emailNotify;

    /**
     * 新反馈通知邮件列表
     */
    private String newWriteNotifyEmail;

    /**
     * 开启邮件通知
     */
    @TableField("is_wx_notify")
    private Boolean wxNotify;

    /**
     * 新反馈通知微信列表
     */
    private String newWriteNotifyWx;


}
