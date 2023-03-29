package com.tduck.cloud.form.entity.struct;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class ExamConfigSchemaStruct {

    /**
     * 是否启用考试
     */
    private Boolean enableScore;

    /**
     * 积分方式
     */
    private String scoringType;


    /**
     * 分数
     */
    private BigDecimal score;

    /**
     * 答案
     */
    private String answer;
}
