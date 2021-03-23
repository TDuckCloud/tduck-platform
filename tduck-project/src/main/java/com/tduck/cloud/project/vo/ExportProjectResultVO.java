package com.tduck.cloud.project.vo;

import com.google.common.collect.Lists;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.project.entity.UserProjectResultEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;

/**
 * @author : smalljop
 * @description : 导出excel result
 * @create :  2021/03/18 16:18
 **/
@Data
@AllArgsConstructor
public class ExportProjectResultVO {

    /**
     * 字段默认前缀
     */
    public final static String FIELD_DEFAULT_PREFIX = "field";


    /**
     * 默认字段
     */
    public final static List<ExcelHeader> DEFAULT_HEADER_NAME = Lists.newArrayList(
            new ExcelHeader() {{
                setFieldKey(BaseEntity.Fields.createTime);
                setTitle("提交时间");
            }},
            new ExcelHeader() {{
                setFieldKey(UserProjectResultEntity.Fields.submitAddress);
                setTitle("提交地址");
            }});

    /**
     * 标题
     */
    private List<ExcelHeader> titleList;


    /**
     * 结果列表
     */
    private List<Map<String, Object>> resultList;


    /**
     * excel表头标题
     */
    @Data
    @NoArgsConstructor
    public static class ExcelHeader {

        private String fieldKey;

        private String title;


        public ExcelHeader(String fieldKey, String title) {
            this.fieldKey = FIELD_DEFAULT_PREFIX + fieldKey;
            this.title = title;
        }
    }


}
