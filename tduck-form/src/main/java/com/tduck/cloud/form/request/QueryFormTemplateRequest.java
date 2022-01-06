package com.tduck.cloud.form.request;

import com.tduck.cloud.common.entity.PageRequest;
import lombok.Data;

/**
 * @author : smalljop
 * @description : 查询表单模板
 * @create : 2020-12-10 15:04
 **/
@Data
public class QueryFormTemplateRequest {


    /**
     * 分页查询
     */
    @Data
    public static class Page extends PageRequest {

        private String name;

        private Long type;
    }

}
