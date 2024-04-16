package com.tduck.cloud.webhook;

import com.tduck.cloud.webhook.constant.WebhookEventConstants;
import com.tduck.cloud.webhook.entity.WebhookConfigEntity;
import com.tduck.cloud.webhook.entity.WebhookEventEntity;
import com.tduck.cloud.webhook.service.sender.WebhookSenderService;

/**
 * @author : tduck
 * @since :  2023/03/27 17:56
 **/
public class WebhookSenderServiceTest {

    public static void main(String[] args) {
        WebhookSenderService webhookSenderService = new WebhookSenderService(null);
        webhookSenderService.init();
        WebhookConfigEntity webhookConfigEntity = new WebhookConfigEntity();
        webhookConfigEntity.setHookName("test");
        webhookConfigEntity.setSourceType("form");
        webhookConfigEntity.setSourceId("1");
        webhookConfigEntity.setUrl("http://localhost:8080/121212");
        webhookConfigEntity.setRequestType(WebhookConfigEntity.RequestTypeEnum.POST.toString());

        WebhookEventEntity webhookEventEntity = new WebhookEventEntity();
        webhookEventEntity.setEventType("form_data_add");
        webhookEventEntity.setSourceId("1");
        webhookEventEntity.setEventData("test");
        webhookEventEntity.setStatus(WebhookEventConstants.WEBHOOK_EVENT_STATUS_PENDING);
        webhookEventEntity.setRetryTimes(0);
        webhookEventEntity.setWebhookConfigId(1L);
        webhookEventEntity.setCreateTime(null);
        webhookEventEntity.setUpdateTime(null);
        webhookEventEntity.setLastError(null);
        webhookSenderService.sendWebhook(webhookConfigEntity, webhookEventEntity);
    }
}
