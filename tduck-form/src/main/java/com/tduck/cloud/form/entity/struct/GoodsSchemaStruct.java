package com.tduck.cloud.form.entity.struct;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author : smalljop
 * @description : 选项结构
 * @create :  2021/06/07 16:37
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class GoodsSchemaStruct {


    private List<Goods> goodsList;



    @Data
    public static class Goods{
        private String id;
        /**
         * 商品名
         */
        private String goodsName;
        /**
         * 价格
         */
        private BigDecimal price;
        /**
         * 库存
         */
        private Long inventory;
    }



}
