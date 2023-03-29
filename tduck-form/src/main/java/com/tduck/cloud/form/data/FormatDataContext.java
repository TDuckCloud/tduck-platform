package com.tduck.cloud.form.data;

import cn.hutool.core.util.StrUtil;
import com.tduck.cloud.form.entity.enums.FormItemTypeEnum;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 格式化数据上下文 用于存储不同类型的格式化数据处理器
 *
 * @author tduck
 */
public class FormatDataContext {

    static Map<String, BaseFormatDataHandler> formatDataHandlerMap = new ConcurrentHashMap<>();

    static DefaultFormatDataHandler defaultFormatDataHandler = new DefaultFormatDataHandler();

    /*
      注册格式化数据处理器
     */
    static {
        formatDataHandlerMap.put(FormItemTypeEnum.SORT.toString(), new SortFormatDataHandler());
        formatDataHandlerMap.put(FormItemTypeEnum.PROVINCE_CITY.toString(), new ProvinceCityFormatDataHandler());
        formatDataHandlerMap.put(FormItemTypeEnum.DEPT_SELECT.toString(), new DeptSelectFormatDataHandler());
        formatDataHandlerMap.put(FormItemTypeEnum.USER_SELECT.toString(), new DeptSelectFormatDataHandler());
        formatDataHandlerMap.put(FormItemTypeEnum.GOODS_SELECT.toString(), new GoodsSelectFormatDataHandler());
        formatDataHandlerMap.put(FormItemTypeEnum.MATRIX_INPUT.toString(), new MatrixInputFormatDataHandler());
        formatDataHandlerMap.put(FormItemTypeEnum.MATRIX_SELECT.toString(), new MatrixSelectFormatDataHandler());
        formatDataHandlerMap.put(FormItemTypeEnum.MATRIX_SCALE.toString(), new MatrixSelectFormatDataHandler());
        formatDataHandlerMap.put(FormItemTypeEnum.RESERVE_DAY.toString(), new ReserveDayFormatDataHandler());
        formatDataHandlerMap.put(FormItemTypeEnum.RESERVE_TIME_RANGE.toString(), new ReserveDayFormatDataHandler());
        formatDataHandlerMap.put(FormItemTypeEnum.SUB_FORM.toString(), new SubFormFormatDataHandler());
        formatDataHandlerMap.put(FormItemTypeEnum.UPLOAD.toString(), new UploadFormatDataHandler());
        formatDataHandlerMap.put(FormItemTypeEnum.IMAGE_UPLOAD.toString(), new UploadFormatDataHandler());
    }


    /**
     * 根据类型获取对应的格式化数据处理器
     *
     * @param type 类型枚举
     * @return 处理器
     */
    public static BaseFormatDataHandler getHandler(FormItemTypeEnum type) {
        BaseFormatDataHandler baseFormatDataHandler = formatDataHandlerMap.get(type.toString());
        if (null != baseFormatDataHandler) {
            return baseFormatDataHandler;
        }
        return defaultFormatDataHandler;
    }


    /**
     * 根据key获取对应的格式化数据处理器
     *
     * @param key 类型枚举
     * @return 处理器
     */
    public static BaseFormatDataHandler getHandler(String key) {
        // 根据key获取类型 key 格式为类型+时间戳 比如 image_upload-1634021733940 或者 image_upload1634021733940 所以截取前面的类型即可
        // 截取到最后的13个字符
        String typeStr = StrUtil.sub(key, 0, key.length() - 13).replace("-", "");
        BaseFormatDataHandler baseFormatDataHandler = formatDataHandlerMap.get(typeStr.toUpperCase());
        if (null != baseFormatDataHandler) {
            return baseFormatDataHandler;
        }
        return defaultFormatDataHandler;
    }

}
