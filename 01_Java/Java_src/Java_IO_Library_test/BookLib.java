package com.lect.ex5_lib;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Scanner;

// new Book("890��-01","java","ȫ�浿");
public class BookLib implements ILendable {
	private String bookNo;
	private String bookTitle;
	private String writer;
	private String borrower;
	private Date checkOutDate;
	private byte state;	//�������(0(STATE_NORMAL):���Ⱑ��, 1(STATE_BORROWD):������)
	public BookLib(String bookNo, String bookTitle, String writer) {
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.writer = writer;
	}
//	Date thatDay = new Date(new GregorianCalendar(2020, 11, 16).getTimeInMillis());
	@Override
	public void checkOut(String borrower) throws Exception{
		if(state!=STATE_NORMAL) {
			throw new Exception("�������� �����Դϴ�");
		}
		//����ó�� ����
		this.borrower = borrower;
		this.checkOutDate = new Date();
		state = STATE_BORROWED;
		// ����ϼ� �� �޼��� : "����" ������ ����Ǿ����ϴ�
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy�� MM�� dd��(E)");
		System.out.println("\""+bookTitle+"\"��(��) �ڴ���ڵǾ����ϴ�\n[������] "+borrower+"\n[������]"+sdf.format(checkOutDate.getTime()));
	}
	@Override
	public void checkIn() throws Exception{
		if(state!=STATE_BORROWED) {
			throw new Exception(bookTitle+"�� �������� �ƴմϴ�. �����Դϴ�");
		}
		//�ݳ�ó�� ����
		//�ý������κ��� ���� ����~checkOutDate������ �ð� 14���� �ѱ��� �ʾҴ��� üũ
		Date now = new Date();
		long diff = now.getTime() - checkOutDate.getTime();
		long day = diff/ (1000*60*60*24);
		if(day>14) {
			System.out.println("��ü�� ���� 100�� �ΰ��մϴ�");
			long money = (day-14)*100;
			System.out.println("���ž� �� ��ü��� "+money+"��");
			Scanner sc = new Scanner(System.in);
			System.out.println("��ü�Ḧ ���̳���(Y/N)? ");
			if(!sc.next().equalsIgnoreCase("y")) {
				System.out.println("��ü�Ḧ ���ž� �ݳ�ó���˴ϴ�");
				return;
			} // Scanner������ �����Լ����� ���Ұ��ϹǷ� ��������
		}
		borrower = null;
		checkOutDate = null;
		state = STATE_NORMAL;
//		System.out.println("\""+bookTitle+"\"������ �ݳ��Ǿ����ϴ�");
	}
	@Override
	public String toString() {
		String result = String.format("'%s(%s)' %s�� ", bookTitle, bookNo, writer);
//		result = state==STATE_NORMAL? "���Ⱑ��":"������";
		if(state == STATE_NORMAL) {
			result += " ���Ⱑ��";
		}else if(state != STATE_NORMAL) {
			SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd E����");
			result += " ����("+sdf.format(checkOutDate.getTime())+")��";
		}else {
			result += " ��������(�̻����)";
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