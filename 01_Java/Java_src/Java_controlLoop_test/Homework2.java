package com.lec.loop;
// 주사위를 던져서 두 수의 합이 6이 되는 경우를 출력
public class Homework2 {
	public static void main(String[] args) {
		for(int i=1; i<=6 ; i++) {
			for(int j=1; j<=6 ; j++) {
				if (i+j==6) {
					System.out.printf(i+"+"+j+"=6\t");
				}
			}
		}
	}
}
