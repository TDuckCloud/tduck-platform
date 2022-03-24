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
    }

}
