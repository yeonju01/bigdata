package com.lect.ex09_test;
// 직원
public class Staff extends Person {
	public Staff(String id, String name, String ban) {
		super(id, name, ban);
	}
	@Override
	public void introBan() {
		System.out.print("(부서)"+super.getBan()+"\n");
	}
}
