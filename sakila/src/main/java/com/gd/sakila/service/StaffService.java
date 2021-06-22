package com.gd.sakila.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gd.sakila.mapper.AddressMapper;
import com.gd.sakila.mapper.StaffMapper;
import com.gd.sakila.vo.Address;
import com.gd.sakila.vo.Staff;
import com.gd.sakila.vo.StaffForm;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class StaffService {
	@Autowired//DI @Autowired 없으면 --> nullPointException 발생...
	StaffMapper staffMapper;
	@Autowired
	AddressMapper addressMapper;
	
	//staff 추가
	public void addStaff(StaffForm staffForm) {
		log.debug("■■■■■■■■■■■ staffFrom param :" + staffForm);
		
		Address address = staffForm.getAddress();
		Staff staff = staffForm.getStaff();
		
		//주소 저장
		this.addressMapper.insertAddress(address);
		
		//주소 저장되고 가져온 addressId 저장
		staff.setAddressId(address.getAddressId());
		
		//물리적 파일 저장
		MultipartFile file = staffForm.getPicture();
		
		if(file != null) {
			//확장자를 구하기 위해 오리지널 아이디가 필요하다.
			String originalFileName = file.getOriginalFilename();
			
			//마지막 점의 위치 찾기
			int p = originalFileName.lastIndexOf(".");
			//확장자 구하고 소문자로 바꾸기
			String ext = originalFileName.substring(p).toLowerCase();
			String prename = UUID.randomUUID().toString().replace("-", "");
			
			String fileName = prename + ext;
			log.debug(fileName);
			//db에는 만들어진 파일네임을 저장
			staff.setPicture(fileName);
			this.staffMapper.insertStaff(staff);
			
			
			try {
				//물리적 파일 저장
				File temp = new File("");
				String path = temp.getAbsolutePath();//프로젝트 위치
				log.debug("■■■■■■■■■■■ 프로젝트 경로: "+path);
				
				String os = System.getProperty("os.name");
				if(os.contains("Win")) { //윈도우의 경우... 배포전
					file.transferTo(new File(path+Paths.get("src","main","webapp","resource")+File.separator+fileName));
				} else { //배포 후
					file.transferTo(new File(path+File.separator+Paths.get("webapps", "sakila", "resource")+File.separator+fileName));
				}
				//new File(path+File.separator+Paths.get("webapps", "sakila", "resource")+File.separator+fileName))
			} catch (Exception e) {
				throw new RuntimeException();
			} 
			
		}
	}
	
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
