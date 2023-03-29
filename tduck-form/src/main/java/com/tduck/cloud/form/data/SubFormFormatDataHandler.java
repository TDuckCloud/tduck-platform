package com.tduck.cloud.form.data;

import cn.hutool.core.collection.CollStreamUtil;
import cn.hutool.core.convert.Convert;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;

import java.util.Collection;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 子表单类型格式化数据处理
 *
 * @author tduck
 */
public class SubFormFormatDataHandler implements BaseFormatDataHandler {

    @Override
    public Object formatData(String key, Object value, Object scheme) {
        Map<String, String> subFormFields = CollStreamUtil.toMap(JSONUtil.parseObj(JSONUtil.toJsonStr(scheme)).getJSONArray("childList")
                .toList(JSONObject.class), item -> item.getStr("vModel"), item -> item.getByPath("config.label", String.class));
        if (value instanceof Collection) {
            Object list = Convert.toList(value).stream().map(item -> {
                Map<String, Object> rowValue = Convert.toMap(String.class, Object.class, item);
                return CollStreamUtil.toMap(rowValue.keySet(), subFormFields::get, subKey -> rowValue.getOrDefault(subKey, ""));
            }).collect(Collectors.toList());
            return JSONUtil.toJsonStr(list);
        }
        return value;
    }
}
