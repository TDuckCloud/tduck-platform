package com.tduck.cloud.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.project.entity.UserProjectSettingEntity;

/**
 * 项目表单项(UserProjectSetting)表服务接口
 *
 * @author smalljop
 * @since 2020-11-30 14:00:52
 */
public interface UserProjectSettingService extends IService<UserProjectSettingEntity> {


    /**
     * 获取当前项目设置的状态
     * 是否可以填写等
     *
     * @param projectKey
     * @param requestIp
     * @param wxOpenId
     * @return
     */
    Result getUserProjectSettingStatus(String projectKey, String requestIp, String wxOpenId);


    /**
     * 查询
     *
     * @param projectKey
     * @return
     */
    UserProjectSettingEntity getByProjectKey(String projectKey);
}