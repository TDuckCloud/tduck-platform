package com.tduck.cloud.project.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tduck.cloud.project.entity.ProjectTemplateCategoryEntity;
import com.tduck.cloud.project.mapper.ProjectTemplateCategoryMapper;
import com.tduck.cloud.project.service.ProjectTemplateCategoryService;
import org.springframework.stereotype.Service;

/**
 * 项目模板分类(ProjectTemplateType)表服务实现类
 *
 * @author smalljop
 * @since 2021-01-06 10:51:06
 */
@Service("projectTemplateCategoryService")
public class ProjectTemplateCategoryServiceImpl extends ServiceImpl<ProjectTemplateCategoryMapper, ProjectTemplateCategoryEntity> implements ProjectTemplateCategoryService {

}