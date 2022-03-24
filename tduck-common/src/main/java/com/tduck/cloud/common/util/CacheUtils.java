package com.tduck.cloud.common.util;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Objects;

/**
 * @author : tduck
 * @description : 基于ehcache实现
 * @create :  2022/01/06 10:40
 **/
@Component
@Slf4j
public class CacheUtils {
    private final String ETERNAL_CACHE_NAME = "eternal_cache";
    private final String TEMP_CACHE_NAME = "temp_cache";
    @Autowired
    private EhCacheCacheManager cacheManager;

    /**
     * 保存到Cache
     */
    public void save(String key, String value) {
        cacheManager.getCache(ETERNAL_CACHE_NAME).put(key, value);
    }

    /**
     * 获取
     *
     * @param key
     */
    public String get(String key) {
        Cache.ValueWrapper valueWrapper = cacheManager.getCache(ETERNAL_CACHE_NAME).get(key);
        if (ObjectUtil.isNotNull(valueWrapper) && ObjectUtil.isNotNull(valueWrapper.get())) {
            return valueWrapper.get().toString();
        }
        return null;
    }


    /**
     * 自增
     *
     * @param key
     * @param number
     * @return
     */
    public Long incr(String key, Integer number) {
        String v = get(key);
        if (StrUtil.isBlank(v)) {
            v = "0";
        }
        long finalValue = Convert.toLong(v) + number;
        save(key, String.valueOf(finalValue));
        return finalValue;
    }


    /**
     * 添加到集合缓存
     *
     * @param key
     * @param value
     */
    public void addList(String key, Object value) {
        List coll = this.getList(key, Object.class);
        coll.add(value);
        cacheManager.getCache(TEMP_CACHE_NAME).put(key, JsonUtils.objToJson(coll));
    }


    /**
     * 从集合中移除
     *
     * @param key
     * @param value
     */
    public void removeList(String key, Object value) {
        List coll = this.getList(key, Object.class);
        coll.remove(value);
        cacheManager.getCache(TEMP_CACHE_NAME).put(key, JsonUtils.objToJson(coll));
    }

    /**
     * 获取集合
     *
     * @param key
     */
    public List getList(String key, Class classz) {
        String v = get(key);
        if (ObjectUtil.isNotNull(v)) {
            return JsonUtils.jsonToList(v, classz.getClass());
        }
        return Lists.newArrayList();
    }


    /**
     * 临时保存 默认5min
     */
    public void tempSave(String key, String value) {
        cacheManager.getCache(TEMP_CACHE_NAME).put(key, value);
    }

    /**
     * 获取临时存储变量
     *
     * @param key
     */
    public String getTemp(String key) {
        Cache.ValueWrapper valueWrapper = cacheManager.getCache(TEMP_CACHE_NAME).get(key);
        if (ObjectUtil.isNotNull(valueWrapper) && ObjectUtil.isNotNull(valueWrapper.get())) {
            return valueWrapper.get().toString();
        }
        return null;
    }

    public void removeTemp(String key) {
        cacheManager.getCache(TEMP_CACHE_NAME).evict(key);
    }


}
