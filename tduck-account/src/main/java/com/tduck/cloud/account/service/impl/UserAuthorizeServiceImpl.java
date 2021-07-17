package com.tduck.cloud.account.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fasterxml.jackson.databind.JsonNode;
import com.tduck.cloud.account.entity.UserAuthorizeEntity;
import com.tduck.cloud.account.entity.UserEntity;
import com.tduck.cloud.account.entity.enums.UserAuthorizeTypeEnum;
import com.tduck.cloud.account.mapper.UserAuthorizeMapper;
import com.tduck.cloud.account.service.UserAuthorizeService;
import com.tduck.cloud.account.util.QqAuthorizationUtils;
import com.tduck.cloud.common.util.JsonUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 第三方用户授权信息(AcUserAuthorize)表服务实现类
 *
 * @author smalljop
 * @since 2020-12-09 17:43:17
 */
@Service("acUserAuthorizeService")
@RequiredArgsConstructor
public class UserAuthorizeServiceImpl extends ServiceImpl<UserAuthorizeMapper, UserAuthorizeEntity> implements UserAuthorizeService {
    private final QqAuthorizationUtils qqAuthorizationUtils;

    @Override
    public UserAuthorizeEntity getQqAuthorization(String authorizeCode, String redirectUri, UserEntity userEntity) {
        String accessToken = qqAuthorizationUtils.getAccessToken(authorizeCode, redirectUri);
        String openId = qqAuthorizationUtils.getUserOpenId(accessToken);
        String appId = qqAuthorizationUtils.getAppId();
        UserAuthorizeEntity authorizeEntity = this.get(UserAuthorizeTypeEnum.QQ, appId, openId);
        if (ObjectUtil.isNull(authorizeEntity)) {
            JsonNode userInfo = qqAuthorizationUtils.getUserInfo(accessToken, openId);
            if (!userInfo.isNull()) {
                userEntity = qqAuthorizationUtils.convertJsonToUser(userInfo);
                authorizeEntity = new UserAuthorizeEntity();
                authorizeEntity.setAppId(appId);
                authorizeEntity.setOpenId(openId);
                authorizeEntity.setUserName(userEntity.getName());
                authorizeEntity.setType(UserAuthorizeTypeEnum.QQ);
                authorizeEntity.setUserInfo(JsonUtils.jsonToMap(userInfo.toPrettyString()));
                authorizeEntity.setUserId(userEntity.getId());
                this.save(authorizeEntity);
            }
        } else {
            userEntity.setId(authorizeEntity.getUserId());
        }
        return authorizeEntity;
    }

    @Override
    public UserAuthorizeEntity get(UserAuthorizeTypeEnum type, String appId, String openId) {
        UserAuthorizeEntity authorizeEntity = this.getOne(Wrappers.<UserAuthorizeEntity>lambdaQuery().eq(UserAuthorizeEntity::getType, type)
                .eq(UserAuthorizeEntity::getAppId, appId).eq(UserAuthorizeEntity::getOpenId, openId));
        return authorizeEntity;
    }

    @Override
    public UserAuthorizeEntity getByUserId(UserAuthorizeTypeEnum type, Long userId) {
        UserAuthorizeEntity authorizeEntity = this.getOne(Wrappers.<UserAuthorizeEntity>lambdaQuery().eq(UserAuthorizeEntity::getType, type)
                .eq(UserAuthorizeEntity::getUserId, userId));
        return authorizeEntity;
    }
}