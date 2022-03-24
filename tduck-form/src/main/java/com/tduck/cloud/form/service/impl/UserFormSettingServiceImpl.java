package com.tduck.cloud.form.service.impl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.tduck.cloud.common.constant.CommonConstants;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.form.entity.*;
import com.tduck.cloud.form.entity.enums.FormStatusEnum;
import com.tduck.cloud.form.mapper.UserFormNotifySettingMapper;
import com.tduck.cloud.form.mapper.UserFormShareSettingMapper;
import com.tduck.cloud.form.mapper.UserFormSubmitSettingMapper;
import com.tduck.cloud.form.mapper.UserFormWriteSettingMapper;
import com.tduck.cloud.form.service.UserFormDataService;
import com.tduck.cloud.form.service.UserFormService;
import com.tduck.cloud.form.service.UserFormSettingService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Optional;

/**
 * 表单表单项(UserFormSetting)表服务实现类
 *
 * @author smalljop
 * @since 2020-11-30 14:00:53
 */
@Service
@RequiredArgsConstructor
public class UserFormSettingServiceImpl implements UserFormSettingService {
    private final UserFormService userFormService;
    private final UserFormDataService userFormDataService;
    private final UserFormSubmitSettingMapper userFormSubmitSettingMapper;
    private final UserFormWriteSettingMapper userFormWriteSettingMapper;
    private final UserFormShareSettingMapper userFormShareSettingMapper;
    private final UserFormNotifySettingMapper userFormNotifySettingMapper;

    @Override
    public Boolean saveSubmitFormSetting(UserFormSubmitSettingEntity settingEntity) {
        if (ObjectUtil.isNotNull(settingEntity.getId())) {
            return userFormSubmitSettingMapper.updateById(settingEntity) > 0;
        }
        return userFormSubmitSettingMapper.insert(settingEntity) > 0;
    }

    @Override
    public UserFormSubmitSettingEntity getSubmitSettingByKey(String formKey) {
        return userFormSubmitSettingMapper.selectOne(Wrappers.<UserFormSubmitSettingEntity>lambdaQuery().eq(UserFormSubmitSettingEntity::getFormKey, formKey));
    }

    @Override
    public Boolean saveWriteFormSetting(UserFormWriteSettingEntity settingEntity) {
        if (ObjectUtil.isNotNull(settingEntity.getId())) {
            return userFormWriteSettingMapper.updateById(settingEntity) > 0;
        }
        return userFormWriteSettingMapper.insert(settingEntity) > 0;
    }

    @Override
    public UserFormWriteSettingEntity getWriteSettingByKey(String formKey) {
        return userFormWriteSettingMapper.selectOne(Wrappers.<UserFormWriteSettingEntity>lambdaQuery().eq(UserFormWriteSettingEntity::getFormKey, formKey));
    }

    @Override
    public Boolean saveNotifyFormSetting(UserFormNotifySettingEntity settingEntity) {
        if (ObjectUtil.isNotNull(settingEntity.getId())) {
            return userFormNotifySettingMapper.updateById(settingEntity) > 0;
        }
        return userFormNotifySettingMapper.insert(settingEntity) > 0;
    }

    @Override
    public UserFormNotifySettingEntity getNotifySettingByKey(String formKey) {
        return userFormNotifySettingMapper.selectOne(Wrappers.<UserFormNotifySettingEntity>lambdaQuery().eq(UserFormNotifySettingEntity::getFormKey, formKey));
    }

    @Override
    public Boolean saveShareFormSetting(UserFormShareSettingEntity settingEntity) {
        if (ObjectUtil.isNotNull(settingEntity.getId())) {
            return userFormShareSettingMapper.updateById(settingEntity) > 0;
        }
        return userFormShareSettingMapper.insert(settingEntity) > 0;
    }

    @Override
    public UserFormShareSettingEntity getShareSettingByKey(String formKey) {
        return userFormShareSettingMapper.selectOne(Wrappers.<UserFormShareSettingEntity>lambdaQuery().eq(UserFormShareSettingEntity::getFormKey, formKey));
    }


    @Override
    public Result getUserFormWriteSettingStatus(String formKey, String requestIp, String wxOpenId) {
        UserFormEntity userFormEntity = userFormService.getByKey(formKey);
        // 未发布不允许填写
        if (ObjectUtil.isNull(userFormEntity) || userFormEntity.getStatus() != FormStatusEnum.RELEASE) {
            return Result.success(null, "表单暂时无法填写");
        }
        UserFormWriteSettingEntity setting = userFormWriteSettingMapper.selectOne(Wrappers.<UserFormWriteSettingEntity>lambdaQuery()
                .eq(UserFormWriteSettingEntity::getFormKey, formKey));
        if (ObjectUtil.isNull(setting)) {
            return Result.success(setting);
        }
        // 未发布不允许填写
        Optional<LocalDateTime> timedCollectionBeginTime = Optional.ofNullable(setting.getTimedCollectionBeginTime());
        Optional<LocalDateTime> timedCollectionEndTime = Optional.ofNullable(setting.getTimedCollectionEndTime());
        LocalDateTime now = LocalDateTime.now();
        //时间未开始
        if (setting.getTimedCollection() && timedCollectionBeginTime.isPresent() && timedCollectionBeginTime.get().isAfter(now)) {
            return Result.success(null, StrUtil.isEmpty(setting.getTimedNotEnabledPromptText()) ? "表单时间末开始。" : setting.getTimedNotEnabledPromptText());
        }
        //时间已经结束
        if (setting.getTimedCollection() && timedCollectionEndTime.isPresent() && timedCollectionEndTime.get().isBefore(now)) {
            return Result.success(null, StrUtil.isEmpty(setting.getTimedDeactivatePromptText()) ? "表单时间已结束。" : setting.getTimedDeactivatePromptText());
        }
        //收集数量达到
        Integer timedQuantitativeQuantity = setting.getTimedQuantitativeQuantity();
        if (setting.getTimedQuantitativeCollection() && Optional.ofNullable(timedQuantitativeQuantity).isPresent() && 0 != timedQuantitativeQuantity) {
            long resultCount = userFormDataService.count(Wrappers.<UserFormDataEntity>lambdaQuery().eq(UserFormDataEntity::getFormKey, formKey));
            if (resultCount >= timedQuantitativeQuantity) {
                return Result.success(setting, StrUtil.isEmpty(setting.getTimedEndPromptText()) ? "收集数量已达到。" : setting.getTimedEndPromptText());
            }
        }
        //每个人只需填写一次 根据IP判断
        Boolean everyoneWriteOnce = setting.getEveryoneWriteOnce();
        Boolean everyoneDayWriteOnce = setting.getEveryoneDayWriteOnce();
        if (everyoneWriteOnce || everyoneDayWriteOnce) {
            LambdaQueryWrapper<UserFormDataEntity> wrapper = Wrappers.<UserFormDataEntity>lambdaQuery()
                    .eq(UserFormDataEntity::getFormKey, formKey)
                    .eq(UserFormDataEntity::getSubmitRequestIp, requestIp);
            if (everyoneDayWriteOnce) {
                wrapper.apply(StrUtil.format("date_format({},'%Y-%m-%d') = '{}'",
                        StrUtil.toUnderlineCase(BaseEntity.Fields.createTime), DateUtil.today()));
            }
            long writeCount = userFormDataService.count(wrapper);
            if (CommonConstants.ConstantNumber.ONE <= writeCount) {
                return Result.success(null, setting.getWriteOncePromptText());
            }
        }
        //每个微信仅填写一次
        if (setting.getWxWriteOnce() && StrUtil.isNotEmpty(wxOpenId)) {
            LambdaQueryWrapper<UserFormDataEntity> wrapper = Wrappers.<UserFormDataEntity>lambdaQuery()
                    .eq(UserFormDataEntity::getFormKey, formKey)
                    .eq(UserFormDataEntity::getWxOpenId, wxOpenId);
            long writeCount = userFormDataService.count(wrapper);
            if (CommonConstants.ConstantNumber.ONE <= writeCount) {
                return Result.success(null, "已经填写过，无法再次填写");
            }
        }
        return Result.success(setting);
    }

    @Override
    @Transactional(rollbackFor = {Exception.class})
    public Boolean deleteAllSetting(String formKey) {
        userFormSubmitSettingMapper.delete(Wrappers.<UserFormSubmitSettingEntity>lambdaQuery().eq(UserFormSubmitSettingEntity::getFormKey, formKey));
        userFormWriteSettingMapper.delete(Wrappers.<UserFormWriteSettingEntity>lambdaQuery().eq(UserFormWriteSettingEntity::getFormKey, formKey));
        userFormNotifySettingMapper.delete(Wrappers.<UserFormNotifySettingEntity>lambdaQuery().eq(UserFormNotifySettingEntity::getFormKey, formKey));
        userFormShareSettingMapper.delete(Wrappers.<UserFormShareSettingEntity>lambdaQuery().eq(UserFormShareSettingEntity::getFormKey, formKey));
        return true;
    }

}