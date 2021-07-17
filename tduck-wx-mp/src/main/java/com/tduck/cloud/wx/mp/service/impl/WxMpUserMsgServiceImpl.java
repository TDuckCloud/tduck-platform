package com.tduck.cloud.wx.mp.service.impl;

import cn.hutool.core.util.StrUtil;
import com.tduck.cloud.wx.mp.service.WxMpUserMsgService;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.kefu.WxMpKefuMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

/**
 * @author : smalljop
 * @description :
 * @create : 2020-12-02 10:36
 **/
@Service
public class WxMpUserMsgServiceImpl implements WxMpUserMsgService {

    @Lazy
    @Autowired
    private WxMpService wxMpService;

    @Override
    public void sendKfTextMsg(String appId, String openId, String content) {
        WxMpKefuMessage msg = WxMpKefuMessage
                .TEXT()
                .toUser(openId)
                .content(content)
                .build();
        try {
            if (StrUtil.isBlank(appId)) {
                wxMpService.getKefuService().sendKefuMessage(msg);
            } else {
                wxMpService.switchoverTo(appId).getKefuService().sendKefuMessage(msg);
            }
        } catch (WxErrorException e) {
            e.printStackTrace();
        }
    }
}
