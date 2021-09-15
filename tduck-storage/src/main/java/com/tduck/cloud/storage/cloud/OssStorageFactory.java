package com.tduck.cloud.storage.cloud;


import com.tduck.cloud.common.util.SpringContextUtils;
import com.tduck.cloud.storage.entity.enums.OssTypeEnum;

/**
 * 文件上传Factory
 *
 * @author smalljop
 */
public final class OssStorageFactory {
    private static OssStorageConfig config;

    static {
        config = SpringContextUtils.getBean(OssStorageConfig.class);
    }


    public static OssStorageService build() {
        if (config.getOssType() == OssTypeEnum.QINIU) {
            return new QiniuCloudStorageService(config);
        } else if (config.getOssType() == OssTypeEnum.ALIYUN) {
            return new AliyunOssStorageService(config);
        } else if (config.getOssType() == OssTypeEnum.UPYUN) {
            return new UpyunStorageService(config);
        } else if (config.getOssType() == OssTypeEnum.LOCAL) {
            return new localStorageService(config);
        }else if (config.getOssType() == OssTypeEnum.MINIO) {
            return new MIniOStorageService(config);
        }
        return null;
    }

}
