package com.tduck.cloud.form.util;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.lang.Validator;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.core.util.URLUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.google.common.collect.Maps;
import com.tduck.cloud.common.util.SecurityUtils;
import com.tduck.cloud.form.entity.UserFormDataEntity;
import com.tduck.cloud.form.entity.UserFormItemEntity;
import com.tduck.cloud.form.entity.enums.FormItemTypeEnum;
import com.tduck.cloud.form.entity.struct.CascaderSchemaStruct;
import com.tduck.cloud.form.entity.struct.ImageSelectSchemaStruct;
import com.tduck.cloud.form.entity.struct.OptionSchemaStruct;
import com.tduck.cloud.form.entity.struct.UploadResultStruct;
import com.tduck.cloud.form.service.UserFormDataService;
import com.tduck.cloud.form.service.UserFormItemService;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotBlank;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author : wangqing
 * @description : 表单数据导入工具类 使用Hutool 工具类操作Excel
 * @create :  2021/10/21 17:15
 **/
@Data
@Component
@RequiredArgsConstructor
public class FormDataImportUtils {
    /**
     * 省市区
     */
    private final UserFormItemService userFormItemService;
    private final UserFormDataService userFormDataService;
    private final List<FormItemTypeEnum> MULTIPLE_TYPE_LIST = CollUtil.newArrayList(FormItemTypeEnum.CHECKBOX, FormItemTypeEnum.CASCADER);
    private final String LABEL = "label";


    /**
     * 导入模板
     *
     * @return 结果
     */
    public void importTemplateExcel(HttpServletResponse response, String formKey) {
        List<UserFormItemEntity> list = userFormItemService.list(Wrappers.<UserFormItemEntity>lambdaQuery().eq(UserFormItemEntity::getFormKey, formKey).eq(UserFormItemEntity::getDisplayType, false).orderByAsc(UserFormItemEntity::getSort));
        List<String> rows = list.stream().map(item -> HtmlUtils.cleanHtmlTag(item.getLabel())).collect(Collectors.toList());
        // 示例数据
        List<String> demoList = CollUtil.newArrayList();
        list.stream().forEach(item -> {
            // 对 type 所有枚举值进行Switch
            switch (item.getType()) {
                case INPUT:
                    demoList.add("单行文本");
                    break;
                case TEXTAREA:
                    demoList.add("多行文本");
                    break;
                case NUMBER:
                    demoList.add("100");
                    break;
                case RADIO:
                case SELECT:
                case IMAGE_SELECT:
                    demoList.add("选项一");
                    break;
                case CHECKBOX:
                    demoList.add("选项一,选项二,选项三");
                    break;
                case CASCADER:
                    demoList.add("选项1,选项1-1");
                    break;
                case DATE:
                    demoList.add("2022-10-22");
                    break;
                case RATE:
                case SLIDER:
                    demoList.add("10");
                    break;
                case UPLOAD:
                case IMAGE_UPLOAD:
                    demoList.add("图片链接如https://xxx.com/xxx.png, 多个链接使用英文逗号隔开");
                    break;
                case PROVINCE_CITY:
                    demoList.add("北京市,市辖区,东城区");
                    break;
                case INPUT_MAP:
                    demoList.add("北京天安门,天安门");
                    break;
                case PHONE_VERIFICATION:
                    demoList.add("17788891234");
                    break;
                default:
                    demoList.add("暂时不支持导入");
                    break;
            }
        });
        ExcelWriter writer = ExcelUtil.getWriter(true).writeHeadRow(rows).writeRow(demoList);
        ServletOutputStream out = null;
        try {
            out = response.getOutputStream();
            writer.flush(out, true);
            //response为HttpServletResponse对象
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
            //test.xls是弹出下载对话框的文件名，不能为中文，中文请自行编码
            String fileName = URLUtil.encode("表单数据导入模板");
            response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");
            // 关闭writer，释放内存
            writer.close();
            //此处记得关闭输出Servlet流
            IoUtil.close(out);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 导入
     *
     * @param inputStream
     * @param formKey
     * @return
     */
    public String importFile(InputStream inputStream, @NotBlank(message = "错误请求") String formKey) {
        ExcelReader reader = ExcelUtil.getReader(inputStream);
        List<List<Object>> readAll = reader.read();
        if (CollUtil.isEmpty(readAll) && readAll.size() < 2) {
            return "导入失败，文件为空";
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        List<UserFormItemEntity> list = userFormItemService.list(Wrappers.<UserFormItemEntity>lambdaQuery().eq(UserFormItemEntity::getFormKey, formKey).eq(UserFormItemEntity::getDisplayType, false));
        Map<String, UserFormItemEntity> formItemEntityMap;
        try {
            formItemEntityMap = list.stream().collect(Collectors.toMap(item -> HtmlUtils.cleanHtmlTag(item.getLabel()), item -> item));
        } catch (Exception e) {
            return "存在同名字段，无法导入";
        }
        // 标题行
        List<Object> headRow = readAll.get(0);
        List<Map<String, Object>> rows = CollUtil.newArrayList();
        for (int i = 1; i < readAll.size(); i++) {
            List<Object> row = readAll.get(i);
            Map<String, Object> rowData = Maps.newHashMap();
            for (int c = 0; c < row.size(); c++) {
                try {
                    Object title = CollUtil.get(headRow, c);
                    if (ObjectUtil.isNotNull(title)) {
                        UserFormItemEntity userFormItemEntity = formItemEntityMap.get(title.toString());
                        if (ObjectUtil.isNull(userFormItemEntity)) {
                            continue;
                        }
                        // 判断类型 对值进行处理
                        this.handleField(userFormItemEntity, CollUtil.get(row, c), rowData);
                    }
                } catch (Exception e) {
                    failureNum++;
                    String msg = StrUtil.format("<br/>第{}行导入失败，失败原因：第{}列{}", i, c, e.getMessage());
                    failureMsg.append(msg);
                    break;
                }
            }
            successNum++;
            rows.add(rowData);
        }
        rows.forEach(row -> {
            UserFormDataEntity entity = new UserFormDataEntity();
            // 导入Excel时设置提交用户为当前登录用户
            entity.setCreateBy(String.valueOf(SecurityUtils.getUserId()));
            entity.setFormKey(formKey);
            entity.setOriginalData(row);
            userFormDataService.saveFormResult(entity);
        });
        if (failureNum > 0) {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            return failureMsg.toString();
        } else {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
            return successMsg.toString();
        }
    }

    /**
     * 处理字段
     * 部分特殊字段存在key/value 两个字段
     *
     * @param userFormItemEntity
     * @param value
     */
    private void handleField(UserFormItemEntity userFormItemEntity, Object value, Map<String, Object> rowData) {
        String strVal = null != value ? value.toString() : "";
        if (FormDataUtils.specialFields.contains(userFormItemEntity.getType())) {
            // 不存在值时，设置默认值为null
            if (StrUtil.isBlank(strVal)) {
                rowData.put(userFormItemEntity.getFormItemId(), null);
                rowData.put(userFormItemEntity.getFormItemId() + LABEL, null);
                return;
            }
            // 单选组件 RADIO 下拉单选 SELECT
            if (userFormItemEntity.getType().equals(FormItemTypeEnum.RADIO) || userFormItemEntity.getType().equals(FormItemTypeEnum.SELECT)) {
                OptionSchemaStruct optionSchemaStruct = BeanUtil.toBean(userFormItemEntity.getScheme(), OptionSchemaStruct.class);
                optionSchemaStruct.getConfig().getOptions().stream().filter(option -> StrUtil.equals(option.getLabel(), strVal.trim())).findFirst().ifPresent(option -> {
                    rowData.put(userFormItemEntity.getFormItemId(), NumberUtil.isNumber(option.getValue()) ? Integer.valueOf(option.getValue()) : option.getValue());
                    rowData.put(userFormItemEntity.getFormItemId() + LABEL, value);
                });
            }
            // 多选组件 CHECKBOX
            if (userFormItemEntity.getType().equals(FormItemTypeEnum.CHECKBOX)) {
                OptionSchemaStruct optionSchemaStruct = BeanUtil.toBean(userFormItemEntity.getScheme(), OptionSchemaStruct.class);
                List<String> strList = StrUtil.split(value.toString(), ",");
                List<OptionSchemaStruct.Option> optionList = optionSchemaStruct.getConfig().getOptions().stream().filter(option -> strList.contains(option.getLabel())).collect(Collectors.toList());
                if (CollUtil.isNotEmpty(optionList)) {
                    rowData.put(userFormItemEntity.getFormItemId(), optionList.stream().map(OptionSchemaStruct.Option::getValue).collect(Collectors.toList()));
                    rowData.put(userFormItemEntity.getFormItemId() + LABEL, optionList.stream().map(OptionSchemaStruct.Option::getLabel).collect(Collectors.toList()));
                }
            }
            // 图片选择
            if (userFormItemEntity.getType().equals(FormItemTypeEnum.IMAGE_SELECT)) {
                List<String> strList = StrUtil.split(value.toString(), ",");
                ImageSelectSchemaStruct imageSelectSchemaStruct = BeanUtil.toBean(userFormItemEntity.getScheme(), ImageSelectSchemaStruct.class);
                List<ImageSelectSchemaStruct.Option> optionList = imageSelectSchemaStruct.getConfig().getOptions().stream().filter(option -> strList.contains(option.getLabel())).collect(Collectors.toList());
                if (CollUtil.isNotEmpty(optionList)) {
                    if (imageSelectSchemaStruct.isMultiple()) {
                        rowData.put(userFormItemEntity.getFormItemId(), optionList.stream().map(OptionSchemaStruct.Option::getValue).collect(Collectors.toList()));
                        rowData.put(userFormItemEntity.getFormItemId() + LABEL, optionList.stream().map(OptionSchemaStruct.Option::getLabel).collect(Collectors.toList()));
                    } else {
                        rowData.put(userFormItemEntity.getFormItemId(), optionList.stream().map(OptionSchemaStruct.Option::getValue).findFirst().orElse(null));
                        rowData.put(userFormItemEntity.getFormItemId() + LABEL, optionList.stream().map(OptionSchemaStruct.Option::getLabel).findFirst().orElse(null));
                    }
                }
            }
            //级联选择
            if (userFormItemEntity.getType().equals(FormItemTypeEnum.CASCADER)) {
                List<String> strList = StrUtil.split(value.toString(), ",");
                CascaderSchemaStruct cascaderSchemaStruct = BeanUtil.toBean(userFormItemEntity.getScheme(), CascaderSchemaStruct.class);
                List<String> cascadeValues = CollUtil.newArrayList();
                List<String> cascadeLabels = CollUtil.newArrayList();
                // 深度查找三级联动
                cascaderSchemaStruct.getConfig().getOptions().stream().filter(option -> option.getLabel().equals(CollUtil.get(strList, 0))).findFirst().ifPresent(option -> {
                    cascadeValues.add(option.getValue());
                    cascadeLabels.add(option.getLabel());
                    String child = CollUtil.get(strList, 1);
                    if (!StrUtil.isBlank(child)) {
                        option.getChildren().stream().filter(o1 -> o1.getLabel().equals(CollUtil.get(strList, 1))).findFirst().ifPresent(o1 -> {
                            cascadeValues.add(o1.getValue());
                            cascadeLabels.add(o1.getLabel());
                            String child1 = CollUtil.get(strList, 2);
                            if (!StrUtil.isBlank(child1)) {
                                o1.getChildren().stream().filter(o2 -> o2.getLabel().equals(CollUtil.get(strList, 2))).findFirst().ifPresent(o2 -> {
                                    cascadeValues.add(o2.getValue());
                                    cascadeLabels.add(o2.getLabel());
                                });
                            }
                        });
                    }
                });
                rowData.put(userFormItemEntity.getFormItemId(), cascadeValues);
                rowData.put(userFormItemEntity.getFormItemId() + LABEL, cascadeLabels);
            }
            // 省市区
        } else if (FormItemTypeEnum.PROVINCE_CITY.equals(userFormItemEntity.getType())) {
            List<String> strList = StrUtil.split(value.toString(), ",");
            rowData.put(userFormItemEntity.getFormItemId(), strList);
        } else {
            rowData.put(userFormItemEntity.getFormItemId(), handleValue(value, userFormItemEntity.getType()));
        }
    }


    /**
     * 根据类型处理值
     *
     * @param value
     * @param type
     * @return
     */
    private Object handleValue(Object value, FormItemTypeEnum type) {
        if (null == value) {
            return null;
        }
        if (CollUtil.newArrayList(FormItemTypeEnum.DATE, FormItemTypeEnum.INPUT, FormItemTypeEnum.INPUT_MAP).contains(type)) {
            return value;
        } else if (CollUtil.newArrayList(FormItemTypeEnum.UPLOAD, FormItemTypeEnum.IMAGE_UPLOAD).contains(type)) {
            // 如果是多个文件
            String[] valueList = value.toString().split(",");
            List<UploadResultStruct> list = Arrays.stream(valueList).map(url -> {
                boolean isUrl = Validator.isUrl(value.toString());
                if (isUrl) {
                    return new UploadResultStruct("xxx.jpg", value.toString());
                } else {
                    throw new RuntimeException("url格式错误 ");
                }
            }).collect(Collectors.toList());
            return list;
        } else if (MULTIPLE_TYPE_LIST.contains(type)) {
            List<String> split = StrUtil.split(value.toString(), ",");
            return split;
        }
        return value;
    }


}
