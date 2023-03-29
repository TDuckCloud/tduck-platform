package com.tduck.cloud.form.entity.struct.setting;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

/**
 * @author : tduck
 * @description : 设置结构定义  @JsonIgnore 不给前端返回的字段添加这个
 * @create :  2021/06/07 16:37
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class WriteSettingSchemaStruct {

    /**
     * 仅在微信填写
     */
    private boolean onlyWxWrite;
    /**
     * 记录微信用户信息
     */
    private boolean recordWxUser;
    /**
     * 本地保存未提交数据
     */
    private boolean saveSubmitStatus;
    /**
     * 本地保存未提交数据
     */
    private boolean saveNotSubmitStatus;
    /**
     * 开启密码填写
     */
    private boolean passwordWriteStatus;
    /**
     * 填写密码
     */
    @JsonIgnore
    private String writePassword;
    /**
     * 开启每个微信答题次数限制
     */
    @JsonIgnore
    private boolean wxWriteCountLimitStatus;
    /**
     * 每个微信答题次数限制次数
     */
    @JsonIgnore
    private int wxWriteCountLimit = 1;
    /**
     * 开启每个微信答题时间限制类型 具体查看DateRangeTypeEnum
     */
    @JsonIgnore
    private int wxWriteCountLimitDateType = 1;
    /**
     * 开启每个微信答题时间限制显示文案
     */
    @JsonIgnore
    private String wxWriteCountLimitText;
    /**
     * 每个IP答题次数限制
     */
    @JsonIgnore
    private boolean ipWriteCountLimitStatus;
    /**
     * 每个IP答题次数限制次数
     */
    @JsonIgnore
    private int ipWriteCountLimit = 1;
    /**
     * 开启每个IP答题时间限制类型 具体查看DateRangeTypeEnum
     */
    @JsonIgnore
    private int ipWriteCountLimitDateType = 1;
    /**
     * 开启每个IP答题时间限制显示文案
     */
    @JsonIgnore
    private String ipWriteCountLimitText;


    /**
     * 每个账号答题限制
     */
    @JsonIgnore
    private boolean accountWriteCountLimitStatus;
    /**
     * 每个IP答题次数限制次数
     */
    @JsonIgnore
    private int accountWriteCountLimit = 1;
    /**
     * 开启每个账号答题时间限制类型 具体查看DateRangeTypeEnum
     */
    @JsonIgnore
    private int accountWriteCountLimitDateType = 1;
    /**
     * 开启每个账号答题时间限制显示文案
     */
    @JsonIgnore
    private String accountWriteCountLimitText;


    /**
     * 每个设备答题限制
     */
    private boolean deviceWriteCountLimitStatus;
    /**
     * 每个设备答题次数限制次数
     */
    private int deviceWriteCountLimit = 1;

    /**
     * 每个设备答题文案
     */
    private String deviceWriteCountLimitText;


    /**
     * 累计答题数量
     */
    @JsonIgnore
    private boolean totalWriteCountLimitStatus;
    /**
     * 次数
     */
    @JsonIgnore
    private int totalWriteCountLimit = 1;
    /**
     * 累计答题日期范围类型
     */
    @JsonIgnore
    private int totalWriteCountLimitDateType = 1;
    /**
     * 累计答题日期范围显示文案
     */
    @JsonIgnore
    private String totalWriteCountLimitText;
    /**
     * 开启答题时间限制
     */
    @JsonIgnore
    private boolean writeInterviewTimeStatus;
    /**
     * 访问时间是否是一天内的某些小时
     */
    @JsonIgnore
    private boolean writeInterviewDayTimeStatus;
    /**
     * 允许访问访问时间范围
     */
    @JsonIgnore
    private List<String> writeInterviewDateTimeRange;
    /**
     * 允许访问访问日期范围
     */
    @JsonIgnore
    private List<String> writeInterviewDateRange;
    /**
     * 允许访问访问时间范围
     */
    @JsonIgnore
    private List<String> writeInterviewTimeRange;
    /**
     * 允许访问访问时间范围显示文案
     */
    @JsonIgnore
    private List<String> writeInterviewTimeWhichDays;
    /**
     * 不允许访问访问时间范围显示文案
     */
    @JsonIgnore
    private String writeInterviewTimeText;





    @AllArgsConstructor
    public static enum DateRangeType {
        /**
         * 总共
         */
        SUM(1),
        /**
         * 每天
         */
        DAY(2),
        /**
         * 每周
         */
        WEEK(3),
        /**
         * 每月
         */
        MONTH(4);
        @Getter
        private final int value;


        /**
         * 获取对应的日期范围类型
         *
         * @param value 值
         * @return 日期范围类型sql
         */
        public static String getDateSql(int value) {
            Date now = new Date();
            String sql = " create_time>='{}' and create_time<='{}'";
            for (DateRangeType type : DateRangeType.values()) {
                if (type.getValue() == value) {
                    switch (type) {
                        case DAY:
                            return StrUtil.format(sql, DateUtil.beginOfDay(now), DateUtil.endOfDay(now));
                        case WEEK:
                            return StrUtil.format(sql, DateUtil.beginOfWeek(now), DateUtil.endOfWeek(now));
                        case MONTH:
                            return StrUtil.format(sql, DateUtil.beginOfMonth(now), DateUtil.endOfMonth(now));
                        default:
                            return "";
                    }
                }
            }
            throw new IllegalArgumentException("不支持的日期范围类型");
        }

    }


}
