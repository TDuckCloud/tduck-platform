package com.tduck.cloud.form.vo;

import com.tduck.cloud.form.entity.UserFormEntity;
import com.tduck.cloud.form.entity.UserFormItemEntity;
import com.tduck.cloud.form.entity.UserFormLogicEntity;
import com.tduck.cloud.form.entity.UserFormThemeEntity;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

/**
 * @author smalljop
 */
@Data
@AllArgsConstructor
public class UserFormDetailVO {
    /**
     * 表单基础信息
     */
    private UserFormEntity form;

    /**
     * 表单项
     */
    private List<UserFormItemEntity> formItems;

    /**
     * 主题
     */
    private UserFormThemeEntity userFormTheme;

    /**
     * 逻辑
     */
    private UserFormLogicEntity formLogic;
}
