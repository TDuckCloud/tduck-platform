package com.tduck.cloud.api.config;

import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import com.tduck.cloud.common.entity.IDictEnum;
import com.tduck.cloud.common.jackson.DictEnumDeSerializer;
import com.tduck.cloud.common.jackson.DictEnumSerializer;
import com.tduck.cloud.common.jackson.LongToStringSerializer;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.jackson.Jackson2ObjectMapperBuilderCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.TimeZone;

/**
 * jackson 配置
 *
 * @author Lion Li
 */
@Slf4j
@Configuration
public class JacksonConfig {

    @Bean
    public Jackson2ObjectMapperBuilderCustomizer customizer() {
        return builder -> {
            // 全局配置序列化返回 JSON 处理
            JavaTimeModule javaTimeModule = new JavaTimeModule();
            javaTimeModule.addSerializer(Long.class, new LongToStringSerializer());
            javaTimeModule.addSerializer(Long.TYPE, new LongToStringSerializer());
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            javaTimeModule.addSerializer(LocalDateTime.class, new LocalDateTimeSerializer(formatter));
            javaTimeModule.addDeserializer(LocalDateTime.class, new LocalDateTimeDeserializer(formatter));
            // 注册枚举转换
            DictEnumSerializer dictEnumSerializer = new DictEnumSerializer();
            DictEnumDeSerializer dictEnumDeSerializer = new DictEnumDeSerializer();
            javaTimeModule.addSerializer(IDictEnum.class, dictEnumSerializer);
            javaTimeModule.addDeserializer(IDictEnum.class, dictEnumDeSerializer);
            builder.modules(javaTimeModule);
            builder.timeZone(TimeZone.getDefault());
            log.info("初始化 jackson 配置");
        };
    }

}
