package com.tduck.cloud.form.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tduck.cloud.form.entity.UserFormThemeEntity;
import com.tduck.cloud.form.mapper.UserFormThemeMapper;
import com.tduck.cloud.form.service.UserFormThemeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 项目表单项(UserFormTheme)表服务实现类
 *
 * @author smalljop
 * @since 2020-11-25 13:36:32
 */
@Service
@RequiredArgsConstructor
public class UserFormThemeServiceImpl extends ServiceImpl<UserFormThemeMapper, UserFormThemeEntity> implements UserFormThemeService {


    @Override
    public UserFormThemeEntity getByKey(String key) {
        UserFormThemeEntity userFormThemeEntity = this.getOne(Wrappers.<UserFormThemeEntity>lambdaQuery().eq(UserFormThemeEntity::getFormKey, key));
        return userFormThemeEntity;
    }
}