package com.study.nbnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.nbnb.dto.B1Dto;

@Mapper
public interface SearchDao {

    List<B1Dto> b1searchDao(@Param("keyword") String keyword,
                      @Param("Searchfield") String searchfield,
                      @Param("page") int page,
                      @Param("pagesize") int pageSize);

    public List<B1Dto> b1tCountDao(@Param("Searchfield") String searchfield,
    						 	   @Param("keyword") String keyword);
}