package com.lec.loop;
// 1~10���� ���� �� ¦�� �Ǵ� Ȧ���� ���� ���غ���
public class Quiz2 {
	public static void main(String[] args) {
		int tot = 0;
		for(int i=1 ; i<11 ; i++) {
			if(i%2==0) {
				continue;
			}//if
			tot += i;
			System.out.println("Ȧ��������"+tot);
		}//for
	}//main
}//class
