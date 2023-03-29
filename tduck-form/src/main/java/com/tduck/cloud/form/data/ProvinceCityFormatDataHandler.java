package com.tduck.cloud.form.data;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.lang.TypeReference;
import cn.hutool.core.map.MapUtil;

import java.util.List;
import java.util.Map;

/**
 * 省市级联类型格式化数据处理
 *
 * @author tduck
 */
public class ProvinceCityFormatDataHandler implements BaseFormatDataHandler {

    @Override
    public Object formatData(String key, Object value, Object scheme) {
        // 省市级联 数据结构改造后
        if (value instanceof Map) {
            Map<String, Object> map = Convert.toMap(String.class, Object.class, value);
            return CollUtil.join(MapUtil.getQuietly(map, "cascadeValue", new TypeReference<List<String>>() {
            }, CollUtil.newArrayList()), ",") + MapUtil.getStr(map, "detailAddr", "");
        }
        return value.toString();
    }
}
