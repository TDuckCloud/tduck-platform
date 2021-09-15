package com.tduck.cloud.storage.cloud;

import com.tduck.cloud.storage.entity.enums.MimeTypeEnum;
import com.tduck.cloud.storage.exception.StorageException;
import io.minio.MinioClient;
import io.minio.PutObjectOptions;
import io.minio.errors.InvalidEndpointException;
import io.minio.errors.InvalidPortException;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

/**
 * @author pfwang
 */
public class MIniOStorageService extends OssStorageService {

    private MinioClient client;

    public MIniOStorageService(OssStorageConfig config) {
        this.config = config;
        //初始化
        init();
    }

    private void init() {
        try {
            client = new MinioClient(config.getEndpoint(), config.getAccessKeyId(), config.getAccessKeySecret(), false);
        } catch (InvalidEndpointException e) {
            e.printStackTrace();
        } catch (InvalidPortException e) {
            e.printStackTrace();
        }
    }

    @Override
    public String upload(InputStream inputStream, String path) {
        try {
            PutObjectOptions poo = new PutObjectOptions(inputStream.available(), -1);
            poo.setContentType(MimeTypeEnum.getContentType(path));
            client.putObject(config.getBucketName(), path, inputStream, poo);
        } catch (Exception e) {
            throw new StorageException("上传文件失败，请检查配置信息", e);
        }
        return config.getDomain() + "/" + path;
    }

    @Override
    public String upload(byte[] data, String path) {
        try {
            PutObjectOptions poo = new PutObjectOptions(data.length, -1);
            poo.setContentType(MimeTypeEnum.getContentType(path));
            client.putObject(config.getBucketName(), path, new ByteArrayInputStream(data), poo);
        } catch (Exception e) {
            throw new StorageException("上传文件失败，请检查配置信息", e);
        }
        return config.getDomain() + "/" + path;
    }

    @Override
    public void delete(String path) {
        try {
            client.removeObject(config.getBucketName(), path);
        } catch (Exception e) {
            throw new StorageException("删除文件失败", e);
        }
    }

}
