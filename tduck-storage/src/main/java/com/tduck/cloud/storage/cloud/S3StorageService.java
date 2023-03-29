package com.tduck.cloud.storage.cloud;

import cn.hutool.core.io.IoUtil;
import com.amazonaws.ClientConfiguration;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSCredentialsProvider;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.internal.Mimetypes;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.PutObjectResult;
import com.tduck.cloud.storage.exception.StorageException;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

/**
 * 通用S3存储 支持所有S3兼容的存储
 *
 * @author : smalljop
 * @since :  2021/03/25 11:02
 **/
public class S3StorageService extends OssStorageService {

    private final AmazonS3 client;


    S3StorageService(OssStorageConfig config) {
        this.config = config;
        try {
            AwsClientBuilder.EndpointConfiguration endpointConfig =
                    new AwsClientBuilder.EndpointConfiguration(config.getEndpoint(), Regions.DEFAULT_REGION.getName());
            AWSCredentials credentials = new BasicAWSCredentials(config.getAccessKeyId(), config.getAccessKeySecret());
            AWSCredentialsProvider credentialsProvider = new AWSStaticCredentialsProvider(credentials);
            ClientConfiguration clientConfig = new ClientConfiguration();
//            if (OssConstant.IS_HTTPS.equals(properties.getIsHttps())) {
//                clientConfig.setProtocol(Protocol.HTTPS);
//            } else {
//                clientConfig.setProtocol(Protocol.HTTP);
//            }
            AmazonS3ClientBuilder build = AmazonS3Client.builder()
                    .withEndpointConfiguration(endpointConfig)
                    .withClientConfiguration(clientConfig)
                    .withCredentials(credentialsProvider)
                    .disableChunkedEncoding();
//            if (!StrUtil.containsAny(config.getEndpoint(), OssConstant.CLOUD_SERVICE)) {
//                // minio 使用https限制使用域名访问 需要此配置 站点填域名
//                build.enablePathStyleAccess();
//            }
            this.client = build.build();

        } catch (Exception e) {
            throw new StorageException("配置错误! 请检查系统配置:[" + e.getMessage() + "]");
        }
    }


    @Override
    public String upload(InputStream inputStream, String path) {
        return upload(inputStream, path,
                Mimetypes.getInstance().getMimetype(path));
    }

    @Override
    public String upload(byte[] data, String path) {
        return upload(new ByteArrayInputStream(data), path,
                Mimetypes.getInstance().getMimetype(path));
    }

    public String upload(InputStream inputStream, String path, String contentType) {
        if (!(inputStream instanceof ByteArrayInputStream)) {
            inputStream = new ByteArrayInputStream(IoUtil.readBytes(inputStream));
        }
        try {
            ObjectMetadata metadata = new ObjectMetadata();
            metadata.setContentType(contentType);
            metadata.setContentLength(inputStream.available());
            PutObjectRequest putObjectRequest = new PutObjectRequest(config.getBucketName(), path, inputStream, metadata);
            // 设置上传对象的 Acl 为公共读
            putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead);
            PutObjectResult putObjectResult = client.putObject(putObjectRequest);
        } catch (Exception e) {
            throw new StorageException("上传文件失败，请检查配置信息:[" + e.getMessage() + "]");
        }
        return config.getDomain() + "/" + path;
    }


    @Override
    public void delete(String path) {
        client.deleteObject(config.getBucketName(), path);
    }
}
