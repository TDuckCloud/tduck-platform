package com.tduck.cloud.form.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tduck.cloud.form.entity.FormTemplateEntity;

/**
 * 表单表(FormTemplate)表服务接口
 *
 * @author smalljop
 * @since 2021-01-06 10:43:01
 */
public interface FormTemplateService extends IService<FormTemplateEntity> {


    /**
     * 根據key獲取
     *
     * @param key
     * @return
     */
    FormTemplateEntity getByKey(String key);

}