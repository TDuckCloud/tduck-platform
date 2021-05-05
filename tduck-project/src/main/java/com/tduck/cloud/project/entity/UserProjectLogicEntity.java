package com.tduck.cloud.project.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.mybatis.handler.JacksonTypeHandler;
import com.tduck.cloud.project.entity.enums.ProjectLogicExpressionEnum;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import java.util.Set;

/**
 * 项目逻辑(UserProjectLogic)表实体类
 *
 * @author smalljop
 * @since 2020-05-01 13:36:27
 */
@Data
@Accessors(chain = true)
@TableName(value = "pr_user_project_logic", autoResultMap = true)
public class UserProjectLogicEntity extends BaseEntity<UserProjectLogicEntity> {
    private Long id;
    /**
     * 项目key
     */
    @NotBlank(message = "projectKey不能为空")
    private String projectKey;
    /**
     * 表单项Id
     */
    private Long formItemId;
    /**
     * 条件成立的表达式
     */
    private ProjectLogicExpressionEnum expression;


    /**
     * 条件
     */
    @TableField(typeHandler = JacksonTypeHandler.class)
    private Set<Condition> conditionList;


    /**
     * 条件
     */
    @Data
    public static class Condition {
        /**
         * 表单项Id
         */
        private Long formItemId;
        /**
         * 表达式
         */
        private String expression;
        /**
         * 选项
         */
        private Object optionValue;
    }

}