package com.tduck.cloud.account.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;
import java.io.Serializable;
import java.math.BigDecimal;

import com.tduck.cloud.common.entity.BaseEntity;

/**
 * 用户token对象 ac_user_token
 *
 * @author tduck
 * @date 2023-04-04 16:11:29
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("ac_user_token")
public class UserTokenEntity extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 类型
     */
    private Long type;

    private Long userId;
    /**
     * 用户Id
     */
    private LocalDateTime expireTime;
    /**
     * token
     */
    private String token;

}
