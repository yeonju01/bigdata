package com.lec.quiz;

import java.util.Scanner;

// 입력한 수가 짝수인지 홀수인지 출력
public class Quiz2 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("수를 입력하세요 :");
		int su = scanner.nextInt();
		String result = (su % 2 == 0)? "짝수입니다":"홀수입니다";
		System.out.println("결과= "+result);
		scanner.close();
	}
}
