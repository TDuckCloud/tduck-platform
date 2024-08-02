package com.tduck.cloud.storage.exception;


import java.util.Arrays;

/**
 * 文件上传异常
 */
public class InvalidExtensionException extends RuntimeException {
    private static final long serialVersionUID = 1L;

    private final String[] allowedExtension;
    private final String extension;
    private final String filename;

    public InvalidExtensionException(String[] allowedExtension, String extension, String filename) {
        super("文件[" + filename + "]后缀[" + extension + "]不正确，请上传" + Arrays.toString(allowedExtension) + "格式");
        this.allowedExtension = allowedExtension;
        this.extension = extension;
        this.filename = filename;
    }

}
