package com.tduck.cloud.project.entity;


import com.baomidou.mybatisplus.annotation.FieldStrategy;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.tduck.cloud.common.entity.BaseEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;

/**
 * 项目表单项(UserProjectSetting)表实体类
 *
 * @author smalljop
 * @since 2020-11-30 13:57:26
 */

@Data
@TableName(value = "pr_user_project_setting", autoResultMap = true)
public class UserProjectSettingEntity extends BaseEntity<UserProjectSettingEntity> {
    private Long id;
    /**
     * 项目key
     */
    @NotBlank(message = "projectKey不能为空")
    private String projectKey;
    /**
     * 提交提示图片
     */
    private String submitPromptImg;
    /**
     * 提交提示文字
     */
    private String submitPromptText;
    /**
     * 提交跳转连接
     */
    private String submitJumpUrl;

    /**
     * 公开提交结果
     */
    @TableField("is_public_result")
    private Boolean publicResult;
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
     * 新反馈通知邮件
     */
    private String newWriteNotifyEmail;
    /**
     * 新反馈通知微信
     */
    private String newWriteNotifyWx;
    /**
     * 记录微信用户个人信息
     */
    @TableField("is_record_wx_user")
    private Boolean recordWxUser;
    /**
     * 定时收集开始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(updateStrategy = FieldStrategy.IGNORED)
    private LocalDateTime timedCollectionBeginTime;
    /**
     * 定时收集结束时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(updateStrategy = FieldStrategy.IGNORED)
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
    /**
     * 分享图片
     */
    private String shareImg;
    /**
     * 分享标题
     */
    private String shareTitle;
    /**
     * 分享描述
     */
    private String shareDesc;


}