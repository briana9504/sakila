package com.gd.sakila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.LanguageMapper;
import com.gd.sakila.vo.Language;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Transactional
@Service
public class LanguageService {
	@Autowired
	LanguageMapper languageMapper;
	
	public List<Language> getLanguageList(){
		
		return this.languageMapper.selectLanguageList();
	}
}
