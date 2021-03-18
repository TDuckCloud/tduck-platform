package com.tduck.cloud.api.web.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.thread.ThreadUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.google.common.collect.Sets;
import com.tduck.cloud.api.annotation.Login;
import com.tduck.cloud.api.annotation.NoRepeatSubmit;
import com.tduck.cloud.api.util.HttpUtils;
import com.tduck.cloud.common.constant.CommonConstants;
import com.tduck.cloud.common.email.MailService;
import com.tduck.cloud.common.util.JsonUtils;
import com.tduck.cloud.common.util.RedisUtils;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.common.validator.ValidatorUtils;
import com.tduck.cloud.common.validator.group.AddGroup;
import com.tduck.cloud.common.validator.group.UpdateGroup;
import com.tduck.cloud.project.constant.ProjectRedisKeyConstants;
import com.tduck.cloud.project.entity.*;
import com.tduck.cloud.project.entity.enums.ProjectStatusEnum;
import com.tduck.cloud.project.entity.struct.ItemDefaultValueStruct;
import com.tduck.cloud.project.request.OperateProjectItemRequest;
import com.tduck.cloud.project.request.QueryProjectResultRequest;
import com.tduck.cloud.project.request.SortProjectItemRequest;
import com.tduck.cloud.project.service.*;
import com.tduck.cloud.project.util.SortUtils;
import com.tduck.cloud.project.vo.ExportProjectResultVO;
import com.tduck.cloud.project.vo.OperateProjectItemVO;
import com.tduck.cloud.project.vo.UserProjectDetailVO;
import com.tduck.cloud.project.vo.UserProjectThemeVo;
import com.tduck.cloud.wx.mp.constant.WxMpRedisKeyConstants;
import com.tduck.cloud.wx.mp.request.WxMpQrCodeGenRequest;
import com.tduck.cloud.wx.mp.service.WxMpUserMsgService;
import com.tduck.cloud.wx.mp.service.WxMpUserService;
import com.tduck.cloud.wx.mp.vo.WxMpUserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpQrCodeTicket;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotBlank;
import java.io.IOException;
import java.sql.Struct;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import static com.tduck.cloud.project.constant.ProjectRedisKeyConstants.PROJECT_VIEW_IP_LIST;

/**
 * @author : smalljop
 * @description : 项目
 * @create : 2020-11-18 18:17
 **/
@RequiredArgsConstructor
@RestController
@RequestMapping("/user/project/result")
@Slf4j
public class UserProjectResultController {

    private final UserProjectService projectService;
    private final UserProjectResultService projectResultService;
    private final UserProjectSettingService userProjectSettingService;
    private final MailService mailService;
    private final WxMpUserMsgService userMsgService;
    private final RedisUtils redisUtils;

    /***
     * 查看项目
     *  记录查看的IP 统计查看用户数
     * @return
     */
    @PostMapping("view/{projectKey}")
    public Result viewProject(HttpServletRequest request, @PathVariable("projectKey") String projectKey) {
        String ip = HttpUtils.getIpAddr(request);
        Integer count = Convert.toInt(redisUtils.hmGet(StrUtil.format(PROJECT_VIEW_IP_LIST, projectKey), ip), CommonConstants.ConstantNumber.ZERO);
        redisUtils.hmSet(StrUtil.format(PROJECT_VIEW_IP_LIST, projectKey), ip, count + CommonConstants.ConstantNumber.ONE);
        return Result.success();
    }


    /**
     * 填写
     *
     * @param entity
     * @param request
     * @return
     */
    @PostMapping("/create")
    @NoRepeatSubmit
    @Login
    public Result createProjectResult(@RequestBody UserProjectResultEntity entity, HttpServletRequest request) {
        Result<UserProjectSettingEntity> userProjectSettingStatus = userProjectSettingService.getUserProjectSettingStatus(entity.getProjectKey(), HttpUtils.getIpAddr(request));
        if (StrUtil.isNotBlank(userProjectSettingStatus.getMsg())) {
            return Result.failed(userProjectSettingStatus.getMsg());
        }
        entity.setSubmitRequestIp(HttpUtils.getIpAddr(request));
        ValidatorUtils.validateEntity(entity);
        projectResultService.saveProjectResult(entity);
        ThreadUtil.execAsync(() -> {
            UserProjectSettingEntity settingEntity = userProjectSettingStatus.isDataNull() ? null : userProjectSettingStatus.getData();
            this.sendWriteResultNotify(settingEntity, entity);
        });
        return Result.success();
    }

    /**
     * 填写结果excel导出
     *
     * @param request
     * @return
     */
    @GetMapping("/export")
    public void exportProjectResult(QueryProjectResultRequest request, HttpServletResponse response) throws IOException {
        ExportProjectResultVO exportProjectResultVO = projectResultService.exportProjectResult(request);
        // 通过工具类创建writer，默认创建xls格式
        ExcelWriter writer = ExcelUtil.getWriter();
        //自定义标题别名
        exportProjectResultVO.getTitleList().forEach(item -> {
            writer.addHeaderAlias(item.getFieldKey(), item.getTitle());
        });
        // 一次性写出内容，使用默认样式，强制输出标题
        writer.write(exportProjectResultVO.getResultList(), true);
        //out为OutputStream，需要写出到的目标流
        //response为HttpServletResponse对象
        response.setContentType("application/vnd.ms-excel;charset=utf-8");
        //test.xls是弹出下载对话框的文件名，不能为中文，中文请自行编码
        response.setHeader("Content-Disposition", "attachment;filename=test.xls");
        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        // 关闭writer，释放内存
        writer.close();
        //此处记得关闭输出Servlet流
        IoUtil.close(out);
    }


    /**
     * 结果分页
     *
     * @param request
     * @return
     */
    @GetMapping("/page")
    @Login
    public Result queryProjectResults(QueryProjectResultRequest request) {
        return Result.success(projectResultService.listByQueryConditions(request));
    }

    private void sendWriteResultNotify(UserProjectSettingEntity settingEntity, UserProjectResultEntity entity) {
        if (ObjectUtil.isNull(settingEntity)) {
            return;
        }
        String projectKey = entity.getProjectKey();
        UserProjectEntity project = projectService.getByKey(projectKey);
        if (StrUtil.isNotBlank(settingEntity.getNewWriteNotifyEmail())) {
            mailService.sendTemplateHtmlMail(settingEntity.getNewWriteNotifyEmail(), "新回复通知", "mail/project-write-notify", MapUtil.of("projectName", project.getName()));
        }

        if (StrUtil.isNotBlank(settingEntity.getNewWriteNotifyWx())) {
            List<String> openIdList = StrUtil.splitTrim(settingEntity.getNewWriteNotifyWx(), ";");
            openIdList.stream().forEach(openId -> {
                userMsgService.sendKfTextMsg("", openId, "收到新的反馈，请去Pc端查看");
            });
        }
    }


}