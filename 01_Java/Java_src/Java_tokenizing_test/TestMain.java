package com.lect.ex01_string;

import java.util.Scanner;

public class TestMain {
	public static void main(String[] args) {
		Friend[] friends = {new Friend("홍길동", "010-9999-1234", "05-24")
							};
		Scanner sc = new Scanner(System.in);
		boolean searchOk = false;
		do {
			System.out.println("검색할 전화번호 뒷자리는?(단, 종료를 원하시면 x를 입력하시오)");
			String searchTel = sc.next();
			if(searchTel.equalsIgnoreCase("x")) {
				break;
			}
			searchOk = false;
			for(int idx=0; idx<friends.length ; idx++) {
				String phone = friends[idx].getPhone().substring(friends[idx].getPhone().lastIndexOf("-") + 1);
				if(searchTel.equals(phone)) {
					System.out.println(friends[idx]);
					searchOk = true;
				}
			}
			if(!searchOk) {
				System.out.println("해당 번호의 친구는 없습니다");
			}
		}while(true);
		sc.close();
	}
}
