package com.tduck.cloud.common.mybatis.wrapper;

import cn.hutool.core.util.CharUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;


/**
 * @author : smalljop
 * @description : json 查询
 * @create : 2020-11-24 13:18
 **/
public class JsonLambdaQueryWrapper<T> extends LambdaQueryWrapper<T> {

    /***
     * json 数组是否包含
     * @param <T>
     * @param condition 条件
     * @param column 列表
     * @param jsonKey 需查询可以
     * @param value  等于值
     * @return
     */
    public <T> JsonLambdaQueryWrapper<T> jsonConcat(boolean condition, String column, String jsonKey, Object value) {
        //驼峰转下划线
        String columnStr = StrUtil.toUnderlineCase(column);
        String sql = StrUtil.format("JSON_CONTAINS({}, '\"{}\"', '${}')", columnStr, value, StrUtil.isNotBlank(jsonKey) ? CharUtil.DOT + jsonKey : "");
        return (JsonLambdaQueryWrapper<T>) apply(condition, sql, null);
    }


}
