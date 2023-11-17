package com.study.nbnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.nbnb.dto.RankDto;

@Mapper
public interface RDao {
       List<RankDto> getb1Ranking();
       List<RankDto> getb2Ranking();
       List<RankDto> getplRanking();
       List<RankDto> getb1UserRanking();
       List<RankDto> getb2UserRanking();
       List<RankDto> getplUserRanking();
       List<RankDto> getUserRanking();
}