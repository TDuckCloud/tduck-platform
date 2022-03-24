package com.tduck.cloud.api.web.controller;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.tduck.cloud.api.annotation.Login;
import com.tduck.cloud.common.util.CacheUtils;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.form.entity.UserFormDataEntity;
import com.tduck.cloud.form.service.FormDashboardService;
import com.tduck.cloud.form.service.UserFormDataService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

import static com.tduck.cloud.form.constant.FormConstants.FORM_VIEW_COUNT;

/**
 * @author : smalljop
 * @description : 报表相关接口
 * @create :  2020/12/30 16:47
 **/

@RestController
@RequiredArgsConstructor
public class FormDashboardController {

    private final UserFormDataService userFormDataService;
    private final FormDashboardService formDashboardService;
    private final CacheUtils cacheUtils;


    /**
     * 表单收集信息
     */
    @Login
    @GetMapping("/user/form/report/stats")
    public Result formReportStats(String formKey) {
        //浏览量
        String viewCount = cacheUtils.get(StrUtil.format(FORM_VIEW_COUNT, formKey));
        //平均完成时间
        Map<String, Object> resultMap = userFormDataService.getMap(Wrappers.<UserFormDataEntity>query().select(" IFNULL(ROUND(AVG(complete_time),0),0) as avgCompleteTime, count(1) as completeCount").eq("form_key", formKey));
        resultMap.put("viewCount", viewCount);
        return Result.success(resultMap);
    }


    /**
     * 表单收集情况 按周查看
     */
    @Login
    @GetMapping("/user/form/report/situation")
    public Result formReportSituation(String formKey) {
        return Result.success(formDashboardService.formReportSituation(formKey));
    }


    /**
     * 项目收集位置情况
     */
    @Login
    @GetMapping("/user/form/report/position")
    public Result formReportPosition(String formKey) {
        return Result.success(formDashboardService.formReportPosition(formKey));
    }


    /**
     * 项目收集设备
     */
    @Login
    @GetMapping("/user/form/report/device")
    public Result formReportDevice(String formKey) {
        return Result.success(formDashboardService.formReportDevice(formKey));
    }


    /**
     * 项目收集来源
     */
    @Login
    @GetMapping("/user/form/report/source")
    public Result formReportSource(String formKey) {
        return Result.success(formDashboardService.formReportSource(formKey));
    }

    /**
     * 数据分析
     */
    @Login
    @GetMapping("/user/form/report/analysis")
    public Result formReportAnalysis(String formKey) {
        return Result.success(formDashboardService.formReportAnalysis(formKey));
    }
}
