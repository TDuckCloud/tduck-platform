package com.tduck.cloud.form.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tduck.cloud.form.entity.UserFormViewCountEntity;
import com.tduck.cloud.form.mapper.UserFormViewCountMapper;
import com.tduck.cloud.form.service.UserFormViewCountService;
import org.springframework.stereotype.Service;

/**
 * 用户表单查看次数Service业务层处理
 *
 * @author tduck
 * @date 2023-04-04 21:29:39
 */
@Service
public class UserFormViewCountServiceImpl extends ServiceImpl<UserFormViewCountMapper, UserFormViewCountEntity> implements UserFormViewCountService {

    @Override
    public void increment(String formKey) {
        baseMapper.incrementCount(formKey);
    }

    @Override
    public Long count(String formKey) {
        UserFormViewCountEntity viewCount = baseMapper.selectOne(Wrappers.<UserFormViewCountEntity>lambdaQuery().eq(UserFormViewCountEntity::getFormKey, formKey));
        return viewCount == null ? 0 : viewCount.getCount();
    }
}
