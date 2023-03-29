package com.tduck.cloud.form.entity.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;
import com.tduck.cloud.common.entity.IDictEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author : smalljop
 * @description : 表单类型
 * @create : 2020-12-04 13:35
 **/
@Getter
@AllArgsConstructor
public enum FormTypeEnum implements IDictEnum {


    /**
     * 普通表单
     */
    ORDINARY(1, "普通表单"),
    /**
     * 流程表单
     */
    WORKFLOW(2, "流程表单"),
    /**
     * 文件夹
     */
    FOLDER(3, "文件夹"),
    /**
     * 考试
     */
    EXAM(4, "考试");

    private Integer value;
    private String desc;


}
