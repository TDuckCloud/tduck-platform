package com.tduck.cloud.form.util;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.text.csv.CsvUtil;
import cn.hutool.core.text.csv.CsvWriter;
import cn.hutool.core.util.CharsetUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.tduck.cloud.common.util.ServletUtils;
import com.tduck.cloud.form.data.FormatDataContext;
import com.tduck.cloud.form.entity.struct.FormDataFilterStruct;
import com.tduck.cloud.form.request.ExportRequest;
import com.tduck.cloud.form.request.QueryFormResultRequest;
import com.tduck.cloud.form.service.UserFormItemService;
import com.tduck.cloud.form.vo.FormDataTableVO;
import com.tduck.cloud.form.vo.FormFieldVO;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author : wangqing
 * @description : 表单数据导出
 * @create :  2022/02/16 10:35
 **/
@Component
@Slf4j
@RequiredArgsConstructor
public class FormDataExportUtils {

    private final FormDataUtils formDataUtils;
    private final UserFormItemService userFormItemService;
    /**
     * 导出模式 当前页
     */
    private final String MODE_CURRENT = "current";
    /**
     * 导出模式 选中数据
     */
    private final String MODE_SELECTED = "selected";
    /**
     * 全部数据
     */
    private final String MODE_ALL = "all";

    /**
     * 导出文件类型
     */
    private final String TYPE_XLSX = "xlsx";
    private final String TYPE_CSV = "csv";

    /**
     * 导出数据
     *
     * @param exportRequest
     * @return
     */
    @SneakyThrows
    public void exportData(ExportRequest.FormData exportRequest) {
        // 查询指定数据
        QueryFormResultRequest queryFormResultRequest = new QueryFormResultRequest();
        queryFormResultRequest.setFormKey(exportRequest.getFormKey());
        queryFormResultRequest.setFilterFields(exportRequest.getColumns().toArray(new String[]{}));
        if (exportRequest.getMode().equals(MODE_CURRENT)) {
            queryFormResultRequest.setCurrent(exportRequest.getCurrentPage());
            queryFormResultRequest.setSize(exportRequest.getPageSize());
        } else if (exportRequest.getMode().equals(MODE_SELECTED)) {
            queryFormResultRequest.setDataIds(exportRequest.getCheckboxIds());
        }

        List<Map> rows = null;

        if (exportRequest.getMode().equals(MODE_ALL)) {
            rows = formDataUtils.searchAll(queryFormResultRequest);
        } else {
            FormDataTableVO search = formDataUtils.search(queryFormResultRequest);
            rows = search.getRows();
        }
        // 查询字段别名
        List<FormFieldVO> fields = userFormItemService.listAllFormFields(exportRequest.getFormKey()).stream().filter(item -> exportRequest.getColumns().contains(item.getValue())).collect(Collectors.toList());
        // 这里 需要指定写用哪个class去写，然后写到第一个sheet，名字为模板 然后文件流会自动关闭
        if (exportRequest.getType().equals(TYPE_XLSX)) {
            writeExcel(fields, rows, exportRequest.getSheetName());
        } else if (exportRequest.getType().equals(TYPE_CSV)) {
            writeCsv(fields, rows);
        }
    }

    /**
     * 获取标题列
     *
     * @param fields
     * @return
     */
    private LinkedHashMap<String, String> getHeadMap(List<FormFieldVO> fields) {
        LinkedHashMap<String, String> headMap = new LinkedHashMap<>();
        fields.forEach(field -> {
            headMap.put(field.getValue(), field.getLabel());
        });
        return headMap;
    }

    /**
     * 写入Excel数据
     *
     * @param fields    列头对应关系 [字段,别名]
     * @param list      数据源
     * @param sheetName
     */
    private void writeExcel(List<FormFieldVO> fields, List<Map> list, String sheetName) throws IOException {
        LinkedHashMap<String, String> headMap = getHeadMap(fields);
        Map<String, Object> schemeMap = fields.stream().collect(Collectors.toMap(FormFieldVO::getValue, item -> null != item.getScheme() ? item.getScheme() : ""));
        ExcelWriter writer = new ExcelWriter(true, sheetName);
        writer.setSheet(sheetName);
        // 写入列头
        List<String> headList = new ArrayList<>(headMap.values());
        writer.writeHeadRow(headList);
        // 写入数据
        int rowIndex = 0;
        int colIndex;
        for (Map<String, Object> map : list) {
            rowIndex++;
            colIndex = -1;
            for (String headKey : headMap.keySet()) {
                colIndex++;
                Object value = map.get(headKey);
                writer.writeCellValue(colIndex, rowIndex, formatColValue(headKey, value, schemeMap.get(headKey)));
            }
        }

        HttpServletResponse response = ServletUtils.getResponse();
        writer.autoSizeColumnAll();
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename=test.xlsx");
        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        writer.close();
        IoUtil.close(out);
    }

    /**
     * 写入CSV
     *
     * @param fields 列头对应关系 [字段,别名]
     * @param list   数据源
     */
    private void writeCsv(List<FormFieldVO> fields, List<Map> list) throws IOException {
        LinkedHashMap<String, String> headMap = getHeadMap(fields);
        Map<String, Object> schemeMap = fields.stream().collect(HashMap::new, (k, v) -> k.put(v.getValue(), v.getScheme()), HashMap::putAll);
        // 写入列头
        List<String> headList = new ArrayList<>(headMap.values());
        HttpServletResponse response = ServletUtils.getResponse();
        ServletOutputStream out = response.getOutputStream();
        Writer writer = new OutputStreamWriter(out, CharsetUtil.CHARSET_UTF_8);
        CsvWriter csvWriter = CsvUtil.getWriter(writer);
        csvWriter.writeHeaderLine(headList.toArray(new String[]{}));
        // 写入数据
        for (Map<String, Object> map : list) {
            List<Object> row = CollUtil.newArrayList();
            for (String headKey : headMap.keySet()) {
                Object value = map.get(headKey);
                row.add(ObjectUtil.isNotNull(value) ? formatColValue(headKey, value, schemeMap.get(headKey)) : null);
            }
            csvWriter.writeLine(row.toArray(new String[]{}));
        }
        response.setContentType("text/csv;charset=utf-8");
//        //test.xls是弹出下载对话框的文件名，不能为中文，中文请自行编码
        response.setHeader("Content-Disposition", "attachment;filename=node.csv");
        csvWriter.close();
    }


    /**
     * 格式化处理数据
     *
     * @param fieldKey 字段Key
     * @param value    值
     * @param scheme   表单选定义
     * @return
     */
    public String formatColValue(String fieldKey, Object value, Object scheme) {
        if (null == value) {
            return null;
        }
        try {
            Object data = FormatDataContext.getHandler(fieldKey).formatData(fieldKey, value, scheme);
            return StrUtil.toString(data);
        } catch (Exception e) {
            log.error("format excel col value error {} {} ", fieldKey, value, e);
        }

        return value.toString();
    }


}
