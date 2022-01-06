package com.tduck.cloud.api.web.controller;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.tduck.cloud.api.annotation.Login;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.form.entity.FormTemplateCategoryEntity;
import com.tduck.cloud.form.entity.FormTemplateEntity;
import com.tduck.cloud.form.entity.UserFormItemEntity;
import com.tduck.cloud.form.entity.UserFormThemeEntity;
import com.tduck.cloud.form.request.QueryFormTemplateRequest;
import com.tduck.cloud.form.request.QueryFormTemplateTypeRequest;
import com.tduck.cloud.form.service.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;
import java.util.List;


/**
 * @author : smalljop
 * @description : 表单模板接口
 * @create :  2021/01/06 10:54
 **/
@Slf4j
@RestController
@RequiredArgsConstructor
public class FormTemplateController {

    private final FormTemplateService formTemplateService;
    private final FormTemplateCategoryService formTemplateCategoryService;
    private final UserFormItemService userFormItemService;
    private final UserFormService userFormService;
    private final UserFormThemeService userFormThemeService;

    /**
     * 删除模板
     *
     * @param templateEntity
     * @return
     */
    @PostMapping("/form/template/delete")
    public Result deleteFormTemplate(@RequestBody FormTemplateEntity templateEntity) {
        formTemplateService.remove(Wrappers.<FormTemplateEntity>lambdaQuery().eq(FormTemplateEntity::getKey, templateEntity.getKey()));
        return Result.success(templateEntity.getKey());
    }

    /**
     * 分页查询项目分类
     *
     * @return
     */
    @GetMapping("/form/template/type/list")
    public Result queryFormTemplateTypes(QueryFormTemplateTypeRequest.List request) {
        return Result.success(formTemplateCategoryService.list(Wrappers.<FormTemplateCategoryEntity>lambdaQuery()
                .orderByDesc(FormTemplateCategoryEntity::getSort)));
    }

    /**
     * 分页查询项目模板
     *
     * @return
     */
    @GetMapping("/form/template/page")
    public Result queryFormTemplates(QueryFormTemplateRequest.Page request) {
        return Result.success(formTemplateService.page(request.toMybatisPage(),
                Wrappers.<FormTemplateEntity>lambdaQuery()
                        .eq(ObjectUtil.isNotNull(request.getType()), FormTemplateEntity::getCategoryId, request.getType())
                        .like(StrUtil.isNotBlank(request.getName()), FormTemplateEntity::getName, request.getName())
                        .orderByDesc(FormTemplateEntity::getUpdateTime)));
    }


    /**
     * 表单另存为为模板
     *
     * @param userId
     * @return
     */
    @Login
    @PostMapping("/form/template/create")
    public Result createFormTemplate(@RequestBody FormTemplateEntity formTemplateEntity, @RequestAttribute Long userId) {
        //保存基础信息和问题
        String formKey = formTemplateEntity.getKey();
        List<UserFormItemEntity> itemEntityList = userFormItemService.listByFormKey(formKey);
        // 主题
        UserFormThemeEntity themeEntity = userFormThemeService.getByKey(formKey);
        FormTemplateEntity template = new FormTemplateEntity();
        FormTemplateEntity.Definition definition = new FormTemplateEntity.Definition();
        definition.setFormItems(itemEntityList);
        definition.setUserFormTheme(themeEntity);
        formTemplateEntity.setScheme(definition);
        formTemplateService.save(formTemplateEntity);
        return Result.success(formTemplateEntity.getKey());
    }

    /**
     * 查询项目模板详情
     * 包含项目信息 项目保单项信息
     *
     * @param key
     * @return
     */
    @GetMapping("/form/template/details/{key}")
    public Result queryFormTemplateDetails(@PathVariable @NotBlank String key) {
        FormTemplateEntity templateEntity = formTemplateService.getByKey(key);
        return Result.success(templateEntity.getScheme());
    }


    /**
     * 获取项目模板分类详细信息
     */
    @GetMapping(value = "/form/template/category/{id}")
    public Result getCategoryInfo(@PathVariable("id") Long id) {
        return Result.success(formTemplateCategoryService.getById(id));
    }

    /**
     * 新增项目模板分类
     */
    @PostMapping("/form/template/category")
    public Result saveCategory(@RequestBody FormTemplateCategoryEntity fmFormTemplateCategory) {
        return Result.success(formTemplateCategoryService.save(fmFormTemplateCategory));
    }

    /**
     * 修改项目模板分类
     */
    @PutMapping("/form/template/category")
    public Result updateCategory(@RequestBody FormTemplateCategoryEntity fmFormTemplateCategory) {
        return Result.success(formTemplateCategoryService.updateById(fmFormTemplateCategory));
    }

    /**
     * 删除项目模板分类
     */
    @DeleteMapping("/form/template/category/{ids}")
    public Result deleteCategory(@PathVariable List<Long> ids) {
        return Result.success(formTemplateCategoryService.removeByIds(ids));
    }

}
