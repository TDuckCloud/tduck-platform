package com.tduck.cloud.form.request;

import cn.hutool.core.date.DatePattern;
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


}
