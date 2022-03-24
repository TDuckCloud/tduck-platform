package com.tduck.cloud.form.vo;


import cn.hutool.core.collection.CollUtil;
import com.tduck.cloud.form.entity.UserFormItemEntity;
import com.tduck.cloud.form.util.FormDataUtils;
import lombok.AllArgsConstructor;
import lombok.Data;

import static com.tduck.cloud.form.constant.FormConstants.FIELD_SUFFIX_LABEL;


/**
 * 表单字段类
 */
@Data
@AllArgsConstructor
public class FormFieldVO {

    /**
     * 字段Id
     */
    private String value;
    /**
     * 字段名称
     */
    private String label;
    /**
     * 字段类型
     */
    private String type;

    /**
     * 配置
     */
    private Object scheme;

    public FormFieldVO(String value, String label, String type) {
        this.value = value;
        this.label = label;
        this.type = type;
    }

    public FormFieldVO(UserFormItemEntity entity) {
        this.label = entity.getLabel();
        this.type = entity.getType().toString();
        this.value = entity.getFormItemId();
        //  选择型组件特殊处理
        if (CollUtil.contains(FormDataUtils.specialFields, entity.getType())) {
            this.value = entity.getFormItemId() + FIELD_SUFFIX_LABEL;
        }
        // 获取配置项
        this.scheme = entity.getScheme();
    }
}
