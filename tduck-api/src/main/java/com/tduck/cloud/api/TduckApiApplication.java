package com.tduck.cloud.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableAsync;

/**
 * @author smalljop
 */
@SpringBootApplication
@EnableAsync
@EnableCaching
@ComponentScan("com.tduck.cloud.*")
public class TduckApiApplication {

    public static void main(String[] args) {
        SpringApplication.run(TduckApiApplication.class, args);
        System.out.println("Tduck-填鸭表单社区版-启动成功>>");
        System.out.println("启动成功，请访问：http://localhost:8999");
        System.out.println("请使用管理员账号登录，用户名：admin@tduckcloud.com，密码：123456,然后请尽快修改密码!!!");
    }

}
