package com.tduck.cloud.project.request;

import cn.hutool.core.date.DatePattern;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.tduck.cloud.common.entity.PageRequest;
import com.tduck.cloud.project.entity.enums.ProjectStatusEnum;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

/**
 * @author : smalljop
 * @description : 查询项目
 * @create : 2020-12-10 15:04
 **/
@Data
public class QueryProjectRequest {


    @Data
    public static class List {
        private Integer status;
    }


    /**
     * 分页查询
     */
    @Data
    public static class Page extends PageRequest {
        private Integer status;

        private String name;

        @DateTimeFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
        private LocalDateTime beginDateTime;

        @DateTimeFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
        private LocalDateTime endDateTime;
    }

}
