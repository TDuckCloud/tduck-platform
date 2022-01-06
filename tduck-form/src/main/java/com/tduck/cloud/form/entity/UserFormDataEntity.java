package com.tduck.cloud.form.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.mybatis.handler.JacksonTypeHandler;
import lombok.Data;
import lombok.experimental.Accessors;
import lombok.experimental.FieldNameConstants;

import javax.validation.constraints.NotBlank;
import java.util.Map;

/**
 * 表单数据(FormResult)表实体类
 *
 * @author smalljop
 * @since 2020-11-23 14:09:20
 */
@Data
@Accessors(chain = true)
@FieldNameConstants
@TableName(value = "fm_user_form_data", autoResultMap = true)
public class UserFormDataEntity extends BaseEntity {
    /**
     *
     */
    @TableId
    private Long id;
    /**
     * 表单key
     */
    @NotBlank(message = "错误请求")
    private String formKey;

    /**
     * 提交序号
     */
    private Long serialNumber;

    /**
     * 填写结果原始数据
     */
    @TableField(typeHandler = JacksonTypeHandler.class)
    private Map<String, Object> originalData;


    /**
     * 填写用户Ua
     */
    @TableField(typeHandler = JacksonTypeHandler.class)
    private Map<String, Object> submitUa;

    /**
     * 提交系统
     */
    private String submitOs;


    /**
     * 提交浏览器
     */
    private String submitBrowser;

    /**
     * 提交ip
     */
    private String submitRequestIp;


    /**
     * 提交ip
     */
    private String submitAddress;

    /**
     * 完成时间
     */
    private Long completeTime;

    /**
     * 微信openID
     */
    private String wxOpenId;

    /**
     * 微信用户信息
     */
    @TableField(typeHandler = JacksonTypeHandler.class)
    private Map<String, Object> wxUserInfo;
}