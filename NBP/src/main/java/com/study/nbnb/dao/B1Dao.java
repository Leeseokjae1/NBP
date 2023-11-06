package com.study.nbnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.nbnb.dto.B1Dto;

@Mapper
public interface B1Dao {
	public List<B1Dto> listDao();
	public B1Dto viewDao(String id);
	public int writeDao(String writer, String title, String content);
	public int deleteDao(String id);
}
