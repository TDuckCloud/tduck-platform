package com.tduck.cloud.webhook.exception;

import com.tduck.cloud.common.exception.BaseException;

/**
 * 发送异常
 *
 * @author : tduck
 * @since :  2023/03/27 16:28
 **/
public class SendException extends BaseException {
    public SendException(String msg) {
        super(msg);
    }


}
