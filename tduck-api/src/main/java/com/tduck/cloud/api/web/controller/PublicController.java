package com.tduck.cloud.api.web.controller;

import com.tduck.cloud.api.annotation.NotLogin;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.envconfig.service.SysEnvConfigService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import static com.tduck.cloud.envconfig.constant.ConfigConstants.SYSTEM_INFO_CONFIG;


/**
 * 公开接口
 *
 * @author tduck
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/public/")
public class PublicController {
    private final SysEnvConfigService configService;


    /***
     * 获取系统信息配置
     * @return 系统信息配置
     */
    @GetMapping("systemInfoConfig")
    @NotLogin
    public Result<String> getSystemInfoConfig() {
        return Result.success(configService.getValueByKey(SYSTEM_INFO_CONFIG));
    }


}
