package com.lect.ex11_quiz;

public class CDLib extends CDInfo implements ILendable {
	private String borrower;
	private String checkOutDate;
	private byte state;
	public CDLib(String cdNo, String cdTitle, String bookNo) {
		super(cdNo, cdTitle, bookNo);
		this.borrower = null;
		this.checkOutDate = null;
		this.state = STATE_NORMAL;
	}
	@Override
	public void checkOut(String borrower, String checkOutData) {
		if(state!=STATE_NORMAL) {
			System.out.println("대출중인 CD입니다");
			return;
		}
		this.borrower = borrower;
		this.checkOutDate = checkOutDate;
		state = STATE_BORROWED;
		System.out.println("\""+getCdTitle()+"\"CD가 대출되었습니다");
	}
	@Override
	public void checkIn() {
		if(state!=STATE_BORROWED) {
			System.out.println("대출중인 CD가 아닙니다. 이상합니다");
		}else {
			borrower = null;
			checkOutDate = null;
			state = STATE_NORMAL;
			System.out.println("\""+getCdTitle()+"\"CD가 반납되었습니다");
		}
	}
	@Override
	public String toString() {
		String result = String.format("\"%s\"\t%s\t", getCdTitle(), getCdNo());
		result += (getBookNo()!=null)? getBookNo()+"도서에 딸린 CD\t" : "\t\t";
		if(state == STATE_NORMAL) {
			result += "대출가능";
		}else if(state != STATE_NORMAL) {
			result += "대출중";
		}else {
			result += "직원문의";
		}
		return result;
	}
	public String getBorrower() {
		return borrower;
	}
	public String getCheckOutDate() {
		return checkOutDate;
	}
	public byte getState() {
		return state;
	}
}
