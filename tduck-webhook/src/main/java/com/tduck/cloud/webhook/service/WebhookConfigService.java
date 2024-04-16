package com.tduck.cloud.webhook.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.tduck.cloud.webhook.entity.WebhookConfigEntity;

/**
 * Webhook配置Service接口
 *
 * @author tduck-gen
 * @date 2023-03-27 13:50:06
 */
public interface WebhookConfigService extends IService<WebhookConfigEntity> {


    /**
     * 保存Webhook配置
     *
     * @param webhookConfigEntity Webhook配置
     */
    Boolean saveWebhookConfig(WebhookConfigEntity webhookConfigEntity);

    /**
     * 获取Webhook配置
     *
     * @param sourceType 来源类型
     * @param sourceId   来源ID
     * @return Webhook配置
     */
    WebhookConfigEntity getWebhookConfig(String sourceType, String sourceId);
}
