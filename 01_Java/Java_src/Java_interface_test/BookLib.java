package com.lect.ex11_quiz;

public class BookLib extends Bookinfo implements ILendable {
	private String borrower;
	private String checkOutDate;
	private byte state;
	public BookLib(String bookNo, String bookTitle, String writer) {
		super(bookNo, bookTitle, writer);
		this.borrower = null;
		this.checkOutDate = null;
		this.state = STATE_NORMAL;
	}
	@Override
	public void checkOut(String borrower, String checkOutDate) {
		if(state!=STATE_NORMAL) {
			System.out.println("대출중인 도서입니다");
			return;
		}
		this.borrower = borrower;
		this.checkOutDate = checkOutDate;
		state = STATE_BORROWED;
		System.out.println("\""+getBookTitle()+"\"도서가 대출되었습니다");
	}
	@Override
	public void checkIn() {
		if(state!=STATE_BORROWED) {
			System.out.println("대출중인 도서가 아닙니다. 이상합니다");
		}else {
			borrower = null;
			checkOutDate = null;
			state = STATE_NORMAL;
			System.out.println("\""+getBookTitle()+"\"도서가 반납되었습니다");
		}
	}
	@Override
	public String toString() {
		String result = String.format("\"%s\"\t%s저", getBookTitle(), getWriter());
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
