package com.lect.ex02_date;

public class TestMain {
	public static void main(String[] args) {
//		Sawon[] sawon = new Sawon{
//						}
		Sawon s1 = new Sawon("a01","ȫ�浿",Part.COMPUTER);
		Sawon s2 = new Sawon("a02","���浿",Part.ACCOUNTING);
		Sawon s3 = new Sawon("c01","�ű浿",Part.PLANNING, 2021,5,1);
		System.out.println(s1);
		System.out.println(s2);
		System.out.println(s3);
	}
}
