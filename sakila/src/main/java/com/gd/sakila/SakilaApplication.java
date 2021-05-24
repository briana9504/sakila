package com.gd.sakila;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling // 스케줄러 사용하기 위해..(특정 시간에 실행)
@ServletComponentScan//필터 사용하기 위해
@SpringBootApplication//com.gd.sakila 에서 벗어나면 스캔이 안된다. 그런경우 써줘야함 -> ex) @ComponentScan("com.gd.serivce")
public class SakilaApplication {//스프링 메인
	
	//시작하면서 스프링이 시작 filter는 스프링게 아니라서 (서블릿) 사용하도록 표시해 주어야함!-> @ServletComponentScan
	
	public static void main(String[] args) {
		SpringApplication.run(SakilaApplication.class, args);
		//시작하면서 @Controller, @Mapper, @Service,... -> 객체로 등록
	}

}
