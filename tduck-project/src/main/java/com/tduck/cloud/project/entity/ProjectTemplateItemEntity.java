package com.tduck.cloud.project.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.mybatis.handler.JacksonTypeHandler;
import com.tduck.cloud.project.entity.enums.ProjectItemTypeEnum;
import com.tduck.cloud.project.entity.struct.ItemDefaultValueStruct;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.Map;


/**
 * 项目表单项(ProjectTemplateItem)表实体类
 *
 * @author smalljop
 * @since 2021-01-06 11:14:45
 */

@Data
@TableName(value = "pr_project_template_item", autoResultMap = true)
public class ProjectTemplateItemEntity extends BaseEntity<ProjectTemplateItemEntity> {
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
    private ProjectItemTypeEnum type;
    /**
     * 表单项标题
     */
    private String label;

    /**
     * 是否显示标签
     */
    private Boolean showLabel;


    /**
     * 展示类型组件
     */
    @TableField("is_display_type")
    private Boolean displayType;
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
     * 栅格宽度
     */
    private Integer span;
    /**
     * 排序
     */
    private Long sort;
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