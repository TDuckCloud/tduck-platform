package com.tduck.cloud.form.entity.struct;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;

/**
 * @author : smalljop
 * @description : 选项结构
 * @create :  2021/06/07 16:37
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReserveSchemaStruct {


    private List<ReserveProject> reserveProjectList;



    @Data
    public static class ReserveProject{
        private Long id;
        private String name;
        /**
         * 每周天库存
         */
        private Map<Integer, Integer> quotaWeek;
    }



}
