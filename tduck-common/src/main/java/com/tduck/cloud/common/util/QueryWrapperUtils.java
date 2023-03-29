package com.tduck.cloud.common.util;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.ReflectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.tduck.cloud.common.entity.IDictEnum;

import java.beans.PropertyDescriptor;
import java.util.Map;

/**
 * @author : wangqing
 * @description : mybatis wrapeprs 工具类
 * @create :  2021/07/12 16:34
 **/
public class QueryWrapperUtils {


    /**
     * 生成简单查询wrapper
     * 对于参数String默认使用like
     * 对于Long Boolean Integer 使用eq等值
     *
     * @param searchObj
     */
    public static <T> QueryWrapper<T> toSimpleQuery(T searchObj) {
        QueryWrapper<T> queryWrapper = new QueryWrapper<T>();
        PropertyDescriptor[] propertyDescriptors = BeanUtil.getPropertyDescriptors(searchObj.getClass());
        for (PropertyDescriptor property : propertyDescriptors) {
            Object fieldValue = BeanUtil.getFieldValue(searchObj, property.getName());
            String name = property.getName();
            // 如果值非空 进行默认查询方式 string 为模糊 数值为=查询
            if (ObjectUtil.isNotNull(fieldValue)) {
                if (fieldValue instanceof String) {
                    queryWrapper.like(StrUtil.toUnderlineCase(name), fieldValue);
                } else if (fieldValue instanceof Long || fieldValue instanceof Boolean || fieldValue instanceof Integer) {
                    queryWrapper.eq(StrUtil.toUnderlineCase(name), fieldValue);
                } else if (fieldValue instanceof IDictEnum) {
                    queryWrapper.eq(StrUtil.toUnderlineCase(name), ((IDictEnum) fieldValue).getValue());
                }
            }
        }
        Map<String, Object> parameterMap = null;
        Object params = ReflectUtil.getFieldValue(searchObj, "params");
        if (ObjectUtil.isNotNull(params) && params instanceof Map) {
            parameterMap = (Map) params;
        } else {
            return queryWrapper;
        }
        String dateTimeRangeSql = addDateTimeRange(parameterMap);
        if (StrUtil.isNotBlank(dateTimeRangeSql)) {
            queryWrapper.apply(dateTimeRangeSql);
        }
        String dataScopeSql = addDataScope(parameterMap);
        if (StrUtil.isNotBlank(dataScopeSql)) {
            //去除开头的AND 默认添加AND是为了在xml方便使用
            queryWrapper.apply(dataScopeSql.substring(4));
        }
        //处理排序
        handleSortColumn(queryWrapper, parameterMap);
        return queryWrapper;
    }

    /**
     * 排序处理
     *
     * @param params
     * @return
     */
    public static <T> void handleSortColumn(QueryWrapper<T> queryWrapper, Map<String, Object> params) {
        if (ObjectUtil.isNull(params)) {
            return;
        }
        String orderByColumn = MapUtil.getStr(params, "orderByColumn");
        String isAsc = MapUtil.getStr(params, "isAsc");
        if (StrUtil.isBlank(orderByColumn)) {
            return;
        }
        queryWrapper.orderBy(StrUtil.isNotBlank(orderByColumn) && StrUtil.isNotBlank(isAsc), isAsc.equals("ascending"), StrUtil.toUnderlineCase(orderByColumn));
    }


    /**
     * 数据权限过滤
     *
     * @param params
     * @return
     */
    public static String addDataScope(Map<String, Object> params) {
        if (ObjectUtil.isNull(params)) {
            return StrUtil.EMPTY;
        }
        // DataScopeAspect 切面注入sql
        return MapUtil.getStr(params, "dataScope");
    }


    /**
     * 添加时间范围
     */
    public static String addDateTimeRange(Map<String, Object> params) {
        if (ObjectUtil.isNull(params)) {
            return StrUtil.EMPTY;
        }
        String beginTime = MapUtil.getStr(params, "beginTime");
        String endTime = MapUtil.getStr(params, "endTime");
        if (StrUtil.isBlank(beginTime) || StrUtil.isBlank(endTime)) {
            return StrUtil.EMPTY;
        }
        String lastSql = StrUtil.format("  date_format(create_time,'%y%m%d') >= date_format('{}','%y%m%d') AND date_format(create_time,'%y%m%d') <= date_format('{}','%y%m%d')",
                beginTime, endTime);
        return lastSql;
    }

}
