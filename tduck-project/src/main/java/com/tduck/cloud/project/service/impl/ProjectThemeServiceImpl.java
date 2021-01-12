package com.tduck.cloud.project.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tduck.cloud.project.entity.ProjectThemeEntity;
import com.tduck.cloud.project.mapper.ProjectThemeMapper;
import com.tduck.cloud.project.service.ProjectThemeService;
import org.springframework.stereotype.Service;

/**
 * 项目主题外观模板(ProjectTheme)表服务实现类
 *
 * @author smalljop
 * @since 2020-11-23 18:33:56
 */
@Service("projectThemeService")
public class ProjectThemeServiceImpl extends ServiceImpl<ProjectThemeMapper, ProjectThemeEntity> implements ProjectThemeService {

}