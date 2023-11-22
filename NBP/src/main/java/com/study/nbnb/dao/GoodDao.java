package com.study.nbnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.nbnb.dto.GoodDto;

@Mapper
public interface GoodDao {
   
     List<GoodDto> getgoodpost(int t_number);
}