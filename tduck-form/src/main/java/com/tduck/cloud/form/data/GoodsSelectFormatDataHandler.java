package com.tduck.cloud.form.data;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.ObjectUtil;
import com.tduck.cloud.common.util.JsonUtils;
import com.tduck.cloud.form.entity.struct.GoodsSchemaStruct;

import java.util.Map;
import java.util.Optional;

/**
 * 商品类型格式化数据处理
 *
 * @author tduck
 */
public class GoodsSelectFormatDataHandler implements BaseFormatDataHandler {

    @Override
    public Object formatData(String key, Object value, Object scheme) {
        GoodsSchemaStruct goodsSchemaStruct = JsonUtils.jsonToObj(JsonUtils.objToJson(scheme), GoodsSchemaStruct.class);
        StringBuffer inputValue = new StringBuffer();
        if (value instanceof Map && null != goodsSchemaStruct) {
            Map<String, Object> tableVal = Convert.toMap(String.class, Object.class, value);
            for (String rowKey : tableVal.keySet()) {
                if (ObjectUtil.isNotNull(goodsSchemaStruct)) {
                    continue;
                }
                Optional<GoodsSchemaStruct.Goods> goodsOptional = goodsSchemaStruct.getGoodsList().stream()
                        .filter(item -> rowKey.equals(item.getId())).findFirst();
                Object rowVal = tableVal.get(rowKey);
                goodsOptional.ifPresent(item -> inputValue.append(item.getGoodsName()).append("：").append(rowVal).append("件"));
            }
        }
        return inputValue.toString();
    }
}
