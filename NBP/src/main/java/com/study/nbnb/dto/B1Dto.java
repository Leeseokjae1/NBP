package com.study.nbnb.dto;

import java.sql.Timestamp;

public class B1Dto {
	private int b1_number;
	private String writer;
	private String title;
	private String content;
	private String imageURL;
	private int b_like;
	private int b_dislike;
	private Timestamp time;
	
	
	public int getB1_number() {
		return b1_number;
	}
	public void setB1_number(int b1_number) {
		this.b1_number = b1_number;
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
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
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
		

}
