package com.tduck.cloud.project.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.thread.ThreadUtil;
import cn.hutool.core.util.*;
import cn.hutool.http.HttpUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.collect.Sets;
import com.tduck.cloud.common.constant.CommonConstants;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.exception.BaseException;
import com.tduck.cloud.common.util.AddressUtils;
import com.tduck.cloud.common.util.AsyncProcessUtils;
import com.tduck.cloud.common.util.RedisUtils;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.project.entity.UserProjectItemEntity;
import com.tduck.cloud.project.entity.UserProjectResultEntity;
import com.tduck.cloud.project.entity.enums.ProjectItemTypeEnum;
import com.tduck.cloud.project.entity.struct.UploadResultStruct;
import com.tduck.cloud.project.mapper.UserProjectResultMapper;
import com.tduck.cloud.project.request.QueryProjectResultRequest;
import com.tduck.cloud.project.service.UserProjectItemService;
import com.tduck.cloud.project.service.UserProjectResultService;
import com.tduck.cloud.project.vo.ExportProjectResultVO;
import com.tduck.cloud.storage.cloud.OssStorageFactory;
import com.tduck.cloud.storage.util.StorageUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.system.ApplicationHome;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileInputStream;
import java.util.*;
import java.util.concurrent.atomic.AtomicReference;
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
        entity.setSerialNumber(redisUtils.incr(StrUtil.format(PROJECT_RESULT_NUMBER, projectKey), CommonConstants.ConstantNumber.ONE));
        entity.setSubmitAddress(AddressUtils.getRealAddressByIP(entity.getSubmitRequestIp()));
        this.save(entity);

    }

    @Override
    public Page listByQueryConditions(QueryProjectResultRequest request) {
        LambdaQueryWrapper<UserProjectResultEntity> lambdaQueryWrapper = Wrappers.<UserProjectResultEntity>lambdaQuery()
                .eq(UserProjectResultEntity::getProjectKey, request.getProjectKey())
                .le(ObjectUtil.isNotNull(request.getEndDateTime()), UserProjectResultEntity::getCreateTime, request.getEndDateTime())
                .ge(ObjectUtil.isNotNull(request.getBeginDateTime()), UserProjectResultEntity::getCreateTime, request.getBeginDateTime())
                .orderByDesc(BaseEntity::getCreateTime);
        if (ObjectUtil.isNotNull(request.getExtParamsMap())) {
            request.getExtParamsMap().keySet().forEach(item -> {
                String comparison = MapUtil.getStr(request.getExtComparisonsMap(), item);
                QueryProjectResultRequest.QueryComparison queryComparison = QueryProjectResultRequest.QueryComparison.get(comparison);
                Object value = request.getExtParamsMap().get(item);
                if (queryComparison == QueryProjectResultRequest.QueryComparison.LIKE) {
                    value = "'%" + value + "%'";
                }
                lambdaQueryWrapper.apply(StrUtil.format("original_data ->'$.{}' {} {} ", item, queryComparison.getKey(), value));
            });
        }
        return this.page(request.toMybatisPage(), lambdaQueryWrapper);
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
        // 导出会使用第一行数据作为标题 第一行未填写的数据需要填充默认值 不然导出会存在列丢失
        AtomicReference<Boolean> isFillRow = new AtomicReference<>(false);
        List<Map<String, Object>> resultList = resultEntityList.stream().map(item -> {
            Map<String, Object> processData = item.getProcessData();
            if (!isFillRow.get()) {
                titleList.stream()
                        .map(ExportProjectResultVO.ExcelHeader::getFieldKey).collect(Collectors.toList()).forEach(key -> {
                            if (!processData.containsKey(key))
                                processData.put(key, StrUtil.EMPTY);
                        });
                isFillRow.set(true);
            }
            Iterator<String> iterator = processData.keySet().iterator();
            while (iterator.hasNext()) {
                String key = iterator.next();
                List<String> titleStrList = titleList.stream()
                        .map(ExportProjectResultVO.ExcelHeader::getFieldKey).collect(Collectors.toList());
                // 不存在导出列的数据移除掉 避免多于字段导致excel格式错乱
                if (!titleStrList.contains(key)) {
                    iterator.remove();
                }
            }
            processData.put(BaseEntity.Fields.createTime, item.getCreateTime());
            processData.put(UserProjectResultEntity.Fields.submitAddress, item.getSubmitAddress());
            return processData;
        }).collect(Collectors.toList());
        List<ExportProjectResultVO.ExcelHeader> allHeaderList = new ArrayList<>();
        allHeaderList.addAll(ExportProjectResultVO.DEFAULT_HEADER_NAME);
        allHeaderList.addAll(titleList);
        return new ExportProjectResultVO(allHeaderList, resultList);
    }

    /**
     * 下载项目结果中的附件
     *
     * @param request
     * @return
     */
    @Override
    public Result downloadProjectResultFile(QueryProjectResultRequest request) {
        List<UserProjectItemEntity> userProjectItemEntityList = userProjectItemService.list(Wrappers.<UserProjectItemEntity>lambdaQuery()
                .eq(UserProjectItemEntity::getProjectKey, request.getProjectKey())
                .eq(UserProjectItemEntity::getType, ProjectItemTypeEnum.UPLOAD));
        String filed = "field";
        // 临时下载文件位置
        ApplicationHome home = new ApplicationHome(getClass());
        File path = home.getSource();
        String uuid = IdUtil.fastSimpleUUID();
        StringBuffer downloadPath = new StringBuffer(path.getParentFile().toString()).append(File.separator).append(uuid).append(File.separator);
        System.out.println(downloadPath);
        //结果
        List<UserProjectResultEntity> resultEntityList = this.list(Wrappers.<UserProjectResultEntity>lambdaQuery()
                .eq(UserProjectResultEntity::getProjectKey, request.getProjectKey())
                .le(ObjectUtil.isNotNull(request.getEndDateTime()), UserProjectResultEntity::getCreateTime, request.getEndDateTime())
                .ge(ObjectUtil.isNotNull(request.getBeginDateTime()), UserProjectResultEntity::getCreateTime, request.getBeginDateTime())
                .orderByDesc(BaseEntity::getCreateTime));
        if (CollectionUtil.isEmpty(resultEntityList) || CollectionUtil.isEmpty(userProjectItemEntityList)) {
            return Result.failed("暂无收集附件，无法下载");
        }

        ThreadUtil.execAsync(() -> {
            try {
                resultEntityList.forEach(result -> {
                    int index = 0;
                    userProjectItemEntityList.forEach(item -> {
                        StringBuffer tempDownloadPath = new StringBuffer(downloadPath).append(item.getFormItemId());
                        UploadResultStruct uploadResult = MapUtil.get(result.getProcessData(), filed + item.getFormItemId(), UploadResultStruct.class);
                        if (ObjectUtil.isNotNull(uploadResult) && CollectionUtil.isNotEmpty(uploadResult.getFiles())) {
                            uploadResult.getFiles().forEach(uFile -> {
                                if (StrUtil.isNotBlank(uFile.getUrl())) {
                                    File downFile = FileUtil.file(new StringBuffer(tempDownloadPath).append(File.separator)
                                            .append(result.getId()).append(CharUtil.DASHED).append(uFile.getFileName()).toString());
                                    HttpUtil.downloadFile(uFile.getUrl(), downFile);
                                }
                            });
                        }
                    });
                    AsyncProcessUtils.setProcess(uuid, ++index / resultEntityList.size() + 1);
                });
                // 压缩上传oss
                File zip = ZipUtil.zip(downloadPath.toString());
                String downloadUrl = OssStorageFactory.build().upload(new FileInputStream(zip), StorageUtils.generateFileName("download", ".zip"));
                AsyncProcessUtils.setProcess(uuid, downloadUrl);
                //删除临时文件
                FileUtil.del(zip);
                FileUtil.del(downloadPath.toString());
            } catch (Exception e) {
                log.error("download file", e);
            }
        });
        return Result.success(uuid);
    }
}