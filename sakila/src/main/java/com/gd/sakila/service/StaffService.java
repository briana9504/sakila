package com.gd.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.StaffMapper;
import com.gd.sakila.vo.Staff;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class StaffService {
	@Autowired//DI @Autowired 없으면 --> nullPointException 발생...
	StaffMapper staffMapper;
	//staff 상세보기
	public Map<String, Object> getStaffOne(int staffId){
		log.debug("▶▶▶▶▶▶▶▶getStaffOne() staffId : "+ staffId);
		return staffMapper.selectStaffListOne(staffId);
	}
	//staff 목록보기
	public List<Map<String, Object>> getStaffList(){
		return staffMapper.selectStaffList();
	}
	
	//로그인
	public Staff login(Staff staff) {
		log.debug("▶▶▶▶▶▶▶▶login() staff : "+ staff);
		return staffMapper.selectStaffByLogin(staff);//null of staff 객체
	}
}
