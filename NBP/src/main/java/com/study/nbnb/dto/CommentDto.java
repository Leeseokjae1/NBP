package com.study.nbnb.dto;

import java.sql.Timestamp;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

public class CommentDto {

	private int check_b;
	private int c_number;
	private int m_number;
	private String nickname;
	private Timestamp c_date;

	private String cmt;
	
	private int t_number;
	public int getT_number() {
		return t_number;
	}
	public void setT_number(int t_number) {
		this.t_number = t_number;
	}
	public int getCheck_b() {
		return check_b;
	}
	public void setCheck_b(int check_b) {
		this.check_b = check_b;
	}
	public int getC_number() {
		return c_number;
	}
	public void setC_number(int c_number) {
		this.c_number = c_number;
	}
	public int getM_number() {
		return m_number;
	}
	public void setM_number(int m_number) {
		this.m_number = m_number;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Timestamp getC_date() {
		return c_date;
	}
	public void setC_date(Timestamp c_date) {
		this.c_date = c_date;
	}
	public String getcmt() {
		return cmt;
	}
	public void setcmt(String cmt) {
		this.cmt = cmt;
	}


}
