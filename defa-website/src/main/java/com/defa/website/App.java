package com.defa.website;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.ComponentScan;

import com.defa.website.conf.WebProperties;


@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
@EnableConfigurationProperties(WebProperties.class)
@ComponentScan(value = "com.defa")
public class App {

	public static void main(String[] args) {
		SpringApplication.run(App.class, args);
	}
}
