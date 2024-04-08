package com.tduck.cloud.webhook.service.impl;

import cn.hutool.cache.Cache;
import cn.hutool.cache.CacheUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tduck.cloud.webhook.entity.WebhookConfigEntity;
import com.tduck.cloud.webhook.mapper.WebhookConfigMapper;
import com.tduck.cloud.webhook.service.WebhookConfigService;
import org.springframework.stereotype.Service;

/**
 * Webhook配置Service业务层处理
 *
 * @author tduck-gen
 * @date 2023-03-27 13:50:06
 */
@Service
public class WebhookConfigServiceImpl extends ServiceImpl<WebhookConfigMapper, WebhookConfigEntity> implements WebhookConfigService {

    static Cache<String, WebhookConfigEntity> lfuCache = CacheUtil.newLFUCache(200);


    @Override
    public Boolean saveWebhookConfig(WebhookConfigEntity webhookConfigEntity) {
        WebhookConfigEntity webhookConfig = this.getOne(Wrappers.<WebhookConfigEntity>lambdaQuery()
                .eq(WebhookConfigEntity::getSourceType, webhookConfigEntity.getSourceType())
                .eq(WebhookConfigEntity::getSourceId, webhookConfigEntity.getSourceId()));
        if (null != webhookConfig) {
            webhookConfigEntity.setId(webhookConfig.getId());
            this.updateById(webhookConfigEntity);
        } else {
            this.save(webhookConfigEntity);
        }
        lfuCache.put(webhookConfigEntity.getSourceType() + webhookConfigEntity.getSourceId(), webhookConfigEntity);
        return true;
    }

    /**
     * 获取Webhook配置
     *
     * @param sourceType 来源类型
     * @param sourceId   来源ID
     * @return Webhook配置
     */
    @Override
    public WebhookConfigEntity getWebhookConfig(String sourceType, String sourceId) {
        WebhookConfigEntity webhookEvent = null;
        String key = sourceType + sourceId;
        // 从缓存中获取
        if (lfuCache.containsKey(key)) {
            webhookEvent = lfuCache.get(key);
        } else {
            webhookEvent = this.getOne(Wrappers.<WebhookConfigEntity>lambdaQuery()
                    .eq(WebhookConfigEntity::getSourceType, sourceType)
                    .eq(WebhookConfigEntity::getSourceId, sourceId));
            lfuCache.put(key, webhookEvent);
        }
        return webhookEvent;
    }
}
