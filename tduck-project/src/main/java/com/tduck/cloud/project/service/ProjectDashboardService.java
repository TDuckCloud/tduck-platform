package com.tduck.cloud.project.service;

import com.tduck.cloud.project.vo.ProjectReportVO;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * @author : smalljop
 * @description :
 * @create :  2020/12/31 14:48
 **/
public interface ProjectDashboardService {

    /**
     * 项目统计
     *
     * @param projectKey
     * @return
     */
    Collection<ProjectReportVO.Situation> projectReportSituation(String projectKey);


    /**
     * 项目位置报表
     *
     * @param projectKey
     * @return
     */
    Map<String, Integer> projectReportPosition(String projectKey);

    /**
     * 项目设备
     *
     * @param projectKey
     * @return
     */
    List<ProjectReportVO.Device> projectReportDevice(String projectKey);


    /**
     * 来源
     *
     * @param projectKey
     * @return
     */
    List<ProjectReportVO.Source> projectReportSource(String projectKey);


    /**
     * @param projectKey
     * @return
     */
    List<ProjectReportVO.Analysis> projectReportAnalysis(String projectKey);
}
