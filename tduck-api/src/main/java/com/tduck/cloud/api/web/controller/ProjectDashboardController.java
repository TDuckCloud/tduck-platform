package com.tduck.cloud.api.web.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.tduck.cloud.api.annotation.Login;
import com.tduck.cloud.common.util.RedisUtils;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.project.entity.UserProjectResultEntity;
import com.tduck.cloud.project.service.ProjectDashboardService;
import com.tduck.cloud.project.service.UserProjectResultService;
import io.swagger.annotations.Api;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

import static com.tduck.cloud.project.constant.ProjectRedisKeyConstants.PROJECT_VIEW_IP_LIST;

/**
 * @author : smalljop
 * @description :
 * @create :  2020/12/30 16:47
 **/

@RestController
@RequiredArgsConstructor
@Api(tags = "Dashboard")
public class ProjectDashboardController {

    private final RedisUtils redisUtils;
    private final UserProjectResultService userProjectResultService;
    private final ProjectDashboardService projectDashboardService;

    /**
     * 项目收集信息
     */
    @Login
    @GetMapping("/user/project/report/stats")
    public Result projectReportStats(String projectKey) {
        //浏览量
        Long viewCount = redisUtils.hmSize(StrUtil.format(PROJECT_VIEW_IP_LIST, projectKey));
        //平均完成时间
        Map<String, Object> resultMap = userProjectResultService.getMap(Wrappers.<UserProjectResultEntity>query().select(" IFNULL(ROUND(AVG(complete_time),0),0) as avgCompleteTime, count(1) as completeCount").eq("project_key", projectKey));
        resultMap.put("viewCount", viewCount);
        return Result.success(resultMap);
    }


    /**
     * 项目收集情况 按周查看
     */
    @Login
    @GetMapping("/user/project/report/situation")
    public Result projectReportSituation(String projectKey) {
        return Result.success(projectDashboardService.projectReportSituation(projectKey));
    }


    /**
     * 项目收集位置情况
     */
    @Login
    @GetMapping("/user/project/report/position")
    public Result projectReportPosition(String projectKey) {
        return Result.success(projectDashboardService.projectReportPosition(projectKey));
    }


    /**
     * 项目收集设备
     */
    @Login
    @GetMapping("/user/project/report/device")
    public Result projectReportDevice(String projectKey) {
        return Result.success(projectDashboardService.projectReportDevice(projectKey));
    }


    /**
     * 项目收集来源
     */
    @Login
    @GetMapping("/user/project/report/source")
    public Result projectReportSource(String projectKey) {
        return Result.success(projectDashboardService.projectReportSource(projectKey));
    }

    /**
     * 数据分析
     */
    @Login
    @GetMapping("/user/project/report/analysis")
    public Result projectReportAnalysis(String projectKey) {
        return Result.success(projectDashboardService.projectReportAnalysis(projectKey));
    }
}
