package com.tduck.cloud.form.data;

import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;

import java.util.stream.Collectors;

/**
 * 上传序类型格式化数据处理
 *
 * @author tduck
 */
public class UploadFormatDataHandler implements BaseFormatDataHandler {

    @Override
    public Object formatData(String key, Object value, Object scheme) {
        return JSONUtil.parseArray(JSONUtil.toJsonStr(value)).toList(JSONObject.class)
                .stream().map(item -> item.getStr("url")).collect(Collectors.joining(COMMA));
    }
}
