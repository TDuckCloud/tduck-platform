package com.tduck.cloud.form.service.data;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.LocalDateTimeUtil;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.form.entity.UserFormDataEntity;
import com.tduck.cloud.form.mapper.UserFormDataMapper;
import com.tduck.cloud.form.request.QueryFormResultRequest;
import com.tduck.cloud.form.vo.FormDataTableVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@Slf4j
public class FormDataMysqlService extends FormDataBaseService {

    @Autowired
    private UserFormDataMapper userFormDataMapper;

    @Autowired(required = false)
    private TduckMongoTemplate mongoTemplate;

    @Override
    public Boolean valueExist(String formKey, String formItemId, Object value) {
        return userFormDataMapper.selectOriginalDataValueCount(formKey, formItemId, value) > 0;
    }

    @Override
    public Boolean syncSaveData(UserFormDataEntity result) {
        if (null == mongoTemplate) {
            return true;
        }
        mongoTemplate.save(convertDocument(result), result.getFormKey());
        return true;
    }

    @Override
    public Boolean asyncUpdateData(UserFormDataEntity result) {
        if (null == mongoTemplate) {
            return true;
        }
        mongoTemplate.updateById(convertDocument(result), result.getId(), result.getFormKey());
        return true;
    }

    @Override
    public void asyncDeleteData(List<String> idList, String formKey) {
        if (null == mongoTemplate) {
            return;
        }
        mongoTemplate.deleteByIds(idList, formKey);
    }

    @Override
    public FormDataTableVO search(QueryFormResultRequest request) {
        if (StrUtil.isBlank(request.getFormKey()) || !request.getFormKey().matches("^[a-zA-Z0-9]+$")) {
            return new FormDataTableVO();
        }

        // Used parameterized query with MyBatis
        Long total = userFormDataMapper.selectCountByFormKeyAndDataIds(request.getFormKey(), request.getDataIds());

        // Paginate the results using parameterized queries
        List<UserFormDataEntity> userFormDataEntities = userFormDataMapper.selectDataByFormKeyAndDataIdsWithPagination(
                request.getFormKey(),
                request.getDataIds(),
                request.getCurrent() * request.getSize(),
                request.getSize()
        );

        
        List<Map> maps = expandData(userFormDataEntities, request.getFilterFields());
        return new FormDataTableVO(maps, total);
    }

    @Override
    public List<Map> searchAll(QueryFormResultRequest request) {
        // Used parameterized query with MyBatis
        List<UserFormDataEntity> userFormDataEntities = userFormDataMapper.selectDataByFormKey(request.getFormKey());
        return expandData(userFormDataEntities, null);
    }

    public List<Map> expandData(List<UserFormDataEntity> userFormDataEntities, String[] filterFields) {
        return userFormDataEntities.stream().map(item -> {
            Map<String, Object> processData = item.getOriginalData();
            Map<String, Object> resultMap = BeanUtil.beanToMap(item);
            resultMap.remove(UserFormDataEntity.Fields.originalData);
            resultMap.put(BaseEntity.Fields.createTime, LocalDateTimeUtil.formatNormal(item.getCreateTime()));
            resultMap.put(BaseEntity.Fields.updateTime, LocalDateTimeUtil.formatNormal(item.getUpdateTime()));
            processData.putAll(resultMap);

            if (filterFields != null) {
                Map<String, Object> filterMap = MapUtil.newHashMap();
                for (String filterField : filterFields) {
                    filterMap.put(filterField, processData.get(filterField));
                }
                return filterMap;
            }
            return processData;
        }).collect(Collectors.toList());
    }

    // Removed the sqlValidate method as it will not be needed with parameterized queries.
}
