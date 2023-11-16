package com.study.nbnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.nbnb.dto.RankDto;

@Mapper
public interface RDao {
       List<RankDto> getRanking();
}