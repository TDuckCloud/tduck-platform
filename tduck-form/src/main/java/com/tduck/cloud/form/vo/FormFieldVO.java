package com.tduck.cloud.form.vo;


import cn.hutool.core.collection.CollUtil;
import com.tduck.cloud.form.entity.UserFormItemEntity;
import com.tduck.cloud.form.util.FormDataUtils;
import com.tduck.cloud.form.util.HtmlUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import static com.tduck.cloud.form.constant.FormConstants.FIELD_SUFFIX_LABEL;


/**
 * 表单字段类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class FormFieldVO {

    /**
     * 字段Id
     */
    protected String value;
    /**
     * 字段名称
     */
    protected String label;
    /**
     * 字段类型
     */
    protected String type;

    /**
     * 配置
     */
    protected Object scheme;

    public FormFieldVO(String value, String label) {
        this.value = value;
        // 清除html里面的标签
        this.label = HtmlUtils.cleanHtmlTag(label);
    }

    public FormFieldVO(String value, String label, String type) {
        this.value = value;
        this.label = HtmlUtils.cleanHtmlTag(label);
        this.type = type;
    }

    public FormFieldVO(UserFormItemEntity entity) {
        this.label = HtmlUtils.cleanHtmlTag(entity.getLabel());
        this.type = entity.getType().toString();
        this.value = entity.getFormItemId();
        //  选择型组件特殊处理
        if (CollUtil.contains(FormDataUtils.specialFields, entity.getType())) {
            this.value = entity.getFormItemId() + FIELD_SUFFIX_LABEL;
        }
        //获取配置项
        this.scheme = entity.getScheme();
    }
}
