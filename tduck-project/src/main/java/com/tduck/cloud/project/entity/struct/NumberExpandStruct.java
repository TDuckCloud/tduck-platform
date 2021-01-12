package com.tduck.cloud.project.entity.struct;

import lombok.Data;

/**
 * @author : smalljop
 * @description : 数字型输入
 * @create : 2020-11-19 15:13
 **/
@Data
public class NumberExpandStruct {
    /**
     * 最小
     */
    private Integer min;
    /**
     * 最大
     */
    private Integer max;
    /**
     * 计数器步长 每次+几
     */
    private Integer step;
    /**
     * 是否只能输入 step 的倍数
     */
    private Boolean stepStrictly;

    /**
     * 经度
     */
    private Integer precision;

    /**
     * 按钮控制位置
     */
    private String controlsPosition;
}
