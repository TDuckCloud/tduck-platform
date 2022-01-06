package com.tduck.cloud.wx.mp.handler.scan;

import cn.hutool.core.util.StrUtil;
import com.tduck.cloud.common.util.CacheUtils;
import com.tduck.cloud.wx.mp.constant.WxMpRedisKeyConstants;
import com.tduck.cloud.wx.mp.request.WxMpQrCodeGenRequest;
import com.tduck.cloud.wx.mp.service.WxMpUserMsgService;
import lombok.RequiredArgsConstructor;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutMessage;
import org.springframework.stereotype.Component;

/**
 * @author : smalljop
 * @description : 订阅项目通知
 * @create : 2020-12-01 17:44
 **/
@Component
@RequiredArgsConstructor
public class SubNotifyScanStrategy implements ScanStrategy {

    private final CacheUtils cacheUtils;
    private final WxMpUserMsgService wxMpUserMsgService;

    @Override
    public WxMpXmlOutMessage handle(String appId, String openId, WxMpQrCodeGenRequest request) {
        cacheUtils.addList(StrUtil.format(WxMpRedisKeyConstants.WX_MP_SUB_NOTIFY, request.getData()), openId);
        wxMpUserMsgService.sendKfTextMsg(appId, openId, "订阅通知成功");
        return null;
    }
}
