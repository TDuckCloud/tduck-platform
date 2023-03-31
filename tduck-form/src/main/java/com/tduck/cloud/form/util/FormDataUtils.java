package com.tduck.cloud.form.util;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.entity.SysBaseEntity;
import com.tduck.cloud.form.constant.FormConstants;
import com.tduck.cloud.form.entity.UserFormDataEntity;
import com.tduck.cloud.form.entity.UserFormEntity;
import com.tduck.cloud.form.entity.enums.FormItemTypeEnum;
import com.tduck.cloud.form.entity.enums.FormTypeEnum;
import com.tduck.cloud.form.request.QueryFormResultRequest;
import com.tduck.cloud.form.service.data.FormDataBaseService;
import com.tduck.cloud.form.vo.FormDataTableVO;
import com.tduck.cloud.form.vo.FormFieldVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author : tduck
 * @description : 表单收集结果工具类
 * @create :  2021/08/18 18:17
 **/
@Slf4j
@Component
@RequiredArgsConstructor
public class FormDataUtils {


    /**
     * 特殊字段 会多出一个xxx label字段存放显示值 默认字段存放原始值
     */
    public static final List<FormItemTypeEnum> specialFields = CollUtil.newArrayList(FormItemTypeEnum.SELECT, FormItemTypeEnum.IMAGE_SELECT, FormItemTypeEnum.CHECKBOX, FormItemTypeEnum.RADIO, FormItemTypeEnum.CASCADER);

    private final static String FIELD_USER_TYPE = "USER";

    private final FormDataBaseService formDataBaseService;

    /**
     * 添加表单基础数据字段
     * 所有表单都包含的字段
     */
    public static void addFormBaseDataField(List<FormFieldVO> fields) {
        fields.add(new FormFieldVO(UserFormDataEntity.Fields.serialNumber, "提交序号", UserFormDataEntity.Fields.serialNumber));
        fields.add(new FormFieldVO(UserFormDataEntity.Fields.extValue, "扩展字段", FormItemTypeEnum.INPUT.toString()));
        fields.add(new FormFieldVO(SysBaseEntity.Fields.updateBy, "修改用户", FIELD_USER_TYPE));
        fields.add(new FormFieldVO(SysBaseEntity.Fields.createBy, "提交用户", FIELD_USER_TYPE));
        fields.add(new FormFieldVO(BaseEntity.Fields.createTime, "提交时间", FormItemTypeEnum.DATE.toString()));
        fields.add(new FormFieldVO(BaseEntity.Fields.updateTime, "修改时间", FormItemTypeEnum.DATE.toString()));

    }


    /**
     * 添加系统默认字段
     */
    public static void addFormDefaultDataField(UserFormEntity entity, List<FormFieldVO> fields) {
        addFormBaseDataField(fields);
    }


    /***
     * 表单字段值是否存在
     * @param formKey 表单key
     * @param formItemId 表单字段id
     * @param value 字段值
     */
    public Boolean valueExist(String formKey, String formItemId, Object value) {
        return formDataBaseService.valueExist(formKey, formItemId, value);
    }


    /**
     * 特殊字段添加复合字段
     */
    public List<String> concatSpecialField(List<String> fields) {
        List<String> newFields = CollUtil.newArrayList("id");
        if (CollUtil.isEmpty(fields)) {
            return newFields;
        }
        fields.forEach(field -> {
            newFields.add(field);
            boolean isSpecialField = StrUtil.startWithAny(field, specialFields.stream().map(item -> item.toString().toLowerCase()).collect(Collectors.joining(",")));
            if (isSpecialField) {
                newFields.add(field + "label");
            }
        });
        return newFields;
    }


    /**
     * 保存数据到其他数据库 比如es MonggDB等 用来扩展查询 作报表等
     */
    public Boolean syncSaveFormData(UserFormDataEntity result) {
        return formDataBaseService.syncSaveData(result);
    }


    /**
     * 更新文档
     *
     * @param result
     */
    public void asyncUpdateEsDocument(UserFormDataEntity result) {
        formDataBaseService.asyncUpdateData(result);
    }

    /**
     * 删除索引文档
     *
     * @param idList  doc Id
     * @param formKey index
     */
    public void asyncDeleteEsDocument(List<String> idList, String formKey) {
        formDataBaseService.asyncDeleteData(idList, formKey);
    }


    /**
     * 查询表单分页数据
     *
     * @param request 查询参数
     * @return 表单分页数据
     */
    public FormDataTableVO search(QueryFormResultRequest request) {
        return formDataBaseService.search(request);
    }

    /**
     * 全部数据
     *
     * @param request 请求
     * @return 表单数据
     */
    public List<Map> searchAll(QueryFormResultRequest request) {
        return formDataBaseService.searchAll(request);
    }





}
