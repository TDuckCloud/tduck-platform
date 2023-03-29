package com.tduck.cloud.form.request;

import cn.hutool.core.date.DatePattern;
import com.tduck.cloud.common.entity.PageRequest;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

/**
 * @author : smalljop
 * @description : 查询表单
 * @create : 2020-12-10 15:04
 **/
@Data
public class QueryFormRequest {


    @Data
    public static class List {
        private Integer status;
    }


    /**
     * 分页查询
     */
    @Data
    public static class Page extends PageRequest {
        private Long folderId;


        private Integer type;
        private Integer status;

        private String name;

        /**
         * 是否包含文件夹
         */
        private Boolean folder;

        @DateTimeFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
        private LocalDateTime beginDateTime;

        @DateTimeFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
        private LocalDateTime endDateTime;
    }




}
