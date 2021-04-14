package com.tduck.cloud.wx.mp.handler.scan;

import cn.hutool.core.util.ObjectUtil;
import com.tduck.cloud.common.util.JsonUtils;
import com.tduck.cloud.wx.mp.request.WxMpQrCodeGenRequest;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * @author : smalljop
 * @description :
 * @create : 2020-12-01 17:55
 **/
@Component
public class ScanStrategyContext {

    @Autowired
    private Map<String, ScanStrategy> scanStrategy;

    private static String SCAN_STRATEGY_NAME = "ScanStrategy";


    /**
     * 二维码场景值
     *
     * @param qrScene
     */
    public WxMpXmlOutMessage executeStrategy(String qrScene, String appId, String openId) {
        WxMpQrCodeGenRequest request = JsonUtils.jsonToObj(qrScene, WxMpQrCodeGenRequest.class);
        ScanStrategy scanStrategy = this.scanStrategy.get(request.getType().getKey() + SCAN_STRATEGY_NAME);
        if (ObjectUtil.isNotNull(scanStrategy)) {
            return scanStrategy.handle(appId, openId, request);
        }
        return null;
    }


}
