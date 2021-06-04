package com.tduck.cloud.wx.mp.handler.scan;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.tduck.cloud.common.util.RedisUtils;
import com.tduck.cloud.wx.mp.constant.WxMpRedisKeyConstants;
import com.tduck.cloud.wx.mp.entity.WxMpUserEntity;
import com.tduck.cloud.wx.mp.request.WxMpQrCodeGenRequest;
import com.tduck.cloud.wx.mp.service.WxMpUserMsgService;
import com.tduck.cloud.wx.mp.service.WxMpUserService;
import lombok.RequiredArgsConstructor;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutMessage;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

/**
 * @author : smalljop
 * @description : 微信登录扫码
 * @create : 2020-12-01 17:44
 **/
@Component
@RequiredArgsConstructor
public class LoginScanStrategy implements ScanStrategy {

    private final RedisUtils redisUtils;
    private final WxMpUserService wxMpUserService;
    private final WxMpUserMsgService wxMpUserMsgService;


    @Override
    public WxMpXmlOutMessage handle(String appId, String openId, WxMpQrCodeGenRequest request) {
        WxMpUserEntity userEntity = wxMpUserService.
                getOne(Wrappers.<WxMpUserEntity>lambdaQuery().eq(WxMpUserEntity::getAppid, appId)
                        .eq(WxMpUserEntity::getOpenId, openId));
        redisUtils.set(StrUtil.format(WxMpRedisKeyConstants.WX_MP_LOGIN_QRCODE, request.getData()), userEntity.getUserId(), 10L, TimeUnit.MINUTES);
        wxMpUserMsgService.sendKfTextMsg(appId, openId, "登录成功");
        return null;
    }
}
