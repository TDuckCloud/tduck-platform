package com.tduck.cloud.storage.cloud;

import cn.hutool.core.util.StrUtil;
import com.upyun.RestManager;
import com.upyun.UpException;

import java.io.IOException;
import java.io.InputStream;

/**
 * @author : smalljop
 * @description : 又拍云存储
 * @create :  2021/03/25 11:02
 **/
public class UpyunStorageService extends OssStorageService {

    RestManager manager;


    UpyunStorageService(OssStorageConfig config) {
        this.config = config;
        this.manager = new RestManager(config.getBucketName(), config.getAccessKeyId(), config.getAccessKeySecret());
        this.manager.setApiDomain(RestManager.ED_AUTO);
    }


    @Override
    public String upload(InputStream inputStream, String path) {
        try {
            manager.writeFile(path, inputStream, null).body();
            return config.getDomain() + "/" + path;
        } catch (IOException e) {
            e.printStackTrace();
        } catch (UpException e) {
            e.printStackTrace();
        }
        return StrUtil.EMPTY;
    }

    @Override
    public String upload(byte[] data, String path) {
        try {
            manager.writeFile(path, data, null).body();
            return config.getDomain() + path;
        } catch (IOException e) {
            e.printStackTrace();
        } catch (UpException e) {
            e.printStackTrace();
        }
        return StrUtil.EMPTY;
    }

    @Override
    public void delete(String path) {
        try {
            manager.deleteFile(path, null);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (UpException e) {
            e.printStackTrace();
        }
    }
}
