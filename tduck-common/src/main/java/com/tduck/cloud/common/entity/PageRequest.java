package com.tduck.cloud.common.entity;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;

/**
 * @author : smalljop
 * @description : 分页
 * @create : 2020-12-09 10:47
 **/
@Data
public class PageRequest {

    private long current = 1;
    private long size = 50;


    public Page toMybatisPage() {
        return new Page(current, size);
    }
}
