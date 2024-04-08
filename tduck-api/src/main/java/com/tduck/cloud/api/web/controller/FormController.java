package com.tduck.cloud.api.web.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.lang.Validator;
import cn.hutool.core.util.CharUtil;
import cn.hutool.core.util.IdUtil;
import com.google.common.collect.ImmutableMap;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.common.validator.ValidatorUtils;
import com.tduck.cloud.form.entity.struct.UploadResultStruct;
import com.tduck.cloud.form.request.CheckPhoneCodeRequest;
import com.tduck.cloud.form.service.other.FormPhoneSmsService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.security.PermitAll;
import java.io.IOException;

/**
 * 表单通用
 *
 * @author : smalljop
 * @description : 表单相关接口
 * @create : 2020-11-24 10:13
 **/

@RestController
@RequestMapping("/form/common/")
@RequiredArgsConstructor
public class FormController {

    private final FormPhoneSmsService formPhoneSmsService;


    /**
     * 获取发送手机号验证验证码
     */
    @GetMapping("/phone/code")
    @PermitAll
    public Result sendPhoneNumberCode(@RequestParam String phoneNumber) {
        Validator.validateMobile(phoneNumber, "手机号码不正确");
        formPhoneSmsService.sendPhoneCode(phoneNumber);
        return Result.success();
    }


    /**
     * 检查手机号验证码是否正确
     */
    @PostMapping("/phone/code/check")
    @PermitAll
    public Result checkPhoneNumberCode(@RequestBody CheckPhoneCodeRequest request) {
        Validator.validateMobile(request.getPhoneNumber(), "手机号码不正确");
        ValidatorUtils.validateEntity(request);
        if (!formPhoneSmsService.checkPhoneCode(request.getPhoneNumber(), request.getCode())) {
            return Result.failed("验证码错误");
        }
        return Result.success(request.getPhoneNumber());
    }







}
