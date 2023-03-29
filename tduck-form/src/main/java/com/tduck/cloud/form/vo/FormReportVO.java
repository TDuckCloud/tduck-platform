package com.tduck.cloud.form.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Collection;
import java.util.Map;
import java.util.Set;

/**
 * @author : smalljop
 * @description : 表单报表
 * @create :  2020/12/31 16:03
 **/
@Data
public class FormReportVO {

    @Data
    public static class Source {
        private String browserName;

        private Integer count;

    }

    @Data
    public static class Device {
        private String osName;

        private Integer count;

    }




    /**
     * 位置
     */
    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class Position {
        /**
         * 提交地址 省+市
         */
        private String submitAddress;
        /**
         * 提交省
         */
        private String submitProvince;
        /**
         * 数量
         */
        private Integer count;

    }


    /**
     * 反馈数据分析
     */
    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class Analysis {
        /**
         * 类型
         */
        private String type;
        /**
         * 题目名称
         */
        private String label;
        /**
         * 标签集
         */
        private Set<String> fieldName;
        /**
         * 数据集
         */
        private Collection<Integer> data;
        /**
         * 合集
         */
        private Map map;
        /**
         * 图表类型
         */
        private String chartType = "pie";
    }
}
