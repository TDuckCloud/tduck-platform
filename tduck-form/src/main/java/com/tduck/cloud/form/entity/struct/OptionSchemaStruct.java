package com.tduck.cloud.form.entity.struct;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.tduck.cloud.common.util.SpringContextUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author : smalljop
 * @description : 选项结构
 * @create :  2021/06/07 16:37
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class OptionSchemaStruct {

    private Config config;

    @Data
    public static class Config {
        // 0 静态数据  1 动态数据 2 字典数据
        private String optionsType;
        private List<Option> options;
        // 字典类型
        private String dictOptionType;

        public List<Option> getOptions() {
            if (StrUtil.isBlank(optionsType) || optionsType.equals("0")) {
                return options;
            }
            return CollUtil.newArrayList();
        }
    }


    @Data
    public static class Option {
        private String label;
        private String value;
    }
}
