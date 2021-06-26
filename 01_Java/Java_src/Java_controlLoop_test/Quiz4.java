package com.lec.loop;
// 구구단 출력
public class Quiz4 {
	public static void main(String[] args) {
		for(int i=1 ; i<10 ; i++) {
			for(int dansu=2 ; dansu<10 ; dansu++) {
				System.out.printf("%d * %d = %d\t", dansu, i, dansu*i);
			}//for-i
		System.out.println();//개행			
		}//for-j
	}//main
}//class
