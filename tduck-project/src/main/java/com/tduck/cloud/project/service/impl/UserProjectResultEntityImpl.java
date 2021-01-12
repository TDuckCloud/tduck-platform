package com.tduck.cloud.project.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.collect.Sets;
import com.tduck.cloud.common.constant.CommonConstants;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.util.AddressUtils;
import com.tduck.cloud.common.util.RedisUtils;
import com.tduck.cloud.project.entity.UserProjectResultEntity;
import com.tduck.cloud.project.entity.enums.ProjectItemTypeEnum;
import com.tduck.cloud.project.mapper.UserProjectResultMapper;
import com.tduck.cloud.project.request.QueryProjectResultRequest;
import com.tduck.cloud.project.service.UserProjectItemService;
import com.tduck.cloud.project.service.UserProjectResultService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Set;

import static com.tduck.cloud.project.constant.ProjectRedisKeyConstants.PROJECT_RESULT_NUMBER;

/**
 * 项目表单项(ProjectResult)表服务实现类
 *
 * @author smalljop
 * @since 2020-11-23 14:09:22
 */
@Service("projectResultService")
@RequiredArgsConstructor
public class UserProjectResultEntityImpl extends ServiceImpl<UserProjectResultMapper, UserProjectResultEntity> implements UserProjectResultService {

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
}