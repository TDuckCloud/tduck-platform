package com.tduck.cloud.project.request;

import com.tduck.cloud.common.validator.group.AddGroup;
import com.tduck.cloud.common.validator.group.UpdateGroup;
import com.tduck.cloud.project.entity.enums.ProjectItemTypeEnum;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.Map;

/**
 * @author : smalljop
 * @description : 保存项目项请求
 * @create : 2020-11-20 10:14
 **/
@Data
public class OperateProjectItemRequest {
    /**
     * 项目Id
     */
    @NotNull(message = "key请求异常", groups = {AddGroup.class, UpdateGroup.class, DeleteGroup.class})
    private String projectKey;
    /**
     * 表单项Id
     */
    @NotNull(message = "Id请求错误", groups = {AddGroup.class, UpdateGroup.class, DeleteGroup.class})
    private String formItemId;
    /**
     * 表单项类型
     */
    @NotNull(message = "类型请求错误", groups = {AddGroup.class, UpdateGroup.class, DeleteGroup.class})
    private ProjectItemTypeEnum type;
    /**
     * 表单项标题
     */
    @NotNull(message = "类型请求错误", groups = {AddGroup.class, UpdateGroup.class})
    private String label;


    /**
     * 是否有输入值
     */
    private Boolean displayType;
    /***
     * 是否显示标签
     */
    private Boolean showLabel;

    /**
     * 表单项默认值
     */
    private Object defaultValue;
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
    private Integer sort;
    /**
     * 栅格宽度
     */
    private String span;

    /**
     * 扩展字段 表单项独有字段
     */
    private Map<String, Object> expand;

    /**
     * 正则表达式
     */
    private List<Map<String, Object>> regList;

    /**
     * 删除组
     */
    public static interface DeleteGroup {

    }


}
