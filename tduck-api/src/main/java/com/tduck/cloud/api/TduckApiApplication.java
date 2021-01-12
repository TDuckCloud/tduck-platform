package com.tduck.cloud.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * @author hasee
 */
@SpringBootApplication
@ComponentScan("com.tduck.cloud.*")
public class TduckApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(TduckApiApplication.class, args);
	}

}
