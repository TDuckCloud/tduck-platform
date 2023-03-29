package com.tduck.cloud.form.entity.struct;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tduck.cloud.form.entity.struct.setting.WriteSettingSchemaStruct;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author : tduck
 * @description : 设置结构定义
 * @create :  2021/06/07 16:37
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class FormSettingSchemaStruct extends WriteSettingSchemaStruct {
    /**
     * 自定义显示类型 1 系统默认 2 自定义页面 使用submitShowCustomPageContent内容
     */
    private int submitShowType;
    /**
     * 自定义显示内容
     */
    private String submitShowCustomPageContent;
    private boolean submitJump;
    private String submitJumpUrl;

    /**
     * 显示分享图片
     */
    private boolean shareWxImg;
    /**
     * 分享图片地址
     */
    private String shareWxImgUrl;
    /**
     * 显示分享标题
     */
    private boolean shareWxTitle;
    /**
     * 分享标题内容
     */
    private String shareWxTitleContent;
    /**
     * 开启分享描述
     */
    private boolean shareWxDesc;
    /**
     * 分享描述内容
     */
    private String shareWxDescContent;

    /**
     * 开启邮件通知
     */
    @JsonIgnore
    private boolean emailNotify;
    /**
     * 邮件通知账号
     */
    @JsonIgnore
    private String newWriteNotifyEmail;
    @JsonIgnore
    private boolean wxNotify;
    @JsonIgnore
    private String newWriteNotifyWx;


    /**
     * 公开回复
     */
    private boolean openReply;





}
