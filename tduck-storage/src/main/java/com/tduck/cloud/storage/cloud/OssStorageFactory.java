package com.tduck.cloud.storage.cloud;


import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.tduck.cloud.common.util.JsonUtils;
import com.tduck.cloud.common.util.ServletUtils;
import com.tduck.cloud.common.util.SpringContextUtils;
import com.tduck.cloud.envconfig.constant.ConfigConstants;
import com.tduck.cloud.envconfig.service.SysEnvConfigService;
import com.tduck.cloud.storage.enums.OssTypeEnum;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.system.ApplicationHome;


/**
 * 文件上传Factory
 *
 * @author tduck
 */
@Slf4j
public final class OssStorageFactory {

    private static OssStorageService storageService;
    @Getter
    private static OssStorageConfig config;

    static {
        build();
    }

    public static synchronized void build() {
        try {
            OssStorageConfig config = JsonUtils.jsonToObj(SpringContextUtils.getBean(SysEnvConfigService.class).getValueByKey(ConfigConstants.FILE_ENV_CONFIG), OssStorageConfig.class);
            if (ObjectUtil.isNull(config)) {
                return;
            }
            OssStorageFactory.config = config;
            if (config.getOssType() == OssTypeEnum.QINIU) {
                storageService = new QiniuCloudStorageService(config);
            } else if (config.getOssType() == OssTypeEnum.ALIYUN) {
                storageService = new AliyunOssStorageService(config);
            } else if (config.getOssType() == OssTypeEnum.UPYUN) {
                storageService = new UpyunStorageService(config);
            } else if (config.getOssType() == OssTypeEnum.S3) {
                storageService = new S3StorageService(config);
            } else {
                // 本地存储默认配置
                if (StrUtil.isBlank(config.getUploadFolder())) {
                    ApplicationHome ah = new ApplicationHome(OssStorageFactory.class);
                    config.setUploadFolder(ah.getDir().getAbsolutePath() + "/upload");
                }
                if (StrUtil.isBlank(config.getDomain())) {
                    String domain = ServletUtils.getDomain(ServletUtils.getRequest());
                    config.setDomain(domain + "/u");
                }
                storageService = new LocalStorageService(config);
            }
            log.info("更新存储配置完成:{}", JsonUtils.objToJson(config));
        } catch (Exception exception) {
            log.error("更新存储配置失败:{}", exception.getMessage());
        }
    }

    public static OssStorageService getStorageService() {
        if (null == storageService) {
            build();
        }
        return storageService;
    }

}
