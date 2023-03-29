package com.tduck.cloud.form.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.tduck.cloud.common.entity.BaseEntity;
import lombok.Data;


/**
 * 表单主题分类
 *
 * @author smalljop
 * @since 2021-01-06 10:50:51
 */

@Data
@TableName(value = "fm_form_template_category", autoResultMap = true)
public class FormTemplateCategoryEntity extends BaseEntity<FormTemplateCategoryEntity> {
    /**
     * 主题名称
     */
    private String name;
    /**
     * 排序
     */
    private Integer sort;

}