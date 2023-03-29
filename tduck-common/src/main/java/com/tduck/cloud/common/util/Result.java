package com.tduck.cloud.common.util;

import cn.hutool.core.util.ObjectUtil;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tduck.cloud.common.constant.ResponseCodeConstants;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 响应信息主体
 *
 * @param <T>
 * @author smalljop
 */
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@Schema(description = "响应信息主体")
public class Result<T> implements Serializable {
    private static final long serialVersionUID = 1L;

    @Getter
    @Setter
    @Schema(description = "返回标记：成功标记=200，失败标记=500")
    private int code = ResponseCodeConstants.SUCCESS;

    @Getter
    @Setter
    @Schema(description = "返回信息")
    private String msg;


    @Getter
    @Setter
    @Schema(description = "数据")
    private T data;

    public static <T> Result<T> success() {
        return restResult(null, ResponseCodeConstants.SUCCESS, null);
    }

    public static <T> Result<T> success(T data) {
        return restResult(data, ResponseCodeConstants.SUCCESS, null);
    }

    public static <T> Result<T> success(T data, String msg) {
        return restResult(data, ResponseCodeConstants.SUCCESS, msg);
    }

    public static <T> Result<T> isSuccess(boolean flag) {
        return flag ? success() : failed();
    }

    public static <T> Result<T> failed() {
        return restResult(null, ResponseCodeConstants.FAIL, null);
    }


    public static <T> Result<T> failed(int code, String msg) {
        return restResult(null, code, msg);
    }

    public static <T> Result<T> failed(String msg) {
        return restResult(null, ResponseCodeConstants.FAIL, msg);
    }

    public static <T> Result<T> failed(String msg, T data) {
        return restResult(data, ResponseCodeConstants.FAIL, msg);
    }


    public static <T> Result<T> restResult(T data, int code, String msg) {
        Result<T> apiResult = new Result<>();
        apiResult.setCode(code);
        apiResult.setData(data);
        apiResult.setMsg(msg);
        return apiResult;
    }


    @JsonIgnore
    public Boolean isDataNull() {
        return ObjectUtil.isNull(data);
    }

}
