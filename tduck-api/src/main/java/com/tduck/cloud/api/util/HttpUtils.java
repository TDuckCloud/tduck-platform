package com.tduck.cloud.api.util;

import cn.hutool.core.util.CharUtil;
import cn.hutool.core.util.StrUtil;
import com.tduck.cloud.api.web.wrapper.BodyReaderHttpServletRequestWrapper;
import com.tduck.cloud.common.util.JsonUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * http 工具类 获取请求中的参数
 *
 * @author show
 * @date 14:23 2019/5/29
 */
public class HttpUtils {

    /**
     * 将URL的参数和body参数合并
     *
     * @param request
     * @author show
     * @date 14:24 2019/5/29
     */
    public static SortedMap<String, Object> getAllParams(BodyReaderHttpServletRequestWrapper request) throws Exception {

        SortedMap<String, Object> result = new TreeMap<>();
        //获取URL上的参数
        Map<String, Object> urlParams = getUrlParams(request);
        for (Map.Entry entry : urlParams.entrySet()) {
            result.put((String) entry.getKey(), entry.getValue());
        }
        Map<String, Object> allRequestParam = new HashMap<>(16);
        // get请求不需要拿body参数
        if (!HttpMethod.GET.name().equals(request.getMethod())) {
            allRequestParam = getAllRequestParam(request);
        }
        //将URL的参数和body参数进行合并
        if (allRequestParam != null) {
            for (Map.Entry entry : allRequestParam.entrySet()) {
                result.put((String) entry.getKey(), entry.getValue());
            }
        }
        return result;
    }

    /**
     * 获取 Body 参数
     *
     * @param request
     * @author show
     * @date 15:04 2019/5/30
     */
    public static Map<String, Object> getAllRequestParam(final BodyReaderHttpServletRequestWrapper request) throws Exception {
        //上传文件
        if (StrUtil.contains(request.getContentType(), MediaType.MULTIPART_FORM_DATA_VALUE)) {
            return null;
        }
        String body = IOUtils.toString(request.getInputStream(), "utf-8");
        if (StringUtils.isBlank(body)) {
            return null;
        }
        //转化成json对象
        return JsonUtils.jsonToMap(body);
    }

    /**
     * 将URL请求参数转换成Map
     *
     * @param request
     * @author show
     */
    public static Map<String, Object> getUrlParams(final BodyReaderHttpServletRequestWrapper request) {
        Map<String, Object> result = new HashMap<>(16);

        Enumeration<String> parameterNames = request.getParameterNames();

        while (parameterNames.hasMoreElements()) {
            String key = parameterNames.nextElement();
            result.put(key, request.getParameter(key));
        }
        return result;
    }


    /**
     * 获取请求IP地址
     *
     * @param request
     * @return
     */
    public static String getIpAddr(HttpServletRequest request) {
        if (request == null) {
            return "unknown";
        }
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Forwarded-For");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Real-IP");
        }

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        //"***.***.***.***".length() = 15
        if (StrUtil.isNotBlank(ip) && ip.length() > 15) {
            if (ip.indexOf(CharUtil.COMMA) > 0) {
                ip = ip.substring(0, ip.indexOf(","));
            }
        }
        //处理获取多个ip地址情况 nginx多层代理会出现多个ip 第一个为真实ip地址
        return "0:0:0:0:0:0:0:1".equals(ip) ? "127.0.0.1" : ip;
    }


}
