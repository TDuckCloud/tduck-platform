package com.tduck.cloud.webhook.event;

import com.tduck.cloud.webhook.entity.WebhookConfigEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 发送测试webHook
 *
 * @author tduck
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SendTestWebhookEvent implements Serializable {


    private WebhookConfigEntity webhookConfig;


    /**
     * 事件类型
     */
    private String eventType;


}
