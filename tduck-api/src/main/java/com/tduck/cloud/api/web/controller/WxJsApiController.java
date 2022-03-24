package com.tduck.cloud.api.web.controller;

import cn.hutool.core.util.StrUtil;
import cn.hutool.core.util.URLUtil;
import com.tduck.cloud.common.util.Result;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import me.chanjar.weixin.common.bean.WxJsapiSignature;
import me.chanjar.weixin.common.bean.WxOAuth2UserInfo;
import me.chanjar.weixin.common.bean.oauth2.WxOAuth2AccessToken;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.constraints.NotBlank;

/**
 * @author : smalljop
 * @description : 微信网页开发
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
    public Result getAuthorizationUrl(@RequestParam @NotBlank String url) {
        String appId = wxService.getWxMpConfigStorage().getAppId();
        String authorizationUrl = StrUtil.format("https://open.weixin.qq.com/connect/oauth2/authorize?appid={}&redirect_uri={}&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect", appId, URLUtil.encode(url));
        return Result.success(authorizationUrl);
    }


    /**
     * 根据code获取用户信息
     *
     * @param code
     * @return
     */
    @GetMapping("/authorization/user/info")
    public Result<WxOAuth2UserInfo> greetUser(@RequestParam @NotBlank String code) throws WxErrorException {
        WxOAuth2AccessToken accessToken = wxService.getOAuth2Service().getAccessToken(code);
        WxOAuth2UserInfo userInfo = wxService.getOAuth2Service().getUserInfo(accessToken, null);
        return Result.success(userInfo);
    }


    /**
     * 签名
     *
     * @param url 1
     * @return
     * @throws WxErrorException
     */
    @SneakyThrows
    @GetMapping("/signature")
    public Result getSignature(@RequestParam String url)  {
        WxJsapiSignature signature = null;
        try {
            signature = wxService.createJsapiSignature(url);
        }catch (Exception e){
        }
        return Result.success(signature);
    }


}
