package com.tduck.cloud.project.entity.struct;

import lombok.Data;

/**
 * @author : smalljop
 * @description : 输入框配置
 * @create : 2020-11-19 11:42
 **/
@Data
public class InputExpandStruct {

    /**
     * 前缀
     */
    public String prepend;
    /**
     * 后缀
     */
    public String append;

    /**
     * 最大长度
     */
    private Long maxlength;

    /**
     * 前置图标
     */
    private String prefixIcon;

    /**
     * 显示可输入字数
     */
    private Boolean showWordLimit;
}
