package com.tduck.cloud.account.service;

import java.time.LocalDateTime;
import java.util.List;

import com.tduck.cloud.account.entity.UserTokenEntity;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 用户tokenService接口
 *
 * @author tduck
 * @date 2023-04-04 16:11:29
 */
public interface UserTokenService extends IService<UserTokenEntity> {


    /**
     * 移除token
     *
     * @param token
     */
    void removeToken(String token);

    /**
     * 保存token
     *
     * @param token      token
     * @param userId     用户id
     * @param expireTime 过期时间
     * @return token
     */
    void saveToken(String token, Long userId, LocalDateTime expireTime);

    /**
     * 验证token
     *
     * @param token  token
     * @param userId 用户id
     */
    boolean verifyToken(String token, Long userId);
}
