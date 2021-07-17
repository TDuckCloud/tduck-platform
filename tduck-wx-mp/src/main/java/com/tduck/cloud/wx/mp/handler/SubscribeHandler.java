package com.tduck.cloud.wx.mp.handler;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.tduck.cloud.common.util.JsonUtils;
import com.tduck.cloud.common.util.SpringContextUtils;
import com.tduck.cloud.wx.mp.builder.TextBuilder;
import com.tduck.cloud.wx.mp.entity.WxMpUserEntity;
import com.tduck.cloud.wx.mp.event.WxMpUserSubscribeEvent;
import com.tduck.cloud.wx.mp.handler.scan.ScanStrategyContext;
import com.tduck.cloud.wx.mp.request.WxMpQrCodeGenRequest;
import com.tduck.cloud.wx.mp.service.WxMpUserService;
import lombok.RequiredArgsConstructor;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.common.session.WxSessionManager;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.message.WxMpXmlMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutMessage;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.springframework.stereotype.Component;

import java.util.Map;
import java.util.Optional;

/**
 * @author Binary Wang(https://github.com/binarywang)
 */
@Component
@RequiredArgsConstructor
public class SubscribeHandler extends AbstractHandler {

    private final WxMpUserService wxMpUserService;

    private final ScanStrategyContext scanStrategyContext;


    private String LOGIN_STR = "login";

    private String QRSCENE_STR = "qrscene_";

    @Override
    public WxMpXmlOutMessage handle(WxMpXmlMessage wxMessage,
                                    Map<String, Object> context, WxMpService weixinService,
                                    WxSessionManager sessionManager) throws WxErrorException {

        this.logger.info("新关注用户 OPENID: " + wxMessage.getFromUser());

        // 获取微信用户基本信息
        WxMpUserEntity userEntity = null;
        try {
            WxMpUser userWxInfo = weixinService.getUserService()
                    .userInfo(wxMessage.getFromUser(), null);
            if (userWxInfo != null) {
                String appId = weixinService.getWxMpConfigStorage().getAppId();
                userEntity = Optional.ofNullable(wxMpUserService.
                        getOne(Wrappers.<WxMpUserEntity>lambdaQuery()
                                .eq(WxMpUserEntity::getAppid, appId).eq(WxMpUserEntity::getOpenId, userWxInfo.getOpenId()))).orElse(new WxMpUserEntity());
                BeanUtil.copyProperties(userWxInfo, userEntity);
                userEntity.setAppid(appId);
                if (ObjectUtil.isNotNull(userEntity) && ObjectUtil.isNotNull(userEntity.getId())) {
                    userEntity.setSubscribe(true);
                    wxMpUserService.updateById(userEntity);
                } else {
                    wxMpUserService.save(userEntity);
                }
            }
        } catch (WxErrorException e) {
            if (e.getError().getErrorCode() == 48001) {
                this.logger.info("该公众号没有获取用户信息权限！");
            }
        }


        WxMpXmlOutMessage responseResult = null;
        try {
            responseResult = this.handleSpecial(wxMessage, userEntity);
        } catch (Exception e) {
            this.logger.error(e.getMessage(), e);
        }

        if (responseResult != null) {
            return responseResult;
        }

        try {
            return new TextBuilder().build("你好，欢迎关注Tduck填鸭！", wxMessage, weixinService);
        } catch (Exception e) {
            this.logger.error(e.getMessage(), e);
        }

        return null;
    }

    /**
     * 处理特殊请求，比如如果是扫码进来的，可以做相应处理
     */
    private WxMpXmlOutMessage handleSpecial(WxMpXmlMessage wxMessage, WxMpUserEntity userEntity)
            throws Exception {
        String eventKey = wxMessage.getEventKey();
        if (StrUtil.isNotBlank(eventKey)) {
            if (StrUtil.startWith(eventKey, QRSCENE_STR)) {
                String qrScene = StrUtil.subAfter(eventKey, QRSCENE_STR, false);
                WxMpQrCodeGenRequest request = JsonUtils.jsonToObj(qrScene, WxMpQrCodeGenRequest.class);
                if (LOGIN_STR.equals(request.getType().getKey()) && ObjectUtil.isNull(userEntity.getUserId())) {
                    SpringContextUtils.publishEvent(new WxMpUserSubscribeEvent(this, userEntity, request));
                } else {
                    scanStrategyContext.executeStrategy(qrScene, userEntity.getAppid(), userEntity.getOpenId());
                }
            }

        }
        return null;
    }


}
