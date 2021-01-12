package com.tduck.cloud.wx.mp.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.collect.Lists;
import com.tduck.cloud.wx.mp.entity.WxMpUserEntity;
import com.tduck.cloud.wx.mp.mapper.WxMpUserMapper;
import com.tduck.cloud.wx.mp.service.WxMpUserService;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;

/**
 * 微信公众号用户 (WxMpUser)表服务实现类
 *
 * @author smalljop
 * @since 2020-12-01 17:04:45
 */
@Service("wxMpUserService")
public class WxMpUserServiceImpl extends ServiceImpl<WxMpUserMapper, WxMpUserEntity> implements WxMpUserService {

    @Override
    public List<WxMpUserEntity> listWxMpUserByOpenId(Collection<Object> openIdList) {
        if (CollUtil.isEmpty(openIdList)) {
            return Lists.newArrayList();
        }
        List<WxMpUserEntity> mpUserEntityList = this.list(Wrappers.<WxMpUserEntity>lambdaQuery().in(WxMpUserEntity::getOpenId, openIdList));
        return mpUserEntityList;
    }

    @Override
    public WxMpUserEntity getByAppIdAndOpenId(String appId, String openId) {
        return this.getOne(Wrappers.<WxMpUserEntity>lambdaQuery().eq(WxMpUserEntity::getAppid, appId).eq(WxMpUserEntity::getOpenId, openId));
    }

    @Override
    public WxMpUserEntity getByUserId(Long userId) {
        WxMpUserEntity wxMpUserEntity = this.getOne(Wrappers.<WxMpUserEntity>lambdaQuery().eq(WxMpUserEntity::getUserId, userId));
        return wxMpUserEntity;
    }
}