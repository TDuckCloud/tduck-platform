package com.tduck.cloud.api.config;

import com.google.common.collect.Lists;
import com.tduck.cloud.api.web.interceptor.AuthorizationInterceptor;
import com.tduck.cloud.api.web.interceptor.NoRepeatSubmitInterceptor;
import com.tduck.cloud.api.web.resolver.LoginUserHandlerMethodArgumentResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

/**
 * @author hasee
 */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Autowired
    private AuthorizationInterceptor authorizationInterceptor;

    @Autowired
    private NoRepeatSubmitInterceptor noRepeatSubmitInterceptor;

    @Autowired
    private LoginUserHandlerMethodArgumentResolver loginUserHandlerMethodArgumentResolver;

    //html静态资源   js静态资源    css静态资源
    private final List<String> staticResources = Lists.newArrayList("/**/*.html",
            "/**/*.js",
            "/**/*.css",
            "/**/*.woff",
            "/**/*.ttf");

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //所有路径都被拦截
        registry.addInterceptor(noRepeatSubmitInterceptor).addPathPatterns("/**").excludePathPatterns(staticResources);
        registry.addInterceptor(authorizationInterceptor).addPathPatterns("/**").excludePathPatterns(staticResources);
    }

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
        argumentResolvers.add(loginUserHandlerMethodArgumentResolver);
    }
}