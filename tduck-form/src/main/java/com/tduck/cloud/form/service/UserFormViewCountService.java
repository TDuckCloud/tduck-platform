package com.tduck.cloud.form.service;

import java.util.List;

import com.tduck.cloud.form.entity.UserFormViewCountEntity;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 用户表单查看次数Service接口
 *
 * @author tduck
 * @date 2023-04-04 21:29:39
 */
public interface UserFormViewCountService extends IService<UserFormViewCountEntity> {

    /**
     * 查看次数自增
     *
     * @param formKey 表单key
     */
    void increment(String formKey);

    /**
     * 查看次数
     *
     * @param formKey 表单key
     */
    Long count(String formKey);
}
