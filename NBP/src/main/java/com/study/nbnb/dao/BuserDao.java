package com.study.nbnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.nbnb.dto.BuserDto;

@Mapper
public interface BuserDao {
	public List<BuserDto> listDao();
	public List<BuserDto> loginDao(String id, String pw);
	public int writeDao(String NAME,String ID,String PASSWORD,String ADDRESS,String EMAIL,String PHONENUMBER,String NICKNAME,int BBANG);
	public int deleteDao(String id);
}
