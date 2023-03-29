package com.tduck.cloud.form.request;


import lombok.Data;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * 商品发起支付
 */
@Data
public class CreateGoodsPayRequest {
    /**
     * 表单
     */
    private String formKey;

    /**
     * 随机key 唯一标识
     */
    private String randKey;

    /**
     * Pc端使用扫码支付
     */
    private Boolean isMobile;


    private String openId;

    private List<Goods> goodsList;


    private BigDecimal totalPrice = BigDecimal.ZERO;


    /**
     * 用来存储表单的待提交数据 用于支付成功后的回调
     */
    private Map<String,Object> extData;

    /**
     * 商品描述
     */
    private String goodsDesc;

    private String productId;

    @Data
    public static class Goods {
        private String key;
        private Map<String, Object> value;
    }
}
