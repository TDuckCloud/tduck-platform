package com.tduck.cloud.common.util;

import cn.hutool.core.convert.Convert;
import com.tduck.cloud.common.constant.CommonConstants;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import static com.tduck.cloud.common.constant.CommonConstants.USER_KEY;

/**
 * 安全工具类
 *
 * @author : tduck
 * @since :  2023/03/29 17:22
 **/
public class SecurityUtils {


    /**
     * 获取当前用户ID
     *
     * @return 用户ID
     */
    public static Long getUserId() {
       // 从request上下文中获取
        RequestAttributes attributes = RequestContextHolder.getRequestAttributes();
        return Convert.toLong(attributes.getAttribute(USER_KEY, RequestAttributes.SCOPE_REQUEST));
    }


    /**
     *  是否是超级管理员
     * @param userId 用户ID
     * @return true 是
     */
    public static boolean isAdmin(Long userId) {
        return userId.equals(CommonConstants.SUPER_ADMIN_ID);
    }



}
