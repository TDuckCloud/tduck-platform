package com.tduck.cloud.api.web.controller;

import cn.hutool.core.util.StrUtil;
import com.google.common.collect.Sets;
import com.tduck.cloud.api.annotation.Login;
import com.tduck.cloud.api.util.HttpUtils;
import com.tduck.cloud.common.util.CacheUtils;
import com.tduck.cloud.common.util.JsonUtils;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.common.validator.ValidatorUtils;
import com.tduck.cloud.form.entity.UserFormNotifySettingEntity;
import com.tduck.cloud.form.entity.UserFormShareSettingEntity;
import com.tduck.cloud.form.entity.UserFormSubmitSettingEntity;
import com.tduck.cloud.form.entity.UserFormWriteSettingEntity;
import com.tduck.cloud.form.service.UserFormSettingService;
import com.tduck.cloud.wx.mp.constant.WxMpRedisKeyConstants;
import com.tduck.cloud.wx.mp.request.WxMpQrCodeGenRequest;
import com.tduck.cloud.wx.mp.service.WxMpUserService;
import com.tduck.cloud.wx.mp.vo.WxMpUserVO;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpQrCodeTicket;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author : smalljop
 * @description : 表单设置
 * @create : 2020-11-18 18:17
 **/
@Slf4j
@RestController
@RequiredArgsConstructor
public class UserFormSettingController {

    private final UserFormSettingService userFormSettingService;
    private final WxMpUserService wxMpUserService;
    private final WxMpService wxMpService;
    private final CacheUtils cacheUtils;

    /**
     * 表单提交设置保存
     *
     * @param settingEntity
     */
    @PostMapping("/user/form/submit-setting/save")
    public Result saveSubmitFormSetting(@RequestBody UserFormSubmitSettingEntity settingEntity) {
        ValidatorUtils.validateEntity(settingEntity);
        return Result.success(userFormSettingService.saveSubmitFormSetting(settingEntity));
    }


    /**
     * 表单提交设置查询
     *
     * @param formKey
     */
    @GetMapping("/user/form/submit-setting/{key}")
    public Result querySubmitSettingByKey(@PathVariable("key") String formKey) {
        return Result.success(userFormSettingService.getSubmitSettingByKey(formKey));
    }


    /**
     * 表单填写保存
     *
     * @param settingEntity
     */
    @PostMapping("/user/form/write-setting/save")
    public Result saveWriteFormSetting(@RequestBody UserFormWriteSettingEntity settingEntity) {
        ValidatorUtils.validateEntity(settingEntity);
        return Result.success(userFormSettingService.saveWriteFormSetting(settingEntity));
    }


    /**
     * 表单填写设置查询
     *
     * @param formKey
     */
    @GetMapping("/user/form/write-setting/{key}")
    public Result queryWriteSettingByKey(@PathVariable("key") String formKey) {
        return Result.success(userFormSettingService.getWriteSettingByKey(formKey));
    }

    /**
     * 表单通知保存
     *
     * @param settingEntity
     */
    @PostMapping("/user/form/notify-setting/save")
    public Result saveNotifyFormSetting(@RequestBody UserFormNotifySettingEntity settingEntity) {
        ValidatorUtils.validateEntity(settingEntity);
        return Result.success(userFormSettingService.saveNotifyFormSetting(settingEntity));
    }


    /**
     * 表单通知设置查询
     *
     * @param formKey
     */
    @GetMapping("/user/form/notify-setting/{key}")
    public Result queryNotifySettingByKey(@PathVariable("key") String formKey) {
        return Result.success(userFormSettingService.getNotifySettingByKey(formKey));
    }


    /**
     * 表单分享设置保存
     *
     * @param settingEntity
     */
    @Login
    @PostMapping("/user/form/share-setting/save")
    public Result saveShareFormSetting(@RequestBody UserFormShareSettingEntity settingEntity) {
        ValidatorUtils.validateEntity(settingEntity);
        return Result.success(userFormSettingService.saveShareFormSetting(settingEntity));
    }


    /**
     * 表单分享设置查询
     *
     * @param formKey
     */
    @GetMapping("/user/form/share-setting/{key}")
    public Result queryShareSettingByKey(@PathVariable("key") String formKey) {
        return Result.success(userFormSettingService.getShareSettingByKey(formKey));
    }


    /**
     * 当前填写设置的状态
     */
    @GetMapping("/user/form/setting-status")
    public Result querySettingStatus(@RequestParam String formKey, @RequestParam(required = false) String wxOpenId, HttpServletRequest request) {
        return userFormSettingService.getUserFormWriteSettingStatus(formKey, HttpUtils.getIpAddr(request), wxOpenId);
    }


    /**
     * 填写微信通知二维码
     */
    @SneakyThrows
    @GetMapping("/user/form/wx/notify-qrcode")
    public Result getWxNotifyQrCode(@RequestParam("key") String formKey)  {
        String loginSceneStr = JsonUtils.objToJson(new WxMpQrCodeGenRequest(WxMpQrCodeGenRequest.QrCodeType.SUB_NOTIFY, formKey));
        //5分钟有效
        WxMpQrCodeTicket ticket = wxMpService.getQrcodeService().qrCodeCreateTmpTicket(loginSceneStr, 10 * 60);
        String subNotifyQrcodeUrl = wxMpService.getQrcodeService().qrCodePictureUrl(ticket.getTicket());
        return Result.success(subNotifyQrcodeUrl);
    }


    /**
     * 填写微信通知二维码
     */
    @PostMapping("/user/form/wx/delete/notify-user")
    public Result deleteWxNotifyQrCode(@RequestParam("key") String key, @RequestParam("openId") String openId) {
        cacheUtils.removeList(StrUtil.format(WxMpRedisKeyConstants.WX_MP_SUB_NOTIFY, key), openId);
        return Result.success();
    }

    /**
     * 获取表单微信通知用户
     */
    @GetMapping("/user/form/wx/notify-user")
    public Result getWxNotifyUser(@RequestParam("key") String formKey, @RequestParam(required = false) String openIdStr) {
        Set<Object> subNotifyUsers = null;
        if (StrUtil.isNotBlank(openIdStr)) {
            subNotifyUsers = Sets.newHashSet(StrUtil.splitTrim(openIdStr, ";"));
        } else {
            List coll = cacheUtils.getList(StrUtil.format(WxMpRedisKeyConstants.WX_MP_SUB_NOTIFY, formKey), String.class);
            subNotifyUsers = Collections.singleton(coll.stream().collect(Collectors.toSet()));
        }
        return Result.success(wxMpUserService.listWxMpUserByOpenId(subNotifyUsers)
                .stream().map(item -> new WxMpUserVO(item.getNickname(), item.getHeadImgUrl(), item.getOpenId())).collect(Collectors.toList()));
    }


}