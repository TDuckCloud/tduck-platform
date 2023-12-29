package com.tduck.cloud.common.util;

import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpUtil;
import lombok.Data;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;

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
     * {"ip":"121.35.102.201","pro":"广东省","proCode":"440000","city":"深圳市","cityCode":"440300","region":"宝安区","regionCode":"440306","addr":"广东省深圳市宝安区 电信","regionNames":"","err":""}
     */
    public static final String IP_URL = "http://whois.pconline.com.cn/ipJson.jsp";

    /**
     * IP地址查询
     * {"code":"Success","data":{"continent":"亚洲","country":"中国","zipcode":"518051","timezone":"UTC+8","accuracy":"区县","owner":"中国电信","isp":"中国电信","source":"数据挖掘","areacode":"CN","adcode":"440305","asnumber":"4134","lat":"22.556244","lng":"113.939291","radius":"25.3318","prov":"广东省","city":"深圳市","district":"南山区"},"charge":true,"msg":"查询成功","ip":"121.35.102.201","coordsys":"WGS84"}
     */
    public static final String IP_URL2 = "https://qifu.baidu.com/ip/geo/v1/district?ip=";

    @Data
    static class IP_URL2_DATA {
        private String prov;
        private String city;
        private String district;
    }

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
            if (StrUtil.isNotEmpty(rspStr)) {
                Map<String, Object> map = JsonUtils.jsonToMap(rspStr);
                String province = MapUtil.getStr(map, "pro", "");
                String city = MapUtil.getStr(map, "city", "");
                if (!province.isEmpty()) {
                    return !city.isEmpty() ? String.format("%s-%s", province, city) : province;
                }
            }
        } catch (Exception e) {
            log.error("pconline 获取地理位置异常 {} {}", ip, e);
        }

        try {
            String rspStr = HttpUtil.get(StrUtil.format("{}{}", IP_URL2, ip));
            if (StrUtil.isNotEmpty(rspStr)) {
                Map<String, Object> map = JsonUtils.jsonToMap(rspStr);
                IP_URL2_DATA data = MapUtil.get(map, "data", IP_URL2_DATA.class);
                if (data != null && data.getProv() != null) {
                    return data.getCity() != null ? String.format("%s-%s", data.getProv(), data.getCity()) : data.getProv();
                }
            }
        } catch (Exception e) {
            log.error("baidu 获取地理位置异常 {} {}", ip, e);
        }

        return address;
    }


    public boolean internalIp(String ip) {
        byte[] addr = textToNumericFormatV4(ip);
        return internalIp(addr) || "127.0.0.1".equals(ip);
    }

    public static boolean internalIp(byte[] addr) {
        if (ArrayUtil.isEmpty(addr)) {
            return false;
        }
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

    /**
     * 将IPv4地址转换成字节
     *
     * @param text IPv4地址
     * @return byte 字节
     */
    public static byte[] textToNumericFormatV4(String text) {
        if (text.length() == 0) {
            return null;
        }

        byte[] bytes = new byte[4];
        String[] elements = text.split("\\.", -1);
        try {
            long l;
            int i;
            switch (elements.length) {
                case 1:
                    l = Long.parseLong(elements[0]);
                    if ((l < 0L) || (l > 4294967295L)) {
                        return null;
                    }
                    bytes[0] = (byte) (int) (l >> 24 & 0xFF);
                    bytes[1] = (byte) (int) ((l & 0xFFFFFF) >> 16 & 0xFF);
                    bytes[2] = (byte) (int) ((l & 0xFFFF) >> 8 & 0xFF);
                    bytes[3] = (byte) (int) (l & 0xFF);
                    break;
                case 2:
                    l = Integer.parseInt(elements[0]);
                    if ((l < 0L) || (l > 255L)) {
                        return null;
                    }
                    bytes[0] = (byte) (int) (l & 0xFF);
                    l = Integer.parseInt(elements[1]);
                    if ((l < 0L) || (l > 16777215L)) {
                        return null;
                    }
                    bytes[1] = (byte) (int) (l >> 16 & 0xFF);
                    bytes[2] = (byte) (int) ((l & 0xFFFF) >> 8 & 0xFF);
                    bytes[3] = (byte) (int) (l & 0xFF);
                    break;
                case 3:
                    for (i = 0; i < 2; ++i) {
                        l = Integer.parseInt(elements[i]);
                        if ((l < 0L) || (l > 255L)) {
                            return null;
                        }
                        bytes[i] = (byte) (int) (l & 0xFF);
                    }
                    l = Integer.parseInt(elements[2]);
                    if ((l < 0L) || (l > 65535L)) {
                        return null;
                    }
                    bytes[2] = (byte) (int) (l >> 8 & 0xFF);
                    bytes[3] = (byte) (int) (l & 0xFF);
                    break;
                case 4:
                    for (i = 0; i < 4; ++i) {
                        l = Integer.parseInt(elements[i]);
                        if ((l < 0L) || (l > 255L)) {
                            return null;
                        }
                        bytes[i] = (byte) (int) (l & 0xFF);
                    }
                    break;
                default:
                    return null;
            }
        } catch (NumberFormatException e) {
            return null;
        }
        return bytes;
    }
}
