package com.tduck.cloud.form.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * 操作返回数据
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class OperateFormItemVO {

    /**
     * 排序号
     */
    private Long sort;

    /**
     * 数据Id
     */
    private Long itemDataId;

    /**
     * 操作是否成功
     */
    private Boolean operateSuccess;


    /**
     * 刷新全部
     */
    private Boolean refreshAll;

}
