package com.lec.quiz;

import java.util.Scanner;

//두수를 입력받아 두 수가 같은지 결과를 O나 X로 출력.첫번째 수가 더 큰지 결과를 O나 X로 출력한다.
public class Quiz3 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("수를 입력하세요 :");
		int n1 = scanner.nextInt();
		int n2 = scanner.nextInt();
		String result = (n1 == n2)? "O":"X";
		System.out.println("결과= "+result);
		scanner.close();
	}
}
