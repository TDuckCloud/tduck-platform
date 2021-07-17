package com.tduck.cloud.project.entity.struct;

import lombok.Data;

import java.util.List;

/**
 * @author : smalljop
 * @description : 颜色选择
 * @create : 2020-11-19 11:42
 **/
@Data
public class CheckboxExpandStruct {
    /**
     * 最小
     */
    private Integer min;
    /**
     * 最大
     */
    private Integer max;

    /**
     * 选项类型
     */
    private String optionType;

    /**
     * 选项是按钮时大小
     */
    private String size;

    /**
     * 选项
     */
    private List<Option> options;


    public static class Option {
        public String label;
        public Integer value;
    }

}
