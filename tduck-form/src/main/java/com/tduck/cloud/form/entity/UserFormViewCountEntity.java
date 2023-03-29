package com.tduck.cloud.form.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;
import java.io.Serializable;
import java.math.BigDecimal;

import com.tduck.cloud.common.entity.BaseEntity;

/**
 * 用户表单查看次数对象 fm_user_form_view_count
 *
 * @author tduck
 * @date 2023-04-04 21:29:39
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("fm_user_form_view_count")
public class UserFormViewCountEntity extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     *
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 表单唯一标识
     */
    private String formKey;
    /**
     *
     */
    private Long count;

}
