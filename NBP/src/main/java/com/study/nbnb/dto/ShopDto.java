package com.study.nbnb.dto;

import java.sql.Timestamp;

public class ShopDto {
	private int buy_number;
	private int t_count;
	private int t_price;
	private int m_number;
	private Timestamp b_date;
	private String t_cancel;
	private int ticket;
	
	
	public int getTicket() {
		return ticket;
	}
	public void setTicket(int ticket) {
		this.ticket = ticket;
	}
	public String getT_cancel() {
		return t_cancel;
	}
	public void setT_cancel(String t_cancel) {
		this.t_cancel = t_cancel;
	}
	public int getBuy_number() {
		return buy_number;
	}
	public void setBuy_number(int buy_number) {
		this.buy_number = buy_number;
	}
	public int getT_count() {
		return t_count;
	}
	public void setT_count(int t_count) {
		this.t_count = t_count;
	}
	public int getT_price() {
		return t_price;
	}
	public void setT_price(int t_price) {
		this.t_price = t_price;
	}
	public int getM_number() {
		return m_number;
	}
	public void setM_number(int m_number) {
		this.m_number = m_number;
	}
	public Timestamp getB_date() {
		return b_date;
	}
	public void setB_date(Timestamp b_date) {
		this.b_date = b_date;
	}
	
	
}