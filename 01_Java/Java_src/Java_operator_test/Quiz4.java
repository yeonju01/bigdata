package com.lec.quiz;

import java.util.Scanner;

// ���̸� �Է¹޾� �Է¹��� ���̰� 65�� �̻��� ��, ����ο�롱 ���, �ƴϸ� ���Ϲݡ����
public class Quiz4 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("���� �Է��ϼ��� :");
		int su = scanner.nextInt();
		String result = (su >= 65)? "��ο��":"�Ϲ�";
		System.out.println(result);
		scanner.close();
	}
}
