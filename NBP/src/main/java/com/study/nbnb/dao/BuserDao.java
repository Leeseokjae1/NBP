package com.study.nbnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.nbnb.dto.BuserDto;

@Mapper
public interface BuserDao {
	public List<BuserDto> listDao();
	public BuserDto loginDao(String id);
	public int writeDao(String NAME,String ID,String PASSWORD,String ADDRESS,String EMAIL,String PHONENUMBER,String NICKNAME,String BBANG);
	public int deleteDao(String id);
	public BuserDto selectDao(String ID);
	public BuserDto selectUser(int M_NUMBER);
	public int updateUser(String id, String password , String name , String address , String email , String PHONENUMBER , String NICKNAME , int m_number);
	public int updateUser2(String id,String name , String address , String email , String PHONENUMBER , String NICKNAME , int m_number);
	public BuserDto emailDao(String EMAIL);
	public int emailPwDao(String EMAIL, String PASSWORD);
	public int updateTicket(int TICKET, int M_NUMBER);
}
