package com.study.nbnb.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface AdDao {
	 public List<Map<String, Object>> adAllBoards();
	 public int adDelete(String boardname,
			 			String whatboard,
			 			String no);
}


