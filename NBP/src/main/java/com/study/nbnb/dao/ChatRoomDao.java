package com.study.nbnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.nbnb.dto.BuserDto;
import com.study.nbnb.dto.ChatRoomDto;

@Mapper
public interface ChatRoomDao {
	public int createChatRoomDao();
	public List<ChatRoomDto> listroomDao(@Param("nickname") String nickname);
	public int useTicket(int m_number);
}
