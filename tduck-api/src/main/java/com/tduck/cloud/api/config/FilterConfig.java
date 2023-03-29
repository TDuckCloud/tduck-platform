package com.tduck.cloud.api.config;

import com.tduck.cloud.api.web.filter.HttpTraceLogFilter;
import com.tduck.cloud.api.web.filter.ValidateCodeFilter;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

import javax.servlet.DispatcherType;

/**
 * @author smalljop
 * @description 过滤器配置
 * @create 2019-01-29 16:27
 **/
@Configuration
@RequiredArgsConstructor
public class FilterConfig {


    private final PlatformSignProperties platformSignProperties;


    /**
     * 跨域过滤器
     *
     * @return
     */
    @Bean
    public FilterRegistrationBean corsFilterRegistration() {
        FilterRegistrationBean registration = new FilterRegistrationBean();
        registration.setDispatcherTypes(DispatcherType.REQUEST);
        CorsConfiguration config = new CorsConfiguration();
        config.addAllowedOrigin("*");
        config.addAllowedMethod("*");
        config.addAllowedHeader("*");
        UrlBasedCorsConfigurationSource corsConfigurationSource = new UrlBasedCorsConfigurationSource();
        corsConfigurationSource.registerCorsConfiguration("/**", config);
        CorsFilter corsFilter = new CorsFilter(corsConfigurationSource);
        registration.setOrder(Integer.MAX_VALUE - 4);
        registration.setFilter(corsFilter);
        return registration;
    }



    /**
     * 请求日志
     *
     * @return
     */
    @Bean
    @ConditionalOnProperty(prefix = "platform.request", name = "trace-log", havingValue = "true")
    public FilterRegistrationBean httpTraceLogFilterRegistration() {
        FilterRegistrationBean registration = new FilterRegistrationBean();
        registration.setDispatcherTypes(DispatcherType.REQUEST);
        registration.setFilter(new HttpTraceLogFilter());
        registration.addUrlPatterns("/*");
        registration.setName("httpTraceLogFilter");
        registration.setOrder(Integer.MAX_VALUE - 2);
        return registration;
    }


    /**
     * 验证码过滤器
     *
     * @return
     */
    @Bean
    @ConditionalOnProperty(prefix = "aj.captcha", name = "enable", havingValue = "true", matchIfMissing = true)
    public FilterRegistrationBean validateCodeFilterRegistration() {
        FilterRegistrationBean registration = new FilterRegistrationBean();
        registration.setDispatcherTypes(DispatcherType.REQUEST);
        registration.setFilter(new ValidateCodeFilter());
        registration.addUrlPatterns("/*");
        registration.setName("validateCodeFilter");
        registration.setOrder(Integer.MAX_VALUE - 1);
        return registration;
    }

}
