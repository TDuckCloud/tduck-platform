package com.tduck.cloud.form.entity.struct;

import com.tduck.cloud.common.util.JsonUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

/**
 * @author : smalljop
 * @description : 选项结构
 * @create :  2021/06/07 16:37
 **/

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CheckboxSchemaStruct {

    private Config config;



    @Data
    public static class Config extends OptionQuotaListStruct{
        private boolean showVoteResult;
    }





    public static CheckboxSchemaStruct builder(Map<String, Object> params) {
        return JsonUtils.objToObj(params, CheckboxSchemaStruct.class);
    }
}
