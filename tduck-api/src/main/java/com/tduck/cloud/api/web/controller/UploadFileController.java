package com.tduck.cloud.api.web.controller;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.CharUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.crypto.SecureUtil;
import com.tduck.cloud.api.annotation.Login;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.storage.cloud.OssStorageFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * @author : smalljop
 * @description : 上传文件
 * @create : 2020-11-27 14:00
 **/
@RestController
@RequiredArgsConstructor
public class UploadFileController {


    /**
     * 上传用户文件
     * <p>
     * 用户Id MD5加密 同一个用户的文件放在一个目录下
     *
     * @param file
     * @param userId
     * @return
     * @throws IOException
     */
    @Login
    @PostMapping("/user/file/upload")
    public Result<String> uploadUserFile(@RequestParam("file") MultipartFile file, @RequestAttribute Long userId) throws IOException {
        String path = new StringBuffer(SecureUtil.md5(String.valueOf(userId)))
                .append(CharUtil.SLASH)
                .append(IdUtil.simpleUUID())
                .append(CharUtil.DOT)
                .append(FileUtil.extName(file.getOriginalFilename())).toString();
        String url = OssStorageFactory.build().upload(file.getInputStream(), path);
        return Result.success(url);
    }


    /**
     * 项目文件上传
     *
     * @param file
     * @param projectKey
     * @return
     * @throws IOException
     */
    @PostMapping("/project/file/upload/{projectKey}")
    public Result<String> uploadProjectFile(@RequestParam("file") MultipartFile file, @PathVariable("projectKey") String projectKey) throws IOException {
        String path = new StringBuffer(SecureUtil.md5(projectKey))
                .append(CharUtil.SLASH)
                .append(IdUtil.simpleUUID())
                .append(CharUtil.DOT)
                .append(FileUtil.extName(file.getOriginalFilename())).toString();
        String url = OssStorageFactory.build().upload(file.getInputStream(), path);
        return Result.success(url);
    }

}
