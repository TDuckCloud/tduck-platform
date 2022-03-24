package com.tduck.cloud.form.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.date.LocalDateTimeUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.thread.ThreadUtil;
import cn.hutool.core.util.CharUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.core.util.ZipUtil;
import cn.hutool.http.HttpUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.collect.Lists;
import com.tduck.cloud.common.constant.CommonConstants;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.util.AddressUtils;
import com.tduck.cloud.common.util.AsyncProcessUtils;
import com.tduck.cloud.common.util.CacheUtils;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.form.entity.UserFormDataEntity;
import com.tduck.cloud.form.entity.UserFormItemEntity;
import com.tduck.cloud.form.entity.enums.FormItemTypeEnum;
import com.tduck.cloud.form.entity.struct.UploadResultStruct;
import com.tduck.cloud.form.mapper.UserFormDataMapper;
import com.tduck.cloud.form.request.QueryFormResultRequest;
import com.tduck.cloud.form.service.UserFormDataService;
import com.tduck.cloud.form.service.UserFormItemService;
import com.tduck.cloud.form.vo.FormDataTableVO;
import com.tduck.cloud.storage.cloud.OssStorageFactory;
import com.tduck.cloud.storage.util.StorageUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static com.tduck.cloud.form.constant.FormConstants.FORM_RESULT_NUMBER;

/**
 * 表单表单项(FormResult)表服务实现类
 *
 * @author smalljop
 * @since 2020-11-23 14:09:22
 */
@Service
@RequiredArgsConstructor
public class UserFormDataServiceImpl extends ServiceImpl<UserFormDataMapper, UserFormDataEntity> implements UserFormDataService {

    private final UserFormItemService userFormItemService;
    private final CacheUtils cacheUtils;

    @Override
    public void saveFormResult(UserFormDataEntity entity) {
        String formKey = entity.getFormKey();
        entity.setSerialNumber(cacheUtils.incr(StrUtil.format(FORM_RESULT_NUMBER, formKey), CommonConstants.ConstantNumber.ONE));
        entity.setSubmitAddress(AddressUtils.getRealAddressByIP(entity.getSubmitRequestIp()));
        this.save(entity);
    }


    /**
     * 下载表单结果中的附件
     *
     * @param request
     * @return
     */
    @Override
    public Result downloadFormResultFile(QueryFormResultRequest request) {
        String uuid = IdUtil.simpleUUID();
        List<UserFormItemEntity> userFormItemEntityList = userFormItemService.list(Wrappers.<UserFormItemEntity>lambdaQuery().eq(UserFormItemEntity::getFormKey, request.getFormKey()).in(UserFormItemEntity::getType, Lists.newArrayList(FormItemTypeEnum.UPLOAD.toString(), FormItemTypeEnum.IMAGE_UPLOAD.toString())));
        //结果
        FormDataTableVO formDataTableVO = this.listFormDataTable(request);
        List<Map> rows = formDataTableVO.getRows();
        if (CollectionUtil.isEmpty(rows) || CollectionUtil.isEmpty(userFormItemEntityList)) {
            return Result.failed("暂无收集附件，无法下载");
        }
        ThreadUtil.execAsync(() -> {
            List<String> paths = new ArrayList<>();
            List<InputStream> ins = new ArrayList<>();
            try {
                rows.forEach(result -> {
                    int index = 0;
                    String id = MapUtil.getStr(result, "id");
                    userFormItemEntityList.forEach(item -> {
                        List<Object> uploadResults = MapUtil.get(result, item.getFormItemId(), List.class);
                        if (CollectionUtil.isNotEmpty(uploadResults)) {
                            uploadResults.forEach(uFile -> {
                                UploadResultStruct uploadResult = Convert.convert(UploadResultStruct.class, uFile);
                                if (StrUtil.isNotBlank(uploadResult.getUrl())) {
                                    paths.add(new StringBuffer().append(item.getId()).append(CharUtil.DASHED).append(id).append(uploadResult.getFileName()).toString());
                                    byte[] bytes = HttpUtil.downloadBytes(uploadResult.getUrl());
                                    ins.add(IoUtil.toStream(bytes));
                                }
                            });
                        }
                    });
                    AsyncProcessUtils.setProcess(uuid, ++index / rows.size() + 1);
                });
                // 压缩上传oss
                ByteArrayOutputStream zipOutputStream = new ByteArrayOutputStream();
                ZipUtil.zip(zipOutputStream, paths.toArray(new String[]{}), ins.toArray(new InputStream[]{}));
                String downloadUrl = OssStorageFactory.build().upload(zipOutputStream.toByteArray(), StorageUtils.generateFileName("download", ".zip"));
                AsyncProcessUtils.setProcess(uuid, downloadUrl);
            } catch (Exception e) {
                log.error("download file", e);
            }
        });
        return Result.success(uuid);
    }

    @Override
    public FormDataTableVO listFormDataTable(QueryFormResultRequest request) {
        List<UserFormDataEntity> dataEntityList = null;
        Long total = 0L;
        // 查询全部
        if (0 == request.getCurrent()) {
            dataEntityList = this.list(Wrappers.<UserFormDataEntity>lambdaQuery().eq(UserFormDataEntity::getFormKey, request.getFormKey()));
            total = Long.valueOf(dataEntityList.size());
        } else {
            Page<UserFormDataEntity> page = this.page(request.toMybatisPage(), Wrappers.<UserFormDataEntity>lambdaQuery().eq(UserFormDataEntity::getFormKey, request.getFormKey()));
            dataEntityList = page.getRecords();
            total = page.getTotal();
        }
        List<Map> list = dataEntityList.stream().map(item -> {
            Map<String, Object> originalData = item.getOriginalData();
            item.setOriginalData(null);
            originalData.put(BaseEntity.Fields.createTime, LocalDateTimeUtil.formatNormal(item.getCreateTime()));
            originalData.put(BaseEntity.Fields.updateTime, LocalDateTimeUtil.formatNormal(item.getUpdateTime()));
            Map<String, Object> formDataMap = BeanUtil.beanToMap(item);
            formDataMap.putAll(originalData);
            return formDataMap;
        }).collect(Collectors.toList());
        return new FormDataTableVO(list, total);
    }


    @Override
    public Boolean deleteByIds(List<String> dataIdList, String formKey) {
        baseMapper.deleteBatchIds(dataIdList);
        return null;
    }

    @Override
    public Boolean updateFormResult(UserFormDataEntity entity) {
        UserFormDataEntity dataEntity = this.getById(entity.getId());
        dataEntity.setOriginalData(entity.getOriginalData());
        boolean update = this.updateById(dataEntity);
        return update;
    }
}