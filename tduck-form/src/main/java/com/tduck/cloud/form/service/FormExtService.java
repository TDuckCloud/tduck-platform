package com.tduck.cloud.form.service;


import com.tduck.cloud.form.request.CreateGoodsPayRequest;

/**
 * 表单扩展功能
 */
public interface FormExtService {
    /**
     *
     *
     * @param request
     * @return  totalPrice 总价
     *
     */
    CreateGoodsPayRequest calcGoodsTotalPrice(CreateGoodsPayRequest request);
}
