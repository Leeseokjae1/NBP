package com.study.nbnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.nbnb.dto.LikeDto;

@Mapper
public interface LikeDao {
	
	public List<LikeDto> listDao(int check_b,int t_number,int m_number);
	public List<LikeDto> listDao2(int check_b,int t_number,int m_number, int l_or_dl);
	public int likeClickDao(int check_b, int t_number, int m_number, int l_or_dl);
	public int deleteDao(int check_b, int t_number, int m_number);
	public int dislikeClickDao(int check_b, int t_number, int m_number, int l_or_dl);
	
}