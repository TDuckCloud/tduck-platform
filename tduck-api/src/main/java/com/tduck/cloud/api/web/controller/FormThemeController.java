package com.tduck.cloud.api.web.controller;

import cn.hutool.core.util.StrUtil;
import com.tduck.cloud.api.annotation.Login;
import com.tduck.cloud.common.mybatis.wrapper.JsonWrappers;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.form.entity.FormThemeEntity;
import com.tduck.cloud.form.request.QueryProThemeRequest;
import com.tduck.cloud.form.service.FormThemeService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author : wangqing
 * @description :
 * @create :  2021/10/19 14:41
 **/
@RestController
@RequestMapping("/form/")
@RequiredArgsConstructor
public class FormThemeController {
    private final FormThemeService formThemeService;

    @Login
    @GetMapping("theme/list")
    public Result queryThemes(QueryProThemeRequest request) {
        List<FormThemeEntity> list = formThemeService.list(JsonWrappers.<FormThemeEntity>jsonLambdaQuery()
                .jsonConcat(StrUtil.isNotBlank(request.getColor()), FormThemeEntity.Fields.color, StrUtil.EMPTY, request.getColor())
                .jsonConcat(StrUtil.isNotBlank(request.getStyle()), FormThemeEntity.Fields.style, StrUtil.EMPTY, request.getStyle()));
        return Result.success(list);
    }

    /**
     * 查询项目主题外观模板列表
     */
    @GetMapping("/theme/category/list")
    public Result queryCategoryList() {
        return Result.success(formThemeService.listThemeCategories());
    }

}
