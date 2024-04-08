package com.tduck.cloud.api.web.controller;


import cn.hutool.cache.CacheUtil;
import cn.hutool.cache.impl.TimedCache;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.common.util.SecurityUtils;
import com.tduck.cloud.form.entity.UserFormDataEntity;
import com.tduck.cloud.form.entity.UserFormEntity;
import com.tduck.cloud.form.service.UserFormDataService;
import com.tduck.cloud.form.service.UserFormItemService;
import com.tduck.cloud.form.service.UserFormService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.PostConstruct;
import javax.annotation.security.PermitAll;
import java.util.Map;

@RestController
@RequiredArgsConstructor
public class SyncDataController {
    private final UserFormService userFormService;
    private final UserFormItemService userFormItemService;
    private final UserFormDataService userFormDataService;

    private final TimedCache<String, String> apiKeyTimedCache = CacheUtil.newTimedCache(10);


    @PostConstruct
    public void initApiKeyTimedCache() {
        apiKeyTimedCache.schedulePrune(5);
    }


    /**
     * 获取表单全部字段
     */
    @PermitAll
    @GetMapping("/sync/form/fields")
    public Result getFormFields(@RequestParam(required = true) String apiKey) {
        String formKey = apiKeyTimedCache.get(apiKey, false);
        if (!apiKeyTimedCache.containsKey(apiKey)) {
            return Result.failed("错误请求");
        }
        Map<String, Object> result = MapUtil.newHashMap();
        result.put("formKey", formKey);
        result.put("fields", userFormItemService.listAllFormFields(formKey));
        return Result.success(result);
    }


    /**
     * 获取表单全局数据
     */
    @PermitAll
    @GetMapping("/sync/form/data")
    public Result getFormData(@RequestParam(required = true) String apiKey, Page page) {
        String formKey = apiKeyTimedCache.get(apiKey, false);
        if (!apiKeyTimedCache.containsKey(apiKey)) {
            return Result.failed("错误请求");
        }
        return Result.success(userFormDataService.page(page, Wrappers.<UserFormDataEntity>lambdaQuery().eq(UserFormDataEntity::getFormKey, formKey)));
    }


    /**
     * 获取apikey
     */
    @GetMapping("/sync/apikey")
    public Result getApiKey(@RequestParam String formKey) {
        UserFormEntity userForm = userFormService.getByKey(formKey);
        if (null == userForm || !userForm.getUserId().equals(SecurityUtils.getUserId())) {
            return Result.success();
        }
        String apiKey = apiKeyTimedCache.get(formKey, false);
        if (apiKey == null) {
            apiKey = IdUtil.simpleUUID();
            // 30分钟过期
            apiKeyTimedCache.put(apiKey, formKey, 30 * 60 * 1000);
        }
        return Result.success(apiKey);
    }

}
