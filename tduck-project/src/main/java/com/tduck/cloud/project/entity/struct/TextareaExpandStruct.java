package com.tduck.cloud.project.entity.struct;

import lombok.Data;

/**
 * @author : smalljop
 * @description : 多行文本
 * @create : 2020-11-19 11:42
 **/
@Data
public class TextareaExpandStruct {

    /**
     * 最大行数
     */
    public Integer maxRows;
    /**
     * 最小行数
     */
    public Integer minRows;

    /**
     * 最大长度
     */
    private Long maxlength;

}
