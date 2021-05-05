package com.tduck.cloud.project.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.validator.group.AddGroup;
import com.tduck.cloud.common.validator.group.UpdateGroup;
import com.tduck.cloud.project.entity.enums.ProjectSourceTypeEnum;
import com.tduck.cloud.project.entity.enums.ProjectStatusEnum;
import lombok.Data;
import lombok.experimental.FieldNameConstants;

import javax.validation.constraints.NotBlank;

/**
 * 用户项目表(Project)表实体类
 *
 * @author smalljop
 * @since 2020-11-18 18:16:16
 */
@Data
@TableName("pr_user_project")
@FieldNameConstants
public class UserProjectEntity extends BaseEntity<UserProjectEntity> {
    @TableId
    private Long id;
    /**
     * 项目code
     */
    @NotBlank(message = "错误请求", groups = {UpdateGroup.class})
    @TableField("`key`")
    private String key;
    /**
     * 项目名称
     */
    @NotBlank(message = "项目名称不能为空", groups = {AddGroup.class, UpdateGroup.class})
    private String name;
    /**
     * 项目描述
     */
    @TableField("`describe`")
    private String describe;


    /**
     * 项目来源
     */
    private ProjectSourceTypeEnum sourceType;

    /**
     * 来源ID
     */
    private String sourceId;

    /**
     * 用户ID
     */
    private Long userId;

    /***
     * 状态
     */
    @TableField("`status`")
    private ProjectStatusEnum status;
    /**
     * 项目类型
     */
    private Integer type;

    @TableField(value = "is_deleted")
    private Boolean deleted;


}