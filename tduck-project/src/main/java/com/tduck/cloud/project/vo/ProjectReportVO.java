package com.tduck.cloud.project.vo;

import com.google.common.base.Objects;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;

/**
 * @author : smalljop
 * @description : 项目报表
 * @create :  2020/12/31 16:03
 **/
@Data
public class ProjectReportVO {

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
     * 填写统计
     */
    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class Situation {
        private String createTime;

        private Integer count;


        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            Situation situation = (Situation) o;
            return Objects.equal(createTime, situation.createTime);
        }

        @Override
        public int hashCode() {
            return Objects.hashCode(createTime);
        }
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
        private List<String> fieldName;
        /**
         * 数据集
         */
        private List<Integer> data;
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
