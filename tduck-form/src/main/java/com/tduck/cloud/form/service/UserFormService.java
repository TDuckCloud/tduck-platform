package com.tduck.cloud.form.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tduck.cloud.form.entity.UserFormEntity;

/**
 * 表单表(Form)表服务接口
 *
 * @author smalljop
 * @since 2020-11-18 18:16:18
 */
public interface UserFormService extends IService<UserFormEntity> {


    /**
     * 根据key获取
     *
     * @param key key
     * @return UserFormEntity
     */
    UserFormEntity getByKey(final String key);


}