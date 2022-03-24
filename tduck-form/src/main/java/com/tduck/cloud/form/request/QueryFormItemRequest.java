package com.tduck.cloud.form.request;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @author : smalljop
 * @description : 查询表单问题
 * @create :  2021/06/03 14:45
 **/
@Data
public class QueryFormItemRequest {

    /**
     * 表单key
     */
    @NotBlank
    private String key;
    /**
     * 是显示类型
     */
    private Boolean displayType;

}
