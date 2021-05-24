package com.gd.sakila;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.gd.sakila.service.CustomerService;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class SakilaScheduler {
	@Autowired
	CustomerService customerService;
	//Scheduler 매서드는 void반환(return값 없음), 매개변수 0개
	
	// 0 0 0: 24시, 1: 1일, *:매달, *:요일 상관없음
	//0 20 11 24 * *: 24일 11시 20분에 실행
	@Scheduled(cron = "0 0 0 1 * *")
	public void modifyCustomerActive() {
		this.customerService.modifyCustomerActiveByScheduler();
		log.debug("§§§§§§§§§§ modifyCustomerAcive 스케줄러 실행 완료!");
	}
}
