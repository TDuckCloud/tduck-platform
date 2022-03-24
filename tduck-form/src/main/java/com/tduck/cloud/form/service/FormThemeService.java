package com.tduck.cloud.form.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tduck.cloud.form.entity.FormThemeCategoryEntity;
import com.tduck.cloud.form.entity.FormThemeEntity;

import java.util.List;

/**
 * 表单主题外观模板(FormTheme)表服务接口
 *
 * @author smalljop
 * @since 2020-11-23 18:33:55
 */
public interface FormThemeService extends IService<FormThemeEntity> {

    /**
     * 获取主题分类
     *
     * @return
     */
    List<FormThemeCategoryEntity> listThemeCategories();

    /**
     * 获取表单分类
     *
     * @param categoryId
     * @return
     */
    FormThemeCategoryEntity getThemeCategory(Long categoryId);

    /**
     * 保存主题分类
     *
     * @param entity
     * @return
     */
    Boolean saveThemeCategory(FormThemeCategoryEntity entity);

    /**
     * 修改主题分类
     *
     * @param entity
     * @return
     */
    Boolean updateThemeCategory(FormThemeCategoryEntity entity);

    /**
     * 删除主题分类
     *
     * @param categoryId
     * @return
     */
    Boolean deleteThemeCategory(List<Long> categoryIds);


}