package com.tduck.cloud.common.entity;

import cn.hutool.core.date.DatePattern;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import com.tduck.cloud.common.mybatis.handler.LongToStringSerializer;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.FieldNameConstants;

import java.time.LocalDateTime;

/**
 * @description: 实体类基类
 * @author: smalljop
 * @create: 2020-02-15 22:57
 **/
@Data
@FieldNameConstants
@EqualsAndHashCode(callSuper = false)
public class BaseEntity<T> extends Model {

    private static final long serialVersionUID = 1L;


    /**
     * 主键 避免超出长度 前端丢失精度
     */
    @JsonSerialize(using= LongToStringSerializer.class)
    private Long id;

    /**
     * 创建时间
     **/
    @TableField(fill = FieldFill.INSERT)
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    @JsonSerialize(using = LocalDateTimeSerializer.class)
    @JsonFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
    protected LocalDateTime createTime;

    /**
     * 更新时间
     **/
    @TableField(fill = FieldFill.INSERT_UPDATE)
    @JsonFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    @JsonSerialize(using = LocalDateTimeSerializer.class)
    protected LocalDateTime updateTime;

}
