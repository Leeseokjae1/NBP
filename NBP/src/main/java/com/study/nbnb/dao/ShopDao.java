package com.study.nbnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.nbnb.dto.B1Dto;
import com.study.nbnb.dto.PlayDto;
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
	public List<ShopDto> listCountDao();
	public List<ShopDto> listCountDao1(String field);
	public List<ShopDto> pageDao(int page, int pageSize);
	public int deleteDao(int buy_number,int m_number);
	public int approveDao(int buy_number, int m_nuber);
	public int refuseDao(int buy_number, int m_nuber);
	public List<ShopDto> pageDao2(int m_number, int page, int pageSize);
	public List<ShopDto> pageDao3(int buy_number, int page, int pageSize);
	
	
	public List<ShopDto> buyCountDao(@Param("keyword") String keyword);
	
	public List<ShopDto> buysearchDao(@Param("writer") String keyword,
									  @Param("page") int page,@Param("pagesize") int pageSize);
	
	public List<ShopDto> memberCountDao(@Param("keyword") String keyword);
	
	public List<ShopDto> membersearchDao(@Param("content") String keyword,
									  @Param("page") int page,@Param("pagesize") int pageSize);	
	
	public List<ShopDto> SearchDao(@Param("keyword") String keyword, 
             @Param("start") int start, 
             @Param("pageSize") int pageSize);

	public int searchCountDao(@Param("keyword") String keyword);
}