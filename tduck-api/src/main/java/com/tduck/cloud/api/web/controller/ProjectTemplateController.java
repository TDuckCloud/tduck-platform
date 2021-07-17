package com.tduck.cloud.api.web.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.common.validator.ValidatorUtils;
import com.tduck.cloud.common.validator.group.AddGroup;
import com.tduck.cloud.project.constant.ProjectRedisKeyConstants;
import com.tduck.cloud.project.entity.ProjectTemplateCategoryEntity;
import com.tduck.cloud.project.entity.ProjectTemplateEntity;
import com.tduck.cloud.project.entity.ProjectTemplateItemEntity;
import com.tduck.cloud.project.entity.UserProjectItemEntity;
import com.tduck.cloud.project.request.OperateProjectItemRequest;
import com.tduck.cloud.project.request.QueryProjectTemplateRequest;
import com.tduck.cloud.project.request.QueryProjectTemplateTypeRequest;
import com.tduck.cloud.project.service.ProjectTemplateCategoryService;
import com.tduck.cloud.project.service.ProjectTemplateItemService;
import com.tduck.cloud.project.service.ProjectTemplateService;
import com.tduck.cloud.project.util.SortUtils;
import com.tduck.cloud.project.vo.OperateProjectItemVO;
import com.tduck.cloud.project.vo.ProjectTemplateDetailVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;
import java.util.List;

/**
 * @author : smalljop
 * @description :
 * @create :  2021/01/06 10:54
 **/
@RequiredArgsConstructor
@RestController
@Slf4j
public class ProjectTemplateController {

    private final ProjectTemplateService projectTemplateService;
    private final ProjectTemplateCategoryService projectTemplateCategoryService;
    private final ProjectTemplateItemService projectTemplateItemService;
    private final SortUtils sortUtils;

    /**
     * 创建项目模板
     *
     * @return
     */
    @PostMapping("/project/template/create")
    public Result createProjectTemplate(@RequestBody ProjectTemplateEntity templateEntity) {
        ValidatorUtils.validateEntity(templateEntity, AddGroup.class);
        templateEntity.setKey(IdUtil.simpleUUID());
        projectTemplateService.save(templateEntity);
        return Result.success(templateEntity.getKey());
    }


    /**
     * 分页查询项目分类
     *
     * @return
     */
    @GetMapping("/project/template/type/list")
    public Result queryProjectTemplateTypes(QueryProjectTemplateTypeRequest.List request) {
        return Result.success(projectTemplateCategoryService.list(Wrappers.<ProjectTemplateCategoryEntity>lambdaQuery()
                .orderByDesc(ProjectTemplateCategoryEntity::getSort)));
    }

    /**
     * 分页查询项目模板
     *
     * @return
     */
    @GetMapping("/project/template/page")
    public Result queryProjectTemplates(QueryProjectTemplateRequest.Page request) {
        return Result.success(projectTemplateService.page(request.toMybatisPage(),
                Wrappers.<ProjectTemplateEntity>lambdaQuery()
                        .eq(ObjectUtil.isNotNull(request.getType()), ProjectTemplateEntity::getCategoryId, request.getType())
                        .like(StrUtil.isNotBlank(request.getName()), ProjectTemplateEntity::getName, request.getName())
                        .orderByDesc(ProjectTemplateEntity::getUpdateTime)));
    }


    /**
     * 查询项目模板详情
     * 包含项目信息 项目保单项信息
     *
     * @param key
     * @return
     */
    @GetMapping("/project/template/details/{key}")
    public Result queryProjectTemplateDetails(@PathVariable @NotBlank String key) {
        ProjectTemplateEntity templateEntity = projectTemplateService.getByKey(key);
        List<ProjectTemplateItemEntity> projectItemList = projectTemplateItemService.listByTemplateKey(key);
        return Result.success(new ProjectTemplateDetailVO(templateEntity, projectItemList));
    }

    /**
     * 项目模板表单项创建
     *
     * @param request
     * @return
     */
    @PostMapping("/project/template/item/create")
    public Result createProjectTemplateItem(@RequestBody OperateProjectItemRequest request) {
        ValidatorUtils.validateEntity(request, AddGroup.class);
        //把Map转换成Bean 在转换成Map 去除不在bean字段列表的多字段
        Object bean = BeanUtil.toBeanIgnoreCase(request.getExpand(), request.getType().getExpandClass(), true);
        ProjectTemplateItemEntity entity = new ProjectTemplateItemEntity();
        BeanUtil.copyProperties(request, entity, UserProjectItemEntity.Fields.defaultValue);
        entity.setExpand(BeanUtil.beanToMap(bean));
        //排序下标计算
        entity.setSort(sortUtils.getInitialSortPosition(
                StrUtil.format(ProjectRedisKeyConstants.PROJECT_ITEM_POS_DELTA, request.getProjectKey())));
        boolean save = projectTemplateItemService.save(entity);
        return Result.success(new OperateProjectItemVO(entity.getSort(), entity.getId(), save));
    }
}
