package com.tduck.cloud.form.request;

import cn.hutool.core.date.DatePattern;
import com.baomidou.mybatisplus.core.toolkit.Assert;
import com.baomidou.mybatisplus.core.toolkit.sql.SqlInjectionUtils;
import com.tduck.cloud.form.entity.struct.FormDataFilterStruct;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldNameConstants;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;
import java.util.List;

/**
 * @author : smalljop
 * @description : 表单结果查询
 * @create : 2020-12-08 15:55
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
@FieldNameConstants
public class QueryFormResultRequest {

    /**
     * 当前页
     */
    private Integer current;
    /**
     * 大小
     */
    private Integer size;

    /**
     * 固定字段
     */
    @NotBlank
    private String formKey;

    @DateTimeFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
    private LocalDateTime beginDateTime;
    @DateTimeFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
    private LocalDateTime endDateTime;

    /**
     * 被查询的字段
     */
    private String[] filterFields;

    /**
     * 数据id 集合
     */
    private List<String> dataIds;


    public void validateSqlInjection() {
        Assert.isFalse(SqlInjectionUtils.check(formKey), "参数异常");
        if (filterFields != null) {
            for (String field : filterFields) {
                Assert.isFalse(SqlInjectionUtils.check(field), "参数异常");
            }
        }
        if (dataIds != null) {
            for (String id : dataIds) {
                Assert.isFalse(SqlInjectionUtils.check(id), "参数异常");
            }
        }
    }

}
