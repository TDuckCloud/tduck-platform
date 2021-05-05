package com.tduck.cloud.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tduck.cloud.project.entity.UserProjectEntity;

/**
 * 项目表(Project)表服务接口
 *
 * @author smalljop
 * @since 2020-11-18 18:16:18
 */
public interface UserProjectService extends IService<UserProjectEntity> {


    /**
     * 根据key获取
     *
     * @param key
     * @return
     */
    UserProjectEntity getByKey(final String key);


}