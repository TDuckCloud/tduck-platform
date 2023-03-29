package com.tduck.cloud.form.data;

import cn.hutool.core.convert.Convert;
import com.tduck.cloud.common.util.JsonUtils;
import com.tduck.cloud.form.entity.struct.MatrixInputSchemaStruct;

import java.util.Map;
import java.util.Optional;

/**
 * 矩阵单选类型格式化数据处理
 *
 * @author tduck
 */
public class MatrixInputFormatDataHandler implements BaseFormatDataHandler {

    @Override
    public Object formatData(String key, Object value, Object scheme) {
        MatrixInputSchemaStruct matrixInputSchema = JsonUtils.jsonToObj(JsonUtils.objToJson(scheme), MatrixInputSchemaStruct.class);
        StringBuffer inputValue = new StringBuffer();
        Map<String, Object> tableVal = Convert.toMap(String.class, Object.class, value);
        if (value instanceof Map && null != matrixInputSchema) {
            for (String rowKey : tableVal.keySet()) {
                Optional<MatrixInputSchemaStruct.Item> rowOptional = matrixInputSchema.getTable().getRows().stream().filter(item -> rowKey.equals(item.getId())).findFirst();
                StringBuffer rowValue = new StringBuffer();
                Map<String, Object> row = Convert.toMap(String.class, Object.class, tableVal.get(rowKey));
                for (String colKey : row.keySet()) {
                    Optional<MatrixInputSchemaStruct.Item> optional = matrixInputSchema.getTable().getColumns().stream().filter(item -> colKey.equals(item.getId())).findFirst();
                    optional.ifPresent(item -> rowValue.append(item.getLabel()).append("：").append(row.get(colKey)).append("，"));
                }
                rowOptional.ifPresent(item -> inputValue.append(item.getLabel()).append("：（").append(rowValue).append("）"));
            }
        }
        return inputValue.toString();
    }
}
