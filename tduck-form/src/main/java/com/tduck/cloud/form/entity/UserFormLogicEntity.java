package com.tduck.cloud.form.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.mybatis.handler.JacksonTypeHandler;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import java.util.List;
import java.util.Set;

/**
 * 表单逻辑(UserFormLogic)表实体类
 *
 * @author smalljop
 * @since 2020-05-01 13:36:27
 */
@Data
@Accessors(chain = true)
@TableName(value = "fm_user_form_logic", autoResultMap = true)
public class UserFormLogicEntity extends BaseEntity<UserFormLogicEntity> {
    /**
     * 表单key
     */
    @NotBlank(message = "formKey不能为空")
    private String formKey;


    @TableField(typeHandler = JacksonTypeHandler.class)
    private List<Definition> scheme;

    /**
     * 逻辑定义对象
     */
    @Data
    public static class Definition {

        /**
         * 触发内容
         */
        private Set<Trigger> triggerList;
        /**
         * 条件
         */
        private Set<Condition> conditionList;
    }


    @Data
    public static class Trigger {
        /**
         * 表单项Id
         */
        private String formItemId;
        /**
         * 类型
         */
        private String type = "show";
    }

    /**
     * 条件
     */
    @Data
    public static class Condition {
        /**
         * 表单项Id
         */
        private String formItemId;
        /**
         * 表达式
         */
        private String expression;
        /**
         * 选项
         */
        private Object optionValue;


        /**
         * AND OR
         */
        private String relation;

    }

}