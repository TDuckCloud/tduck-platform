package com.tduck.cloud.form.entity.struct;

import com.tduck.cloud.common.util.JsonUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

/**
 * @author : smalljop
 * @description : 上传收集结果
 * @create :  2021/06/07 16:37
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class InputResultStruct {

    /**
     * 不允许重复
     */
    private boolean notRepeat;


    public static InputResultStruct builder(Map<String, Object> params) {
        return JsonUtils.objToObj(params, InputResultStruct.class);
    }
}
