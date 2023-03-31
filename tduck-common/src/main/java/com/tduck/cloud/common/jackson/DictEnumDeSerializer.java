package com.tduck.cloud.common.jackson;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonStreamContext;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonNode;
import com.tduck.cloud.common.entity.IDictEnum;
import org.springframework.beans.BeanUtils;
import org.springframework.boot.jackson.JsonComponent;

import java.io.IOException;

@JsonComponent
public class DictEnumDeSerializer extends JsonDeserializer<IDictEnum> {


    /**
     * 反序列化的处理
     */
    @Override
    public IDictEnum deserialize(JsonParser jp, DeserializationContext context) throws IOException {
        JsonStreamContext parent = jp.getParsingContext();
        Object currentValue = parent.getCurrentValue();
        String currentName = parent.getCurrentName();
        JsonNode node = jp.getCodec().readTree(jp);
        Class clazz = BeanUtils.findPropertyType(currentName, currentValue.getClass());
        return IDictEnum.getInstance(clazz, node.asText());
    }
}