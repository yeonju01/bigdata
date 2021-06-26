package com.lec.loop;
// 1부터 20까지 정수 중에서 2와 3의 배수가 아닌 수의 합
public class Homework1 {
	public static void main(String[] args) {
		int tot = 0;
		int i = 0;
		while(++i<=20) {
			if(i%2 !=0 && i%3 !=0) {
				continue;
			}
			tot += i;
		}System.out.printf("1부터 20까지 정수 중에서 2와 3의 배수가 아닌 수의 누적합은 %d이다", i);
		
//		System.out.print("누적합은 %d이다", tot);
	}
}
