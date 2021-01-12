package com.tduck.cloud.project.request;

import lombok.Data;

/**
 * @author : smalljop
 * @description : 项目主题查询
 * @create : 2020-11-24 10:15
 **/
@Data
public class QueryProThemeRequest {
    private String color;

    private String style;

}
