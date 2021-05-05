package com.tduck.cloud.project.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tduck.cloud.project.entity.UserProjectEntity;
import com.tduck.cloud.project.mapper.UserProjectMapper;
import com.tduck.cloud.project.service.UserProjectService;
import org.springframework.stereotype.Service;

/**
 * 项目表(Project)表服务实现类
 *
 * @author smalljop
 * @since 2020-11-18 18:16:18
 */
@Service("userProjectService")
public class UserProjectServiceImpl extends ServiceImpl<UserProjectMapper, UserProjectEntity> implements UserProjectService {

    @Override
    public UserProjectEntity getByKey(final String key) {
        if (StrUtil.isBlank(key)) {
            return null;
        }
        UserProjectEntity entity = this.getOne(Wrappers.<UserProjectEntity>lambdaQuery().eq(UserProjectEntity::getKey, key));
        return entity;
    }

}