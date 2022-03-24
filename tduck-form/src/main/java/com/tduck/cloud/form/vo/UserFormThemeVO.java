package com.tduck.cloud.form.vo;

import com.tduck.cloud.form.entity.UserFormThemeEntity;
import lombok.Data;

/**
 * @author : smalljop
 * @description : 表单主题
 * @create : 2020-11-25 17:33
 **/
@Data
public class UserFormThemeVO extends UserFormThemeEntity {

    /**
     * 头部图片
     */
    private String headImgUrl;


    /**
     * 按钮颜色
     */
    private String btnsColor;


}
