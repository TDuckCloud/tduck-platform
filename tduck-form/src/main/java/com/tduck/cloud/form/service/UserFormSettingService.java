package com.tduck.cloud.form.service;

import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.form.entity.UserFormNotifySettingEntity;
import com.tduck.cloud.form.entity.UserFormShareSettingEntity;
import com.tduck.cloud.form.entity.UserFormSubmitSettingEntity;
import com.tduck.cloud.form.entity.UserFormWriteSettingEntity;

/**
 * 表单设置
 *
 * @author smalljop
 * @since 2020-11-30 14:00:52
 */
public interface UserFormSettingService {
    /**
     * 保存提交设置
     *
     * @param settingEntity
     * @return
     */
    Boolean saveSubmitFormSetting(UserFormSubmitSettingEntity settingEntity);

    /**
     * 查询提交设置
     *
     * @param formKey
     * @return
     */
    UserFormSubmitSettingEntity getSubmitSettingByKey(String formKey);

    /**
     * 保存填写设置
     *
     * @param settingEntity
     * @return
     */
    Boolean saveWriteFormSetting(UserFormWriteSettingEntity settingEntity);

    /**
     * 获取填写设置
     *
     * @param formKey
     * @return
     */
    UserFormWriteSettingEntity getWriteSettingByKey(String formKey);

    /**
     * 项目通知保存
     *
     * @param settingEntity
     * @return
     */
    Boolean saveNotifyFormSetting(UserFormNotifySettingEntity settingEntity);

    /**
     * 获取通知设置
     *
     * @param formKey
     * @return
     */
    UserFormNotifySettingEntity getNotifySettingByKey(String formKey);

    /**
     * 分享设置保存
     *
     * @param settingEntity
     * @return
     */
    Boolean saveShareFormSetting(UserFormShareSettingEntity settingEntity);

    /**
     * 分享设置查询
     *
     * @param formKey
     * @return
     */
    UserFormShareSettingEntity getShareSettingByKey(String formKey);


    /**
     * 获取当前项目设置的状态
     * 是否可以填写等
     *
     * @param formKey
     * @param requestIp
     * @param wxOpenId
     * @return
     */
    Result getUserFormWriteSettingStatus(String formKey, String requestIp, String wxOpenId);


    /**
     * 删除表单所有设置
     *
     * @param key
     * @return
     */
    Boolean deleteAllSetting(String key);
}