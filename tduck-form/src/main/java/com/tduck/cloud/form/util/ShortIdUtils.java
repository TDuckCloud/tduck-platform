package com.tduck.cloud.form.util;

import cn.hutool.core.lang.id.NanoId;
import cn.hutool.core.map.MapUtil;
import lombok.experimental.UtilityClass;

import java.util.Map;

/**
 * 短Id工具类
 */
@UtilityClass
public class ShortIdUtils {

    /**
     * 默认随机字母表，使用URL安全的Base64字符
     */
    private static final char[] DEFAULT_ALPHABET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();


    /**
     * 生成8位长度Id
     *
     * @return
     */
    public String genId() {
        return NanoId.randomNanoId(null, DEFAULT_ALPHABET, 8);
    }

    public static void main(String[] args) {
        Map<Object, Object> of = MapUtil.of();
        for (int i = 0; i < 100000 ;i++) {
            String s = genId();
            Object put = of.put(s, "1");
            if (null != put) {
                System.out.println(s);
            }
        }
    }
}
