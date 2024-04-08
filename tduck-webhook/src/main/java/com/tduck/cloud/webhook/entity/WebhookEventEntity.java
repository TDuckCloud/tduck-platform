package com.tduck.cloud.webhook.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.tduck.cloud.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Webhook事件对象 webhook_event
 *
 * @author tduck-gen
 * @date 2023-03-27 13:50:06
 */

@Data
@TableName("webhook_event")
@EqualsAndHashCode(callSuper = true)
public class WebhookEventEntity extends BaseEntity<WebhookEventEntity> {

    /**
     * 主键ID
     */
    private Long id;

    /**
     * 关联的Webhook配置ID
     */
    private Long webhookConfigId;


    /***
     * 来源数据Id
     */
    private String sourceId;
    /**
     * Webhook事件类型
     */
    private String eventType;

    /**
     * Webhook事件数据
     */
    private String eventData;

    /**
     * Webhook事件状态，如pending、success、failed等
     */
    private String status;

    /**
     * Webhook事件重试次数
     */
    private Integer retryTimes;

    /**
     * Webhook事件最后一次错误信息
     */
    private String lastError;


}
