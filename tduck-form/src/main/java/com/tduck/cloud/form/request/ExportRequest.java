package com.tduck.cloud.form.request;

import com.tduck.cloud.form.entity.struct.FormDataFilterStruct;
import lombok.Data;

import java.util.List;

/**
 * @author : wangqing
 * @description : 导出请求
 * @create :  2022/02/16 10:24
 **/
@Data
public class ExportRequest {

    /**
     * 表单数据
     */
    @Data
    public static class FormData {
        private Integer currentPage;
        private Integer pageSize;
        private String mode;
        private String filename;
        private String type;
        private String sheetName;
        /**
         * 导出列
         */
        private List<String> columns;
        /**
         * 选中数据Id
         */
        private List<String> checkboxIds;
        private String formKey;

        /**
         * 权限组
         */
        private Long authGroupId;
        /**
         * 过滤字段
         */
        private FormDataFilterStruct filter;
    }

}
