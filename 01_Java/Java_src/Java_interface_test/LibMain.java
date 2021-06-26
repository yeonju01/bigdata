package com.lect.ex11_quiz;

import java.util.Scanner;

import com.lect.ex10_lib.Book;

public class LibMain {
	public static void main(String[] args) {
		Book[] books = { new Book("a01", "java", "�ſ��"), 
						new Book("a02", "jsp", "�ƹ���"),
						new Book("a03", "Oracle", "ȫ�浿"), 
						new Book("a04", "mySQL", "�̸���"),
						new Book("a05", "Servlet", "����")
						};
		CDLib[] cds = { new CDLib("c01", "java_cd", "a01"), 
						new CDLib("c02", "ITtrend", null),
						new CDLib("c03", "jsp", "a02") 
						};
		Scanner sc = new Scanner(System.in);
		int fn, idx;
		String cTitle, bTitle, borrower, checkOutDate;
		do {
			System.out.println("1:å���� | 2:CD���� | 3:å�ݳ� | 4:CD�ݳ� | 5:������CD��Ȳ | 0:����");
			fn = sc.nextInt();
			switch (fn) {
			case 1:
				System.out.print("������ å ������? ");
				bTitle = sc.next();
				for(idx=0 ; idx<books.length ; idx++) {
					if(books[idx].getBookTitle().equals(bTitle)) {
						break;
					}
				}
				if(idx==books.length) {
					System.out.println("�� ���������� �ش絵���� �����ϴ�. �˼��մϴ�");
				}else if(books[idx].getState()==ILendable.STATE_BORROWED) {
					System.out.println(bTitle+" ������ �������Դϴ�");
				}else {
					System.out.print("��������? ");
					borrower = sc.next();
					System.out.print("��������? ");
					checkOutDate = sc.next();
					books[idx].checkOut(borrower, checkOutDate);
				}
				break;
			case 2:
				System.out.println("������ CD ������? ");
				cTitle = sc.next();
				for(idx=0 ; idx<cds.length ; idx++) {
					if(cds[idx].getCdTitle().equals(cTitle)) {
						break;
					}
				}
				if(idx==cds.length) {
					System.out.println("�� ���������� CD�� �����ϴ�. �˼��մϴ�");
				}else if(books[idx].getState()==ILendable.STATE_BORROWED) {
					System.out.println(cTitle+" CD�� �������Դϴ�");
				}else {
					System.out.println("��������? ");
					borrower = sc.next();
					System.out.println("��������? ");
					checkOutDate = sc.next();
					cds[idx].checkOut(borrower, checkOutDate);
				}
				break;
			case 3:
				System.out.println("�ݳ��� å ������? ");
				bTitle = sc.next();
				for(idx=0 ; idx<books.length ; idx++) {
					if(books[idx].getBookTitle().equals(bTitle)) {
						break;
					}
				}
				if(idx==books.length) {
					System.out.println("�ش� ������ �� �������� å�� �ƴմϴ�");
				}else {
					books[idx].checkIn();
				}
				break;
			case 4:
				System.out.println("�ݳ��� CD ������? ");
				cTitle = sc.next();
				for(idx=0 ; idx<cds.length ; idx++) {
					if(cds[idx].getCdTitle().equals(cTitle)) {
						break;
					}
				}
				if(idx==cds.length) {
					System.out.println("�ش� CD�� �� �������� CD�� �ƴմϴ�");
				}else {
					cds[idx].checkIn();
				}
				break;
			}
		}while(fn!=0);
		System.out.println("�ȳ���������");
		// books �� cds �迭�� ���¸� ���
		sc.close();
	}
}
