package com.tduck.cloud.form.constant;

/**
 * @description: redis key常量
 * @author: smalljop
 * @create: 2020-02-12 22:34
 **/
public interface FormRedisKeyConstants {
    /**
     * 表单Item排序位置自增
     */
    String FORM_ITEM_POS_DELTA = "form:item:pos:{}";


    /**
     * 手机号验证码
     */
    String PHONE_NUMBER_CODE = "form:mobile:code:{}";
    /**
     * 表单Item排序位置自增
     */
    String FORM_RESULT_NUMBER = "form:result:number:{}";

    /**
     * 查看表单IP记录列表
     */
    String FORM_VIEW_IP_LIST = "form:view:ip:list:{}";

    /**
     * 表单查看次数
     */
    String FORM_VIEW_COUNT_KEY = "form:view:count:{}";

    /**
     * 表单预约人数
     */
    String FORM_RESERVE_COUNT = "form:reserve:count:{}:{}:{}";

    /**
     * 商品卖出数量
     */
    String FORM_GOODS_SELL_QUANTITY = "form:goods:sell:quantity:{}:{}";

    /**
     * 商品是否支付状态
     */
    String FORM_GOODS_PAY_STATUS = "form:goods:pay:status:{}";

    /**
     * 商品待提交表单数据
     */
    String FORM_GOODS_SUBMIT_DATA = "form:goods:submit:data:{}";

    /**
     * 商品支付金额
     */
    String FORM_GOODS_PAY_PRICE = "form:goods:pay:price:{}";

    /**
     * 表单投票数量 {formKey}:{formItemId}
     */
    String FORM_VOTE_COUNT = "form:vote:count:{}:{}";

    /**
     * 表单单选名额 {formKey}:{formItemId}
     */
    String FORM_OPTION_QUANTITY = "form:option:count:{}:{}";
}
