package com.lec.quiz;
//국어, 영어, 수학 점수를 변수에 할당하고 각 점수를 출력하고 총점, 평균(소수점2자리까지) 출력하는 프로그램을 구현 하시오
public class Quiz5 {
	public static void main(String[] args) {
		int kor=99, eng=99, mat=100;
		int sum = kor + eng + mat;
		double avg = sum/3.;
		System.out.printf("국어 = %d, 영어= %d, 수학 =%d\n", kor, eng, mat);
		System.out.printf("총점 = %d\n", sum);
		System.out.printf("총점 = %.2f\n", avg);
	}
}

