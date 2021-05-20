package com.gd.sakila.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.sakila.service.StaffService;
import com.gd.sakila.vo.Staff;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	//로그 출력 객체 -> ()안에는 로그가 있는 클래스 this.getClass()
	//Logger log = LoggerFactory.getLogger(this.getClass());//HomeController.class 안쓰고 lombok 쓰겠음
	
	@Autowired
	StaffService StaffService;
	
	@GetMapping({"/","/home","/index"})
	public String home() {
		
		//System.out.println("<HomeController.home>"); 이제 안쓸거임..-> Logger log=LoggerFactory.getLogger(this.getClass())->@Slf4j
		//log 출력
		log.debug("test");
		return "home";
	}
	
	@GetMapping("/admin/logout")
	public String logout(HttpSession session) {
		log.debug("▶▶▶▶▶▶▶▶logout");
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("/login")
	public String login(HttpSession session, Staff staff) {//기존 세션 사용하기: controller 매서드 매개변수에 session씀...->string이 주입
		//servlet 세션을 직접 사용!
		log.debug("▶▶▶▶▶▶▶login() param staff: " + staff);
		
		Staff loginStaff = StaffService.login(staff);
		log.debug("▶▶▶▶▶▶▶login() return loginStaff: " + loginStaff);
		
		if(loginStaff != null) {//로그인 성공
			session.setAttribute("loginStaff", loginStaff); // new Staff() 넣음....
		} 
		
		return "redirect:/";
	}
}
