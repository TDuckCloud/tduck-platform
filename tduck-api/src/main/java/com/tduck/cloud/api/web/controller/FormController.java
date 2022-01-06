package com.tduck.cloud.api.web.controller;

import cn.hutool.core.lang.Validator;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.common.validator.ValidatorUtils;
import com.tduck.cloud.form.request.CheckPhoneCodeRequest;
import com.tduck.cloud.form.service.FormPhoneSmsService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * @author : smalljop
 * @description : 表单相关接口
 * @create : 2020-11-24 10:13
 **/

@RestController
@RequestMapping("/form/")
@RequiredArgsConstructor
public class FormController {

    private final FormPhoneSmsService formPhoneSmsService;


    /**
     * 获取发送手机号验证验证码
     */
    @GetMapping("/phone/code")
    public Result sendPhoneNumberCode(@RequestParam String phoneNumber) {
        Validator.validateMobile(phoneNumber, "手机号码不正确");
        formPhoneSmsService.sendPhoneCode(phoneNumber);
        return Result.success();
    }


    /**
     * 检查手机号验证码是否正确
     */
    @PostMapping("/phone/code/check")
    public Result checkPhoneNumberCode(@RequestBody CheckPhoneCodeRequest request) {
        Validator.validateMobile(request.getPhoneNumber(), "手机号码不正确");
        ValidatorUtils.validateEntity(request);
        if (!formPhoneSmsService.checkPhoneCode(request.getPhoneNumber(), request.getCode())) {
            return Result.failed("验证码错误");
        }
        return Result.success(request.getPhoneNumber());
    }

}
