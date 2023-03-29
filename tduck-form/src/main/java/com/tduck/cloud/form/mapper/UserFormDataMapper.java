package com.tduck.cloud.form.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tduck.cloud.form.entity.UserFormDataEntity;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 表单表单数据(FormResult)表数据库访问层
 *
 * @author smalljop
 * @since 2020-11-23 14:09:21
 */
public interface UserFormDataMapper extends BaseMapper<UserFormDataEntity> {

    /**
     * 查询表单字段值是否存在
     *
     * @param field 字段
     * @param value 值
     * @return 是否存在
     */

    @Select("SELECT COUNT(id) FROM fm_user_form_data WHERE form_key = #{formKey} AND JSON_EXTRACT(original_data, '$.\"${field}\"') = #{value}")
    Long selectOriginalDataValueCount(@Param("formKey") String formKey, @Param("field") String field, @Param("value") Object value);

    List<UserFormDataEntity> selectRowsBySql(@Param("sql") String sql);


    Long selectCountBySql(@Param("sql") String sql);

}