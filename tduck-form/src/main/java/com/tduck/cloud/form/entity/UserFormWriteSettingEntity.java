package com.tduck.cloud.form.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.tduck.cloud.common.entity.BaseEntity;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 表单填写设置对象 fm_user_Form_write_setting
 *
 * @author tduck-gen
 * @date 2021-08-12 13:20:07
 */
@Data
@TableName("fm_user_form_write_setting")
public class UserFormWriteSettingEntity extends BaseEntity {

    private Long id;

    /**
     * 项目key
     */
    private String formKey;

    /**
     * 只在微信填写
     */
    @TableField("is_wx_write")
    private Boolean wxWrite;

    /**
     * 一个微信只能填写一次
     */
    @TableField("is_wx_write_once")
    private Boolean wxWriteOnce;

    /**
     * 每人只能填写一次
     */
    @TableField("is_everyone_write_once")
    private Boolean everyoneWriteOnce;

    /**
     * 每人每天只能填写一次
     */
    @TableField("is_everyone_day_write_once")
    private Boolean everyoneDayWriteOnce;

    /**
     * 填写之后提示
     */
    private String writeOncePromptText;

    /**
     * 记录微信用户个人信息
     */
    @TableField("is_record_wx_user")
    private Boolean recordWxUser;

    /**
     * 是否定时收集
     */
    @TableField("is_timed_collection")
    private Boolean timedCollection;

    /**
     * 是否定时定量收集
     */
    @TableField("is_timed_quantitative_collection")
    private Boolean timedQuantitativeCollection;

    /**
     * 定时收集开始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime timedCollectionBeginTime;

    /**
     * 定时收集结束时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime timedCollectionEndTime;

    /**
     * 定时未启动提示文字
     */
    private String timedNotEnabledPromptText;

    /**
     * 定时停用会提示文字
     */
    private String timedDeactivatePromptText;

    /**
     * 定时定量数量
     */
    private Integer timedQuantitativeQuantity;

    /**
     * 定时定量完成提示
     */
    private String timedEndPromptText;


}
