package com.lect.ex01_string;

import java.util.Scanner;

public class TestMain {
	public static void main(String[] args) {
		Friend[] friends = {new Friend("ȫ�浿", "010-9999-1234", "05-24")
							};
		Scanner sc = new Scanner(System.in);
		boolean searchOk = false;
		do {
			System.out.println("�˻��� ��ȭ��ȣ ���ڸ���?(��, ���Ḧ ���Ͻø� x�� �Է��Ͻÿ�)");
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
				System.out.println("�ش� ��ȣ�� ģ���� �����ϴ�");
			}
		}while(true);
		sc.close();
	}
}
