package com.lec.loop;
// 1���� 20���� ���� �߿��� 2�� 3�� ����� �ƴ� ���� ��
public class Homework1 {
	public static void main(String[] args) {
		int tot = 0;
		int i = 0;
		while(++i<=20) {
			if(i%2 !=0 && i%3 !=0) {
				continue;
			}
			tot += i;
		}System.out.printf("1���� 20���� ���� �߿��� 2�� 3�� ����� �ƴ� ���� �������� %d�̴�", i);
		
//		System.out.print("�������� %d�̴�", tot);
	}
}
