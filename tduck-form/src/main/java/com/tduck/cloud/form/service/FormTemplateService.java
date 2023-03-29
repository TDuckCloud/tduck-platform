package com.tduck.cloud.form.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tduck.cloud.form.entity.FormTemplateEntity;
import com.tduck.cloud.form.entity.UserFormEntity;

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
     * @param key 唯一标识
     * @return 模板
     */
    FormTemplateEntity getByKey(String key);


    /**
     * 创建模板
     *
     * @param formTemplate 模板
     * @return 模板
     */
    FormTemplateEntity createFormTemplate(FormTemplateEntity formTemplate);

    /**
     * 根据模板创建表单
     *
     * @param formTemplate 模板
     * @return 表单
     */
    UserFormEntity createFormByTemplate(FormTemplateEntity formTemplate,Long userId);

}