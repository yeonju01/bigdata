package com.lect.ex09_test;
// 강사
public class Gangsa extends Person {
	public Gangsa(String id, String name, String ban) {
		super(id, name, ban);
	}
	@Override
	public void introBan() {
		System.out.print("(과목)"+super.getBan()+"\n");
	}
}
