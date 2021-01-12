package com.tduck.cloud.project.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tduck.cloud.project.entity.ProjectThemeEntity;
import com.tduck.cloud.project.entity.UserProjectThemeEntity;
import com.tduck.cloud.project.mapper.UserProjectThemeMapper;
import com.tduck.cloud.project.service.ProjectThemeService;
import com.tduck.cloud.project.service.UserProjectThemeService;
import com.tduck.cloud.project.vo.UserProjectThemeVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 项目表单项(UserProjectTheme)表服务实现类
 *
 * @author smalljop
 * @since 2020-11-25 13:36:32
 */
@Service("userProjectThemeService")
@RequiredArgsConstructor
public class UserProjectThemeServiceImpl extends ServiceImpl<UserProjectThemeMapper, UserProjectThemeEntity> implements UserProjectThemeService {

    private final ProjectThemeService projectThemeService;

    @Override
    public UserProjectThemeVo getUserProjectDetails(String key) {
        UserProjectThemeEntity userProjectThemeEntity = this.getOne(Wrappers.<UserProjectThemeEntity>lambdaQuery().eq(UserProjectThemeEntity::getProjectKey, key));
        if (ObjectUtil.isNotNull(userProjectThemeEntity)) {
            UserProjectThemeVo vo = new UserProjectThemeVo();
            BeanUtil.copyProperties(userProjectThemeEntity, vo);
            ProjectThemeEntity themeEntity = projectThemeService.getById(userProjectThemeEntity.getThemeId());
            BeanUtil.copyProperties(themeEntity, vo);
            return vo;
        }
        return null;
    }
}