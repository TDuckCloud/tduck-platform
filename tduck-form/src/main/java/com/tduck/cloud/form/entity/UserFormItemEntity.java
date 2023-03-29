package com.tduck.cloud.form.entity;

import com.baomidou.mybatisplus.annotation.FieldStrategy;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.mybatis.handler.BooleanTypeHandler;
import com.tduck.cloud.common.mybatis.handler.JacksonTypeHandler;
import com.tduck.cloud.common.validator.group.AddGroup;
import com.tduck.cloud.common.validator.group.UpdateGroup;
import com.tduck.cloud.form.entity.enums.FormItemTypeEnum;
import com.tduck.cloud.form.util.HtmlUtils;
import lombok.Data;
import lombok.experimental.Accessors;
import lombok.experimental.FieldNameConstants;
import org.apache.ibatis.type.EnumTypeHandler;

import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.Map;
/**
 * 表单表单项(FormItem)表实体类
 *
 * @author smalljop
 * @since 2020-11-19 10:49:16
 */
@Data
@Accessors(chain = true)
@FieldNameConstants
@JsonIgnoreProperties(ignoreUnknown = true)
@TableName(value = "fm_user_form_item", autoResultMap = true)
public class UserFormItemEntity extends BaseEntity<UserFormItemEntity> {
    /**
     * 表单Id
     */
    @NotNull(message = "key请求异常", groups = {AddGroup.class, UpdateGroup.class})
    private String formKey;
    /**
     * 表单项Id 类型  + 时间戳
     */
    @NotNull(message = "Id请求错误", groups = {AddGroup.class, UpdateGroup.class})
    private String formItemId;
    /**
     * 表单项类型
     */
    @NotNull(message = "类型请求错误", groups = {AddGroup.class, UpdateGroup.class})
    @TableField(typeHandler = EnumTypeHandler.class)
    private FormItemTypeEnum type;
    /**
     * 表单项标题
     */
    @NotNull(message = "标题不能为空", groups = {AddGroup.class, UpdateGroup.class})
    private String label;


    /**
     * 展示类型组件 只在表单填写页查询到
     */
    @TableField(value = "is_display_type", typeHandler = BooleanTypeHandler.class)
    private Boolean displayType;

    /**
     * 隐藏类型组件 在表单填写页面无法查看到
     */
    @TableField(value = "is_hide_type", typeHandler = BooleanTypeHandler.class)
    private Boolean hideType;

    /**
     * 需要在入库前特殊处理的组件 比如随机编码等 验重
     */
    @TableField(value = "is_special_type", typeHandler = BooleanTypeHandler.class)
    private Boolean specialType;
    /**
     * 是否显示标签
     */
    @TableField(typeHandler = BooleanTypeHandler.class)
    private Boolean showLabel;

    /**
     * 表单项默认值
     */
    @TableField(updateStrategy = FieldStrategy.IGNORED)
    private String defaultValue;


    /**
     * 是否必填
     */
    @TableField(typeHandler = BooleanTypeHandler.class)
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
    private Map<String, Object> scheme;

    /**
     * 正则表达式
     */
    @TableField(typeHandler = JacksonTypeHandler.class)
    private List<Map<String, Object>> regList;


    /**
     * 去除html格式
     *
     * @return
     */
    public String getTextLabel() {
        return HtmlUtils.cleanHtmlTag(this.label);
    }


}