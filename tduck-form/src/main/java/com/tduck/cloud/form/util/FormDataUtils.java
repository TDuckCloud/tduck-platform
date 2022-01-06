package com.tduck.cloud.form.util;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.google.common.collect.Lists;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.form.entity.UserFormDataEntity;
import com.tduck.cloud.form.entity.enums.FormItemTypeEnum;
import com.tduck.cloud.form.vo.FormFieldVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author : wangqing
 * @description : 表单收集结果工具类
 * @create :  2021/08/18 18:17
 **/
@Slf4j
@Component
@RequiredArgsConstructor
public class FormDataUtils {


    /**
     * 特殊字段 会多出一个xxx label字段存放显示值 默认字段存放原始值
     */
    public static final List<FormItemTypeEnum> specialFields =
            Lists.newArrayList(FormItemTypeEnum.SELECT, FormItemTypeEnum.IMAGE_SELECT, FormItemTypeEnum.CHECKBOX, FormItemTypeEnum.RADIO, FormItemTypeEnum.CASCADER);

    /**
     * 添加表单基础数据字段
     * 所有表单都包含的字段
     */
    public static void addFormBaseDataField(List<FormFieldVO> fields) {
        fields.add(new FormFieldVO(UserFormDataEntity.Fields.serialNumber, "提交序号", UserFormDataEntity.Fields.serialNumber));
        fields.add(new FormFieldVO(BaseEntity.Fields.createTime, "提交时间", FormItemTypeEnum.DATE.toString()));
        fields.add(new FormFieldVO(BaseEntity.Fields.updateTime, "修改时间", FormItemTypeEnum.DATE.toString()));
    }


    /**
     * 特殊字段添加复合字段
     */
    public List<String> concatSpecialField(List<String> fields) {
        List<String> newFields = Lists.newArrayList("id");
        if (CollUtil.isEmpty(fields)) {
            return newFields;
        }
        fields.forEach(field -> {
            newFields.add(field);
            Boolean isSpecialField = StrUtil.startWithAny(field, specialFields.stream().map(item -> item.toString().toLowerCase())
                    .collect(Collectors.joining(",")));
            if (isSpecialField) {
                newFields.add(field + "label");
            }
        });
        return newFields;
    }


}
