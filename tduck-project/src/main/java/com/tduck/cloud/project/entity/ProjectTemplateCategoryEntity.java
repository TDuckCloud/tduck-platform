package com.tduck.cloud.project.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.tduck.cloud.common.entity.BaseEntity;
import lombok.Data;


/**
 * 项目模板分类(ProjectTemplateType)表实体类
 *
 * @author smalljop
 * @since 2021-01-06 10:50:51
 */

@Data
@TableName(value = "pr_project_template_category", autoResultMap = true)
public class ProjectTemplateCategoryEntity extends BaseEntity<ProjectTemplateCategoryEntity> {
    private Long id;
    /**
     * 主题名称
     */
    private String name;
    /**
     * 排序
     */
    private Integer sort;

}