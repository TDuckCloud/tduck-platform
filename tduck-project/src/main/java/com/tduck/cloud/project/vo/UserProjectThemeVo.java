package com.tduck.cloud.project.vo;

import com.tduck.cloud.project.entity.UserProjectThemeEntity;
import lombok.Data;

/**
 * @author : smalljop
 * @description : 项目主题
 * @create : 2020-11-25 17:33
 **/
@Data
public class UserProjectThemeVo extends UserProjectThemeEntity {

    /**
     * 头部图片
     */
    private String headImgUrl;


    /**
     * 按钮颜色
     */
    private String btnsColor;


}
