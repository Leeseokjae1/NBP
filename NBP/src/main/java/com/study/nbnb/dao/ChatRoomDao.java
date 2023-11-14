package com.study.nbnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.nbnb.dto.ChatRoomDto;

@Mapper
public interface ChatRoomDao {
	public int createChatRoomDao();
	public List<ChatRoomDto> listroomDao(int m_number);
	public int exitroomDao(int roomid);
}
