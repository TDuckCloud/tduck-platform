package com.tduck.cloud.api.web.filter;

import cn.hutool.core.util.StrUtil;
import com.anji.captcha.model.vo.CaptchaVO;
import com.anji.captcha.service.CaptchaService;
import com.google.common.collect.Lists;
import com.tduck.cloud.api.util.ResponseUtils;
import com.tduck.cloud.common.constant.ResponseCodeConstants;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.common.util.SpringContextUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 * @author : smalljop
 * @description : 滑动验证码校验
 * @create : 2020-12-14 15:51
 **/
public class ValidateCodeFilter implements Filter {

    private List<String> validateUrls = Lists.newArrayList(
            "/login/account",
            "/retrieve/password/email",
            "/retrieve/password/phone/code");

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        if (!StrUtil.containsAnyIgnoreCase(httpServletRequest.getRequestURI(),
                validateUrls.toArray(new String[validateUrls.size()]))) {
            filterChain.doFilter(request, response);
            return;
        }
        String code = request.getParameter("slideCode");
        if (StrUtil.isBlank(code)) {
            ResponseUtils.outJson(response, Result.failed(ResponseCodeConstants.NEED_VERIFICATION, ""));
            return;
        }
        CaptchaService captchaService = SpringContextUtils.getBean(CaptchaService.class);
        CaptchaVO vo = new CaptchaVO();
        vo.setCaptchaVerification(code);
        if (!captchaService.verification(vo).isSuccess()) {
            ResponseUtils.outJson(response, Result.failed(ResponseCodeConstants.FAIL, ResponseCodeConstants.VALIDATE_CODE_FAIL_MSG));
            return;
        }
        filterChain.doFilter(request, response);
    }

}
