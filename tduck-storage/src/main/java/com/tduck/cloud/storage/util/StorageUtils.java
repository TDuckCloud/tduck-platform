package com.tduck.cloud.storage.util;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.UUID;

/**
 * @description: 云存储工具类
 * @author: smalljop
 * @create: 2019-01-25 15:37
 **/
public class StorageUtils {

    /**
     * 生成文件名 包含路径 防止重复
     *
     * @param prefix 前缀
     * @param suffix 后缀
     * @return
     */
    public static String generateFileName(String prefix, String suffix) {
        //生成uuid
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        //文件路径
        String path = DateUtil.format(new Date(), "yyyyMMdd") + "/" + uuid;
        if (StrUtil.isNotBlank(prefix)) {
            path = prefix + '/' + path;
        }
        return path + suffix;
    }

    /**
     * 获取文件名后缀 包含.
     *
     * @param fileName 文件
     * @return
     */
    public static String getFileSuffixNamePoint(String fileName) {
        String suffix = fileName.substring(fileName.lastIndexOf("."));
        return suffix;
    }


    /**
     * 获取文件大小
     *
     * @param size
     * @return
     */
    public static String readableFileSize(long size) {
        if (size <= 0) {
            return "0";
        }
        final String[] units = new String[]{"B", "KB", "MB", "GB", "TB"};
        int digitGroups = (int) (Math.log10(size) / Math.log10(1024));
        return new DecimalFormat("#,##0.#").format(size / Math.pow(1024, digitGroups)) + " " + units[digitGroups];
    }

    /**
     * 获取文件名后缀 不包含.
     *
     * @param fileName 文件
     * @return
     */
    public static String getFileSuffixName(String fileName) {
        String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
        return suffix;
    }

    /**
     * 从路径中获取文件名
     *
     * @param path
     * @return
     */
    public static String getFileName(String path) {
        return path.substring(path.lastIndexOf("/") + 1);
    }

}
