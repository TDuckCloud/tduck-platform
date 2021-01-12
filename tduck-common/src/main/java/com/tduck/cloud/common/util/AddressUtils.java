package com.tduck.cloud.common.util;

import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpUtil;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import sun.net.util.IPAddressUtil;

import java.util.Map;

/**
 * @author : smalljop
 * @description : 地址工具类
 * @create : 2020-12-08 16:12
 **/
@UtilityClass
@Slf4j
public class AddressUtils {

    /**
     * IP地址查询
     */
    public static final String IP_URL = "http://whois.pconline.com.cn/ipJson.jsp";

    /**
     * 未知地址
     */
    public static final String UNKNOWN = "XX XX";

    public static String getRealAddressByIP(String ip) {
        String address = UNKNOWN;
        // 内网不查询
        if (internalIp(ip)) {
            return "内网IP";
        }
        try {
            String rspStr = HttpUtil.get(StrUtil.format("{}?ip={}&json=true", IP_URL, ip));
            if (StrUtil.isEmpty(rspStr)) {
                log.error("获取地理位置异常 {}", ip);
                return UNKNOWN;
            }
            Map<String, Object> map = JsonUtils.jsonToMap(rspStr);
            String region = MapUtil.getStr(map, "pro");
            String city = MapUtil.getStr(map, "city");
            return String.format("%s-%s", region, city);
        } catch (Exception e) {
            log.error("获取地理位置异常 {}", e);
        }
        return address;
    }


    public boolean internalIp(String ip) {
        byte[] addr = IPAddressUtil.textToNumericFormatV4(ip);
        return internalIp(addr) || "127.0.0.1".equals(ip);
    }

    public static boolean internalIp(byte[] addr) {
        final byte b0 = addr[0];
        final byte b1 = addr[1];
        //10.x.x.x/8
        final byte SECTION_1 = 0x0A;
        //172.16.x.x/12
        final byte SECTION_2 = (byte) 0xAC;
        final byte SECTION_3 = (byte) 0x10;
        final byte SECTION_4 = (byte) 0x1F;
        //192.168.x.x/16
        final byte SECTION_5 = (byte) 0xC0;
        final byte SECTION_6 = (byte) 0xA8;
        switch (b0) {
            case SECTION_1:
                return true;
            case SECTION_2:
                if (b1 >= SECTION_3 && b1 <= SECTION_4) {
                    return true;
                }
            case SECTION_5:
                switch (b1) {
                    case SECTION_6:
                        return true;
                    default:
                        return false;
                }
            default:
                return false;
        }
    }
}
