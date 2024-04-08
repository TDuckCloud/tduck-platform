package com.tduck.cloud.webhook.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tduck.cloud.webhook.entity.WebhookEventEntity;
import com.tduck.cloud.webhook.mapper.WebhookEventMapper;
import com.tduck.cloud.webhook.service.WebhookEventService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * Webhook事件Service业务层处理
 *
 * @author tduck-gen
 * @date 2023-03-27 13:50:06
 */
@Service
@Slf4j
@RequiredArgsConstructor
public class WebhookEventServiceImpl extends ServiceImpl<WebhookEventMapper, WebhookEventEntity> implements WebhookEventService {





}
