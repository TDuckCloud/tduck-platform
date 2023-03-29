package com.tduck.cloud.form.data;

/**
 * 基本格式化数据处理
 * 处理不同组件的数据格式化 比如
 *
 * @author tduck
 */
public interface BaseFormatDataHandler {

    /**
     * 标签key 一些常量
     */
    String LABEL_KEY = "label";

    /*
     * 逗号 ,
     */
    String COMMA = ",";

    /**
     * 格式化数据
     *
     * @param key    数据key
     * @param value  格式化前的数据
     * @param scheme 组件scheme
     * @return 格式化后的数据
     */
    Object formatData(String key, Object value, Object scheme);
}
