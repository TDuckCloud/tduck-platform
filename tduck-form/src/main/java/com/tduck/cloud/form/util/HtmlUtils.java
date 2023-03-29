package com.tduck.cloud.form.util;

import cn.hutool.http.HtmlUtil;
import lombok.experimental.UtilityClass;

@UtilityClass
public class HtmlUtils extends HtmlUtil {


    /**
     * 清除标签 还原转义文本
     * @param content
     * @return
     */
    public static String cleanHtmlTag(String content) {
        // 清除HTML标签和空格 html编码解码
        return HtmlUtil.unescape(content).replaceAll("(<[^<]*?>)|(<[\\s]*?/[^<]*?>)|(<[^<]*?/[\\s]*?>)", "").replaceAll(NBSP, "");
    }

}
