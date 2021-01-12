package com.tduck.cloud.project.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tduck.cloud.project.entity.ProjectTemplateItemEntity;
import com.tduck.cloud.project.mapper.ProjectTemplateItemMapper;
import com.tduck.cloud.project.service.ProjectTemplateItemService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 项目表单项(ProjectTemplateItem)表服务实现类
 *
 * @author smalljop
 * @since 2021-01-06 11:14:47
 */
@Service("projectTemplateItemService")
public class ProjectTemplateItemServiceImpl extends ServiceImpl<ProjectTemplateItemMapper, ProjectTemplateItemEntity> implements ProjectTemplateItemService {

    @Override
    public List<ProjectTemplateItemEntity> listByTemplateKey(String templateKey) {
        return this.list(Wrappers.<ProjectTemplateItemEntity>lambdaQuery().eq(ProjectTemplateItemEntity::getProjectKey, templateKey));
    }
}