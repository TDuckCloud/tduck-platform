package com.tduck.cloud.api.web.filter;

import cn.hutool.core.util.StrUtil;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.tduck.cloud.api.web.wrapper.BodyReaderHttpServletRequestWrapper;
import com.tduck.cloud.common.constant.CommonConstants;
import com.tduck.cloud.common.util.JsonUtils;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.core.Ordered;
import org.springframework.http.HttpStatus;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.util.ContentCachingResponseWrapper;
import org.springframework.web.util.WebUtils;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.time.LocalDateTime;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * 请求链路日志过滤器
 *
 * @author smalljop
 */
@Slf4j
public class HttpTraceLogFilter extends OncePerRequestFilter implements Ordered {

    private static final String IGNORE_CONTENT_TYPE = "multipart/form-data";

    /**
     * 忽略地址
     *
     * @return
     */
    private List<String> ignoreUrls = Lists.newArrayList(
            "/api/webjars/**",
            "/swagger-resources/**",
            "/doc.html",
            "/api/v2/api-docs"
    );


    @Override
    public int getOrder() {
        return LOWEST_PRECEDENCE - 10;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        String path = request.getRequestURI();
        //忽略地址
        AntPathMatcher matcher = new AntPathMatcher();
        boolean existsMatch = false;
        for (String pattern : ignoreUrls) {
            boolean match = matcher.match(pattern, path);
            if (match) {
                existsMatch = true;
                break;
            }
        }
        if (existsMatch) {
            filterChain.doFilter(request, response);
            return;
        }
        /**
         * 验证url合法
         */
        if (!isRequestValid(request)) {
            filterChain.doFilter(request, response);
            return;
        }
        //包装类

        if (!(response instanceof ContentCachingResponseWrapper)) {
            response = new ContentCachingResponseWrapper(response);
        }
        int status = HttpStatus.INTERNAL_SERVER_ERROR.value();
        long startTime = System.currentTimeMillis();
        try {
            filterChain.doFilter(request, response);
            status = response.getStatus();
        } finally {

            if (!Objects.equals(IGNORE_CONTENT_TYPE, request.getContentType())) {
                //1. 记录日志
                HttpTraceLog traceLog = new HttpTraceLog();
                traceLog.setPath(path);
                traceLog.setMethod(request.getMethod());
                long latency = System.currentTimeMillis() - startTime;
                traceLog.setTimeTaken(latency);
                Enumeration<String> headerNames = request.getHeaderNames();
                Map<String, Object> headersMap = Maps.newHashMap();
                while (headerNames.hasMoreElements()) {
                    String s = headerNames.nextElement();
                    headersMap.put(s, request.getHeader(s));
                }
                traceLog.setRequestHeaders(JsonUtils.objToJson(headersMap));
                traceLog.setTime(LocalDateTime.now().toString());
                traceLog.setParameterMap(JsonUtils.objToJson(request.getParameterMap()));
                traceLog.setStatus(status);
                traceLog.setRequestBody(getRequestBody(request));
                traceLog.setResponseBody(getResponseBody(response));
                log.info("{}", JsonUtils.objToJson(traceLog));
            }
            updateResponse(response);
        }
    }


    private boolean isRequestValid(HttpServletRequest request) {
        try {
            new URI(request.getRequestURL().toString());
            return true;
        } catch (URISyntaxException ex) {
            return false;
        }
    }

    private String getRequestBody(HttpServletRequest request) {
        BodyReaderHttpServletRequestWrapper requestWrapper = null;
        if (!(request instanceof BodyReaderHttpServletRequestWrapper)) {
            try {
                requestWrapper = new BodyReaderHttpServletRequestWrapper(request);
                return requestWrapper.getBodyJson();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return StrUtil.EMPTY;
    }

    private String getResponseBody(HttpServletResponse response) {
        /**
         * 下载文件不获取
         */
        if (StringUtils.isNotBlank(response.getContentType()) &&
                response.getContentType().equalsIgnoreCase(CommonConstants.FILE_DOWNLOAD_CONTENT_TYPE)) {
            return "";
        }
        String responseBody = "";
        ContentCachingResponseWrapper wrapper = WebUtils.getNativeResponse(response, ContentCachingResponseWrapper.class);
        if (wrapper != null) {
            try {
                responseBody = IOUtils.toString(wrapper.getContentAsByteArray(), "UTF-8");
            } catch (IOException e) {
                log.error("getResponseBody IOException", e);
            }
        }
        return responseBody;
    }

    private void updateResponse(HttpServletResponse response) throws IOException {
        ContentCachingResponseWrapper responseWrapper = WebUtils.getNativeResponse(response, ContentCachingResponseWrapper.class);
        Objects.requireNonNull(responseWrapper).copyBodyToResponse();
    }


    @Data
    public static class HttpTraceLog {
        private String path;
        private String parameterMap;
        private String requestHeaders;
        private String method;
        private Long timeTaken;
        private String time;
        private Integer status;
        private String requestBody;
        private String responseBody;
    }


}
