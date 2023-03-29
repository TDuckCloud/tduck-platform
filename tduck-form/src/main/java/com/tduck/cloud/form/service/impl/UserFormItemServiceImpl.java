package com.tduck.cloud.form.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tduck.cloud.form.entity.UserFormEntity;
import com.tduck.cloud.form.entity.UserFormItemEntity;
import com.tduck.cloud.form.entity.enums.FormItemTypeEnum;
import com.tduck.cloud.form.entity.struct.CheckboxSchemaStruct;
import com.tduck.cloud.form.entity.struct.InputResultStruct;
import com.tduck.cloud.form.mapper.UserFormItemMapper;
import com.tduck.cloud.form.service.UserFormItemService;
import com.tduck.cloud.form.service.UserFormService;
import com.tduck.cloud.form.util.FormDataUtils;
import com.tduck.cloud.form.vo.FormFieldVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 表单表单项(FormItem)表服务实现类
 *
 * @author smalljop
 * @since 2020-11-19 10:49:18
 */
@Service
@RequiredArgsConstructor
public class UserFormItemServiceImpl extends ServiceImpl<UserFormItemMapper, UserFormItemEntity> implements UserFormItemService {


    private final UserFormService userFormService;

    @Override
    public List<UserFormItemEntity> listByFormKey(String key) {
        List<UserFormItemEntity> list = this.list(Wrappers.<UserFormItemEntity>lambdaQuery().eq(UserFormItemEntity::getFormKey, key));
        list.sort(Comparator.comparing(UserFormItemEntity::getSort));
        return list;
    }

    @Override
    public List<FormFieldVO> listFormFields(String formKey) {
        List<UserFormItemEntity> itemEntityList = this.list(Wrappers.<UserFormItemEntity>lambdaQuery().eq(UserFormItemEntity::getFormKey, formKey).eq(UserFormItemEntity::getDisplayType, 0));
        itemEntityList.sort(Comparator.comparing(UserFormItemEntity::getSort));
        // FormFieldVO 处理了部份组价默认显示label字段
        List<FormFieldVO> fields = itemEntityList.stream().map(FormFieldVO::new).collect(Collectors.toList());
        return fields;
    }

    @Override
    public List<FormFieldVO> listAllFormFields(String formKey) {
        // 查询表单类型
        UserFormEntity userFormEntity = userFormService.getByKey(formKey);
        List<FormFieldVO> fields = this.listFormFields(formKey);
        FormDataUtils.addFormDefaultDataField(userFormEntity, fields);
        return fields;
    }

    @Override
    public Long getLastItemSort(String formKey) {
        Page<UserFormItemEntity> formItemEntityPage = baseMapper.selectPage(new Page<>(1, 1, false),
                Wrappers.<UserFormItemEntity>lambdaQuery().eq(UserFormItemEntity::getFormKey, formKey)
                        .orderByDesc(UserFormItemEntity::getSort));
        // 去取第一个元素
        UserFormItemEntity first = CollUtil.getFirst(formItemEntityPage.getRecords());
        return ObjectUtil.isNull(first) ? 0 : first.getSort();
    }

    @Override
    public Boolean isSpecialTypeItem(UserFormItemEntity userFormItemEntity) {
        // 随机编号
        if (userFormItemEntity.getType() == FormItemTypeEnum.RANDOM_NUMBER) {
            return true;
        }
        // 不允许重复
        if (userFormItemEntity.getType() == FormItemTypeEnum.INPUT) {
            InputResultStruct builder = InputResultStruct.builder(userFormItemEntity.getScheme());
            return builder.isNotRepeat();
        }
        // 商品
        if (userFormItemEntity.getType() == FormItemTypeEnum.GOODS_SELECT) {
            return true;
        }
        // 预约时间
        if (userFormItemEntity.getType() == FormItemTypeEnum.RESERVE_DAY || userFormItemEntity.getType() == FormItemTypeEnum.RESERVE_TIME_RANGE) {
            return true;
        }
        // 投票
        if (userFormItemEntity.getType() == FormItemTypeEnum.CHECKBOX || userFormItemEntity.getType() == FormItemTypeEnum.RADIO || userFormItemEntity.getType() == FormItemTypeEnum.IMAGE_SELECT) {
            CheckboxSchemaStruct builder = CheckboxSchemaStruct.builder(userFormItemEntity.getScheme());
            // 单选多选带名额
            if (builder.getConfig().getOptions().stream().anyMatch(item -> ObjectUtil.isNotNull(item.getQuotaSetting()))) {
                return true;
            }
            return builder.getConfig().isShowVoteResult();
        }
        return false;
    }


}
