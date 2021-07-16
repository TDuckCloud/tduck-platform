package com.tduck.cloud.project.entity.struct;

import lombok.Data;

import java.util.List;

/**
 * @author : smalljop
 * @description : 级联选择
 * @create : 2020-11-19 15:13
 **/
@Data
public class CascaderExpandStruct {
    /**
     * 选项
     */
    private List<Option> options;

    /**
     * 塞选
     */
    private Boolean filterable;

    /**
     * 多选
     */
    private Boolean multiple;

    /**
     * 分割符
     */
    private String separator;

    /**
     * 显示全路径
     */
    private Boolean showAllLevels;

    public static class Option {
        public Integer id;
        public String label;
        public String value;
        public List<Option> children;
    }
}
