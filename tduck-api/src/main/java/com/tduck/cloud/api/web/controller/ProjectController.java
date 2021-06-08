package com.tduck.cloud.api.web.controller;

import cn.hutool.core.lang.Validator;
import cn.hutool.core.util.StrUtil;
import com.tduck.cloud.account.request.RegisterAccountRequest;
import com.tduck.cloud.account.request.RetrievePasswordRequest;
import com.tduck.cloud.account.service.UserValidateService;
import com.tduck.cloud.api.annotation.Login;
import com.tduck.cloud.common.mybatis.wrapper.JsonWrappers;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.common.validator.ValidatorUtils;
import com.tduck.cloud.project.entity.ProjectThemeEntity;
import com.tduck.cloud.project.request.QueryProThemeRequest;
import com.tduck.cloud.project.service.ProjectThemeService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author : smalljop
 * @description :
 * @create : 2020-11-24 10:13
 **/

@RestController
@RequestMapping("/project/")
@RequiredArgsConstructor
public class ProjectController {

    private final ProjectThemeService projectThemeService;
    private final UserValidateService userValidateService;

    @Login
    @GetMapping("theme/list")
    public Result queryThemes(QueryProThemeRequest request) {
        List<ProjectThemeEntity> list = projectThemeService.list(JsonWrappers.<ProjectThemeEntity>jsonLambdaQuery()
                .jsonConcat(StrUtil.isNotBlank(request.getColor()), ProjectThemeEntity.Fields.color, StrUtil.EMPTY, request.getColor())
                .jsonConcat(StrUtil.isNotBlank(request.getStyle()), ProjectThemeEntity.Fields.style, StrUtil.EMPTY, request.getStyle()));
        return Result.success(list);
    }

    /**
     * 获取发送手机号验证验证码
     */
    @GetMapping("/phone/code")
    public Result sendPhoneNumberCode(@RequestParam String phoneNumber) {
        Validator.validateMobile(phoneNumber, "手机号码不正确");
        userValidateService.sendPhoneCode(phoneNumber);
        return Result.success();
    }


    /**
     * 检查手机号验证码是否正确
     */
    @PostMapping("/phone/code/check")
    public Result checkPhoneNumberCode(@RequestBody RetrievePasswordRequest.CheckPhoneCode request) {
        Validator.validateMobile(request.getPhoneNumber(), "手机号码不正确");
        ValidatorUtils.validateEntity(request, RegisterAccountRequest.PhoneNumberGroup.class);
        if (!userValidateService.checkPhoneCode(request.getPhoneNumber(), request.getCode())) {
            return Result.failed("验证码错误");
        }
        return Result.success(request.getPhoneNumber());
    }

}
