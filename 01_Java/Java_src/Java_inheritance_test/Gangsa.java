package com.lect.ex09_test;
// ����
public class Gangsa extends Person {
	public Gangsa(String id, String name, String ban) {
		super(id, name, ban);
	}
	@Override
	public void introBan() {
		System.out.print("(����)"+super.getBan()+"\n");
	}
}
