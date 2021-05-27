package com.tduck.cloud.common.constant;

/**
 * @description: 响应状态码
 * @author: smalljop
 * @create: 2020-02-10 15:46
 **/
public interface ResponseCodeConstants {
    /**
     * 接口成功
     */
    int SUCCESS = 200;
    /**
     * 接口失败 发生异常
     */
    int FAIL = 500;

    /**
     * 未登录
     */
    int UNAUTHORIZED = 401;

    /**
     * 需要验证的请求
     */
    int NEED_VERIFICATION = 416;

    /**
     * 找不到该请求
     */
    int NOT_FOUND = 404;

    /**
     * 非法签名
     */
    Integer SIGN_FAIL_CODE = 405;

    /**
     * 非法签名
     */
    String SIGN_FAIL_MSG = "非法访问，请检查请求信息";


    String VALIDATE_CODE_FAIL_MSG = "验证码验证失败";
}
