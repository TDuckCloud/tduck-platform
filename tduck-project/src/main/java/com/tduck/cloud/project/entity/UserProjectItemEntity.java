package com.tduck.cloud.project.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.mybatis.handler.JacksonTypeHandler;
import com.tduck.cloud.project.entity.enums.ProjectItemTypeEnum;
import com.tduck.cloud.project.entity.struct.ItemDefaultValueStruct;
import lombok.Data;
import lombok.experimental.Accessors;
import lombok.experimental.FieldNameConstants;
import org.apache.ibatis.type.EnumTypeHandler;

import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.Map;

/**
 * 项目表单项(ProjectItem)表实体类
 *
 * @author smalljop
 * @since 2020-11-19 10:49:16
 */
@Data
@Accessors(chain = true)
@TableName(value = "pr_user_project_item", autoResultMap = true)
@FieldNameConstants
public class UserProjectItemEntity extends BaseEntity<UserProjectItemEntity> {
    private Long id;
    /**
     * 项目Id
     */
    @NotNull(message = "非法请求")
    private String projectKey;
    /**
     * 表单项Id
     */
    private Long formItemId;
    /**
     * 表单项类型
     */
    @NotNull(message = "非法请求")
    @TableField(typeHandler = EnumTypeHandler.class)
    private ProjectItemTypeEnum type;
    /**
     * 表单项标题
     */
    private String label;


    /**
     * 展示类型组件
     */
    @TableField("is_display_type")
    private Boolean displayType;
    /**
     * 是否显示标签
     */
    private Boolean showLabel;

    /**
     * 表单项默认值
     */
    @TableField(typeHandler = JacksonTypeHandler.class)
    private ItemDefaultValueStruct defaultValue;


    /**
     * 是否必填
     */
    private Boolean required;
    /**
     * 输入型提示文字
     */
    private String placeholder;
    /**
     * 排序
     */
    private Long sort;

    /**
     * 栅格宽度
     */
    private int span;

    /**
     * 扩展字段 表单项独有字段
     */
    @TableField(typeHandler = JacksonTypeHandler.class)
    private Map<String, Object> expand;

    /**
     * 正则表达式
     */
    @TableField(typeHandler = JacksonTypeHandler.class)
    private List<Map<String, Object>> regList;


}