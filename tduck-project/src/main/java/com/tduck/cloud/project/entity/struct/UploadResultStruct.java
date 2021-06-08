package com.tduck.cloud.project.entity.struct;

import lombok.Data;

import java.util.List;

/**
 * @author : smalljop
 * @description : 上传收集结果
 * @create :  2021/06/07 16:37
 **/
@Data
public class UploadResultStruct {

    private List<UploadFile> files;

    @Data
    public static class UploadFile {
        private String fileName;
        private String url;
    }
}
