package com.tduck.cloud.api.web.controller;

import com.tduck.cloud.common.util.AsyncProcessUtils;
import com.tduck.cloud.common.util.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author : smalljop
 * @description : 通用
 * @create :  2021/06/08 15:32
 **/
@RestController
@RequestMapping("/common/")
public class CommonController {


    /**
     * 获取异步处理进度
     */
    @GetMapping("/process")
    public Result getProcess(@RequestParam String key) {
        return Result.success(AsyncProcessUtils.getProcess(key));
    }
}
