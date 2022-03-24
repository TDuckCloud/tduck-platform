package com.tduck.cloud.api.web.controller;

import cn.hutool.core.map.MapUtil;
import cn.hutool.core.thread.ThreadUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.tduck.cloud.api.annotation.Login;
import com.tduck.cloud.api.annotation.NoRepeatSubmit;
import com.tduck.cloud.api.util.HttpUtils;
import com.tduck.cloud.common.email.MailService;
import com.tduck.cloud.common.util.CacheUtils;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.common.validator.ValidatorUtils;
import com.tduck.cloud.form.entity.UserFormDataEntity;
import com.tduck.cloud.form.entity.UserFormEntity;
import com.tduck.cloud.form.entity.UserFormNotifySettingEntity;
import com.tduck.cloud.form.entity.UserFormWriteSettingEntity;
import com.tduck.cloud.form.request.QueryFormResultRequest;
import com.tduck.cloud.form.service.UserFormDataService;
import com.tduck.cloud.form.service.UserFormService;
import com.tduck.cloud.form.service.UserFormSettingService;
import com.tduck.cloud.form.util.FormDataImportUtils;
import com.tduck.cloud.wx.mp.service.WxMpUserMsgService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static com.tduck.cloud.form.constant.FormConstants.FORM_VIEW_COUNT;


/**
 * @author : smalljop
 * @description : 表单数据页 当前用户自己使用接口
 * @create : 2020-11-18 18:17
 **/

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/user/form/data")
public class UserFormResultController {
    private final UserFormService userFormService;
    private final UserFormDataService formResultService;
    private final UserFormSettingService userFormSettingService;
    private final MailService mailService;
    private final WxMpUserMsgService userMsgService;
    private final FormDataImportUtils formDataImportUtils;
    private final CacheUtils cacheUtils;


    /***
     * 查看表单
     *  记录查看的IP 统计查看用户数
     * @return
     */
    @GetMapping("view/{formKey}")
    public Result viewForm(HttpServletRequest request, @PathVariable("formKey") String formKey) {
        Long incr = cacheUtils.incr(StrUtil.format(FORM_VIEW_COUNT, formKey), 1);
        return Result.success();
    }

    /**
     * 查询数据
     *
     * @param request
     * @return
     */
    @PostMapping("query")
    public Result queryFormDataTable(@RequestBody QueryFormResultRequest request) {
        return Result.success(formResultService.listFormDataTable(request));
    }


    /**
     * 填写附件导出
     *
     * @param request
     * @return
     */
    @Login
    @PostMapping("/download/file")
    public Result downloadFormResultFile(@RequestBody QueryFormResultRequest request) {
        return formResultService.downloadFormResultFile(request);
    }

    /**
     * 填写
     *
     * @param entity
     * @param request
     * @return
     */
    @NoRepeatSubmit
    @PostMapping("/create")
    public Result createFormResult(@RequestBody UserFormDataEntity entity, HttpServletRequest request) {
        ValidatorUtils.validateEntity(entity);
        entity.setSubmitRequestIp(HttpUtils.getIpAddr(request));
        formResultService.saveFormResult(entity);
        ThreadUtil.execAsync(() -> {
            UserFormNotifySettingEntity notifySettingEntity = userFormSettingService.getNotifySettingByKey(entity.getFormKey());
            this.sendWriteResultNotify(notifySettingEntity, entity);
        });
        return Result.success();
    }


    /**
     * 公开填写
     *
     * @param entity
     * @param request
     * @return
     */
    @NoRepeatSubmit
    @PostMapping("/public/create")
    public Result createPublicFormResult(@RequestBody UserFormDataEntity entity, HttpServletRequest request) {
        ValidatorUtils.validateEntity(entity);
        entity.setSubmitRequestIp(HttpUtils.getIpAddr(request));
        Result<UserFormWriteSettingEntity> userFormSettingStatus = userFormSettingService.getUserFormWriteSettingStatus(entity.getFormKey(), entity.getSubmitRequestIp(), entity.getWxOpenId());
        if (StrUtil.isNotBlank(userFormSettingStatus.getMsg())) {
            return Result.failed(userFormSettingStatus.getMsg());
        }
        formResultService.saveFormResult(entity);
        ThreadUtil.execAsync(() -> {
            UserFormNotifySettingEntity notifySettingEntity = userFormSettingService.getNotifySettingByKey(entity.getFormKey());
            this.sendWriteResultNotify(notifySettingEntity, entity);
        });
        return Result.success();
    }


    @PostMapping("/delete/{formKey}")
    public Result deleteFormData(@RequestBody List<String> dataIdList, @PathVariable("formKey") String formKey) {
        formResultService.deleteByIds(dataIdList, formKey);
        return Result.success();
    }


    @NoRepeatSubmit
    @PostMapping("/update")
    public Result updateFormResult(@RequestBody UserFormDataEntity entity, HttpServletRequest request) {
        ValidatorUtils.validateEntity(entity);
        formResultService.updateFormResult(entity);
        return Result.success();
    }

    /**
     * 下载导入模板
     *
     * @param response
     * @param formKey
     */
    @GetMapping("/import/template")
    public void downloadImportTemplate(HttpServletResponse response, String formKey) {
        formDataImportUtils.importTemplateExcel(response, formKey);
    }


    /**
     * 导入表单数据
     *
     * @param file
     * @return
     */
    @PostMapping("import")
    public Result importFormData(@RequestParam("file") MultipartFile file, UserFormDataEntity dataEntity) throws IOException {
        return Result.success(formDataImportUtils.importFile(file.getInputStream(), dataEntity.getFormKey()));
    }


    private void sendWriteResultNotify(UserFormNotifySettingEntity settingEntity, UserFormDataEntity entity) {
        if (ObjectUtil.isNull(settingEntity)) {
            return;
        }
        String formKey = entity.getFormKey();
        UserFormEntity Form = userFormService.getByKey(formKey);
        if (StrUtil.isNotBlank(settingEntity.getNewWriteNotifyEmail())) {
            mailService.sendTemplateHtmlMail(settingEntity.getNewWriteNotifyEmail(), "新回复通知", "mail/form-write-notify", MapUtil.of("FormName", Form.getName()));
        }

        if (StrUtil.isNotBlank(settingEntity.getNewWriteNotifyWx())) {
            List<String> openIdList = StrUtil.splitTrim(settingEntity.getNewWriteNotifyWx(), ";");
            openIdList.stream().forEach(openId -> {
                userMsgService.sendKfTextMsg("", openId, "收到新的反馈，请去Pc端查看");
            });
        }
    }


}