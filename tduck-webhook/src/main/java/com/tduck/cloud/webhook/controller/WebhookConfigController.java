package com.tduck.cloud.webhook.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.common.util.SpringContextUtils;
import com.tduck.cloud.common.validator.ValidatorUtils;
import com.tduck.cloud.webhook.constant.WebhookEventConstants;
import com.tduck.cloud.webhook.entity.WebhookConfigEntity;
import com.tduck.cloud.webhook.event.SendTestWebhookEvent;
import com.tduck.cloud.webhook.service.WebhookConfigService;
import com.tduck.cloud.webhook.service.sender.WebhookSenderService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * Webhook配置
 *
 * @author tduck-gen
 * @since 2023-03-27 13:50:06
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/webhook/config")
public class WebhookConfigController {

    private final WebhookConfigService webhookConfigService;
    private final WebhookSenderService webhookSenderService;

    /**
     * 获取Webhook配置详细信息
     */
    @GetMapping(value = "/")
    public Result<WebhookConfigEntity> getInfo(@RequestParam String sourceType, @RequestParam String sourceId) {
        return Result.success(webhookConfigService.getOne(Wrappers.<WebhookConfigEntity>lambdaQuery()
                .eq(WebhookConfigEntity::getSourceType, sourceType)
                .eq(WebhookConfigEntity::getSourceId, sourceId)));
    }

    /**
     * 新增Webhook配置
     */
    @PostMapping("save")
    public Result<Boolean> save(@RequestBody WebhookConfigEntity webhookConfig) {
        ValidatorUtils.validateEntity(webhookConfig);
        return Result.success(webhookConfigService.saveWebhookConfig(webhookConfig));
    }


    /**
     * 发送测试消息
     */
    @PostMapping("sendTest")
    public Result<Boolean> sendTest(@RequestBody WebhookConfigEntity webhookConfig) {
        // 暂时只有一种 固定下 以后有需要再改
        SendTestWebhookEvent sendTestWebhookEvent = new SendTestWebhookEvent(webhookConfig, WebhookEventConstants.WEBHOOK_EVENT_TYPE_FORM_DATA_ADD);
        SpringContextUtils.publishEvent(sendTestWebhookEvent);
        return Result.success(true);
    }

}
