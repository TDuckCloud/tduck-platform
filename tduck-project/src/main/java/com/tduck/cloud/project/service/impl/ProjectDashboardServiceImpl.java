package com.tduck.cloud.project.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.CharUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.google.common.collect.Lists;
import com.tduck.cloud.project.entity.UserProjectItemEntity;
import com.tduck.cloud.project.entity.UserProjectResultEntity;
import com.tduck.cloud.project.entity.enums.ProjectItemTypeEnum;
import com.tduck.cloud.project.mapper.ProjectDashboardMapper;
import com.tduck.cloud.project.service.ProjectDashboardService;
import com.tduck.cloud.project.service.UserProjectItemService;
import com.tduck.cloud.project.service.UserProjectResultService;
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

    private final UserProjectResultService userProjectResultService;

    private final UserProjectItemService userProjectItemService;


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

    @Override
    public List<ProjectReportVO.Analysis> projectReportAnalysis(String projectKey) {

        List<ProjectItemTypeEnum> typeEnumList = Lists.newArrayList(
                ProjectItemTypeEnum.RADIO,
                ProjectItemTypeEnum.CHECKBOX,
                ProjectItemTypeEnum.SELECT
        );

        // 题目
        List<UserProjectItemEntity> projectItemList = userProjectItemService.list(new QueryWrapper<UserProjectItemEntity>().lambda().eq(UserProjectItemEntity::getProjectKey, projectKey));
        // 结果
        List<UserProjectResultEntity> projectResultList = userProjectResultService.list(new QueryWrapper<UserProjectResultEntity>().lambda().select(UserProjectResultEntity::getProcessData).eq(UserProjectResultEntity::getProjectKey, projectKey));
        // 标题label与id的对应值
        Map<String, ProjectReportVO.Analysis> formMap = new LinkedHashMap<>();
        // 储存标题与可选项
        Map<String, Map<String, Integer>> map = new HashMap<>();
        for (UserProjectItemEntity userProjectItemEntity : projectItemList) {
            if (typeEnumList.contains(userProjectItemEntity.getType())) {
                Map<String, Integer> optionMap = new LinkedHashMap<>();
                List<Map<String, Object>> options = (List<Map<String, Object>>) userProjectItemEntity.getExpand().get("options");
                for (Map<String, Object> option : options) {
                    optionMap.put(option.get("label").toString(), 0);
                }
                // 单选框类型
                map.put("field" + userProjectItemEntity.getFormItemId(), optionMap);
                // id and label
                ProjectReportVO.Analysis analysis = new ProjectReportVO.Analysis();
                analysis.setLabel(userProjectItemEntity.getLabel());
                analysis.setType(userProjectItemEntity.getType().getDesc());
                formMap.put("field" + userProjectItemEntity.getFormItemId(), analysis);
            }
        }

        for (UserProjectResultEntity userProjectResultEntity : projectResultList) {
            Map<String, Object> processData = userProjectResultEntity.getProcessData();

            for (Map.Entry<String, Map<String, Integer>> entry : map.entrySet()) {
                if (processData.containsKey(entry.getKey())) {
                    // 结果中字段值  处理多选
                    String[] fieldValues = processData.get(entry.getKey()).toString().split(",");
                    for (int i = 0; i < fieldValues.length; i++) {
                        // 获取问题集合中对应的选项的count
                        Integer count = entry.getValue().get(fieldValues[i]);
                        if (ObjectUtil.isNotNull(count)) {
                            entry.getValue().put(fieldValues[i], count + 1);
                        }
                    }
                }
                formMap.get(entry.getKey()).setFieldName(new ArrayList(entry.getValue().keySet()));
                formMap.get(entry.getKey()).setData(new ArrayList(entry.getValue().values()));
                formMap.get(entry.getKey()).setMap(entry.getValue());
            }
        }
        List<ProjectReportVO.Analysis> result = new ArrayList(formMap.values());
        return result;
    }
}
