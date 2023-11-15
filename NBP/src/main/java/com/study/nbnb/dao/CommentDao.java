package com.study.nbnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.nbnb.dto.CommentDto;
import com.study.nbnb.dto.PlayDto;

@Mapper
public interface CommentDao {
	
	public List<CommentDto> listDao();
	public List<CommentDto> viewDao(int check_b, int f_number);
	public int writeDao(int check_b, int m_number, String nickname,  String cmt, int t_number);
	public int deleteDao(int c_number);
}