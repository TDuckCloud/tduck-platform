package com.tduck.cloud.api.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.List;

/**
 * @author smalljop
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "platform.sign")
public class PlatformSignProperties {

    /**
     * 忽略验签地址
     */
    private List<String> ignoreUrls = new ArrayList<>();

    /**
     * 秘钥
     */
    private String secret;

}