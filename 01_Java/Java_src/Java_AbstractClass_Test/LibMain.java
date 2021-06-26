package com.lect.ex11_quiz;

import java.util.Scanner;

import com.lect.ex10_lib.Book;

public class LibMain {
	public static void main(String[] args) {
		Book[] books = { new Book("a01", "java", "신용권"), 
						new Book("a02", "jsp", "아무개"),
						new Book("a03", "Oracle", "홍길동"), 
						new Book("a04", "mySQL", "이마이"),
						new Book("a05", "Servlet", "서블리")
						};
		Scanner sc = new Scanner(System.in);
		int fn, idx = 0;
		String bTitle, borrower, checkOutDate;
		do {
			System.out.println("1:대출 | 2:반납 | 3:도서현황 | 0:종료");
			fn = sc.nextInt();
			switch (fn) {
			case 1:
				System.out.println("대출할 책 제목은? ");
				bTitle = sc.next();
				for(idx=0 ; idx<books.length ; idx++) {
					if(books[idx].getBookTitle().equals(bTitle)) {
						break;
					}
				}
				if(idx==books.length) {
					System.out.println("본 도서관에는 해당도서가 없습니다. 죄송합니다");
				}else if(books[idx].getState()==ILendable.STATE_BORROWED) {
					System.out.println(bTitle+" 도서는 대출중입니다");
				}else {
					System.out.println("대출인은? ");
					borrower = sc.next();
					System.out.println("대출일은? ");
					checkOutDate = sc.next();
					books[idx].checkOut(borrower, checkOutDate);
				}
				break;
			case 2:
				System.out.println("반납할 책 제목은? ");
				bTitle = sc.next();
				for(idx=0 ; idx<books.length ; idx++) {
					if(books[idx].getBookTitle().equals(bTitle)) {
						break;
					}
				}
				if(idx==books.length) {
					System.out.println("해당 도서는 본 도서관의 책이 아닙니다");
				}else {
					books[idx].checkIn();
				}
				break;
			case 3:
				System.out.println("도서현황");
				for(Book book : books) {
					System.out.println(book);
				}
				break;
			default:
				System.out.println("유효하지 않은 기능번호입니다");
			}
		}while(fn!=0);
		System.out.println("안녕히가세요");
		sc.close();
	}
}
