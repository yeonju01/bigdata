package com.lec.loop;

import java.util.Scanner;

// 사용자로부터 원하는 구구단수를 입력받아 해당 구구단을 출력해보자
public class Quiz3 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("구구단수를 입력하세요 ->");
		int dansu= scanner.nextInt();
		for(int i=1 ; i<10 ; i++) {
			System.out.printf("%d * %d = %d\t", dansu, i, dansu*i);
		}
		scanner.close();
	}
}
