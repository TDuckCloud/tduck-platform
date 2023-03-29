package com.tduck.cloud.api.web.controller;

import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.envconfig.entity.SysEnvConfigEntity;
import com.tduck.cloud.envconfig.service.SysEnvConfigService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


/**
 * 参数配置 信息操作处理
 *
 * @author smalljop
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/system/env/config")
public class SysEnvConfigController {
    private final SysEnvConfigService configService;


    /**
     * 保存系统环境配置
     */
    @PostMapping("/save")
    public Result save(@RequestBody @Validated SysEnvConfigEntity config) {
        configService.saveConfig(config);
        return Result.success();
    }

    /**
     * 根据参数编号获取详细信息
     */
    @GetMapping(value = "/{configKey}")
    public Result getInfo(@PathVariable String configKey) {
        return Result.success(configService.getByKey(configKey));
    }

    /**
     * 根据参数编号获取详细信息
     */
    @GetMapping(value = "/value/{configKey}")
    public Result getConfigValue(@PathVariable String configKey) {
        return Result.success(configService.getValueByKey(configKey));
    }

}
