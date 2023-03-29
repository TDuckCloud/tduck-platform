package com.tduck.cloud.form.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.mybatis.handler.JacksonTypeHandler;
import lombok.Data;
import lombok.experimental.Accessors;
import lombok.experimental.FieldNameConstants;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * 表单授权对象对象 fm_user_Form_auth
 * 授权组授权对象
 *
 * @author tduck-gen
 * @date 2021-08-17 14:37:42
 */
@Data
@Accessors(chain = true)
@FieldNameConstants
@TableName(value = "fm_user_form_auth", autoResultMap = true)
public class UserFormAuthEntity extends BaseEntity {


    /**
     * 项目key
     */
    @NotBlank
    private String formKey;

    /**
     * 授权组Id
     */
    @NotNull
    private Long authGroupId;

    /**
     * 用户Id列表
     */
    @TableField(typeHandler = JacksonTypeHandler.class)
    private List<String> userIdList;

    /**
     * 角色Id列表
     */
    @TableField(typeHandler = JacksonTypeHandler.class)
    private List<String> roleIdList;

    /**
     * 部门Id列表
     */
    @TableField(typeHandler = JacksonTypeHandler.class)
    private List<String> deptIdList;


}
