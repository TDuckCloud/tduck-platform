package com.tduck.cloud.form.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.tduck.cloud.common.entity.BaseEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * 表单表单项(UserFormTheme)表实体类
 *
 * @author smalljop
 * @since 2020-11-25 13:36:27
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
@TableName(value = "fm_user_form_theme", autoResultMap = true)
public class UserFormThemeEntity extends BaseEntity<UserFormThemeEntity> {
    @TableId(type = IdType.AUTO)
    private Long id;
    /**
     * 表单key
     */
    @NotBlank(message = "formKey不能为空")
    private String formKey;

    /**
     * logo图片
     */
    private String logoImg;

    /**
     * logo位置
     */
    private String logoPosition;

    /**
     * 头部图片
     */
    private String headImgUrl;

    /**
     * 按钮颜色
     */
    private String btnsColor;

    /**
     * 提交按钮文字
     */
    private String submitBtnText;


    /**
     * 背景
     */
    private String backgroundColor;

    /**
     * 背景
     */
    private String backgroundImg;
    /**
     * 是否显示标题
     */
    private Boolean showTitle;
    /**
     * 是否显示描述语
     */
    private Boolean showDescribe;
    /**
     * 显示序号
     */
    private Boolean showNumber;


}