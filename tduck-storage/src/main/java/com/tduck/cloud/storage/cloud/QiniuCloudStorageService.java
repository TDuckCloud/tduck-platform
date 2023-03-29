package com.tduck.cloud.storage.cloud;

import cn.hutool.core.io.IoUtil;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.Region;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import com.tduck.cloud.storage.exception.StorageException;

import java.io.InputStream;

/**
 * 七牛云存储
 *
 * @author smalljop
 */
public class QiniuCloudStorageService extends OssStorageService {
    private final UploadManager uploadManager;
    private final Auth auth;
    private final Configuration cfg;

    QiniuCloudStorageService(OssStorageConfig config) {
        this.config = config;
        cfg = new Configuration(Region.autoRegion());
        uploadManager = new UploadManager(cfg);
        auth = Auth.create(config.getAccessKeyId(), config.getAccessKeySecret());

    }


    @Override
    public String upload(InputStream inputStream, String path) {
        byte[] bytes = IoUtil.readBytes(inputStream);
        return this.upload(bytes, path);
    }

    @Override
    public String upload(byte[] data, String path) {
        try {
            String token = auth.uploadToken(config.getBucketName());
            Response res = uploadManager.put(data, path, token);
            if (!res.isOK()) {
                throw new RuntimeException("上传七牛出错：" + res);
            }
        } catch (Exception e) {
            throw new StorageException("上传文件失败，请核对七牛配置信息", e);
        }
        return config.getDomain() + "/" + path;
    }

//    @Override
//    public InputStream download(String path) {
//        final ByteArrayOutputStream output = new ByteArrayOutputStream();
//        HttpUtil.download(com.smalljop.manage.platform.com.tduck.cloud.wx.mp.config.getDomain() + "/" + path, output, false);
//        return new ByteArrayInputStream(output.toByteArray());
//    }

    @Override
    public void delete(String path) {
        BucketManager bucketManager = new BucketManager(auth, cfg);
        try {
            bucketManager.delete(config.getBucketName(), path);
        } catch (QiniuException e) {
            e.printStackTrace();
        }
    }


}
