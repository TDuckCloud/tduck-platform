package com.tduck.cloud.form.entity.struct;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author : smalljop
 * @description : 上传收集结果
 * @create :  2021/06/07 16:37
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UploadResultStruct {

    private String name;
    private String url;
}
