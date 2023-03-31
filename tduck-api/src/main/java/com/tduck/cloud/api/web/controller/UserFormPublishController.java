package com.tduck.cloud.api.web.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.form.entity.UserFormLinkExtEntity;
import com.tduck.cloud.form.service.UserFormLinkExtService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 表单发布
 *
 * @author : smalljop
 * @description : 用户表单发布
 * @create : 2020-11-18 18:17
 **/
@Slf4j
@RestController
@RequiredArgsConstructor
public class UserFormPublishController {

    private final UserFormLinkExtService formLinkExtService;

    /**
     * 获取表单扩展字段列表
     *
     * @param formKey
     * @return
     */
    @GetMapping("/user/form/link/extList/{formKey}")
    public Result listUserFormLinkExt(@PathVariable String formKey) {
        List<UserFormLinkExtEntity> list = formLinkExtService.list(Wrappers.<UserFormLinkExtEntity>lambdaQuery()
                .eq(UserFormLinkExtEntity::getFormKey, formKey));
        return Result.success(list);
    }

    /**
     * 获取表单扩展字段列表
     *
     * @param entity
     * @return
     */
    @PostMapping("/user/form/link/ext")
    public Result saveUserFormLinkExt(@RequestBody UserFormLinkExtEntity entity) {
        long count = formLinkExtService.count(Wrappers.<UserFormLinkExtEntity>lambdaQuery()
                .eq(UserFormLinkExtEntity::getFormKey, entity.getFormKey()).eq(UserFormLinkExtEntity::getExtValue, entity.getExtValue()));
        if (count > 0) {
            return Result.failed("已存在该扩展名称");
        }
        formLinkExtService.save(entity);
        return Result.success();
    }


    /**
     * 获取表单扩展字段列表
     *
     * @param entity
     * @return
     */
    @PostMapping("/user/form/link/ext/delete")
    public Result deleteUserFormLinkExt(@RequestBody UserFormLinkExtEntity entity) {
        formLinkExtService.remove(Wrappers.<UserFormLinkExtEntity>lambdaQuery()
                .eq(UserFormLinkExtEntity::getFormKey, entity.getFormKey()).eq(UserFormLinkExtEntity::getExtValue, entity.getExtValue()));
        return Result.success();
    }

}
