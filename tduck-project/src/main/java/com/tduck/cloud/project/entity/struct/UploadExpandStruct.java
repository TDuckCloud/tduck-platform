package com.tduck.cloud.project.entity.struct;

import lombok.Data;

/**
 * @author : smalljop
 * @description : 上传文件
 * @create : 2020-11-19 11:42
 **/
@Data
public class UploadExpandStruct {


    /**
     * 按钮文字
     */
    private String buttonText;

    /**
     * 显示提示
     */
    private Boolean showTip;

    /**
     * 文件大小
     */
    private Long fileSize;

    /**
     * 大小单位
     */
    private String sizeUnit;

    /**
     * 显示列表类型
     */
    private String listType;


    /**
     * 文件数字
     */
    private Integer limit;

    /**
     * 是否可以多选
     */
    private boolean multiple;
    /**
     * 允许上传的文件类型
     */
    private String accept;
}
