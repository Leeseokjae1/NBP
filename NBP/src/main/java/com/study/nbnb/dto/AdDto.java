package com.study.nbnb.dto;

import java.sql.Timestamp;

import jakarta.annotation.Nullable;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

public class AdDto {
	private int no;
	private String boardname;
	private String title;
	private String content;
	private String writer;
	private int b_like;
	private int b_dislike;
	private Timestamp time;
	private int m_number;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getBoardname() {
		return boardname;
	}
	public void setBoardname(String boardname) {
		this.boardname = boardname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getB_like() {
		return b_like;
	}
	public void setB_like(int b_like) {
		this.b_like = b_like;
	}
	public int getB_dislike() {
		return b_dislike;
	}
	public void setB_dislike(int b_dislike) {
		this.b_dislike = b_dislike;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public int getM_number() {
		return m_number;
	}
	public void setM_number(int m_number) {
		this.m_number = m_number;
	}
	
	
}
