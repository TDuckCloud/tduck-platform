package com.tduck.cloud.api.web.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.lang.Validator;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.digest.DigestUtil;
import com.tduck.cloud.account.constant.AccountRedisKeyConstants;
import com.tduck.cloud.account.entity.UserAuthorizeEntity;
import com.tduck.cloud.account.entity.UserEntity;
import com.tduck.cloud.account.entity.enums.UserAuthorizeTypeEnum;
import com.tduck.cloud.account.request.QqLoginRequest;
import com.tduck.cloud.account.request.UpdateUserRequest;
import com.tduck.cloud.account.service.UserAuthorizeService;
import com.tduck.cloud.account.service.UserService;
import com.tduck.cloud.account.service.UserValidateService;
import com.tduck.cloud.account.vo.UserDetailVO;
import com.tduck.cloud.api.annotation.Login;
import com.tduck.cloud.api.annotation.LoginUser;
import com.tduck.cloud.common.util.JsonUtils;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.common.validator.ValidatorUtils;
import com.tduck.cloud.wx.mp.entity.WxMpUserEntity;
import com.tduck.cloud.wx.mp.request.WxMpQrCodeGenRequest;
import com.tduck.cloud.wx.mp.service.WxMpUserService;
import lombok.RequiredArgsConstructor;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpQrCodeTicket;
import org.springframework.web.bind.annotation.*;

/**
 * @author : smalljop
 * @description :
 * @create : 2020-12-18 15:50
 **/
@RequestMapping("/user")
@RestController
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    private final UserAuthorizeService userAuthorizeService;
    private final WxMpUserService wxMpUserService;
    private final UserValidateService userValidateService;
    private final WxMpService wxMpService;

    /***
     * 当前登录用户详情
     * @param userId
     * @return
     */
    @Login
    @GetMapping("/current/detail")
    public Result queryCurrentUser(@RequestAttribute Long userId) {
        UserEntity userEntity = userService.getById(userId);
        UserDetailVO userDetailVO = new UserDetailVO();
        BeanUtil.copyProperties(userEntity, userDetailVO);
        //第三方账号信息
        UserAuthorizeEntity authorizeEntity = userAuthorizeService.getByUserId(UserAuthorizeTypeEnum.QQ, userId);
        if (ObjectUtil.isNotNull(authorizeEntity)) {
            userDetailVO.setQqName(authorizeEntity.getUserName());
        }
        WxMpUserEntity wxMpUserEntity = wxMpUserService.getByUserId(userId);
        if (ObjectUtil.isNotNull(wxMpUserEntity)) {
            userDetailVO.setWxName(wxMpUserEntity.getNickname());
        }
        return Result.success(userDetailVO);
    }


    /***
     * 修改当前用户信息
     * @param userEntity
     * @return
     */
    @Login
    @PostMapping("/update")
    public Result updateUser(@RequestBody UserEntity userEntity, @RequestAttribute Long userId) {
        userEntity.setPassword(null);
        userEntity.setId(userId);
        return Result.success(userService.updateById(userEntity));
    }


    /**
     * 发送绑定邮箱邮件
     *
     * @return
     */
    @GetMapping("/update-email/msg")
    @Login
    public Result sendUpdateEmailMsg(@RequestParam String email, @RequestAttribute Long userId) {
        Validator.validateEmail(email, "邮箱地址不正确");
        UserEntity userEntity = userService.getUserByEmail(email);
        if (ObjectUtil.isNotNull(userEntity)) {
            return Result.failed("该邮箱已被绑定");
        }
        userValidateService.sendUpdateAccountEmail(email, userId);
        return Result.success(true);
    }


    /**
     * 修改邮箱
     *
     * @return
     */
    @PostMapping("/update/email")
    public Result updateUserEmail(@RequestBody UpdateUserRequest.Email request) {
        Validator.validateEmail(request.getEmail(), "邮箱地址不正确");
        UserEntity userEntity = userService.getUserByEmail(request.getEmail());
        if (ObjectUtil.isNotNull(userEntity)) {
            return Result.failed("该邮箱已被绑定");
        }
        Long userId = userValidateService.getUpdateEmailUserId(request);
        if (ObjectUtil.isNull(userId)) {
            return Result.success(false);
        }
        userEntity = new UserEntity();
        userEntity.setId(userId);
        userEntity.setEmail(request.getEmail());
        userService.updateById(userEntity);
        return Result.success(true);
    }

    /**
     * 修改手机号验证码
     *
     * @return
     */
    @GetMapping("/update-phone/code")
    public Result sendUpdatePhoneCode(@RequestParam String phoneNumber) {
        Validator.validateMobile(phoneNumber, "手机号码不正确");
        UserEntity userEntity = userService.getUserByPhoneNumber(phoneNumber);
        if (ObjectUtil.isNotNull(userEntity)) {
            return Result.failed("该手机号已被绑定");
        }
        userValidateService.sendPhoneCode(phoneNumber);
        return Result.success();
    }


    /**
     * 绑定微信二维码
     *
     * @return
     */
    @Login
    @GetMapping("/bind/wx/qrcode")
    public Result getBindWxQrcode(@RequestAttribute Long userId) throws WxErrorException {
        String bindSceneStr = JsonUtils.objToJson(new WxMpQrCodeGenRequest(WxMpQrCodeGenRequest.QrCodeType.BIND_ACCOUNT, String.valueOf(userId)));
        //5分钟有效
        WxMpQrCodeTicket ticket = wxMpService.getQrcodeService().qrCodeCreateTmpTicket(bindSceneStr, 10 * 60);
        String bindAccountQrcodeUrl = wxMpService.getQrcodeService().qrCodePictureUrl(ticket.getTicket());
        return Result.success(bindAccountQrcodeUrl);
    }

    /**
     * 修改手机号
     *
     * @return
     */
    @Login
    @PostMapping("/update/phone-number")
    public Result updatePhoneNumber(@RequestBody UpdateUserRequest.PhoneNumber request, @RequestAttribute Long userId) {
        ValidatorUtils.validateEntity(request);
        Validator.validateMobile(request.getPhoneNumber(), "手机号码不正确");
        //检查验证码是否正确
        Boolean checkPhoneCode = userValidateService.checkPhoneCode(request.getPhoneNumber(), request.getCode());
        if (checkPhoneCode) {
            return Result.failed("验证码错误");
        }
        UserEntity userEntity = new UserEntity();
        userEntity.setId(userId);
        userEntity.setPhoneNumber(request.getPhoneNumber());
        userService.updateById(userEntity);
        return Result.success();
    }


    /**
     * 修改密码e
     *
     * @return
     */
    @PostMapping("/update/password")
    @Login
    public Result updatePassword(@RequestBody UpdateUserRequest.Password request, @LoginUser UserEntity userEntity) {
        ValidatorUtils.validateEntity(request);
        if (!userEntity.getPassword().equals(DigestUtil.sha256Hex(request.getOldPassword()))) {
            return Result.failed("旧密码错误");
        }
        if (!request.getPassword().equals(request.getRepeatPassword())) {
            return Result.failed("两次密码不一致");
        }
        userService.updatePassword(userEntity.getId(), request.getPassword());
        return Result.success();
    }

    /**
     * 绑定qq账号
     *
     * @return
     */

    @Login
    @PostMapping("/bind/qq")
    public Result bindQQAccount(@RequestBody QqLoginRequest request, @RequestAttribute Long userId) {
        UserAuthorizeEntity authorizeEntity = userAuthorizeService.getQqAuthorization(request.getAuthorizeCode(), request.getRedirectUri(), new UserEntity());
        if (ObjectUtil.isNotNull(authorizeEntity.getUserId()) && userId.equals(authorizeEntity.getUserId())) {
            return Result.success(false);
        }
        //更新绑定
        authorizeEntity.setUserId(userId);
        userAuthorizeService.updateById(authorizeEntity);
        return Result.success();
    }


}
