package com.tduck.cloud.form.util;


import cn.hutool.core.util.ObjectUtil;
import com.tduck.cloud.common.exception.BaseException;
import com.tduck.cloud.common.util.SecurityUtils;
import com.tduck.cloud.common.util.SpringContextUtils;
import com.tduck.cloud.form.entity.UserFormEntity;
import com.tduck.cloud.form.service.UserFormService;
import lombok.experimental.UtilityClass;


/**
 * 表单权限工具类
 *
 * @author tduck
 */
@UtilityClass
public class FormAuthUtils {


    /**
     * 是否拥有表单的权限
     */
    public void hasPermission(String formKey) {
        // 是否是超级管理员
        if (SecurityUtils.isAdmin(SecurityUtils.getUserId())) {
            return;
        }
        UserFormService userFormService = SpringContextUtils.getBean(UserFormService.class);
        UserFormEntity userFormEntity = userFormService.getByKey(formKey);
        if(ObjectUtil.isNull(userFormEntity)){
            return;
        }
        // 是否是所有者
        if (!userFormEntity.getUserId().equals(SecurityUtils.getUserId())) {
            throw new BaseException("无表单权限");
        }
    }


}
