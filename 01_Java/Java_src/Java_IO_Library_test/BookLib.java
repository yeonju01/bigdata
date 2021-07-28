package com.lect.ex5_lib;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Scanner;

// new Book("890ㄱ-01","java","홍길동");
public class BookLib implements ILendable {
	private String bookNo;
	private String bookTitle;
	private String writer;
	private String borrower;
	private Date checkOutDate;
	private byte state;	//대출상태(0(STATE_NORMAL):대출가능, 1(STATE_BORROWD):대출중)
	public BookLib(String bookNo, String bookTitle, String writer) {
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.writer = writer;
	}
//	Date thatDay = new Date(new GregorianCalendar(2020, 11, 16).getTimeInMillis());
	@Override
	public void checkOut(String borrower) throws Exception{
		if(state!=STATE_NORMAL) {
			throw new Exception("대출중인 도서입니다");
		}
		//대출처리 로직
		this.borrower = borrower;
		this.checkOutDate = new Date();
		state = STATE_BORROWED;
		// 대출완성 후 메세지 : "베개" 도서가 대출되었습니다
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일(E)");
		System.out.println("\""+bookTitle+"\"이(가) ★대출★되었습니다\n[대출인] "+borrower+"\n[대출일]"+sdf.format(checkOutDate.getTime()));
	}
	@Override
	public void checkIn() throws Exception{
		if(state!=STATE_BORROWED) {
			throw new Exception(bookTitle+"은 대출중이 아닙니다. 오류입니다");
		}
		//반납처리 로직
		//시스템으로부터 현재 시점~checkOutDate까지의 시간 14일을 넘기지 않았는지 체크
		Date now = new Date();
		long diff = now.getTime() - checkOutDate.getTime();
		long day = diff/ (1000*60*60*24);
		if(day>14) {
			System.out.println("연체료 일일 100원 부가합니다");
			long money = (day-14)*100;
			System.out.println("내셔야 할 연체료는 "+money+"원");
			Scanner sc = new Scanner(System.in);
			System.out.println("연체료를 내셨나요(Y/N)? ");
			if(!sc.next().equalsIgnoreCase("y")) {
				System.out.println("연체료를 내셔야 반납처리됩니다");
				return;
			} // Scanner닫으면 메인함수에서 사용불가하므로 닫지않음
		}
		borrower = null;
		checkOutDate = null;
		state = STATE_NORMAL;
//		System.out.println("\""+bookTitle+"\"도서가 반납되었습니다");
	}
	@Override
	public String toString() {
		String result = String.format("'%s(%s)' %s著 ", bookTitle, bookNo, writer);
//		result = state==STATE_NORMAL? "대출가능":"대출중";
		if(state == STATE_NORMAL) {
			result += " 대출가능";
		}else if(state != STATE_NORMAL) {
			SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd E요일");
			result += " 대출("+sdf.format(checkOutDate.getTime())+")중";
		}else {
			result += " 직원문의(이상상태)";
		}
		return result;
	}
	public String getBookNo() {
		return bookNo;
	}
	public void setBookNo(String bookNo) {
		this.bookNo = bookNo;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getBorrower() {
		return borrower;
	}
	public void setBorrower(String borrower) {
		this.borrower = borrower;
	}
	public Date getCheckOutDate() {
		return checkOutDate;
	}
	public void setCheckOutDate(Date checkOutDate) {
		this.checkOutDate = checkOutDate;
	}
	public byte getState() {
		return state;
	}
	public void setState(byte state) {
		this.state = state;
	}
}