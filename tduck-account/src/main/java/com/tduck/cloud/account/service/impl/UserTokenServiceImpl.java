package com.tduck.cloud.account.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tduck.cloud.account.mapper.UserTokenMapper;
import com.tduck.cloud.account.entity.UserTokenEntity;
import com.tduck.cloud.account.service.UserTokenService;

import java.time.LocalDateTime;

/**
 * 用户tokenService业务层处理
 *
 * @author tduck
 * @date 2023-04-04 16:11:29
 */
@Service
public class UserTokenServiceImpl extends ServiceImpl<UserTokenMapper, UserTokenEntity> implements UserTokenService {

    @Override
    public void removeToken(String token) {
        this.remove(Wrappers.<UserTokenEntity>lambdaQuery().eq(UserTokenEntity::getToken, token));
    }

    @Override
    public void saveToken(String token, Long userId, LocalDateTime expireTime) {
        this.remove(Wrappers.<UserTokenEntity>lambdaQuery().eq(UserTokenEntity::getUserId, userId).le(UserTokenEntity::getExpireTime, LocalDateTime.now()));
        UserTokenEntity userTokenEntity = new UserTokenEntity();
        userTokenEntity.setToken(token);
        userTokenEntity.setUserId(userId);
        userTokenEntity.setExpireTime(expireTime);
        this.save(userTokenEntity);
    }

    @Override
    public boolean verifyToken(String token, Long userId) {
        UserTokenEntity one = this.getOne(Wrappers.<UserTokenEntity>lambdaQuery().eq(UserTokenEntity::getToken, token));
        if (ObjectUtil.isNull(one)) {
            return false;
        }
        if (ObjectUtil.notEqual(one.getUserId(), userId)) {
            return false;
        }
        if (one.getExpireTime().isBefore(LocalDateTime.now())) {
            return false;
        }
        return true;
    }
}
