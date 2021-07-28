package com.lect.ex5_lib;

import java.sql.Date;
import java.util.GregorianCalendar;

public class Test {
	public static void main(String[] args) {
		BookLib book = new BookLib("890¤¡-01","java","È«±æµ¿");
		BookLib book1 = new BookLib("891¤¡-02","hadoop","È«ÇÏµÓ");
		try {
			book.checkOut("kim");
			book1.checkOut("lee");
			book.setCheckOutDate(new Date(
					new GregorianCalendar(2020, 10, 30).getTimeInMillis()));
			book.checkIn();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println(book);
		System.out.println(book1);
	}
}