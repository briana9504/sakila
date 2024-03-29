package com.gd.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Boardfile;
@Mapper
public interface BoardfileMapper {
	int deleteBoardfileOne(int boardfileId);
	int deleteBoardfileByBoardId(int boardId);
	List<Boardfile> selectBoardfileByBoardId(int boardId); //BoardOne에 참조파일을 보여주기 위해...
	int insertBoardfile(Boardfile boardfile);
}
