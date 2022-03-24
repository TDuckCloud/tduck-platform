package com.tduck.cloud.form.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;

/**
 * 表单数据表格
 */
@Data
@NoArgsConstructor
public class FormDataTableVO {
    /**
     * 数据列表
     */
    private List<Map> rows;

    private Long total;

    public FormDataTableVO(List<Map> rows, Long total) {
        this.rows = rows;
        this.total = total;
    }
}
