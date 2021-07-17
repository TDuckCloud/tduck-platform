package com.tduck.cloud.api.web.filter;

import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.ObjectUtil;
import com.tduck.cloud.api.config.PlatformSignProperties;
import com.tduck.cloud.api.util.HttpUtils;
import com.tduck.cloud.api.util.ResponseUtils;
import com.tduck.cloud.api.util.SignUtils;
import com.tduck.cloud.api.web.wrapper.BodyReaderHttpServletRequestWrapper;
import com.tduck.cloud.common.constant.ResponseCodeConstants;
import com.tduck.cloud.common.util.Result;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.SortedMap;

/**
 * @description: 签名认证接口
 * @author: smalljop
 * @create: 2019-12-09 13:51
 **/
@Slf4j
@Data
public class SignAuthFilter implements Filter {

    private final static String TIMESTAMP_KEY_NAME = "timestamp";
    /**
     * 最大有效时间 默认 10秒钟失效 超出10s失效
     */
    private final static Long MAX_EFFECTIVE_TIMESTAMP = 10L * 1000;
    private PlatformSignProperties platformSignProperties;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {

        //是否配置了过滤
        AntPathMatcher matcher = new AntPathMatcher();
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        boolean existsMatch = false;
        for (String pattern : platformSignProperties.getIgnoreUrls()) {
            boolean match = matcher.match(pattern, httpServletRequest.getRequestURI());
            if (match) {
                existsMatch = true;
                break;
            }
        }
        // debug模式
        if (existsMatch) {
            filterChain.doFilter(request, response);
            return;
        } else {
            //包装request  获取里面包含的内容
            BodyReaderHttpServletRequestWrapper requestWrapper = null;
            if (!(request instanceof BodyReaderHttpServletRequestWrapper)) {
                requestWrapper = new BodyReaderHttpServletRequestWrapper(
                        (HttpServletRequest) request);
            }
            if (requestWrapper.getMethod().equals(RequestMethod.OPTIONS.name())) {
                return;
            }
            //获取全部参数
            SortedMap<String, Object> allParams = null;
            try {
                allParams = HttpUtils.getAllParams(requestWrapper);
            } catch (Exception e) {
                e.printStackTrace();
            }
            //取出时间戳 做超时校验
            Long timestamp = MapUtil.getLong(allParams, TIMESTAMP_KEY_NAME);
            if (ObjectUtil.isNull(timestamp)) {
                ResponseUtils.outJson(response, Result.failed(ResponseCodeConstants.SIGN_FAIL_CODE, ResponseCodeConstants.SIGN_FAIL_MSG));
                return;
            }
            Long diffTimestamp = System.currentTimeMillis() - timestamp;
            if (diffTimestamp > MAX_EFFECTIVE_TIMESTAMP) {
                ResponseUtils.outJson(response, Result.failed(ResponseCodeConstants.SIGN_FAIL_CODE, ResponseCodeConstants.SIGN_FAIL_MSG));
                return;
            }
            //对参数进行签名验证
            boolean verifySign = SignUtils.verifySign(allParams, platformSignProperties.getSecret());
            if (verifySign) {
                filterChain.doFilter(requestWrapper, response);
                return;
            } else {
                ResponseUtils.outJson(response, Result.failed(ResponseCodeConstants.SIGN_FAIL_CODE, ResponseCodeConstants.SIGN_FAIL_MSG));
            }
        }
    }
}




