package com.tduck.cloud.project.request;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.util.StrUtil;
import com.tduck.cloud.common.entity.PageRequest;
import com.tduck.cloud.common.util.JsonUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldNameConstants;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.Map;

/**
 * @author : smalljop
 * @description : 项目结果查询
 * @create : 2020-12-08 15:55
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
@FieldNameConstants
public class QueryProjectResultRequest extends PageRequest {

    /**
     * 固定字段
     */
    private String projectKey;

    @DateTimeFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
    private LocalDateTime beginDateTime;
    @DateTimeFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
    private LocalDateTime endDateTime;


    /**
     * 动态字段 参数json
     */
    private String extParams;
    /**
     * 动态字段比较符 参数json
     */
    private String extComparisons;

    public Map<String, Object> getExtParamsMap() {
        if (StrUtil.isNotEmpty(extParams)) {
            return JsonUtils.jsonToMap(extParams);
        }
        return null;
    }


    public Map<String, Object> getExtComparisonsMap() {
        if (StrUtil.isNotEmpty(extComparisons)) {
            return JsonUtils.jsonToMap(extComparisons);
        }
        return null;
    }

    @Getter
    @AllArgsConstructor
    public enum QueryComparison {
        EQ("eq", "="),
        LIKE("like", "like");

        private String name;
        private String key;

        public static QueryComparison get(String name) {
            return Arrays.stream(QueryComparison.values()).filter(item -> item.name.equals(name)).findFirst().get();
        }
    }


}
