package com.tduck.cloud.form.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tduck.cloud.form.entity.UserFormThemeEntity;

/**
 * 表单表单项(UserFormTheme)表服务接口
 *
 * @author smalljop
 * @since 2020-11-25 13:36:31
 */
public interface UserFormThemeService extends IService<UserFormThemeEntity> {

    /**
     * 获取表单主题详情
     *
     * @param key
     * @return
     */
    UserFormThemeEntity getByKey(String key);
}