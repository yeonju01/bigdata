package com.lec.ex;

import java.util.Scanner;

// 구구단 수 입력받아 해당 구구단 출력
public class Quiz1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int su;
		System.out.print("구구단 수를 입력하세요 :");
		do {
			su = sc.nextInt();
			if(su<=9&&su>=2) break;
			System.out.print("2~9사이의 수를 입력하셔야 합니다");
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
