package com.tduck.cloud.form.data;


import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.convert.Convert;

import java.util.Collection;

/**
 * 默认处理
 *
 * @author tduck
 */
public class DefaultFormatDataHandler implements BaseFormatDataHandler {


    @Override
    public Object formatData(String key, Object value, Object scheme) {
        // 答案如果是多个值 如多选等
        if (value instanceof Collection) {
            return CollUtil.join(Convert.toList(value), COMMA);
        }
        return value.toString();
    }
}
