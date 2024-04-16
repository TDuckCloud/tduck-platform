package com.tduck.cloud.form.util;

import cn.hutool.core.map.MapUtil;
import com.tduck.cloud.common.util.SpringContextUtils;
import com.tduck.cloud.form.entity.UserFormDataEntity;
import com.tduck.cloud.form.service.data.FormDataBaseService;
import com.tduck.cloud.webhook.constant.WebhookEventConstants;
import com.tduck.cloud.webhook.event.AddWebhookEvent;
import lombok.experimental.UtilityClass;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 表单webhook工具
 */
@UtilityClass
public class FormWebHookUtils {


    /**
     * 数据保存 新增或者修改
     *
     * @param userFormData 数据
     * @param eventType    类型
     */
    public void pushFormDataSaveWebHook(UserFormDataEntity userFormData, String eventType) {
        AddWebhookEvent webhookEvent = new AddWebhookEvent();
        webhookEvent.setEventType(eventType);
        Map<String, Object> document = FormDataBaseService.convertDocument(userFormData);
        webhookEvent.setData(document);
        webhookEvent.setEventSourceId(userFormData.getId().toString());
        webhookEvent.setWebhookSourceId(userFormData.getFormKey());
        webhookEvent.setWebhookSourceType(WebhookEventConstants.WEBHOOK_CONFIG_SOURCE_TYPE_FORM);
        document.remove("_id");
        SpringContextUtils.publishEvent(webhookEvent);
    }

    /**
     * 删除数据事件
     */
    public void pushFormDataDeleteWebHook(List<String> ids, String formKey) {
        for (String id : ids) {
            AddWebhookEvent webhookEvent = new AddWebhookEvent();
            webhookEvent.setEventType(WebhookEventConstants.WEBHOOK_EVENT_TYPE_FORM_DATA_DELETE);
            HashMap<String, Object> params = MapUtil.newHashMap();
            params.put("id", id);
            params.put("formKey", formKey);
            webhookEvent.setData(params);
            webhookEvent.setEventSourceId(id);
            webhookEvent.setWebhookSourceId(formKey);
            webhookEvent.setWebhookSourceType(WebhookEventConstants.WEBHOOK_CONFIG_SOURCE_TYPE_FORM);
            SpringContextUtils.publishEvent(webhookEvent);

        }
    }


}
