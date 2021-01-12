package com.tduck.cloud.project.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.CharUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.tduck.cloud.project.mapper.ProjectDashboardMapper;
import com.tduck.cloud.project.service.ProjectDashboardService;
import com.tduck.cloud.project.vo.ProjectReportVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @author : smalljop
 * @description :
 * @create :  2020/12/31 14:50
 **/
@Service
@RequiredArgsConstructor
public class ProjectDashboardServiceImpl implements ProjectDashboardService {
    private final ProjectDashboardMapper projectDashboardMapper;


    @Override
    public Collection<ProjectReportVO.Situation> projectReportSituation(String projectKey) {
        Set<ProjectReportVO.Situation> reportSituations = projectDashboardMapper.selectProjectReportSituation(projectKey);
        Date now = new Date();
        List<DateTime> dateTimes = DateUtil.rangeToList(DateUtil.beginOfWeek(now), DateUtil.endOfWeek(now), DateField.DAY_OF_WEEK);
        dateTimes.forEach(time -> {
            reportSituations.add(new ProjectReportVO.Situation(time.toString(DatePattern.NORM_DATE_PATTERN), 0));
        });
        return CollectionUtil.sort(reportSituations, (o1, o2) -> DateUtil.parse(o1.getCreateTime(), DatePattern.NORM_DATE_PATTERN)
                .isAfter(DateUtil.parse(o2.getCreateTime(), DatePattern.NORM_DATE_PATTERN)) ? 1 : -1);
    }

    @Override
    public Map<String, Integer> projectReportPosition(String projectKey) {
        List<ProjectReportVO.Position> reportPositions = projectDashboardMapper.selectProjectReportPosition(projectKey);
        return reportPositions.stream()
                .filter(item -> ObjectUtil.isNotNull(CollectionUtil.get(StrUtil.split(item.getSubmitAddress(), CharUtil.DASHED), 0)))
                .map(item -> {
                    item.setSubmitProvince(CollectionUtil.get(StrUtil.split(item.getSubmitAddress(), CharUtil.DASHED), 0));
                    return item;
                }).collect(Collectors.groupingBy(ProjectReportVO.Position::getSubmitProvince,
                        Collectors.summingInt(ProjectReportVO.Position::getCount)));
    }

    @Override
    public List<ProjectReportVO.Device> projectReportDevice(String projectKey) {
        return projectDashboardMapper.selectProjectReportDevice(projectKey);
    }

    @Override
    public List<ProjectReportVO.Source> projectReportSource(String projectKey) {
        return projectDashboardMapper.selectProjectReportSource(projectKey);
    }
}
