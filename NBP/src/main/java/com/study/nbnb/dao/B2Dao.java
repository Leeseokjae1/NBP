package com.study.nbnb.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.nbnb.dto.B1Dto;
import com.study.nbnb.dto.B2Dto;

@Mapper
public interface B2Dao {
	public List<B2Dto> listDao();
	public B2Dto viewDao(int b2_number);
	public int writeDao(String writer, String title, String content,
			String imageurl1, String imageurl2, String imageurl3);	
	
	public void modifyDao(Map<String, String> parameters);
	
	public B1Dto modifymoveDao(@Param("b2_number") String b2_number);
	public int deleteDao(String b2_number);
	
	public int likelyDao(int b2_number);
	public int likeDropDao(int b2_number);
	public int dislikelyDao(int b2_number);
	public int dislikeDropDao(int b2_number);
	
	
	public List<B2Dto> listCountDao();
	public List<B2Dto> pageDao(int page, int pageSize);	
	public int selectDao();
}


