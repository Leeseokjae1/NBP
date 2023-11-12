package com.study.nbnb.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.nbnb.dto.B1Dto;

@Mapper
public interface B1Dao {
	public List<B1Dto> listDao();
	public B1Dto viewDao(int b1_number);
	public int writeDao(String writer, String title, String content,
			String imageurl1, String imageurl2, String imageurl3);	
	
	public void modifyDao(Map<String, String> parameters);
	
	public B1Dto modifymoveDao(@Param("b1_number") String b1_number);
	public int deleteDao(String b1_number);
	
	public int likelyDao(int b1_number);
	public int likeDropDao(int b1_number);
	public int dislikelyDao(int b1_number);
	public int dislikeDropDao(int b1_number);
	
	public List<B1Dto> listCountDao();
	public List<B1Dto> pageDao(int page, int pageSize);	
	public int selectDao();
	
	 public List<B1Dto> SearchDao(@Param("keyword") String keyword, 
			 					  @Param("start") int start, 
			 					  @Param("pageSize") int pageSize);

	 public List<B1Dto> SearchCountDao(@Param("keyword") String keyword);
}


