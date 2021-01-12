package com.tduck.cloud.project.request;

import cn.hutool.core.date.DatePattern;
import com.tduck.cloud.common.entity.PageRequest;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

/**
 * @author : smalljop
 * @description : 查询项目模板分页
 * @create : 2020-12-10 15:04
 **/
@Data
public class QueryProjectTemplateTypeRequest {


    @Data
    public static class List {
    }

}