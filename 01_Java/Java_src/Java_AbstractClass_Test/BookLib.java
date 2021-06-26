package com.lect.ex11_quiz;

import com.lect.ex10_lib.ILendable;

public class BookLib extends Bookinfo implements ILendable {
	private String borrower;
	private String checkOutDate;
	private byte state;
	public BookLib(String bookNo, String bookTitle, String writer) {
		super(bookNo, bookTitle, writer);
	}
	@Override
	public void checkOut(String borrower, String checkOutData) {
		if(state!=STATE_NORMAL) {
			System.out.println("�������� �����Դϴ�");
			return;
		}
		this.borrower = borrower;
		this.checkOutDate = checkOutDate;
		state = STATE_BORROWED;
		System.out.println("\""+getBookTitle()+"\"������ ����Ǿ����ϴ�");
	}
	@Override
	public void checkIn() {
		if(state!=STATE_BORROWED) {
			System.out.println("�������� ������ �ƴմϴ�. �̻��մϴ�");
			return;
		}else {
			borrower = null;
			checkOutDate = null;
			state = STATE_NORMAL;
			System.out.println("\""+getBookTitle()+"\"������ �ݳ��Ǿ����ϴ�");
		}
	}
	@Override
	public String toString() {
		String result = String.format("%s, %s��", getBookTitle(), getWriter());
		if(state == STATE_NORMAL) {
			result += "���Ⱑ��";
		}else if(state != STATE_NORMAL) {
			result += "������";
		}else {
			result += "��������";
		}
		return result;
	}
}
