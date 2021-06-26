package com.lect.ex11_quiz;

public class CDInfo {
	private String cdNo;
	private String cdTitle;
	private String bookNo;
	public CDInfo(String cdNo, String cdTitle, String bookNo) {
		this.cdNo = cdNo;
		this.cdTitle = cdTitle;
		this.bookNo = bookNo;
	}
	public String getCdNo() {
		return cdNo;
	}
	public void setCdNO(String cdNO) {
		this.cdNo = cdNo;
	}
	public String getCdTitle() {
		return cdTitle;
	}
	public void setCdTitle(String cdTitle) {
		this.cdTitle = cdTitle;
	}
	public String getBookNo() {
		return bookNo;
	}
	public void setBookNo(String bookNo) {
		this.bookNo = bookNo;
	}
}
