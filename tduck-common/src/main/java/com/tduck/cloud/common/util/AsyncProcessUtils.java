package com.tduck.cloud.common.util;

import cn.hutool.cache.CacheUtil;
import cn.hutool.cache.impl.TimedCache;
import cn.hutool.core.util.StrUtil;
import lombok.AllArgsConstructor;

/**
 * @author : smalljop
 * @description : 异步处理进度 像导出文件等异步耗时操作
 * @create :  2021/06/08 15:35
 **/

public class AsyncProcessUtils {

    /**
     * 最大完成率
     */
    private final static int MAX_PROCESS_RATE = 100;
    /**
     * 处理中任务 5h过期
     * timeout – 过期时长，单位：毫秒
     */
    static TimedCache<String, Process> processMap = CacheUtil.newTimedCache(5 * 60 * 60 * 1000);


    static {
        //启动定时任务，每5分钟检查一次过期
        processMap.schedulePrune(5 * 60 * 1000);
    }

    /**
     * 设置进度
     *
     * @param key
     * @param rate
     */
    public static void setProcess(String key, int rate) {
        processMap.put(key, new Process(rate * 100, StrUtil.EMPTY));
    }

    /**
     * 设置进度
     *
     * @param key
     */
    public static void setProcess(String key, String url) {
        processMap.put(key, new Process(MAX_PROCESS_RATE, url));
    }

    /**
     * 设置进度
     *
     * @param key
     */
    public static Process getProcess(String key) {
        return processMap.get(key);
    }


    @AllArgsConstructor
    public static class Process {
        /**
         * 完成进度
         */
        public int rate;
        /**
         * 下载地址
         */
        public String url;
    }

}
