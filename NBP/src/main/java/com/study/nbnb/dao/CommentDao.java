package com.study.nbnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.nbnb.dto.CommentDto;


@Mapper
public interface CommentDao {
	public List<CommentDto> listDao();
	public List<CommentDto> viewDao(int check_b, int f_number);
	public int writeDao(@Param("check_b") int check_b, @Param("m_number") int m_number,
			@Param("nickname") String nickname,@Param("cmt")  String cmt,@Param("t_number") int t_number);
	public int deleteDao(int c_number);
}