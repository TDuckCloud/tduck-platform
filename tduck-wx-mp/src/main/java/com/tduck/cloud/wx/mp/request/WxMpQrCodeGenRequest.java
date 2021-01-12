package com.tduck.cloud.wx.mp.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * 微信公众号二维码生成请求
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class WxMpQrCodeGenRequest {
    private QrCodeType type;

    private String data;


    @AllArgsConstructor
    public enum QrCodeType {
        LOGIN("login"),
        BIND_ACCOUNT("bindAccount"),
        SUB_NOTIFY("subNotify");

        @Getter
        private String key;
    }
}
