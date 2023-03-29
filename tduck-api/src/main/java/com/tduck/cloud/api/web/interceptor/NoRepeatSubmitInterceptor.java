package com.tduck.cloud.api.web.interceptor;

import cn.hutool.cache.CacheUtil;
import cn.hutool.cache.impl.TimedCache;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import com.tduck.cloud.api.annotation.NoRepeatSubmit;
import com.tduck.cloud.api.web.wrapper.BodyReaderHttpServletRequestWrapper;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @description: 不允许重复提交
 * @author: smalljop.o
 * @create: 2019-12-31 10:39
 **/
@Component
@Order
@Slf4j
@AllArgsConstructor
public class NoRepeatSubmitInterceptor implements HandlerInterceptor {


    private final TimedCache<String, String> caches = CacheUtil.newTimedCache(2000);

    @PostConstruct
    public void init() {
        caches.schedulePrune(5);
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (!handler.getClass().equals(HandlerMethod.class)) {
            return true;
        }

        HandlerMethod handlerMethod = (HandlerMethod) handler;
        boolean repeatSubmit = handlerMethod.getMethod().isAnnotationPresent(NoRepeatSubmit.class);
        if (repeatSubmit) {
            BodyReaderHttpServletRequestWrapper wrapper = null;
            if (request instanceof BodyReaderHttpServletRequestWrapper) {
                wrapper = (BodyReaderHttpServletRequestWrapper) request;
            } else {
                return true;
            }
            String body = wrapper.getBodyJson();
            String md5 = SecureUtil.md5(body);
            String requestURI = wrapper.getRequestURI();
            String key = new StringBuffer("repeat:").append(requestURI).append(":").append(md5).toString();
            //存在key认为是重复提交
            synchronized (key) {
                if (StrUtil.isNotBlank(caches.get(key))) {
                    log.info("无效重复提交key:{} body:{}", key, body);
                    return false;
                } else {
                    caches.put(key, "lock");
                }
            }
        }
        return true;
    }

}
