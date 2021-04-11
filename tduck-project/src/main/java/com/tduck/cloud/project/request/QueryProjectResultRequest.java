package com.tduck.cloud.project.request;

import cn.hutool.core.date.DatePattern;
import com.tduck.cloud.common.entity.PageRequest;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldNameConstants;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.util.Map;

/**
 * @author : smalljop
 * @description : 项目结果查询
 * @create : 2020-12-08 15:55
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
@FieldNameConstants
public class QueryProjectResultRequest extends PageRequest {

    /**
     * 固定字段
     */
    private String projectKey;

    @DateTimeFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
    private LocalDateTime beginDateTime;
    @DateTimeFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
    private LocalDateTime endDateTime;



    /**
     * 动态字段
     */
    private Map<String, Object> expand;


}
