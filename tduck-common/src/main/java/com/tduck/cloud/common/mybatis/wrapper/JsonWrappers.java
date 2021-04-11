package com.tduck.cloud.common.mybatis.wrapper;

/**
 * msyql 查询包装类
 *
 * @author : smalljop
 * @description :
 * @create : 2020-11-24 11:56
 **/
public class JsonWrappers {


    /**
     * 获取 LambdaQueryWrapper&lt;T&gt;
     *
     * @param <T> 实体类泛型
     * @return LambdaQueryWrapper&lt;T&gt;
     */
    public static <T> JsonLambdaQueryWrapper<T> jsonLambdaQuery() {
        return new JsonLambdaQueryWrapper<>();
    }

}