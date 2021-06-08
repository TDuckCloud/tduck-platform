package com.tduck.cloud.project.request;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @author : smalljop
 * @description : 查询项目问题
 * @create :  2021/06/03 14:45
 **/
@Data
public class QueryProjectItemRequest {

    /**
     * 项目key
     */
    @NotBlank
    private String key;
    /**
     * 是显示类型
     */
    private Boolean displayType;

}
