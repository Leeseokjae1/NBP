package com.study.nbnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.study.nbnb.dto.PlayDto;


@Mapper
public interface PlayDao {
	public List<PlayDto> plistDao();
	public PlayDto viewDao(int f_number);
	public int writeDao(String writer, String title, String content);
	public int deleteDao(int f_number);
	public int modifyDao(String writer, String title, String content,int f_number);
	public int likelyDao(int f_number);
	public int likeDropDao(int f_number);
}