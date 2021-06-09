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

    INPUT("INPUT", "单行文本", InputExpandStruct.class),
    TEXTAREA("TEXTAREA", "多行文本", TextareaExpandStruct.class),
    PASSWORD_INPUT("PASSWORD_INPUT", "密码输入", null),
    NUMBER_INPUT("NUMBER_INPUT", "数字输入", NumberExpandStruct.class),
    SELECT("SELECT", "下拉框", SelectExpandStruct.class),
    CASCADER("CASCADER", "级联选择", CascaderExpandStruct.class),
    RADIO("RADIO", "单选框", RadioExpandStruct.class),
    CHECKBOX("CHECKBOX", "多选框", CheckboxExpandStruct.class),
    SWITCH("SWITCH", "开关", SwitchExpandStruct.class),
    SLIDER("SLIDER", "滑块", SliderExpandStruct.class),
    TIME("TIME", "时间选择", TimeExpandStruct.class),
    TIME_RANGE("TIME_RANGE", "时间范围", TimeRangeExpandStruct.class),
    DATE("DATE", "日期选择", DateExpandStruct.class),
    DATE_RANGE("DATE_RANGE", "日期范围", DateRangeExpandStruct.class),
    RATE("RATE", "评分", RateExpandStruct.class),
    COLOR("COLOR", "颜色", ColorExpandStruct.class),
    UPLOAD("UPLOAD", "文件上传组件", UploadExpandStruct.class),
    IMAGE("IMAGE", "图片展示", ImageExpandStruct.class),
    IMAGE_SELECT("IMAGE_SELECT", "图片选择", ImageSelectExpandStruct.class),
    IMAGE_CAROUSEL("IMAGE_CAROUSEL", "图片轮播", ImageCarouselExpandStruct.class),
    DESC_TEXT("DESC_TEXT", "文字描述", DescTextExpandStruct.class),
    SIGN_PAD("SIGN_PAD", "手写签名", SignPadExpandStruct.class),
    PAGINATION("PAGINATION", "分页", PaginationExpandStruct.class),
    DIVIDER("DIVIDER", "分割线", DividerExpandStruct.class),
    PROVINCE_CITY("PROVINCE_CITY", "省市联动", EmptyExpandStruct.class),
    PHONE_VERIFICATION("PHONE_VERIFICATION", "手机号验证", EmptyExpandStruct.class),
    INPUT_MAP("INPUT_MAP", "地理位置", EmptyExpandStruct.class);

    @EnumValue
    @JsonValue
    private String value;

    private String desc;
    /**
     * 扩展属性类
     */
    private Class expandClass;

    /**
     * 枚举入参注解
     *
     * @param value
     * @return
     */
    @JsonCreator
    public static ProjectItemTypeEnum getByValue(String value) {
        for (ProjectItemTypeEnum typeEnum : values()) {
            if (typeEnum.getValue().equals(value)) {
                return typeEnum;
            }
        }
        return null;
    }


}
