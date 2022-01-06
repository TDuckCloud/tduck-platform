package com.tduck.cloud.form.util;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.lang.Validator;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.core.util.URLUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.tduck.cloud.form.entity.UserFormDataEntity;
import com.tduck.cloud.form.entity.UserFormItemEntity;
import com.tduck.cloud.form.entity.enums.FormItemTypeEnum;
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
import java.util.List;
import java.util.Map;
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
    private final UserFormItemService userFormItemService;
    private final UserFormDataService userFormDataService;

    /**
     * 导入模板
     *
     * @return 结果
     */
    public void importTemplateExcel(HttpServletResponse response, String formKey) {
        List<UserFormItemEntity> list = userFormItemService.list(Wrappers.<UserFormItemEntity>lambdaQuery().eq(UserFormItemEntity::getFormKey, formKey).eq(UserFormItemEntity::getDisplayType, false));
        List<String> rows = list.stream().map(item -> item.getLabel()).collect(Collectors.toList());
        ExcelWriter writer = ExcelUtil.getWriter(true).writeHeadRow(rows);
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
        Map<String, UserFormItemEntity> formItemEntityMap = list.stream().collect(Collectors.toMap(UserFormItemEntity::getLabel, item -> item));
        // 标题行
        List<Object> headRow = readAll.get(0);
        List<Map<String, Object>> rows = Lists.newArrayList();
        for (int i = 1; i < readAll.size(); i++) {
            List<Object> row = readAll.get(i);
            Map<String, Object> rowData = Maps.newHashMap();
            for (int c = 0; c < row.size(); c++) {
                try {
                    Object title = CollUtil.get(headRow, c);
                    if (ObjectUtil.isNotNull(title)) {
                        UserFormItemEntity userFormItemEntity = formItemEntityMap.get(title.toString());
                        // 判断类型 对值进行处理
                        String value = row.get(c).toString();
                        rowData.put(userFormItemEntity.getFormItemId(), handleValue(value, userFormItemEntity.getType()));
                    }
                } catch (Exception e) {
                    failureNum++;
                    String msg = StrUtil.format("<br/>第{}行导入失败，失败原因：第{}列{}", i, c, e.getMessage());
                    failureMsg.append(msg + e.getMessage());
                    break;
                }
            }
            successNum++;
            rows.add(rowData);
        }
        rows.forEach(row -> {
            UserFormDataEntity entity = new UserFormDataEntity();
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
     * 根据类型处理值
     *
     * @param value
     * @param type
     * @return
     */
    private Object handleValue(String value, FormItemTypeEnum type) {
        if (Lists.newArrayList(FormItemTypeEnum.DATE, FormItemTypeEnum.INPUT, FormItemTypeEnum.INPUT_MAP).contains(type)) {
            return value;
        } else if (Lists.newArrayList(FormItemTypeEnum.UPLOAD, FormItemTypeEnum.IMAGE_UPLOAD).contains(type)) {
            boolean url = Validator.isUrl(value);
            if (url) {
                return new UploadResultStruct("xxx.jpg", value);
            } else {
                throw new RuntimeException("url格式错误 ");
            }
        } else if (Lists.newArrayList(FormItemTypeEnum.SELECT, FormItemTypeEnum.IMAGE_SELECT, FormItemTypeEnum.CHECKBOX).contains(type)) {
            List<String> split = StrUtil.split(value, ",");
            return split;
        }
        return value;
    }


}
