package com.tduck.cloud.common.entity;

import com.baomidou.mybatisplus.annotation.IEnum;
import com.fasterxml.jackson.annotation.JsonValue;

import java.io.Serializable;

/**
 * @author : wangqing
 * @description : 字典枚举基础接口
 * 继承该接口会在jackson默认增强显示字段
 * @create :  2021/12/21 10:19
 **/
public interface IDictEnum<T extends Serializable> extends IEnum<T> {

    static <T extends IDictEnum> T getInstance(Class<T> clazz, String code) {
        T[] constants = clazz.getEnumConstants();

        for (T t : constants) {
            if (String.valueOf(t.getValue()).equals(code)) {
                return t;
            }
        }
        return null;
    }

    /**
     * 数据库中存储的值
     *
     * @return 数据库中存储的值
     */
    @Override
    T getValue();


    /**
     * 获取枚举描述
     *
     * @return 描述
     */
    String getDesc();


}
