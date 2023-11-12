package com.study.nbnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.nbnb.dto.PlayDto;


@Mapper
public interface PlayDao {
	public List<PlayDto> plistDao();
	public PlayDto viewDao(int f_number);
	public int writeDao(String writer, String title, String content, String imageurl);
	public int deleteDao(int f_number);
	public int modifyDao(String writer, String title, String content,String imageURL,int f_number);
	public int likelyDao(int f_number);
	public int likeDropDao(int f_number);
	public int dislikelyDao(int f_number);
	public int dislikeDropDao(int f_number);
	
	public List<PlayDto> listCountDao();
	public List<PlayDto> pageDao(int page, int pageSize);	
	public int selectDao();
	
	public List<PlayDto> SearchDao(@Param("keyword") String keyword,
             @Param("start") int start,
             @Param("pageSize") int pageSize);

	public List<PlayDto> SearchCountDao(@Param("keyword") String keyword);
}