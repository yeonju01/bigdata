package com.lec.quiz;

import java.util.Scanner;

// ����ڷκ��� �Է¹��� ���� 3�ǹ������ ���� ���
public class Quiz1 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("������ �Է��ϼ��� :");
		int su = scanner.nextInt(); // Ű����κ��� �Է¹��� ������ ��ȯ�޴� �Լ�
		String result = (su % 3 == 0)? "3�� ����Դϴ�":"3�� ����� �ƴմϴ�";
		System.out.println("�Է��Ͻ� ���� "+result);
		scanner.close();
	}
}
