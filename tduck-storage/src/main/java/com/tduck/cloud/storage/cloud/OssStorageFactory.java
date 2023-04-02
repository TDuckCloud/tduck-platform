package com.tduck.cloud.storage.cloud;


import cn.hutool.core.util.ObjectUtil;
import com.tduck.cloud.common.util.JsonUtils;
import com.tduck.cloud.common.util.SpringContextUtils;
import com.tduck.cloud.envconfig.constants.ConfigConstants;
import com.tduck.cloud.envconfig.service.SysEnvConfigService;
import com.tduck.cloud.storage.enums.OssTypeEnum;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;


/**
 * 文件上传Factory
 *
 * @author tduck
 */
@Slf4j
public final class OssStorageFactory {

    @Getter
    private static OssStorageService storageService;
    @Getter
    private static OssStorageConfig config;

    static {
        build();
    }

    public static synchronized void build() {
        OssStorageConfig config = JsonUtils.jsonToObj(SpringContextUtils.getBean(SysEnvConfigService.class).getValueByKey(ConfigConstants.FILE_ENV_CONFIG), OssStorageConfig.class);
        if (ObjectUtil.isNull(config)) {
            return;
        }
        if (config.getOssType() == OssTypeEnum.QINIU) {
            storageService = new QiniuCloudStorageService(config);
        } else if (config.getOssType() == OssTypeEnum.ALIYUN) {
            storageService = new AliyunOssStorageService(config);
        } else if (config.getOssType() == OssTypeEnum.UPYUN) {
            storageService = new UpyunStorageService(config);
        } else if (config.getOssType() == OssTypeEnum.LOCAL) {
            storageService = new LocalStorageService(config);
        } else if (config.getOssType() == OssTypeEnum.S3) {
            storageService = new S3StorageService(config);
        }
        log.info("更新存储配置完成:{}", JsonUtils.objToJson(config));
        OssStorageFactory.config = config;
    }

}
