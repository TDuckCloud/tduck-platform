package com.tduck.cloud.form.data;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.convert.Convert;
import com.tduck.cloud.common.util.JsonUtils;
import com.tduck.cloud.form.entity.struct.MatrixSelectSchemaStruct;

import java.util.Collection;
import java.util.Map;
import java.util.Optional;

/**
 * 矩阵选择类型格式化数据处理
 *
 * @author tduck
 */
public class MatrixSelectFormatDataHandler implements BaseFormatDataHandler {

    @Override
    public Object formatData(String key, Object value, Object scheme) {
        MatrixSelectSchemaStruct matrixSelectSchema = JsonUtils.jsonToObj(JsonUtils.objToJson(scheme), MatrixSelectSchemaStruct.class);
        StringBuffer inputValue = new StringBuffer();
        if (value instanceof Map && null != matrixSelectSchema) {
            Map<String, Object> tableVal = Convert.toMap(String.class, Object.class, value);
            for (String rowKey : tableVal.keySet()) {
                Optional<MatrixSelectSchemaStruct.Item> rowOptional = matrixSelectSchema.getTable().getRows().stream().filter(item -> rowKey.equals(item.getId())).findFirst();
                Object rowVal = tableVal.get(rowKey);
                if (rowVal instanceof Collection) {
                    rowOptional.ifPresent(item -> inputValue.append(item.getLabel()).append("：（").append(CollUtil.join((Convert.toList(rowVal)), ",")).append("）"));
                } else {
                    rowOptional.ifPresent(item -> inputValue.append(item.getLabel()).append("：（").append(rowVal).append("）"));
                }
            }
        }
        return inputValue.toString();
    }
}
