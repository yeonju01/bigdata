package com.lect.ex09_test;
// ����
public class Staff extends Person {
	public Staff(String id, String name, String ban) {
		super(id, name, ban);
	}
	@Override
	public void introBan() {
		System.out.print("(�μ�)"+super.getBan()+"\n");
	}
}
