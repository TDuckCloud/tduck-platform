package com.tduck.cloud.wx.mp.handler.scan;

import com.tduck.cloud.wx.mp.request.WxMpQrCodeGenRequest;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutMessage;

/**
 * @author : smalljop
 * @description : 扫码处理基本
 * @create : 2020-12-01 17:45
 **/
public interface ScanStrategy {


    /***
     * 处理
     * @param request
     * @return
     */
    WxMpXmlOutMessage handle(String appId, String openId, WxMpQrCodeGenRequest request);

}
