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
		Scanner sc = new Scanner(System.in);
		int fn, idx = 0;
		String bTitle, borrower, checkOutDate;
		do {
			System.out.println("1:���� | 2:�ݳ� | 3:������Ȳ | 0:����");
			fn = sc.nextInt();
			switch (fn) {
			case 1:
				System.out.println("������ å ������? ");
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
					System.out.println("��������? ");
					borrower = sc.next();
					System.out.println("��������? ");
					checkOutDate = sc.next();
					books[idx].checkOut(borrower, checkOutDate);
				}
				break;
			case 2:
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
			case 3:
				System.out.println("������Ȳ");
				for(Book book : books) {
					System.out.println(book);
				}
				break;
			default:
				System.out.println("��ȿ���� ���� ��ɹ�ȣ�Դϴ�");
			}
		}while(fn!=0);
		System.out.println("�ȳ���������");
		sc.close();
	}
}
