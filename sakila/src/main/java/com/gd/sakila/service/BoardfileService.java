package com.gd.sakila.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gd.sakila.mapper.BoardMapper;
import com.gd.sakila.mapper.BoardfileMapper;
import com.gd.sakila.vo.Boardfile;
import com.gd.sakila.vo.Staff;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class BoardfileService {
	@Autowired
	BoardfileMapper boardfileMapper;
	@Autowired
	BoardMapper boardMapper;
	
	//파일 입력
	public int addBoardfile(MultipartFile multipartFile, int boardId) {
		//1)db입력
		
		int row = 0;
		if(multipartFile != null) {
			Boardfile boardfile = new Boardfile();
			
			boardfile.setBoardfileSize(multipartFile.getSize());
			boardfile.setBoardId(boardId);
			boardfile.setBoardfileType(multipartFile.getContentType());
			
			//파일 이름 --> UUID.확장자
			int p = multipartFile.getOriginalFilename().lastIndexOf(".");
			String ext = multipartFile.getOriginalFilename().substring(p).toLowerCase();//확장자
			String prename = UUID.randomUUID().toString().replace("-", "");
			
			String fileName = prename+ext;//저장되는 파일 이름
			log.debug("§§§§§§§§§ fileName:  "+fileName);
			boardfile.setBoardfileName(fileName);
		
			row = boardfileMapper.insertBoardfile(boardfile);
			
			//2)물리적 파일 저장
			if(row == 1) {
				File temp = new File("");
				String path = temp.getAbsolutePath();
				
				try {
					
					//배포 전 배포 후 나뉜다 --> 운영체제로 확인
					String os = System.getProperty("os.name");
					if(os.contains("Win")) { //윈도우의 경우... 배포전
						multipartFile.transferTo(new File(path+File.separator+Paths.get("src","main","webapp","resource")+File.separator+fileName));
					} else { //배포 후
						multipartFile.transferTo(new File(path+File.separator+Paths.get("webapps", "sakila", "resource")+File.separator+fileName));
					}
					
					
				} catch (Exception e) {
					throw new RuntimeException();
				}
			}
		}
				
		return row;
	}
	
	public int removeBoardfileOne(Boardfile boardfile, Staff staff) {
		log.debug("§§§§§§§§§§ removeBoardfileOne() boardfile param: "+boardfile);
		log.debug("§§§§§§§§§§ removeBoardfileOne() staff param: "+staff);
		
		if(!boardMapper.selectBoardOne(boardfile.getBoardId()).get("username").equals(staff.getUsername())) {
			log.debug("아이디가 달라서 삭제안됩니다.");
			return 0;
		}
		
		
		//1) 물리적파일 삭제
		File temp = new File("");
		String path = temp.getAbsolutePath();
		log.debug("확인!!!!!!!!"+path);
		
		String os = System.getProperty("os.name");
		File file = null;
		if(os.contains("Win")) {//윈도우인 경우 - 배포전
			file = new File(path+File.separator+Paths.get("src","main","webapp","resource")+File.separator+boardfile.getBoardfileName());//메모리 안에 파일을 새로만듬...
		} else {
			//배포 버전인 경우 -우분투
			file = new File(path+File.separator+Paths.get("webapps", "sakila", "resource")+File.separator+boardfile.getBoardfileName());			
		}
		if(file.exists()) {//파일이 존재한다면
			log.debug("§§§§§§§ 파일 삭제 if문!");
			file.delete();
		}
		//2) db삭제
		int row = boardfileMapper.deleteBoardfileOne(boardfile.getBoardfileId());
		log.debug("삭제성공(1), 삭제실패(0): " + row);
		
		return row;
	}
}
