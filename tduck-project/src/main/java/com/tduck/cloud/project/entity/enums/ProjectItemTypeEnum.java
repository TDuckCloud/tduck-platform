package com.tduck.cloud.project.entity.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import com.tduck.cloud.project.entity.struct.*;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author : smalljop
 * @description : 表单项类型枚举
 * @create : 2020-11-19 10:51
 **/
@AllArgsConstructor
@Getter
public enum ProjectItemTypeEnum {

    INPUT(1, "单行文本", InputExpandStruct.class),
    TEXTAREA(2, "多行文本", TextareaExpandStruct.class),
    PASSWORD_INPUT(3, "密码输入", null),
    NUMBER_INPUT(4, "数字输入", NumberExpandStruct.class),
    SELECT(5, "下拉框", SelectExpandStruct.class),
    CASCADER(6, "级联选择", CascaderExpandStruct.class),
    RADIO(7, "单选框", RadioExpandStruct.class),
    CHECKBOX(8, "多选框", CheckboxExpandStruct.class),
    SWITCH(9, "开关", SwitchExpandStruct.class),
    SLIDER(10, "滑块", SliderExpandStruct.class),
    TIME(11, "时间选择", TimeExpandStruct.class),
    TIME_RANGE(12, "时间范围", TimeRangeExpandStruct.class),
    DATE(13, "日期选择", DateExpandStruct.class),
    DATE_RANGE(14, "日期范围", DateRangeExpandStruct.class),
    RATE(15, "评分", RateExpandStruct.class),
    COLOR(16, "颜色", ColorExpandStruct.class),
    UPLOAD(17, "文件上传组件", UploadExpandStruct.class);


    @EnumValue
    @JsonValue
    private int value;

    private String desc;
    /**
     * 扩展属性类
     */
    private Class expandClass;

    /**
     * 枚举入参注解
     * @param value
     * @return
     */
    @JsonCreator
    public static ProjectItemTypeEnum getByValue(int value) {
        for(ProjectItemTypeEnum typeEnum : values()) {
            if(typeEnum.getValue() == value) {
                return typeEnum;
            }
        }
        return null;
    }


}
