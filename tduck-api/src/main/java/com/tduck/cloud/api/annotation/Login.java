package com.tduck.cloud.api.annotation;

import java.lang.annotation.*;

/**
 * 登录验证 在需要登录才能调用的接口使用
 *
 * @author smalljop
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Login {
}
