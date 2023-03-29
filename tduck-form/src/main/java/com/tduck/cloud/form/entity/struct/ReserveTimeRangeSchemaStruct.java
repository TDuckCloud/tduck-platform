package com.tduck.cloud.form.entity.struct;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author : tudck
 * @description : 预约时段结构
 * @create :  2021/06/07 16:37
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReserveTimeRangeSchemaStruct {


    private List<ReserveProject> reserveProjectList;


    @Data
    public static class ReserveProject {
        private Long id;
        private String name;

        /**
         * 库存时段
         */
        private List<TimeRange> timeRangeList;
    }

    @Data
    public static class TimeRange {
        private List<String> timeRange;
        private Integer value;
    }


}
