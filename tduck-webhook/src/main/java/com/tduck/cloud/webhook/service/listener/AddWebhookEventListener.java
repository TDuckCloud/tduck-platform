package com.tduck.cloud.webhook.service.listener;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.BooleanUtil;
import cn.hutool.core.util.ObjectUtil;
import com.tduck.cloud.common.util.JsonUtils;
import com.tduck.cloud.webhook.constant.WebhookEventConstants;
import com.tduck.cloud.webhook.entity.WebhookConfigEntity;
import com.tduck.cloud.webhook.entity.WebhookEventEntity;
import com.tduck.cloud.webhook.event.AddWebhookEvent;
import com.tduck.cloud.webhook.service.WebhookConfigService;
import com.tduck.cloud.webhook.service.WebhookEventService;
import com.tduck.cloud.webhook.service.sender.WebhookSenderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

/**
 * 监听Webhook事件新增
 *
 * @author : tduck
 * @since :  2023/03/28 11:33
 **/
@Service
@Slf4j
@RequiredArgsConstructor
public class AddWebhookEventListener {

    private final WebhookConfigService webhookConfigService;

    private final WebhookSenderService webhookSenderService;

    private final WebhookEventService webhookEventService;

    /**
     * 操作日志记录
     *
     * @param webhookEvent 操作日志事件
     */
    @Async
    @EventListener
    public void recordWebhookConfig(AddWebhookEvent webhookEvent) {
        WebhookConfigEntity webhookConfig = webhookConfigService.getWebhookConfig(webhookEvent.getWebhookSourceType(), webhookEvent.getWebhookSourceId());
        if (ObjectUtil.isNull(webhookConfig) || BooleanUtil.isFalse(webhookConfig.getEnabled())) {
            log.debug("Webhook配置不存在，忽略事件:{}", webhookEvent.getWebhookSourceId());
            return;
        }
        // 是否开启了当前事件支持
        if (null != webhookConfig.getOtherOptions()
                && CollUtil.isNotEmpty(webhookConfig.getOtherOptions().getEventTypes())
                && !webhookConfig.getOtherOptions().getEventTypes().contains(webhookEvent.getEventType())) {
            return;
        }
        // 先入库 后期考虑定时任务做补偿
        WebhookEventEntity entity = new WebhookEventEntity();
        entity.setEventType(webhookEvent.getEventType());
        entity.setEventData(JsonUtils.objToJson(webhookEvent.getData()));
        entity.setStatus(WebhookEventConstants.WEBHOOK_EVENT_STATUS_PENDING);
        entity.setRetryTimes(0);
        entity.setSourceId(webhookEvent.getEventSourceId());
        entity.setCreateTime(LocalDateTime.now());
        entity.setUpdateTime(LocalDateTime.now());
        entity.setWebhookConfigId(webhookConfig.getId());
        boolean save = webhookEventService.save(entity);
        // 发送Webhook事件到指定的Webhook地址
        webhookSenderService.sendWebhook(webhookConfig, entity);
    }

}
