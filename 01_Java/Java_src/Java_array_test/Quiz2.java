package com.lec.ex;
// 2차원 배열에 저장된 값의 합계를 구하시오
public class Quiz2 {
	public static void main(String[] args) {
		int[][] arr = {{5, 5, 5, 5, 5},
						{10, 10, 10, 10, 10},
						{20, 20, 20, 20, 20},
						{30, 30, 30, 30, 30}};
		int sum = 0;
		for(int i = 0 ; i<arr.length ; i++) {
			for(int j = 0 ; j<arr[i].length ; j++) {
				sum += arr[i][j];
			}//for
		}//for
		System.out.printf("배열에 담긴 값의 총 합은 %d입니다.", sum);
	}
}
