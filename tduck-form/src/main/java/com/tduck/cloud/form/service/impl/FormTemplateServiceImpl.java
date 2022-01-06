package com.tduck.cloud.form.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tduck.cloud.form.entity.FormTemplateEntity;
import com.tduck.cloud.form.mapper.FormTemplateMapper;
import com.tduck.cloud.form.service.FormTemplateService;
import org.springframework.stereotype.Service;

/**
 * 表单表(FormTemplate)表服务实现类
 *
 * @author smalljop
 * @since 2021-01-06 10:43:02
 */
@Service
public class FormTemplateServiceImpl extends ServiceImpl<FormTemplateMapper, FormTemplateEntity> implements FormTemplateService {

    @Override
    public FormTemplateEntity getByKey(String key) {
        return this.getOne(Wrappers.<FormTemplateEntity>lambdaQuery().eq(FormTemplateEntity::getKey, key));
    }
}