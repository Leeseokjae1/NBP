package com.study.nbnb.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class PlayDto {
	private int f_number;
	private String writer;
	private String title;
	private String content;
//	private String photo;
	private int b_like;
	private int b_dislike;
	private Timestamp time;
	
	
	
	public int getF_number() {
		return f_number;
	}
	public void setF_number(int f_number) {
		this.f_number = f_number;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
//	public String getPhoto() {
//		return photo;
//	}
//	public void setPhoto(String photo) {
//		this.photo = photo;
//	}
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
}
