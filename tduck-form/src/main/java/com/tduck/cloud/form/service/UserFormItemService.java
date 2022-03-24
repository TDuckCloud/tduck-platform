package com.tduck.cloud.form.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tduck.cloud.form.entity.UserFormItemEntity;

import java.util.List;

/**
 * 表单表单项(FormItem)表服务接口
 *
 * @author smalljop
 * @since 2020-11-19 10:49:17
 */
public interface UserFormItemService extends IService<UserFormItemEntity> {


    /**
     * 根据key查询
     *
     * @param key
     * @return
     */
    List<UserFormItemEntity> listByFormKey(String key);

    /**
     * 最后一个表单项序号
     *
     * @param formKey
     * @return
     */
    Long lastFormItemSort(String formKey);
}