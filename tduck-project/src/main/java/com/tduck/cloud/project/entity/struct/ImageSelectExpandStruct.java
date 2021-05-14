package com.tduck.cloud.project.entity.struct;

import lombok.Data;

import java.util.List;

/**
 * @author : smalljop
 * @description : 颜色选择
 * @create : 2020-11-19 11:42
 **/
@Data
public class ImageSelectExpandStruct {

    /**
     * 选项
     */
    private List<Option> options;

    /**
     * 是否多选
     */
    private Boolean multiple;

    public static class Option {
        public String image;
        public String label;
        public Integer value;
    }

}
