package com.tduck.cloud.form.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.CharUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.tduck.cloud.common.constant.CommonConstants;
import com.tduck.cloud.form.entity.UserFormDataEntity;
import com.tduck.cloud.form.entity.UserFormItemEntity;
import com.tduck.cloud.form.entity.enums.FormItemTypeEnum;
import com.tduck.cloud.form.mapper.FormDashboardMapper;
import com.tduck.cloud.form.service.FormDashboardService;
import com.tduck.cloud.form.service.UserFormDataService;
import com.tduck.cloud.form.service.UserFormItemService;
import com.tduck.cloud.form.vo.FormReportVO;
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
public class FormDashboardServiceImpl implements FormDashboardService {
    private final FormDashboardMapper FormDashboardMapper;

    private final UserFormDataService userFormDataService;

    private final UserFormItemService userFormItemService;


    @Override
    public Collection<FormReportVO.Situation> formReportSituation(String formKey) {
        Set<FormReportVO.Situation> reportSituations = FormDashboardMapper.selectFormReportSituation(formKey);
        Date now = new Date();
        List<DateTime> dateTimes = DateUtil.rangeToList(DateUtil.beginOfWeek(now), DateUtil.endOfWeek(now), DateField.DAY_OF_WEEK);
        dateTimes.forEach(time -> {
            reportSituations.add(new FormReportVO.Situation(time.toString(DatePattern.NORM_DATE_PATTERN), 0));
        });
        return CollectionUtil.sort(reportSituations, (o1, o2) -> DateUtil.parse(o1.getCreateTime(), DatePattern.NORM_DATE_PATTERN)
                .isAfter(DateUtil.parse(o2.getCreateTime(), DatePattern.NORM_DATE_PATTERN)) ? 1 : -1);
    }

    @Override
    public Map<String, Integer> formReportPosition(String formKey) {
        List<FormReportVO.Position> reportPositions = FormDashboardMapper.selectFormReportPosition(formKey);
        return reportPositions.stream()
                .filter(item -> ObjectUtil.isNotNull(CollectionUtil.get(StrUtil.split(item.getSubmitAddress(), CharUtil.DASHED), 0)))
                .map(item -> {
                    item.setSubmitProvince(CollectionUtil.get(StrUtil.split(item.getSubmitAddress(), CharUtil.DASHED), 0));
                    return item;
                }).collect(Collectors.groupingBy(FormReportVO.Position::getSubmitProvince,
                        Collectors.summingInt(FormReportVO.Position::getCount)));
    }

    @Override
    public List<FormReportVO.Device> formReportDevice(String formKey) {
        return FormDashboardMapper.selectFormReportDevice(formKey);
    }

    @Override
    public List<FormReportVO.Source> formReportSource(String formKey) {
        return FormDashboardMapper.selectFormReportSource(formKey);
    }

    @Override
    public List<FormReportVO.Analysis> formReportAnalysis(String formKey) {
        List<FormItemTypeEnum> typeEnumList = Lists.newArrayList(
                FormItemTypeEnum.RADIO,
                FormItemTypeEnum.CHECKBOX,
                FormItemTypeEnum.IMAGE_SELECT,
                FormItemTypeEnum.SELECT
        );
        // 题目
        List<UserFormItemEntity> formItemList = userFormItemService.list(new QueryWrapper<UserFormItemEntity>().lambda().eq(UserFormItemEntity::getFormKey, formKey));
        // 结果
        List<UserFormDataEntity> formResultList = userFormDataService.list(new QueryWrapper<UserFormDataEntity>().lambda().select(UserFormDataEntity::getOriginalData).eq(UserFormDataEntity::getFormKey, formKey));
        // 标题label与id的对应值
        Map<String, FormReportVO.Analysis> formMap = new LinkedHashMap<>();
        // 储存标题与可选项
        List<String> idList = new ArrayList<>();
        for (UserFormItemEntity userFormItemEntity : formItemList) {
            if (typeEnumList.contains(userFormItemEntity.getType())) {
                // id and label
                FormReportVO.Analysis analysis = new FormReportVO.Analysis();
                analysis.setLabel(userFormItemEntity.getLabel());
                analysis.setType(userFormItemEntity.getType().getDesc());
                formMap.put(userFormItemEntity.getFormItemId(), analysis);
                idList.add(userFormItemEntity.getFormItemId());
            }
        }
        for (UserFormDataEntity userFormResultEntity : formResultList) {
            Map<String, Object> originalData = userFormResultEntity.getOriginalData();
            for (String fieldId : idList) {
                Map<String, Integer> labelCountMap = formMap.get(fieldId).getMap();
                if (ObjectUtil.isNull(labelCountMap)) {
                    labelCountMap = Maps.newHashMap();
                }
                if (originalData.containsKey(fieldId)) {
                    // 结果中字段值  处理多选
                    if (originalData.get(fieldId) instanceof Collection) {
                        List<Object> fieldValues = MapUtil.get(originalData, fieldId, List.class);
                        List<String> fieldLabelValues = MapUtil.get(originalData, fieldId + "label", List.class);
                        for (int i = 0; i < fieldValues.size(); i++) {
                            // 是否是其他输入
                            Object value = fieldValues.get(i);
                            String label = value.equals(CommonConstants.ConstantNumber.ZERO) ? "其他" : fieldLabelValues.get(i);
                            Integer count = labelCountMap.get(label);
                            labelCountMap.put(label.trim(), ObjectUtil.isNotNull(count) ? count + 1 : 1);
                        }
                    } else {
                        String label = MapUtil.getStr(originalData, fieldId + "label");
                        Integer count = labelCountMap.get(label);
                        labelCountMap.put(label, ObjectUtil.isNotNull(count) ? count + 1 : 1);
                    }
                }
                formMap.get(fieldId).setFieldName(labelCountMap.keySet());
                formMap.get(fieldId).setData(labelCountMap.values());
                formMap.get(fieldId).setMap(labelCountMap);
            }
        }
        List<FormReportVO.Analysis> result = new ArrayList(formMap.values());
        return result;
    }
}
