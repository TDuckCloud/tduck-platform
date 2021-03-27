package com.tduck.cloud.storage.cloud;


import cn.hutool.core.io.FileUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.InputStream;

/**
 * @description: 本地文件存储
 * @author: smalljop
 * @create: 2018-10-18 14:01
 */
@Component
@Slf4j
public class localStorageService extends OssStorageService {
    public localStorageService(OssStorageConfig config) {
        this.config = config;
    }

    @Override
    public String upload(InputStream inputStream, String path) {
        File file = FileUtil.file(config.getUploadFolder() + File.separator + path);
        //目录是否存在
        if (!FileUtil.exist(file.getParent())) {
            FileUtil.mkdir(file.getParent());
        }
        FileUtil.writeFromStream(inputStream, file);
        return config.getDomain() + "/" + path;
    }

    @Override
    public String upload(byte[] data, String path) {
        File file = FileUtil.file(config.getUploadFolder() + File.separator + path);
        //目录是否存在
        if (!FileUtil.exist(file.getParent())) {
            FileUtil.mkdir(file.getParent());
        }
        FileUtil.writeBytes(data, file);
        return config.getDomain() + "/" + path;
    }

    @Override
    public void delete(String path) {
        FileUtil.del(config.getUploadFolder() + File.separator + path);
    }
}
