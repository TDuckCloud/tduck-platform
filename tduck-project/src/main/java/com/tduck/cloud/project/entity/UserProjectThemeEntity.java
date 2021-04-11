package com.tduck.cloud.project.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.tduck.cloud.common.entity.BaseEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * 项目表单项(UserProjectTheme)表实体类
 *
 * @author smalljop
 * @since 2020-11-25 13:36:27
 */
@Data
@TableName(value = "pr_user_project_theme", autoResultMap = true)
public class UserProjectThemeEntity extends BaseEntity<UserProjectThemeEntity> {
    private Long id;
    /**
     * 项目key
     */
    @NotBlank(message = "projectKey不能为空")
    private String projectKey;
    /**
     * 主题Id
     */
    private Long themeId;
    /**
     * logo图片
     */
    private String logoImg;

    /**
     * logo位置
     */
    private String logoPosition;

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