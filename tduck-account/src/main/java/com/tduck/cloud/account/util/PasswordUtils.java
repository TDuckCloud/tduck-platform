package com.tduck.cloud.account.util;


import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.digest.DigestUtil;
import com.tduck.cloud.account.entity.UserEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * 密码工具类
 */
public class PasswordUtils {
    private static final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();


    /**
     * 加密密码
     *
     * @param password 密码
     * @return 加密后的密码
     */
    public static String encode(String password) {
        return passwordEncoder.encode(password);
    }

    /**
     * 密码匹配
     *
     * @param rawPassword     原始密码
     * @param encodedPassword 加密后的密码
     * @return 是否匹配
     */
    public static boolean matches(String rawPassword, String encodedPassword) {
        return passwordEncoder.matches(rawPassword, encodedPassword);
    }


    /**
     * 检查密码是否正确
     */
    public static boolean checkPassword(UserEntity userEntity, String inputPassword) {
        //  加密模式
        if (userEntity.getPasswordType() == 0) {
            DigestUtil.sha256Hex(inputPassword);
            return StrUtil.equals(userEntity.getPassword(), DigestUtil.sha256Hex(inputPassword));
        }
        //  bcrypt模式
        return matches(inputPassword, userEntity.getPassword());
    }


}
