package com.tduck.cloud.api.exception;

import com.tduck.cloud.common.exception.BaseException;

/**
 * @author : smalljop
 * @description : 授权异常
 * @create : 2020-11-27 14:37
 **/
public class AuthorizationException extends BaseException {
    public AuthorizationException(String msg) {
        super(msg);
    }
}
