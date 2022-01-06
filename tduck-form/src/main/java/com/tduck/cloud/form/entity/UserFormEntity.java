package com.tduck.cloud.form.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.validator.group.AddGroup;
import com.tduck.cloud.common.validator.group.UpdateGroup;
import com.tduck.cloud.form.entity.enums.FormSourceTypeEnum;
import com.tduck.cloud.form.entity.enums.FormStatusEnum;
import lombok.Data;
import lombok.experimental.FieldNameConstants;

import javax.validation.constraints.NotBlank;

/**
 * 用户表单表(Form)表实体类
 *
 * @author smalljop
 * @since 2020-11-18 18:16:16
 */
@Data
@FieldNameConstants
@TableName("fm_user_form")
public class UserFormEntity extends BaseEntity<UserFormEntity> {
    @TableId
    private Long id;
    /**
     * 表单code
     */
    @NotBlank(message = "错误请求", groups = {UpdateGroup.class})
    @TableField("`key`")
    private String key;
    /**
     * 表单名称
     */
    @NotBlank(message = "表单名称不能为空", groups = {AddGroup.class, UpdateGroup.class})
    private String name;
    /**
     * 表单描述
     */
    private String description;


    /**
     * 表单来源
     */
    private FormSourceTypeEnum sourceType;

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
    private FormStatusEnum status;
    /**
     * 表单类型
     */
    private Integer type;

    @TableField(value = "is_deleted")
    private Boolean deleted;


}