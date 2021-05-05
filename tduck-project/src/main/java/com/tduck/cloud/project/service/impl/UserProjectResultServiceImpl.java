package com.tduck.cloud.project.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.collect.Sets;
import com.tduck.cloud.common.constant.CommonConstants;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.exception.BaseException;
import com.tduck.cloud.common.util.AddressUtils;
import com.tduck.cloud.common.util.RedisUtils;
import com.tduck.cloud.project.entity.UserProjectItemEntity;
import com.tduck.cloud.project.entity.UserProjectResultEntity;
import com.tduck.cloud.project.entity.enums.ProjectItemTypeEnum;
import com.tduck.cloud.project.mapper.UserProjectResultMapper;
import com.tduck.cloud.project.request.QueryProjectResultRequest;
import com.tduck.cloud.project.service.UserProjectItemService;
import com.tduck.cloud.project.service.UserProjectResultService;
import com.tduck.cloud.project.vo.ExportProjectResultVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import static com.tduck.cloud.project.constant.ProjectRedisKeyConstants.PROJECT_RESULT_NUMBER;

/**
 * 项目表单项(ProjectResult)表服务实现类
 *
 * @author smalljop
 * @since 2020-11-23 14:09:22
 */
@Service("projectResultService")
@RequiredArgsConstructor
public class UserProjectResultServiceImpl extends ServiceImpl<UserProjectResultMapper, UserProjectResultEntity> implements UserProjectResultService {

    private final UserProjectItemService userProjectItemService;
    private final RedisUtils redisUtils;


    /**
     * 需要处理类型
     */
    private final Set<ProjectItemTypeEnum> needProcessItemTypeSet =
            Sets.newHashSet(ProjectItemTypeEnum.SELECT, ProjectItemTypeEnum.RADIO, ProjectItemTypeEnum.CHECKBOX, ProjectItemTypeEnum.CASCADER);


    @Override
    public void saveProjectResult(UserProjectResultEntity entity) {
        String projectKey = entity.getProjectKey();
        entity.setSerialNumber(redisUtils.incr(PROJECT_RESULT_NUMBER, CommonConstants.ConstantNumber.ONE));
        entity.setSubmitAddress(AddressUtils.getRealAddressByIP(entity.getSubmitRequestIp()));
        this.save(entity);

    }

    @Override
    public Page listByQueryConditions(QueryProjectResultRequest request) {
        return this.page(request.toMybatisPage(), Wrappers.<UserProjectResultEntity>lambdaQuery()
                .eq(UserProjectResultEntity::getProjectKey, request.getProjectKey())
                .le(ObjectUtil.isNotNull(request.getEndDateTime()), UserProjectResultEntity::getCreateTime, request.getEndDateTime())
                .ge(ObjectUtil.isNotNull(request.getBeginDateTime()), UserProjectResultEntity::getCreateTime, request.getBeginDateTime())
                .orderByDesc(BaseEntity::getCreateTime));
    }

    @Override
    public ExportProjectResultVO exportProjectResult(QueryProjectResultRequest request) {
        //问题列表
        String projectKey = request.getProjectKey();
        List<UserProjectItemEntity> userProjectItemEntityList = userProjectItemService.listByProjectKey(projectKey);
        // excel 标题列
        List<ExportProjectResultVO.ExcelHeader> titleList = userProjectItemEntityList.stream()
                .map(item -> new ExportProjectResultVO.ExcelHeader(item.getFormItemId().toString(), item.getLabel()))
                .collect(Collectors.toList());
        //结果
        List<UserProjectResultEntity> resultEntityList = this.list(Wrappers.<UserProjectResultEntity>lambdaQuery()
                .eq(UserProjectResultEntity::getProjectKey, request.getProjectKey())
                .le(ObjectUtil.isNotNull(request.getEndDateTime()), UserProjectResultEntity::getCreateTime, request.getEndDateTime())
                .ge(ObjectUtil.isNotNull(request.getBeginDateTime()), UserProjectResultEntity::getCreateTime, request.getBeginDateTime())
                .orderByDesc(BaseEntity::getCreateTime));
        if (CollectionUtil.isEmpty(resultEntityList)) {
            throw new BaseException("此表单无有效反馈，不能导出");
        }
        List<Map<String, Object>> resultList = resultEntityList.stream().map(item -> {
            Map<String, Object> processData = item.getProcessData();
            Iterator<String> iterator = processData.keySet().iterator();
            while (iterator.hasNext()) {
                String key = iterator.next();
                if (!titleList.stream()
                        .map(ExportProjectResultVO.ExcelHeader::getFieldKey).collect(Collectors.toList()).contains(key)) {
                    iterator.remove();
                }
            }

            processData.put(BaseEntity.Fields.createTime, item.getCreateTime());
            processData.put(UserProjectResultEntity.Fields.submitAddress, item.getSubmitAddress());
            return processData;
        }).collect(Collectors.toList());
        List<ExportProjectResultVO.ExcelHeader> allHeaderList = ExportProjectResultVO.DEFAULT_HEADER_NAME;
        allHeaderList.addAll(titleList);
        return new ExportProjectResultVO(allHeaderList, resultList);
    }
}