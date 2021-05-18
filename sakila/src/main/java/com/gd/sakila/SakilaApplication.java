package com.gd.sakila;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@ServletComponentScan
@SpringBootApplication
public class SakilaApplication {//스프링 메인

	public static void main(String[] args) {//시작하면서 스프링이 시작 filter는 스프링게 아니라서 사용하도록 표시해 주어야함!
		SpringApplication.run(SakilaApplication.class, args);
		//시작하면서 @Controller, @Mapper, @Service,... -> 객체로 등록
	}

}
