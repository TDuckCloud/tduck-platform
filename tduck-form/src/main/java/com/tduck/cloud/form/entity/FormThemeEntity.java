package com.tduck.cloud.form.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.tduck.cloud.common.entity.BaseEntity;
import lombok.Data;
import lombok.experimental.FieldNameConstants;


/**
 * 表单主题外观模板(FormTheme)表实体类
 *
 * @author smalljop
 * @since 2020-11-23 18:33:50
 */
@Data
@TableName(value = "fm_form_theme", autoResultMap = true)
@FieldNameConstants
public class FormThemeEntity extends BaseEntity<FormThemeEntity> {

    /**
     * 主题名称
     */
    private String name;
    /**
     * 主题风格
     */
    private Long style;
    /**
     * 头部图片
     */
    private String headImgUrl;

    /**
     * 背景图片
     */
    private String backgroundImg;


    /**
     * 主题颜色
     */
    private String themeColor;


}