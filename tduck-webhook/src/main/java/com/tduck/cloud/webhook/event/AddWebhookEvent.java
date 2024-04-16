package com.tduck.cloud.webhook.event;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 新增Webhook事件
 *
 * @author tduck
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AddWebhookEvent {

    /**
     * 来源类型 用来查询对应的配置 区分是什么业务的webhook
     */
    private String webhookSourceType;


    /**
     * 来源ID  用来查询对应的配置
     */
    private String webhookSourceId;


    /**
     * 事件类型
     */
    private String eventType;


    private String eventSourceId;

    /**
     * 数据
     */
    private Object data;


}
