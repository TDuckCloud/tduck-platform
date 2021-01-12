package com.tduck.cloud.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tduck.cloud.project.entity.UserProjectThemeEntity;
import com.tduck.cloud.project.vo.UserProjectThemeVo;

/**
 * 项目表单项(UserProjectTheme)表服务接口
 *
 * @author smalljop
 * @since 2020-11-25 13:36:31
 */
public interface UserProjectThemeService extends IService<UserProjectThemeEntity> {

    /**
     * 获取项目主题详情
     *
     * @param key
     * @return
     */
    UserProjectThemeVo getUserProjectDetails(String key);
}