package com.tduck.cloud.api.web.controller;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.tduck.cloud.api.annotation.Login;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.form.entity.UserFormLogicEntity;
import com.tduck.cloud.form.service.UserFormLogicService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;

/**
 * @author : smalljop
 * @description : 表单逻辑
 * @create : 2020-11-18 18:17
 **/
@Slf4j
@RestController
@RequiredArgsConstructor
public class UserFormLogicController {

    private final UserFormLogicService formLogicService;

    @Login
    @PostMapping("/user/form/logic/save")
    public Result saveUserFormLogic(@RequestBody UserFormLogicEntity userFormLogicEntity) {
        UserFormLogicEntity formLogic = formLogicService.getOne(Wrappers.<UserFormLogicEntity>lambdaQuery().eq(UserFormLogicEntity::getFormKey, userFormLogicEntity.getFormKey()));
        if (ObjectUtil.isNotNull(formLogic)) {
            userFormLogicEntity.setId(formLogic.getId());
            formLogicService.updateById(userFormLogicEntity);
        } else {
            formLogicService.save(userFormLogicEntity);
        }
        return Result.success(userFormLogicEntity);
    }


    @GetMapping("/user/form/logic")
    public Result queryFormLogic(@RequestParam @NotBlank String formKey) {
        return Result.success(formLogicService.getOne(Wrappers.<UserFormLogicEntity>lambdaQuery().eq(UserFormLogicEntity::getFormKey, formKey)));
    }
}