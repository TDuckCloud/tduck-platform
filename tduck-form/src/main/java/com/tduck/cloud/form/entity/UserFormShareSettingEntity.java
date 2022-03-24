package com.tduck.cloud.form.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.tduck.cloud.common.entity.BaseEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * 项目单项对象 fm_user_Form_share_setting
 *
 * @author tduck-gen
 * @date 2021-08-12 16:19:57
 */
@Data
@TableName("fm_user_form_share_setting")
public class UserFormShareSettingEntity extends BaseEntity {

    /**
     *
     */
    private Long id;

    @NotBlank
    private String formKey;
    /**
     * 是否设置分享图片
     */
    @TableField("is_share_img")
    private Boolean shareImg;

    /**
     * 分享图片
     */
    private String shareImgUrl;

    /**
     * 是否开启设置标题
     */
    @TableField("is_share_title")
    private Boolean shareTitle;

    /**
     * 分享标题
     */
    private String shareTitleContent;

    /**
     * 是否设置分享描述
     */
    @TableField("is_share_desc")
    private Boolean shareDesc;

    /**
     * 分享描述
     */
    private String shareDescContent;


}
