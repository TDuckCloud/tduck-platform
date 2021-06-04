package com.tduck.cloud.wx.mp.handler;

import com.tduck.cloud.wx.mp.handler.scan.ScanStrategyContext;
import lombok.RequiredArgsConstructor;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.common.session.WxSessionManager;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.message.WxMpXmlMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutMessage;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * @author Binary Wang(https://github.com/binarywang)
 */
@Component
@RequiredArgsConstructor
public class ScanHandler extends AbstractHandler {

    private final ScanStrategyContext scanStrategyContext;

    @Override
    public WxMpXmlOutMessage handle(WxMpXmlMessage wxMpXmlMessage, Map<String, Object> map,
                                    WxMpService wxMpService, WxSessionManager wxSessionManager) throws WxErrorException {
        // 扫码事件处理
        return scanStrategyContext.executeStrategy(wxMpXmlMessage.getEventKey(), wxMpService.getWxMpConfigStorage().getAppId(), wxMpXmlMessage.getFromUser());
    }


}
