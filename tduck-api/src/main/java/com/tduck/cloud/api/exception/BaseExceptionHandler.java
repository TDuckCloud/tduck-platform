package com.tduck.cloud.api.exception;

import cn.hutool.core.exceptions.ValidateException;
import com.tduck.cloud.common.constant.ResponseCodeConstants;
import com.tduck.cloud.common.util.Result;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.error.WxErrorException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.NoHandlerFoundException;

/**
 * 异常处理器
 *
 * @author smalljop
 */
@RestControllerAdvice
@Slf4j
public class BaseExceptionHandler {


    @ExceptionHandler(NoHandlerFoundException.class)
    public Result handlerNoFoundException(NoHandlerFoundException e) {
        log.error(e.getMessage(), e);
        return Result.failed(ResponseCodeConstants.NOT_FOUND, "路径不存在，请检查路径是否正确");
    }


    @ExceptionHandler(AuthorizationException.class)
    public Result handlerAuthorizationException(AuthorizationException e) {
        log.error(e.getMessage(), e);
        return Result.failed(ResponseCodeConstants.UNAUTHORIZED, "登录状态过期");
    }


    @ExceptionHandler(DuplicateKeyException.class)
    public Result handleDuplicateKeyException(DuplicateKeyException e) {
        log.error(e.getMessage(), e);
        return Result.failed("数据库中已存在该记录");
    }

    @ExceptionHandler({ValidateException.class})
    public Result handleValidateException(ValidateException e) {
        log.error(e.getMessage(), e);
        return Result.failed(e.getMessage());
    }

    @ResponseBody
    @ExceptionHandler(value = MissingServletRequestParameterException.class)
    public Object exceptionHandler(MissingServletRequestParameterException e) {
        log.error("System Exception:{}", e.getMessage());
        return Result.failed(e.getMessage());
    }

    /**
     * 处理微信异常
     * 没有配置错误也不返回500给前端 降低使用配置
     */
    @ExceptionHandler(WxErrorException.class)
    public Result handleWxException(WxErrorException e) {
        log.error(e.getMessage(), e);
        return Result.success(e.getMessage());
    }


    @ExceptionHandler(Exception.class)
    public Result handleException(Exception e) {
        log.error(e.getMessage(), e);
        return Result.failed(e.getMessage());
    }
}
