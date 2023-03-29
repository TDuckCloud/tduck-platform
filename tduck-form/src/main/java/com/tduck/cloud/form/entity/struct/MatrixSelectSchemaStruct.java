package com.tduck.cloud.form.entity.struct;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author : smalljop
 * @description : 矩阵选择组件结构
 * @create :  2021/06/07 16:37
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MatrixSelectSchemaStruct {


    private Table table;

    @Data
    public static class Table {
        private List<Item> rows;
        private List<Item> columns;
    }


    @Data
    public static class Item {
        private String label;
        private String id;
    }
}
