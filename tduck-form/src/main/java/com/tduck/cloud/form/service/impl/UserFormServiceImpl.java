package com.tduck.cloud.form.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tduck.cloud.form.entity.UserFormEntity;
import com.tduck.cloud.form.mapper.UserFormMapper;
import com.tduck.cloud.form.service.UserFormService;
import org.springframework.stereotype.Service;

/**
 * 表单主表(Form)表服务实现类
 *
 * @author smalljop
 * @since 2020-11-18 18:16:18
 */
@Service
public class UserFormServiceImpl extends ServiceImpl<UserFormMapper, UserFormEntity> implements UserFormService {

    @Override
    public UserFormEntity getByKey(final String key) {
        if (StrUtil.isBlank(key)) {
            return null;
        }
        return this.getOne(Wrappers.<UserFormEntity>lambdaQuery().eq(UserFormEntity::getFormKey, key));
    }


}