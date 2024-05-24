package com.tduck.cloud.api.web.controller;

import cn.hutool.core.util.StrUtil;
import cn.hutool.core.util.URLUtil;
import com.tduck.cloud.common.util.Result;
import lombok.AllArgsConstructor;
import me.chanjar.weixin.common.bean.WxJsapiSignature;
import me.chanjar.weixin.common.bean.WxOAuth2UserInfo;
import me.chanjar.weixin.common.bean.oauth2.WxOAuth2AccessToken;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.security.PermitAll;
import javax.validation.constraints.NotBlank;

/**
 * @author : smalljop
 * @description : 微信公众号网页
 * @create : 2020-12-02 13:40
 **/
@AllArgsConstructor
@RestController
@RequestMapping("/wx/jsapi/")
public class WxJsApiController {
    private final WxMpService wxService;


    /**
     * 用户授权url
     *
     * @return hcah
     */
    @GetMapping("/authorization/url")
    @PermitAll
    public Result getAuthorizationUrl(@RequestParam @NotBlank String url) {
        try {
            String appId = wxService.getWxMpConfigStorage().getAppId();
            String authorizationUrl = StrUtil.format("https://open.weixin.qq.com/connect/oauth2/authorize?appid={}&redirect_uri={}&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect", appId, URLUtil.encode(url));
            return Result.success(authorizationUrl);
        } catch (Exception e) {
            return Result.success();
        }
    }


    /**
     * 根据code获取用户信息
     *
     * @param code
     * @return
     */
    @GetMapping("/authorization/user/info")
    @PermitAll
    public Result<WxOAuth2UserInfo> greetUser(@RequestParam @NotBlank String code) {
        WxOAuth2UserInfo userInfo = null;
        try {
            WxOAuth2AccessToken accessToken = wxService.getOAuth2Service().getAccessToken(code);
            userInfo = wxService.getOAuth2Service().getUserInfo(accessToken, null);
        } catch (WxErrorException e) {
            return Result.success();
        }
        return Result.success(userInfo);
    }


    /**
     * 获取jsapi签名
     *
     * @param url 1
     * @return
     * @throws WxErrorException
     */
    @GetMapping("/signature")
    @PermitAll
    public Result getSignature(@RequestParam String url) throws WxErrorException {
        WxJsapiSignature signature = wxService.createJsapiSignature(url);
        return Result.success(signature);
    }


}
