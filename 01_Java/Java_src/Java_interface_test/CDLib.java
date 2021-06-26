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
			System.out.println("�������� CD�Դϴ�");
			return;
		}
		this.borrower = borrower;
		this.checkOutDate = checkOutDate;
		state = STATE_BORROWED;
		System.out.println("\""+getCdTitle()+"\"CD�� ����Ǿ����ϴ�");
	}
	@Override
	public void checkIn() {
		if(state!=STATE_BORROWED) {
			System.out.println("�������� CD�� �ƴմϴ�. �̻��մϴ�");
		}else {
			borrower = null;
			checkOutDate = null;
			state = STATE_NORMAL;
			System.out.println("\""+getCdTitle()+"\"CD�� �ݳ��Ǿ����ϴ�");
		}
	}
	@Override
	public String toString() {
		String result = String.format("\"%s\"\t%s\t", getCdTitle(), getCdNo());
		result += (getBookNo()!=null)? getBookNo()+"������ ���� CD\t" : "\t\t";
		if(state == STATE_NORMAL) {
			result += "���Ⱑ��";
		}else if(state != STATE_NORMAL) {
			result += "������";
		}else {
			result += "��������";
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
