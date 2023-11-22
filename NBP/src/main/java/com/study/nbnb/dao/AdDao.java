package com.study.nbnb.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.nbnb.dto.AdDto;

@Mapper
public interface AdDao {
	 public List<Map<String, Object>> adAllBoards();
	 public int adDelete(String boardname,
			 			String whatboard,
			 			String no);
	 public List<AdDto> pageDao(@Param("page")int page, @Param("pagesize") int pageSize);	
	 public List<AdDto>listCountDao();
}


