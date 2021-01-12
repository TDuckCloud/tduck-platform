package com.tduck.cloud.wx.mp.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WxMpUserVO {
    /**
     * 昵称
     */
    private String nickname;
    /**
     * 头像
     */
    private String headImgUrl;

    private String openId;
}
