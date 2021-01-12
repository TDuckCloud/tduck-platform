package com.tduck.cloud.api.web.controller;

import cn.hutool.core.util.StrUtil;
import com.tduck.cloud.api.annotation.Login;
import com.tduck.cloud.common.mybatis.wrapper.JsonWrappers;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.project.entity.ProjectThemeEntity;
import com.tduck.cloud.project.request.QueryProThemeRequest;
import com.tduck.cloud.project.service.ProjectThemeService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author : smalljop
 * @description :
 * @create : 2020-11-24 10:13
 **/
@RequiredArgsConstructor
@RestController
@RequestMapping("/project/")
public class ProjectController {

    private final ProjectThemeService projectThemeService;


    @Login
    @GetMapping("theme/list")
    public Result queryThemes(QueryProThemeRequest request) {
        List<ProjectThemeEntity> list = projectThemeService.list(JsonWrappers.<ProjectThemeEntity>jsonLambdaQuery()
                .jsonConcat(StrUtil.isNotBlank(request.getColor()), ProjectThemeEntity.Fields.color, StrUtil.EMPTY, request.getColor())
                .jsonConcat(StrUtil.isNotBlank(request.getStyle()), ProjectThemeEntity.Fields.style, StrUtil.EMPTY, request.getStyle()));
        return Result.success(list);
    }


}
