package com.tduck.cloud.wx.mp.handler.scan;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.tduck.cloud.common.util.CacheUtils;
import com.tduck.cloud.wx.mp.constant.WxMpRedisKeyConstants;
import com.tduck.cloud.wx.mp.entity.WxMpUserEntity;
import com.tduck.cloud.wx.mp.request.WxMpQrCodeGenRequest;
import com.tduck.cloud.wx.mp.service.WxMpUserMsgService;
import com.tduck.cloud.wx.mp.service.WxMpUserService;
import lombok.RequiredArgsConstructor;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutMessage;
import org.springframework.stereotype.Component;


/**
 * @author : smalljop
 * @description : 微信登录扫码
 * @create : 2020-12-01 17:44
 **/
@Component
@RequiredArgsConstructor
public class LoginScanStrategy implements ScanStrategy {

    private final CacheUtils cacheUtils;
    private final WxMpUserService wxMpUserService;
    private final WxMpUserMsgService wxMpUserMsgService;


    @Override
    public WxMpXmlOutMessage handle(String appId, String openId, WxMpQrCodeGenRequest request) {
        WxMpUserEntity userEntity = wxMpUserService.
                getOne(Wrappers.<WxMpUserEntity>lambdaQuery().eq(WxMpUserEntity::getAppid, appId)
                        .eq(WxMpUserEntity::getOpenId, openId));
        cacheUtils.tempSave(StrUtil.format(WxMpRedisKeyConstants.WX_MP_LOGIN_QRCODE, request.getData()), userEntity.getUserId().toString());
        wxMpUserMsgService.sendKfTextMsg(appId, openId, "登录成功");
        return null;
    }
}
