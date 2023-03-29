package com.tduck.cloud.form.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.form.entity.UserFormDataEntity;
import com.tduck.cloud.form.request.QueryFormResultRequest;
import com.tduck.cloud.form.vo.FormDataTableVO;

import java.util.List;
import java.util.Map;

/**
 * 表单表单项(FormResult)表服务接口
 *
 * @author smalljop
 * @since 2020-11-23 14:09:22
 */
public interface UserFormDataService extends IService<UserFormDataEntity> {


    /**
     * 保存结果
     *
     * @param entity 表单数据
     * @return 结果
     */
    Map<String, Object> saveFormResult(UserFormDataEntity entity);


    /**
     * 下载表单结果中的附件
     *
     * @param request 请求
     * @return
     */
    Result downloadFormResultFile(QueryFormResultRequest request);


    /**
     * 查询表单数据
     *
     * @param request
     * @return
     */
    FormDataTableVO listFormDataTable(QueryFormResultRequest request);

    /**
     * 根据Id删除
     *
     * @param dataIdList
     * @param formKey
     * @return
     */
    Boolean deleteByIds(List<String> dataIdList, String formKey);

    /**
     * 修改
     *
     * @param entity
     * @return
     */
    Boolean updateFormResult(UserFormDataEntity entity);

    /**
     * 获取数据详情
     *
     * @param dataId
     * @return
     */
    Result getFormDataDetails(String dataId);
}
