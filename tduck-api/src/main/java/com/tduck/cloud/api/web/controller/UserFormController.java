package com.tduck.cloud.api.web.controller;

import cn.hutool.core.lang.tree.TreeNode;
import cn.hutool.core.lang.tree.TreeUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.tduck.cloud.common.constant.CommonConstants;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.common.validator.ValidatorUtils;
import com.tduck.cloud.common.validator.group.AddGroup;
import com.tduck.cloud.common.validator.group.UpdateGroup;
import com.tduck.cloud.form.entity.*;
import com.tduck.cloud.form.entity.enums.FormSourceTypeEnum;
import com.tduck.cloud.form.entity.enums.FormStatusEnum;
import com.tduck.cloud.form.entity.enums.FormTypeEnum;
import com.tduck.cloud.form.request.QueryFormItemRequest;
import com.tduck.cloud.form.request.QueryFormRequest;
import com.tduck.cloud.form.request.SortFormItemRequest;
import com.tduck.cloud.form.service.*;
import com.tduck.cloud.form.util.FormAuthUtils;
import com.tduck.cloud.form.util.FormDataUtils;
import com.tduck.cloud.form.util.ShortIdUtils;
import com.tduck.cloud.form.util.SortUtils;
import com.tduck.cloud.form.vo.FormFieldVO;
import com.tduck.cloud.form.vo.OperateFormItemVO;
import com.tduck.cloud.form.vo.RecycleFormVO;
import com.tduck.cloud.form.vo.UserFormDetailVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.security.PermitAll;
import javax.validation.constraints.NotBlank;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;


/**
 * 用户表单
 *
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
    @PostMapping("/user/form/create")
    public Result createForm(@RequestBody UserFormEntity form, @RequestAttribute Long userId) {
        if (ObjectUtil.isNotNull(form.getFolderId()) && 0 != form.getFolderId()) {
            // 检查文件夹是否存在
            long count = formService.count(Wrappers.<UserFormEntity>lambdaQuery().eq(BaseEntity::getId, form.getFolderId()).eq(UserFormEntity::getDeleted, 0));
            if (count == 0) {
                return Result.failed("文件夹不存在");
            }
        }
        ValidatorUtils.validateEntity(form, AddGroup.class);
        form.setFormKey(ShortIdUtils.genId());
        form.setUserId(userId);
        form.setStatus(FormStatusEnum.CREATE);
        form.setSourceType(FormSourceTypeEnum.BLANK);
        form.setDeleted(false);
        formService.save(form);
        return Result.success(form);
    }


    /**
     * 从模板创建表单
     */
    @PostMapping("/user/form/use-template/create")
    public Result createFormByTemplate(@RequestBody FormTemplateEntity request, @RequestAttribute Long userId) {
        UserFormEntity userForm = formTemplateService.createFormByTemplate(request, userId);
        return Result.success(userForm.getFormKey());
    }


    /**
     * 根据条件查询所有表单
     */
    @GetMapping("/user/form/list")
    public Result listForms(QueryFormRequest.List request, @RequestAttribute Long userId) {
        List<UserFormEntity> entityList = formService.list(Wrappers.<UserFormEntity>lambdaQuery().eq(UserFormEntity::getUserId, userId).eq(ObjectUtil.isNotNull(request.getStatus()), UserFormEntity::getStatus, request.getStatus()).orderByDesc(BaseEntity::getUpdateTime));
        return Result.success(entityList);
    }

    /**
     * 查询我的表单分页
     */
    @GetMapping("/user/form/page")
    public Result queryMyForms(@RequestAttribute Long userId, QueryFormRequest.Page request) {
        LambdaQueryWrapper<UserFormEntity> queryWrapper = Wrappers.<UserFormEntity>lambdaQuery().eq(UserFormEntity::getUserId, userId)
                .eq(ObjectUtil.isNotNull(request.getFolder()), UserFormEntity::getFolder, request.getFolder())
                .eq(ObjectUtil.isNotNull(request.getType()), UserFormEntity::getType, request.getType())
                .eq(UserFormEntity::getDeleted, 0).func(i -> {
                    // 通过文件名搜索时 可以搜索到子文件夹下的表单
                    if (StrUtil.isNotBlank(request.getName()) && request.getFolderId() == 0) {
                    } else {
                        i.eq(UserFormEntity::getFolderId, request.getFolderId());
                    }
                }).eq(ObjectUtil.isNotNull(request.getStatus()), UserFormEntity::getStatus, request.getStatus()).like(StrUtil.isNotBlank(request.getName()), UserFormEntity::getName, request.getName()).le(ObjectUtil.isNotNull(request.getEndDateTime()), UserFormEntity::getUpdateTime, request.getEndDateTime()).ge(ObjectUtil.isNotNull(request.getBeginDateTime()), UserFormEntity::getUpdateTime, request.getBeginDateTime()).orderByDesc(UserFormEntity::getFolder).orderByDesc(BaseEntity::getCreateTime);
        return Result.success(formService.page(request.toMybatisPage(), queryWrapper));
    }

    /**
     * 查询表单文件夹树
     */
    @GetMapping("/user/form/folderTree")
    public Result queryMyFormFolderTree(@RequestAttribute Long userId) {
        List<UserFormEntity> list = formService.list(Wrappers.<UserFormEntity>lambdaQuery().eq(UserFormEntity::getUserId, userId).eq(UserFormEntity::getFolder, 1));
        List<TreeNode<Long>> nodeList = list.stream().map(item -> new TreeNode<>(item.getId(), item.getFolderId(), item.getName(), 5)).collect(Collectors.toList());
        return Result.success(TreeUtil.build(nodeList, 0L));
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
    @PostMapping("/user/form/publish")
    public Result publishForm(@RequestBody UserFormEntity request) {
        FormAuthUtils.hasPermission(request.getFormKey());
        long count = formItemService.count(Wrappers.<UserFormItemEntity>lambdaQuery().eq(UserFormItemEntity::getFormKey, request.getFormKey()));
        if (count == CommonConstants.ConstantNumber.ZERO) {
            return Result.failed("无有效表单项，无法发布");
        }
        UserFormEntity entity = formService.getByKey(request.getFormKey());
        entity.setStatus(FormStatusEnum.RELEASE);
        return Result.success(formService.updateById(entity));
    }

    /**
     * 停止收集
     *
     * @param request
     */
    @PostMapping("/user/form/stop")
    public Result stopForm(@RequestBody UserFormEntity request) {
        FormAuthUtils.hasPermission(request.getFormKey());
        UserFormEntity entity = formService.getByKey(request.getFormKey());
        entity.setStatus(FormStatusEnum.STOP);
        return Result.success(formService.updateById(entity));
    }

    /**
     * 删除表单到回收站
     *
     * @param request
     */
    @PostMapping("/user/form/logic/delete")
    public Result logicDeleteForm(@RequestBody UserFormEntity request) {
        FormAuthUtils.hasPermission(request.getFormKey());
        boolean del = formService.update(new UserFormEntity() {{
            setDeleted(Boolean.TRUE);
        }}, Wrappers.<UserFormEntity>lambdaQuery().eq(UserFormEntity::getFormKey, request.getFormKey()));
        return Result.success(del);
    }

    /**
     * 删除
     *
     * @param request
     */
    @PostMapping("/user/form/delete")
    public Result deleteForm(@RequestBody UserFormEntity request) {
        // 如果文件夹下面存在表单 不允许删除
        FormAuthUtils.hasPermission(request.getFormKey());
        UserFormEntity formEntity = formService.getOne(Wrappers.<UserFormEntity>lambdaQuery().eq(UserFormEntity::getFormKey, request.getFormKey()));
        if (formEntity.getFolder()) {
            long count = formService.count(Wrappers.<UserFormEntity>lambdaQuery().eq(UserFormEntity::getDeleted, 0).eq(UserFormEntity::getFolderId, formEntity.getId()));
            if (count > 0) {
                return Result.failed("当前文件夹下存在表单，不允许删除");
            }
        }
        boolean del = formService.remove(Wrappers.<UserFormEntity>lambdaQuery().eq(UserFormEntity::getFormKey, request.getFormKey()));
        return Result.success(del);
    }


    /**
     * 查询表单详情
     * 包含表单信息 表单字段信息 表单主题
     *
     * @param key
     */
    @GetMapping("/user/form/details/{key}")
    @PermitAll
    public Result queryFormDetails(@PathVariable @NotBlank String key) {
        UserFormEntity form = formService.getByKey(key);
        if (ObjectUtil.isNull(form)) {
            return Result.success();
        }
        List<UserFormItemEntity> formItemList = formItemService.list(Wrappers.<UserFormItemEntity>lambdaQuery().ne(UserFormItemEntity::getHideType, 1).eq(UserFormItemEntity::getFormKey, key));
        formItemList.sort(Comparator.comparing(UserFormItemEntity::getSort));
        UserFormThemeEntity theme = userFormThemeService.getByKey(key);
        UserFormLogicEntity formLogic = userFormLogicService.getOne(Wrappers.<UserFormLogicEntity>lambdaQuery().eq(UserFormLogicEntity::getFormKey, key));
        // 如果是考试 移除正确答案 避免把正确答案返回到前端
        if (form.getType() == FormTypeEnum.EXAM) {
            formItemList.forEach(item -> {
                JSONObject schemeJson = JSONUtil.parseObj(item.getScheme());
                if (schemeJson.containsKey("examConfig")) {
                    schemeJson.getJSONObject("examConfig").remove("answer");
                }
                item.setScheme(schemeJson);
            });
        }
        return Result.success(new UserFormDetailVO(new UserFormDetailVO.UserForm(form), formItemList, theme, formLogic));
    }


    /**
     * 表单更新
     *
     * @param form
     * @param userId
     */
    @PostMapping("/user/form/update")
    public Result updateForm(@RequestBody UserFormEntity form, @RequestAttribute Long userId) {
        ValidatorUtils.validateEntity(form, AddGroup.class);
        UserFormEntity oldForm = formService.getByKey(form.getFormKey());
        if (ObjectUtil.isNotNull(oldForm) && userId.equals(oldForm.getUserId())) {
            form.setId(oldForm.getId());
            formService.updateById(form);
        }
        return Result.success();
    }

    /**
     * 项目表单项查询
     */
    @GetMapping("/user/form/item/list")
    public Result queryFormItems(QueryFormItemRequest request) {
        ValidatorUtils.validateEntity(request);
        FormAuthUtils.hasPermission(request.getKey());
        List<UserFormItemEntity> itemEntityList = formItemService.list(Wrappers.<UserFormItemEntity>lambdaQuery().eq(UserFormItemEntity::getFormKey, request.getKey()).eq(ObjectUtil.isNotNull(request.getDisplayType()), UserFormItemEntity::getDisplayType, request.getDisplayType()));
        itemEntityList.sort(Comparator.comparing(UserFormItemEntity::getSort));
        return Result.success(itemEntityList);
    }

    /**
     * 获取表单字段 包括系统默认字段
     */
    @GetMapping("/user/form/fields/{formKey}")
    public Result queryUserFormFields(@PathVariable String formKey) {
        return Result.success(formItemService.listAllFormFields(formKey));
    }

    /**
     * 获取表单固定字段
     * 所有表单都包含 用于查看详情右侧显示
     */
    @GetMapping("/user/form/fixed/fields/{formKey}")
    public Result queryUserFormFixedFields(@PathVariable String formKey) {
        // 查询表单类型
        UserFormEntity userFormEntity = formService.getByKey(formKey);
        List<FormFieldVO> fields = new ArrayList<>();
        FormDataUtils.addFormBaseDataField(fields);
        fields.add(new FormFieldVO("submitUaOs", "操作系统"));
        fields.add(new FormFieldVO("submitUaDevice", "设备"));
        fields.add(new FormFieldVO(UserFormDataEntity.Fields.submitBrowser, "浏览器"));
        fields.add(new FormFieldVO(UserFormDataEntity.Fields.submitAddress, "地址"));
        fields.add(new FormFieldVO(UserFormDataEntity.Fields.submitRequestIp, "IP"));
        fields.add(new FormFieldVO(UserFormDataEntity.Fields.wxUserInfo, "微信用户"));
        return Result.success(fields);
    }


    /**
     * 项目表单项创建
     *
     * @param entity
     */
    @PostMapping("/user/form/item/create")
    public Result createFormItem(@RequestBody UserFormItemEntity entity) {
        ValidatorUtils.validateEntity(entity, AddGroup.class);
        if (ObjectUtil.isNull(entity.getDisplayType())) {
            entity.setDisplayType(false);
        }
        if (ObjectUtil.isNull(entity.getHideType())) {
            entity.setHideType(false);
        }
        //排序下标计算
        entity.setSort(sortUtils.getInitialSortPosition(entity.getFormKey()));
        entity.setSpecialType(formItemService.isSpecialTypeItem(entity));
        boolean save = formItemService.save(entity);
        return Result.success(new OperateFormItemVO(entity.getSort(), entity.getId(), save, false));
    }

    /**
     * 批量项目表单项创建
     */
    @PostMapping("/user/form/item/batch/create")
    public Result batchCreateFormItem(@RequestBody List<UserFormItemEntity> itemEntityList) {
        //排序下标计算
        itemEntityList.forEach(item -> item.setSort(sortUtils.getInitialSortPosition(item.getFormKey())));
        boolean save = formItemService.saveBatch(itemEntityList);
        return Result.success();
    }


    /**
     * 表单项更新
     *
     * @param request
     */
    @PostMapping("/user/form/item/update")
    public Result updateFormItem(@RequestBody UserFormItemEntity request) {
        FormAuthUtils.hasPermission(request.getFormKey());
        ValidatorUtils.validateEntity(request, UpdateGroup.class);
        request.setSpecialType(formItemService.isSpecialTypeItem(request));
        boolean update = formItemService.update(request, Wrappers.<UserFormItemEntity>lambdaQuery()
                .eq(UserFormItemEntity::getFormKey, request.getFormKey()).eq(UserFormItemEntity::getFormItemId, request.getFormItemId()));
        return Result.success(update);
    }


    /**
     * 表单项删除
     */
    @PostMapping("/user/form/item/delete")
    public Result deleteFormItem(@RequestBody UserFormItemEntity request) {
        FormAuthUtils.hasPermission(request.getFormKey());
        boolean delete = formItemService.remove(Wrappers.<UserFormItemEntity>lambdaQuery().eq(UserFormItemEntity::getFormKey, request.getFormKey()).eq(UserFormItemEntity::getFormItemId, request.getFormItemId()));
        return Result.success(delete);
    }

    /**
     * 表单项排序
     *
     * @param request
     */
    @PostMapping("/user/form/item/sort")
    public Result sortFormItem(@RequestBody SortFormItemRequest request) {
        ValidatorUtils.validateEntity(request);
        if (ObjectUtil.isNull(request.getAfterPosition()) && ObjectUtil.isNull(request.getBeforePosition())) {
            return Result.success();
        }
        UserFormItemEntity itemEntity = formItemService.getOne(Wrappers.<UserFormItemEntity>lambdaQuery().eq(UserFormItemEntity::getFormKey, request.getFormKey()).eq(UserFormItemEntity::getFormItemId, request.getFormItemId()));
        Long sort = sortUtils.calcSortPosition(request.getBeforePosition(), request.getAfterPosition(), request.getFormKey());
        if (sortUtils.sortAllList(request.getBeforePosition(), request.getAfterPosition(), request.getFormKey(), sort)) {
            return Result.success(new OperateFormItemVO(itemEntity.getSort(), itemEntity.getId(), true, true));
        }
        itemEntity.setSort(sort);
        boolean b = formItemService.updateById(itemEntity);
        return Result.success(new OperateFormItemVO(itemEntity.getSort(), itemEntity.getId(), b, false));
    }


    /**
     * 项目主题保存
     *
     * @param themeEntity
     */
    @PostMapping("/user/form/theme/save")
    public Result saveFormTheme(@RequestBody UserFormThemeEntity themeEntity) {
        ValidatorUtils.validateEntity(themeEntity);
        FormAuthUtils.hasPermission(themeEntity.getFormKey());
        if (ObjectUtil.isNull(themeEntity.getShowSubmitBtn())) {
            themeEntity.setShowSubmitBtn(true);
        }
        UserFormThemeEntity entity = userFormThemeService.getOne(Wrappers.<UserFormThemeEntity>lambdaQuery().eq(UserFormThemeEntity::getFormKey, themeEntity.getFormKey()));
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
    @GetMapping("/user/form/theme/{key}")
    public Result queryThemeByKey(@PathVariable("key") String formKey) {
        FormAuthUtils.hasPermission(formKey);
        UserFormThemeEntity entity = userFormThemeService.getOne(Wrappers.<UserFormThemeEntity>lambdaQuery().eq(UserFormThemeEntity::getFormKey, formKey));
        return Result.success(entity);
    }


    /**
     * 回收站项目分页
     */
    @GetMapping("/user/form/recycle/page")
    public Result queryRecycleForms(@RequestAttribute Long userId, QueryFormRequest.Page request) {
        Page page = formService.page(request.toMybatisPage(), Wrappers.<UserFormEntity>lambdaQuery().eq(UserFormEntity::getUserId, userId).eq(UserFormEntity::getDeleted, 1).orderByDesc(BaseEntity::getUpdateTime));
        List<UserFormEntity> records = page.getRecords();
        List<RecycleFormVO> FormVOList = records.stream().map(item -> {
            long count = userFormDataService.count(Wrappers.<UserFormDataEntity>lambdaQuery().eq(UserFormDataEntity::getFormKey, item.getFormKey()));
            return new RecycleFormVO(item.getFormKey(), count, item.getTextName(), item.getCreateTime(), item.getUpdateTime());
        }).collect(Collectors.toList());
        page.setRecords(FormVOList);
        return Result.success(page);
    }

    /**
     * 从回收站中恢复项目
     */
    @PostMapping("/user/form/recycle/restore")
    public Result restoreRecycleForm(@RequestBody UserFormEntity request) {
        boolean flag = formService.update(new UserFormEntity() {{
            setDeleted(Boolean.FALSE);
        }}, Wrappers.<UserFormEntity>lambdaQuery().eq(UserFormEntity::getFormKey, request.getFormKey()));
        return Result.success(flag);
    }

    /**
     * 从回收站中删除项目
     */
    @PostMapping("/user/form/recycle/delete")
    public Result deleteRecycleForm(@RequestAttribute Long userId, @RequestBody UserFormEntity FormEntity) {
        boolean remove = formService.remove(Wrappers.<UserFormEntity>lambdaQuery().eq(UserFormEntity::getUserId, userId).eq(UserFormEntity::getFormKey, FormEntity.getFormKey()));
        if (remove) {
            userFormThemeService.remove(Wrappers.<UserFormThemeEntity>lambdaQuery().eq(UserFormThemeEntity::getFormKey, FormEntity.getFormKey()));
            userFormSettingService.deleteAllSetting(FormEntity.getFormKey());
        }
        return Result.success(remove);
    }


}
