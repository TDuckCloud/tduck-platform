package com.tduck.cloud.wx.mp.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tduck.cloud.wx.mp.entity.WxMpUserEntity;

import java.util.Collection;
import java.util.List;

/**
 * 微信公众号用户 (WxMpUser)表服务接口
 *
 * @author smalljop
 * @since 2020-12-01 17:04:44
 */
public interface WxMpUserService extends IService<WxMpUserEntity> {


    /**
     * 根据openId查询
     *
     * @param openIdList
     * @return
     */
    List<WxMpUserEntity> listWxMpUserByOpenId(Collection<Object> openIdList);

    /***
     *  查询
     * @param appId
     * @param openId
     * @return
     */
    WxMpUserEntity getByAppIdAndOpenId(String appId, String openId);

    /***
     *  查询
     * @param userId
     * @return
     */
    WxMpUserEntity getByUserId(Long userId);
}