package com.study.nbnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.nbnb.dto.ShopDto;


@Mapper
public interface ShopDao {

	public int insertDao(int t_count, int t_price, int m_number);
	public ShopDto selectDao(int m_number);
	public ShopDto selectDao2(int m_number);
	public ShopDto selectDao3();
	public int deleteDao(int buy_number);
	public List<ShopDto> listDao(int m_number);
	public List<ShopDto> listDao2();
	public int deleteDao(int buy_number,int m_number);
	public int approveDao(int buy_number, int m_nuber);
	public int refuseDao(int buy_number, int m_nuber);
}