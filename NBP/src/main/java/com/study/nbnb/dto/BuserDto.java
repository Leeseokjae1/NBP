package com.study.nbnb.dto;

import java.security.Timestamp;

public class BuserDto {
	private int M_NUMBER;
	private String NAME;
	private String ID;
	private String PASSWORD;
	private String ADDRESS;
	private String EMAIL;
	private String PHONENUMBER;
	private String NICKNAME;
	private int TICKET;
	private int BBANG;
	private int REJECT;
	private Timestamp RJDATE;
	private int ADMIN;
	
	public int getM_NUMBER() {
		return M_NUMBER;
	}
	public void setM_NUMBER(int m_NUMBER) {
		M_NUMBER = m_NUMBER;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String bNAME) {
		NAME = bNAME;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getPASSWORD() {
		return PASSWORD;
	}
	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}
	public String getADDRESS() {
		return ADDRESS;
	}
	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getPHONENUMBER() {
		return PHONENUMBER;
	}
	public void setPHONENUMBER(String pHONENUMBER) {
		PHONENUMBER = pHONENUMBER;
	}
	public String getNICKNAME() {
		return NICKNAME;
	}
	public void setNICKNAME(String nICKNAME) {
		NICKNAME = nICKNAME;
	}
	public int getTICKET() {
		return TICKET;
	}
	public void setTICKET(int tICKET) {
		TICKET = tICKET;
	}
	public int getBBANG() {
		return BBANG;
	}
	public void setBBANG(int bBANG) {
		BBANG = bBANG;
	}
	public int getREJECT() {
		return REJECT;
	}
	public void setREJECT(int rEJECT) {
		REJECT = rEJECT;
	}
	public Timestamp getRJDATE() {
		return RJDATE;
	}
	public void setRJDATE(Timestamp rJDATE) {
		RJDATE = rJDATE;
	}
	public int getADMIN() {
		return ADMIN;
	}
	public void setADMIN(int aDMIN) {
		ADMIN = aDMIN;
	}
}
