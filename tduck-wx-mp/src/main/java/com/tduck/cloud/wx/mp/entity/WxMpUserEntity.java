package com.tduck.cloud.wx.mp.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.tduck.cloud.common.entity.BaseEntity;
import lombok.Data;


/**
 * 微信公众号用户 (WxMpUser)表实体类
 *
 * @author smalljop
 * @since 2020-12-01 17:04:32
 */

@Data
@TableName(value = "wx_mp_user", autoResultMap = true)
public class WxMpUserEntity extends BaseEntity<WxMpUserEntity> {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 公众号AppId
     */
    private String appid;
    /**
     * 昵称
     */
    private String nickname;
    /**
     * 性别
     */
    private Integer sex;
    /**
     * 头像
     */
    private String headImgUrl;
    private String unionId;
    private String openId;
    /**
     * 国家
     */
    private String country;
    /**
     * 省
     */
    private String province;
    /**
     * 城市
     */
    private String city;
    /**
     * 是否关注
     */
    @TableField("is_subscribe")
    private Boolean subscribe;

    /**
     * 账号Id
     */
    private Long userId;


}