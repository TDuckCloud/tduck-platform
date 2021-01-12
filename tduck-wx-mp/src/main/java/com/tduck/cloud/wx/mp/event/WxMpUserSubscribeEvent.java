package com.tduck.cloud.wx.mp.event;

import com.tduck.cloud.wx.mp.entity.WxMpUserEntity;
import com.tduck.cloud.wx.mp.request.WxMpQrCodeGenRequest;
import lombok.Data;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

import java.util.Map;

/**
 * 微信用户订阅事件
 *
 * @author smalljop
 */
public class WxMpUserSubscribeEvent extends ApplicationEvent {

    @Getter
    private WxMpUserEntity wxMpUserEntity;


    @Getter
    private WxMpQrCodeGenRequest params;

    public WxMpUserSubscribeEvent(Object source, WxMpUserEntity wxMpUserEntity, WxMpQrCodeGenRequest params) {
        super(source);
        this.wxMpUserEntity = wxMpUserEntity;
        this.params = params;
    }
}