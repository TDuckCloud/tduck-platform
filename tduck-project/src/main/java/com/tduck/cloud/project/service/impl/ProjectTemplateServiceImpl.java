package com.tduck.cloud.project.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tduck.cloud.project.entity.ProjectTemplateEntity;
import com.tduck.cloud.project.mapper.ProjectTemplateMapper;
import com.tduck.cloud.project.service.ProjectTemplateService;
import org.springframework.stereotype.Service;

/**
 * 项目表(ProjectTemplate)表服务实现类
 *
 * @author smalljop
 * @since 2021-01-06 10:43:02
 */
@Service("projectTemplateService")
public class ProjectTemplateServiceImpl extends ServiceImpl<ProjectTemplateMapper, ProjectTemplateEntity> implements ProjectTemplateService {

    @Override
    public ProjectTemplateEntity getByKey(String key) {
        return this.getOne(Wrappers.<ProjectTemplateEntity>lambdaQuery().eq(ProjectTemplateEntity::getKey, key));
    }
}