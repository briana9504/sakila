package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Staff;
/*
 * 스테레오 타입????
 * Bean : 스프링이 시작할때 미리미리 객체를 만들어둔다...
 * @Component, @Repository, @Service, @Controller -> Bean --> 사용법: 1)spring.getBean(클래스타입) 
 * 2)AutoWired <--Dependecy Injection: container역할을 하는 이가 주입
 * 
 * @Mapper --> mybatis의 애노테이션 --> @Repository의 역할 --> 맵퍼+인터페이스 --> 컴파일(?) 시 구현크래스 자동으로 생성
 */

@Mapper//mapper.xml을 찾아서 매서드명과 mapper의 id명이 같으면 합쳐서 메서드를 구현클래스 생성시 오버라이딩을 한다.
public interface StaffMapper {
	Map<String,Object> selectStaffListOne(int StaffId);
	List<Map<String, Object>> selectStaffList();
	Staff selectStaffByLogin(Staff staff);
}
