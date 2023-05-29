package com.tduck.cloud.account.service.impl;

import cn.hutool.core.lang.Validator;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.ReUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.digest.DigestUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tduck.cloud.account.constant.AccountConstants;
import com.tduck.cloud.account.constant.AccountRedisKeyConstants;
import com.tduck.cloud.account.entity.UserAuthorizeEntity;
import com.tduck.cloud.account.entity.UserEntity;
import com.tduck.cloud.account.entity.enums.AccountChannelEnum;
import com.tduck.cloud.account.mapper.UserMapper;
import com.tduck.cloud.account.request.AccountLoginRequest;
import com.tduck.cloud.account.request.QqLoginRequest;
import com.tduck.cloud.account.request.RegisterAccountRequest;
import com.tduck.cloud.account.service.UserAuthorizeService;
import com.tduck.cloud.account.service.UserService;
import com.tduck.cloud.account.service.UserTokenService;
import com.tduck.cloud.account.util.JwtUtils;
import com.tduck.cloud.account.util.NameUtils;
import com.tduck.cloud.account.util.PasswordUtils;
import com.tduck.cloud.account.vo.LoginUserVO;
import com.tduck.cloud.common.util.CacheUtils;
import com.tduck.cloud.common.util.Result;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

/**
 * 用户(AcUser)表服务实现类
 *
 * @author smalljop
 * @since 2020-11-10 18:10:43
 */
@Slf4j
@Service("userService")
@RequiredArgsConstructor
public class UserServiceImpl extends ServiceImpl<UserMapper, UserEntity> implements UserService {


    private final JwtUtils jwtUtils;
    private final CacheUtils cacheUtils;
    private final UserTokenService userTokenService;
    private final UserAuthorizeService userAuthorizeService;


    @Override
    public Result emailRegister(RegisterAccountRequest request) {
        String code = cacheUtils.getTemp(StrUtil.format(AccountRedisKeyConstants.EMAIL_CODE, request.getEmail()));
        if (!request.getCode().equals(code)) {
            return Result.failed("验证码错误");
        }
        if (ObjectUtil.isNotNull(getUserByEmail(request.getEmail()))) {
            return Result.failed("该邮箱已经注册");
        }
        UserEntity userEntity = new UserEntity();
        userEntity.setEmail(request.getEmail());
        userEntity.setPassword(request.getPassword());
        userEntity.setRegChannel(AccountChannelEnum.EMAIL);
        this.createUser(userEntity);
        return Result.success();
    }

    @Override
    public Result phoneRegister(RegisterAccountRequest request) {
        if (ObjectUtil.isNotNull(getUserByPhoneNumber(request.getPhoneNumber()))) {
            return Result.failed("该手机已经注册");
        }
        UserEntity userEntity = new UserEntity();
        userEntity.setPhoneNumber(request.getPhoneNumber());
        userEntity.setPassword(request.getPassword());
        userEntity.setRegChannel(AccountChannelEnum.PHONE);
        this.createUser(userEntity);
        return Result.success();
    }

    /**
     * 创建用户
     */
    private void createUser(UserEntity userEntity) {
        userEntity.setName(NameUtils.getCnName());
        userEntity.setAvatar(AccountConstants.DEFAULT_AVATAR);
        userEntity.setPasswordType(1);
        userEntity.setPassword(PasswordUtils.encode(userEntity.getPassword()));
        this.save(userEntity);
    }


    @Override
    public Result accountLogin(AccountLoginRequest request) {
        UserEntity userEntity;
        if (ReUtil.isMatch(Validator.EMAIL, request.getAccount())) {
            userEntity = getUserByEmail(request.getAccount());
        } else {
            userEntity = getUserByPhoneNumber(request.getAccount());
        }
        if (ObjectUtil.isNull(userEntity) || !PasswordUtils.checkPassword(userEntity, request.getPassword())) {
            return Result.failed("账号或密码错误");
        }
        updatePasswordType(userEntity, request.getPassword());
        return Result.success(getLoginResult(userEntity,
                ReUtil.isMatch(Validator.EMAIL, request.getAccount()) ? AccountChannelEnum.EMAIL : AccountChannelEnum.PHONE,
                request.getRequestIp()));
    }


    /**
     * 更新密码和加密模式
     */
    public void updatePasswordType(UserEntity userEntity, String password) {
        if (userEntity.getPasswordType() == 1) {
            return;
        }
        userEntity.setPasswordType(1);
        userEntity.setPassword(PasswordUtils.encode(password));
        this.updateById(userEntity);
    }


    /**
     * 获取登录结果
     */
    @Override
    public LoginUserVO getLoginResult(UserEntity userEntity, AccountChannelEnum channel, String requestIp) {
        userEntity.setLastLoginIp(requestIp);
        userEntity.setLastLoginChannel(channel);
        userEntity.setLastLoginTime(LocalDateTime.now());
        this.updateById(userEntity);
        String token = jwtUtils.generateToken(userEntity.getId());
        // 缓存token
        userTokenService.saveToken(token, userEntity.getId(), LocalDateTime.now().plusSeconds(jwtUtils.getExpire()));
        return new LoginUserVO(userEntity.getAvatar(), userEntity.getName(), token, userEntity.isAdmin());
    }

    @Override
    public LoginUserVO qqLogin(QqLoginRequest request) {
        UserEntity userEntity = new UserEntity();
        UserAuthorizeEntity authorizeEntity = userAuthorizeService.getQqAuthorization(request.getAuthorizeCode(), request.getRedirectUri(), userEntity);
        if (ObjectUtil.isNotNull(userEntity) && ObjectUtil.isNull(userEntity.getId())) {
            this.save(userEntity);
            //更新绑定
            authorizeEntity.setUserId(userEntity.getId());
            userAuthorizeService.updateById(authorizeEntity);
        } else {
            userEntity = this.getById(userEntity.getId());
        }
        return getLoginResult(userEntity,
                AccountChannelEnum.QQ, request.getRequestIp());
    }

    /**
     * 根据邮箱获取
     */
    @Override
    public UserEntity getUserByEmail(final String email) {
        return this.getOne(Wrappers.<UserEntity>lambdaQuery().eq(UserEntity::getEmail, email));
    }


    @Override
    public UserEntity getUserByPhoneNumber(final String phoneNumber) {
        return this.getOne(Wrappers.<UserEntity>lambdaQuery().eq(UserEntity::getPhoneNumber, phoneNumber));
    }

    @Override
    public Boolean updatePassword(Long userId, String password) {
        UserEntity userEntity = new UserEntity();
        userEntity.setId(userId);
        userEntity.setPassword(PasswordUtils.encode(password));
        return this.updateById(userEntity);
    }
}


