package com.tduck.cloud.form.data;

import cn.hutool.core.convert.Convert;
import com.tduck.cloud.common.util.JsonUtils;
import com.tduck.cloud.form.entity.struct.ReserveSchemaStruct;

import java.util.Map;
import java.util.Optional;

/**
 * 预约类型格式化数据处理
 *
 * @author tduck
 */
public class ReserveDayFormatDataHandler implements BaseFormatDataHandler {

    @Override
    public Object formatData(String key, Object value, Object scheme) {
        ReserveSchemaStruct reserveSchemaStruct = JsonUtils.jsonToObj(JsonUtils.objToJson(scheme), ReserveSchemaStruct.class);
        StringBuffer inputValue = new StringBuffer();
        if (value instanceof Map && null != reserveSchemaStruct) {
            Map<String, Object> tableVal = Convert.toMap(String.class, Object.class, value);
            for (String rowKey : tableVal.keySet()) {
                Optional<ReserveSchemaStruct.ReserveProject> projectOptional = reserveSchemaStruct.getReserveProjectList().stream().filter(item -> rowKey.equals(item.getId().toString())).findFirst();
                Object rowVal = tableVal.get(rowKey);
                projectOptional.ifPresent(item -> inputValue.append(item.getName()).append("：").append(rowVal));
            }
        }
        return inputValue.toString();
    }
}
