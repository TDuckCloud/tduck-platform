package com.tduck.cloud.form.entity.struct;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.LinkedList;

/**
 * @author : smalljop
 * @description : 上传收集结果
 * @create :  2021/06/07 16:37
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RandomNumberResultStruct {

    private boolean submitVisible;

    private LinkedList<Rule> rules;

    public enum RuleType {
        /**
         * 随机数
         */
        RAND_NUMBER
    }

    @Data
    public static class Rule {
        // 规则类型
        private RuleType type;
        // 规则名称
        private String label;
        //长度
        private Integer length;
    }


}
