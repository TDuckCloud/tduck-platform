package com.tduck.cloud.api.web.controller;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.lang.Validator;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.ReUtil;
import cn.hutool.core.util.StrUtil;
import com.google.common.collect.ImmutableMap;
import com.tduck.cloud.account.constant.AccountRedisKeyConstants;
import com.tduck.cloud.account.entity.UserEntity;
import com.tduck.cloud.account.entity.enums.AccountChannelEnum;
import com.tduck.cloud.account.request.AccountLoginRequest;
import com.tduck.cloud.account.request.QqLoginRequest;
import com.tduck.cloud.account.request.RegisterAccountRequest;
import com.tduck.cloud.account.request.RetrievePasswordRequest;
import com.tduck.cloud.account.service.UserService;
import com.tduck.cloud.account.service.UserValidateService;
import com.tduck.cloud.account.util.QqAuthorizationUtils;
import com.tduck.cloud.account.vo.LoginUserVO;
import com.tduck.cloud.api.annotation.NotLogin;
import com.tduck.cloud.api.util.HttpUtils;
import com.tduck.cloud.common.util.CacheUtils;
import com.tduck.cloud.common.util.JsonUtils;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.common.validator.ValidatorUtils;
import com.tduck.cloud.wx.mp.constant.WxMpRedisKeyConstants;
import com.tduck.cloud.wx.mp.request.WxMpQrCodeGenRequest;
import lombok.RequiredArgsConstructor;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpQrCodeTicket;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Optional;

/**
 * @author : smalljop
 * @description : 用户登录相关  注册 登录 找回密码
 * @create : 2020-11-10 18:14
 **/
@RequestMapping("/")
@RestController
@RequiredArgsConstructor
public class UserLoginController {

    private final UserService userService;
    private final WxMpService wxMpService;
    private final UserValidateService userValidateService;
    private final CacheUtils cacheUtils;
    private final QqAuthorizationUtils qqAuthorizationUtils;


    /**
     * 账号登录
     *
     * @return
     */
    @PostMapping("/login/account")
    @NotLogin
    public Result accountLogin(@RequestBody AccountLoginRequest request, HttpServletRequest httpRequest) {
        String ipAddr = HttpUtils.getIpAddr(httpRequest);
        request.setRequestIp(ipAddr);
        ValidatorUtils.validateEntity(request);
        if (ReUtil.isMatch(Validator.MOBILE, request.getAccount())
                || ReUtil.isMatch(Validator.EMAIL, request.getAccount())) {
            return userService.accountLogin(request);
        }
        return Result.failed("账号错误，请输入手机号或邮箱");
    }




    /**
     * 邮箱注册
     */
    @PostMapping("/register/email")
    @NotLogin
    public Result emailRegister(@RequestBody RegisterAccountRequest request) {
        Validator.validateEmail(request.getEmail(), "邮箱地址不正确");
        ValidatorUtils.validateEntity(request, RegisterAccountRequest.EmailGroup.class);
        return userService.emailRegister(request);
    }




    /**
     * 发送找回密码邮件
     */
    @GetMapping("/retrieve/password/email")
    @NotLogin
    public Result sendRetrievePwdEmail(@RequestParam String email) {
        Validator.validateEmail(email, "邮箱地址不正确");
        UserEntity userEntity = userService.getUserByEmail(email);
        if (ObjectUtil.isNull(userEntity)) {
            return Result.failed("该邮箱尚未注册");
        }
        userValidateService.sendResetPwdEmail(email, userEntity);
        return Result.success();
    }




    /**
     * 找回重设密码
     *
     * @param request
     * @return
     */
    @PostMapping("/retrieve/password/reset")
    @NotLogin
    public Result retrieveResetPassword(@RequestBody RetrievePasswordRequest.Reset request) {
        ValidatorUtils.validateEntity(request);
        String codeKey = StrUtil.format(AccountRedisKeyConstants.RETRIEVE_PWD_USER_CODE, request.getCode());
        Long userId = Convert.toLong(cacheUtils.getTemp(codeKey));
        if (ObjectUtil.isNull(userId)) {
            return Result.failed("重置密码操作已过期，请重试");
        }
        if (!request.getPassword().equals(request.getRePassword())) {
            return Result.failed("两次密码不一致");
        }
        userService.updatePassword(userId, request.getPassword());
        cacheUtils.removeTemp(codeKey);
        return Result.success();
    }


    /**
     * 发送邮箱验证码
     *
     * @return
     */
    @GetMapping("/register/email/code")
    @NotLogin
    public Result sendEmailCode(@RequestParam String email) {
        Validator.validateEmail(email, "邮箱地址不正确");
        userValidateService.sendEmailCode(email);
        return Result.success();
    }




    /**
     * 获取登录微信二维码
     *
     * @return
     */
    @GetMapping("/login/wx/qrcode")
    @NotLogin
    public Result getWxLoginQrcodeImg() throws WxErrorException {
        String loginId = IdUtil.simpleUUID();
        String loginSceneStr = JsonUtils.objToJson(new WxMpQrCodeGenRequest(WxMpQrCodeGenRequest.QrCodeType.LOGIN, loginId));
        //5分钟有效
        WxMpQrCodeTicket ticket = wxMpService.getQrcodeService().qrCodeCreateTmpTicket(loginSceneStr, 5 * 60);
        String loginQrcodeUrl = wxMpService.getQrcodeService().qrCodePictureUrl(ticket.getTicket());
        return Result.success(ImmutableMap.of("loginId", loginId, "qrCodeUrl", loginQrcodeUrl));
    }


    /**
     * 查询微信扫码登录结果
     *
     * @param loginId
     * @return
     */
    @GetMapping("/login/wx/qrcode/result")
    @NotLogin
    public Result<LoginUserVO> queryWxLoginResult(@RequestParam(required = false) String loginId, HttpServletRequest request) {
        if (StrUtil.isBlank(loginId)) {
            return Result.success();
        }
        Long userId = Convert.toLong(cacheUtils.getTemp(StrUtil.format(WxMpRedisKeyConstants.WX_MP_LOGIN_QRCODE, loginId)));
        if (ObjectUtil.isNull(userId)) {
            return Result.success();
        }
        UserEntity userEntity = userService.getById(userId);
        LoginUserVO loginUserVO = Optional.ofNullable(userEntity).isPresent() ?
                userService.getLoginResult(userEntity, AccountChannelEnum.WX_MP, HttpUtils.getIpAddr(request)) : null;
        return Result.success(loginUserVO);
    }

    /**
     * 获取qq授权登录的地址
     *
     * @return
     */
    @GetMapping("/login/qq/authorize/url")
    @NotLogin
    public Result getQQAuthorizeUrl(@RequestParam String redirectUri) {
        return Result.success(qqAuthorizationUtils.getAuthorizationCodeUrl(redirectUri));
    }

    /**
     * QQ登录或者绑定QQ
     *
     * @param request
     * @param httpRequest
     * @return
     */
    @PostMapping("/login/qq")
    @NotLogin
    public Result qqLogin(@RequestBody QqLoginRequest request, HttpServletRequest httpRequest) {
        String requestIp = HttpUtils.getIpAddr(httpRequest);
        request.setRequestIp(requestIp);
        return Result.success(userService.qqLogin(request));
    }


}
