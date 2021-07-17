package com.tduck.cloud.project.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * 操作返回数据
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class OperateProjectItemVO {

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


}
