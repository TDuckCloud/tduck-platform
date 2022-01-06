package com.tduck.cloud.form.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tduck.cloud.form.entity.UserFormItemEntity;
import com.tduck.cloud.form.mapper.UserFormItemMapper;
import com.tduck.cloud.form.service.UserFormItemService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 表单表单项(FormItem)表服务实现类
 *
 * @author smalljop
 * @since 2020-11-19 10:49:18
 */
@Service
public class UserFormItemServiceImpl extends ServiceImpl<UserFormItemMapper, UserFormItemEntity> implements UserFormItemService {

    @Override
    public List<UserFormItemEntity> listByFormKey(String key) {
        return this.list(Wrappers.<UserFormItemEntity>lambdaQuery()
                .eq(UserFormItemEntity::getFormKey, key).orderByAsc(UserFormItemEntity::getSort));
    }

    @Override
    public Long lastFormItemSort(String formKey) {
        Long sort = baseMapper.selectLastFormItemSort(formKey);
        return ObjectUtil.isNotNull(sort) ? sort : 0;
    }
}