package com.study.nbnb.dto;

import java.sql.Timestamp;

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
	private String BBANG;
	private String S_COMMENT;
	private Timestamp S_DATE;
	public int getM_NUMBER() {
		return M_NUMBER;
	}
	public void setM_NUMBER(int m_NUMBER) {
		M_NUMBER = m_NUMBER;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
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
	public String getBBANG() {
		return BBANG;
	}
	public void setBBANG(String bBANG) {
		BBANG = bBANG;
	}
	public String getS_COMMENT() {
		return S_COMMENT;
	}
	public void setS_COMMENT(String s_COMMENT) {
		S_COMMENT = s_COMMENT;
	}
	public Timestamp getS_DATE() {
		return S_DATE;
	}
	public void setS_DATE(Timestamp s_DATE) {
		S_DATE = s_DATE;
	}
	
	
	
}
