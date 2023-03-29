package com.tduck.cloud.form.entity.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;
import com.tduck.cloud.common.entity.IDictEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * @author : smalljop
 * @description : 表单状态
 * @create : 2020-12-04 13:35
 **/
@Getter
@AllArgsConstructor
@NoArgsConstructor
public enum FormStatusEnum implements IDictEnum<Integer> {

    CREATE(1, "未发布"),
    RELEASE(2, "收集中"),
    STOP(3, "停止发布");


    @EnumValue
    @JsonValue
    private Integer value;

    private String desc;

}
