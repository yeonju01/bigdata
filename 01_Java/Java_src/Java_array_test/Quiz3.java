package com.lec.ex;
// 76,45,34,89,100,50,90,92  8���� ���� 1���� �迭�� �ʱ�ȭ �ϰ� 
// ���� �հ��  ��� �׸��� �ִ밪�� �ּҰ��� ���ϴ� ���α׷��� �ۼ� �Ͻÿ�.
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
		System.out.printf("�հ�=%d\t ���=%d\n", sum, avg);
		System.out.printf("�ִ밪=%d\t �ּҰ�=%d\n", max, min);
	}
}
