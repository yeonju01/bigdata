package com.lec.loop;

import java.util.Scanner;

// ����ڷκ��� ���ϴ� �����ܼ��� �Է¹޾� �ش� �������� ����غ���
public class Quiz3 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("�����ܼ��� �Է��ϼ��� ->");
		int dansu= scanner.nextInt();
		for(int i=1 ; i<10 ; i++) {
			System.out.printf("%d * %d = %d\t", dansu, i, dansu*i);
		}
		scanner.close();
	}
}
