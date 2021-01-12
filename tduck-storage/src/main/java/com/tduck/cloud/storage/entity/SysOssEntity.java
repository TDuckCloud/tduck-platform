//package com.tduck.cloud.storage.entity;
//
//import com.baomidou.mybatisplus.annotation.FieldFill;
//import com.baomidou.mybatisplus.annotation.TableField;
//import com.baomidou.mybatisplus.annotation.TableId;
//import com.baomidou.mybatisplus.annotation.TableName;
//import com.tduck.cloud.storage.entity.enums.OssTypeEnum;
//import com.smalljop.business.platform.common.entity.BaseEntity;
//import lombok.AllArgsConstructor;
//import lombok.Builder;
//import lombok.Data;
//import lombok.NoArgsConstructor;
//
///**
// * @author smalljop
// * @email 250543222@qq.com
// * @date 20190124 16:17:32
// */
//@Data
//@TableName("sys_oss")
//@NoArgsConstructor
//@AllArgsConstructor
//@Builder
//public class SysOssEntity extends BaseEntity<SysOssEntity> {
//    /**
//     *
//     */
//    @TableId
//    private Long id;
//    /**
//     * 旧文件名
//     */
//    private String oldFileName;
//
//    /**
//     * 文件名
//     */
//    private String fileName;
//
//
//    private OssTypeEnum ossType;
//    /**
//     * 文件类型
//     */
//    private String fileType;
//
//    /**
//     * 文件存储key
//     */
//    private String path;
//
//    /**
//     * 地址
//     */
//    private String url;
//    /**
//     * 文件大小
//     */
//    private Long fileSize;
//
//    /**
//     * 创建者ID
//     **/
//    @TableField(fill = FieldFill.INSERT)
//    private Long createUserId;
//
//}
