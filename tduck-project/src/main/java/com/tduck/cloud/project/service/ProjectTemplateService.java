package com.tduck.cloud.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tduck.cloud.project.entity.ProjectTemplateEntity;

/**
 * 项目表(ProjectTemplate)表服务接口
 *
 * @author smalljop
 * @since 2021-01-06 10:43:01
 */
public interface ProjectTemplateService extends IService<ProjectTemplateEntity> {


    /**
     * 根據key獲取
     *
     * @param key
     * @return
     */
    ProjectTemplateEntity getByKey(String key);

}