package com.tduck.cloud.form.entity.struct;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author : wangqing
 * @description : 数据过滤对象结构
 * @create :  2021/10/13 14:49
 **/
@Data
public class FormDataFilterStruct {
    /**
     * or and 逻辑连接符号
     */
    RelEnum rel;

    /**
     * 过滤条件
     */
    List<Condition> conditionList;

    @Getter
    @AllArgsConstructor
    public enum QueryMethodEnum {
        /**
         * 等于
         */
        EQ,
        /**
         * 不等于
         */
        NE,
        /**
         * 包含
         */
        INCLUDE,
        /**
         * 不包含
         */
        NOT_INCLUDE,
        /**
         * 为空
         */
        IS_NULL,
        /**
         * 不为空
         */
        NOT_NULL,
        /**
         * ;
         * 大于
         */
        GT,
        /**
         * ;
         * 大于等于
         */
        GE,
        /**
         * 小于
         */
        LT,
        /**
         * 小于等于
         */
        LE,
        /**
         * 范围
         */
        RANGE,
        /**
         * 时间范围
         */
        TIME_RANGE;

    }

    /**
     * 默认值类型枚举
     */
    public enum DefaultValueTypeEnum {
        /**
         * 字符串
         */
        STRING,
        /***
         * 数组
         */
        ARRAY
    }


    /**
     * 默认值类型枚举
     */
    public enum RelEnum {
        AND,
        OR
    }

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    // 忽略前端传的未定义参数
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class Condition {
        private String formItemId;
        private QueryMethodEnum method;
        private Object value;
        private DefaultValueTypeEnum defaultValueType;
    }
}
