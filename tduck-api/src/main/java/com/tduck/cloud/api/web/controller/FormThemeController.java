package com.tduck.cloud.api.web.controller;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.tduck.cloud.common.util.QueryWrapperUtils;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.form.entity.FormThemeCategoryEntity;
import com.tduck.cloud.form.entity.FormThemeEntity;
import com.tduck.cloud.form.request.QueryProThemeRequest;
import com.tduck.cloud.form.service.FormThemeService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 表单主题
 *
 * @author : wangqing
 * @description :
 * @create :  2021/10/19 14:41
 **/
@RestController
@RequestMapping("/form/")
@RequiredArgsConstructor
public class FormThemeController {
    private final FormThemeService formThemeService;

    /**
     * 查询项目主题外观模板列表
     * @param request 查询参数
     * @return Result
     */
    @GetMapping("theme/list")
    public Result queryThemes(QueryProThemeRequest request) {
        List<FormThemeEntity> list = formThemeService.list(Wrappers.<FormThemeEntity>lambdaQuery()
                .eq(ObjectUtil.isNotNull(request.getStyle()), FormThemeEntity::getStyle, request.getStyle()));
        return Result.success(list);
    }

    /**
     * 查询项目主题外观模板列表
     */
    @GetMapping("/theme/page")
    public Result queryPage(Page page, FormThemeEntity themeEntity) {
        return Result.success(formThemeService.page(page, QueryWrapperUtils.toSimpleQuery(themeEntity)));
    }

    /**
     * 获取项目主题外观模板详细信息
     */
    @GetMapping(value = "/theme/{id}")
    public Result getInfo(@PathVariable("id") Long id) {
        return Result.success(formThemeService.getById(id));
    }

    /**
     * 新增项目主题外观模板
     */
    @PostMapping("/theme")
    public Result save(@RequestBody FormThemeEntity formTheme) {
        return Result.success(formThemeService.save(formTheme));
    }

    /**
     * 修改项目主题外观模板
     */
    @PutMapping("/theme")
    public Result update(@RequestBody FormThemeEntity fmFormTheme) {
        return Result.success(formThemeService.updateById(fmFormTheme));
    }

    /**
     * 删除项目主题外观模板
     */
    @DeleteMapping("/theme/{ids}")
    public Result delete(@PathVariable List<Long> ids) {
        return Result.success(formThemeService.removeByIds(ids));
    }

    /**
     * 查询项目主题外观模板列表
     */
    @GetMapping("/theme/category/list")
    public Result queryCategoryList() {
        return Result.success(formThemeService.listThemeCategories());
    }

    /**
     * 获取表单主题分类详细信息
     */
    @GetMapping(value = "/theme/category/{id}")
    public Result getCategoryInfo(@PathVariable("id") Long id) {
        return Result.success(formThemeService.getThemeCategory(id));
    }

    /**
     * 新增单主题分类
     */
    @PostMapping("/theme/category")
    public Result saveCategory(@RequestBody FormThemeCategoryEntity formThemeCategory) {
        return Result.success(formThemeService.saveThemeCategory(formThemeCategory));
    }

    /**
     * 修改单主题分类
     */
    @PutMapping("/theme/category")
    public Result updateCategory(@RequestBody FormThemeCategoryEntity fmFormThemeCategory) {
        return Result.success(formThemeService.updateThemeCategory(fmFormThemeCategory));
    }

    /**
     * 删除单主题分类
     */
    @DeleteMapping("/theme/category/{ids}")
    public Result deleteCategory(@PathVariable List<Long> ids) {
        return Result.success(formThemeService.deleteThemeCategory(ids));
    }


}
