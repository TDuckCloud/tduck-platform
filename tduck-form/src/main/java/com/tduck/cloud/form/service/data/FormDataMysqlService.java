package com.tduck.cloud.form.service.data;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.LocalDateTimeUtil;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.entity.SysBaseEntity;
import com.tduck.cloud.common.util.SecurityUtils;
import com.tduck.cloud.form.entity.UserFormDataEntity;
import com.tduck.cloud.form.entity.struct.FormDataFilterStruct;
import com.tduck.cloud.form.mapper.UserFormDataMapper;
import com.tduck.cloud.form.request.QueryFormResultRequest;
import com.tduck.cloud.form.vo.FormDataTableVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


/**
 * @author : wangqing
 * @description : 表单数据基础服务
 * @create :  2022/07/04 14:25
 **/
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
        // 拼接sql
        StringBuilder sqlBuilder = new StringBuilder();
        sqlBuilder.append("select * from fm_user_form_data where form_key = '").append(request.getFormKey()).append("'");
        //1. 拼接条件 查询条件 用大括号包起来 里面的条件会拼接 OR 或者 AND 不能影响其他默认附带条件 比如form_key 否则会错误查询
        StringBuilder whereBuilder = new StringBuilder();
        buildSearchQuery(request.getFilter(), whereBuilder);
        // 是否是权限组查询
        buildSearchQuery(request.getAuthGroupFilter(), whereBuilder);
        boolean hasCondition = (ObjectUtil.isNotNull(request.getFilter()) && CollUtil.isNotEmpty(request.getFilter().getConditionList())) || (ObjectUtil.isNotNull(request.getAuthGroupFilter()) && CollUtil.isNotEmpty(request.getAuthGroupFilter().getConditionList()));
        if (hasCondition) {
            whereBuilder.append("  )");
        }
        // 查询指定id数据
        if (ObjectUtil.isNotNull(request.getDataIds()) && 0 != request.getDataIds().size()) {
            whereBuilder.append(" and id in (").append(CollUtil.join(request.getDataIds(), ",")).append(")");
        }
        // 先查询总数，查询总数后再进行拼接order by 及 limit 语句
        StringBuilder countBuilder = new StringBuilder("select count(1) from fm_user_form_data where form_key = '").append(request.getFormKey()).append("'");
        countBuilder.append(whereBuilder);
        Long total = userFormDataMapper.selectCountBySql(countBuilder.toString());

        whereBuilder.append(" ORDER BY id DESC");
        // 分页
        if (ObjectUtil.isNotNull(request.getCurrent()) && ObjectUtil.isNotNull(request.getSize())) {
            whereBuilder.append(" limit ").append(request.getCurrent() * request.getSize()).append(",").append(request.getSize());
        }
        sqlBuilder.append(whereBuilder);
        List<UserFormDataEntity> userFormDataEntities = userFormDataMapper.selectRowsBySql(sqlBuilder.toString());

        // 过滤指定字段
        List<Map> maps = expandData(userFormDataEntities, request.getFilterFields());
        return new FormDataTableVO(maps, total);
    }


    public String getWhereField(String field) {
        // 如果是表单字段 需要从original_data中查询 包含数字的是表单字段
        if ((StrUtil.isNotBlank(field) && field.matches(".*\\d+.*")) ) {
            return StrUtil.format(" JSON_EXTRACT(original_data, '$.\"{}\"')", field);
        } else {
            return StrUtil.toUnderlineCase(field);
        }
    }

    /**
     * 构造条件查询
     */
    public void buildSearchQuery(FormDataFilterStruct filter, StringBuilder whereBuilder) {
        // 创建查询条件对象
        if (filter == null) {
            return;
        }
        List<FormDataFilterStruct.Condition> conditionList = filter.getConditionList();
        if (CollUtil.isNotEmpty(conditionList)) {
            whereBuilder.append(" AND (");
            for (FormDataFilterStruct.Condition item : conditionList) {
                // 第一个条件 前面不需要加AND 或者 OR
                String rel = " " + filter.getRel().toString() + " ";
                if (StrUtil.isBlank(whereBuilder.toString().replace("AND", "").replace("(", "").trim())) {
                    rel = " ";
                }
                String field = item.getFormItemId();
                switch (item.getMethod()) {
                    case EQ:
                        whereBuilder.append(rel).append(StrUtil.format("{} = '{}'", getWhereField(field), item.getValue()));
                        break;
                    case NE:
                        whereBuilder.append(rel).append(StrUtil.format("{} <> '{}'", getWhereField(field), item.getValue()));
                        break;
                    case INCLUDE:
                        buildIncludeQuery(field, item.getValue(), true, rel, whereBuilder);
                        break;
                    case NOT_INCLUDE:
                        buildIncludeQuery(field, item.getValue(), false, rel, whereBuilder);
                        break;
                    case IS_NULL:
                        whereBuilder.append(rel).append(StrUtil.format("{} IS  NULL", getWhereField(field)));
                        break;
                    case NOT_NULL:
                        whereBuilder.append(rel).append(StrUtil.format("{} IS NOT NULL", getWhereField(field)));
                        break;
                    case GT:
                        whereBuilder.append(rel).append(StrUtil.format("{} > {}", getWhereField(field), getTypeValue(item.getValue())));
                        break;
                    case GE:
                        whereBuilder.append(rel).append(StrUtil.format("{} >= {}", getWhereField(field), getTypeValue(item.getValue())));
                        break;
                    case LT:
                        whereBuilder.append(rel).append(StrUtil.format("{} < {}", getWhereField(field), getTypeValue(item.getValue())));
                        break;
                    case LE:
                        whereBuilder.append(rel).append(StrUtil.format("{} <= {}", getWhereField(field), getTypeValue(item.getValue())));
                        break;
                    case TIME_RANGE:
                        Map<String, DateTime> rangDateTime = getRangDateTime(item);
                        if (MapUtil.isNotEmpty(rangDateTime)) {
                            whereBuilder.append(rel).append(StrUtil.format("({} >= '{}' and {} <= '{}')", getWhereField(field),
                                    rangDateTime.get("beginDate"), getWhereField(field), rangDateTime.get("endDate")));
                        }
                        break;
                    default:
                        break;
                }
            }
        }
    }


    private Object getTypeValue(Object value) {
        if (ObjectUtil.isNull(value)) {
            return value;
        }
        String valStr = value.toString();
        return NumberUtil.isNumber(valStr) ? NumberUtil.parseNumber(valStr) : "'" + valStr + "'";
    }


    private void buildIncludeQuery(String field, Object value, boolean is, String rel, StringBuilder whereBuilder) {
        boolean isCreateBy = StrUtil.startWith(field, SysBaseEntity.Fields.createBy);
        if (isCreateBy) {
            List<String> list = (List<String>) value;
            // 处理根据用户查询 0表示为当前登录用户
            list = list.stream().map(item -> StrUtil.format("'{}'", item.equals("0") ? SecurityUtils.getUserId() : item)).collect(Collectors.toList());
            whereBuilder.append(rel).append(StrUtil.format("{} {} ({})", getWhereField(field), is ? "IN" : "NOT IN", CollUtil.join(list, ",")));
            return;
        }
        whereBuilder.append(rel).append(StrUtil.format("{} {} '%{}%'", getWhereField(field), is ? "LIKE" : "NOT LIKE", value));
    }


    @Override
    public List<Map> searchAll(QueryFormResultRequest request) {
        // 拼接sql
        List<UserFormDataEntity> userFormDataEntities = userFormDataMapper.selectRowsBySql("select * from fm_user_form_data where form_key = '" + request.getFormKey() + "'");
        return expandData(userFormDataEntities, null);
    }


    /**
     * 展开数据为一级
     */
    public List<Map> expandData(List<UserFormDataEntity> userFormDataEntities, String[] filterFields) {
        return userFormDataEntities.stream().map(item -> {
            Map<String, Object> processData = item.getOriginalData();
            Map<String, Object> resultMap = BeanUtil.beanToMap(item);
            resultMap.remove(UserFormDataEntity.Fields.originalData);
            resultMap.put(BaseEntity.Fields.createTime, LocalDateTimeUtil.formatNormal(item.getCreateTime()));
            resultMap.put(BaseEntity.Fields.updateTime, LocalDateTimeUtil.formatNormal(item.getUpdateTime()));
            processData.putAll(resultMap);
            // 只过滤指定字段
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


}
