package com.kubg.domain;

import java.sql.Date;

public class ReplyVO {
	
	private int gdsNum;
	private String userId;
	private int repNum;
	private String reCon;
	private Date repDate;
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getRepNum() {
		return repNum;
	}
	public void setRepNum(int repNum) {
		this.repNum = repNum;
	}
	public String getReCon() {
		return reCon;
	}
	public void setReCon(String reCon) {
		this.reCon = reCon;
	}
	public Date getRepDate() {
		return repDate;
	}
	public void setRepDate(Date repDate) {
		this.repDate = repDate;
	}
	
	
}
