package com.tduck.cloud.form.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.tduck.cloud.common.entity.BaseEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * 单链接扩展值对象 fm_user_form_link_ext
 *
 * @author tduck-gen
 * @date 2021-12-14 14:26:38
 */
@Data
@TableName("fm_user_form_link_ext")
public class UserFormLinkExtEntity extends BaseEntity {



    /**
     * 表单唯一标识
     */
    @NotBlank
    private String formKey;

    /**
     * 扩展值
     */
    @NotBlank
    private String extValue;


}
