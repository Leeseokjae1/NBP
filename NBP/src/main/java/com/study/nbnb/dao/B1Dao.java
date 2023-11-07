package com.study.nbnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.nbnb.dto.B1Dto;

@Mapper
public interface B1Dao {
	public List<B1Dto> listDao();
	public B1Dto viewDao(String b1_number);
	public int writeDao(String writer, String title, String content,
			String imageurl1, String imageurl2, String imageurl3);
	
	public void modifyDao(@Param("b1_number") String b1_number, @Param("writer") String writer, 
            @Param("title") String title, @Param("content") String content, 
            @Param("imageurl1") String imageURL1, @Param("imageurl2") String imageURL2,
            @Param("imageurl3") String imageURL3);
	
	public B1Dto modifymoveDao(@Param("b1_number") String b1_number);
	public int deleteDao(String b1_number);
}
