package com.tduck.cloud.project.request;

import com.tduck.cloud.common.entity.PageRequest;
import lombok.Data;

/**
 * @author : smalljop
 * @description : 查询项目模板
 * @create : 2020-12-10 15:04
 **/
@Data
public class QueryProjectTemplateRequest {


    /**
     * 分页查询
     */
    @Data
    public static class Page extends PageRequest {

        private String name;

        private Long type;
    }

}
