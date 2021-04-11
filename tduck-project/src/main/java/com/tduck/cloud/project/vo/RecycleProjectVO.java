package com.tduck.cloud.project.vo;

import com.tduck.cloud.common.entity.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * @author : smalljop
 * @description : 回收站项目
 * @create :  2021/03/23 17:13
 **/
@Data
@AllArgsConstructor
public class RecycleProjectVO extends BaseEntity {
    private String key;
    /***
     * 收集数量
     */
    private Integer resultCount;

    private String name;

    public RecycleProjectVO(String key, int resultCount, String name, LocalDateTime createTime, LocalDateTime updateTime) {
        this.key = key;
        this.resultCount = resultCount;
        this.name = name;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }
}
