package com.tduck.cloud.common.constant;

/**
 * @description: 通用的常亮
 * @author: smalljop
 * @create: 2018-09-27 13:25
 **/
public interface CommonConstants {


    /**
     * 超级管理员id
     */
    Long SUPER_ADMIN_ID = 1L;


    String USER_KEY = "userId";
    /**
     * 用户正常状态
     * 1:正常 0 :禁用
     */
    Integer USER_NORMAL_STATUS = 1;
    /**
     * 文件下载content_type
     */
    String FILE_DOWNLOAD_CONTENT_TYPE = "application/octet-stream;charset=UTF-8";


    /**
     * 数字常量
     */
    interface ConstantNumber {
        /**
         * @Fields NEGATIVE : ( -1 )
         */
        Integer NEGATIVE = -1;

        /**
         * @Fields ZERO : ( 0 )
         */
        Integer ZERO = 0;

        /**
         * @Fields ONE : ( 1 )
         */
        Integer ONE = 1;

        /**
         * @Fields TOW : ( 2 )
         */
        Integer TOW = 2;

        /**
         * @Fields THREE : ( 3 )
         */
        Integer THREE = 3;

        /**
         * @Fields FOUR : ( 4 )
         */
        Integer FOUR = 4;

        /**
         * @Fields FIVE : ( 5 )
         */
        Integer FIVE = 5;

        /**
         * @Fields FIVE : ( 6 )
         */
        Integer SIX = 6;

        /**
         * @Fields FIVE : ( 7 )
         */
        Integer Seven = 7;

        /**
         * @Fields FIVE : ( 8 )
         */
        Integer Eight = 8;

        /**
         * @Fields FIVE : ( 9 )
         */
        Integer Nine = 9;

        /**
         * @Fields FIVE : ( 10 )
         */
        Integer Ten = 10;


    }

}
