package com.study.nbnb.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdDao {
	 public List<Map<String, Object>> adAllBoards();
}


