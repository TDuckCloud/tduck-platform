package com.tduck.cloud.project.entity.struct;

import lombok.Data;

/**
 * @author : smalljop
 * @description : 评分
 * @create : 2020-11-19 11:42
 **/
@Data
public class RateExpandStruct {

    /**
     * 最大分数
     */
    private Integer max;
    /**
     * 允许半选
     */
    private Boolean allowHalf;
    /**
     * 辅助文字
     */
    private Boolean showText;
    /**
     * 显示分数
     */
    private Boolean showScore;
    /**
     * 禁用
     */
    private Boolean disabled;


}
