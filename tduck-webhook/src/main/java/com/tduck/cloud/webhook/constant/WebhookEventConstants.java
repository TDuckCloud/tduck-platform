package com.tduck.cloud.webhook.constant;

/**
 * @author : tduck
 * @since :  2023/03/27 15:45
 **/
public interface WebhookEventConstants {


    /**
     * webhook event_stauts
     */
    String WEBHOOK_EVENT_STATUS_PENDING = "pending";


    /**
     * 成功
     */
    String WEBHOOK_EVENT_STATUS_SUCCESS = "success";


    /***
     * 失败
     */
    String WEBHOOK_EVENT_STATUS_FAILED = "failed";


    /**
     * webhook配置来源 表单
     */
    String WEBHOOK_CONFIG_SOURCE_TYPE_FORM = "form";

    /**
     * 表单数据新增事件类型
     */
    String WEBHOOK_EVENT_TYPE_FORM_DATA_ADD = "form_data_add";
    String WEBHOOK_EVENT_TYPE_FORM_DATA_UPDATE = "form_data_update";
    String WEBHOOK_EVENT_TYPE_FORM_DATA_DELETE = "form_data_delete";
}
