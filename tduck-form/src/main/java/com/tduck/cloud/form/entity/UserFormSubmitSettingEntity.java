package com.tduck.cloud.form.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.tduck.cloud.common.entity.BaseEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * 用户单提交设置对象 fm_user_Form_submit_setting
 *
 * @author tduck-gen
 * @date 2021-08-11 22:06:05
 */
@Data
@TableName("fm_user_form_submit_setting")
public class UserFormSubmitSettingEntity extends BaseEntity {

    private Long id;

    /**
     * 表单key
     */
    @NotBlank
    private String formKey;

    /**
     * 是否显示提示图片
     */
    @TableField("is_prompt_img")
    private Boolean promptImg;

    /**
     * 提示图片地址
     */
    private String promptImgUrl;

    /**
     * 是否显示提示文字
     */
    @TableField("is_prompt_text")
    private Boolean promptText;

    /**
     * 提交提示文字内容
     */
    private String promptTextContent;

    /**
     * 是否提交跳转
     */
    @TableField("is_submit_jump")
    private Boolean submitJump;

    /**
     * 提交跳转连接
     */
    private String submitJumpUrl;

    /**
     * 公开提交结果
     */
    @TableField("is_public_result")
    private Boolean publicResult;


}
