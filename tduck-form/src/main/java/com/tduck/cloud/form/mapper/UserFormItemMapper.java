package com.tduck.cloud.form.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tduck.cloud.form.entity.UserFormItemEntity;
import org.apache.ibatis.annotations.Select;

/**
 * 表单项(FormItem)表数据库访问层
 *
 * @author smalljop
 * @since 2020-11-19 10:49:17
 */
public interface UserFormItemMapper extends BaseMapper<UserFormItemEntity> {

    @Select("SELECT  MAX(sort) FROM fm_user_form_item WHERE form_key= #{formKey}")
    Long selectLastFormItemSort(String formKey);
}