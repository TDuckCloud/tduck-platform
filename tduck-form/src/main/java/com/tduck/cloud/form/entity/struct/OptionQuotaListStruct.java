package com.tduck.cloud.form.entity.struct;

import lombok.Data;

import java.util.List;

/**
 * @author : tduck
 * @description :
 * @create :  2022/09/26 16:14
 **/
@Data
public class OptionQuotaListStruct {
    private List<Option> options;


    /**
     * 剩余名额为0时，显示文案
     */
    private String quotaBlankWarning;


    /**
     * 名额重置
     */
    private String quotaCycleRule;


    public enum QuotaCycleRule {
        /**
         * 不重置
         */
        FIXED,
        /**
         * 每天
         */
        PER_DAY,
        /**
         * 每周
         */
        PER_WEEK;
    }


    @Data
    public static class Option {
        private String label;
        private String value;
        private Integer quotaSetting;
    }

}
