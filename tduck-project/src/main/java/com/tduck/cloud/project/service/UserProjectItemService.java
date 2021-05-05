package com.tduck.cloud.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tduck.cloud.project.entity.UserProjectItemEntity;

import java.util.List;

/**
 * 项目表单项(ProjectItem)表服务接口
 *
 * @author smalljop
 * @since 2020-11-19 10:49:17
 */
public interface UserProjectItemService extends IService<UserProjectItemEntity> {


    /**
     * 根据key查询
     *
     * @param key
     * @return
     */
    List<UserProjectItemEntity> listByProjectKey(String key);

}