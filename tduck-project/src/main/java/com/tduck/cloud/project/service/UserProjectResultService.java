package com.tduck.cloud.project.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.project.entity.UserProjectResultEntity;
import com.tduck.cloud.project.request.QueryProjectResultRequest;
import com.tduck.cloud.project.vo.ExportProjectResultVO;

/**
 * 项目表单项(ProjectResult)表服务接口
 *
 * @author smalljop
 * @since 2020-11-23 14:09:22
 */
public interface UserProjectResultService extends IService<UserProjectResultEntity> {


    /**
     * 保存结果
     *
     * @param entity
     */
    void saveProjectResult(UserProjectResultEntity entity);

    /**
     * 根据查询参数
     *
     * @param request
     * @return
     */
    Page listByQueryConditions(QueryProjectResultRequest request);


    /**
     * 导出excel
     *
     * @param request
     * @return
     */
    ExportProjectResultVO exportProjectResult(QueryProjectResultRequest request);

    /**
     * 下载项目结果中的附件
     *
     * @param request
     * @return
     */
    Result downloadProjectResultFile(QueryProjectResultRequest request);
}