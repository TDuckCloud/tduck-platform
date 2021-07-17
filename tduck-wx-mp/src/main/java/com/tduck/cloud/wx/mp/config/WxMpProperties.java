package com.tduck.cloud.wx.mp.config;

import com.tduck.cloud.common.util.JsonUtils;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.List;

/**
 * wechat mp properties
 *
 * @author Binary Wang(https://github.com/binarywang)
 */
@Data
@ConfigurationProperties(prefix = "wx.mp")
public class WxMpProperties {
    /**
     * redis 存储 key前缀
     */
    private String redisConfigKeyPrefix;


    /**
     * 多个公众号配置信息
     */
    private List<MpConfig> configs;

    @Override
    public String toString() {
        return JsonUtils.objToJson(this);
    }

    @Data
    public static class MpConfig {
        /**
         * 设置微信公众号的appid
         */
        private String appId;

        /**
         * 设置微信公众号的app secret
         */
        private String secret;

        /**
         * 设置微信公众号的token
         */
        private String token;

        /**
         * 设置微信公众号的EncodingAESKey
         */
        private String aesKey;
    }
}
