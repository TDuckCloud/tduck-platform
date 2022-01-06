package com.tduck.cloud.form.request;

import cn.hutool.core.date.DatePattern;
import com.tduck.cloud.common.entity.PageRequest;
import com.tduck.cloud.form.entity.struct.FormDataFilterStruct;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldNameConstants;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;

/**
 * @author : smalljop
 * @description : 表单结果查询
 * @create : 2020-12-08 15:55
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
@FieldNameConstants
public class QueryFormResultRequest extends PageRequest {

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
     * 权限组
     */
    private Long authGroupId;

    /**
     * 权限组的数组过滤
     */
    private FormDataFilterStruct authGroupFilter;

    /**
     * 过滤字段
     */
    private FormDataFilterStruct filter;

    /**
     * 被查询的字段
     */
    private String[] filterFields;


}
