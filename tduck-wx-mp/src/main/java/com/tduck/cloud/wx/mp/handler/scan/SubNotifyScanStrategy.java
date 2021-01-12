package com.tduck.cloud.wx.mp.handler.scan;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.tduck.cloud.common.util.RedisUtils;
import com.tduck.cloud.wx.mp.constant.WxMpRedisKeyConstants;
import com.tduck.cloud.wx.mp.entity.WxMpUserEntity;
import com.tduck.cloud.wx.mp.request.WxMpQrCodeGenRequest;
import com.tduck.cloud.wx.mp.service.WxMpUserMsgService;
import com.tduck.cloud.wx.mp.service.WxMpUserService;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

/**
 * @author : smalljop
 * @description : 订阅项目通知
 * @create : 2020-12-01 17:44
 **/
@Component
public class SubNotifyScanStrategy implements ScanStrategy {

    @Autowired
    private RedisUtils redisUtils;
    @Autowired
    private WxMpUserMsgService wxMpUserMsgService;

    @Override
    public WxMpXmlOutMessage handle(String appId, String openId, WxMpQrCodeGenRequest request) {
        redisUtils.add(StrUtil.format(WxMpRedisKeyConstants.WX_MP_SUB_NOTIFY,request.getData()), openId);
        wxMpUserMsgService.sendKfTextMsg(appId, openId, "订阅通知成功");
        return null;
    }
}
