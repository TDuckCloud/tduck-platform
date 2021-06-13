package com.tduck.cloud.api.handler;

import com.tduck.cloud.account.entity.UserEntity;
import com.tduck.cloud.account.entity.enums.AccountChannelEnum;
import com.tduck.cloud.account.service.UserService;
import com.tduck.cloud.wx.mp.entity.WxMpUserEntity;
import com.tduck.cloud.wx.mp.event.WxMpUserSubscribeEvent;
import com.tduck.cloud.wx.mp.handler.scan.LoginScanStrategy;
import com.tduck.cloud.wx.mp.service.WxMpUserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;


/**
 * @author : smalljop
 * @description : 微信订阅事件处理
 * @create : 2020-12-01 18:37
 **/
@Slf4j
@Component
@RequiredArgsConstructor
public class WxMpUserSubscribeEventHandler {

    private final UserService userService;

    private final WxMpUserService wxMpUserService;

    private final LoginScanStrategy loginScanStrategy;

    @EventListener
    public void onWxMpUserSubscribe(WxMpUserSubscribeEvent event) {
        //为关注的用户创建一个默认的用户
        UserEntity userEntity = new UserEntity();
        WxMpUserEntity wxMpUserEntity = event.getWxMpUserEntity();
        userEntity.setGender(wxMpUserEntity.getSex());
        userEntity.setName(wxMpUserEntity.getNickname());
        userEntity.setAvatar(wxMpUserEntity.getHeadImgUrl());
        userEntity.setRegChannel(AccountChannelEnum.WX_MP);
        userService.save(userEntity);
        wxMpUserEntity.setUserId(userEntity.getId());
        wxMpUserService.updateById(wxMpUserEntity);
        //完成登录
        loginScanStrategy.handle(wxMpUserEntity.getAppid(), wxMpUserEntity.getOpenId(), event.getParams());
    }

}