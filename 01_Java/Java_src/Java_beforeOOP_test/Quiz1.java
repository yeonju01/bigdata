package com.lec.ex;

import java.util.Scanner;

// ������ �� �Է¹޾� �ش� ������ ���
public class Quiz1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int su;
		System.out.print("������ ���� �Է��ϼ��� :");
		do {
			su = sc.nextInt();
			if(su<=9&&su>=2) break;
			System.out.print("2~9������ ���� �Է��ϼž� �մϴ�");
		}while(true);
		factorial(su);
	}
	private static void factorial(int su) {
		int fact = 1;
		for(int i=1 ; i<10 ; i++) {
			System.out.println(su+"*"+i+"="+su*i);
		}
	}
}
