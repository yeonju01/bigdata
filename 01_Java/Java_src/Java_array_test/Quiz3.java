package com.lec.ex;
// 76,45,34,89,100,50,90,92  8개의 값을 1차원 배열로 초기화 하고 
// 값에 합계와  평균 그리고 최대값과 최소값을 구하는 프로그램을 작성 하시요.
public class Quiz3 {
	public static void main(String[] args) {
		int[] arr = {76, 45, 34, 89, 100, 50, 90, 92};
		int sum=0, avg=0,max=0,min=999;
		for(int i=0 ; i<arr.length ; i++) {
			sum += arr[i];
			if(arr[i]>max) max = arr[i];
			if(arr[i]<min) min = arr[i];
		}
		avg = sum/arr.length;
		System.out.printf("합계=%d\t 평균=%d\n", sum, avg);
		System.out.printf("최대값=%d\t 최소값=%d\n", max, min);
	}
}
