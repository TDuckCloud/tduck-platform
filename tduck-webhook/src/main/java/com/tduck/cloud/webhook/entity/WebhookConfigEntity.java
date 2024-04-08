package com.tduck.cloud.webhook.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.mybatis.handler.JacksonTypeHandler;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;
import java.util.List;

/**
 * Webhook配置对象 webhook_config
 *
 * @author tduck-gen
 * @date 2023-03-27 13:50:06
 */
@Data
@TableName(value = "webhook_config", autoResultMap = true)
@EqualsAndHashCode(callSuper = true)
public class WebhookConfigEntity extends BaseEntity<WebhookConfigEntity> {

    /**
     * 主键ID
     */
    private Long id;

    /**
     * Webhook配置名称
     */
    private String hookName;

    /**
     * 配置的来源类型
     */
    @NotBlank
    private String sourceType;

    /**
     * 来源Id
     */
    @NotBlank
    private String sourceId;

    /**
     * Webhook的URL地址
     */
    @NotBlank
    private String url;

    /**
     * Webhook请求类型，如POST、GET等
     */
    private String requestType;


    /**
     * 是否启用
     */
    private Boolean enabled;


    /**
     * 其他Webhook配置，例如请求头等。以JSON格式存储
     */
    @TableField(typeHandler = JacksonTypeHandler.class)
    private OtherOptions otherOptions;


    @Data
    public static class OtherOptions {
        /**
         * 支持事件类型
         */
        private List<String> eventTypes;
    }


    /**
     * requestType 枚举
     */
    public enum RequestTypeEnum {
        /**
         * POST
         */
        POST,
        /**
         * Get
         */
        GET

    }


}
