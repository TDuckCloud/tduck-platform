package com.tduck.cloud.form.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tduck.cloud.form.entity.UserFormItemEntity;
import com.tduck.cloud.form.vo.FormFieldVO;

import java.util.List;

/**
 * 表单表单项(FormItem)表服务接口
 *
 * @author smalljop
 * @since 2020-11-19 10:49:17
 */
public interface UserFormItemService extends IService<UserFormItemEntity> {


    /**
     * 根据key查询
     *
     * @param key
     * @return
     */
    List<UserFormItemEntity> listByFormKey(String key);

    /**
     * 查询自定义字段
     *
     * @param formKey 表单key
     * @return 自定义字段
     */
    List<FormFieldVO> listFormFields(String formKey);

    /**
     * 查询全部字段 包含默认字段
     *
     * @param formKey 表单key
     * @return 自定义字段
     */
    List<FormFieldVO> listAllFormFields(String formKey);


    /**
     * 查询最后一个字段的排序值
     *
     * @param formKey 表单key
     * @return 排序值
     */
    Long getLastItemSort(String formKey);

    /**
     * 检查字段是否是需要特殊处理字段 比如随机编号
     *
     * @param userFormItemEntity 字段
     * @return true 需要特殊处理
     */
    Boolean isSpecialTypeItem(UserFormItemEntity userFormItemEntity);


}
