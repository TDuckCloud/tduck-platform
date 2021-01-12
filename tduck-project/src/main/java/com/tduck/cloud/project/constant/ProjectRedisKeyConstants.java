package com.tduck.cloud.project.constant;

/**
 * @description: redis key常量
 * @author: smalljop
 * @create: 2020-02-12 22:34
 **/
public interface ProjectRedisKeyConstants {
    /**
     * 项目Item排序位置自增
     */
    String PROJECT_ITEM_POS_DELTA = "project:item:pos:{}";


    /**
     * 项目Item排序位置自增
     */
    String PROJECT_RESULT_NUMBER = "project:result:number:{}";

    /**
     * 查看项目IP记录列表
     */
    String PROJECT_VIEW_IP_LIST = "project:view:ip:list:{}";

}
