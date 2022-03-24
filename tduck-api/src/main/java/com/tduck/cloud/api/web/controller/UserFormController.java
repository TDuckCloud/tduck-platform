package com.tduck.cloud.api.web.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.tduck.cloud.api.annotation.Login;
import com.tduck.cloud.common.constant.CommonConstants;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.common.validator.ValidatorUtils;
import com.tduck.cloud.common.validator.group.AddGroup;
import com.tduck.cloud.common.validator.group.UpdateGroup;
import com.tduck.cloud.form.entity.*;
import com.tduck.cloud.form.entity.enums.FormSourceTypeEnum;
import com.tduck.cloud.form.entity.enums.FormStatusEnum;
import com.tduck.cloud.form.request.QueryFormItemRequest;
import com.tduck.cloud.form.request.QueryFormRequest;
import com.tduck.cloud.form.request.SortFormItemRequest;
import com.tduck.cloud.form.service.*;
import com.tduck.cloud.form.util.FormDataUtils;
import com.tduck.cloud.form.util.SortUtils;
import com.tduck.cloud.form.vo.FormFieldVO;
import com.tduck.cloud.form.vo.OperateFormItemVO;
import com.tduck.cloud.form.vo.RecycleFormVO;
import com.tduck.cloud.form.vo.UserFormDetailVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author : smalljop
 * @description : 用户表单
 * @create : 2020-11-18 18:17
 **/
@RequiredArgsConstructor
@RestController
@Slf4j
public class UserFormController {

    private final UserFormService formService;
    private final UserFormItemService formItemService;
    private final UserFormDataService userFormDataService;
    private final SortUtils sortUtils;
    private final UserFormThemeService userFormThemeService;
    private final UserFormSettingService userFormSettingService;
    private final FormTemplateService formTemplateService;
    private final UserFormLogicService userFormLogicService;


    /**
     * 创建表单
     */
    @Login
    @PostMapping("/user/form/create")
    public Result createForm(@RequestBody UserFormEntity form, @RequestAttribute Long userId) {
        ValidatorUtils.validateEntity(form, AddGroup.class);
        form.setKey(IdUtil.fastSimpleUUID());
        form.setUserId(userId);
        form.setStatus(FormStatusEnum.CREATE);
        form.setSourceType(FormSourceTypeEnum.BLANK);
        formService.save(form);
        return Result.success(form.getKey());
    }


    /**
     * 从模板创建表单
     */
    @Login
    @PostMapping("/user/form/use-template/create")
    public Result createFormByTemplate(@RequestBody FormTemplateEntity request, @RequestAttribute Long userId) {
        String templateKey = request.getKey();
        FormTemplateEntity formTemplateEntity = formTemplateService.getByKey(templateKey);
        String newFormKey = IdUtil.fastSimpleUUID();
        UserFormEntity userFormEntity = new UserFormEntity();
        BeanUtil.copyProperties(formTemplateEntity, userFormEntity, UserFormEntity.Fields.status);
        userFormEntity.setId(null);
        userFormEntity.setSourceType(FormSourceTypeEnum.TEMPLATE);
        userFormEntity.setSourceId(formTemplateEntity.getId().toString());
        userFormEntity.setKey(newFormKey);
        userFormEntity.setUserId(userId);
        userFormEntity.setStatus(FormStatusEnum.CREATE);
        formService.save(userFormEntity);
        List<UserFormItemEntity> formItems = formTemplateEntity.getScheme().getFormItems();
        formItems.forEach(item -> {
            item.setId(null);
            item.setFormKey(userFormEntity.getKey());
        });
        formItemService.saveBatch(formItems);
        // 主题
        if (ObjectUtil.isNotNull(formTemplateEntity.getScheme().getUserFormTheme())) {
            UserFormThemeEntity userFormTheme = formTemplateEntity.getScheme().getUserFormTheme();
            userFormTheme.setId(null);
            userFormTheme.setFormKey(newFormKey);
            userFormThemeService.save(userFormTheme);
        }
        return Result.success(userFormEntity.getKey());
    }


    /**
     * 根据条件查询所有表单
     */
    @Login
    @GetMapping("/user/form/list")
    public Result listForms(QueryFormRequest.List request, @RequestAttribute Long userId) {
        List<UserFormEntity> entityList = formService.list(Wrappers.<UserFormEntity>lambdaQuery().eq(UserFormEntity::getUserId, userId)
                .eq(ObjectUtil.isNotNull(request.getStatus()), UserFormEntity::getStatus, request.getStatus())
                .orderByDesc(BaseEntity::getUpdateTime));
        return Result.success(entityList);
    }

    /**
     * 查询我的表单分页
     */
    @Login
    @GetMapping("/user/form/page")
    public Result queryMyForms(@RequestAttribute Long userId, QueryFormRequest.Page request) {
        return Result.success(formService.page(request.toMybatisPage(),
                Wrappers.<UserFormEntity>lambdaQuery().eq(UserFormEntity::getUserId, userId)
                        .eq(UserFormEntity::getDeleted, false)
                        .eq(ObjectUtil.isNotNull(request.getStatus()), UserFormEntity::getStatus, request.getStatus())
                        .like(StrUtil.isNotBlank(request.getName()), UserFormEntity::getName, request.getName())
                        .le(ObjectUtil.isNotNull(request.getEndDateTime()), UserFormEntity::getUpdateTime, request.getEndDateTime())
                        .ge(ObjectUtil.isNotNull(request.getBeginDateTime()), UserFormEntity::getUpdateTime, request.getBeginDateTime())
                        .orderByDesc(BaseEntity::getCreateTime)));
    }


    /**
     * 查询表单
     */
    @GetMapping("/user/form/{key}")
    public Result queryFormByKey(@PathVariable @NotBlank String key) {
        return Result.success(formService.getByKey(key));
    }


    /**
     * 发布表单
     */
    @Login
    @PostMapping("/user/form/publish")
    public Result publishForm(@RequestBody UserFormEntity request) {
        long count = formItemService
                .count(Wrappers.<UserFormItemEntity>lambdaQuery().eq(UserFormItemEntity::getFormKey, request.getKey()));
        if (count == CommonConstants.ConstantNumber.ZERO) {
            return Result.failed("无有效表单项，无法发布");
        }
        UserFormEntity entity = formService.getByKey(request.getKey());
        entity.setStatus(FormStatusEnum.RELEASE);
        return Result.success(formService.updateById(entity));
    }

    /**
     * 停止收集
     *
     * @param request
     */
    @Login
    @PostMapping("/user/form/stop")
    public Result stopForm(@RequestBody UserFormEntity request) {
        UserFormEntity entity = formService.getByKey(request.getKey());
        entity.setStatus(FormStatusEnum.STOP);
        return Result.success(formService.updateById(entity));
    }

    /**
     * 删除表单
     *
     * @param request
     */
    @Login
    @PostMapping("/user/form/delete")
    public Result deleteForm(@RequestBody UserFormEntity request) {
        boolean del = formService.update(
                new UserFormEntity() {{
                    setDeleted(Boolean.TRUE);
                }},
                Wrappers.<UserFormEntity>lambdaQuery().eq(UserFormEntity::getKey, request.getKey()));
        return Result.success(del);
    }


    /**
     * 查询表单详情
     * 包含表单信息 表单保单项信息 表单主题
     *
     * @param key
     */
    @GetMapping("/user/form/details/{key}")
    public Result queryFormDetails(@PathVariable @NotBlank String key) {
        UserFormEntity form = formService.getByKey(key);
        List<UserFormItemEntity> formItemList = formItemService.listByFormKey(key);
        UserFormThemeEntity theme = userFormThemeService.getByKey(key);
        UserFormLogicEntity formLogic = userFormLogicService.getOne(Wrappers.<UserFormLogicEntity>lambdaQuery().eq(UserFormLogicEntity::getFormKey, key));
        return Result.success(new UserFormDetailVO(form, formItemList, theme, formLogic));
    }


    /**
     * 表单更新
     *
     * @param Form
     * @param userId
     */
    @Login
    @PostMapping("/user/form/update")
    public Result updateForm(@RequestBody UserFormEntity Form, @RequestAttribute Long userId) {
        ValidatorUtils.validateEntity(Form, AddGroup.class);
        UserFormEntity oldForm = formService.getByKey(Form.getKey());
        if (ObjectUtil.isNotNull(oldForm) && userId.equals(oldForm.getUserId())) {
            Form.setId(oldForm.getId());
            formService.updateById(Form);
        }
        return Result.success();
    }

    /**
     * 项目表单项查询
     */
    @GetMapping("/user/form/item/list")
    public Result queryFormItem(QueryFormItemRequest request) {
        ValidatorUtils.validateEntity(request);
        List<UserFormItemEntity> itemEntityList = formItemService.list(Wrappers.<UserFormItemEntity>lambdaQuery()
                .eq(UserFormItemEntity::getFormKey, request.getKey())
                .eq(ObjectUtil.isNotNull(request.getDisplayType()), UserFormItemEntity::getDisplayType, request.getDisplayType())
                .orderByAsc(UserFormItemEntity::getSort)
        );
        return Result.success(itemEntityList);
    }

    /**
     * 获取表单字段 包括系统默认字段
     */
    @GetMapping("/user/form/fields/{formKey}")
    public Result queryUserFormFields(@PathVariable String formKey) {
        List<UserFormItemEntity> itemEntityList = formItemService.list(Wrappers.<UserFormItemEntity>lambdaQuery()
                .eq(UserFormItemEntity::getFormKey, formKey)
                .eq(UserFormItemEntity::getDisplayType, false)
                .orderByAsc(UserFormItemEntity::getSort)
        );
        // FormFieldVO 处理了部份组价默认显示label字段
        List<FormFieldVO> fields = itemEntityList.stream().map(FormFieldVO::new).collect(Collectors.toList());
        FormDataUtils.addFormBaseDataField(fields);
        return Result.success(fields);
    }

    /**
     * 项目表单项创建
     *
     * @param request
     */
    @Login
    @PostMapping("/user/form/item/create")
    public Result createFormItem(@RequestBody UserFormItemEntity request) {
        ValidatorUtils.validateEntity(request, AddGroup.class);
        UserFormItemEntity entity = new UserFormItemEntity();
        BeanUtil.copyProperties(request, entity);
        //排序下标计算
        entity.setSort(formItemService.lastFormItemSort(request.getFormKey()) + 1);
        boolean save = formItemService.save(entity);
        return Result.success(new OperateFormItemVO(entity.getSort(), entity.getId(), save));
    }


    /**
     * 表单项更新
     *
     * @param request
     */
    @Login
    @PostMapping("/user/form/item/update")
    public Result updateFormItem(@RequestBody UserFormItemEntity request) {
        ValidatorUtils.validateEntity(request, UpdateGroup.class);
        boolean update = formItemService.update(request, Wrappers.<UserFormItemEntity>lambdaQuery()
                .eq(UserFormItemEntity::getFormKey, request.getFormKey())
                .eq(UserFormItemEntity::getFormItemId, request.getFormItemId()));
        return Result.success(update);
    }


    /**
     * 表单项删除
     */
    @Login
    @PostMapping("/user/form/item/delete")
    public Result deleteFormItem(@RequestBody UserFormItemEntity request) {
        boolean delete = formItemService.remove(Wrappers.<UserFormItemEntity>lambdaQuery()
                .eq(UserFormItemEntity::getFormKey, request.getFormKey())
                .eq(UserFormItemEntity::getFormItemId, request.getFormItemId()));
        return Result.success(delete);
    }

    /**
     * 表单项排序
     *
     * @param request
     */
    @Login
    @PostMapping("/user/form/item/sort")
    public Result sortFormItem(@RequestBody SortFormItemRequest request) {
        ValidatorUtils.validateEntity(request);
        if (ObjectUtil.isNull(request.getAfterPosition())
                && ObjectUtil.isNull(request.getBeforePosition())) {
            return Result.success();
        }
        UserFormItemEntity itemEntity = formItemService.getOne(Wrappers.<UserFormItemEntity>lambdaQuery()
                .eq(UserFormItemEntity::getFormKey, request.getFormKey())
                .eq(UserFormItemEntity::getFormItemId, request.getFormItemId()));
        Long sort = sortUtils.calcSortPosition(request.getBeforePosition(), request.getAfterPosition());
        itemEntity.setSort(sort);
        boolean b = formItemService.updateById(itemEntity);
        return Result.success(new OperateFormItemVO(itemEntity.getSort(), itemEntity.getId(), b));
    }


    /**
     * 项目主题保存
     *
     * @param themeEntity
     */
    @Login
    @PostMapping("/user/form/theme/save")
    public Result saveFormTheme(@RequestBody UserFormThemeEntity themeEntity) {
        ValidatorUtils.validateEntity(themeEntity);
        UserFormThemeEntity entity = userFormThemeService
                .getOne(Wrappers.<UserFormThemeEntity>lambdaQuery().eq(UserFormThemeEntity::getFormKey, themeEntity.getFormKey()));
        if (ObjectUtil.isNotNull(entity)) {
            themeEntity.setId(entity.getId());
        }
        return Result.success(userFormThemeService.saveOrUpdate(themeEntity));
    }


    /**
     * 项目主题查询
     *
     * @param formKey
     */
    @Login
    @GetMapping("/user/form/theme/{key}")
    public Result queryThemeByKey(@PathVariable("key") String formKey) {
        UserFormThemeEntity entity = userFormThemeService
                .getOne(Wrappers.<UserFormThemeEntity>lambdaQuery().eq(UserFormThemeEntity::getFormKey, formKey));
        return Result.success(entity);
    }


    /**
     * 回收站项目分页
     */
    @Login
    @GetMapping("/user/form/recycle/page")
    public Result queryRecycleForms(@RequestAttribute Long userId, QueryFormRequest.Page request) {
        Page page = formService.page(request.toMybatisPage(),
                Wrappers.<UserFormEntity>lambdaQuery().eq(UserFormEntity::getUserId, userId)
                        .eq(UserFormEntity::getDeleted, true)
                        .orderByDesc(BaseEntity::getUpdateTime));
        List<UserFormEntity> records = page.getRecords();
        List<RecycleFormVO> FormVOList = records.stream().map(item -> {
            long count = userFormDataService.count(Wrappers.<UserFormDataEntity>lambdaQuery().eq(UserFormDataEntity::getFormKey, item.getKey()));
            return new RecycleFormVO(item.getKey(), count, item.getName(), item.getCreateTime(), item.getUpdateTime());
        }).collect(Collectors.toList());
        page.setRecords(FormVOList);
        return Result.success(page);
    }

    /**
     * 从回收站中恢复项目
     */
    @Login
    @PostMapping("/user/form/recycle/restore")
    public Result restoreRecycleForm(@RequestBody UserFormEntity request) {
        boolean flag = formService.update(
                new UserFormEntity() {{
                    setDeleted(Boolean.FALSE);
                }},
                Wrappers.<UserFormEntity>lambdaQuery().eq(UserFormEntity::getKey, request.getKey()));
        return Result.success(flag);
    }

    /**
     * 从回收站中删除项目
     */
    @Login
    @PostMapping("/user/form/recycle/delete")
    public Result deleteRecycleForm(@RequestAttribute Long userId, @RequestBody UserFormEntity FormEntity) {
        boolean remove = formService.remove(Wrappers.<UserFormEntity>lambdaQuery().eq(UserFormEntity::getUserId, userId)
                .eq(UserFormEntity::getKey, FormEntity.getKey()));
        if (remove) {
            userFormThemeService.remove(Wrappers.<UserFormThemeEntity>lambdaQuery()
                    .eq(UserFormThemeEntity::getFormKey, FormEntity.getKey()));
            userFormSettingService.deleteAllSetting(FormEntity.getKey());
        }
        return Result.success(remove);
    }


}