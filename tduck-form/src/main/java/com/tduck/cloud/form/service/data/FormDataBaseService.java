package com.tduck.cloud.form.service.data;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.date.LocalDateTimeUtil;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.ObjectUtil;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.entity.SysBaseEntity;
import com.tduck.cloud.form.entity.UserFormDataEntity;
import com.tduck.cloud.form.entity.enums.TimeRangeEnum;
import com.tduck.cloud.form.entity.struct.FormDataFilterStruct;
import com.tduck.cloud.form.request.QueryFormResultRequest;
import com.tduck.cloud.form.vo.FormDataTableVO;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author : tduck
 * @description : 表单数据基础服务
 * @create :  2022/07/04 13:50
 **/
public abstract class FormDataBaseService {


    /***
     * 表单字段值是否存在
     * @param formKey 表单key
     * @param formItemId 表单字段id
     * @param value 字段值
     * @return true 存在 false 不存在
     */
    public abstract Boolean valueExist(String formKey, String formItemId, Object value);


    /**
     * 同步表单数据
     *
     * @param result 表单数据
     * @return 是否同步成功
     */
    public abstract Boolean syncSaveData(UserFormDataEntity result);

    /**
     * 同步更新数据
     *
     * @param result 表单数据
     */
    public abstract Boolean asyncUpdateData(UserFormDataEntity result);

    /**
     * 删除表单数据
     *
     * @param idList  表单数据id列表
     * @param formKey 表单key
     */
    public abstract void asyncDeleteData(List<String> idList, String formKey);

    /**
     * 查询表单数据
     *
     * @param request 查询内容
     */
    public abstract FormDataTableVO search(QueryFormResultRequest request);


    /**
     * 查询全部数据
     */
    public abstract List<Map> searchAll(QueryFormResultRequest request);


    /**
     * 构造时间范围查询
     *
     * @param condition 条件
     * @return 时间范围
     */
    protected Map<String, DateTime> getRangDateTime(FormDataFilterStruct.Condition condition) {
        if (ObjectUtil.isNull(condition.getValue())) {
            return null;
        }
        DateTime beginDate = null;
        DateTime endDate = null;
        TimeRangeEnum timeRangeEnum = TimeRangeEnum.valueOf(condition.getValue().toString());
        switch (timeRangeEnum) {
            case TODAY:
                beginDate = DateUtil.beginOfDay(new Date());
                endDate = DateUtil.endOfDay(new Date());
                break;
            case YESTERDAY:
                beginDate = DateUtil.beginOfDay(DateUtil.yesterday());
                endDate = DateUtil.endOfDay(DateUtil.yesterday());
                break;
            case WEEK:
                beginDate = DateUtil.beginOfWeek(new Date());
                endDate = DateUtil.endOfWeek(new Date());
                break;
            case LAST_WEEK:
                beginDate = DateUtil.beginOfWeek(DateUtil.lastWeek());
                endDate = DateUtil.endOfWeek(DateUtil.lastWeek());
                break;
            case MONTH:
                beginDate = DateUtil.beginOfMonth(new Date());
                endDate = DateUtil.endOfMonth(new Date());
                break;
            case LAST_MONTH:
                beginDate = DateUtil.beginOfMonth(DateUtil.lastMonth());
                endDate = DateUtil.endOfMonth(DateUtil.lastMonth());
                break;
            case YEAR:
                beginDate = DateUtil.beginOfYear(new Date());
                endDate = DateUtil.endOfYear(new Date());
                break;
            case LAST_YEAR:
                Date lastYear = DateUtil.offset(new Date(), DateField.YEAR, -1);
                beginDate = DateUtil.beginOfYear(lastYear);
                endDate = DateUtil.endOfYear(lastYear);
                break;
            default:
                beginDate = DateUtil.date();
                endDate = DateUtil.date();
                break;
        }
        Map<String, DateTime> result = MapUtil.newHashMap();
        result.put("beginDate", beginDate);
        result.put("endDate", endDate);
        return result;
    }


    public static Map<String, Object> convertDocument(UserFormDataEntity result) {
        Map<String, Object> processData = result.getOriginalData();
        Map<String, Object> resultMap = BeanUtil.beanToMap(result);
        //格式化时间
        resultMap.put(BaseEntity.Fields.updateTime, LocalDateTimeUtil.formatNormal(result.getUpdateTime()));
        resultMap.put(BaseEntity.Fields.createTime, LocalDateTimeUtil.formatNormal(result.getCreateTime()));
        resultMap.remove(UserFormDataEntity.Fields.originalData);
        processData.putAll(resultMap);
        processData.remove(SysBaseEntity.Fields.searchValue);
        processData.remove(SysBaseEntity.Fields.params);
        return processData;
    }


}
