package com.tduck.cloud.account.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.tduck.cloud.account.entity.enums.UserAuthorizeTypeEnum;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.mybatis.handler.JacksonTypeHandler;
import lombok.Data;

import java.util.Map;

/**
 * 第三方用户授权信息(AcUserAuthorize)表实体类
 *
 * @author smalljop
 * @since 2020-12-09 17:43:04
 */

@Data
@TableName(value = "ac_user_authorize", autoResultMap = true)
public class UserAuthorizeEntity extends BaseEntity<UserAuthorizeEntity> {
    private Long id;
    /**
     * 第三方平台类型
     */
    private UserAuthorizeTypeEnum type;
    /**
     * 平台AppId
     */
    private String appId;
    /**
     * 平台OpenId
     */
    private String openId;

    /**
     * 用户名称
     */
    private String userName;
    /**
     * 用户Id
     */
    private Long userId;
    /**
     * 平台用户信息
     */
    @TableField(typeHandler = JacksonTypeHandler.class)
    private Map<String, Object> userInfo;


}