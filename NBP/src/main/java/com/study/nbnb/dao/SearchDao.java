package com.study.nbnb.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.nbnb.dto.B1Dto;

@Mapper
public interface SearchDao {

    List<B1Dto> unifiedSearchDao(@Param("tableName") String tableName,
                                 @Param("keyword") String keyword,
                                 @Param("start") int start,
                                 @Param("pageSize") int pageSize);

    List<B1Dto> unifiedSearchCountDao(@Param("tableName") String tableName,
                                      @Param("keyword") String keyword);

}