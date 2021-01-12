package com.tduck.cloud.project.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.validator.group.AddGroup;
import com.tduck.cloud.common.validator.group.UpdateGroup;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;


/**
 * 项目表(ProjectTemplate)表实体类
 *
 * @author smalljop
 * @since 2021-01-06 10:42:45
 */

@Data
@TableName(value = "pr_project_template", autoResultMap = true)
public class ProjectTemplateEntity extends BaseEntity<ProjectTemplateEntity> {
    private Long id;
    /**
     * 模板唯一标识
     */
    @TableField("`key`")
    @NotBlank(message = "错误请求", groups = {UpdateGroup.class})
    private String key;
    /**
     * 项目名称
     */
    @NotBlank(message = "项目名称不能为空", groups = {AddGroup.class, UpdateGroup.class})
    private String name;

    /**
     * 封面图
     */
    private String coverImg;

    /**
     * 封面图
     */
    private Integer likeCount;

    /**
     * 项目描述
     */
    @TableField("`describe`")
    private String describe;
    /**
     * 项目类型
     */
    @NotNull(message = "项目类型不能为空", groups = {AddGroup.class, UpdateGroup.class})
    private Long categoryId;
    /**
     * 状态
     */
    private Long status;


}