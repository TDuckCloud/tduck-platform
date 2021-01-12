package com.tduck.cloud.account.util;

import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.core.util.URLUtil;
import cn.hutool.http.HttpUtil;
import com.fasterxml.jackson.databind.JsonNode;
import com.tduck.cloud.account.entity.UserEntity;
import com.tduck.cloud.account.entity.enums.AccountChannelEnum;
import com.tduck.cloud.common.util.JsonUtils;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author : smalljop
 * @description : qq授权登录
 * @create : 2020-12-09 14:19
 **/
@ConfigurationProperties(prefix = "platform.qq.oauth")
@Component
@Slf4j
@Data
public class QqAuthorizationUtils {
    private String appId;
    private String secret;


    public String getAuthorizationCodeUrl(String redirectUri) {
        return StrUtil.format("https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id={}&redirect_uri={}&state={}", appId, URLUtil.encode(redirectUri), IdUtil.randomUUID());
    }

    public String getAccessToken(String authorizationCode, String redirectUri) {
        String url = "https://graph.qq.com/oauth2.0/token?grant_type=authorization_code&client_id={}&client_secret={}&code={}&redirect_uri={}&fmt=json";
        String result = HttpUtil.get(StrUtil.format(url, appId, secret, authorizationCode, redirectUri));
        log.debug("getAccessToken :{}", result);
        JsonNode jsonNode = JsonUtils.jsonToJsonNode(result);
        if (!jsonNode.isNull() && jsonNode.findPath("error").isEmpty()) {
            return jsonNode.get("access_token").asText();
        }
        return "";
    }


    /**
     * 获取微信openId
     *
     * @param accessToken
     * @return
     */
    public String getUserOpenId(String accessToken) {
        String url = "https://graph.qq.com/oauth2.0/me?access_token={}&fmt=json";
        String result = HttpUtil.get(StrUtil.format(url, accessToken));
        log.debug("getUserOpenId :{}", result);
        JsonNode jsonNode = JsonUtils.jsonToJsonNode(result);
        if (!jsonNode.isNull() && jsonNode.findPath("error").isEmpty()) {
            return jsonNode.get("openid").asText();
        }
        return "";
    }

    /**
     * 获取qq用户信息
     *
     * @param openId
     */
    public JsonNode getUserInfo(String accessToken, String openId) {
        String url = "https://graph.qq.com/user/get_user_info?access_token={}&oauth_consumer_key={}&openid={}";
        String result = HttpUtil.get(StrUtil.format(url, accessToken, appId, openId));
        log.debug("getUserInfo :{}", result);
        JsonNode jsonNode = JsonUtils.jsonToJsonNode(result);

        if (!jsonNode.isNull() && jsonNode.findPath("ret").asInt() == 0) {
            return jsonNode;
        }
        return null;
    }

    /**
     * 转换为user实体
     *
     * @param userInfo
     * @return
     */
    public UserEntity convertJsonToUser(JsonNode userInfo) {
        String nickname = userInfo.get("nickname").asText();
        String headImg = userInfo.get("figureurl_qq_1").asText();
        String gender = userInfo.get("gender").asText();
        UserEntity userEntity = new UserEntity();
        userEntity.setName(nickname);
        userEntity.setGender("男".equals(gender) ? 1 : 2);
        userEntity.setAvatar(headImg);
        userEntity.setRegChannel(AccountChannelEnum.QQ);
        return userEntity;
    }

}
