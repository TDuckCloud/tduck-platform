
package com.tduck.cloud.form.entity.enums;

import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * @author : tduck
 * @description : 时间范围枚举
 * @create :  2022/10/11 11:12
 **/
@NoArgsConstructor
@Getter
public enum TimeRangeEnum {
    /**
     * 今天
     */
    TODAY,
    /**
     * 昨天
     */
    YESTERDAY,
    /**
     * 近7天
     */
    WEEK,
    /**
     * 上周
     */
    LAST_WEEK,
    /**
     * 本月
     */
    MONTH,
    /**
     * 上月
     */
    LAST_MONTH,
    /**
     * 本季度
     */
    QUARTER,
    /**
     * 上季度
     */
    LAST_QUARTER,
    /**
     * 本年
     */
    YEAR,
    /**
     * 去年
     */
    LAST_YEAR;


}
