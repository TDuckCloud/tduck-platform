package com.tduck.cloud.form.constant;

/**
 * @author : smalljop
 * @description :
 * @create : 2020-11-11 18:16
 **/
public interface FormConstants {

    /**
     * 选择性组件保存会创建两个字段 一个存放Id 一个存放选项名
     */
    String FIELD_SUFFIX_LABEL = "label";


    /**
     * 表单Item排序位置自增
     */
    String FORM_ITEM_POS_DELTA = "form:item:pos:{}";


    /**
     * 手机号验证码
     */
    String PHONE_NUMBER_CODE = "form:mobile:code:{}";


    /**
     * 查看表单数
     */
    String FORM_VIEW_COUNT = "form:view:count:{}";

    String FORM_RESULT_NUMBER = "form:view:result:{}";

}
