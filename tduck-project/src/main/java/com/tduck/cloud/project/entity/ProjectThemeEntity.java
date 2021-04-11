package com.tduck.cloud.project.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.mybatis.handler.JacksonTypeHandler;
import lombok.Data;
import lombok.experimental.FieldNameConstants;

import java.util.List;


/**
 * 项目主题外观模板(ProjectTheme)表实体类
 *
 * @author smalljop
 * @since 2020-11-23 18:33:50
 */
@Data
@TableName(value = "pr_project_theme", autoResultMap = true)
@FieldNameConstants
public class ProjectThemeEntity extends BaseEntity<ProjectThemeEntity> {

    private Long id;
    /**
     * 主题名称
     */
    private String name;
    /**
     * 主题风格
     */
    @TableField(typeHandler = JacksonTypeHandler.class)
    private List<String> style;
    /**
     * 头部图片
     */
    private String headImgUrl;

    /**
     * 按钮颜色
     */
    private String btnsColor;

    /**
     * 颜色代码
     */
    @TableField(typeHandler = JacksonTypeHandler.class)
    private List<String> color;


}