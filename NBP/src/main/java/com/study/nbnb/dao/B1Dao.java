package com.study.nbnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.nbnb.dto.B1Dto;
import com.study.nbnb.dto.BuserDto;

@Mapper
public interface B1Dao {
	public List<BuserDto> listDao();
	public BuserDto viewDao(String id);
	public int writeDao(String writer, String title, String content);
	public int deleteDao(String id);
}
