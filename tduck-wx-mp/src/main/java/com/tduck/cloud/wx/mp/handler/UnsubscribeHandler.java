package com.tduck.cloud.wx.mp.handler;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.tduck.cloud.wx.mp.entity.WxMpUserEntity;
import com.tduck.cloud.wx.mp.service.WxMpUserService;
import lombok.RequiredArgsConstructor;
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
public class UnsubscribeHandler extends AbstractHandler {
    private final WxMpUserService wxMpUserService;

    @Override
    public WxMpXmlOutMessage handle(WxMpXmlMessage wxMessage,
                                    Map<String, Object> context, WxMpService wxMpService,
                                    WxSessionManager sessionManager) {
        String openId = wxMessage.getFromUser();
        this.logger.info("取消关注用户 OPENID: " + openId);
        WxMpUserEntity userEntity = wxMpUserService.
                getOne(Wrappers.<WxMpUserEntity>lambdaQuery().eq(WxMpUserEntity::getAppid, wxMpService.getWxMpConfigStorage().getAppId())
                        .eq(WxMpUserEntity::getOpenId, openId));
        if (ObjectUtil.isNotNull(userEntity)) {
            userEntity.setSubscribe(false);
            wxMpUserService.updateById(userEntity);
        }
        return null;
    }

}
