package com.tduck.cloud.wx.mp.constant;

/**
 * @description: redis key常量
 * @author: smalljop
 * @create: 2020-02-12 22:34
 **/
public interface WxMpRedisKeyConstants {
    /**
     * 微信登录二维码Id
     */
    String WX_MP_LOGIN_QRCODE = "wx:mp:login:{}";

    /**
     * 订阅通知
     */
    String WX_MP_SUB_NOTIFY = "wx:mp:sub:notify:{}";

}
