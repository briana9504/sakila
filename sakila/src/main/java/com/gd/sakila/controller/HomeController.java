package com.gd.sakila.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	//로그 출력 객체 -> ()안에는 로그가 있는 클래스 this.getClass()
	//Logger log = LoggerFactory.getLogger(this.getClass());//HomeController.class 안쓰고 lombok 쓰겠음
	
	@GetMapping({"/","/home","/index"})
	public String home() {
		
		//System.out.println("<HomeController.home>"); 이제 안쓸거임..-> Logger log=LoggerFactory.getLogger(this.getClass())->@Slf4j
		//log 출력
		log.debug("test");
		return "home";
	}
}
