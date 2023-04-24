package com.tduck.cloud.form.entity;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.mybatis.handler.BooleanTypeHandler;
import com.tduck.cloud.common.validator.group.AddGroup;
import com.tduck.cloud.common.validator.group.UpdateGroup;
import com.tduck.cloud.form.entity.enums.FormSourceTypeEnum;
import com.tduck.cloud.form.entity.enums.FormStatusEnum;
import com.tduck.cloud.form.entity.enums.FormTypeEnum;
import com.tduck.cloud.form.util.HtmlUtils;
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
@TableName(value = "fm_user_form", autoResultMap = true)
public class UserFormEntity extends BaseEntity<UserFormEntity> {
    /**
     * 表单code
     */
    @NotBlank(message = "错误请求", groups = {UpdateGroup.class})
    private String formKey;
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
    private FormStatusEnum status;
    /**
     * 表单类型
     */
    private FormTypeEnum type;

    @TableField(value = "is_deleted", typeHandler = BooleanTypeHandler.class)
    private Boolean deleted;

    /**
     * 是否是文件夹
     */
    @TableField(value = "is_folder", typeHandler = BooleanTypeHandler.class)
    private Boolean folder;
    /**
     * 父级文件夹ID
     */
    private Long folderId;


    /**
     * 移除html标签
     * @return 文本
     */
    public String getTextName() {
        if (StrUtil.isBlank(name)) {
            return null;
        }
        // 标题是富文本 去除html 标签
        return HtmlUtils.cleanHtmlTag(name);
    }
}
