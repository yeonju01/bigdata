package com.lec.quiz;

import java.util.Scanner;

//�μ��� �Է¹޾� �� ���� ������ ����� O�� X�� ���.ù��° ���� �� ū�� ����� O�� X�� ����Ѵ�.
public class Quiz3 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("���� �Է��ϼ��� :");
		int n1 = scanner.nextInt();
		int n2 = scanner.nextInt();
		String result = (n1 == n2)? "O":"X";
		System.out.println("���= "+result);
		scanner.close();
	}
}
